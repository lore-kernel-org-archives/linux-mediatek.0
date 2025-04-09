Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39250C369A4
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Apr 2025 14:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFpaDEvPRQNzjQjvK8ikbTAXr7TyNVroPSc2lStu5KA=; b=eWbcLdNug0xCljIUatnG6/6B/0
	lOzlw2dhNfTZunHbIf2iTrxUGZnw6g/jciPR7pgYDa+V+XMXvj0u7UWQylC+95InLGstcPcURpwU/
	r7w3ixbQmviWVXl24vNVInAFBadcnUw4wxUTRX/bA8xxWQmRvwUMIzwzBJPU6jxg9bIeIQnpusy3v
	sMxLYk3WvoDPnr61eswAuzsCUVHul8Gfo4wY/KiW4R5Glw2jEM236TH7xk2chN8XZ3waJ7OMfcUCT
	pWDxD90B1572QFb+eYjFDGyJN4r+YaCPI9diwVPND6eCfWX9tXUYNufhZG39A1ikPtUnyl75kg8K+
	Q+JTC9Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WgR-00000007WCX-0wrm;
	Wed, 09 Apr 2025 14:45:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2W6e-00000007OfZ-0NN3
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Apr 2025 14:08:45 +0000
X-UUID: 231897c0154c11f083f2a1c9db70dae0-20250409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=YFpaDEvPRQNzjQjvK8ikbTAXr7TyNVroPSc2lStu5KA=;
	b=eufHPQYgyeHO3JAd2vMRRxn9gpnSFA18Wgc77PtIROBRfTq+PKFXcT8vz5uEeOZQuVED7JJDt89bHZJOMRvcROpVzrAe3KoS/1O+RxTa9CfoR6jLUwMekrbJ8vm2Q9j0OOfarG8gVUkEjm1VZvMuUxHT16vgtFrgrDneZ201iIw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:ad142312-03aa-4051-b19e-700c990a25bb,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:e11f688d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 231897c0154c11f083f2a1c9db70dae0-20250409
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1060333953; Wed, 09 Apr 2025 07:08:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 9 Apr 2025 22:08:37 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 9 Apr 2025 22:08:37 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Howard Hsu <howard-yh.hsu@mediatek.com>, Shayne
 Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76-next v3 07/10] wifi: mt76: mt7996: adjust HW capabilities for mt7990
Date: Wed, 9 Apr 2025 22:07:47 +0800
Message-ID: <20250409140750.724437-8-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409140750.724437-1-shayne.chen@mediatek.com>
References: <20250409140750.724437-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_070844_130291_EB94B606 
X-CRM114-Status: GOOD (  12.52  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

This is a preliminary patch to support mt7990 chipset.

Co-developed-by: Howard Hsu <howard-yh.hsu@mediatek.com>
Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   | 9 ++++++---
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h | 4 ++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index a4c2986fcffd..9a8b10c50f72 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -440,6 +440,9 @@ mt7996_init_wiphy(struct ieee80211_hw *hw, struct mtk_wed_device *wed)
 	hw->queues = 4;
 	hw->max_rx_aggregation_subframes = max_subframes;
 	hw->max_tx_aggregation_subframes = max_subframes;
+	if (is_mt7990(mdev) && dev->has_eht)
+		hw->max_tx_aggregation_subframes = 512;
+
 	hw->netdev_features = NETIF_F_RXCSUM;
 	if (mtk_wed_device_active(wed))
 		hw->netdev_features |= NETIF_F_HW_TC;
@@ -1064,10 +1067,10 @@ void mt7996_set_stream_vht_txbf_caps(struct mt7996_phy *phy)
 	*cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE |
 		IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
 
-	if (is_mt7996(phy->mt76->dev))
-		*cap |= FIELD_PREP(IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK, 3);
-	else
+	if (is_mt7992(phy->mt76->dev))
 		*cap |= FIELD_PREP(IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK, 4);
+	else
+		*cap |= FIELD_PREP(IEEE80211_VHT_CAP_BEAMFORMEE_STS_MASK, 3);
 
 	*cap &= ~(IEEE80211_VHT_CAP_SOUNDING_DIMENSIONS_MASK |
 		  IEEE80211_VHT_CAP_SU_BEAMFORMER_CAPABLE |
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 2dd33f303a06..92b01ed82e7e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -14,7 +14,7 @@
 #define MT7996_MAX_RADIOS		3
 #define MT7996_MAX_INTERFACES		19	/* per-band */
 #define MT7996_MAX_WMM_SETS		4
-#define MT7996_WTBL_BMC_SIZE		(is_mt7992(&dev->mt76) ? 32 : 64)
+#define MT7996_WTBL_BMC_SIZE		(is_mt7996(&dev->mt76) ? 64 : 32)
 #define MT7996_WTBL_RESERVED		(mt7996_wtbl_size(dev) - 1)
 #define MT7996_WTBL_STA			(MT7996_WTBL_RESERVED - \
 					 mt7996_max_interface_num(dev))
@@ -482,7 +482,7 @@ mt7996_phy3(struct mt7996_dev *dev)
 static inline bool
 mt7996_band_valid(struct mt7996_dev *dev, u8 band)
 {
-	if (is_mt7992(&dev->mt76))
+	if (!is_mt7996(&dev->mt76))
 		return band <= MT_BAND1;
 
 	return band <= MT_BAND2;
-- 
2.39.2


