Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB542D2ED0F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 06:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QR+w7fOhhpyJjkq0X/V8TVo4iOOXXnMSK4qWX/dQNIE=; b=wFc1JBCssnXK0JA7bVd5O2kt+f
	+QHsLvt0wfwMF7nmUajTfcmi7i0AZtgoPknRyOmahmI8SJQ0vSaf3hZvTRT22NKnzLyiXceYPXSDn
	DaPQItLM5dBHUM05OdW8RL+gzLTy/DWGjiBGZTv2N0bIXjtwzTSn0G8/BvIUV1aF9Y+Kc1MVLDpVs
	HQLZSLukDdE1DUMfMtyyj6nrt0MxW9M16hAxQ4X72fniBArlKotspo+fkQ854xkyHkECe9+yF0cod
	UgZjifpFn0f8i4zpPDlgRnvN+kAmSMnBRivMZ3DPJauMY9+cGtdO2rWUzSIl62/gmavwQ33oe1VJw
	3YqXBNbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5El-00000003Gct-04Td;
	Tue, 20 Jan 2026 06:29:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Ee-00000003GaU-3jai
	for linux-mediatek@bombadil.infradead.org;
	Tue, 20 Jan 2026 06:29:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QR+w7fOhhpyJjkq0X/V8TVo4iOOXXnMSK4qWX/dQNIE=; b=QFb2sJj41NHzUXAuDR2kQ34X/a
	NgA5vQ1jaWgNIGyI5h7NbI7uhzlHXlBIzc5AP9S6/5aIs6ze9OS6uQN22mpdeLCOFvRAYxLnIKcvB
	7y8UEFCHE9cZ9gno6IEV0T0+Xvnz6ESWBYEgceOKYzeyQs9p8ma0iZW3bD7NBo0SF7nzJuW2HfIk5
	g4KWcjdFI2CYIJGRL87fcC0MY08LmZuf8DaQ13l7KqFOosi4MJaWRmcui8GbVGIdph3Yw6UDGJTa1
	Yv0gKRC34eoTuVfDOit2nJL7CmmOZ2w6CRSu/fa87bXQOMmvPRsLOWHVe75nvjvXMKT/Ac7LW17+F
	Qm6NyZ6w==;
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5Eb-0000000DP5h-35vl
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 06:29:03 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2b0ea1edf11so9056367eec.0
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 22:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768890540; x=1769495340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QR+w7fOhhpyJjkq0X/V8TVo4iOOXXnMSK4qWX/dQNIE=;
        b=Zn9UAFeSHhL9IUpc1zQ9vfGDutrj7ffci7Cpc8GM2q643X3+qOTSXACKGlrl6NT/HI
         k/4ipp4sogaPwoPcT5Q8qFVFdCpujwbNCfGPIEG1uSPOUPZimySJKpFgrF81FxJotBkL
         4ttvQKARkZ5ySUu6EXB453sr7FdDlDzJh7MUMPc8o41cTb740X7vMUilM4ME5ra6MQAl
         ThfRBuf4b3pei0MrbK3ZDHoz6FjdtAkbUPHtwUBx43EWKx3cHTBVeNmQFuTyMnmtdxYg
         bhoZ+GtdvSrmHCZTtHsRNh6PVFzl2UXB2muUlLZ8nqQQb7bNrbLgfiPJPQ2QAI9latgo
         K5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890540; x=1769495340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QR+w7fOhhpyJjkq0X/V8TVo4iOOXXnMSK4qWX/dQNIE=;
        b=Pv2mQSHfGK/uxYMv0q+AVMkHR8NtDC/bv8btQkZYX6tYa+Bxlk4wAUN95nk+h81MiZ
         tQunXTHMxG8qaf5Pi2r5YiKHIU37sS/kEVhvF9JdE6lHKHQq3dILID73McInzeAzum2T
         IsspjMOXGLX6h0EsAsRnGAclmv/jDmB8j5EiMiMsl8yMHiidwCVIO1chA9K2DYZbuSXW
         L3ZWMvi8r8ZxV1Q/nMzRwKtQ0zSTWVZdobdbEZNuMehoqCxKxE0TXsJT1+noAa3/lBLQ
         2EGI5NNJxu4dQ/aR7BHbehD/dMQT+34MH7n3rbP6aThtaVkoE7+PHsGTfSmFNPAc9x9o
         WD1g==
X-Forwarded-Encrypted: i=1; AJvYcCUM6ocDzztKV5Vuicpb7EL5ly6XjojsPMvkXlVLLq10rMdcNW8PSZw+j0+nJVal/DeflAGCBFHWhtZ/wircpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9NV6F1PPfsRofG8r1ZQGcQXLpEf6qLD3WPB06+UI9YSI+D3GT
	Ezoet/9flHsJ2Ml0x9VNBJik3myIezbaQbP67K1qddlF0y9jN7TT1MNl
