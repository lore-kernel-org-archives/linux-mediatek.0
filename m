Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75491C2BB1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 21:12:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A9422076A
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 21:12:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xn7OhvEF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LiJr+PXo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A9422076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uw9c9JErbP19cZvzuy/RBLDgv39j1to9Lt3avs+QJPQ=; b=Xn7OhvEFqiRi0a
	Gqvpd6KQ98bvKBaYQKvJFUWgNPFoyAdXbKpezKmPyC2ixzy6JRzRGsZ/igdDuMIeJ4CD7IBdbhDB9
	KXHPhhl0DSKwlkdho5LL1ZBWrFFiOEQumqY2CqQY2IDH49CK+6py5yzHEvyjDE+kT8keCmHBrJByO
	GS4W3jPSc9APSTSComRVZRGS7zp0SolcYuroTS1xio6E9DGHrrYBddy8T47JxnKxa756y1B4zuT/v
	yAIg0hbHYckOd5uUXknzth7bEbmlor28216UKQ7kgfX16h2rCk7FJp2MWwp0uIIvMbxLRHB/Akg5Z
	qkFoTI83nC1MdSD0Jj9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOSqd-0005jb-Lr; Tue, 14 Apr 2020 21:11:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOSqT-0005GL-MO
 for linux-mediatek@lists.infradead.org; Tue, 14 Apr 2020 21:11:51 +0000
X-UUID: 1a070d38f2f0452ba61b99a21aa2308a-20200414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XaaKZN9d4Z70hCuMtI7McsI/cjlmwE5uORGPyktd7Dk=; 
 b=LiJr+PXomqSBC8KGwLjbtCnuBF7gfSmDTPwphANSnmgPzADmH2Y30lGs8rtYTMzKEhMM8dtsqaJJUkIcehILGVH6c/JE9mdcDF1DzsSAtdO/JIjbi3kxtDRKVdjQhbMByD6cUg/KXGxA0Tpcggxs+idT1/ylXxs4eEwTxQyRbks=;
X-UUID: 1a070d38f2f0452ba61b99a21aa2308a-20200414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1916497637; Tue, 14 Apr 2020 13:11:43 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Apr 2020 14:01:40 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Apr 2020 05:01:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 15 Apr 2020 05:01:39 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 18/18] mt76: set runtime stream caps by mt76_phy
Date: Wed, 15 Apr 2020 05:01:16 +0800
Message-ID: <1c12eebe5f97f3f6d04d8da0481d49b827ef8559.1586895593.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1586895593.git.ryder.lee@mediatek.com>
References: <cover.1586895593.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E85A5CD85A55805BEDD5BB331F1224A12AC9FD202CA41A2BC4A44B8667CB52CF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_141149_799433_DFBDAFD2 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: YF Luo <yf.luo@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Sean
 Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch can support concurrent dual-band operation.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c    | 16 ++++++++--------
 drivers/net/wireless/mediatek/mt76/mt76.h        |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/init.c |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7615/main.c |  2 +-
 .../net/wireless/mediatek/mt76/mt76x2/pci_main.c |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/init.c |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7915/main.c |  2 +-
 7 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index b76dee2c9632..2175b5c50751 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -116,12 +116,12 @@ static void mt76_led_cleanup(struct mt76_dev *dev)
 	led_classdev_unregister(&dev->led_cdev);
 }
 
