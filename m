Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50341C61CE2
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 19:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2CdWedcFXTOLIczD0jNEGO3XZoMTmOxEBl5WwUArUU=; b=sOUKna0sfyjrSO86YGpi6X1Iwr
	jUYH94cqJ1Mirjrz5TeNE+TIdPbCE1gh7WVEgpbEfydWEGIsQpZnuHuMFPS1JQF8oxZvtI+VIejFL
	IX/w4ctn0RI5H1ztaZZd0fo7TF0M9mT7B+drSjR4Ni0r23v64fcKJM24i/yN9ZXVI0wt5Y77kS8pL
	GmpLdvKllqaE6R5KkURvb7b9RToLOU6xBRPCMdmAmJr7AQz/OrD04mOA1gj/Rl6vIZBVDmqYEcp6s
	ONCWy6bXeHh1fYGSz6GmM31GJ3lrk3VXKdjNERTUxWoKyr3/jkyoYEWb1Az0O4oFdTOAfc3C8QxNh
	yids9HBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajS-0000000HKUj-0bVV;
	Mon, 24 Aug 2026 19:53:22 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajQ-0000000HKTa-1n9Z
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 19:53:21 +0000
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7f0167e59a3so2970411a34.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 12:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601199; x=1788205999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E2CdWedcFXTOLIczD0jNEGO3XZoMTmOxEBl5WwUArUU=;
        b=nmG5hsUfxRECBO47ky1LofLe+ayyEQAcYIfOYanl4+nyeM6AB+6wIeFSSBlv/Q8vwh
         a2J+aZPfUhcwGreMfhAlPLw6CAelCQRnFvF+BQAvHtqOvUlPdwjdfdtlMznyDT/AGaG1
         KDuSUVpnEAYNDu4xmBQHhuM9vg0uP4CZCpLKTWvVLYQxU85c5QQUivh/nmLgP7s7CFX3
         U+oKmxkKhUz39bp+G7LSCQQJbfyxjV82ZuYb/dRLwkbvcN9s5PP+btEDZU/VC0XPLFZt
         Whfxl+D7w7R83P9MnyrNnWhFmr69Pn1rd5zTtFajblT8PPDpcnNU5/3V/JKo8R8xhwK8
         5R7w==
X-Forwarded-Encrypted: i=1; AHgh+RrQwN7hWIt/J+rhlxyazb4i/4B643iYyDU0GaNcgVaSy9zpKMTbeNYD3qch7P4zkmgZhyq2WLZRbaJcJhmIjA==@lists.infradead.org
X-Gm-Message-State: AFuF++mXylV18jvF7OsQikvP1UZiiVc08dngH9c3NCnsYAkQI+szZ+UJ
	yBeB09YCa4HoDK1nlR/D4RfKhvJjSyjlTaqlVXGS6wCk3dAPsB+MJRXb
X-Gm-Gg: AR+sD10Coh8/FqNIgDLjbsY4BmxXhkn8PrFYzuRFWREHRHx5jKkWQU+eCmVnVV6JQf2
	3HEzBOe4GvpV0RPtHEaD7+NTXYSE7bizoZCgPBhEJ4YiIjaDfNYNWHTgzRBT2k/x/maGWqSOng4
	/sVJtexw2Ysj06z8l+Vl76n1IaMKrRinz/DDjhHXfTUfUvZhTsDqwIBH3OqjwM0/mrnmxvp8V7A
	SwJdDIFkuxp8k4/gI/7S9F/h1XkLDZEBv0b1oDLRGaJuM+abCLS+JZY7PzlobKnilQgA+0fvIz4
	pG6Z38QlQ2v8pCBlIsvFzsvfe8sBe92p9Tz1FNkjygQE0mkyekuu21HZ/bmKKkSFmQc2VoBi/HS
	qvfvseZGS8gZHX8KHEUfHBot1Oeriwo2XB6luIqANU4t8gRCOywPmsudrzS/nnBVXCDHJavLYKV
	N4jjjjtDbu6WNM4yek5UlgKYXfVONRucIyndsNNCBqg3WLUMVVxJCC21gWGZpIzbPNK+z8XF0M/
	lgclpEaoTe/7Ky4M5eTRz0OA/b0eI6sMR3TnM3jhvoi
