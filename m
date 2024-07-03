Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C292C2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/n7VZ7fj0o/3ai4SZ3SKcdBS97sLOgxIRvgNtfo2Zc=; b=bHWBGdlvxeyKkxtfECTD6TCopQ
	7b7ZesmNMiVYdjBQtPV7jZIrk26mqWotRwep1w61SPcVAIeKCgla8oN+cC1a1i46OalKpzsad4iCo
	pj9F0M8DETDj9immxRpVo14J8+pRFMi9MVtcFicxRwm4JN1LOXLDbiUtHVbcQst+RWLm+HZanoMr0
	7GAIIrJceIi7K8/T4FpHl2uDNaTovZ0klWxNt4FSuCFwboab+/gnfa2anIuv7ulmhELHNwCdcu9HC
	nQvG8MwGflIdPwZZfvvgMyUaH6YyZFeG/X3fiIWZItWExm10nr++qaFei3iW9n6rRDJ2qiqdO1yS9
	uhPCpr1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7la-0000000BXWK-0DJA;
	Wed, 03 Jul 2024 21:43:54 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lX-0000000BXUb-1xVQ
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:52 +0000
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d565b869d9so8229b6e.0
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720043030; x=1720647830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/n7VZ7fj0o/3ai4SZ3SKcdBS97sLOgxIRvgNtfo2Zc=;
        b=j0z4EHp+/nhemO+Qz2wFE4uRguM8+xQwE5m2Ettry/irbK7D1bqcL8/bFNgMymEvaW
         MK/5J4PYZxWQv2J5jA0e1ShYxrb4vkHVzTBjkp4v2XGNEnu9PG6m4C8CZg0KsOYi/2pZ
         a/maKN41kzlxJBtdWNHkKnlFMZNz0z+Zitjrpyx38S6FZ00a2sH7x8O29yhd2sVktTA1
         1v1W0LeQ4guhmTjJgS/y7lzoc4TDeJSBZDEyny/kxKL3l7akNpu+voNt+FnjS5y4aBQg
         MwajSu7HYeSjw8mw9QeQ6cM44M+bSexVWPS5kwfEbSUq+yuez9qS85l8SxMHUc4AnxS7
         DhuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6WSKjoZaOrkQU2S2UlA+geXhE0FXcJhnrDtn2wToOumkg+VGz4JftGm16WPnxvUrYqX4PFWWfEXF2GP2yIJZi+pkUsUUl8jjRUdcpwVI8HMRc
X-Gm-Message-State: AOJu0YzAQ8I+wfFIjdJubK8nPS7F240dkkjKQ+i2pDUUX5/17UNVlo7+
	51ESTFuKLedPmtrEYc46rCtTm6Jt2NCNhWZLb6p8eWlbw7UtdtiGtEcMVq7X
X-Google-Smtp-Source: AGHT+IE4LsxQwXh0EZDYiJMTt6PW30ChD/EOSWZ2xrYLO5k/bhg54hR3h6oqAdq7s9sb9spqCpytDg==
X-Received: by 2002:a9d:65c5:0:b0:700:ca13:30bc with SMTP id 46e09a7af769-70207763b58mr13703746a34.2.1720043030407;
        Wed, 03 Jul 2024 14:43:50 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:48 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 29/29] wifi: mt76: mt7925: enabling MLO when the firmware supports it
Date: Wed,  3 Jul 2024 14:42:34 -0700
Message-Id: <fb549a3b3a20995c64d227fb3db75a2fe6f318b1.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144351_536145_51F1E78B 
X-CRM114-Status: GOOD (  15.40  )
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

From: Sean Wang <sean.wang@mediatek.com>

Register MLD capability for the firmware supporting MLO.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  1 +
 .../net/wireless/mediatek/mt76/mt7925/init.c  |  6 ++++
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 29 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 20 +++++++++++++
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  1 +
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  2 ++
 6 files changed, 59 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index d6882c9fd6bc..4242d436de26 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1402,6 +1402,7 @@ enum {
 	MT_NIC_CAP_WFDMA_REALLOC,
 	MT_NIC_CAP_6G,
 	MT_NIC_CAP_CHIP_CAP = 0x20,
+	MT_NIC_CAP_EML_CAP = 0x22,
 };
 
 #define UNI_WOW_DETECT_TYPE_MAGIC		BIT(0)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index c4cbc8976046..039949b344b9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -179,6 +179,12 @@ static void mt7925_init_work(struct work_struct *work)
 	mt76_set_stream_caps(&dev->mphy, true);
 	mt7925_set_stream_he_eht_caps(&dev->phy);
 