X-Gm-Gg: AZuq6aJrZMKEaM0+Vx/X1BePiOJ3enfPEy/9swFe/yE7wnteqKVE6Y/0/3wX4nZhpot
	oJ8ejIhPdIqQyLKCPl/iBxlQ1tS1SDVSD9E35gKeL0MKIWW8VFz+ALP7/wZtvow/SIKaQ/F1HvH
	2YgzOvOE/VG0l6rO+7V4OAKeX0RFkb0RLJqfeYng0acDgStVpQ5tbBQa5TmIx5g2Nou7j3+GS4G
	vqD8BBvgiFKLY56vJgy2Q4h/prOF9BX+osSES/iC9r9Rb9w2OUXmz4tC9TkAc8MPTurOhtxRUyK
	Cxkhqec4IRNTwPv71p9rbKijdEfEuecnF6U1Q/Gxqwcquep+9SJ8nFpubWws3wBwR1dAjRYZo9E
	skga/hXLHmDioK2IpXnfpTtMUTxxR+an7AMbu46VvFP9T/SrSuf8PywIngP0Pk0JgEUFWbu0+2P
	kWAVmnVpMsPle3pK9W9Q6Q9997OGH6RLKIT2tXbh+iqDRO6cXBLqxFgK6mgICv
X-Received: by 2002:a05:7300:e825:b0:2ab:f56e:bea6 with SMTP id 5a478bee46e88-2b6b505d137mr10313793eec.39.1768890539343;
        Mon, 19 Jan 2026 22:28:59 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f31e:1cb:296a:cc2a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm15706784eec.9.2026.01.19.22.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:28:58 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	stable@vger.kernel.org,
	linux@frame.work,
	zbowling@gmail.com,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH 02/11] wifi: mt76: mt792x: fix NULL pointer and firmware reload issues
Date: Mon, 19 Jan 2026 22:28:45 -0800
Message-ID: <20260120062854.126501-3-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120062854.126501-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260120062854.126501-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_062901_951943_08B9B358 
X-CRM114-Status: GOOD (  17.13  )
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

This patch combines two fixes for the shared mt792x code used by both
MT7921 and MT7925 drivers:

1. Fix NULL pointer dereference in TX path:

Add NULL pointer checks in mt792x_tx() to prevent kernel crashes when
transmitting packets during MLO link removal.

The function calls mt792x_sta_to_link() which can return NULL if the
link is being removed, but the return value was dereferenced without
checking. Similarly, the RCU-protected link_conf and link_sta pointers
were used without NULL validation.

This race can occur when:
- A packet is queued for transmission
- Concurrently, the link is being removed (mt7925_mac_link_sta_remove)
- mt792x_sta_to_link() returns NULL for the removed link
- Kernel crashes on wcid = &mlink->wcid dereference

Fix by checking mlink, conf, and link_sta before use, freeing the SKB
and returning early if any pointer is NULL.

2. Fix firmware reload failure after previous load crash:

If the firmware loading process crashes or is interrupted after
acquiring the patch semaphore but before releasing it, subsequent
firmware load attempts will fail with 'Failed to get patch semaphore'.

Apply the same fix from MT7915 (commit 79dd14f): release the patch
semaphore before starting firmware load and restart MCU firmware to
ensure clean state.

Fixes: c74df1c067f2 ("wifi: mt76: mt792x: introduce mt792x-lib module")
Fixes: 583204ae70f9 ("wifi: mt76: mt792x: move mt7921_load_firmware in mt792x-lib module")
Link: https://github.com/openwrt/mt76/commit/79dd14f2e8161b656341b6653261779199aedbe4
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index f2ed16feb6c1..05598202b488 100644
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
 
@@ -927,6 +936,20 @@ int mt792x_load_firmware(struct mt792x_dev *dev)
 {
 	int ret;
 
+	/* Release semaphore if taken by previous failed load attempt.
+	 * This prevents "Failed to get patch semaphore" errors when
+	 * recovering from firmware crashes or suspend/resume failures.
+	 */
+	ret = mt76_connac_mcu_patch_sem_ctrl(&dev->mt76, false);
+	if (ret < 0)
+		dev_dbg(dev->mt76.dev, "Semaphore release returned %d (may be expected)\n", ret);
+
+	/* Always restart MCU to ensure clean state before loading firmware */
+	mt76_connac_mcu_restart(&dev->mt76);
+
+	/* Wait for MCU to be ready after restart */
+	msleep(100);
+
 	ret = mt76_connac2_load_patch(&dev->mt76, mt792x_patch_name(dev));
 	if (ret)
 		return ret;
-- 
2.52.0


