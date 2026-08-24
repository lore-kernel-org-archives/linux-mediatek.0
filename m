Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FFEC5DF81
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 19:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwmqByqgOjaj+boW8Byl/XAhEHD4P6qPLmf+pApdFow=; b=Rb+sOi5rBaoqBk36Ya8mDcchHV
	2aeZc46rAzsDWMlkOtFxymr2Aoote+3Gj4czg25CihpORECCyl1jJMOpifyf4kUkqjxgewm3POny6
	KV7rdlQODxc4JzC/qxhG23mZAQEoZuieMiy4Cr0p3NcZOmOU/WLwAF+H8+n+QpKMezIutk7kSmWH7
	kZWym7Z1y6WMJJKi3p4fCogotQsbsBCFvHmhxgPWZZPonoTG+lK8QuaJyiBGNzd2lz4FVx79sP+Hz
	aVsw4n7xKRrvjrqWBalKVThdiqi+8Lxs+i4DHSAasPrrDY5zfBysuHiXpHEzz8R6Qdv2F3eSlI97S
	+ug8K3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajr-0000000HKjg-2vGC;
	Mon, 24 Aug 2026 19:53:47 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyajp-0000000HKi0-0jKE
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 19:53:46 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-45e6d266921so2536680fac.2
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 12:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601224; x=1788206024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwmqByqgOjaj+boW8Byl/XAhEHD4P6qPLmf+pApdFow=;
        b=izNohKKIFbsmVEyysGEJwPPCZfu1+Yj3qI1CGbDafuHxqfISpF1HtRneWQgOv0Xswx
         1GdUfIXtusnEudx9EuZdwAbap3wcvF0Jg6kEDbAqsUtSseXf98m8IA3fStrvh+pHD09x
         x5JBqYYG8okd43uMc82dfJAmdXAN+Rqis0NlnOAlwKkDLDsIU9+oqBSpP/j1S95TvzEY
         fGw/tBrzO4g+qo3fSqEA/69Cf0WqshjI74Mz+DZ6Xs2IbGqhpFeuCnRAA7Udtv/8FcNF
         d+Pynpe92C5BkMfAgwoGuLuShdSks+84976UfygCesRkxvahE6Gx1SGJ8fsKxv0XCUlF
         5F2w==
X-Forwarded-Encrypted: i=1; AHgh+Ro0OTazRFVJbib/ow3eZ/GbEsGKeD3G/1bjTiucTEQ8Ym24jv547dtvwHCYo3QkOyKg2TX7HS8r+mdVP+PloQ==@lists.infradead.org
X-Gm-Message-State: AFuF++ldHhuj8AUWH2Vr61s9KOOf/ohQ4Mu0IMWTxXe9CVTTVDVvQT0G
	yNeyDbVWzmZ1Awqfd0Ykz4AsJkzkJNYBE63mmduqzkUJj9FAQnJxhngF
X-Gm-Gg: AR+sD12rbjeG3Pqf3zXwBom76bq6Be/VENY6uRAydDJ/QBtzp7q9mhELrLuHoyF7EjH
	M3RJeFTcL+GAZvXeAP87satY6P3dJnc6ZsQ+ysi8cS3tyzFBUzu+QWXaCF8r8iDgAWiZeUABT62
	zMjsvJm7wVTvK0OJd9+IZAPNBxFMuVlwGG56hg9GwkVuzUP+6UlSKFFdfMiF0e+jO9fVytXbd2U
	HbKxUa7OUL2OzKsmuakXcVzLsWe7KmdI3iDMXC0/5MqK+XWiWr1n/22cE5jr2lmzAr+WySkSGXk
	rga0YGFgKgruoe3t5/zbYu39OUJkALMHkLKu+pkwWv1Xmb5ltw/o+pMPgKMtFRRZYxziZKciQ63
	CcCi3cT1q9MrPerqunn4itrBqEp/LbFFhoSKxAAI89+BrR0Ys5TFlCpZgyuIqdDlEzvXO4RWDZd
	9rA9zY+xNYpuzy6DADxMrcmmQ3z7rBHnkoyVXkOIWaN+WD1b2iT/TnoCkiNHPvO3AWdf5OLC99b
	QeUo0hoCji/R6PnbHKjK+soFC3X2f7DFVS7fuHEzbpI
X-Received: by 2002:a05:6870:2e84:b0:44c:3269:4d40 with SMTP id 586e51a60fabf-46350f85256mr27114382fac.7.1787601224083;
        Mon, 24 Aug 2026 12:53:44 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-463835bcdcbsm5805896fac.18.2026.08.24.12.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 12:53:43 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Jacobs Wu <jacobs.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 15/15] wifi: mt76: mt7925: fix HT/VHT caps and rates for NAN NDP peers
Date: Mon, 24 Aug 2026 14:52:27 -0500
Message-ID: <20260824195227.12589-16-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824195227.12589-1-sean.wang@kernel.org>
References: <20260824195227.12589-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_125345_225113_42CCBBF8 
X-CRM114-Status: GOOD (  18.75  )
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

From: Jacobs Wu <jacobs.wu@mediatek.com>

NAN NDP peers were added with bare link_sta caps: no HT cap or QoS
flag (so no BA/A-MPDU), no VHT cap / bandwidth / rx_nss, a data BSS
phy mode that still read legacy when the firmware built the peer's
rate table, and caps filtered down by the currently committed
schedule.