X-Received: by 2002:a05:6820:8687:b0:6ac:98de:f087 with SMTP id 006d021491bc7-6b16b26bb26mr14080205eaf.12.1787601199259;
        Mon, 24 Aug 2026 12:53:19 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-463835bcdcbsm5805896fac.18.2026.08.24.12.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:53:18 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 08/15] wifi: mt76: mt7925: share TLV setup for NAN enable command
Date: Mon, 24 Aug 2026 14:52:20 -0500
Message-ID: <20260824195227.12589-9-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824195227.12589-1-sean.wang@kernel.org>
References: <20260824195227.12589-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_125320_483574_517013B7 
X-CRM114-Status: GOOD (  15.49  )
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

Refactor mt7925_nan_enable() to build the MCU command from separate
TLVs via skb instead of inline fields in the enable request struct.
The cluster ID, DW interval, discovery beacon interval and RSSI
threshold settings are now shared with mt7925_nan_change_configure()
through the common TLV helpers, avoiding duplicated setup code.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 190 +++++++-----------
 .../net/wireless/mediatek/mt76/mt7925/nan.h   |   6 +
 2 files changed, 77 insertions(+), 119 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index e6d6af4fc681..527cdb3a4ed7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -42,63 +42,6 @@ static void mt7925_nan_set_5g_channel(struct mt792x_dev *dev,
 	req->channel_5g_val = cpu_to_le32(ch5g);
 }
 
