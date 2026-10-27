Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F448606A31A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2026 19:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k4Dirkjb;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=UssE6PxP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YmSeWrLDHug5hmREEl4v75tbJwuivcm3EZ4Ale97CmY=; b=k4DirkjbgQ40cp
	yyeyZNeiItRCXFmu1IegY1f8kFBgOLJVrvTrP4+HyB7kRnVKZhehhzeslQihvKElTn9C8ghoie+o9
	2Btzr0wrTjQButb8AwA35IPHJhARXVlOefCb/6eiQRQ7zvfBYZASvi7L0j57+06vTfyBhBjvNzKHF
	L2UjFprEnTxv5Y8tkBQge8jFFygmKlntjjP3rLht+tinw30c/jcV8yBpqhJAuuI375XA1dlkW1GVZ
	Oe7LsfdNBT3TFDkMEA9d24vfRBxcOYLf8fm0JZUZViIyU/GlRGWYupebPia+9Y6FjZmZMQOWWyRmt
	3l8Bl7/K3bBOt6alxZmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLnJP-00000005hGZ-0QGV;
	Tue, 27 Oct 2026 19:58:23 +0000
Received: from out-140.mta0.migadu.com ([2001:41d0:1004:224b::8c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLnJM-00000005hDD-2O13
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Oct 2026 19:58:21 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=JU7SOCtUHUHndWZYZOTVOVh2PhRQ269t0wVq8ONFpg4=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793131098; v=1; x=1793735898;
 b=UssE6PxPzMBvFhdg1JSHI3jxhXpgMN+WoAUCBzlR8gOabgp8ONZuhR8tykBdlI/1b0qfme8n
 kFCff/mWhKCKN/lnlRSB9KLAG30l+0lidqBDL9cGaQgA8LtFEmcDbh2AvcufBfVm6Q9gzARrrep
 0+96/A22JJAnCgqPg0HYD9+jpzhBKDqSIJ2ct4wj5hLoiFRRURbyCmxDLkuq7JBaR8Vr3/1xcve
 3zwzmckvXctUdYefoV+wZB6INXhVZfRBs9COtbSySnmb+JXb3zMcTp0VnyD6pdEzN8aMgZGnLFg
 UALMI05dz/Wxjjx/4LcsIyDMI8gXv4xnWMDlScyGx1nYw==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f57e996020db06b4;
	Tue, 27 Oct 2026 19:58:17 +0000
X-Mizu-Trace-ID: f57e996020db06b4
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Mark Anthony Agarro <markanthonyagarro@gmail.com>,
	Alex Gavin <a_gavin@icloud.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wireless 4/4] Revert "wifi: mt76: mt792x: do not advertise active monitor"
Date: Tue, 27 Oct 2026 12:58:03 -0700
Message-ID: <20261027195803.711995-5-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027195803.711995-1-lucid_duck@justthetip.ca>
References: <20261027195803.711995-1-lucid_duck@justthetip.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_125820_800573_AFB6BE01 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-24.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This reverts commit 6f6c9800e54c ("wifi: mt76: mt792x: do not advertise
active monitor").

That commit hid active monitor, saying the firmware stops receiving in
that mode. The monitor was missing a channel, which the previous commit
gives it. Since 7.3, tools that ask for one, like owly and hcxdumptool
-A, are refused.

Advertise it again. Without the previous commits a lone active monitor
is accepted but hears nothing.

Fixes: 6f6c9800e54c ("wifi: mt76: mt792x: do not advertise active monitor")
Link: https://github.com/t4t5/owly/pull/24
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c    | 5 ++---
 drivers/net/wireless/mediatek/mt76/mt76.h        | 1 -
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 1 -
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 89f289ac57a9..08876ed2dfe4 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -440,9 +440,8 @@ mt76_phy_init(struct mt76_phy *phy, struct ieee80211_hw *hw)
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
index 9e851dea71d9..b591fb3e3b7e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -871,7 +871,6 @@ struct mt76_phy {
 	struct cfg80211_chan_def main_chandef;
 	bool offchannel;
 	bool radar_enabled;
-	bool no_active_monitor;
 
 	struct delayed_work roc_work;
 	struct ieee80211_vif *roc_vif;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index dcb244a3f8ea..674007dc4266 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -821,7 +821,6 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 
 	wiphy->features |= NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR |
 			   NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
-	phy->mt76->no_active_monitor = true;
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_SET_SCAN_DWELL);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_LEGACY);
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_BEACON_RATE_HT);
-- 
2.56.0


