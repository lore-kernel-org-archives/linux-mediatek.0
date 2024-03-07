Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A63C54E49
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 09:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cDwewr94viCP0HwMbysx6bAqUHjnkE31vXLiSH3xJjU=; b=MAul4og05ds+U21pZmT3JLWire
	5tE+WnmbQ/PPG2TFPsUFrXtDbp8u2DV0ODrLH9r4i9UFudZQr59FfPnn2kSYOhZmi+LWJx5wHpS7Y
	ZsUmFVoA0Vt1A9+FEB42QOceaVfExJqUNgUmSd2KDfPulskBj3ELFKc/J9yNtTTmRIf2qbMl1M2P9
	04uAFmD+71j8CjXuS1JKqYz86SeYqdLQyZqDhuDcjEsbiXUE7SJE09O7fIHdnxnW4+4/rcu+hLyiz
	2sZEVrHdWyftnCM7iynSQmHbjWGdCBzhTqbYd1pDBLuMKPA0ay4qJ0Lu3EnYIcI98OqPGG1+SKYvI
	wm3zXZHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riALT-00000003vLp-28C8;
	Thu, 07 Mar 2024 09:47:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riALR-00000003vL2-3BDf
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Mar 2024 09:47:23 +0000
X-UUID: aca30ff8dc6711eebe6b57d01cc416d2-20240307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cDwewr94viCP0HwMbysx6bAqUHjnkE31vXLiSH3xJjU=;
	b=cDL8lAj6M1wA/54a5xV24ra5uZN6OGf/24TUlBpS3pCrH446/ALLu1gNluJtiotlj5aOYzGNZ28PPMo+mVN93aGBk94RN8VeY80MZiiOF0ns6074XQj8NEYyA/b2CUWKX2I8Ndt8LWvNzn6Y5nNbTIUHqV880SrAZdyXNIAkoB4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:412ee55b-2fae-439e-9daa-a5a880d0d135,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:ccf63981-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: aca30ff8dc6711eebe6b57d01cc416d2-20240307
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1313063084; Thu, 07 Mar 2024 02:47:13 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 7 Mar 2024 17:46:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 7 Mar 2024 17:46:35 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Leon Yen <leon.yen@mediatek.com>, "Ming
 Yen Hsieh" <MingYen.Hsieh@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921s: fix potential hung tasks during chip recovery
Date: Thu, 7 Mar 2024 17:46:32 +0800
Message-ID: <20240307094632.21638-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.482200-8.000000
X-TMASE-MatchedRID: BF/mp1RsF79X3cGZowF380hEDfw/93BugQP483M95wFh2fnHe1cil3pt
	C95MCcU350LRIq48WpLvKOYqns9K5YdO+dHJdtOqH5YQyOg71ZZUENBIMyKD0Z6fSoF3Lt+MIA6
	D0Tft3i8SOLmgpsr0im5D1dJNZVNGYf4+ATMa0GuHZXNSWjgdU273ma3jsPM2ta3+iMLLdN8glz
	H/IwfDMcIXl3iP70Q4bmFMcyfDfoAoeQN21jrIqUZakoam9+aeMVx/3ZYby7/uxO+ZKScKRqPFj
	JEFr+olwXCBO/GKkVr3FLeZXNZS4KBkcgGnJ4WmW0jeEK7aWWMHt/b3mOdz0U+DGfGDEvNRwOxN
	ZGMpQrh+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.482200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 77BCF30B649236999228776849688CE98C0BA8729BAB87AB2E8F4A171FC22AF32000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_014721_865682_A1A9C92E 
X-CRM114-Status: GOOD (  11.13  )
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

From: Leon Yen <leon.yen@mediatek.com>

During chip recovery (e.g. chip reset), there is a possible situation that
kernel worker reset_work is holding the lock and waiting for kernel thread
stat_worker to be parked, while stat_worker is waiting for the release of
the same lock.
It causes a deadlock resulting in the dumping of hung tasks messages and
possible rebooting of the device.

This patch prevents the execution of stat_worker during the chip recovery.

Signed-off-by: Leon Yen <leon.yen@mediatek.com>
Signed-off-by: Ming Yen Hsieh <MingYen.Hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c      | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c  | 2 --
 drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c | 2 --
 drivers/net/wireless/mediatek/mt76/sdio.c            | 3 ++-
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 867e14f6b93a..73e42ef42983 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -663,6 +663,7 @@ void mt7921_mac_reset_work(struct work_struct *work)
 	int i, ret;
 
 	dev_dbg(dev->mt76.dev, "chip reset\n");
+	set_bit(MT76_RESET, &dev->mphy.state);
 	dev->hw_full_reset = true;
 	ieee80211_stop_queues(hw);
 
@@ -691,6 +692,7 @@ void mt7921_mac_reset_work(struct work_struct *work)
 	}
 
 	dev->hw_full_reset = false;
+	clear_bit(MT76_RESET, &dev->mphy.state);
 	pm->suspended = false;
 	ieee80211_wake_queues(hw);
 	ieee80211_iterate_active_interfaces(hw,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
index c866144ff061..031ba9aaa4e2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
@@ -64,7 +64,6 @@ int mt7921e_mac_reset(struct mt792x_dev *dev)
 	mt76_wr(dev, dev->irq_map->host_irq_enable, 0);
 	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0x0);
 
-	set_bit(MT76_RESET, &dev->mphy.state);
 	set_bit(MT76_MCU_RESET, &dev->mphy.state);
 	wake_up(&dev->mt76.mcu.wait);
 	skb_queue_purge(&dev->mt76.mcu.res_q);
@@ -115,7 +114,6 @@ int mt7921e_mac_reset(struct mt792x_dev *dev)
 
 	err = __mt7921_start(&dev->phy);
 out:
-	clear_bit(MT76_RESET, &dev->mphy.state);
 
 	local_bh_disable();
 	napi_enable(&dev->mt76.tx_napi);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
index 389eb0903807..1f77cf71ca70 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mac.c
@@ -98,7 +98,6 @@ int mt7921s_mac_reset(struct mt792x_dev *dev)
 	mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
 	mt76_txq_schedule_all(&dev->mphy);
 	mt76_worker_disable(&dev->mt76.tx_worker);
-	set_bit(MT76_RESET, &dev->mphy.state);
 	set_bit(MT76_MCU_RESET, &dev->mphy.state);
 	wake_up(&dev->mt76.mcu.wait);
 	skb_queue_purge(&dev->mt76.mcu.res_q);
@@ -135,7 +134,6 @@ int mt7921s_mac_reset(struct mt792x_dev *dev)
 
 	err = __mt7921_start(&dev->phy);
 out:
-	clear_bit(MT76_RESET, &dev->mphy.state);
 
 	mt76_worker_enable(&dev->mt76.tx_worker);
 
diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c b/drivers/net/wireless/mediatek/mt76/sdio.c
index 3e88798df017..a4ed00eebc48 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio.c
@@ -499,7 +499,8 @@ static void mt76s_tx_status_data(struct mt76_worker *worker)
 	dev = container_of(sdio, struct mt76_dev, sdio);
 
 	while (true) {
-		if (test_bit(MT76_REMOVED, &dev->phy.state))
+		if (test_bit(MT76_RESET, &dev->phy.state) ||
+		    test_bit(MT76_REMOVED, &dev->phy.state))
 			break;
 
 		if (!dev->drv->tx_status_data(dev, &update))
-- 
2.18.0


