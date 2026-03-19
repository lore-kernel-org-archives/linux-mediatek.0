Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12C01091917
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2026 20:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eaWYm+Ogi+l2RIh2pnwzTgW1KAd3MUkqgb1vx7KhlRU=; b=k9gv+Q5V2s8xHYXSmeeONw0+mT
	UjoiSBKkgjwL6BFzt/CMqvNQOcDm7BjHw/k5qb5t+iTfo1aucxVgaxm84F1rVOBQRjYRI9ZYJtAP4
	MzjxcudxCGZnPGzfjfrAnTPs1EJAqdTCZrS/vF8s/nrCKz5AqrL/k098ozQHSml3kZyKHNkeeIax9
	krqKKR37oOuLslXL33sifbBC8+8/uaxM+IeZECLHW3+w/npxNZKiKM8iz+fIjofQLkagkv3EBj7Ix
	Q0sz+MntXpbdmKiEcdbCK6VPRUEoe/uuECaAgR86bS+wEP58/AG4zu21c8jowBG08JUnlBDiINK3y
	+560GGzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3K9j-0000000BYEU-1dMh;
	Thu, 19 Mar 2026 20:39:47 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3K9g-0000000BYE7-2LDD
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Mar 2026 20:39:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1773952779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eaWYm+Ogi+l2RIh2pnwzTgW1KAd3MUkqgb1vx7KhlRU=;
	b=w5aW9AldFPWHFL45KWDzamzXf7XNc5HY9Iqr2yV5WIzonrrcHpCd0wvlZvkeBH8atuJAfO
	sNFNqIuw/FPBlUHmmKWX9WL5OWpmKGd9uAGvJ98jU52zhpJud7B335R5VBXy84/vvhQb/9
	YitnH9sqS4z9R1gUY/lhm9OVLnOHSKh3jgkVII9Y9t4eotMED2T4oTJqzeGz5FEnTnjIQE
	Ra/n+WL2Qh8AFOCigmxmOqteJPwD/rlFYWQhh8LIUb6TyIOqSRTcKbmS4wEBpqRdcolo2R
	YWhO+8YaBOAYKHzuTXrX+9s+OihAXJl5zujEp5qSPyDeMLlNIQKJ40wU/Jb++Q==
From: Lucid Duck <lucid_duck@justthetip.ca>
To: Sean Wang <sean.wang@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	morrownr@gmail.com,
	Lucid Duck <lucid_duck@justthetip.ca>,
	stable@vger.kernel.org
Subject: [PATCH v4] wifi: mt76: mt7921: fix txpower reporting from rate power configuration
Date: Thu, 19 Mar 2026 13:38:54 -0700
Message-ID: <20260319203854.30479-1-lucid_duck@justthetip.ca>
In-Reply-To: <CAGp9LzqLbdEb25ocObMMuFPZitrL-UnC7uhaLOkYQN=TgSTmnA@mail.gmail.com>
References: <CAGp9LzqLbdEb25ocObMMuFPZitrL-UnC7uhaLOkYQN=TgSTmnA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_133945_237263_0D5227DC 
X-CRM114-Status: GOOD (  13.39  )
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

The mt7921 driver never updates phy->txpower_cur from the rate power
configuration sent to firmware, causing mt76_get_txpower() to report
bogus values to userspace (typically 3 dBm) regardless of actual
regulatory or SAR limits.

Two issues are addressed:

1. The rate power loop in mt76_connac_mcu_rate_txpower_band() computes
   the correct bounded TX power per channel via
   mt76_get_rate_power_limits() but discards the return value. Capture
   it and store to phy->txpower_cur when processing the current
   channel, matching how mt7915 handles this in
   mt7915_mcu_set_txpower_sku(). Subtract the multi-chain path delta
   before storing, since mt76_get_txpower() adds it back when
   reporting -- consistent with mt7915's use of mt76_get_power_bound()
   which performs the same subtraction.

