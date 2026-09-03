Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A11BC61DD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 20:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lY5pme+K3+H1koOPOg8XeRzFUJ89xP2hbtEXU+HzIyE=; b=zhv7dUUlxE2GR20wGStuuDI+am
	zaAfhlF4+Fk9RUz5lHf6r0afQ8SGLJ1Z5o/Xf8XcpBDJYOT7PGKpXl/nuaRVxIsZcb2nqTXojcM1w
	tISITwL+qLRH839gOAY/gz5L2gS9Rv2qSQsJVRW9lmXSaCThLJN62Fn1kwE4USV75M6+7fKv60XGM
	5cZincP9crs5qEeWGxWhvCUXFg0W2/NJqzvoKmiDSzo5NX76Ky9mqZUqTCvFo717bHCMhL5wgMJR1
	jG7wmFEIAVXJ35xFE9ynjvknX6hItK/COB6TfCB6rFmGvax2S2Xgiv1LSFwXwQ4AoPoVVl6DvRGY7
	komqlskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Dl0-00000000XEQ-1IrK;
	Thu, 03 Sep 2026 20:09:58 +0000
Received: from out-119.mta0.migadu.com ([2001:41d0:1004:224b::77] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Dkw-00000000XDV-2zGF
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 20:09:56 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=tyPkW12OKvhH3cRhELB0UplYSgyUB5qopvv8RmpauNI=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788466190; v=1; x=1789070990;
 b=pCEkLPQMewf5WEOJdc6bYLwbnxiCiwwVSuB5w6AMNZIFtkOFNf4MZkIyW8Isc5dMqYLlZYE0
 ZOwN/aoVzAFmgpCnEwEBmxje7AxrkwPsd7zJxtzRfIvpN0Zx/dIKeaTbfog3QkDnGW2cnJWd+U2
 xOoJgqYSQGdZ+73SYnH1rmSXUlbjM4VkvE8Vw/E+MvUS3dB2pWyFGouCbVqfVBBqVD7VeQKMBpB
 lqquMPDZhHcxw93eoFD+zoV9OFo/QvV6axp2yHVM2yE6R6wx2vM9BRzE7Lr/pRakoD2AGQVcHUV
 kiuEztCSTS3EOqGWp/9Nv+MaxHxWWLvatWZ7QAlHYKaVg==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id dd88a334178031d1;
	Thu, 03 Sep 2026 20:09:50 +0000
X-Mizu-Trace-ID: dd88a334178031d1
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wireless] Revert "wifi: mt76: mt792x: do not advertise active monitor"
Date: Thu,  3 Sep 2026 13:09:47 -0700
Message-ID: <20260903200947.27051-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_130955_335510_3669F59C 
X-CRM114-Status: GOOD (  14.47  )
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

This reverts commit 6f6c9800e54cc7a9c5530797892b8b877335cf3c.

It must be applied after Matheus Alves de Almeida's mac80211 fix, not
before it and not on its own:
https://lore.kernel.org/linux-wireless/20260901025525.4017-1-matheus.aalmeida@inf.ufrgs.br/

Without that patch this only puts the advertisement back on a feature that
still does not work.

The symptom the reverted commit described is real: an active monitor on
mt792x receives nothing. The cause is not the firmware. mac80211 gives an
active monitor no channel context at all, so the interface has no channel
and the driver is never told to sniff. On mac80211_hwsim, which has no
firmware of any kind, an active monitor reports no channel and hears 1
beacon per eight second window, against 41 to 69 for a passive monitor on
the same radio.

Gating the feature off makes cfg80211 refuse the interface outright, so
asking hcxdumptool for one on any mt7921, mt7925 or mt7927 now gets
"active monitor mode requested by user, but not supported by driver".
That first ships in 7.3. v7.1 and v7.2 do not carry it.

Fixing active monitor and withdrawing the advertisement pull in opposite
directions, and the fix is the one worth having. I said the same on the
original thread:
https://lore.kernel.org/linux-wireless/20260722034852.147003-1-lucid_duck@justthetip.ca/

With the mac80211 fix applied and the advertisement restored, an active
monitor asked for channel 1 captures 86 to 88 beacons from a test AP in a
ten second window. A passive monitor on the same channel, measured both
before and after each active run, captures 86 to 88. Three runs of each on
an MT7921AU and an MT7925U.

Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
Please do not apply this before the mac80211 fix linked above. On its own it
puts the feature bit back on and an active monitor still receives nothing.

 drivers/net/wireless/mediatek/mt76/mac80211.c    | 5 ++---
 drivers/net/wireless/mediatek/mt76/mt76.h        | 1 -
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 1 -
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index abbe65cbcd89..f92277770488 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -439,9 +439,8 @@ mt76_phy_init(struct mt76_phy *phy, struct ieee80211_hw *hw)
 	SET_IEEE80211_DEV(hw, dev->dev);
 	SET_IEEE80211_PERM_ADDR(hw, phy->macaddr);
 
-	wiphy->features |= NL80211_FEATURE_AP_MODE_CHAN_WIDTH_CHANGE;
-	if (!phy->no_active_monitor)
-		wiphy->features |= NL80211_FEATURE_ACTIVE_MONITOR;
+	wiphy->features |= NL80211_FEATURE_ACTIVE_MONITOR |
+			   NL80211_FEATURE_AP_MODE_CHAN_WIDTH_CHANGE;
 	wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH |
 			WIPHY_FLAG_SUPPORTS_TDLS |
 			WIPHY_FLAG_AP_UAPSD;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 62b41c8bb7c0..61ef1b80feb8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -873,7 +873,6 @@ struct mt76_phy {
 	struct cfg80211_chan_def main_chandef;
 	bool offchannel;
 	bool radar_enabled;
-	bool no_active_monitor;
 
 	struct delayed_work roc_work;
 	struct ieee80211_vif *roc_vif;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 0ad33f74c228..837d7af984e8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -820,7 +820,6 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 
 	wiphy->features |= NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR |
 			   NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
-	phy->mt76->no_active_monitor = true;
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_SET_SCAN_DWELL);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_LEGACY);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_HT);
-- 
2.55.0


