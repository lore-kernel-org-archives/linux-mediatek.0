Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C04E67A6C
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2026 05:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDsTwtc2qu7Wk7WSuA9UWun90AVZzgHfU7+6XnY2gjY=; b=C3vAxxK5MrSEFURmhO/Ln9FnwX
	8dfY8L0IKdvtD+gJKRzovXr6rzQsNHaDSMOgWvyEtfqjurHy8f2no0M1rgY8Ka+5K5PvOymkx5l76
	Id3ougmRc+f/IBmLfdRKBoOUzRpcnqLAuVzcAUZO18lr2EpgzH8iy4ME2kQ3uWOX9rOPNvXEU0DGe
	vZ5VQz7EEEDBiDOnlCs9EHwoEjjd0AuxqsKE57tWhbNhsQLRYdCOPBUTZyVLThTnJU82LjFGVFKsG
	Xf6pDNCHBli9c3IplMu6SUtAurVke5fPEZ/OfiRcLjQnp0UOTzS83O4eZkNQ0YzOAGs72vrxrGZFU
	Us2fg4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIRH-0000000EYZa-14FU;
	Tue, 03 Mar 2026 05:36:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIRE-0000000EYYI-3rBO
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Mar 2026 05:36:58 +0000
X-UUID: fc8ad69416c211f1a16f0188aa809bee-20260302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bDsTwtc2qu7Wk7WSuA9UWun90AVZzgHfU7+6XnY2gjY=;
	b=qwStwdk9QZBS+TYxjXlra+uDIT4Nydl5nTLNjI34pJXgWGHNyzol/hsM/mgCWJGBUCuKuLC4y87n/TDbQ1wzYYujeasasF91mXSquEA8UhAqEkwIPMWO3ohINq/8Wnz60x31bu17p15eZKKnQFdywR3KoSZw9gMNeKRI2v1nYBE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:2a525ef8-fd6a-4f30-8100-391744985102,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:335c2dea-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fc8ad69416c211f1a16f0188aa809bee-20260302
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 975836219; Mon, 02 Mar 2026 22:36:54 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Mar 2026 13:36:51 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Mar 2026 13:36:51 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>, Sean Wang
	<sean.wang@mediatek.com>
Subject: [PATCH v2 3/5] wifi: mt76: mt7921: refactor regulatory notifier flow
Date: Tue, 3 Mar 2026 13:36:35 +0800
Message-ID: <20260303053637.465465-3-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260303053637.465465-1-jb.tsai@mediatek.com>
References: <20260303053637.465465-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_213656_962300_0F838E33 
X-CRM114-Status: GOOD (  14.40  )
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

Rename mt7921_regd_update() to mt7921_mcu_regd_update() to centralize
regd updates with error handling.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: JB Tsai <jb.tsai@mediatek.com>
---
v2: fix build eror with rebasing the latest mt76 tree
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  |  2 +-
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7921/regd.c  | 45 +++++++++++++------
 .../net/wireless/mediatek/mt76/mt7921/regd.h  |  3 +-
 4 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index d9925a528294..24e8fd1f01ed 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -802,7 +802,7 @@ mt7921_regd_set_6ghz_power_type(struct ieee80211_vif *vif, bool is_add)
 
 out:
 	if (vif->bss_conf.chanreq.oper.chan->band == NL80211_BAND_6GHZ)
-		mt7921_regd_update(dev);
+		mt7921_mcu_regd_update(dev, dev->mt76.alpha2, dev->country_ie_env);
 }
 
 int mt7921_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 64340f9b7fa4..6ac145792f22 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -584,7 +584,7 @@ static int mt7921_pci_resume(struct device *device)
 	if (err < 0)
 		goto failed;
 
-	mt7921_regd_update(dev);
+	mt7921_mcu_regd_update(dev, mdev->alpha2, dev->country_ie_env);
 	err = mt7921_mcu_radio_led_ctrl(dev, EXT_CMD_RADIO_ON_LED);
 failed:
 	pm->suspended = false;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
index 943342984965..fa753e8e041d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
@@ -71,18 +71,43 @@ mt7921_regd_channel_update(struct wiphy *wiphy, struct mt792x_dev *dev)
 	}
 }
 
-void mt7921_regd_update(struct mt792x_dev *dev)
+int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
+			   enum environment_cap country_ie_env)
 {
 	struct mt76_dev *mdev = &dev->mt76;
 	struct ieee80211_hw *hw = mdev->hw;
 	struct wiphy *wiphy = hw->wiphy;
+	int ret = 0;
+
+	dev->regd_in_progress = true;
+
+	mt792x_mutex_acquire(dev);
+	if (!dev->regd_change)
+		goto err;
+
+	ret = mt7921_mcu_set_clc(dev, alpha2, country_ie_env);
+	if (ret < 0)
+		goto err;
 
-	mt7921_mcu_set_clc(dev, mdev->alpha2, dev->country_ie_env);
 	mt7921_regd_channel_update(wiphy, dev);
-	mt76_connac_mcu_set_channel_domain(hw->priv);
-	mt7921_set_tx_sar_pwr(hw, NULL);
+
+	ret = mt76_connac_mcu_set_channel_domain(hw->priv);
+	if (ret < 0)
+		goto err;
+
+	ret = mt7921_set_tx_sar_pwr(hw, NULL);
+	if (ret < 0)
+		goto err;
+
+err:
+	mt792x_mutex_release(dev);
+	dev->regd_change = false;
+	dev->regd_in_progress = false;
+	wake_up(&dev->wait);
+
+	return ret;
 }
-EXPORT_SYMBOL_GPL(mt7921_regd_update);
+EXPORT_SYMBOL_GPL(mt7921_mcu_regd_update);
 
 void mt7921_regd_notifier(struct wiphy *wiphy,
 			  struct regulatory_request *request)
@@ -105,12 +130,6 @@ void mt7921_regd_notifier(struct wiphy *wiphy,
 	if (pm->suspended)
 		return;
 
-	dev->regd_in_progress = true;
-
-	mt792x_mutex_acquire(dev);
-	mt7921_regd_update(dev);
-	mt792x_mutex_release(dev);
-
-	dev->regd_in_progress = false;
-	wake_up(&dev->wait);
+	mt7921_mcu_regd_update(dev, request->alpha2,
+			       request->country_ie_env);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
index ece85feb7a23..c7dcf747843c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
@@ -8,7 +8,8 @@ struct mt792x_dev;
 struct wiphy;
 struct regulatory_request;
 
-void mt7921_regd_update(struct mt792x_dev *dev);
+int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
+			   enum environment_cap country_ie_env);
 void mt7921_regd_notifier(struct wiphy *wiphy,
 			  struct regulatory_request *request);
 bool mt7921_regd_clc_supported(struct mt792x_dev *dev);
-- 
2.43.0


