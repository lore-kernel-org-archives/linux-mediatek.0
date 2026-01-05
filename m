Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00556C2A062
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 00:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xc3vtf8nV55Q+3v5tcb1BiSqe6gDU9FJGry7raEU0u4=; b=zbIMvxLHWP1u6ewMaOcT4a+3sg
	Du4b0WKVUePhu12l5jQW+01z7WNH0x6niOMPn+gT5RB7yWWdjVIVix5H4rrmZ0yK5pquhmqeMjuIr
	S2CWH2uYQoCppYN0zXABNZ1x8gyJqqsdP/cs/1NDU5gwSPPQmprMI4zRjbX53K3yVi5IuzAjCR93v
	paQAaj/IQ00weXTwMgElgfqSK9XSzhZLrQmq8Hoea5YFxivO1vLtIaX0PiFJeCsGlsqL/8wg7kmnH
	6eE+HVpG17scQMcqM9FPfftmOB/CMnfTMW03wQFgPwZyAn7iQvEHMJ5ZE7c9ZIHeotv2yFUQi9fVm
	aoyzjNQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYR7-0000000Aa0z-0Kax;
	Mon, 05 Jan 2026 00:27:05 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYR4-0000000AZxI-1PWW
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 00:27:03 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a0d6f647e2so220251845ad.1
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 16:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767572821; x=1768177621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xc3vtf8nV55Q+3v5tcb1BiSqe6gDU9FJGry7raEU0u4=;
        b=nqHJpWWEl2QQTu8bGtuLTVn4BLeAM+Tq6lW6T/FB17ZouS+n0xTzvv1tXbUQuy46MF
         h5O7I7M9tQEUdZkOl46xy+fkw+FzD8kHOMgQmPbB7w3t+gO37BE8Yv2NPMCN4AmPJWLA
         R6a1jmSShTkXSjqYSKj2PrClvaOtljaZkAbk5iGRxPeW8hcHPP/cEPGgUmwty/7fLwZ2
         iasSh8ObZq6sUlXx9SeM06m3MR4kd9bbKQNEzLv2iE+2BTxJDQ8RhPVOitIk8I9IuUHr
         Y0jsEZoG7qd6+jxwgV9BxhZZNF2A0PqlqBOETeuZX4gDl0oqSq5akXmoy5FYRUuvsujk
         zYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767572821; x=1768177621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xc3vtf8nV55Q+3v5tcb1BiSqe6gDU9FJGry7raEU0u4=;
        b=Ws1m0h/r0ZLrFwnsO9j2/FXB+5ZTVQgsA9KxlLNESSXvgTDXw0Id+xIwkjby06MlVJ
         AYcMZiYzM5zCL51+0R9edd38Ah7ch8owR8DlXDixhUZiiqAybCPRIj42y81nteOPHjoF
         Bs4q6K5KQlDUZqkdBfW9xxFh0v7/8d4OTPyazhrJ4Hxou53rTB0rCBQqYoTPQ/6pLxL6
         xZQlSpe83X1ze7eMhDUkMGo+tze0r2BtxpaXzVGTOQTe4aVA+NDaWmV4AQJDHw9RjawF
         NiM1Ckzoc9Tn+Sx0TkDgVil5NJiqAef8YLLQZqmwQthjIfr9b+sh9belSJ0N3XdGuXkb
         enjg==
X-Forwarded-Encrypted: i=1; AJvYcCU6wzziSynj+/0ms6IKu9y1K0BXlpfoBPoHDYvL86k3SMXVxyJ8GTn5/3rJY1keruxoaVSk1/oLOBdOJCEGPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzvVDTxSGan0ol9lTGv+HmpFGo4i1+5Uaat02a2qI9AC+VFNTm
	tGaJE6mGf+BHQuVZ0EbBBdGSlCJcKzl8wZdgzUXmsk6FrUSDF7sU0ukI
