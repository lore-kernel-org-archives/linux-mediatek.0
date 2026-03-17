Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E80FFED9EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2026 17:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1Sa/OI14235f1o3BnTehycDoIrodctjm5BQzxUDkn0=; b=fQC2wh0yAblhtxJbKsdCWGyg0g
	x47NvZ2IxDtrWBcoxzgFvyHuNyjm0+pQuS4KX8LYUWJrOyL2w7pJTppwid5bLtZTrgUco6WhnVF+o
	I58cziba9JkZd+0CaMlEMkM1H4onqkATe+YBpivaC+hM1cFOmwTGL6/97RuZdv06mfHeWoUKEvI+R
	xye6eueE/cR0TvyhkMn3Y0T5S4wxLGlNTZdarhi5GNh1AN63ZwNHX9dQ0fkU+35zWZZrDzP5W0owM
	4bixLHOftiHBvtH+eSb09WqmR/U/nZH9kQoOVW9KeUKIp6Ah3CX1T+2x7pHUE8AlJvTB71G0i6j70
	Sj5Cfn4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YFX-00000006wj0-1Pbr;
	Tue, 17 Mar 2026 17:30:35 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2YFU-00000006wi3-0baw
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Mar 2026 17:30:33 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1773768628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y1Sa/OI14235f1o3BnTehycDoIrodctjm5BQzxUDkn0=;
	b=KEYfGPXhOTukL2f/O139Z4+EwlxumRNfGlocS2yKOwqsdK2I7vXICDP/na3srp+ARKhSx4
	+8XQy1//DHXr8tPZV/0jT2P8/Sg34A5DrP5ApZjI1F01iqwNv3W9aZdHeIAGEJTrWJl52R
	t+c6Qip6VebFt83TFRyGRwUub1DG5dmjVbh7I+U5WIaCEzOBr5mZceDZ6wOsobW0KrYJZy
	T0dbwsUeGxaYw+e77Ef87KY1vS+MOG0dAS4g6j77mvd1aiB8cgqo6fg2DzNCoDeLd+2Ejs
	HiE+P3Tvgsx2v//p/mrc2HM7LBwKi2PfgTaRXisK5/Bx+0IMYo91bLVSN0/HHw==
From: Lucid Duck <lucid_duck@justthetip.ca>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name,
	sean.wang@kernel.org,
	lorenzo@kernel.org,
	linux-mediatek@lists.infradead.org,
	morrownr@gmail.com,
	Lucid Duck <lucid_duck@justthetip.ca>
Subject: [PATCH v3 1/1] wifi: mt76: mt7921: fix txpower reporting from rate power configuration
Date: Tue, 17 Mar 2026 10:30:16 -0700
Message-ID: <20260317173016.136975-2-lucid_duck@justthetip.ca>
In-Reply-To: <20260317173016.136975-1-lucid_duck@justthetip.ca>
References: <20260317173016.136975-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_103032_701422_AA150239 
X-CRM114-Status: GOOD (  14.36  )
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

The mt7921 driver never updates phy->txpower_cur
when TX power rate configuration is sent to firmware. This causes
mt76_get_txpower() to report bogus values to userspace (typically
3 dBm) regardless of actual regulatory or SAR limits. User-set
txpower limits via iw are also not reflected.

Three root causes are addressed:

1. The rate power loop in mt76_connac_mcu_rate_txpower_band() computes
   the correct bounded TX power for each channel but discards the return
   value of mt76_get_rate_power_limits(). Fix: capture the return value
   and store it to phy->txpower_cur when processing the current channel.

2. mt7921 uses the chanctx model but its add_chanctx callback bypasses
   the common mt76_phy_update_channel(), leaving phy->chandef stale.
   Fix: update phy->chandef from ctx->def in both add_chanctx and
   change_chanctx, and trigger the rate power path to refresh
   txpower_cur. Also trigger on IEEE80211_CONF_CHANGE_CHANNEL in
   config(), matching mt7915.

3. For chanctx drivers, mac80211 routes user txpower changes through
   BSS_CHANGED_TXPOWER in bss_info_changed() -- not through
   IEEE80211_CONF_CHANGE_POWER in config(). hw->conf.power_level is
   never updated. Fix: handle BSS_CHANGED_TXPOWER in
   mt7921_bss_info_changed(), bridge bss_conf.txpower to
   hw->conf.power_level, and re-trigger the rate power path.

