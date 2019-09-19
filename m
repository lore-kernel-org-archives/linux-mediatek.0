From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: mt76x2e hardware restart
Date: Thu, 19 Sep 2019 23:22:03 +0200
Message-ID: <c6d621759c190f7810d898765115f3b4@natalenko.name>
References: <deaafa7a3e9ea2111ebb5106430849c6@natalenko.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <deaafa7a3e9ea2111ebb5106430849c6@natalenko.name>
Sender: netdev-owner@vger.kernel.org
To: linux-mediatek@lists.infradead.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Stanislaw Gruszka <sgruszka@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, Roy Luo <royluo@google.com>, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 19.09.2019 18:24, Oleksandr Natalenko wrote:
> [  +9,979664] mt76x2e 0000:01:00.0: Firmware Version: 0.0.00
> [  +0,000014] mt76x2e 0000:01:00.0: Build: 1
> [  +0,000010] mt76x2e 0000:01:00.0: Build Time: 201507311614____
> [  +0,018017] mt76x2e 0000:01:00.0: Firmware running!
> [  +0,001101] ieee80211 phy4: Hardware restart was requested

IIUC, this happens due to watchdog. I think the following applies.

Watchdog is started here:

=== mt76x02_util.c
130 void mt76x02_init_device(struct mt76x02_dev *dev)
131 {
...
155         INIT_DELAYED_WORK(&dev->wdt_work, mt76x02_wdt_work);
===

It checks for TX hang here:

=== mt76x02_mmio.c
557 void mt76x02_wdt_work(struct work_struct *work)
558 {
...
562     mt76x02_check_tx_hang(dev);
===

Conditions:

=== mt76x02_mmio.c
530 static void mt76x02_check_tx_hang(struct mt76x02_dev *dev)
531 {
532     if (mt76x02_tx_hang(dev)) {
533         if (++dev->tx_hang_check >= MT_TX_HANG_TH)
534             goto restart;
535     } else {
536         dev->tx_hang_check = 0;
537     }
538
539     if (dev->mcu_timeout)
540         goto restart;
541
542     return;
543
544 restart:
545     mt76x02_watchdog_reset(dev);
===

Actual check:

=== mt76x02_mmio.c
367 static bool mt76x02_tx_hang(struct mt76x02_dev *dev)
368 {
369     u32 dma_idx, prev_dma_idx;
370     struct mt76_queue *q;
371     int i;
372
373     for (i = 0; i < 4; i++) {
374         q = dev->mt76.q_tx[i].q;
375
376         if (!q->queued)
377             continue;
378
379         prev_dma_idx = dev->mt76.tx_dma_idx[i];
380         dma_idx = readl(&q->regs->dma_idx);
381         dev->mt76.tx_dma_idx[i] = dma_idx;
382
383         if (prev_dma_idx == dma_idx)
384             break;
385     }
386
387     return i < 4;
388 }
===

(I don't quite understand what it does here; why 4? does each device 
have 4 queues? maybe, my does not? I guess this is where watchdog is 
triggered, though, because otherwise I'd see mcu_timeout message like 
"MCU message %d (seq %d) timed out\n")

Once it detects TX hang, the reset is triggered:

=== mt76x02_mmio.c
446 static void mt76x02_watchdog_reset(struct mt76x02_dev *dev)
447 {
...
485     if (restart)
486         mt76_mcu_restart(dev);
===

mt76_mcu_restart() is just a define for this series here:

=== mt76.h
555 #define mt76_mcu_restart(dev, ...)  
(dev)->mt76.mcu_ops->mcu_restart(&((dev)->mt76))
===

Actual OP:

=== mt76x2/pci_mcu.c
188 int mt76x2_mcu_init(struct mt76x02_dev *dev)
189 {
190     static const struct mt76_mcu_ops mt76x2_mcu_ops = {
191         .mcu_restart = mt76pci_mcu_restart,
192         .mcu_send_msg = mt76x02_mcu_msg_send,
193     };
===

This triggers loading the firmware:

=== mt76x2/pci_mcu.c
168 static int
169 mt76pci_mcu_restart(struct mt76_dev *mdev)
170 {
...
179     ret = mt76pci_load_firmware(dev);
===

which does the printout I observe:

=== mt76x2/pci_mcu.c
  91 static int
  92 mt76pci_load_firmware(struct mt76x02_dev *dev)
  93 {
...
156     dev_info(dev->mt76.dev, "Firmware running!\n");
===

Too bad it doesn't show the actual watchdog message, IOW, why the reset 
happens. I guess I will have to insert some pr_infos here and there.

Does it make sense? Any ideas why this can happen?

More info on the device during boot:

===
[  +0,333233] mt76x2e 0000:01:00.0: enabling device (0000 -> 0002)
[  +0,000571] mt76x2e 0000:01:00.0: ASIC revision: 76120044
[  +0,017806] mt76x2e 0000:01:00.0: ROM patch build: 20141115060606a
===

-- 
   Oleksandr Natalenko (post-factum)
