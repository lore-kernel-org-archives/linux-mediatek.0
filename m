Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5774606A326
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0+ZrmYek;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=TU819jvj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QyNsyvOq46f3GcxnNYdj2Ud9muh/DRw2/Ht6aro+AyM=; b=0+ZrmYekrNawClX6X13EWcxgFj
	7WDni5zJX/HXDsjF82p50KdoLFeayUjUuQN3LZKJK6se1IVO306ebK+0X16BrXHlP4xA0BhPSM+Xk
	lXh+Uhc7vxnSpMBYM/mgUUAyQ9gEdus+1sODD3arATeOTvprP8KLPGfbuMcb59hwbwO2dwvwetuN4
	hOZUwuyWm2o6ZmpNcH0cM4ImV5KHcfXYAQk+9xKLjwczGX4ABAk1CN8eFU/uWRyRD3ujs3osPBaVe
	YcLyELLUkhrHLjt9fQCdmJDd7JAfPDNLZaFh7JNMkIaBjmvB8Z7NsORyHLZ5JMq1eBXlnKX9GsKQv
	7xae0/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIz-00000002FRu-1YH2;
	Tue, 10 Nov 2026 03:13:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIi-00000002F1W-0wwZ
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:37 +0000
X-UUID: b42fdf30dcb411f1afed4741b24580c9-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QyNsyvOq46f3GcxnNYdj2Ud9muh/DRw2/Ht6aro+AyM=;
	b=TU819jvjWZooZMS0nRjJojrzqxiZKlSx64BObdWxpG/E+NEhDTVzWckSD8sQBakjzMJBPMUiyEkGDo6tyCz279/Kn1YER1qnFyncmOWy2J5R0cOT2CswWtxV5pqd6On7FNrC6HqdgxdhAXMVI9YzAwxEqpCDPCZSSTCOkYxAiHo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:5047d64e-567c-4dd1-809b-271ed71a1df7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:79af878d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b42fdf30dcb411f1afed4741b24580c9-20261109
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1918003730; Mon, 09 Nov 2026 20:13:30 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:13:27 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:13:27 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH 04/28] wifi: mt76: mt792x: use named constants for the DBDC band
Date: Tue, 10 Nov 2026 11:12:20 +0800
Message-ID: <20261110031244.369014-5-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191336_363853_47D890B6 
X-CRM114-Status: GOOD (  14.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace the hard-coded 0xfe/0xff DBDC band values with a shared
mt792x_band_idx enum, covering the host band_idx and the mt7925/mt7921
ROC command band fields. No functional change.

This is a preparation patch before the MT7925 MLO hybrid/EMLSR work.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c  |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c  |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7925/main.c |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  | 12 ++++++------
 drivers/net/wireless/mediatek/mt76/mt792x.h      | 12 ++++++++++++
 5 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index e23c6026442f..628f221fcc15 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -875,7 +875,7 @@ int mt7921_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_vif *vif,
 			.bw_from_ap = CMD_CBW_20MHZ,
 			.center_chan = center_ch,
 			.center_chan_from_ap = center_ch,
-			.dbdcband = 0xff, /* auto */
+			.dbdcband = MT792x_BAND_AUTO,
 		},
 	};
 
@@ -922,7 +922,7 @@ int mt7921_mcu_abort_roc(struct mt792x_phy *phy, struct mt792x_vif *vif,
 			.len = cpu_to_le16(sizeof(struct roc_abort_tlv)),
 			.tokenid = token_id,
 			.bss_idx = vif->bss_conf.mt76.idx,
-			.dbdcband = 0xff, /* auto*/
+			.dbdcband = MT792x_BAND_AUTO,
 		},
 	};
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 5672af18afe9..66d962bcba85 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -800,7 +800,7 @@ mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 	      FIELD_PREP(MT_TXD1_OWN_MAC, omac_idx);
 
 	/* 0xff means BAND_AUTO to the firmware, and TGID cannot encode it */
-	if (band_idx && band_idx != 0xff)
+	if (band_idx && band_idx != MT792x_BAND_AUTO)
 		val |= FIELD_PREP(MT_TXD1_TGID, band_idx);
 
 	txwi[1] = cpu_to_le32(val);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 250746014b72..4d593291a23a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -399,7 +399,7 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 
 	mconf->mt76.omac_idx = ieee80211_vif_is_mld(vif) ?
 			       0 : mconf->mt76.idx;
-	mconf->mt76.band_idx = 0xff;
+	mconf->mt76.band_idx = MT792x_BAND_AUTO;
 
 	mconf->absent = false;
 
@@ -2075,7 +2075,7 @@ mt7925_start_ap(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		if (!err)
 			roc_taken = true;
 		else if (!is_mt7927(&dev->mt76))
-			mconf->mt76.band_idx = 0xff;
+			mconf->mt76.band_idx = MT792x_BAND_AUTO;
 	}
 
 	err = mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 7436101514cd..c8dab3cbb06b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1592,10 +1592,10 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf
 		req.roc[i].center_chan2 = 0;
 		req.roc[i].center_chan2_from_ap = 0;
 
-		/* STR : 0xfe indicates BAND_ALL with enabling DBDC
-		 * EMLSR : 0xff indicates (BAND_AUTO) without DBDC
-		 */
-		req.roc[i].dbdcband = type == MT7925_ROC_REQ_JOIN ? 0xfe : 0xff;
+		/* STR enables DBDC on all bands; otherwise let firmware pick */
+		req.roc[i].dbdcband = type == MT7925_ROC_REQ_JOIN ?
+				      MT792x_BAND_ALL :
+				      MT792x_BAND_AUTO;
 
 		if (chan->hw_value < center_ch)
 			req.roc[i].sco = 1; /* SCA */
@@ -1666,7 +1666,7 @@ int mt7925_mcu_set_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 			.maxinterval = cpu_to_le32(duration),
 			.bss_idx = mconf->mt76.idx,
 			.control_channel = chan->hw_value,
-			.dbdcband = 0xff, /* auto */
+			.dbdcband = MT792x_BAND_AUTO,
 		},
 	};
 	struct cfg80211_chan_def chandef;
@@ -1735,7 +1735,7 @@ int mt7925_mcu_abort_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf,
 			.len = cpu_to_le16(sizeof(struct roc_abort_tlv)),
 			.tokenid = token_id,
 			.bss_idx = mconf->mt76.idx,
-			.dbdcband = 0xff, /* auto*/
+			.dbdcband = MT792x_BAND_AUTO,
 		},
 	};
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index d54ade9c18dc..8a366356e560 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -26,6 +26,18 @@
 #define MT792x_FW_CAP_NAN	BIT(5)
 #define MT792x_FW_CAP_CNM	BIT(7)
 
+/* DBDC band index; 0xff lets firmware pick the band */
+enum mt792x_band_idx {
+	MT792x_BAND_0 = 0,
+	MT792x_BAND_1 = 1,
+	MT792x_BAND_2 = 2,
+	MT792x_BAND_3 = 3,
+	MT792x_BAND_LIT = 3,
+	MT792x_BAND_NUM,
+	MT792x_BAND_ALL  = 0xfe,
+	MT792x_BAND_AUTO = 0xff,
+};
+
 /* Chip capability bit positions reported by firmware.
  * Use with BIT(): chip_cap & BIT(MT792x_CHIP_CAP_x).
  */
-- 
2.45.2


