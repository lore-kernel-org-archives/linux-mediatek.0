Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396D4CA1016
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Sep 2025 07:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GcWGE70Cd4HosUJCR50vUoeoyqGb/+HuvxPG51UN2h4=; b=0ddCwbEmiX9yUMnNR05k/E9JdM
	NjPuuJvOLt8SdrNTIJXyww1NzFxsCKfzx4SMbJVt040KmG/dT0TDe/DDe7h1+cTYwuJq8Zp8KsCC6
	RMcW94lu944T+nXPobKJRSRSBpXceSwKfWi6VvDz6J+xFJx5IHJhenMUo6jOJVzsOTb5ezETmJAFc
	y8diSlSDnqJks9bgeCSBbQvgWgKg+yhSRxX1nYpR0ny1koidgfXqHyGcvBX/gCRU1lWK0vBTLuRsY
	TF90rfBOl09TyQYSvDpATTBGBNdc4ItuB71jD2QhPt7m7vermN+UElP59DzXdWRUG//L/PGB9g9fB
	qWB/aRzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvW6N-0000000FDBK-1slo;
	Mon, 08 Sep 2025 07:15:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvW3j-0000000FCba-0Bcd
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Sep 2025 07:13:05 +0000
X-UUID: 3fd48d3e8c8311f09eb0dd999d3936bf-20250908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GcWGE70Cd4HosUJCR50vUoeoyqGb/+HuvxPG51UN2h4=;
	b=Sei4feTWF5Mq6v+33yKDJQy6Fc4z2uM2ZQyrgXbuy27LcyopO+0cSVZr1Z0KynMbV0L+XQ4CQoc+3EvnYlENyUV4S6ziPdFmS0eW2+heRpK17441s8zWpHhPpB+O4Am6aOf3rB1S2HcN7ujH9QscnewrzYG1gYOqXxUCORT58O0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:8b486f41-3e4c-4e29-a02c-639d4e61c49a,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:f1326cf,CLOUDID:6402506c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3fd48d3e8c8311f09eb0dd999d3936bf-20250908
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1522967797; Mon, 08 Sep 2025 00:12:58 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 8 Sep 2025 15:12:55 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 8 Sep 2025 15:12:55 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH v2] wifi: mt76: mt7925: refine the txpower initialization flow
Date: Mon, 8 Sep 2025 15:12:45 +0800
Message-ID: <20250908071245.1833006-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_001303_105643_37A0D798 
X-CRM114-Status: GOOD (  13.63  )
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

Refactor the initialization and reset flow for tx power setting to
eliminate redundant configurations

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
v2: fix the title typo
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  |  5 ++++-
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 14 --------------
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  |  5 +++--
 drivers/net/wireless/mediatek/mt76/mt792x.h      |  1 -
 4 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 57bcbb938f53..8640e4ba7bc0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1306,7 +1306,6 @@ void mt7925_mac_reset_work(struct work_struct *work)
 	cancel_delayed_work_sync(&dev->mphy.mac_work);
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_work_sync(&pm->wake_work);
-	dev->sar_inited = false;
 
 	for (i = 0; i < 10; i++) {
 		mutex_lock(&dev->mt76.mutex);
@@ -1335,6 +1334,10 @@ void mt7925_mac_reset_work(struct work_struct *work)
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
 					    mt7925_vif_connect_iter, NULL);
 	mt76_connac_power_save_sched(&dev->mt76.phy, pm);
+
+	mt792x_mutex_acquire(dev);
+	mt7925_mcu_set_clc(dev, "00", ENVIRON_INDOOR);
+	mt792x_mutex_release(dev);
 }
 
 void mt7925_coredump_work(struct work_struct *work)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index ca21cd96cd1f..e01aca2af1e0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -311,7 +311,6 @@ void mt7925_set_stream_he_eht_caps(struct mt792x_phy *phy)
 int __mt7925_start(struct mt792x_phy *phy)
 {
 	struct mt76_phy *mphy = phy->mt76;
-	struct mt792x_dev *dev = phy->dev;
 	int err;
 
 	err = mt7925_mcu_set_channel_domain(mphy);
@@ -322,13 +321,6 @@ int __mt7925_start(struct mt792x_phy *phy)
 	if (err)
 		return err;
 
-	if (!dev->sar_inited) {
-		err = mt7925_set_tx_sar_pwr(mphy->hw, NULL);
-		if (err)
-			return err;
-		dev->sar_inited = true;
-	}
-
 	mt792x_mac_reset_counters(phy);
 	set_bit(MT76_STATE_RUNNING, &mphy->state);
 
@@ -1680,13 +1672,7 @@ static int mt7925_set_sar_specs(struct ieee80211_hw *hw,
 	int err;
 
 	mt792x_mutex_acquire(dev);
-	err = mt7925_mcu_set_clc(dev, dev->mt76.alpha2,
-				 dev->country_ie_env);
-	if (err < 0)
-		goto out;
-
 	err = mt7925_set_tx_sar_pwr(hw, sar);
-out:
 	mt792x_mutex_release(dev);
 
 	return err;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 6b6cadaf1654..66b35ef004fc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -928,7 +928,6 @@ static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
 		}
 	}
 
-	ret = mt7925_mcu_set_clc(dev, "00", ENVIRON_INDOOR);
 out:
 	release_firmware(fw);
 
@@ -3987,6 +3986,8 @@ mt7925_mcu_rate_txpower_band(struct mt76_phy *phy,
 
 int mt7925_mcu_set_rate_txpower(struct mt76_phy *phy)
 {
+	struct mt76_dev *mdev = phy->dev;
+	struct mt792x_dev *dev = mt792x_hw_dev(mdev->hw);
 	int err;
 
 	if (phy->cap.has_2ghz) {
@@ -4003,7 +4004,7 @@ int mt7925_mcu_set_rate_txpower(struct mt76_phy *phy)
 			return err;
 	}
 
-	if (phy->cap.has_6ghz) {
+	if (phy->cap.has_6ghz && dev->phy.clc_chan_conf) {
 		err = mt7925_mcu_rate_txpower_band(phy,
 						   NL80211_BAND_6GHZ);
 		if (err < 0)
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index aea11713b20a..f22fe982eafb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -236,7 +236,6 @@ struct mt792x_dev {
 	bool aspm_supported:1;
 	bool hif_idle:1;
 	bool hif_resumed:1;
-	bool sar_inited:1;
 	bool regd_change:1;
 	wait_queue_head_t wait;
 
-- 
2.34.1


