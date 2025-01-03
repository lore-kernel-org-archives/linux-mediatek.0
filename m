Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFFEE7718F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2025 13:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2cyeQ4ZYLPr4O58xO9lMsv4lI1QFC2xoa4iYSJ0krQI=; b=aiOg59HPeZvY7OHobsU5BVqs4X
	7b4qrTmLOcewcLJNRyWHFvOtvFRMdC8UKC9C7AXHkHFwlFthDQCNthVZJjzCq3mG0eX5hGohQkPK1
	lNsdJz73RZRJmhqTTctsegV6U3i/FOZDc82njiTnFgm0PvwXVrXK2BVhZZumzhG2wyCJwqvplWsUg
	EaXjKTcAzLXewm1L7Lwzx4fTsRabEFpcb32rGSJKsAlhVn0VOobkPJ3a/dNJimogrYOU7e0MzNfF0
	d2cGzOdVNt6OJiRN1yxFp5hCP1afAkSZnW2DBwDGApQcsmxiTIodwPeDXl2D5tNtdLW0ulnsI52p4
	tajmjaIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTi7g-0000000D2iJ-149E;
	Fri, 03 Jan 2025 13:53:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTi7d-0000000D2hW-2olR
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jan 2025 13:53:55 +0000
X-UUID: 280b2f6cc9da11ef82ff63e91e7eb18c-20250103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2cyeQ4ZYLPr4O58xO9lMsv4lI1QFC2xoa4iYSJ0krQI=;
	b=gNT8YQVPUlodWmsg6AejfUlemIYv65UsMZ0YOYIBiwrNu3eMu1f90gIONI6k+wMqAO9MoT6pSdNeSsMBTBtk8O0f1Jha3nsW5CLRW4GRpFgJGMNEQzqzAOL6A14AXNZr1X8lFLE9K3Dc3xG3rRzK56wGI0i4/Ojf/MXNyXfbs4Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:f4b9126a-2fdf-4eaa-a5ca-089d9c4634e9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:60aa074,CLOUDID:8da14a19-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 280b2f6cc9da11ef82ff63e91e7eb18c-20250103
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <quan.zhou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 961836642; Fri, 03 Jan 2025 06:53:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 Jan 2025 21:53:45 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 Jan 2025 21:53:44 +0800
From: Quan Zhou <quan.zhou@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	Leon Yen <Leon.Yen@mediatek.com>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>, Allan Wang <allan.wang@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Shengxi Xu
	<shengxi.xu@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Quan Zhou <quan.zhou@mediatek.com>
Subject: [patch] wifi: mt76: mt7925e: fix too long of wifi resume time
Date: Fri, 3 Jan 2025 21:53:50 +0800
Message-ID: <f075d43d87a5eefa5869baf755e9986edf735860.1735910836.git.quan.zhou@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_055353_716175_C504247C 
X-CRM114-Status: GOOD (  13.95  )
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

The mt7925e takes a long time to resume in platform resume
scenarios. This is due to the mt7925 reconfiguring the tx
power for each wifi channel during resume. By streamlining
the process and removing redundant power configurations,
the resume time for the mt7925 can be shortened.

Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/init.c |  5 +++++
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  |  1 +
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 10 +++++++---
 drivers/net/wireless/mediatek/mt76/mt792x.h      |  2 ++
 4 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index f6f8ab38d5aa..f41ca4248497 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -63,9 +63,13 @@ void mt7925_regd_update(struct mt792x_dev *dev)
 	struct mt76_dev *mdev = &dev->mt76;
 	struct ieee80211_hw *hw = mdev->hw;
 
+	if (!dev->regd_change)
+		return;
+
 	mt7925_mcu_set_clc(dev, mdev->alpha2, dev->country_ie_env);
 	mt7925_mcu_set_channel_domain(hw->priv);
 	mt7925_set_tx_sar_pwr(hw, NULL);
+	dev->regd_change = false;
 }
 EXPORT_SYMBOL_GPL(mt7925_regd_update);
 
@@ -91,6 +95,7 @@ mt7925_regd_notifier(struct wiphy *wiphy,
 	memcpy(mdev->alpha2, req->alpha2, 2);
 	mdev->region = req->dfs_region;
 	dev->country_ie_env = req->country_ie_env;
+	dev->regd_change = true;
 
 	if (pm->suspended)
 		return;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 187770537a1a..f8977e6601d6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1300,6 +1300,7 @@ void mt7925_mac_reset_work(struct work_struct *work)
 	cancel_delayed_work_sync(&dev->mphy.mac_work);
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_work_sync(&pm->wake_work);
+	dev->sar_inited = false;
 
 	for (i = 0; i < 10; i++) {
 		mutex_lock(&dev->mt76.mutex);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index a6944de712cc..7ef101ecf824 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -310,6 +310,7 @@ void mt7925_set_stream_he_eht_caps(struct mt792x_phy *phy)
 int __mt7925_start(struct mt792x_phy *phy)
 {
 	struct mt76_phy *mphy = phy->mt76;
+	struct mt792x_dev *dev = phy->dev;
 	int err;
 
 	err = mt7925_mcu_set_channel_domain(mphy);
@@ -320,9 +321,12 @@ int __mt7925_start(struct mt792x_phy *phy)
 	if (err)
 		return err;
 
-	err = mt7925_set_tx_sar_pwr(mphy->hw, NULL);
-	if (err)
-		return err;
+	if (!dev->sar_inited) {
+		err = mt7925_set_tx_sar_pwr(mphy->hw, NULL);
+		if (err)
+			return err;
+		dev->sar_inited = true;
+	}
 
 	mt792x_mac_reset_counters(phy);
 	set_bit(MT76_STATE_RUNNING, &mphy->state);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 1b612d123d9f..af687fe239b5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -224,6 +224,8 @@ struct mt792x_dev {
 	bool aspm_supported:1;
 	bool hif_idle:1;
 	bool hif_resumed:1;
+	bool sar_inited:1;
+	bool regd_change:1;
 	wait_queue_head_t wait;
 
 	struct work_struct init_work;
-- 
2.46.0