-static void mt7925_nan_set_cluster_id(struct mt7925_nan_enable_req_tlv *req,
-				      const u8 *cluster_id)
-{
-	if (!cluster_id)
-		return;
-
-	req->cluster_high = cpu_to_le16(cluster_id[4] | cluster_id[5] << 8);
-	req->cluster_low = cpu_to_le16((u16)cluster_id[3]);
-}
-
-static void mt7925_nan_set_dw_interval(struct mt7925_nan_enable_req_tlv *req,
-				       struct cfg80211_nan_conf *conf)
-{
-	if (conf->band_cfgs[NL80211_BAND_2GHZ].awake_dw_interval > 0) {
-		req->config_dw.config_2dot4g_dw_band = 1;
-		req->config_dw.dw_2dot4g_interval_val =
-			cpu_to_le32(conf->band_cfgs[NL80211_BAND_2GHZ].awake_dw_interval);
-	}
-
-	if (conf->band_cfgs[NL80211_BAND_5GHZ].awake_dw_interval > 0) {
-		req->config_dw.config_5g_dw_band = 1;
-		req->config_dw.dw_5g_interval_val =
-			cpu_to_le32(conf->band_cfgs[NL80211_BAND_5GHZ].awake_dw_interval);
-	}
-}
-
-static void mt7925_nan_set_disc_beacon(struct mt7925_nan_enable_req_tlv *req,
-				       struct cfg80211_nan_conf *conf)
-{
-	if (conf->discovery_beacon_interval > 0) {
-		req->config_2dot4g_beacons = true;
-		req->beacon_2dot4g_val = conf->discovery_beacon_interval;
-	}
-}
-
-static void mt7925_nan_set_rssi_thresholds(struct mt7925_nan_enable_req_tlv *req,
-					   struct cfg80211_nan_conf *conf)
-{
-	if (conf->band_cfgs[NL80211_BAND_2GHZ].chan) {
-		req->config_2dot4g_rssi_close = 1;
-		req->rssi_close_2dot4g_val =
-			abs(conf->band_cfgs[NL80211_BAND_2GHZ].rssi_close);
-		req->config_2dot4g_rssi_middle = 1;
-		req->rssi_middle_2dot4g_val =
-			abs(conf->band_cfgs[NL80211_BAND_2GHZ].rssi_middle);
-	}
-
-	if (conf->band_cfgs[NL80211_BAND_5GHZ].chan) {
-		req->config_5g_rssi_close = 1;
-		req->rssi_close_5g_val =
-			abs(conf->band_cfgs[NL80211_BAND_5GHZ].rssi_close);
-		req->config_5g_rssi_middle = 1;
-		req->rssi_middle_5g_val =
-			abs(conf->band_cfgs[NL80211_BAND_5GHZ].rssi_middle);
-	}
-}
-
 static void mt7925_nan_set_scan_params(struct mt7925_nan_enable_req_tlv *req,
 				       struct cfg80211_nan_conf *conf)
 {
@@ -132,68 +75,6 @@ mt7925_nan_update_conf(struct mt792x_vif *mvif,
 	memcpy(mvif->nan.conf.cluster_id, conf->cluster_id, ETH_ALEN);
 }
 
-int mt7925_nan_enable(struct ieee80211_vif *vif,
-		      struct mt792x_dev *dev,
-		      struct cfg80211_nan_conf *conf)
-{
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct mt76_dev *mdev = &dev->mt76;
-	struct {
-		u8 rsv[4];
-		struct mt7925_nan_enable_req_tlv nan_req_tlv;
-	} nan_cmd = {
-		.rsv = { 0 },
-		.nan_req_tlv = {
-			.tag = cpu_to_le16(NAN_UNI_CMD_ENABLE_REQUEST),
-			.len = cpu_to_le16(sizeof(struct mt7925_nan_enable_req_tlv)),
-			.config_random_factor_force = 0,
-			.random_factor_force_val = 0,
-			.config_hop_count_force = 0,
-			.hop_count_force_val = 0,
-		},
-	};
-	struct mt7925_nan_enable_req_tlv *p_nan_req_tlv = &nan_cmd.nan_req_tlv;
-	int ret;
-
-	if (!vif || !dev || !conf)
-		return -EINVAL;
-
-	p_nan_req_tlv->master_pref = conf->master_pref;
-
-	mt7925_nan_set_5g_channel(dev, p_nan_req_tlv, conf);
-	mt7925_nan_set_cluster_id(p_nan_req_tlv, conf->cluster_id);
-	mt7925_nan_set_dw_interval(p_nan_req_tlv, conf);
-	mt7925_nan_set_disc_beacon(p_nan_req_tlv, conf);
-	mt7925_nan_set_rssi_thresholds(p_nan_req_tlv, conf);
-	mt7925_nan_set_scan_params(p_nan_req_tlv, conf);
-
-	mt7925_nan_update_conf(mvif, conf);
-
-	ret = mt76_mcu_send_msg(mdev, MCU_UNI_CMD(NAN), &nan_cmd, sizeof(nan_cmd), true);
-
-	return ret;
-}
-
-int mt7925_nan_disable(struct ieee80211_vif *vif, struct mt792x_dev *dev)
-{
-	struct mt76_dev *mdev = &dev->mt76;
-	struct {
-		u8 rsv[4];
-		struct tlv nan_dis_tlv;
-	} nan_cmd = {
-		.rsv = { 0 },
-		.nan_dis_tlv = {
-			.tag = cpu_to_le16(NAN_UNI_CMD_DISABLE_REQUEST),
-			.len = cpu_to_le16(sizeof(struct tlv)),
-		},
-	};
-
-	if (!dev)
-		return -EINVAL;
-
-	return mt76_mcu_send_msg(mdev, MCU_UNI_CMD(NAN), &nan_cmd, sizeof(nan_cmd), true);
-}
-
 static int
 mt7925_nan_mp_tlv(struct sk_buff *skb, u8 master_pref)
 {
@@ -312,6 +193,77 @@ mt7925_nan_sync_rssi_tlv(struct sk_buff *skb, struct cfg80211_nan_conf *conf)
 	return 0;
 }
 
+int mt7925_nan_enable(struct ieee80211_vif *vif,
+		      struct mt792x_dev *dev,
+		      struct cfg80211_nan_conf *conf)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt76_dev *mdev = &dev->mt76;
+	struct mt7925_nan_common_hdr *hdr;
+	struct mt7925_nan_enable_req_tlv *req;
+	struct sk_buff *skb;
+
+	if (!vif || !dev || !conf)
+		return -EINVAL;
+
+	skb = mt76_mcu_msg_alloc(mdev, NULL, MT7925_NAN_ENABLE_MAX_SIZE);
+	if (!skb)
+		return -ENOMEM;
+
+	hdr = (struct mt7925_nan_common_hdr *)skb_put(skb, sizeof(*hdr));
+	memset(hdr, 0, sizeof(*hdr));
+
+	/* Set cluster id before joining cluster */
+	if (mt7925_nan_cluster_id_tlv(skb, conf->cluster_id)) {
+		dev_kfree_skb(skb);
+		return -ENOMEM;
+	}
+
+	/* NAN enable request tlv */
+	req = (struct mt7925_nan_enable_req_tlv *)
+		mt76_connac_mcu_add_tlv(skb, NAN_UNI_CMD_ENABLE_REQUEST,
+					sizeof(*req));
+	if (!req) {
+		dev_kfree_skb(skb);
+		return -ENOMEM;
+	}
+
+	req->master_pref = conf->master_pref;
+
+	mt7925_nan_set_5g_channel(dev, req, conf);
+	mt7925_nan_set_scan_params(req, conf);
+
+	if (mt7925_nan_dw_tlv(skb, conf) ||
+	    mt7925_nan_sync_rssi_tlv(skb, conf)) {
+		dev_kfree_skb(skb);
+		return -ENOMEM;
+	}
+
+	mt7925_nan_update_conf(mvif, conf);
+
+	return mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(NAN), true);
+}
+
+int mt7925_nan_disable(struct ieee80211_vif *vif, struct mt792x_dev *dev)
+{
+	struct mt76_dev *mdev = &dev->mt76;
+	struct {
+		u8 rsv[4];
+		struct tlv nan_dis_tlv;
+	} nan_cmd = {
+		.rsv = { 0 },
+		.nan_dis_tlv = {
+			.tag = cpu_to_le16(NAN_UNI_CMD_DISABLE_REQUEST),
+			.len = cpu_to_le16(sizeof(struct tlv)),
+		},
+	};
+
+	if (!dev)
+		return -EINVAL;
+
+	return mt76_mcu_send_msg(mdev, MCU_UNI_CMD(NAN), &nan_cmd, sizeof(nan_cmd), true);
+}
+
 int mt7925_nan_change_configure(struct ieee80211_vif *vif,
 				struct mt792x_dev *dev,
 				struct cfg80211_nan_conf *conf)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index fab10b829eaa..8ddb0a6d73b5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -28,6 +28,12 @@
 #define NAN_MAX_CONN_CFG		8
 #define NAN_MAX_NDP_CXT			4
 
+#define MT7925_NAN_ENABLE_MAX_SIZE					\
+	(sizeof(struct mt7925_nan_common_hdr) +				\
+	 sizeof(struct mt7925_nan_enable_req_tlv) +			\
+	 sizeof(struct mt7925_nan_dw_interval_tlv) +			\
+	 sizeof(struct mt7925_nan_cluster_id_tlv) +			\
+	 sizeof(struct mt7925_nan_sync_rssi_tlv))
 #define MT7925_NAN_CONF_MAX_SIZE					\
 	(sizeof(struct mt7925_nan_common_hdr) +				\
 	 sizeof(struct mt7925_nan_master_preference_tlv) +		\
-- 
2.43.0


