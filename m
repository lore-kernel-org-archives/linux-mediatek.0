Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71996CDB479
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 00:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLh1L+tMJu8LSp3EeO8J+yo8C17Dwm0vsGYlD7jYuDI=; b=FbcJbE8W+7gRBmbRfBlUuRu1S7
	dTQ3j/gI7FvAosQ9nxeAPsvB7d1y+uDeFZOcQkrWk5MZpKsdw85fe1ZZcJUYrXuczNryzUZTULm58
	lVoBT+XcxQFrSudArH0TI1D/t7fi5WhJ2XGlfqMFwI9ir8sSa8Yn+CQksAWzt171RYNoDu6qC02KS
	Y9HrAEoFO0YeC3c0JLbcbM6c21OjYlRyANj94sOnyOnRIkIJFYT3PjsCUY8lkl2j37N/a/5Saxoaj
	pUwbVzr7LgwYkL2J5aVDIJo+KcmuHiTVEkgi8kdBUBWz5452rB1AG285wMvR6xuTd9j6wqSOTFIKT
	88dSX6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXoq-00000008SfY-1apl;
	Thu, 25 Jun 2026 00:19:48 +0000
Received: from mail-pg1-f175.google.com ([209.85.215.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXon-00000008Sdy-2w2w
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 00:19:46 +0000
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c8894387780so610560a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Jun 2026 17:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782346785; x=1782951585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mLh1L+tMJu8LSp3EeO8J+yo8C17Dwm0vsGYlD7jYuDI=;
        b=OO5X0If7h02ZA5ylAEfsh10JlUmOVeJmTBJy1cle8Gt3dCx1ExDHE2HB4hwNi73hze
         6FaSl4/oT84D2zPtrP3w9yKJaCZcStiYFYVcShgWprIZGkgvcv1VX30LpRmsXeGt+Cfi
         Ttx04mJgPEj8polGftjt7oDBOEZoQFqACg1OlNZ3Kvw02jVu9342z1mzk4bi4t1EqH4e
         4FJyunhI4lo5Kq4gUCTJ7PrhFTlLfjePbJoV3XsMs6hZsJWtysLaBgrQyuEhMZgdDoIy
         V7ipBhONzRSPS3KA4iIlh34hp1FuNvveStB0MPz5aOSfcLC4yFkDsLj0x/doandQJUuh
         jeaw==
X-Forwarded-Encrypted: i=1; AFNElJ+4o8miEPUUZhNGGnEDhhqRl16w4AMJDQF+uXDQxb1sznQMHjQtCQRrLHaqlPG7ak66DNY++OLkf7CU1iq21Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWPd5Jwxpw9cDIz20zw7NsDuCS5MVwXP8Oi8ifJx766NxizXng
	rtlPbMZuJdNcLXh2rUngywLU/PGjZkUi2nd+EBy4BLZJpQt8QKS4tUZv
X-Gm-Gg: AfdE7cnc2CKy0iBuAT+vmSqj8kGJZd1dO3Em/8scIQcZc/PcfySPHP/CQZ/egfsrX7w
	FQ6xI3ZaO1+Oo5F/8OmEA5bQCZ5E9dSqIupJuAJOLHkQ6sixOFFYa+s1A49TcGRZpJmTlQmQdZ+
	FDfqRzi2BoXf03saq6rIkQekkkECQX5KX3dIE5TD0GZkbdumEF/oiT/WbgpYeYGAGNGYkTVS3tH
	5CsMSd5cGBFdnVXXEDTsHj4sGRqlRKMtDFWvJaayEqIy2AlpIY/k4jg4A1bdS8bGg4UwS2WrSHK
	CXBWOKkLH5GGzMFqJI+IkrRf45NYT5MZSZ3kKiMTNIiVwc5o5jhkj3TVokLTwD/tpAPYtCYsXAd
	OABWwERgqchhqd0nSyCIqZGa8qa5TlIx/Ns/72ZTOA+U9cQqBYLUACaQBDMKfhJqO2b/XRxWpOj
	L4cNUOS2ArveLn9h1oer+if+7GHZNBRIfbXEkkoLBbTcB/H9COG2STxQAxXU3vXwI19RHHmQKEW
	hUBp2gp20XHwxdUxbmi70QG0yxbURoDfEonSueE
X-Received: by 2002:a05:6a20:9f48:b0:3b3:486f:f2d1 with SMTP id adf61e73a8af0-3bd4abffc73mr359802637.3.1782346784814;
        Wed, 24 Jun 2026 17:19:44 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bc1e0d10sm586839a12.21.2026.06.24.17.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 17:19:44 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: chengwei.yu@mediatek.com,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 5/9] wifi: mt76: mt7925: add NAN MCU handling
Date: Wed, 24 Jun 2026 19:18:30 -0500
Message-ID: <20260625001834.475094-6-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625001834.475094-1-sean.wang@kernel.org>
References: <20260625001834.475094-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_171945_747402_C240F487 
X-CRM114-Status: GOOD (  13.97  )
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

Route NAN MCU responses and unsolicited events through the mt7925 MCU
path, and handle NAN-specific BSS and station TLVs.

Co-developed-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
Co-developed-by: Jeremy Yu <chengwei.yu@mediatek.com>
Signed-off-by: Jeremy Yu <chengwei.yu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 99 ++++++++++++++++---
 1 file changed, 84 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index cff91b4eeac6..f58f24583453 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -7,10 +7,17 @@
 #include "regd.h"
 #include "mcu.h"
 #include "mac.h"
+#include "nan.h"
 
 #define MT_STA_BFER			BIT(0)
 #define MT_STA_BFEE			BIT(1)
 
+static bool mt7925_vif_is_nan(struct ieee80211_vif *vif)
+{
+	return vif->type == NL80211_IFTYPE_NAN ||
+	       vif->type == NL80211_IFTYPE_NAN_DATA;
+}
+
 int mt7925_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 			      struct sk_buff *skb, int seq)
 {
@@ -37,7 +44,8 @@ int mt7925_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 		   cmd == MCU_UNI_CMD(BSS_INFO_UPDATE) ||
 		   cmd == MCU_UNI_CMD(STA_REC_UPDATE) ||
 		   cmd == MCU_UNI_CMD(OFFLOAD) ||
-		   cmd == MCU_UNI_CMD(SUSPEND)) {
+		   cmd == MCU_UNI_CMD(SUSPEND) ||
+		   cmd == MCU_UNI_CMD(NAN)) {
 		struct mt7925_mcu_uni_event *event;
 
 		skb_pull(skb, sizeof(*rxd));
@@ -631,6 +639,9 @@ mt7925_mcu_uni_rx_unsolicited_event(struct mt792x_dev *dev,
 		dev->fw_assert = true;
 		mt76_connac_mcu_coredump_event(&dev->mt76, skb, &dev->coredump);
 		return;
+	case MCU_UNI_EVENT_NAN:
+		mt7925_nan_mcu_event(dev, skb);
+		break;
 	default:
 		break;
 	}
@@ -1835,9 +1846,20 @@ mt7925_mcu_sta_phy_tlv(struct sk_buff *skb,
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_PHY, sizeof(*phy));
 	phy = (struct sta_rec_phy *)tlv;
-	phy->phy_type = mt76_connac_get_phy_mode_v2(mvif->phy->mt76, vif,
-						    chandef->chan->band,
-						    link_sta);
+
+	if (mt7925_vif_is_nan(vif)) {
+		enum nl80211_band band = chandef->chan ? chandef->chan->band
+						       : NL80211_BAND_2GHZ;
+		phy->phy_type = PHY_TYPE_BIT_OFDM | PHY_TYPE_BIT_ERP;
+		phy->phy_type |= mt76_connac_get_phy_mode_v2(mvif->phy->mt76, vif,
+							     band,
+							     link_sta);
+	} else {
+		phy->phy_type = mt76_connac_get_phy_mode_v2(mvif->phy->mt76, vif,
+							    chandef->chan->band,
+							    link_sta);
+	}
+
 	phy->basic_rate = cpu_to_le16((u16)link_conf->basic_rates);
 	if (link_sta->ht_cap.ht_supported) {
 		af = link_sta->ht_cap.ampdu_factor;
@@ -1910,11 +1932,15 @@ mt7925_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb,
 	mconf = mt792x_vif_to_link(mvif, link_sta->link_id);
 	chandef = mconf->mt76.ctx ? &mconf->mt76.ctx->def :
 				    &link_conf->chanreq.oper;
-	band = chandef->chan->band;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_RA, sizeof(*ra_info));
 	ra_info = (struct sta_rec_ra_info *)tlv;
 
+	if (mt7925_vif_is_nan(vif))
+		band = chandef->chan ? chandef->chan->band : NL80211_BAND_2GHZ;
+	else
+		band = chandef->chan->band;
+
 	supp_rates = link_sta->supp_rates[band];
 	if (band == NL80211_BAND_2GHZ)
 		supp_rates = FIELD_PREP(RA_LEGACY_OFDM, supp_rates >> 4) |
@@ -2561,6 +2587,29 @@ mt7925_get_phy_mode_ext(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	return mode;
 }
 
+static void
+mt7925_mcu_bss_basic_tlv_nan(struct mt76_phy *phy,
+			     struct ieee80211_vif *vif,
+			     struct ieee80211_link_sta *link_sta,
+			     struct mt76_connac_bss_basic_tlv *basic_req)
+{
+	u8 mode_2g, mode_5g;
+
+	mode_2g = mt7925_get_phy_mode_ext(phy, vif, NL80211_BAND_2GHZ,
+					  link_sta);
+	mode_5g = mt7925_get_phy_mode_ext(phy, vif, NL80211_BAND_5GHZ,
+					  link_sta);
+	basic_req->phymode_ext = mode_2g | mode_5g;
+
+	basic_req->nonht_basic_phy = cpu_to_le16(PHY_TYPE_ERP_INDEX);
+
+	mode_2g = mt76_connac_get_phy_mode(phy, vif, NL80211_BAND_2GHZ,
+					   link_sta);
+	mode_5g = mt76_connac_get_phy_mode(phy, vif, NL80211_BAND_5GHZ,
+					   link_sta);
+	basic_req->phymode = (mode_2g | mode_5g) & ~PHY_MODE_B;
+}
+
 static void
 mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 			 struct ieee80211_bss_conf *link_conf,
@@ -2575,7 +2624,7 @@ mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
 	struct cfg80211_chan_def *chandef = ctx ? &ctx->def :
 						  &link_conf->chanreq.oper;
-	enum nl80211_band band = chandef->chan->band;
+	enum nl80211_band band = NL80211_BAND_2GHZ;
 	struct mt76_connac_bss_basic_tlv *basic_req;
 	struct tlv *tlv;
 	int conn_type;
@@ -2588,16 +2637,25 @@ mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 						      mconf->mt76.omac_idx;
 	basic_req->hw_bss_idx = idx;
 
-	basic_req->phymode_ext = mt7925_get_phy_mode_ext(phy, vif, band,
-							 link_sta);
+	if (mt7925_vif_is_nan(vif)) {
+		mt7925_mcu_bss_basic_tlv_nan(phy, vif, link_sta, basic_req);
+	} else {
+		band = chandef->chan->band;
+		basic_req->phymode_ext = mt7925_get_phy_mode_ext(phy, vif, band,
+								 link_sta);
 
-	if (band == NL80211_BAND_2GHZ)
-		basic_req->nonht_basic_phy = cpu_to_le16(PHY_TYPE_ERP_INDEX);
-	else
-		basic_req->nonht_basic_phy = cpu_to_le16(PHY_TYPE_OFDM_INDEX);
+		if (band == NL80211_BAND_2GHZ)
+			basic_req->nonht_basic_phy =
+				cpu_to_le16(PHY_TYPE_ERP_INDEX);
+		else
+			basic_req->nonht_basic_phy =
+				cpu_to_le16(PHY_TYPE_OFDM_INDEX);
+
+		memcpy(basic_req->bssid, link_conf->bssid, ETH_ALEN);
+		basic_req->phymode = mt76_connac_get_phy_mode(phy, vif, band,
+							      link_sta);
+	}
 
-	memcpy(basic_req->bssid, link_conf->bssid, ETH_ALEN);
-	basic_req->phymode = mt76_connac_get_phy_mode(phy, vif, band, link_sta);
 	basic_req->bcn_interval = cpu_to_le16(link_conf->beacon_int);
 	basic_req->dtim_period = link_conf->dtim_period;
 	basic_req->bmc_tx_wlan_idx = cpu_to_le16(bmc_tx_wlan_idx);
@@ -2630,6 +2688,11 @@ mt7925_mcu_bss_basic_tlv(struct sk_buff *skb,
 		basic_req->conn_type = cpu_to_le32(CONNECTION_IBSS_ADHOC);
 		basic_req->active = true;
 		break;
+	case NL80211_IFTYPE_NAN:
+	case NL80211_IFTYPE_NAN_DATA:
+		basic_req->conn_type = cpu_to_le32(CONNECTION_NAN);
+		basic_req->active = enable;
+		break;
 	default:
 		WARN_ON(1);
 		break;
@@ -2688,10 +2751,11 @@ mt7925_mcu_bss_bmc_tlv(struct sk_buff *skb, struct mt792x_phy *phy,
 		       struct ieee80211_chanctx_conf *ctx,
 		       struct ieee80211_bss_conf *link_conf)
 {
+	struct ieee80211_vif *vif = link_conf->vif;
 	struct cfg80211_chan_def *chandef = ctx ? &ctx->def :
 						  &link_conf->chanreq.oper;
 	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
-	enum nl80211_band band = chandef->chan->band;
+	enum nl80211_band band = NL80211_BAND_2GHZ;
 	struct mt76_vif_link *mvif = &mconf->mt76;
 	struct bss_rate_tlv *bmc;
 	struct tlv *tlv;
@@ -2702,6 +2766,11 @@ mt7925_mcu_bss_bmc_tlv(struct sk_buff *skb, struct mt792x_phy *phy,
 
 	bmc = (struct bss_rate_tlv *)tlv;
 
+	if (mt7925_vif_is_nan(vif))
+		band = chandef->chan ? chandef->chan->band : NL80211_BAND_2GHZ;
+	else
+		band = chandef->chan->band;
+
 	if (band == NL80211_BAND_2GHZ)
 		bmc->basic_rate = cpu_to_le16(HR_DSSS_ERP_BASIC_RATE);
 	else
-- 
2.43.0


