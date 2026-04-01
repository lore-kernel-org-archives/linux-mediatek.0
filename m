Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A77810FCAC0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2026 18:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3xYD9hif0mmKJi5KnGGefNn1V5fwiod+4YYIl9xrIk=; b=StSPmnr5MyFFhoh3HaDm+jT3Tq
	kdZD9RgE1KONCgoOhEg16R/d+Atwliq1hq+Ts4T5slf8Ekos4J+f/DblMq1u4k0Me7+Vo7y8mm2KR
	4TzwxoS/cmD1h9sJ6l/uVCfPMyf4IvLR6vEbL55DpxLbyPcIfkSIgx7Be8YG7fWdCq9szXKuaMNFU
	ul3DwW3vLcxdzLZoGGA0N5gbCDUS84xSqgWzpsJheAm7Ranh2fOqCBNJAUKRW+cBq8uVF0LTfJdD9
	7kZSv4Gt63LbDF8ZIHIUFxR3lzcUimfwOTm0rlo1rcFR70KyrBHJTWylQInFB190xbHXH7ztRq4fm
	Rk1IMEmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w80EC-0000000FxJD-0LUU;
	Wed, 01 Apr 2026 18:23:44 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w80E9-0000000FxHo-2A7e
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Apr 2026 18:23:43 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-40f1ffba6a0so59168fac.0
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Apr 2026 11:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775067821; x=1775672621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q3xYD9hif0mmKJi5KnGGefNn1V5fwiod+4YYIl9xrIk=;
        b=PNvO2fsgBEMsdp0q0pRQXbSE3Lq41vJUyIFePiZ77+b6yLsfmqcbzC7xhbe76jPnrD
         Bvn2pWtIrJ3pva1pa11QraNRm5Vi+KKT/ADffz8WFNo1eHKM/0WCYnhwc3wJRIwFjOL8
         Qnhh+Mhp8EPu6R8YFcjGwGrBMVRU88GkLnTGKU+oTF4Rl7z8+Bwiy49ubGazNLCKL824
         JnM1NiYWaJgW+B3YOTrbYKo0HOzWnUT+mORgAw6PRM0jqxYZyaC2dKEox9ouNP+nBjnZ
         ds0cxQGRaZ+Ow3kFfLuiiltVPU8hzSlm65sbyIfXc4f6OUSh6+y9Tj3oAeqvHnbe7tnA
         5hqA==
X-Forwarded-Encrypted: i=1; AJvYcCUDAbgqqrPMK5378FOm+GYlSJW62sMYqA1NyVlAD6/JEW9TCrwVYWsRL5UBgCspzSr5Xt4/uDz7YeGTZx2EGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDT+4O3chL5Un32kCO7BS8PDWkohuPg2HbLSi72EJSiW5BXyXT
	owE+V6c5XTEkwgcAyTsMMc95jqhBpSfrXcdaHEBCSmODU6DRQCKOYmVe
X-Gm-Gg: ATEYQzwuOtwy8EBfYIh5jMVRMiCdWIw1pfSKgfRD3uyvoch4nbkNqC/d5jVAfb4c+VV
	PGcgk7ShZirUiHgYX4VfMaRPDoyEJn0L3kzSjFOTBQ2TdpD9DSReTKB232Xy0evm0e+t43yrLA4
	Pq1XwXuUxhCskiK2lyIdOWdPkRnJZmkTyO0inEZDtzD0J2qXkZPSTxn7UCrX2btV2GZktMSO6DU
	M8pnMFIPtyVL4i97V7sg+6UKCYcqmShB6vQoYsQ90Zdzm+qW0LyZgHm6YqBxKJl8UNvZSmQLphP
	8Xb4amPS7qlpJtdnwy1d+eBAm6Ydzb1BPXEJ+zqoSLAor1AuTTTZoLUj1m4NJZw06gEAYO5qKNc
	xeorRNCDNAihsxFIoOKNyQjBVvbDFsR8kBGrBidsxY+KQihOGSXbMpPMlkuVqoCIjUGGTvifDhk
	otK1Ca1SNI87dxR/rgavDTafWb4GUrz8ZRdX51YrQgii9faQQ=
X-Received: by 2002:a05:6870:d29c:b0:417:c695:869c with SMTP id 586e51a60fabf-422cfeaeb79mr2545688fac.27.1775067820280;
        Wed, 01 Apr 2026 11:23:40 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-422eb3c9e06sm386778fac.15.2026.04.01.11.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 11:23:39 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Devin Wittmayer <lucid_duck@justthetip.ca>,
	Satadru Pramanik <satadru@gmail.com>
