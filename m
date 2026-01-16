Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF38D47CAE
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nS7hbe2idkDtMNr1sikCj+4G/Yawhd2uUbgexxTfUAA=; b=a77vuF0eSNzsH+m4J19AXzdnVC
	XIUS67xDDMY2fHEvexyD6GF+AaeFZM51jraDgdKHZlqHXgpyZh3vJtu9DEwRbHfCzTcPL68S/qWBf
	u6W2rHbpm+r/GosthLEFV1jJiqbiNOo8ta0/lAvMjpVPn0AK2DpAbLHkfJsS2Btd5WDtIHwOBHHy5
	GC8HCxK0mlz+9DPUyxlT+/LTZK4PT7O3YVwRu9VLf/9TPl/wbv8pqLZ3RI96oATI2WMaSdPoleoPk
	GqqK2fXAqe4z3wysEplYk1lnzpxPLAFSfg4W7RtgzoQSjeWmUimSGqe/qg7JVGnNaeW3MiDLnwtBn
	wECcF6Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHe-0000000DOe8-1vI4;
	Fri, 16 Jan 2026 01:05:50 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHS-0000000DOTj-3jnq
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:41 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2b19939070fso3506988eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525538; x=1769130338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nS7hbe2idkDtMNr1sikCj+4G/Yawhd2uUbgexxTfUAA=;
        b=J9phlP15fy5EKWorNAnzT/0JkJ4NvxDnm/lpYAIJAgDY0ykH4pA/3I00XaIr4NU0v5
         emegUC11z/yaTtKEB4gEqVjOKKBeOTDnp7fv8qfJlA2iqbbaKcB0RvVM5BFlFjD4ZPQ9
         55FD1wvEg8FwrsG0Nlcz5LAXSRvt/4tJYPHw1iqUGOzrLQzFtQFgFaTCO2M9ndq/TNYa
         7KetR2B/ZtIbL6H+797KEZ70xha3XO1JxtMMRsycMOOhQAXCMpyLmz0VOWIrvevCTSar
         97Iii5atqu6PFQY6caMQG6Dtn6d16guJAcLPo8SobenvXo/TQPeixFN8PC0CbYkA7LOY
         UFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525538; x=1769130338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nS7hbe2idkDtMNr1sikCj+4G/Yawhd2uUbgexxTfUAA=;
        b=J+hmRO0NrPk9R3WQlI14xRlMyMyHifdCGU6TZfASxcEoa5KY1UuKwXjwRFCgJGKNXK
         ZJj1xmHoB7ixkfeqY9LNh2Fx3kEs+RZ7YPV3vVqui3+ExPT11cKoEQNd8ALwIbFM6/vG
         5qZIoO+h0IZefqBUiZze83mG2v6/VVOQRZwuObOjdkUMMrFCnJNzTlTFGainMomyLea2
         OnzW6ZCrB2cgAoMoNFYWKi/vUMK5ibY7+lsA9mtv+00ZpWzJplOEVskDA/YOvo4hDls1
         /jPg0ecZO6gt9IbCYxzY4ngbqj6tt1qmtnzyVe2IEFbjrYapQupC0rj1fD74YRdKYUvi
         oxUg==
X-Forwarded-Encrypted: i=1; AJvYcCXmxO3mbhskACBCYV1d1/fc4v1z2tuTKMVAdDskYFknWT38yoNrwwfAFTp3ECyytHBetbI8fbp0RKX7Oflcjg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxamhn3BxeJ8glQFPet+Menk+CrqYvDarAwNBUOpKEttQzuZqGu
	3bHf5ZBcGLeOWxcib9cUiG/CXqADzAGOT9HZFFWYUc58S/SHwluyNrDG83C+fMe7
X-Gm-Gg: AY/fxX5r3GkZ3ggpy7U/188uuM5JRu2eZq9OJNEXpX23JphDUvkBpaijwrYQKQqYE6B
	R1ROApHOWHI6vWwZOFOMImUgU/SFW5hV6KR95QvxqSYJiPcJfsEjWVc7EqkJwj4bb4ZujQqArVL
	/xtJlHVjVveXDCUigXAKjP5OCXAJHtgjnxfKarrd6kRg5isLnahUMbMASxmk42YxgjrUQK7k1Oj
	0SHucW7vDaVuONojwkBJmKGS/YwJu/mN6M3ovM53kN89yM1cAEJ3TfJEmT8Eb+nrzYma/pjWyCC
	Nlq89e3Ia//8sEJrIDxkl0TWMfAtgeGtDfnq5HS0pF9+wgAaRIr4jjk1tLA6bQu1CmGJsuR/39h
	l6rlR5RsWBu7nxxDtky0chIK5IZmLF2IuMJ6ls9a8nzZaE0oatqWUidJ5yNSRAcWB6ErZ8nccBn
	ec6q6w/8/z7hz+fj7YwS9wINrLw8C48a0GXGah/Gh/wfD23eiLh17Xx4lB6Lra1Q==
X-Received: by 2002:a05:7300:5724:b0:2ac:1b61:ae1 with SMTP id 5a478bee46e88-2b6b40ffb6cmr1144200eec.26.1768525537895;
        Thu, 15 Jan 2026 17:05:37 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:37 -0800 (PST)
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
Subject: [PATCH v4 10/21] wifi: mt76: mt792x: fix NULL pointer dereference in TX path
Date: Thu, 15 Jan 2026 17:05:08 -0800
Message-ID: <20260116010519.37001-11-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170539_571036_B1AB10A1 
X-CRM114-Status: GOOD (  13.00  )
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
index f2ed16feb6..9dc768aa8b 100644
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
2.52.0


