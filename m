Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CBAC5DF9C
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 19:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JIDeRFyrO7Kp+QOJ1Y/KCDJtxTfEq+gujQbLv/1UDNU=; b=N7iOOLnS+BXfiHEwDw0/yVoon0
	HQw/q2mr9tsBh2+tHCwmzqNtLuGKExI4S73/0DLf2DGF3SdJIQjqzMEyu0ozLosldIfyV2OyY9miH
	G2FrU4/bZl1Mbp2suLZX+dfqZVj6/OaMuDgyBd8NklpTzPQ1dJxUa7fr7i787szEd8qdWwyuWKAhb
	3FMJG4c/hJxyF02XfMG/4l1F2C3TIHYoni4UbVMsK9mAq53r2FgQM9g+o5ozYwy9Y0rnLssDaFv9N
	PiaMf1sC/L1St5f3lyIBPZ1+opUM7AbQ0L4zMI6Q51QgELjTPb+atkKwC/S3n2P/BHHT/ko8i10Xs
	DCOFW/6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajk-0000000HKfu-21NO;
	Mon, 24 Aug 2026 19:53:40 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaji-0000000HKeZ-2wI9
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 19:53:39 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-44aeefa1c00so88112fac.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 12:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601218; x=1788206018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JIDeRFyrO7Kp+QOJ1Y/KCDJtxTfEq+gujQbLv/1UDNU=;
        b=kmpa9ZvYoEtSqXMQQtPg8GLO3RvZLquBUPOPpJU0Tg3ARY1brLHc3jD9Qy2ADrt2u/
         nAy88gLjfb9QY8DCEQzhfVX6OjzmxANtNs0tPmVWUjjq6VGcHP5qRUTYzqzfkfXQZut3
         IRjw/f9Pb17VnBDgxA0D+3MfbvvKsIOwGYv0PwlVkW+I3wiBgriWNBC6/jMhqoTuIFqS
         K4mQrU4b/KZzuR2IOlUCgPnjHqjjVYdW+5aMuluiOlJW8rFXP8xLpf0Bn8klYFaQtPft
         YYKlmnNEQ/2eDUqblQdWMBgbX67OcUm/1yE51qzSk4rfBbvJnpmj7eBU0/26QppApm1j
         BWRw==
X-Forwarded-Encrypted: i=1; AHgh+Rqlq/PEdCyaVM86UXZixB22f52+CCMOh2uPnSmIZxjOOVaf3vkuWDEN3uJ2pB4z3bUZfiB0ptdOF4n89omIBw==@lists.infradead.org
X-Gm-Message-State: AFuF++lzyqGdbMc/DBjrIaHxXbDF8QUw++qenXfSBnbasKKtaEVSjZCy
	05udmb/b93EHN/ChCeQia/5MCQq346QOLzuxIVLVCpK3rnF0ObKbLfSY
X-Gm-Gg: AR+sD10jBVVQziA22sruiJGq+EaG8qr7ubR32wN2arwpQScpQ2JdbVSToLAdAGIo3fk
	0HuMPVxXYUK3dqRdQmS1OCkGSbFnj++lpz87v/lA3dUx11ZTCeOnufeV3NhyW8MYeaACXKQbrIh
	gD/G1EO+hGvpNqAjK5o5+2XOTib7QLnD8iq8m3BS6Ow2w4Rb646nFjevUiDQPbvEOmZflS2gSDv
	yVBlEljKMc2iXZe9JFXDHhqYclcs8GdZARXxbhqN33Nq/eMuxKzXD69R6c96+wlQBP25DTNeHK8
	Vjy8PkhLtqizzkoYIFblMlKOroKk2wuvHIVgJkEl6RknKf7TwLqfaNpv+jjIQsNHQtaGUD9egJr
	+sN93N9O0TJNUw8AnoAQAqWgy6XUudWn38DGz4EmkQnf3ree9B1UrPXSppC26bv3dWoS+wRQpSG
	sH1xqpOEJfunlGPVSCkQyD2O47U1+P/RCpwMtnQFdbwl6q3wllzYcxIujYrjaB/z5FmPl504MtI
	IafF44upeyx3xbixqNC86dWWl3JXcKWcYjMkG6uYvbK
X-Received: by 2002:a05:6870:b289:b0:43b:516f:5f0e with SMTP id 586e51a60fabf-46448da7a64mr1225925fac.9.1787601217452;
        Mon, 24 Aug 2026 12:53:37 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-463835bcdcbsm5805896fac.18.2026.08.24.12.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:53:36 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 13/15] wifi: mt76: mt7925: configure NAN PHY setting on enable
