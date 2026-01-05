Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B051DC2A073
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 00:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qAUwSXTcbTdlZ05tKagbWIWR8etmGqco3VAQevRh9HA=; b=Es6V4h4Y1Wt7BYR9wZIvBEd5XF
	4nSB3eWByTwthnT+NDAkzzuRMlsgJk+JzXMPFFey9El6XxYcqkcdY0T9gifD03gNEShQECgGFfESd
	3qaM+1FIs4+2xeAUG2ax2kHhUOcFihIC+1B5Dw829QRaVYL2ufbiFC1rWgYCJwYFJzEyCPShWfgJc
	169DKxP5IBsBgprugUd5q+KsS/kfo5cTEsu9ErHk8jvciRQm0GYPh+uxNZZDr4DM64RcOwsiTPqp5
	r/3ldii289em7UeFP51VGupIXXuR8ZcOttwRVz/1E/LVykRSjr5aRIqfKZ/J46YKvx2nleW2glixw
	YewLZLHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYR6-0000000Aa0a-3NWo;
	Mon, 05 Jan 2026 00:27:04 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYR3-0000000AZvw-0HlA
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 00:27:02 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso14569006a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 16:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767572820; x=1768177620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAUwSXTcbTdlZ05tKagbWIWR8etmGqco3VAQevRh9HA=;
        b=Z6u/DMjRVdcdG3b20LBdMQXapzWb87ySkhtl2CdlGfzmwDMTvHcjaSr0vsoYo9D52D
         R2Pe9UxXL++svBWK80Pq7Ij6jjRk+zK19cpVHJbLaOcxbQY7B7JetujHmRLfpqhT4Ytb
         YBvSuQutqXhSHNGF+4pfYzTCDukTbTJwoIOFONU0lAY/5f9vt73QQ0ws9VdvEp+Zm0pH
         sIq44PPntCO4U3VwvPU3sxQz916cNrGeCiKSR4rAv3hCYSuJAECra+e8ZdVviMEY7Y1p
         anQ7trImOa4e3JC2BN3G24kgsV882CMWF421czmA2bGyuUan288lSBm5Lh6btDrK/1VV
         zF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767572820; x=1768177620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qAUwSXTcbTdlZ05tKagbWIWR8etmGqco3VAQevRh9HA=;
        b=FIeM6Qv3Z0pcAMo5LPnO+1Kawxl0C+LpJQj+Nk2eznEsZ6o7UUdP88A5H7w36ZoJgh
         J8pnYbFrfHy5Ml4laumBMfeJ5QNW+hUvWS8cU1J9NYD3Px0UcnBNKi/ihnqo8q6m5S4N
         QDqDfGnnLKK2JSmMJxB33xSy9iQMMcbY9NneKmuhXH/diEsUT3Mp4yn3VWLMmiBcU413
         gpoJGvalFroHpBYCSv0mRM3m/sgax0mYgxuMpq3nnmTNMh9SfWsRMEa9+GgnBwYIFsg4
         2Hpmr/bpjjM38ZV3Ral0AQJ1rcpKGhgB56wmy8P3NP0TJihd1xGDZBkJdRWuzYZcA1Zt
         WVqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+6U8FKf9Qd8NYTWkz/uC4MUkEso7zKQaVbTLNO7iQla5fvmzoMXWG904J/xnRt/CD6BNNnNsfJYex1TzmQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YybPtOgWld7LSA5qPbkDC42gElZUKEeBzYKBBP5uJAvU0BhtxTe
	5sdfn4kQY0uDIUSgPgGgCG5Skx/4w4F7UDivTWhGyDp2urBFVC7/YRUZ
X-Gm-Gg: AY/fxX6kt6Ek1BFomgr+HUM1L8y81d8B6CwuHvEfJF32ZGZFznbJ+iMMaT7obPJ1qcS
	/rXjXOIbHFJdXA0ZV6a77U0ZWhEqW8PqmSQUinNeKECQcs1x6WpGZvEvfzJ/LcT6wMBa2bymEWZ
	8TActHDQ1YRaknemwOLNN8oNOdWKXbVdE/ey5Cb/+JVBOOrlpZXsNgy9yC+BSUIC8E+1vFJH5GR
	DD1LIorYDT5EOOfw/JY29QjzYemGBUioekLGPmuzu4+JVw+5b89aw3ytSqiSfHmbTfshScllHUg
	9mk92GkQlpUAcX50Na+8Zp+ipg2lO9aUCS1CnBUkRe96U3I1tUWbLpHrE6uuvSeGaVG1Q6RwrQp
	HGxerFKCPHjwerXVwq6OisiNOaTtc0gi34kKyZYWRWRBHKOTF20kdKMeHAAfx3jduiLCC8tOpxI
	9rNmO5QxH1XvvlPgr+QPJD/IJbIHGx842Dkf0FFpzbgQPZNun5xYjHA5DgDJnxu2g=