2. mt7921 uses the chanctx model but its add_chanctx callback does not
   update phy->chandef, leaving it stale after association. The rate
   power loop's channel comparison then fails silently. Sync
   phy->chandef from ctx->def in add_chanctx and change_chanctx, and
   recompute txpower_cur via a lightweight helper that performs the
   same bounded power calculation for the current channel without
   reprogramming firmware rate tables.

Tested on Alfa AWUS036AXML (MT7921AU), kernel 6.19.8, Canada:

  Before: iw dev wlan0 info shows "txpower 3.00 dBm" (wrong)
  After:  2.4GHz 36 dBm, 5GHz 23 dBm, 6GHz 12 dBm (match regulatory)

Cc: stable@vger.kernel.org
Fixes: 1c099ab44727 ("mt76: mt7921: add MAC support")
Signed-off-by: Lucid Duck <lucid_duck@justthetip.ca>
---
Changes since v3:
- Removed mt7921_set_tx_sar_pwr() from add_chanctx and change_chanctx.
  Channel transitions don't change underlying power constraints, so
  reprogramming the full rate table is unnecessary. Replaced with a
  lightweight helper that recomputes txpower_cur locally.
- Removed IEEE80211_CONF_CHANGE_CHANNEL trigger from config().
- Removed BSS_CHANGED_TXPOWER handler from bss_info_changed(). Writing
  per-vif txpower into per-HW hw->conf.power_level breaks multi-vif
  semantics. User txpower limits need a different approach (follow-up).
- Subtracted path delta before storing txpower_cur. The connac rate
  loop stores total bounded power, but mt76_get_txpower() adds the
  multi-chain path delta when reporting. mt7915 accounts for this via
  mt76_get_power_bound(), which subtracts the delta before storing.
  Without the same subtraction, reported values were inflated by 3 dBm
  on 2x2 devices.

 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 14 +++++++--
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 30 +++++++++++++++++++
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 16db0f208..e26a2cb39 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -2193,14 +2193,22 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
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
+				phy->txpower_cur = max_power -
+					mt76_tx_power_path_delta(
+						hweight16(phy->chainmask));
 
 			tx_power_tlv.last_msg = ch_list[idx] == last_ch;
 			sku_tlbv.channel = ch_list[idx];
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 5881040ac..a77ae5791 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1355,13 +1355,39 @@ mt7921_stop_ap(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	mt792x_mutex_release(dev);
 }
 
+static void mt7921_update_txpower_cur(struct mt76_phy *phy)
+{
+	struct mt76_power_limits limits;
+	struct ieee80211_channel *chan = phy->chandef.chan;
+	int n_chains = hweight16(phy->chainmask);
+	s8 reg_power, sar_power, max_power;
+	int tx_power;
+
+	if (!chan)
+		return;
+
+	tx_power = 2 * phy->hw->conf.power_level;
+	if (!tx_power)
+		tx_power = 127;
+
+	reg_power = mt76_connac_get_ch_power(phy, chan, tx_power);
+	sar_power = mt76_get_sar_power(phy, chan, reg_power);
+	max_power = mt76_get_rate_power_limits(phy, chan, &limits, sar_power);
+
+	phy->txpower_cur = max_power - mt76_tx_power_path_delta(n_chains);
+}
+
 static int
 mt7921_add_chanctx(struct ieee80211_hw *hw,
 		   struct ieee80211_chanctx_conf *ctx)
 {
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct mt76_phy *mphy = hw->priv;
 
 	dev->new_ctx = ctx;
+	mphy->chandef = ctx->def;
+	mt7921_update_txpower_cur(mphy);
+
 	return 0;
 }
 
@@ -1396,6 +1422,10 @@ mt7921_change_chanctx(struct ieee80211_hw *hw,
 		mt7921_mcu_config_sniffer(mvif, ctx);
 	else
 		mt76_connac_mcu_uni_set_chctx(mvif->phy->mt76, &mvif->bss_conf.mt76, ctx);
+
+	phy->mt76->chandef = ctx->def;
+	mt7921_update_txpower_cur(phy->mt76);
+
 	mt792x_mutex_release(phy->dev);
 }
 
-- 
2.53.0


