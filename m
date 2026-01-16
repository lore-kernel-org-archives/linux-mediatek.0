Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA459D47CB5
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMsIT9b64DfDkZ2RydlT2hQ2iAnc8d0gWqzQNuaiPqA=; b=Y+869p+V2PTgUSnRxsu208gv1o
	iaxU9rGbr9z2zid8NKrOgIlwd0yqqgUucWU2Xwnz6izGMGowZuufk6h1WzPjjMbjg/yE//GgME3WR
	yVizSfu68bX3dKOlKOgQUQEP7iX2kki1B8Wkh8uTkG+YZpK/1zF5UlMbzS3wsZBaUsr+rsNqQShg+
	nQtQtx43eXy3B93v0ovS8XkzNnILLa6BAZ/31IO5dhKk16n+m+qug8hBxD+eSun2VTUd/ccIo3zGV
	vPQxRbb0K4SR/e5Kx7Vtx7WN3gI5eY6loTK/2FH8Jx7lUUbDtE7/EbvHgjPIJo6N10UhyQatmqgKC
	JITFBRLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHf-0000000DOfw-2Xg1;
	Fri, 16 Jan 2026 01:05:51 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHZ-0000000DOaG-0z9D
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:46 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2ac3d5ab81bso1765169eec.1
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525544; x=1769130344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMsIT9b64DfDkZ2RydlT2hQ2iAnc8d0gWqzQNuaiPqA=;
        b=JfTNHIdPa5ozDXoH+t7nG67ckJ5ExUHK4h7lzuhyJfj7WfAScsX64lPXHR9ABv7+JM
         psYuC67iQM9pkyEarAn9C5R7ob/5gYYp1j9/TviCYdVB+NJbKZ2AvzGM+icTFG90Z7wU
         6r8pfA3WdtJD5WomKO4lABlRyZFlVs/vnN/0U3PDwUFw5CtNLf/v8uex8pa8TLgGg/06
         D/c6ArlUA5UWxRJ78IKp7RLTpqf1gBqwY4uci9EBK6s1FuV0Yu3/v3Xyk+jqz9oALa2S
         DotAsg0TZXxGA52tilma0l+yzO8Ylbi/PLw9t44xGRoe4snmR59OkrwXbiDBQIEWYuB+
         a1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525544; x=1769130344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pMsIT9b64DfDkZ2RydlT2hQ2iAnc8d0gWqzQNuaiPqA=;
        b=JN6vbhzqCX9HrihMWPv+69Cfh9cJXq8XnB+2A+f++yrLE6G4UFvcDv/qj4L0SSVa85
         F9uFSnoo/WzCT4NGDEqZV/EGyH8DqToCxSs5Zt6Pc0by5QXZiiLzNUddMu7jgqJ87oHJ
         xZzlLRZP2sX/9I/eO/RcZFv44j7vvUv7p2sIG/UGvo3VKMpszM0SK1yxOD4bkh99HirH
         tfpV08lJqCaJtGspJMWiE/sqC576fc7ZVkMXMywm6dLpWx7q7CNkWlnphGUBOm+kj4cu
         mUpCXybIO7k8xHUsYjRXH4KgNKgwKevts1i6s+io21CPBbU3f1Nu3MPDiQG1FnNQLuCP
         jQHw==
X-Forwarded-Encrypted: i=1; AJvYcCU+y3F0LS0Eo6UXntsbfFdueAKuHSL3gGbxwHqG197UvuYbJCZUQWvcDKndoxvKsNSSoPz68pxlvPMmIgNw9A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyifijy9H7vmUhoJCyFygubVXxRuyraSjw5zL0UQHAQpTiOPYix
	y++YL0KqWNj72K+YSCTHQWsVHg+CfmoB5DbyT8oRMkr18q22miaMUxAoqO2MZSJP
X-Gm-Gg: AY/fxX7UGSb+qFjf1NoXUI5QKJ3+abTlWIQOHSWGhgoYG2aJly4YoJVId91t0VThdnB
	zhBgG6z0RebSctDgAAgpIsmwwoSJM9lZO/XrOVgkuWR2xRAWfpqYLrg7WiNpJTRmvDUs05SoLeK
	9PvPCceyCFgjWucwkjDYK+4vRFDn8XESbQKKgXed4KORhYuRB0PBv9pprp6O6j9mzJOPJ6h22cv
	n3LVP3BqhkYZAfcjxtYFVZLqm1qy9jEuu7PTJxzhzUFueBRCSzIzo9RHtdvVe61Ky1LSW2fE9ux
	N3XGFI30Ufp6MDkcBFRkCPk7V+wInkMhSgI/yh++bAn/YeV0hm2z2xgSxR4Cm7QukbX3NaakzJa
	xTYP0fsG2MA1mrHP11GK4WWYJF3KkDAvGeADSkTE4HVE8Z05udxOsZrOWHpUTBGd3D34946ISRB
	2NGGDR/iNV742y0NUii+6bSzEJPnnsxMGvHN2/b/yb43jqhX3y+Zv+tPkjmvcR5w==
X-Received: by 2002:a05:7300:6c27:b0:2b0:507d:c2e4 with SMTP id 5a478bee46e88-2b6b4eb3688mr1326559eec.39.1768525544113;
        Thu, 15 Jan 2026 17:05:44 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:43 -0800 (PST)
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
Subject: [PATCH v4 14/21] wifi: mt76: mt7925: add NULL checks for MLO link pointers in MCU functions
Date: Thu, 15 Jan 2026 17:05:12 -0800
Message-ID: <20260116010519.37001-15-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170545_297476_036A49C6 
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

From: Zac Bowling <zbowling@gmail.com>

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
index 8080fea30d..6f7fc1b9a4 100644
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
2.52.0


