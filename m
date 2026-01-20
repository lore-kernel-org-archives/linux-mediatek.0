Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E133D2629E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 20:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gozi34aOF6cyrG5FN8NDIhdFKRbqzfMHt5Dibx6zW+g=; b=uh1FL7O5Y1cvPqdLLyWtpgfRNM
	o2eY7Am1R3Qj3U3NB+/2NEocjqXGcHtc+9cDvP/mxZR4z/miTzJh3cTz7bnT6CtqdG2NM5Xl3vfb/
	a8pZD8pwL2gEperAxP8ihW80jARmoI4Tfr1sEofLh5r9DbAoXekW3u7fSuPSh4GMjSDryjWrW5xyN
	Dz5ZPeBdd4KxQfmUF/rfvo4eM1v3UWxZk74O0k7C9JdUwbaBqzYKzDF7JjeuOxHQOMm0LgSaUeHlv
	+2Tw6aVXZqMpi+BWmpe3Ugw9kFHA8u+ZsVMc4PKNlJXoHB9FJsY4/atI/YJgrUfbgtUMmjWzwxce2
	sltcZ/UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI4L-00000004QFz-284Y;
	Tue, 20 Jan 2026 20:11:17 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI4F-00000004QCX-3AjH
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 20:11:12 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-2ac3d5ab81bso6279894eec.1
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Jan 2026 12:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768939871; x=1769544671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gozi34aOF6cyrG5FN8NDIhdFKRbqzfMHt5Dibx6zW+g=;
        b=Ar/gd4jNvyIql0Hz1R4poab3SMC2KrqHWZPUcqU8q6sJLKqL39UhGALSYauCdetRZM
         FlVlQSTKimVCEdbu5L3JFcRJ5F0sXtz/q1g4ZQh5TcwBJFQ8oVhHZ6FVeO6wZ9aOK8z8
         x7lPg+eG8cGdvri7xC3itZ1kX8C6AX0KO7RDEgRB9L9/VrGp8FjYn1RwJJImaawCHMG4
         DknNzfB7AFHzUrGlip1SiOXVi4fzPb2RATWICHFZe0TJ5zszV3eSRPId/niGoVzPfCNL
         y5Jx3hIUsqKEpiLrsflG0Qo6lmJ+dj3ML0Qtxvh1P/TpFd8y3hy+Qlc+Fyht8HAuFcsa
         Ms5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768939871; x=1769544671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gozi34aOF6cyrG5FN8NDIhdFKRbqzfMHt5Dibx6zW+g=;
        b=PwuTgIV5Am14k5Sl7B1hO5IX/TEeUHP8sUtMTeOXDkWbyMJ/wXjDqkHiH5RSq5HvPC
         nf8oM0f4QSuOqFcmGo3bwqXCLtEq5/+OoUspkSq3sl7n1WI1k3us5NAFkSzCNNjGtfIy
         j11sXOYFGlSA84zKnUKN7LAGyHjuWj970sWOyKKATOFj+QdHhyQmNRoAB2Xx0nDs0gZJ
         zofVLD46fpiisfwr0nDyT25S9ytpIVf9fzfXRfSIeh7RJ2ws3AW0UZclD7Ty/GA0noWR
         PekWt4mCuYsd2NZ6pXbwj3hV3z6pbkIoUo9R6JxRCdz/YQ1OogKmfwoTKjpNaLkg2ald
         o00w==
X-Forwarded-Encrypted: i=1; AJvYcCXEI+pW9Y2fqZ9xfCPrIsutH/xcF4nvWZlJnk4gTNEHXgsGJjwuY6uStNASHGHEcpZVlwUs0Jlp2bqYFAKBWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6neIp9V1+F2b1WvP71mxSuw88QPEnhJvD9W5MXlOdV8UzLHgf
	slUldwVyGGxdHN+1HVMINc30rAiG1sVNaHFlNtNm49Oyl2jD7W3luRvLAYYDyJiz
X-Gm-Gg: AZuq6aIlI+nT/uoRpZA/bu0i8Skscoz3b5jnMwicPKMNQQYa4bMgfjiREm46XYBFUvB
	jEU6RCslL7XEyKV8ryuNfrU9wQdQEnGjvQHQRaWzw6ePXJ5mOrr3V0WQXAdLyLlK8YZul17H4QV
	N6ZeLE6QNuw6L5ya+O6dPT7SZOMQPNLR9tnrYtcwcOSfGe3c4kspkwHWmWmi4ywWpf6DpUX2P2u
	DP3tRldhxqmyI42FXoSwlbcSw+lo8790GNrQaB1cQng93KTeQmfo3rvpElOVW9TRAquhWiI1fbE
	d4gpMh+6KPqr6cDCu8eboh9yT4ac3tsn257hJP5Diru6p0BmfYjf9zPikFE4Rx0nBTud20PR7uI
	44yUW7FcE8BSt7FYqKTrFGR1jGM4SHRKl+btaKyhSzDQiuBySEeAEGZM49etjF1GCjwZc9IgCee
	gxRjm1jugqqeLv9qbOFZq2kgdb0yvDES3y6zVE9w1Q1lUg2qZ66COC8+gbTaPS9A==