Date: Mon, 24 Aug 2026 14:52:25 -0500
Message-ID: <20260824195227.12589-14-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824195227.12589-1-sean.wang@kernel.org>
References: <20260824195227.12589-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_125338_749867_8F3D9315 
X-CRM114-Status: GOOD (  15.21  )
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

From: Stella Liu <yu-ching.liu@mediatek.com>

Implement NAN_UNI_CMD_UPDATE_PHY_SETTING (tag=18) to configure the
BSS-level PHY parameters that the FW NAN scheduler uses when it
switches channels.

The command carries separate 2G and 5G PHY settings, each with its
own phy type, rate sets and protection modes.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  6 +-
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 74 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/nan.h   | 29 ++++++++
 3 files changed, 108 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 77420bb6f977..93de42c2bfd9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2593,8 +2593,12 @@ static int mt7925_start_nan(struct ieee80211_hw *hw,
 		goto out;
 
 	err = mt7925_nan_enable(vif, dev, conf);
-	if (err)
+	if (err) {
 		mt7925_mcu_add_bss_info(&dev->phy, NULL, link_conf, NULL, false);
+		goto out;
+	}
+
+	err = mt7925_nan_update_phy_setting(dev);
 
 out:
 	mt792x_mutex_release(dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 53736b156f69..1f695f0c4473 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -193,6 +193,80 @@ mt7925_nan_sync_rssi_tlv(struct sk_buff *skb, struct cfg80211_nan_conf *conf)
 	return 0;
 }
 
+/* FW rate set bit definitions (matches FW wlan_def_cmm.h) */
+#define NAN_RATE_SET_BIT_1M	BIT(0)
+#define NAN_RATE_SET_BIT_2M	BIT(1)
+#define NAN_RATE_SET_BIT_5_5M	BIT(2)
+#define NAN_RATE_SET_BIT_11M	BIT(3)
+#define NAN_RATE_SET_BIT_6M	BIT(6)
+#define NAN_RATE_SET_BIT_9M	BIT(7)
+#define NAN_RATE_SET_BIT_12M	BIT(8)
+#define NAN_RATE_SET_BIT_18M	BIT(9)
+#define NAN_RATE_SET_BIT_24M	BIT(10)
+#define NAN_RATE_SET_BIT_36M	BIT(11)
+#define NAN_RATE_SET_BIT_48M	BIT(12)
+#define NAN_RATE_SET_BIT_54M	BIT(13)
+
+#define NAN_RATE_SET_ALL_A	(NAN_RATE_SET_BIT_6M | NAN_RATE_SET_BIT_9M | \
+				 NAN_RATE_SET_BIT_12M | NAN_RATE_SET_BIT_18M | \
+				 NAN_RATE_SET_BIT_24M | NAN_RATE_SET_BIT_36M | \
+				 NAN_RATE_SET_BIT_48M | NAN_RATE_SET_BIT_54M)
+
+/* 5G basic: 6M+12M+24M (OFDM) */
+#define NAN_BASIC_RATE_SET_5G	(NAN_RATE_SET_BIT_6M | NAN_RATE_SET_BIT_12M | \
+				 NAN_RATE_SET_BIT_24M)
+
+/* GF_MODE_DISALLOWED = 2, RIFS_MODE_DISALLOWED = 1 */
+#define NAN_GF_MODE_DISALLOWED		2
+#define NAN_RIFS_MODE_DISALLOWED	1
+
+int mt7925_nan_update_phy_setting(struct mt792x_dev *dev)
+{
+	struct mt76_phy *mphy = &dev->mphy;
+	struct ieee80211_supported_band *sband_5g;
+	struct mt7925_nan_phy_setting *phy;
+	struct {
+		u8 rsv[4];
+		struct mt7925_nan_update_phy_setting_tlv tlv;
+	} req = {};
+
+	sband_5g = mphy->hw->wiphy->bands[NL80211_BAND_5GHZ];
+
+	req.tlv.tag = cpu_to_le16(NAN_UNI_CMD_UPDATE_PHY_SETTING);
+	req.tlv.len = cpu_to_le16(sizeof(req.tlv));
+
+	/* 2G: ERP + HT (no CCK/HR_DSSS - NAN uses OFDM only) */
+	phy = &req.tlv.phy_2g;
+	phy->phy_type_set = PHY_TYPE_BIT_ERP | PHY_TYPE_BIT_HT;
+	phy->non_ht_basic_phy_type = PHY_TYPE_ERP_INDEX;
+	phy->use_short_preamble = 1;
+	phy->use_short_slot_time = 1;
+	phy->operational_rate_set = cpu_to_le16(NAN_RATE_SET_ALL_A);
+	phy->bss_basic_rate_set = cpu_to_le16(NAN_BASIC_RATE_SET_5G);
+	phy->gf_operation_mode = cpu_to_le32(NAN_GF_MODE_DISALLOWED);
+	phy->rifs_operation_mode = cpu_to_le32(NAN_RIFS_MODE_DISALLOWED);
+
+	/* 5G: OFDM + HT + VHT (NAN_MODE_11A) */
+	phy = &req.tlv.phy_5g;
+	phy->phy_type_set = PHY_TYPE_BIT_OFDM | PHY_TYPE_BIT_HT |
+			    PHY_TYPE_BIT_VHT;
+	phy->non_ht_basic_phy_type = PHY_TYPE_OFDM_INDEX;
+	phy->use_short_preamble = 1;
+	phy->use_short_slot_time = 1;
+	phy->operational_rate_set = cpu_to_le16(NAN_RATE_SET_ALL_A);
+	phy->bss_basic_rate_set = cpu_to_le16(NAN_BASIC_RATE_SET_5G);
+	phy->gf_operation_mode = cpu_to_le32(NAN_GF_MODE_DISALLOWED);
+	phy->rifs_operation_mode = cpu_to_le32(NAN_RIFS_MODE_DISALLOWED);
+
+	/* VHT basic MCS set from sband capability */
+	if (sband_5g && sband_5g->vht_cap.vht_supported)
+		phy->vht_basic_mcs_set =
+			sband_5g->vht_cap.vht_mcs.rx_mcs_map;
+
+	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(NAN),
+				 &req, sizeof(req), true);
+}
+
 int mt7925_nan_enable(struct ieee80211_vif *vif,
 		      struct mt792x_dev *dev,
 		      struct cfg80211_nan_conf *conf)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index c9207b5c899e..1e8f5b76fc3d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -83,6 +83,7 @@ enum nan_uni_cmd_tag {
 	NAN_UNI_CMD_MANAGE_PEER_SCH_RECORD	= 12,
 	NAN_UNI_CMD_MAP_STA_RECORD		= 13,
 	NAN_UNI_CMD_UPDATE_ULW			= 16,
+	NAN_UNI_CMD_UPDATE_PHY_SETTING		= 18,
 	NAN_UNI_CMD_UPDATE_AVAILABILITY_CTRL	= 20,
 	NAN_UNI_CMD_UPDATE_PEER_CAPABILITY	= 21,
 	NAN_UNI_CMD_CHANGE_NMI_ADDRESS		= 24,
@@ -439,6 +440,34 @@ struct mt7925_nan_sched_map_sta_rec_tlv {
 	u8 reserved[2];
 } __packed __aligned(4);
 
+/* Matches FW NAN_PHY_SETTING_T (enum fields are 4 bytes on ARM) */
+struct mt7925_nan_phy_setting {
+	u8 phy_type_set;
+	u8 non_ht_basic_phy_type;
+	u8 use_short_preamble;
+	u8 use_short_slot_time;
+	__le16 operational_rate_set;
+	__le16 bss_basic_rate_set;
+	__le16 vht_basic_mcs_set;
+	u8 erp_protect_mode;
+	u8 ht_op_info1;
+	__le16 ht_op_info2;
+	__le16 ht_op_info3;
+	__le32 ht_protect_mode;
+	__le32 gf_operation_mode;
+	__le32 rifs_operation_mode;
+} __packed;
+
+/* Matches FW NAN_SCHED_CMD_UPDATE_PHY_PARAM_T */
+struct mt7925_nan_update_phy_setting_tlv {
+	__le16 tag;
+	__le16 len;
+	struct mt7925_nan_phy_setting phy_2g;
+	struct mt7925_nan_phy_setting phy_5g;
+} __packed __aligned(4);
+
+int mt7925_nan_update_phy_setting(struct mt792x_dev *dev);
+
 int mt7925_nan_enable(struct ieee80211_vif *vif,
 		      struct mt792x_dev *dev,
 		      struct cfg80211_nan_conf *conf);
-- 
2.43.0


