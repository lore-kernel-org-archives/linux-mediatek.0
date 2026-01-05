Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B91C2A062
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 00:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UazWknOwH04QsneRRrwVbzYeSZapNaz/xF6C2obac4=; b=SfgUs00hNCJMBtPmDKJY3rI05l
	C2TM4nEQ7PKDHMhp9y3rGxSFKt9yDJ5sBaDGBEt65v5Qk7U8V8qi3eojlW9PGJC1c4lE2kARHHYqv
	JL2+ifa23yIgcDdN9p50g6NGtBeHhfWKcPyeoJ2MI8XoZSuNS5ZfeXFeyDH1CETxrO5+j2Lvj7nc9
	U42VW2e3av8BpjRFz1SpWH8pNBkp6GGZ/6yy/34euRI4VrVtPoMbIlf/l8k3w2uPruqo2LBw15Gqr
	69mcDKFZiJ8xlftiNonWSdFPhF0R/KtbTKXrlImu8nzgxpWvF62uBbWA+qUnmIumzPQGMGjSJuknr
	F+UdhemA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYRE-0000000Aa96-2YXC;
	Mon, 05 Jan 2026 00:27:12 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYR8-0000000Aa3F-3BqX
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 00:27:09 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-29efd139227so178072185ad.1
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 16:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767572826; x=1768177626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UazWknOwH04QsneRRrwVbzYeSZapNaz/xF6C2obac4=;
        b=mZAiEaarPSijLGo30vbdlh+PHp+XUSmFHI91hsNvWLbsy8Qe7HcGcaw9Mzwrd/doKa
         rbo44JtKCyUBJVLUjihq0HwEYoX0hLeZAWzcboQ/xJ796DemSDHbGS+7bGw5HguHxaRH
         0hQZNLmXKAHoM1f+svF4AZYbqDz6WJLDMntY6YOiQ5sSM0nQa7m0tL8SkysRB3lKwaKc
         nr3zi8021BfNy+ApHNaY69adbtMVk5h4vc4Y0BternE2M9BnMzf2tO20BXJInSfuZokn
         lv/ml6clUdjIpY2qkjtNqVozxwXmnAy3lIbNf0pbcOVsVCDoYSZ3m+tpSSrMTmlhlto3
         lGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767572826; x=1768177626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UazWknOwH04QsneRRrwVbzYeSZapNaz/xF6C2obac4=;
        b=GVZxVRLk4AKmvY0eYQ+KtLw9bfdBwnVq4JlKVaHxE5jfp5iTV4PtkOlPx5x22WkUjg
         /MdhXWD8ZksRlZm1S58xjMq0d0UJ0NGuWDB14pwNkQxM2ezFTaWljVohZkl7lb9sO9iw
         Xt4SY4PJ4hVRKZ4XL3z3FeWv2OWprqeva08PHGDAyPIaOE2xG4YV80wcTdzUXTnweH9N
         Z/xkBzy6Mp2boWS0Zy46lwpLXIqhEXHzucYD9AE50xKU4ueTt/Eay5Ppn6t6ktJx3XTc
         bxnuMg5A4iJw5C42HtstqaXiJAytNMuRVntczOlObdR6msPIUid4MT1zo84R/KoBtqfs
         0dBg==
X-Forwarded-Encrypted: i=1; AJvYcCVALk8NiXcWwp1qIIk+ySppA8JLEkoRUxBvzXEmtkL75L3ez+Pyu2cp3dRXUphRExi2L9c1rl9i8DG+TzzuIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwTwzFfJEjZQlV7a574QpgKGoVfvSdEj6yv8UoVI06S415pTuf
	Eaj/ervwUE7m5TNgZo+2+mFOhLIDt1MbHsDxugbXVCYdOHX5KbH7b7bS
X-Gm-Gg: AY/fxX6dz+0pDQKKOSN0vAnte7okJ1HXEL9D2rRp983cto3JgQo1UuOU/EMISvWkRUM
	H5ik1oQtK0Q28EO7ljvpZ2jUpXtvyLaqHzl/i4Yi17JKvwybUmNgPgpcQ5KgFrsngmUi+nu0ckc
	cf4S2540/TE0ovRjBI0jSkC64OiywjRgf2xOHCf4QzymieVIvszP627ijkh+Ok9IQgUsZZIltp6
	vXnBHaihTGD7jvfpe8F5bFNpKDMdTrg08Joo6jMjTTk+j8fxPJUYokSMMlvowQM805u2azESc8J
	lx94rheLIBt6Jmud0mFpJmAZUsqX2QMUVwtWjUhyj/vDpMgaIT3T4oEHNsBFkT1XbTxiG9wnhnf
	ozANcV2uGude8cnE2dKnZgjyfYsm1LLoccg8sJ5p4tr0dS38P/9Ez5h1kBkGtt6kxF9AeXX7XlN
	hpf6J+BguNrLovsgw1BgOYHHZNe/nsYHGtvb2Nq68idP3H1GmCH1v4GlYzuv2RZBs=