Push the NAN_DATA BSS phymode before sta_update, force the HT cap and
QoS flag, seed VHT80 / bandwidth / rx_nss=2 from the BSS RLM, fix the
NDP HT/VHT rate selection and stop filtering the link_sta caps by the
schedule, so rate control always sees the peer's real capabilities.

Bench (MT7925<->MT7925 NDP, 5 GHz ch149): 866.7M VHT80 MCS9 NSS2 link
rate, UDP ~290 Mbit/s.

Fixes: 0f3605e4f8de ("wifi: mt76: mt7925: wire up NAN operations")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 19 +++++-
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 62 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/nan.h   |  4 ++
 3 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index e1c688af7c59..051a0c8aed58 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -964,6 +964,21 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 
 	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
 
+	/* NAN_DATA (NDI) peers skip association - fill link_sta caps
+	 * from sband and push BSS_INFO with correct phymode + RLM.
+	 */
+	if (vif->type == NL80211_IFTYPE_NAN_DATA) {
+		struct ieee80211_chanctx_conf *nan_ctx;
+
+		nan_ctx = mt7925_nan_seed_link_sta(dev, link_sta);
+		mconf->mt76.ctx = nan_ctx;
+
+		ret = mt7925_mcu_add_bss_info(&dev->phy, nan_ctx,
+					      link_conf, link_sta, true);
+		if (ret)
+			goto out_pm;
+	}
+
 	/* should update bss info before STA add */
 	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
 		struct mt792x_link_sta *mlink_bc;
@@ -2587,8 +2602,8 @@ static int mt7925_start_nan(struct ieee80211_hw *hw,
 	cfg80211_chandef_create(&link_conf->chanreq.oper, chan,
 				NL80211_CHAN_NO_HT);
 
-	err = mt7925_mcu_add_bss_info(&dev->phy, NULL, link_conf,
-				      NULL, true);
+	err = mt7925_mcu_add_bss_info(&dev->phy, NULL,
+				      link_conf, NULL, true);
 	if (err < 0)
 		goto out;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 4b479edab018..8a59f7b1aee2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -267,6 +267,68 @@ int mt7925_nan_update_phy_setting(struct mt792x_dev *dev)
 				 &req, sizeof(req), true);
 }
 
+struct ieee80211_chanctx_conf *
+mt7925_nan_seed_link_sta(struct mt792x_dev *dev,
+			 struct ieee80211_link_sta *link_sta)
+{
+	struct ieee80211_supported_band *sband_2g, *sband_5g;
+	struct ieee80211_chanctx_conf *nan_ctx = NULL;
+	struct ieee80211_vif *nan_vif = dev->nan_vif;
+
+	/* Fill HT cap from 2G sband */
+	sband_2g = dev->mphy.hw->wiphy->bands[NL80211_BAND_2GHZ];
+	sband_5g = dev->mphy.hw->wiphy->bands[NL80211_BAND_5GHZ];
+	if (sband_2g)
+		link_sta->ht_cap = sband_2g->ht_cap;
+
+	link_sta->sta->wme = true;
+	link_sta->rx_nss = hweight8(dev->mphy.antenna_mask);
+
+	/* Get chanctx from NAN schedule.
+	 * Prefer 5G committed slot for wider BW (VHT), fallback
+	 * to first valid slot if no 5G data slot is scheduled.
+	 */
+	if (nan_vif) {
+		struct ieee80211_nan_channel **slots =
+			nan_vif->cfg.nan_sched.schedule;
+		int i;
+
+		for (i = 0; i < CFG80211_NAN_SCHED_NUM_TIME_SLOTS; i++) {
+			struct ieee80211_chanctx_conf *ctx;
+
+			if (!slots[i] || IS_ERR(slots[i]) ||
+			    !slots[i]->chanctx_conf)
+				continue;
+
+			ctx = slots[i]->chanctx_conf;
+			if (!nan_ctx)
+				nan_ctx = ctx;
+			if (ctx->def.chan->band == NL80211_BAND_5GHZ) {
+				nan_ctx = ctx;
+				break;
+			}
+		}
+	}
+
+	/* Capability describes what the device can do and must not be
+	 * filtered by the current schedule - firmware gates the VHT rate
+	 * mode per the data schedule and re-derives it on schedule
+	 * change, which only works if the caps are present up front.
+	 */
+	if (sband_5g)
+		link_sta->vht_cap = sband_5g->vht_cap;
+
+	/* Bandwidth here is the capability ceiling, not the operating
+	 * width - the per-slot operating bandwidth follows the current
+	 * slot channel via the firmware RLM sync, so deriving it from
+	 * the schedule at STA-add time would cap a later 5 GHz schedule
+	 * at the bring-up width.
+	 */
+	link_sta->bandwidth = IEEE80211_STA_RX_BW_80;
+
+	return nan_ctx;
+}
+
 int mt7925_nan_enable(struct ieee80211_vif *vif,
 		      struct mt792x_dev *dev,
 		      struct cfg80211_nan_conf *conf)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index c78a1350c456..d81d84a222d9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -477,6 +477,10 @@ struct mt7925_nan_update_phy_setting_tlv {
 
 int mt7925_nan_update_phy_setting(struct mt792x_dev *dev);
 
+struct ieee80211_chanctx_conf *
+mt7925_nan_seed_link_sta(struct mt792x_dev *dev,
+			 struct ieee80211_link_sta *link_sta);
+
 int mt7925_nan_enable(struct ieee80211_vif *vif,
 		      struct mt792x_dev *dev,
 		      struct cfg80211_nan_conf *conf);
-- 
2.43.0