Subject: [PATCH v2 3/3] wifi: mt76: mt792x: report txpower for the requested vif link
Date: Wed,  1 Apr 2026 13:23:22 -0500
Message-ID: <20260401182322.64355-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401182322.64355-1-sean.wang@kernel.org>
References: <20260401182322.64355-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_112341_747127_F977A199 
X-CRM114-Status: GOOD (  16.07  )
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

mt792x currently reports txpower from the generic PHY cached state,
which may not match the requested vif/link context.

Resolve the requested link channel and derive txpower from that channel
instead, with fallback to the current PHY chandef if no valid chanctx is
available.

Reported-by: Devin Wittmayer <lucid_duck@justthetip.ca>
Closes: https://lore.kernel.org/linux-wireless/20260130215839.53270-1-lucid_duck@justthetip.ca/
Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca>
Tested-by: Satadru Pramanik <satadru@gmail.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2:
- Rebased onto the latest mt76 tree
- Added Reported-by, Tested-by, Co-developed-by and Signed-off-by tags
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  |  2 +-
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  2 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  2 +
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 41 +++++++++++++++++++
 4 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 3d74fabe7408..2e7cdf8edc12 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1552,7 +1552,7 @@ const struct ieee80211_ops mt7921_ops = {
 	.wake_tx_queue = mt76_wake_tx_queue,
 	.release_buffered_frames = mt76_release_buffered_frames,
 	.channel_switch_beacon = mt7921_channel_switch_beacon,
-	.get_txpower = mt76_get_txpower,
+	.get_txpower = mt792x_get_txpower,
 	.get_stats = mt792x_get_stats,
 	.get_et_sset_count = mt792x_get_et_sset_count,
 	.get_et_strings = mt792x_get_et_strings,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 73d3722739d0..53e1a93c6976 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2433,7 +2433,7 @@ const struct ieee80211_ops mt7925_ops = {
 	.wake_tx_queue = mt76_wake_tx_queue,
 	.release_buffered_frames = mt76_release_buffered_frames,
 	.channel_switch_beacon = mt7925_channel_switch_beacon,
-	.get_txpower = mt76_get_txpower,
+	.get_txpower = mt792x_get_txpower,
 	.get_stats = mt792x_get_stats,
 	.get_et_sset_count = mt792x_get_et_sset_count,
 	.get_et_strings = mt792x_get_et_strings,
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 4ff93f2cd624..65eba18bc3a1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -397,6 +397,8 @@ void mt792x_roc_timer(struct timer_list *timer);
 void mt792x_csa_timer(struct timer_list *timer);
 void mt792x_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		  u32 queues, bool drop);
+int mt792x_get_txpower(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+		       unsigned int link_id, int *dbm);
 int mt792x_assign_vif_chanctx(struct ieee80211_hw *hw,
 			      struct ieee80211_vif *vif,
 			      struct ieee80211_bss_conf *link_conf,
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 152cfcca2f90..3fd1be7db1f4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -329,6 +329,47 @@ void mt792x_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 }
 EXPORT_SYMBOL_GPL(mt792x_flush);
 
+int mt792x_get_txpower(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+		       unsigned int link_id, int *dbm)
+{
+	struct mt76_power_limits limits = {};
+	struct ieee80211_bss_conf *link_conf;
+	struct ieee80211_channel *chan;
+	struct mt792x_bss_conf *mconf;
+	struct mt792x_vif *mvif;
+	struct mt76_phy *phy;
+	s8 max_power;
+
+	if (!vif)
+		return mt76_get_txpower(hw, vif, link_id, dbm);
+
+	mvif = (struct mt792x_vif *)vif->drv_priv;
+	phy = mvif->phy->mt76;
+
+	mt792x_mutex_acquire(mvif->phy->dev);
+
+	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
+	mconf = link_conf ? mt792x_link_conf_to_mconf(link_conf) : NULL;
+	if (mconf && mconf->mt76.ctx && mconf->mt76.ctx->def.chan)
+		chan = mconf->mt76.ctx->def.chan;
+	else
+		/* Fall back to the current PHY chandef if the requested link
+		 * does not have a valid channel context.
+		 */
+		chan = phy->chandef.chan;
+
+	mt792x_mutex_release(mvif->phy->dev);
+
+	if (!chan)
+		return -EINVAL;
+
+	max_power = mt76_connac_get_rate_power_limit(phy, chan, &limits);
+	*dbm = DIV_ROUND_UP(max_power, 2);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt792x_get_txpower);
+
 int mt792x_assign_vif_chanctx(struct ieee80211_hw *hw,
 			      struct ieee80211_vif *vif,
 			      struct ieee80211_bss_conf *link_conf,
-- 
2.43.0


