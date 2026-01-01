Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70034EE57CE
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jan 2026 06:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F7OVxpcjzhJ36YO0FCMfAYe7gUj9JaKUB98nBjP7Gi8=; b=3vI92kyChc5PjXJy3i+MG4XZMC
	2Gmi/z5hsvtmjNkjK/tjvEVyI+uoq3ZRA83ZoFnSpfs5uBbe2G8/YB4j8J0RVVsy9/XMEt40dM8q+
	GG4IR7JxVtRQva9Yxjbgj/ACaLJAqEVWYiSXEIrAlGGad4EIY4mvWxAKcbqT3nfiFYst86rDd9yb9
	21G5+YiQEpQDpS9R2jLZtr/NJqy8lWFLMtqXdqxTKQ+4j0873oC7qKIpJFNQ/Ml3FMNrDUjzrsbzN
	kUpRP7rewPIsINlWYgimjjDjbnl7KK02KOega6L+43cwSiea+J4Pj+j6Zkm9hI2MyVBRwl+DI14CC
	n5oJXB7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbC2z-00000006djp-0o3z;
	Thu, 01 Jan 2026 06:20:33 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbC2u-00000006djT-2gIf
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jan 2026 06:20:32 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c075ec1a58aso6403881a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Dec 2025 22:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767248427; x=1767853227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F7OVxpcjzhJ36YO0FCMfAYe7gUj9JaKUB98nBjP7Gi8=;
        b=L4TqZFOSra1FV+O9X1Kw+8KGc/26T5/cmxBgBW+ud8TbU5GEU11+rgyZZvnwo8cBD/
         b3uXi8DA7AR7j2TJk0bGfWfUiZwHbiEfESiJPxdPHjw2m7McWFb3oet6ZV5acuTIht4a
         1JKadjzoCz5gc3MIoKQAAb7TBxuYTaZyXVQpjGghmoKllLkPVEEBkZtvvbETsRm7LG+u
         rx+MRjuxHD/csq5teMz75RAE+4c8fw5UMcN/5l+CcioLihvOk88lustpdQP7hW8F0TYy
         Z2I/SXzbW9iuynQGqMHVJYu1kp7sxygBlGmd1gM2qNa/4VLQAUCQP4w++eJqTLeYrpWA
         i4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767248427; x=1767853227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7OVxpcjzhJ36YO0FCMfAYe7gUj9JaKUB98nBjP7Gi8=;
        b=vPP81+EMHUIO0OIOFTwBYdeUeq9Z97tw2ghfXM7e4DMlWibaIOYDYS8jXXmDO03+Xx
         Z0zRUYj5LRRZyNp5V+P15i89dGTi9AZJt9nDuytT8LCIapUAn7vKaLU3wqRCBLvTK0he
         ATPQGmAOxFbNj1KuKLU03ojeubRLpR6lB5u/jh7KEb9A+Mu0n0mvaFwA3Ovb1m3UGAAp
         EJ9+Qs8Apm9KHQwVIezqUCjxdL12bWl915fuS8pRO7txhC5My2ZCqa3Pj+tI9ROX565/
         FASQNXGF8TbNabpnqT9Qp0c6y1aKdW+wAMC3KLxcU1FRZRlot/AE0jRt+6rgCj/KVBp1
         Rwjg==
X-Gm-Message-State: AOJu0YwBjhdopMIWXrMRA4kiV4AGsjx9JiObVA6avV1umMmV1kSSy7wh
	6TiyOgFlvJrINKtFDlkbXTu4/Es2kGS4gC6q4ucGhrOY77BUkQaCBJlk
X-Gm-Gg: AY/fxX7Gebi7nbfULC1hiNyFTHI46owaxLShQgzgQ096x6+B6tGm2pCQa5dm4nuVPmA
	ObeSIheQLkiRXbi/1M2VmyYRNU30UK+Bn5wXdFWLuCO/8OYKaSEC6z/0N++r4aLa0BsG6L1tyae
	jqauh6bH8ngKtnrXtlC5Q8Nlc4XnWXPGYOWhhTXbhSYvGSO6xZcjt0Bmv9ugr/7Zj8tEHL7+c0p
	TET+5WWcOAf4zAfY14eadN/YWbcaYV9/DYaISCijbanq6pIIYOH39fFPQHOwWsy+kqK3gkkQU1L
	prWAwKWc8JQPkVZHoOX9CD8bCgIaPgSAeZh3T+uCs5yyGRUhcvOMKdxj1yV82qRYSemSU/6BFu6
	5okJ0C2hZQNPXETebjOT7JTDzdzXsJ/YHGV5XF3AZ1QcWDQLr28DePycEsJQk7+f6qnHCCPngeh
	6z3b/uFtHN1kO2I/IIzKvtH/Po07UaMFMRTPi9pM4M55vzyUaaDXXlZ1Ug9MPgPzVbqJ/ebRlq
X-Google-Smtp-Source: AGHT+IFcNyD5xwVxRzRa1qB3GJNdE3L/hyCnyksDrjw+mHu292ZOJvkzX/ysi8HBo7Uasfom1wxTCQ==
X-Received: by 2002:a05:7022:6983:b0:11b:9386:8273 with SMTP id a92af1059eb24-12172312cc6mr32852067c88.48.1767248427458;
        Wed, 31 Dec 2025 22:20:27 -0800 (PST)
Received: from zubuntu.home.zacbowling.com ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de25dsm108662883c88.7.2025.12.31.22.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 22:20:26 -0800 (PST)
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
Subject: [PATCH] wifi: mt76: mt792x: fix NULL pointer dereference in TX path
Date: Wed, 31 Dec 2025 22:20:23 -0800
Message-ID: <20260101062024.181697-1-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_222028_702060_B899EE82 
X-CRM114-Status: GOOD (  12.73  )
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

Fix by:
- Check mlink return value before dereferencing wcid
- Check RCU-dereferenced conf and link_sta before use
- Free the SKB and return early if any pointer is NULL

This affects both MT7921 and MT7925 drivers as mt792x_core.c is shared.

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


