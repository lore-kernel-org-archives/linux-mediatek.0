Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55931C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Dec 2022 16:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFWWWBtzvd5+R7y8scdS7RPuxOeGP3TccWBQDKa9jxg=; b=l9FKFD/xdk1E3xyLCheeLYAqW+
	1YkplVsQdz7SARK6P04Mjx856NnFhgwazOjAogDghJ8gEX0ZRHnuyh2KWKgx4VSP7ZOaS13H26G7y
	B8mbhl/XjswxHTJtgvBPxWZFXI4dUjojGSzkUufDStAb0uQQu/hOTf3gtDmCMVChm40qSE/9w3s4p
	XIXR5Gi5di2ZuMEU9A97Ua3PX8Y2P7XV2oCXKWkxM6ZL+s3P/M1deDnlZv9KXORaBaHVufy+tjQGm
	AeYYkhDVQ0XsLwdVtihFC8+BCtzVRkmmL8yhwPU80laPtsT22TpZbtGwCvWXg6EG3PQESJrjHforW
	f7CDpWkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6wNH-002w3v-71; Sun, 18 Dec 2022 16:18:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6wKL-002uPv-PV; Sun, 18 Dec 2022 16:15:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 61F58B80B43;
	Sun, 18 Dec 2022 16:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AF5C433D2;
	Sun, 18 Dec 2022 16:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671380147;
	bh=tH6ZpV0L4UGuIzGbBfIQemffggo8wHMlaWF05gu9Ygk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uasa8E0E+vrLqPUP4ooCXvOouETLtH5ju02CuXX//qnL4NRiFV2s3XrrQeKRvDnkZ
	 Hh3PaKFpAoJe2rs8HUlZd+AI/xWRvVhkBuWoia6trPdtP0RKkkN1K0mg5xYNpw54WH
	 UD9sLS2NcObs5UU1INlCUTljvxISQx+yWI/f3snnQcH1rbvP6rk76jdJdu7HqXilWh
	 flFXObuMmuYGwlQLdpMb/odP6BrmBR8Hf/ZpwMZ9W60tyATLnN1cLf6Ee88cYXsbwm
	 F6PM8dofNw52A9eC6uK3ty8f2R36AJCEYTfOU6XYdOUypNKOHSKIaoLhVt0fnr7Bkk
	 v3vFDxIKTLB2w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Dokyung Song <dokyungs@yonsei.ac.kr>,
	Deren Wu <deren.wu@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 42/46] wifi: mt76: do not run mt76u_status_worker if the device is not running
Date: Sun, 18 Dec 2022 11:12:40 -0500
Message-Id: <20221218161244.930785-42-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218161244.930785-1-sashal@kernel.org>
References: <20221218161244.930785-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221218_081551_025392_E9CE6DCE 
X-CRM114-Status: GOOD (  13.82  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lorenzo Bianconi <lorenzo@kernel.org>

[ Upstream commit bd5dac7ced5a7c9faa4dc468ac9560c3256df845 ]

Fix the following NULL pointer dereference avoiding to run
mt76u_status_worker thread if the device is not running yet.

KASAN: null-ptr-deref in range
[0x0000000000000000-0x0000000000000007]
CPU: 0 PID: 98 Comm: kworker/u2:2 Not tainted 5.14.0+ #78 Hardware
name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
rel-1.12.1-0-ga5cab58e9a3f-prebuilt.qemu.org 04/01/2014
Workqueue: mt76 mt76u_tx_status_data
RIP: 0010:mt76x02_mac_fill_tx_status.isra.0+0x82c/0x9e0
Code: c5 48 b8 00 00 00 00 00 fc ff df 80 3c 02 00 0f 85 94 01 00 00
48 b8 00 00 00 00 00 fc ff df 4d 8b 34 24 4c 89 f2 48 c1 ea 03 <0f>
b6
04 02 84 c0 74 08 3c 03 0f 8e 89 01 00 00 41 8b 16 41 0f b7
RSP: 0018:ffffc900005af988 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffffc900005afae8 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff832fc661 RDI: ffffc900005afc2a
RBP: ffffc900005afae0 R08: 0000000000000001 R09: fffff520000b5f3c
R10: 0000000000000003 R11: fffff520000b5f3b R12: ffff88810b6132d8
R13: 000000000000ffff R14: 0000000000000000 R15: ffffc900005afc28
FS:  0000000000000000(0000) GS:ffff88811aa00000(0000)
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa0eda6a000 CR3: 0000000118f17000 CR4: 0000000000750ef0
PKRU: 55555554
Call Trace:
 mt76x02_send_tx_status+0x1d2/0xeb0
 mt76x02_tx_status_data+0x8e/0xd0
 mt76u_tx_status_data+0xe1/0x240
 process_one_work+0x92b/0x1460
 worker_thread+0x95/0xe00
 kthread+0x3a1/0x480
 ret_from_fork+0x1f/0x30
Modules linked in:
--[ end trace 8df5d20fc5040f65 ]--
RIP: 0010:mt76x02_mac_fill_tx_status.isra.0+0x82c/0x9e0
Code: c5 48 b8 00 00 00 00 00 fc ff df 80 3c 02 00 0f 85 94 01 00 00
48 b8 00 00 00 00 00 fc ff df 4d 8b 34 24 4c 89 f2 48 c1 ea 03 <0f>
b6
04 02 84 c0 74 08 3c 03 0f 8e 89 01 00 00 41 8b 16 41 0f b7
RSP: 0018:ffffc900005af988 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffffc900005afae8 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff832fc661 RDI: ffffc900005afc2a
RBP: ffffc900005afae0 R08: 0000000000000001 R09: fffff520000b5f3c
R10: 0000000000000003 R11: fffff520000b5f3b R12: ffff88810b6132d8
R13: 000000000000ffff R14: 0000000000000000 R15: ffffc900005afc28
FS:  0000000000000000(0000) GS:ffff88811aa00000(0000)
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa0eda6a000 CR3: 0000000118f17000 CR4: 0000000000750ef0
PKRU: 55555554

Moreover move stat_work schedule out of the for loop.

Reported-by: Dokyung Song <dokyungs@yonsei.ac.kr>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/usb.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 1e9f60bb811a..b47343e321b8 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -814,6 +814,9 @@ static void mt76u_status_worker(struct mt76_worker *w)
 	struct mt76_queue *q;
 	int i;
 
+	if (!test_bit(MT76_STATE_RUNNING, &dev->phy.state))
+		return;
+
 	for (i = 0; i < IEEE80211_NUM_ACS; i++) {
 		q = dev->phy.q_tx[i];
 		if (!q)
@@ -833,11 +836,11 @@ static void mt76u_status_worker(struct mt76_worker *w)
 			wake_up(&dev->tx_wait);
 
 		mt76_worker_schedule(&dev->tx_worker);
-
-		if (dev->drv->tx_status_data &&
-		    !test_and_set_bit(MT76_READING_STATS, &dev->phy.state))
-			queue_work(dev->wq, &dev->usb.stat_work);
 	}
+
+	if (dev->drv->tx_status_data &&
+	    !test_and_set_bit(MT76_READING_STATS, &dev->phy.state))
+		queue_work(dev->wq, &dev->usb.stat_work);
 }
 
 static void mt76u_tx_status_data(struct work_struct *work)
-- 
2.35.1