Tested on Alfa AWUS036AXML (MT7921AU), kernel 6.17.1-300.fc43:

  Before: iw dev wlan0 info shows "txpower 3.00 dBm" (wrong)
  After:  correct per-band values, user limits reflected

Test results (regulatory domain: Canada/CA):
  - 2.4GHz ch6:  33 dBm (30 dBm limit + 3 dBm 2x2 path delta)
  - 5GHz ch36:   26 dBm (23 dBm limit + 3 dBm path delta)
  - 6GHz ch5:    15 dBm (12 dBm limit + 3 dBm path delta)
  - Band switch: 100 cycles, 0 failures
  - Module reload: 50 cycles, 0 failures
  - 2-hour soak: 480 samples, zero drift
  - Regdomain switching: 10 countries, all correct
  - User txpower limits: reflected on all bands
  - Monitor mode: correct on all tested channels

Signed-off-by: Lucid Duck <lucid_duck@justthetip.ca>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 12 +++++++---
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 22 ++++++++++++++++++-
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 16db0f208..5856924a9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -2193,14 +2193,20 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
 				.hw_value = ch_list[idx],
 				.band = band,
 			};
-			s8 reg_power, sar_power;
+			s8 reg_power, sar_power, max_power;
 
 			reg_power = mt76_connac_get_ch_power(phy, &chan,
 							     tx_power);
 			sar_power = mt76_get_sar_power(phy, &chan, reg_power);
 
-			mt76_get_rate_power_limits(phy, &chan, limits,
-						   sar_power);
+			max_power = mt76_get_rate_power_limits(phy, &chan,
+							       limits,
+							       sar_power);
+
+			if (phy->chandef.chan &&
+			    phy->chandef.chan->hw_value == ch_list[idx] &&
+			    phy->chandef.chan->band == band)
+				phy->txpower_cur = max_power;
 
 			tx_power_tlv.last_msg = ch_list[idx] == last_ch;
 			sku_tlbv.channel = ch_list[idx];
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 5881040ac..38a59c6f2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -638,7 +638,8 @@ static int mt7921_config(struct ieee80211_hw *hw, int radio_idx, u32 changed)
 
 	mt792x_mutex_acquire(dev);
 
-	if (changed & IEEE80211_CONF_CHANGE_POWER) {
+	if (changed & (IEEE80211_CONF_CHANGE_POWER |
+		       IEEE80211_CONF_CHANGE_CHANNEL)) {
 		ret = mt7921_set_tx_sar_pwr(hw, NULL);
 		if (ret)
 			goto out;
@@ -719,6 +720,14 @@ static void mt7921_bss_info_changed(struct ieee80211_hw *hw,
 	if (changed & BSS_CHANGED_CQM)
 		mt7921_mcu_set_rssimonitor(dev, vif);
 
+	if (changed & BSS_CHANGED_TXPOWER) {
+		int tx_power = info->txpower;
+
+		if (tx_power != INT_MIN && tx_power > 0)
+			hw->conf.power_level = tx_power;
+		mt7921_set_tx_sar_pwr(hw, NULL);
+	}
+
 	if (changed & BSS_CHANGED_ASSOC) {
 		mt7921_mcu_sta_update(dev, NULL, vif, true,
 				      MT76_STA_INFO_STATE_ASSOC);
@@ -1360,8 +1369,15 @@ mt7921_add_chanctx(struct ieee80211_hw *hw,
 		   struct ieee80211_chanctx_conf *ctx)
 {
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct mt76_phy *mphy = hw->priv;
 
 	dev->new_ctx = ctx;
+	mphy->chandef = ctx->def;
+
+	mt792x_mutex_acquire(dev);
+	mt7921_set_tx_sar_pwr(hw, NULL);
+	mt792x_mutex_release(dev);
+
 	return 0;
 }
 
@@ -1396,6 +1412,10 @@ mt7921_change_chanctx(struct ieee80211_hw *hw,
 		mt7921_mcu_config_sniffer(mvif, ctx);
 	else
 		mt76_connac_mcu_uni_set_chctx(mvif->phy->mt76, &mvif->bss_conf.mt76, ctx);
+
+	phy->mt76->chandef = ctx->def;
+	mt7921_set_tx_sar_pwr(hw, NULL);
+
 	mt792x_mutex_release(phy->dev);
 }
 
-- 
2.51.0


