Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A7FC3DA79
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 02:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rs5pQYtsKDPVyUyAZq52hdzZEfSXXLZ+MVuujaBw8OU=; b=dJ/WfvLe3nm4ZzbNSVqMSL5GL8
	EYNUg6jfftvCSs+3Zo4Sp5/opdeZgCCnKSQcuMHKksbeGp1XAsKVBsJyPktcqulfjjIkneRZGR2Lz
	XoExXx5siau0QU0uaZWNrRAhSnSrxeN7RsFdf9vtN3OXtkOTOXdvQP0rgf5e5P9mCnrP7qMnH26lk
	t8kH+RZ6GhdB08u77W0V0J7Dog4ayTDrU53nzY1FUhlzCKPAnI1xus73xzKn63R0vtXiNOWs7ka0Z
	yUMY2aGRn5zLXNBj6PpUalNS0yMtRgAU9RMzpS3kpc8jkTmmt40GVAQSyHUBTyeMwolUXNvD0aUC5
	klqNWngw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPZWP-00AphW-1l;
	Tue, 16 Jan 2024 02:49:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPZWN-00Apgo-0z
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jan 2024 02:49:48 +0000
X-UUID: e6a76f26b41911eeafd70d0b34820190-20240115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rs5pQYtsKDPVyUyAZq52hdzZEfSXXLZ+MVuujaBw8OU=;
	b=j38GZNfmS9goJtb0CezpnXcNl2xuqLX4ctmFAqHQ8wX8ZPK+vmTz9sAP/5UAQCd12fkTRq/t4MPaMICsm7dVKCy9HIuv7AzF/h/6yaREjZFg7AC7b4HEQVooeb2BtrhtnnyoM9RD8S64i4bLIvVWL8/m/aZu+avpZHXEhYsAOlA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:1d1d3d51-bce4-48b4-af2f-20ea7e4c83e9,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:aa24637f-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e6a76f26b41911eeafd70d0b34820190-20240115
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 308449993; Mon, 15 Jan 2024 19:49:43 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 16 Jan 2024 10:49:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 16 Jan 2024 10:49:08 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>, Leon Yen <leon.yen@mediatek.com>
Subject: [PATCH v2 4/4] wifi: mt76: mt7921: fix the unfinished command of regd_notifier before suspend
Date: Tue, 16 Jan 2024 10:48:57 +0800
Message-ID: <20240116024857.9071-5-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240116024857.9071-1-mingyen.hsieh@mediatek.com>
References: <20240116024857.9071-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_184947_350139_F369EC9F 
X-CRM114-Status: GOOD (  10.59  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Before entering suspend, we need to ensure that all MCU command are
completed. In some cases, such as with regd_notifier, there is a
chance that CLC commands, will be executed before suspend.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Leon Yen <leon.yen@mediatek.com>
---
v2:
 After "mt7921_regd_update" the "regd_in_progress" should reset to false.

 drivers/net/wireless/mediatek/mt76/mt7921/init.c | 6 ++++++
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c  | 3 +++
 drivers/net/wireless/mediatek/mt76/mt792x.h      | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 48433c6d5e7d..ef0c721d26e3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -138,9 +138,14 @@ mt7921_regd_notifier(struct wiphy *wiphy,
 	if (pm->suspended)
 		return;
 
+	dev->regd_in_progress = true;
+
 	mt792x_mutex_acquire(dev);
 	mt7921_regd_update(dev);
 	mt792x_mutex_release(dev);
+
+	dev->regd_in_progress = false;
+	wake_up(&dev->wait);
 }
 
 int mt7921_mac_init(struct mt792x_dev *dev)
@@ -261,6 +266,7 @@ int mt7921_register_device(struct mt792x_dev *dev)
 	spin_lock_init(&dev->pm.wake.lock);
 	mutex_init(&dev->pm.mutex);
 	init_waitqueue_head(&dev->pm.wait);
+	init_waitqueue_head(&dev->wait);
 	if (mt76_is_sdio(&dev->mt76))
 		init_waitqueue_head(&dev->mt76.sdio.wait);
 	spin_lock_init(&dev->pm.txq_lock);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 57903c6e4f11..8b226b731ec9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -409,6 +409,9 @@ static int mt7921_pci_suspend(struct device *device)
 	if (err < 0)
 		goto restore_suspend;
 
+	wait_event_timeout(dev->wait,
+			   !dev->regd_in_progress, 5 * HZ);
+
 	err = mt76_connac_mcu_set_hif_suspend(mdev, true);
 	if (err)
 		goto restore_suspend;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 3c897b34aaa7..a8556de3d480 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -186,6 +186,8 @@ struct mt792x_dev {
 	bool hw_init_done:1;
 	bool fw_assert:1;
 	bool has_eht:1;
+	bool regd_in_progress:1;
+	wait_queue_head_t wait;
 
 	struct work_struct init_work;
 
-- 
2.18.0


