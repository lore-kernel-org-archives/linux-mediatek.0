Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63CEFA3755
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jan 2026 20:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAEbXECWEgivnkQD0xtzzqIp3unNQs37uaq9tRUxuXg=; b=rPw7JwN9/ijB187QQOZY7pVJQT
	mTdvN2+eKC6xzkTmVgP7oUMhl3iSvfqGEbAChFujsNID3iB+z+0GMC7H37U1VEQzt6WwbBfGQBsEP
	KHM+lKGZzCUVu9qZ4Ih2ZCpTg2Zjga15y+ZewkInk62zSR9c0t/G55aVTmc6K+umLo+oNVlPoGGeD
	GGjeWI0duXViTi16BuJkJZfw+xlhuKCvcYednGPpv9HFpOLyXc1MWkOOknHLAYEFMDvVUUem6ughE
	BjOKRz9j22nA/6EU1uQKbHaWs22J//R42cVwLbukrAiwjtIff9j9aObBHB96hMAo8RVlH3S9WNcy8
	gEVNjKaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vblMq-00000008gh2-1b1O;
	Fri, 02 Jan 2026 20:03:24 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vblMo-00000008gfh-0ojw
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jan 2026 20:03:23 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-29f1bc40b35so219094435ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Jan 2026 12:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767384201; x=1767989001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAEbXECWEgivnkQD0xtzzqIp3unNQs37uaq9tRUxuXg=;
        b=Km76GkxQuhtYy02MrWzeGR/Imp30tHRYlxJ/kltDw836E+Au470LXwdiQuHO36mveL
         lj3xNFlF3S7DMIBXlPQfK1se4w7jRlEidouMvOYrB3LxhBASSTaSMWYFJxlMRbiEkSy0
         WIWxWqcyDA2pkMPVhNOrpIRW7bYXmirNNvHlzDBFhKQGPYodIvSY3fWXRHn3GjbEiNyR
         YWEX6UQnGmfRDh+7gzKfLVVL9rB/Wh582zIUM7Capw7xVLMNoSJwZxhu2a6HzhVfjEP9
         KKgm3xY7VYJRQFiRmGdoZlgiA50/mDsr7c1NuV3/u0S6RFW8BI0g6V42EK3rhGfXXyA8
         2+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767384201; x=1767989001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JAEbXECWEgivnkQD0xtzzqIp3unNQs37uaq9tRUxuXg=;
        b=C2FJ82HE6tnM/Mn36OZgtA3glqoGbUeNwUILRT3YHIGVGo5klCPcXNFn8wBpmjscY1
         AIfLJ+FT/nOn8Uvz5K3EwV8Cz8ZvLUu/rkOrSz1z8yACxayrjcuM7MiyIftnm2VfKCKg
         qZmi+mdiknMRVZOWa3I/+TC85rlfRKUAdxcTm8nOYsuIOAXYt6nHldEOntbmgjdeluI5
         TWUYwcJTtcDJaToTLgyoTe1fGTwDhIdvIcvfBf/LAOdO3FmxyrAt+QyTHGlCs/M5L9fm
         aX+kh82mfxgZrgKquRcQIBZPoKk6GsCy6LmfCr0D19t64KxKJx+7XkubJdYd9yczbnl/
         JXzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOR1Hssj59ekxo/EpUnycoRRm2cxGeokjZm0JP1phCyGJM0z9YAc+9JcuiUojB7FPY1PtIfAAZ96L2qVFokg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYqrnftGFspI8gFL6MG/nSCbPurRuibphBtp2cL+E7YMTuGw+Z
	AH1yJKnssqEuAi6T7m7MJeb6BPpEB2n8yWnQH2lKbFviSeMAl2q768ff
