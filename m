Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AD4EE57CE
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jan 2026 06:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMNrli8fWuq22Lopa9PXMOKtBCB18Eukz20h2BFPXfY=; b=c417ALpqRmcW25EtoPYzJ17lwz
	eb7vDv1wTA23lA5xHPiOtu+QyW3IlIZwHeMy64gqK6UnjlxHyaeoMjc083kqN8aOZv7CtM+RZPZdX
	Xt2wW26LkFxbIwz1h1qvXtSqh2rjxsSrjLeXari7zqjUJ00ihqqaKpcYit/hsp+MbRjnwCYAi63VJ
	r619fUntoIicwV9bt6FW8t/HCRHtRq/bfSiw0BIun50tDfjWTBmRtaabZnEZMwrZQGqdjB9XiyBF6
	bdyMPzAxsani2xC7E9w367QHEW18fht7RpcRRIcGIgmAU7oYXBvWUy/cL7Bfk0UtPxIjH4l6N6MfJ
	Y8SbEMvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbC7g-00000006dss-0gM2;
	Thu, 01 Jan 2026 06:25:24 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbC7b-00000006drJ-0RZ9
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jan 2026 06:25:21 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c3e921afad1so455857a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Dec 2025 22:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767248718; x=1767853518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMNrli8fWuq22Lopa9PXMOKtBCB18Eukz20h2BFPXfY=;
        b=ZqpOkoscHVGlhU7TI7tdXaG5qQvgio6lGXLyEN7J5b5bJEd/dJJnREdbFV6OB1hR0F
         Qr9ChTyXsDqK2FpbqfbrgdMJeCt+rww0aSOcYOdvqK7RoOVK0h27p04ALFivkjAU1GD8
         w/QRfUa6W61i0BEmgc6G4DQp7GPw4h73Y0cXMEykN5L5TRZT2FMUZeqDhJEo0uBcB2wF
         4Qhpj31R58RgJx4Om0wH9o6P+UtOlISQVVBDuSAYmi/LoDO7r96le+XR4sR+3yiCy88P
         M2wk499v2Ntd+9BnU/tOPgZd2b84+F6scc+mYUncBX2Bw1RkbKKJRTfR9A3UH/KxZspG
         oRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767248718; x=1767853518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LMNrli8fWuq22Lopa9PXMOKtBCB18Eukz20h2BFPXfY=;
        b=FWB+YWmO6xM9l31FFsHXOlUOqMVJ5gG4oDYuAnJCbzdudjzJPjABL7dGrR7gvbdEdz
         1r1KvsxYwMkW2j3FnecA/OP8C2lEsLjYxwgVvN6fFPD1gGbQikaPP9QYHnlyGhBmESPu
         D6yaujTmysjG5JE0oEc42bXnZ+JzZmyoiZtzX9Hse5XiY/i5cFKwmW1RJkfw5Kr6pKCH
         CQNGsH0GQs5SqsyryuVDLPJJHvIoLEg5PQl3lnIYJLkcZCSAqAYMjBhZubJ4lATsvqf8
         tB/M8QNoad4Q1ALRKULgSoI/7B9L+wZYQ1UJf2SPF3p+mOt/4154CT/Jl4cLYzNoWlUT
         HAEA==
X-Gm-Message-State: AOJu0Yy4z51aVDimYtZaTcsebG+iYBc0dIO6EuCATEpaWFj4AluvTFo0
	kAL3hNKbBauadPdHE0Lvu5xShdXzyd0518ca/JugneGsk4MG3vfX448R
X-Gm-Gg: AY/fxX7zsCQHBSgKwURbzXPNq+iVKJGEV1u4WGHN8aLjyEKSMVrHuRiCtgVIei1x2FH
	I/rWuzf22FUrzve3blu0tuD0HPGsGyStrxo3AjcVuEuIpa5xKwbDQG/y3N6m2B5Fx4q1NX1f8kW
	/ezrizF/tXUXJihlmEvy+22//aeGqebB6UabWg8Kp3nIWlTtdPnLql39Mt0UGdgGtfkm9YOAc+2
	mQ9KElVmMAm799Yw9z3DyFumI/KOx/iCyWFf3tk8ReMCoDMXS93mPDLrkj9oupoo67UK8seG5cg
	psPayXPu+efwtXaqC+yBWDmYVasm3It4OYdVfyg7brpPzOvC0f6OaM7EkbIxDlNXrfuZibNA2If
	fyQjrkxJY3inbYF2fZPtMBKAjVUEiE8qjEkYd2rZk7R/8vDW37gP+bmebLu1Gk7E2vAkloc1Y/4
	tvsYqxYu6jRW8tVyUr3azIPu5KT0DMs7knJZS9lxZGF9pFpEb1uNQx+F+4wh/8zw==
X-Google-Smtp-Source: AGHT+IF8c3kpymCYxXLtXHPXPOh7mPJtKHA7XR9XpNIl8rN7FB8iVPcgOKK7KP9TRQAMuRn8Gghr5A==
X-Received: by 2002:a05:7022:238f:b0:11f:3483:bbb2 with SMTP id a92af1059eb24-121722aae15mr34466776c88.12.1767248718059;
        Wed, 31 Dec 2025 22:25:18 -0800 (PST)
Received: from zubuntu.home.zacbowling.com ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121725548b5sm147035158c88.17.2025.12.31.22.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 22:25:17 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvalo@kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	ryder.lee@mediatek.com
Subject: [PATCH] wifi: mt76: mt7925: add NULL checks in MLO link and chanctx functions
Date: Wed, 31 Dec 2025 22:25:14 -0800
Message-ID: <20260101062514.186040-3-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260101062514.186040-1-zbowling@gmail.com>
References: <CAOFcj8Sad3pLohFfRdj5jzK3Zs3FAjFVBuzH=80i_m1YqSbpfA@mail.gmail.com>
 <20260101062514.186040-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_222520_371700_93DCAD26 
X-CRM114-Status: GOOD (  12.68  )
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

From: Zac Bowling <zac@zacbowling.com>

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

Reported-by: Zac Bowling <zac@zacbowling.com>
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


