Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D6CD26296
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 20:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QR+w7fOhhpyJjkq0X/V8TVo4iOOXXnMSK4qWX/dQNIE=; b=lXd3C9p4SSOlj1glbR4ZtCjoip
	9nL2cNKcbfjG8ru8rQ7fn2ousUB5WYiwTF1EC5g/RkMsbZwMOOJeIuvkQImv5Ih8PiodwlDO5R21a
	ZNVqyxBXXHPfRZn80zz749xIkxAlwE2cDqn3oNekboLVwyxHk5z/RnQAalJwuZ8UHIl1RmRn6671/
	5MXwps94ZNytjGPMSPWN32Tj2MO3ZJN/shecfZRmkrpDNAWaUbyTaOsNhYMxRUzl6oUfffYmVRZNe
	H95wttako02ZZuplDCm+K0cA6evE+/RMYx0VJMeb11EdWl9ja/CC72NGJMwpmmOGRrisEooRF8JCK
	aQaC8QtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI41-00000004Q5g-3ADC;
	Tue, 20 Jan 2026 20:10:57 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI3z-00000004Q4P-4Av1
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 20:10:57 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-121a0bcd376so2066635c88.0
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Jan 2026 12:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768939855; x=1769544655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QR+w7fOhhpyJjkq0X/V8TVo4iOOXXnMSK4qWX/dQNIE=;
        b=dkKspd6IzYOS4jS8VpDemWG2BOPpo+Mfwq06fijUrdFKOv7C1OJ8p/JApDx5XQW2x0
         KAHtwqT0ONYv1Wn195uSehkmBu7ZeTa17vuRgtCNVZeOCZxjjioQwltYvpx24lBUI0CI
         Q0r1Uv6p6LTHTvzjkyd8QbM+IPIWeoS9yGbDnqKCmafqFT4CZu1+ys43UIsijCCoitjg
         8FgavLlaUIK4pQaP9hVRTPWYFpZJs/9n34I0IiI8bjpZG3bLNcz7ZSU62SNy7S/lt6yD
         P+5NnU4je8PueD3Ip/KwjqljjFX0IyUWPWVPyTRW3PqB5D8oWpPFVahz7Plg3eDgx1cV
         8g0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768939855; x=1769544655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QR+w7fOhhpyJjkq0X/V8TVo4iOOXXnMSK4qWX/dQNIE=;
        b=QjkkmaFeuHKJb+YZ2tLC/9nAMHPLuhuYMBD4wD5sL9114BOsRjTeALD8GGMrCklTkL
         IzRbqR6DXkjueDiRPBI6SMCC7a8SaqIGccRF2IxO+9xz9eobvcDSwNKrPLEO+FjQpTkt
         015s97JCv2Tgs2HZagrDcMYudXgsgOMbFxXI1l3EZUVYVONiIlios99Oq/9vAmzZaGkl
         17rzQSYkqR0CB4Twdbwx8uKV4yqKt0aMq7YkEwahUAYdH/ExwVUNM0CAY7ojBsQhBtDK
         RK/5Q5cwq5bz6DpR8kDn3zXeBnC2VP8b+ZffJTEOVtdOplkbvnLXStgCcJNKsUvhxyeD
         o5zA==
X-Forwarded-Encrypted: i=1; AJvYcCWI3IQ/Jl7itkUIE8BFSRJcEaL+/05mIA4quGEQhZd4MEKlt6qBPXuqOr1d+1ySPZaqN7Vo5kT8b5pjExi2Gw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcJ3ScxjA/RvUZ9ORMvXK9ezYvQjRrfKTVk/eIAGiHkcSRCGHy
	9N+d+dVrsdwEqe9k0M74+sMVzxtRPRooRa9O64NbtnGKQi3PgBaztJ2r
X-Gm-Gg: AY/fxX6vrghg2b+QplJcBA2QgkTN1PPA+s88CoZC50gftJ2o/cgmtFzT6y75wfMpt4K
	oOo3zvYBKSCAZet1QsiBDgGlKzwHJjcNB9tJtp7ZFc45d1rlUt9LTb9yTqme2DMWFVdBiyfWIdR
	1NCVXrwvR7TMvHvj+3xUdcJvmrqQx7lZ/gBG7zAZS2Z734g4KYsDkJwFsl9hLtHd9OssOD/zvEW
	DpFp93mKorkym8LlSGgzxlJFy13UB3eqrRek4nvGFXWfp7NZ2nF2QGxUKPMo/L5P5YEPrWQ0m2d
	D2KkO79PaDABmVtc020NTCKwd8Wcfdh0hG1Wn3YcOn5VwdWC75ubcafc/+e5mDeX8FxpdWYHawq
	8eR+yiN3/qRmlJwU7IeUywYSRJMtnHQItLXU56xdUHH/UF3XQ2VFPGbTz2wSiVkqqKNhhlCpzPl
	VlLHR+bDO9m/ERRrlGjrK1ic1HBSw6nYhXdoP/gUUESvhiOQVo6kaLQamGL7Q/MgUghX+JmVKK
X-Received: by 2002:a05:7022:458c:b0:11b:88a7:e1ac with SMTP id a92af1059eb24-1246aa8951emr2200437c88.19.1768939854707;
        Tue, 20 Jan 2026 12:10:54 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:4a3c:9f7c:8037:90c1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm21982990c88.7.2026.01.20.12.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:10:53 -0800 (PST)
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
Subject: [PATCH 03/13] wifi: mt76: mt792x: fix NULL pointer and firmware reload issues
Date: Tue, 20 Jan 2026 12:10:33 -0800
Message-ID: <20260120201043.38225-4-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120201043.38225-1-zac@zacbowling.com>
References: <CAGp9LzrcvW18xKFL-oF3wxRmb73G6PN59Y2NSA2E5idva1wtKg@mail.gmail.com>
 <20260120201043.38225-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_121056_039653_66573FF8 
X-CRM114-Status: GOOD (  17.18  )
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