X-Google-Smtp-Source: AGHT+IEg+0O/U6jFKiIyTWm00cf6Hb3sWob6ISMuhNcfPkGZ9TORICaTgtXbn0sRqNiFULYdjJHR4w==
X-Received: by 2002:a05:7022:6b92:b0:11a:4525:5361 with SMTP id a92af1059eb24-121722a5f18mr45266378c88.6.1767572820373;
        Sun, 04 Jan 2026 16:27:00 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm133378109c88.8.2026.01.04.16.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:26:59 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: zbowling@gmail.com
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com
Subject: [PATCH 09/17] wifi: mt76: mt7925: add NULL checks in MLO link and chanctx functions
Date: Sun,  4 Jan 2026 16:26:30 -0800
Message-ID: <20260105002638.668723-10-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105002638.668723-1-zbowling@gmail.com>
References: <20260102200524.290779-1-zbowling@gmail.com>
 <20260105002638.668723-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_162701_114057_7249E308 
X-CRM114-Status: GOOD (  12.63  )
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

Add NULL pointer checks for mconf and link_conf in several functions
that were missing validation after calling mt792x_vif_to_link() and
mt792x_vif_to_bss_conf().

Functions fixed:
- mt7925_mac_set_links(): Check both primary and secondary link_conf
  before dereferencing chanreq.oper for band selection
- mt7925_link_info_changed(): Check mconf before using it to get
  link_conf, prevents NULL dereference chain
- mt7925_assign_vif_chanctx(): Check mconf before use, return -EINVAL
  if NULL; check pri_link_conf before passing to MCU function
- mt7925_unassign_vif_chanctx(): Check mconf before dereferencing,
  return early if NULL during MLO cleanup

These functions handle MLO (Multi-Link Operation) scenarios where link
configurations may not be fully set up when called, particularly during
rapid link state transitions or error recovery paths.

Prevents panics during WiFi 7 MLO link setup and teardown sequences.

Reported-by: Zac Bowling <zac@zacbowling.com>
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 39 +++++++++++++++----
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 058394b2e067..852cf8ff842f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1006,18 +1006,29 @@ mt7925_mac_set_links(struct mt76_dev *mdev, struct ieee80211_vif *vif)
 {
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct ieee80211_bss_conf *link_conf =
-		mt792x_vif_to_bss_conf(vif, mvif->deflink_id);
-	struct cfg80211_chan_def *chandef = &link_conf->chanreq.oper;
-	enum nl80211_band band = chandef->chan->band, secondary_band;
+	struct ieee80211_bss_conf *link_conf;
+	struct cfg80211_chan_def *chandef;
+	enum nl80211_band band, secondary_band;
+	u16 sel_links;
+	u8 secondary_link_id;
+
+	link_conf = mt792x_vif_to_bss_conf(vif, mvif->deflink_id);
+	if (!link_conf)
+		return;
 
-	u16 sel_links = mt76_select_links(vif, 2);
-	u8 secondary_link_id = __ffs(~BIT(mvif->deflink_id) & sel_links);
+	chandef = &link_conf->chanreq.oper;
+	band = chandef->chan->band;
+
+	sel_links = mt76_select_links(vif, 2);
+	secondary_link_id = __ffs(~BIT(mvif->deflink_id) & sel_links);
 
 	if (!ieee80211_vif_is_mld(vif) || hweight16(sel_links) < 2)
 		return;
 
 	link_conf = mt792x_vif_to_bss_conf(vif, secondary_link_id);
+	if (!link_conf)
+		return;
+
 	secondary_band = link_conf->chanreq.oper.chan->band;
 
 	if (band == NL80211_BAND_2GHZ ||
@@ -1927,7 +1938,12 @@ static void mt7925_link_info_changed(struct ieee80211_hw *hw,
 	struct ieee80211_bss_conf *link_conf;
 
 	mconf = mt792x_vif_to_link(mvif, info->link_id);
+	if (!mconf)
+		return;
+
 	link_conf = mt792x_vif_to_bss_conf(vif, mconf->link_id);
+	if (!link_conf)
+		return;
 
 	mt792x_mutex_acquire(dev);
 
@@ -2136,9 +2152,14 @@ static int mt7925_assign_vif_chanctx(struct ieee80211_hw *hw,
 
 	if (ieee80211_vif_is_mld(vif)) {
 		mconf = mt792x_vif_to_link(mvif, link_conf->link_id);
+		if (!mconf) {
+			mutex_unlock(&dev->mt76.mutex);
+			return -EINVAL;
+		}
+
 		pri_link_conf = mt792x_vif_to_bss_conf(vif, mvif->deflink_id);
 
-		if (vif->type == NL80211_IFTYPE_STATION &&
+		if (pri_link_conf && vif->type == NL80211_IFTYPE_STATION &&
 		    mconf == &mvif->bss_conf)
 			mt7925_mcu_add_bss_info(&dev->phy, NULL, pri_link_conf,
 						NULL, true);
@@ -2167,6 +2188,10 @@ static void mt7925_unassign_vif_chanctx(struct ieee80211_hw *hw,
 
 	if (ieee80211_vif_is_mld(vif)) {
 		mconf = mt792x_vif_to_link(mvif, link_conf->link_id);
+		if (!mconf) {
+			mutex_unlock(&dev->mt76.mutex);
+			return;
+		}
 
 		if (vif->type == NL80211_IFTYPE_STATION &&
 		    mconf == &mvif->bss_conf)
-- 
2.51.0