+	ret = mt7925_init_mlo_caps(&dev->phy);
+	if (ret) {
+		dev_err(dev->mt76.dev, "MLO init failed\n");
+		return;
+	}
+
 	ret = mt76_register_device(&dev->mt76, true, mt76_rates,
 				   ARRAY_SIZE(mt76_rates));
 	if (ret) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 13b40032cd72..213331a92166 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -236,6 +236,35 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl80211_band band,
 	eht_nss->bw._160.rx_tx_mcs13_max_nss = val;
 }
 
+int mt7925_init_mlo_caps(struct mt792x_phy *phy)
+{
+	struct wiphy *wiphy = phy->mt76->hw->wiphy;
+	static const u8 ext_capa_sta[] = {
+		[7] = WLAN_EXT_CAPA8_OPMODE_NOTIF,
+	};
+	static struct wiphy_iftype_ext_capab ext_capab[] = {
+		{
+			.iftype = NL80211_IFTYPE_STATION,
+			.extended_capabilities = ext_capa_sta,
+			.extended_capabilities_mask = ext_capa_sta,
+			.extended_capabilities_len = sizeof(ext_capa_sta),
+		},
+	};
+
+	if (!(phy->chip_cap & MT792x_CHIP_CAP_MLO_EVT_EN))
+		return 0;
+
+	ext_capab[0].eml_capabilities = phy->eml_cap;
+	ext_capab[0].mld_capa_and_ops =
+		u16_encode_bits(1, IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+
+	wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO;
+	wiphy->iftype_ext_capab = ext_capab;
+	wiphy->num_iftype_ext_capab = ARRAY_SIZE(ext_capab);
+
+	return 0;
+}
+
 static void
 __mt7925_set_stream_he_eht_caps(struct mt792x_phy *phy,
 				struct ieee80211_supported_band *sband,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 829d87d4eb95..d4b020b50be1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -749,6 +749,20 @@ mt7925_mcu_parse_phy_cap(struct mt792x_dev *dev, char *data)
 	dev->has_eht = cap->eht;
 }
 
+static void
+mt7925_mcu_parse_eml_cap(struct mt792x_dev *dev, char *data)
+{
+	struct mt7925_mcu_eml_cap {
+		u8 rsv[4];
+		__le16 eml_cap;
+		u8 rsv2[6];
+	} __packed * cap;
+
+	cap = (struct mt7925_mcu_eml_cap *)data;
+
+	dev->phy.eml_cap = le16_to_cpu(cap->eml_cap);
+}
+
 static int
 mt7925_mcu_get_nic_capability(struct mt792x_dev *dev)
 {
@@ -803,6 +817,12 @@ mt7925_mcu_get_nic_capability(struct mt792x_dev *dev)
 		case MT_NIC_CAP_PHY:
 			mt7925_mcu_parse_phy_cap(dev, tlv->data);
 			break;
+		case MT_NIC_CAP_CHIP_CAP:
+			memcpy(&dev->phy.chip_cap, (void *)skb->data, sizeof(u64));
+			break;
+		case MT_NIC_CAP_EML_CAP:
+			mt7925_mcu_parse_eml_cap(dev, tlv->data);
+			break;
 		default:
 			break;
 		}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index 4c0ecae8e49b..d51cc8a02b9e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -235,6 +235,7 @@ void mt7925_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 			 struct sk_buff *skb, u32 *info);
 void mt7925_stats_work(struct work_struct *work);
 void mt7925_set_stream_he_eht_caps(struct mt792x_phy *phy);
+int mt7925_init_mlo_caps(struct mt792x_phy *phy);
 int mt7925_init_debugfs(struct mt792x_dev *dev);
 
 int mt7925_mcu_set_beacon_filter(struct mt792x_dev *dev,
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 5ede24116748..30635aeba363 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -27,6 +27,7 @@
 
 #define MT792x_CHIP_CAP_CLC_EVT_EN BIT(0)
 #define MT792x_CHIP_CAP_RSSI_NOTIFY_EVT_EN BIT(1)
+#define MT792x_CHIP_CAP_MLO_EVT_EN BIT(2)
 
 /* NOTE: used to map mt76_rates. idx may change if firmware expands table */
 #define MT792x_BASIC_RATES_TBL	11
@@ -163,6 +164,7 @@ struct mt792x_phy {
 #endif
 	void *clc[MT792x_CLC_MAX_NUM];
 	u64 chip_cap;
+	u16 eml_cap;
 
 	struct work_struct roc_work;
 	struct timer_list roc_timer;
-- 
2.25.1


