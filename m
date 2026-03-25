Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFA5FEA807
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 04:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ika1/FjTxLuXkdWOoIqmABi9uDJ406BAjclKCV4m4/4=; b=PvxjTkv0nydp5qFSmnvAF60oTw
	ShqtRGvZ8Q11RHqgBL1Kn7x2CBE2qN/gQ1/r0ov989Ty+lhwQqooPw0CjYX48sqGScLkBHtns3+9P
	JaMKPmrOI8ljcBtO4esV4NxLm2fzkYB1tz2bQ0HZMHKvmJuBRPBjz0Rl3mvQwA+X38cAtQFyLQ7ef
	6aS38AhU06HSFNCcRWhU9rD+kGhhK/7vcsegI9yKgr/IYexmPcSTm3Si/2xRlmsD3noYjzri0+Xi+
	xQSqtHRQEQ5W6NMeALDVAJBFgJNoMAF0nkLCImGybdkz0gUHWRJZXTz1FN9KW5A3j3uGsxs2II0c/
	xC/uvLUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Fw0-00000002gTW-0YdB;
	Wed, 25 Mar 2026 04:33:36 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Fvy-00000002gSc-1rCX
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Mar 2026 04:33:35 +0000
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79ab3e26cceso20102167b3.3
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Mar 2026 21:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774413213; x=1775018013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ika1/FjTxLuXkdWOoIqmABi9uDJ406BAjclKCV4m4/4=;
        b=DfTc3TsWoxDM5Wu+AzAo7RyK1A7PrrjSQnW59AERJCJ7ovoKizs8sWELXag0jzsn3F
         1akwoWi9UO0YNj5zTnut+ERRHy12O8zjR02FhWOdtWsFTFB2xSTeJuFIwvmw/fLzBstx
         QT+aAlpjVOR2lydhdkdhmFjTmy+H9bcIg2purjPVjGvSP5/rriHYUj3rxgnNTMFsVD1L
         vaTl9OZY52tHeYyfj0BzDm7xNmUSzX1NwVWYxWuZEljMIeoqNiAP3klMgkdsIgldRnNy
         +h376xnywydz5CoulU85a8WDc5by8cp8T4PmwRpw+1d9qQAlICKkIXmrjEpuYkAIhakj
         pDsA==
X-Forwarded-Encrypted: i=1; AJvYcCVvmadjKMbaDX1Sy0cgiM+xXflHt+3HmW2VB+qUp3u/HtxnhPwxj0foAt5zMl2rIqWT/lA6EvvS7FdOjtehUg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp7Jx61Smjr+HQcOw21bQaly0Jq8JwsG/tVZh6CW3Lc+VnJvf5
	+McT0FoStgDke+jyXVQKA3rUI3Brd6C5lTfimoQwfiF7JUnQQXNH/vjT
X-Gm-Gg: ATEYQzz5cEXTIYPVGjKk25FYmROIsocWVSBsTqPYltw4+HzHyuwD58b9+dtFmmkdrfh
	IhW/bwHiIyzY3rRc19urZkj95xliAjxB1htDPnn9hMeWI1Nhj35904Eb88UbG5jm606U6VDka2x
	cXzUlGd0vbEGd9QBHXFFAa3jpOKPXJjH/PgLkTHomSz8EUnEJ+/aQKaK966+AS6pAg33OA3GtjW
	dsjJ7OiYVHV+tW9+8gXG06Y3vl3tf/te1kvWcNPRmEO26efI7W+D+DBaVzDpcgaIq77LU3ah9X8
	7UXeC94E9b3n20HFThqkfA5FBFLNHJy6wUfRbT7Xlbez/BAOqDbKTs8VvK8acLRYItN8eUBrULi
	DGPoV/gIgIi/HjuDQ001oqBkhx11C1admkkSM8IVqAIP6g0XPJvj8gXPOHJJFqmNDObERIem1Nr
	O7O/4uucaHGmGnzkRhzyd4WmJ0xRur98kCnhghlKUiHDHdb9wDQV9j31T6Lkc9fhs=
X-Received: by 2002:a05:690c:17:b0:79a:c98d:2ba8 with SMTP id 00721157ae682-79acf77aadbmr23290287b3.62.1774413213013;
        Tue, 24 Mar 2026 21:33:33 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:3916:ec63:baa5:b5f0])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903e0b8csm82707977b3.12.2026.03.24.21.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 21:33:32 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 3/3] wifi: mt76: mt792x: report txpower for the requested vif link
Date: Tue, 24 Mar 2026 23:33:18 -0500
Message-ID: <20260325043318.13298-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325043318.13298-1-sean.wang@kernel.org>
References: <20260325043318.13298-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_213334_494177_6FB0DF04 
X-CRM114-Status: GOOD (  14.84  )
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

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
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