X-Gm-Gg: AY/fxX7meyklCmWAHCyQraw8skOgrf1gqKEeE4kG5cFbvcdvkroviR2M+RBX9KVaERG
	fNsJwaUwuXe+IPLo2WWxdWgsVYlqXxGfeWUftmlXMGsu+ppOS+3NDjmOALWHxdORP2GLXwvCSNB
	mDAvPie+Idz1/NgHrnxXWLhGqdYU1SwW+nmS+hSECdHNXhBKt1f90m2JC5+0h9+QO92Wur4PoBe
	LiNYKqMkamBnIYme5gCs0Fs5kgIwCiYU5MIdoaBGsymMXPkJVRg/An/GLufsNNi04x3c8G5QGf+
	BEcqNURtt6RlyGfc8W7K6XFooI3EcNWtGx9i3aqe6pOpSkul+Ekr8+dBFf8PzEVzrdJZUVeYHbK
	df+GIt9nMurAS5bcLt468dHLu35mT4vqaQTb5NbcfmrpcHk3qMmKka/BYTv9kJFhuLI/nNJ7a2R
	PS4CWyNbS1DKCidiOYPt+I8pcoxAYYBtw7kTW6K53mU5ftqBqRFR/UVLSNCgb/yHYDpZRaqrYPd
	g==
X-Google-Smtp-Source: AGHT+IFlZFMjgiDvsStkZqvxdbjcHI5mtZO0RX7CoRLkYWt7/vu6esI08DiqdmO+npuzhi414kAkog==
X-Received: by 2002:a05:7022:6722:b0:119:e56b:c73d with SMTP id a92af1059eb24-121722a761amr39576353c88.2.1767384201003;
        Fri, 02 Jan 2026 12:03:21 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253bfe2sm120203795c88.10.2026.01.02.12.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 12:03:20 -0800 (PST)
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
Subject: [PATCH] wifi: mt76: mt7925: add NULL checks for MLO link pointers in MCU functions
Date: Fri,  2 Jan 2026 12:03:12 -0800
Message-ID: <20260102200315.290015-4-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102200315.290015-1-zbowling@gmail.com>
References: <20260101062543.186499-1-zbowling@gmail.com>
 <20260102200315.290015-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_120322_238040_12DF6D7D 
X-CRM114-Status: GOOD (  12.41  )
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

The fixes follow the pattern used in mt7996 and ath12k drivers for
similar MLO link state handling.

Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 mt7925/mcu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/mt7925/mcu.c b/mt7925/mcu.c
index bd38807e..b9c4b99d 100644
--- a/mt7925/mcu.c
+++ b/mt7925/mcu.c
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
@@ -1741,6 +1746,8 @@ mt7925_mcu_sta_amsdu_tlv(struct sk_buff *skb,
 	amsdu->amsdu_en = true;
 
 	mlink = mt792x_sta_to_link(msta, link_sta->link_id);
+	if (!mlink)
+		return;
 	mlink->wcid.amsdu = true;
 
 	switch (link_sta->agg.max_amsdu_len) {
@@ -1935,6 +1942,9 @@ mt7925_mcu_sta_mld_tlv(struct sk_buff *skb,
 
 		mconf = mt792x_vif_to_link(mvif, i);
 		mlink = mt792x_sta_to_link(msta, i);
+		if (!mconf || !mlink)
+			continue;
+
 		mld->link[cnt].wlan_id = cpu_to_le16(mlink->wcid.idx);
 		mld->link[cnt++].bss_idx = mconf->mt76.idx;
 
@@ -2027,13 +2037,13 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 		.rcpi = to_rcpi(rssi),
 	};
 	struct mt792x_sta *msta;
-	struct mt792x_link_sta *mlink;
+	struct mt792x_link_sta *mlink = NULL;
 
 	if (link_sta) {
 		msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
 		mlink = mt792x_sta_to_link(msta, link_sta->link_id);
 	}
-	info.wcid = link_sta ? &mlink->wcid : &mvif->sta.deflink.wcid;
+	info.wcid = (link_sta && mlink) ? &mlink->wcid : &mvif->sta.deflink.wcid;
 	info.newly = state != MT76_STA_INFO_STATE_ASSOC;
 
 	return mt7925_mcu_sta_cmd(&dev->mphy, &info);
-- 
2.51.0