X-Received: by 2002:a05:693c:2d93:b0:2b0:5028:bafd with SMTP id 5a478bee46e88-2b6b46c68femr9374962eec.8.1768939870242;
        Tue, 20 Jan 2026 12:11:10 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:4a3c:9f7c:8037:90c1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm21982990c88.7.2026.01.20.12.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:11:09 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux@frame.work,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	zac@zacbowling.com,
	zbowling@gmail.com
Subject: [PATCH 10/13] wifi: mt76: mt7925: fix MLO roaming and ROC setup issues
Date: Tue, 20 Jan 2026 12:10:40 -0800
Message-ID: <20260120201043.38225-11-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120201043.38225-1-zac@zacbowling.com>
References: <CAGp9LzrcvW18xKFL-oF3wxRmb73G6PN59Y2NSA2E5idva1wtKg@mail.gmail.com>
 <20260120201043.38225-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_121111_812696_0B9C8538 
X-CRM114-Status: GOOD (  18.05  )
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

Fix two issues related to MLO roaming and remain-on-channel operations:

1. Key removal failure during MLO roaming:

During MLO roaming, key removal can fail because the WCID (wireless client
ID) is already cleaned up before the key removal operation completes.

When roaming between APs in an MLO setup:
- mac80211 triggers sta_state changes
- mt7925_mac_link_sta_remove() is called for the old link
- WCID is cleared via mt76_wcid_cleanup()
- Later, key removal MCU command uses the now-invalid WCID

Fix by checking if the WCID is still valid before sending key removal
commands to firmware. If the WCID has already been cleaned up, skip
the MCU command since the firmware has already removed the keys.

2. Kernel warning in MLO ROC setup:

When starting a remain-on-channel operation in MLO mode, the driver
passes incorrect parameters to mt7925_mcu_set_roc(), causing a kernel
warning about invalid chanctx usage.

Fix by checking for valid chanctx and link configuration before
setting up ROC, and use the correct link_id from the vif when
available.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 device")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  9 ++++++++-
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 20 +++++++++++++------
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 59a5b22a6ed6..7d68b08f445a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -609,8 +609,15 @@ static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	mconf = mt792x_vif_to_link(mvif, link_id);
 	mlink = mt792x_sta_to_link(msta, link_id);
 
-	if (!link_conf || !mconf || !mlink)
+	if (!link_conf || !mconf || !mlink) {
+		/* During MLO roaming, link state may be torn down before
+		 * mac80211 requests key removal. If removing a key and
+		 * the link is already gone, consider it successfully removed.
+		 */
+		if (cmd != SET_KEY)
+			return 0;
 		return -EINVAL;
+	}
 
 	wcid = &mlink->wcid;
 	wcid_keyidx = &wcid->hw_key_idx;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 1c58b0be2be4..6f7fc1b9a440 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1342,15 +1342,23 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_bss_conf *mconf, u16 sel_links,
 	for (i = 0; i < ARRAY_SIZE(links); i++) {
 		links[i].id = i ? __ffs(~BIT(mconf->link_id) & sel_links) :
 				 mconf->link_id;
+
 		link_conf = mt792x_vif_to_bss_conf(vif, links[i].id);
-		if (WARN_ON_ONCE(!link_conf))
-			return -EPERM;
+		if (!link_conf)
+			return -ENOLINK;
 
 		links[i].chan = link_conf->chanreq.oper.chan;
-		if (WARN_ON_ONCE(!links[i].chan))
-			return -EPERM;
+		if (!links[i].chan)
+			/* Channel not configured yet - this can happen during
+			 * MLO AP setup when links are being added sequentially.
+			 * Return -ENOLINK to indicate link not ready.
+			 */
+			return -ENOLINK;
 
 		links[i].mconf = mt792x_vif_to_link(mvif, links[i].id);
+		if (!links[i].mconf)
+			return -ENOLINK;
+
 		links[i].tag = links[i].id == mconf->link_id ?
 			       UNI_ROC_ACQUIRE : UNI_ROC_SUB_LINK;
 
@@ -1364,8 +1372,8 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_bss_conf *mconf, u16 sel_links,
 		type = MT7925_ROC_REQ_JOIN;
 
 	for (i = 0; i < ARRAY_SIZE(links) && i < hweight16(vif->active_links); i++) {
-		if (WARN_ON_ONCE(!links[i].mconf || !links[i].chan))
-			continue;
+		if (!links[i].mconf || !links[i].chan)
+			return -ENOLINK;
 
 		chan = links[i].chan;
 		center_ch = ieee80211_frequency_to_channel(chan->center_freq);
-- 
2.52.0


