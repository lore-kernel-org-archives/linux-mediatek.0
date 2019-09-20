From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: mt76x2e hardware restart
Date: Fri, 20 Sep 2019 08:07:36 +0200
Message-ID: <9d581001e2e6cece418329842b2b0959@natalenko.name>
References: <deaafa7a3e9ea2111ebb5106430849c6@natalenko.name>
 <c6d621759c190f7810d898765115f3b4@natalenko.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c6d621759c190f7810d898765115f3b4@natalenko.name>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mediatek@lists.infradead.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Stanislaw Gruszka <sgruszka@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, Roy Luo <royluo@google.com>, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 19.09.2019 23:22, Oleksandr Natalenko wrote:
> It checks for TX hang here:
> 
> === mt76x02_mmio.c
> 557 void mt76x02_wdt_work(struct work_struct *work)
> 558 {
> ...
> 562     mt76x02_check_tx_hang(dev);
> ===

I've commented out the watchdog here ^^, and the card is not resetted 
any more, but similarly it stops working shortly after the first client 
connects. So, indeed, it must be some hang in the HW, and wdt seems to 
do a correct job.

Is it even debuggable/fixable from the driver?

-- 
   Oleksandr Natalenko (post-factum)