X-Gm-Gg: AY/fxX5TAIospkEX7Cqjf4Pv3Vg6iUG4AmNO3B+p/N747uA8Nx+5GqnxASG1k+E4csp
	IBWpC5eNFBAq4wwmWWS3IUQV17xgIzUdwEC9abufvsMerKyJSuwVst1qcrdx+JmuFSLa8CfBigD
	rLQUElGziAN8dGeWExYMNaNjSi4b+ebiO9hqLtT3fjfV4uyy7xbBypKz1YI9OzEnVYAV+ZY2gWR
	IBc55H7K/nQl731c4ntIIRkOj0Cu1qw12Lt9pxb+a4l3M554kJOjtbeEjDXDOEwj0uAGBO3ceEs
	rbJyPKn7kj2b+wpJ/JY63By3jFCYV0mEBW/r7LGqlrNTqcC5qt9a9DR9xffgB7Ih4T4J8t7RNF7
	M2fOID9XPCFch6te/qdxhVibBJXmoZJugTjEDsWu5JpyVgomtZqyaQwOPRr0iyp08paL8yNaUTg
	vviff0rYFT8gSDaRHdpCeAfZ1fXOSfaTB9m4DrQmf/SmeVyfgwotuJbqFYcVZDBLU=
X-Google-Smtp-Source: AGHT+IEU2h/tWNXbABrCcQmKu0PD8p87Gpp0+pw1A9lE8jv1PWOQX4Lsqm7CqNoXiBV7IUAHXXZutw==
X-Received: by 2002:a05:7022:82:b0:11a:126f:ee7d with SMTP id a92af1059eb24-121722f57bamr30029316c88.35.1767572821365;
        Sun, 04 Jan 2026 16:27:01 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm133378109c88.8.2026.01.04.16.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:27:00 -0800 (PST)
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
Subject: [PATCH 10/17] wifi: mt76: mt792x: fix NULL pointer dereference in TX path
Date: Sun,  4 Jan 2026 16:26:31 -0800
Message-ID: <20260105002638.668723-11-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105002638.668723-1-zbowling@gmail.com>
References: <20260102200524.290779-1-zbowling@gmail.com>
 <20260105002638.668723-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_162702_554091_243246C5 
X-CRM114-Status: GOOD (  12.69  )
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

Add NULL pointer checks in mt792x_tx() to prevent kernel crashes when
transmitting packets during MLO link removal.

The function calls mt792x_sta_to_link() which can return NULL if the
link is being removed, but the return value was dereferenced without
checking. Similarly, the RCU-protected link_conf and link_sta pointers
were used without NULL validation.

This race can occur when:
1. A packet is queued for transmission
2. Concurrently, the link is being removed (mt7925_mac_link_sta_remove)
3. mt792x_sta_to_link() returns NULL for the removed link
4. Kernel crashes on wcid = &mlink->wcid dereference

Example crash trace:
  BUG: kernel NULL pointer dereference
  RIP: mt792x_tx+0x...
  Call Trace:
   ieee80211_tx+0x...
   __ieee80211_subif_start_xmit+0x...

Fix by:
- Check mlink return value before dereferencing wcid
- Check RCU-dereferenced conf and link_sta before use
- Free the SKB and return early if any pointer is NULL

This affects both MT7921 and MT7925 drivers as mt792x_core.c is shared.

Fixes: c74df1c067f2 ("wifi: mt76: mt792x: introduce mt792x-lib module")
Reported-by: Zac Bowling <zac@zacbowling.com>
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index f2ed16feb6c1..9dc768aa8b9c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -95,6 +95,8 @@ void mt792x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 				       IEEE80211_TX_CTRL_MLO_LINK);
 		sta = (struct mt792x_sta *)control->sta->drv_priv;
 		mlink = mt792x_sta_to_link(sta, link_id);
+		if (!mlink)
+			goto free_skb;
 		wcid = &mlink->wcid;
 	}
 
@@ -113,9 +115,12 @@ void mt792x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 		link_id = wcid->link_id;
 		rcu_read_lock();
 		conf = rcu_dereference(vif->link_conf[link_id]);
-		memcpy(hdr->addr2, conf->addr, ETH_ALEN);
-
 		link_sta = rcu_dereference(control->sta->link[link_id]);
+		if (!conf || !link_sta) {
+			rcu_read_unlock();
+			goto free_skb;
+		}
+		memcpy(hdr->addr2, conf->addr, ETH_ALEN);
 		memcpy(hdr->addr1, link_sta->addr, ETH_ALEN);
 
 		if (vif->type == NL80211_IFTYPE_STATION)
@@ -136,6 +141,10 @@ void mt792x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 	}
 
 	mt76_connac_pm_queue_skb(hw, &dev->pm, wcid, skb);
+	return;
+
+free_skb:
+	ieee80211_free_txskb(hw, skb);
 }
 EXPORT_SYMBOL_GPL(mt792x_tx);
 
-- 
2.51.0


