Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B191D47CAE
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZlc8vYTcRnUgM5gL9ljbqiK/D1gsQfXcDj7/vtO1vs=; b=Vwic44/QN5WTXsflBnMQ51dH1j
	C4hX29R6mI4YMUli7fBDAW4DtRs0EKX66dv7idUuofhexYzr/XPWQGNT8OJgmByfcgihZTBJUMwNM
	aJBzBtnR0AmbkT8N4iz0Q/c7PK2DEgrwTc62yGPe42Oc642kDwCXFjGbgceLtcHMLt1bee8RfS93O
	V/9noZpuNBuVg4DHf5Qz2CtoQEcC61jMEQqj+PQRiVHpKI3jpP9nkjFav9R6D07BNkBwmtUa99i5q
	16Xm2k2v7oOxTFnweI087BIYEDCCR+kIYdEnXM4QQVvwK0XfGsbgVgKtDCx3UH4kkzqoSkxDAUKsG
	dux2r26g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHW-0000000DOXG-1LIu;
	Fri, 16 Jan 2026 01:05:42 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHR-0000000DOTQ-1nUB
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:39 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2b04fcfc0daso1838530eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525536; x=1769130336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZlc8vYTcRnUgM5gL9ljbqiK/D1gsQfXcDj7/vtO1vs=;
        b=hZ/OHgePT+zQcklOEnF2hFy3JyqE7yxDyhNRAmZ51lvscEtQGNTRSPZlLwUzuE7JjJ
         RwD64DtLn6qv2eJ0Sk+KbRQSo0JbUomfJQGVKAuOFBes96XzX8e82w/Ph//Wn9NSaOZN
         tr3QP//oKL8jVhVreRH5yiHJilQoEZ+87GJyYZMPK6V5eJShwCMHQrPBlJEcLG4D3HnK
         aSCn+++zjyFA4v35esD8H3rnX+9d2b7c5VbIg2/A9yQeul4OZ3npMTmf8kzkU0PoLOXy
         oVD3iRRLY4K6S098MN8XCvYGkeJNFJ7tDWkO9oeARgf59oSwiPup4I/YcxvpTT748zYr
         y9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525536; x=1769130336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZlc8vYTcRnUgM5gL9ljbqiK/D1gsQfXcDj7/vtO1vs=;
        b=FNK3HXQ/JVZKPyeAbHpvEz9PPesdYeNBUL10sc4N0xCfKhLy7nl44fDwDr85pj8kf1
         rdMrgVJvomEeDagLu65h+zyZAXenorincHpw4US0aRrZPF9nhB+0IKvjLaHZ7SkmxK6R
         3wxJxx/JgjlbDkHiXGS4aegSdhlpR8g5l7PHBN9u/SzT8MfiIRGffwMp0coFvtJXn4+6
         zVBJgAaDOmGD2u8iYAsA9IP79vR4PDTqno23eGcYal63wP1FugS/ZKz54PMTH7c3TbZ/
         BPDrG6FdM19eC3UjagPHmIWkIlG9jzgyIHdu826NoPC9V70erGAi9aaDWC6eNjp1ubHU
         dQhw==
X-Forwarded-Encrypted: i=1; AJvYcCVa9pOYHaP03QaYsLKK6Epr09OaOCASHO6vr/Ok+Zr387cf5/pI85T1Rgd4szjcd3HxaorBdD2R/kw/el+jsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhq5ujoQeMFdhocyUfta+E6P4657Mlk8tPwhvoGRh/LhhI0/BC
	aAz1jsr6LqDfjOmZkXIaf4pbrGKKSppPDqTL4OGDPV33kon762LD76xd
X-Gm-Gg: AY/fxX5ndnL6xxHgOD2J32LweuVzPxuCQwQUFoYO8Jgt5KjdNaLRfnC6fJALdIOPM2h
	pBfsqKnsvTCpcZ5O2ewa5O7dKx/Xf7NUo7lF5/9i9QaRkH5wqPjP7K2LELc0Z33KL0FQuIoh6L8
	B4cCV/K8H8/mEM4uJZ2dbMoVg4t9e0GmUdl1UeKmbD3UXzXpzVhfopH/QFanyyIevvT16j/+1os
	XePBfoqeS5LbJbxKw4iBg7r86WRQlmcVwBG4S1L+1hVBJiS28Pjyjdlo8yZ+lvSuPDLtBXPVK5D
	LbW7xm6ljB/up+aaWb2lt5OsJf4zVkYishnpMRFj7OzmNce9oexEx7DTzAboNiunEaVpUzm9eB7
	nND/kG8PWkEhqy93NWadBHfQhcEjE/KQIorsgRj5nVH4UeNnmPoSHB326rBYifyFn0aMOJXtx82
	FaaMal7cNCFVCbYJ6JPBihfsLNC9C8MKlDiXFi7Qjuq/QXbQpBHiCt9dlqSZwCsA==
X-Received: by 2002:a05:7300:b505:b0:2b0:5412:3ef with SMTP id 5a478bee46e88-2b6b412b810mr1269769eec.42.1768525536379;
        Thu, 15 Jan 2026 17:05:36 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:35 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	linux@frame.work,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	Zac Bowling <zbowling@gmail.com>,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH v4 09/21] wifi: mt76: mt7925: add NULL checks in MLO link and chanctx functions
Date: Thu, 15 Jan 2026 17:05:07 -0800
Message-ID: <20260116010519.37001-10-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170538_141070_00F614BB 
X-CRM114-Status: GOOD (  12.64  )
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

From: Zac Bowling <zbowling@gmail.com>

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
index 058394b2e0..852cf8ff84 100644
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
 
-	u16 sel_links = mt76_select_links(vif, 2);
-	u8 secondary_link_id = __ffs(~BIT(mvif->deflink_id) & sel_links);
+	link_conf = mt792x_vif_to_bss_conf(vif, mvif->deflink_id);
+	if (!link_conf)
+		return;
+
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
2.52.0