X-Google-Smtp-Source: AGHT+IHo0J1leWdPLu3WQhod7DNS+GZTgRh6fGvRRczAieCCr4pVXf1vgQz9pV4AVAq0GzwSrDdpEg==
X-Received: by 2002:a05:7022:428b:b0:11b:f056:a19b with SMTP id a92af1059eb24-121722ab37dmr45418431c88.18.1767572825820;
        Sun, 04 Jan 2026 16:27:05 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm133378109c88.8.2026.01.04.16.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:27:05 -0800 (PST)
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
Subject: [PATCH 14/17] wifi: mt76: mt7925: add NULL checks for MLO link pointers in MCU functions
Date: Sun,  4 Jan 2026 16:26:35 -0800
Message-ID: <20260105002638.668723-15-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105002638.668723-1-zbowling@gmail.com>
References: <20260102200524.290779-1-zbowling@gmail.com>
 <20260105002638.668723-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_162706_800841_60B2EA86 
X-CRM114-Status: GOOD (  12.00  )
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

Several MCU functions dereference pointers returned by mt792x_sta_to_link()
and mt792x_vif_to_link() without checking for NULL. During MLO state
transitions, these functions can return NULL when link state is being
set up or torn down, causing kernel NULL pointer dereferences.

Add NULL checks in the following functions:

- mt7925_mcu_sta_hdr_trans_tlv(): Check mlink before dereferencing wcid
- mt7925_mcu_wtbl_update_hdr_trans(): Check mlink and mconf before use
- mt7925_mcu_sta_amsdu_tlv(): Check mlink before setting amsdu flag
- mt7925_mcu_sta_mld_tlv(): Check mconf and mlink in link iteration loop
- mt7925_mcu_sta_update(): Initialize mlink to NULL and check both
  link_sta and mlink in the ternary condition

These race conditions can occur during:
- MLO link setup/teardown
- Station add/remove operations
- Firmware command generation during state transitions

Found through static analysis (clang-tidy) and pattern matching similar
to fixes in mt7996 and ath12k drivers for MLO link state handling.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 8080fea30d23..6f7fc1b9a440 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1087,6 +1087,8 @@ mt7925_mcu_sta_hdr_trans_tlv(struct sk_buff *skb,
 		struct mt792x_link_sta *mlink;
 
 		mlink = mt792x_sta_to_link(msta, link_sta->link_id);
+		if (!mlink)
+			return;
 		wcid = &mlink->wcid;
 	} else {
 		wcid = &mvif->sta.deflink.wcid;
@@ -1120,6 +1122,9 @@ int mt7925_mcu_wtbl_update_hdr_trans(struct mt792x_dev *dev,
 	link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
 	mconf = mt792x_vif_to_link(mvif, link_id);
 
+	if (!mlink || !mconf)
+		return -EINVAL;
+
 	skb = __mt76_connac_mcu_alloc_sta_req(&dev->mt76, &mconf->mt76,
 					      &mlink->wcid,
 					      MT7925_STA_UPDATE_MAX_SIZE);
@@ -1751,6 +1756,8 @@ mt7925_mcu_sta_amsdu_tlv(struct sk_buff *skb,
 	amsdu->amsdu_en = true;
 
 	mlink = mt792x_sta_to_link(msta, link_sta->link_id);
+	if (!mlink)
+		return;
 	mlink->wcid.amsdu = true;
 
 	switch (link_sta->agg.max_amsdu_len) {
@@ -1953,6 +1960,9 @@ mt7925_mcu_sta_mld_tlv(struct sk_buff *skb,
 
 		mconf = mt792x_vif_to_link(mvif, i);
 		mlink = mt792x_sta_to_link(msta, i);
+		if (!mconf || !mlink)
+			continue;
+
 		mld->link[cnt].wlan_id = cpu_to_le16(mlink->wcid.idx);
 		mld->link[cnt++].bss_idx = mconf->mt76.idx;
 
@@ -2045,7 +2055,7 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 		.rcpi = to_rcpi(rssi),
 	};
 	struct mt792x_sta *msta;
-	struct mt792x_link_sta *mlink;
+	struct mt792x_link_sta *mlink = NULL;
 
 	lockdep_assert_held(&dev->mt76.mutex);
 
@@ -2053,7 +2063,7 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 		msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
 		mlink = mt792x_sta_to_link(msta, link_sta->link_id);
 	}
-	info.wcid = link_sta ? &mlink->wcid : &mvif->sta.deflink.wcid;
+	info.wcid = (link_sta && mlink) ? &mlink->wcid : &mvif->sta.deflink.wcid;
 	info.newly = state != MT76_STA_INFO_STATE_ASSOC;
 
 	return mt7925_mcu_sta_cmd(&dev->mphy, &info);
-- 
2.51.0