-static void mt76_init_stream_cap(struct mt76_dev *dev,
+static void mt76_init_stream_cap(struct mt76_phy *phy,
 				 struct ieee80211_supported_band *sband,
 				 bool vht)
 {
 	struct ieee80211_sta_ht_cap *ht_cap = &sband->ht_cap;
-	int i, nstream = hweight8(dev->phy.antenna_mask);
+	int i, nstream = hweight8(phy->antenna_mask);
 	struct ieee80211_sta_vht_cap *vht_cap;
 	u16 mcs_map = 0;
 
@@ -153,12 +153,12 @@ static void mt76_init_stream_cap(struct mt76_dev *dev,
 	vht_cap->vht_mcs.tx_mcs_map = cpu_to_le16(mcs_map);
 }
 
-void mt76_set_stream_caps(struct mt76_dev *dev, bool vht)
+void mt76_set_stream_caps(struct mt76_phy *phy, bool vht)
 {
-	if (dev->cap.has_2ghz)
-		mt76_init_stream_cap(dev, &dev->phy.sband_2g.sband, false);
-	if (dev->cap.has_5ghz)
-		mt76_init_stream_cap(dev, &dev->phy.sband_5g.sband, vht);
+	if (phy->dev->cap.has_2ghz)
+		mt76_init_stream_cap(phy, &phy->sband_2g.sband, false);
+	if (phy->dev->cap.has_5ghz)
+		mt76_init_stream_cap(phy, &phy->sband_5g.sband, vht);
 }
 EXPORT_SYMBOL_GPL(mt76_set_stream_caps);
 
@@ -200,7 +200,7 @@ mt76_init_sband(struct mt76_dev *dev, struct mt76_sband *msband,
 	ht_cap->ampdu_factor = IEEE80211_HT_MAX_AMPDU_64K;
 	ht_cap->ampdu_density = IEEE80211_HT_MPDU_DENSITY_4;
 
-	mt76_init_stream_cap(dev, sband, vht);
+	mt76_init_stream_cap(&dev->phy, sband, vht);
 
 	if (!vht)
 		return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index d1ad1f035426..6a497789fc50 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -817,7 +817,7 @@ void mt76_set_channel(struct mt76_phy *phy);
 void mt76_update_survey(struct mt76_dev *dev);
 int mt76_get_survey(struct ieee80211_hw *hw, int idx,
 		    struct survey_info *survey);
-void mt76_set_stream_caps(struct mt76_dev *dev, bool vht);
+void mt76_set_stream_caps(struct mt76_phy *phy, bool vht);
 
 int mt76_rx_aggr_start(struct mt76_dev *dev, struct mt76_wcid *wcid, u8 tid,
 		       u16 ssn, u16 size);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index cb626a2d9197..98e5d360f53d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -398,7 +398,7 @@ mt7615_cap_dbdc_enable(struct mt7615_dev *dev)
 	dev->phy.chainmask = dev->mphy.antenna_mask;
 	dev->mphy.hw->wiphy->available_antennas_rx = dev->phy.chainmask;
 	dev->mphy.hw->wiphy->available_antennas_tx = dev->phy.chainmask;
-	mt76_set_stream_caps(&dev->mt76, true);
+	mt76_set_stream_caps(&dev->mphy, true);
 }
 
 static void
@@ -411,7 +411,7 @@ mt7615_cap_dbdc_disable(struct mt7615_dev *dev)
 	dev->phy.chainmask = dev->chainmask;
 	dev->mphy.hw->wiphy->available_antennas_rx = dev->chainmask;
 	dev->mphy.hw->wiphy->available_antennas_tx = dev->chainmask;
-	mt76_set_stream_caps(&dev->mt76, true);
+	mt76_set_stream_caps(&dev->mphy, true);
 }
 
 int mt7615_register_ext_phy(struct mt7615_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index b346080458bc..b96514bb76b6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -720,7 +720,7 @@ mt7615_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
 	}
 	phy->chainmask = tx_ant;
 
-	mt76_set_stream_caps(&dev->mt76, true);
+	mt76_set_stream_caps(phy->mt76, true);
 
 	mutex_unlock(&dev->mt76.mutex);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/pci_main.c b/drivers/net/wireless/mediatek/mt76/mt76x2/pci_main.c
index a74599f7f729..98f4cf398320 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/pci_main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/pci_main.c
@@ -119,7 +119,7 @@ static int mt76x2_set_antenna(struct ieee80211_hw *hw, u32 tx_ant,
 	dev->chainmask = (tx_ant == 3) ? 0x202 : 0x101;
 	dev->mphy.antenna_mask = tx_ant;
 
-	mt76_set_stream_caps(&dev->mt76, true);
+	mt76_set_stream_caps(&dev->mphy, true);
 	mt76x2_phy_set_antenna(dev);
 
 	mutex_unlock(&dev->mt76.mutex);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index bb8325e2edbd..7d59571216e3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -443,7 +443,7 @@ mt7915_cap_dbdc_enable(struct mt7915_dev *dev)
 	dev->mphy.hw->wiphy->available_antennas_rx = dev->phy.chainmask;
 	dev->mphy.hw->wiphy->available_antennas_tx = dev->phy.chainmask;
 
-	mt76_set_stream_caps(&dev->mt76, true);
+	mt76_set_stream_caps(&dev->mphy, true);
 	mt7915_set_stream_he_caps(&dev->phy);
 }
 
@@ -459,7 +459,7 @@ mt7915_cap_dbdc_disable(struct mt7915_dev *dev)
 	dev->mphy.hw->wiphy->available_antennas_rx = dev->chainmask;
 	dev->mphy.hw->wiphy->available_antennas_tx = dev->chainmask;
 
-	mt76_set_stream_caps(&dev->mt76, true);
+	mt76_set_stream_caps(&dev->mphy, true);
 	mt7915_set_stream_he_caps(&dev->phy);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index ef0c91990b49..697045e65b24 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -741,7 +741,7 @@ mt7915_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
 	}
 	phy->chainmask = tx_ant;
 
-	mt76_set_stream_caps(&dev->mt76, true);
+	mt76_set_stream_caps(phy->mt76, true);
 	mt7915_set_stream_he_caps(phy);
 
 	mutex_unlock(&dev->mt76.mutex);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
