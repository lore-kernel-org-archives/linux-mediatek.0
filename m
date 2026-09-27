Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFD3C9832F
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGJ5BIfE5g0JsujlWA3TifXgWDdlNNIsWYHnjmSe2xU=; b=1IWCviqspvcFvMjL67qdZQHNuu
	jspR+hruvVAzsq8c61/vy0Z2jwFaah8PvRBdLAsPzPJikJReOi09TWIOE9C6JeicIOBCBnzInpRUL
	uzbqgWBqM/ZutrZgAhsS2n/tBY2uxFEK58IAQIR4LDaYi6CYF+DaDEf+B8wzsMP+W4rV95JdY2hNY
	Z4RRtXUeEGXzGeU/swXwzBj4r956x2s9PF8fYzo5VkXCW7p4MCw4SCGPREfLRCO1JM4zL24/sB+0H
	mLZhSUNhw8bESwUnAxzx30s5iKRcj+tKcWPphU5X732INLRJ2IApZGpkZEjlRtfuSyFksWzdAi0FN
	dDuEkNJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAwAh-0000000GsZX-0OY5;
	Sun, 27 Sep 2026 21:12:31 +0000
Received: from mail-vs2-f42.google.com ([74.125.227.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAwAf-0000000GsYs-065N
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:12:30 +0000
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c979c5eca8so1845418e0c.2
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543548; x=1791148348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rGJ5BIfE5g0JsujlWA3TifXgWDdlNNIsWYHnjmSe2xU=;
        b=U+sqBm9hJQSel6nWjiuFFpZDVZoNAuDNy5eYaf2hoIV/mO+jtc1HTHzWNIW3VRKA6b
         jjdlWrOYlO5eH2vzomUmLZ2FT0FirFSGlaY5XT6m7kw5UABJUvTCQM3l9dbYKuWMGPHR
         vXmuOer10mORXscEIcepHjz71BxtzHm6xO94wgdaxjN5baNxhVe85X0zeEhbuVlWGMfL
         6FJFv13pD2gwaZoxwVoSEDQnrcQLWdJCVaqp9IW6oH6/YHxbebSZv3LlsjRyQKUg32Hx
         /mxJXf7HP1tMDu0nKw7Ff3bjJNaUIAmMqYnEFIZ4qEi+WKsEsuLWr6f7z/cBoYmMrlPF
         fAxg==
X-Forwarded-Encrypted: i=1; AKwUvBxLa0fTw+Of9YoFofFrII+SKkFVNFMDilTWjBbgz5RXtR5YYZDyZvyk5SKVqeYMmJVGeuIZk5bX8tsb4oARIg==@lists.infradead.org
X-Gm-Message-State: AFq9FYK58r19oAOVVIjSoT6T1GsUCRk1g+93apS9ePx76oDvmLEnx1TA
	UQ6y7jGnvcy3m5EHESfDn9yB87X/ra65XSPPpn0jYAC9B2TMHKB5YFPVi8m/rSLp
X-Gm-Gg: AYBFou1oG8IFtWku8bQ8WG5mqyz+tthLJgSCNiWGkCvi3u1GEcrjQC0J5EvFFJzgud7
	rgzxnBRT5tzTD59fElWW3r1VGDMq1geF2iFqYdB1U7qn8IsGQKYhUuN93gqXqLxmCRzMGhEhkeB
	VLfaEG4IHJJCPKVyx9KGuDJ9xsJjN+R5rg2PlZQ4r7O6aK4ClV7ildgYIoGlH01JCzPr0IDFKkx
	OvWnp+gEoLCkEEbFXFdrQTs8y0XlZzWQMMYXda+Abb4bcnl5UMtTveO5VbYcPR9AC2vHen4wKT8
	hJLCnh+R9S5U+yKlzbkO79r+U22L+RlewqUqiSIPbYbq2iLRXzLLvDzqbK74UrdcnckA2Itu8Ha
	n3tzJVVJkS8NK7qYt7QAjIx6Aeaf+5J+K2ZI8WnD/i0xRqWjfvSUbMg4jv5A9JDJfSd/BsLGfAk
	Nj4sY5NO1X52BqgO5jwa0UPxXAGmMt+/fjW2lsoDX4t+bmDzBhFONl2WG6R7QF5aPDP0qmUi/dh
	hgURDhJNXdEiEjPYltTTltfxO+7tHtNgJ8znjzuwyVM9LhYDwZA7FOzKLIe6O1aMGezrN+3D44V
	3i10
X-Received: by 2002:a05:690c:c4fa:b0:8a9:c6bc:fa55 with SMTP id 00721157ae682-8a9c6bcfccemr11756137b3.92.1790543074872;
        Sun, 27 Sep 2026 14:04:34 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:04:33 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Jacobs Wu <jacobs.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 23/23] wifi: mt76: mt7925: always deliver the joined-cluster event through the deferred work
Date: Sun, 27 Sep 2026 16:03:05 -0500
Message-ID: <20260927210306.737669-24-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_141229_069584_31D7B9F4 
X-CRM114-Status: GOOD (  15.86  )
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

From: Jacobs Wu <jacobs.wu@mediatek.com>

A JOINED_CLUSTER arriving while nan.started is already set is sent to
mac80211 directly, but a deferred STARTED_CLUSTER may still be in flight:
NAN_START holds the wiphy lock, so the deferred work has often already
snapshotted and cleared its pending bits and now sleeps on that lock
before it can deliver STARTED. The directly sent JOINED then reaches
userspace first and the late STARTED overwrites it, so the supplicant
keeps the stale self cluster for the whole session and its RX filters
reject the real cluster's SDFs (10 forced-split bring-ups out of ~600
showed this inversion on the bench).

Route JOINED through the deferred work unconditionally. The work always
delivers STARTED before JOINED, so firmware event order is preserved no
matter when the events land, and the extra scheduling hop on an idle
work is negligible for this once-per-session event.

Fixes: a5487a682406 ("wifi: mt76: mt7925: add NAN MCU helpers")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 36 +++++++++----------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 77a91a9ee4d4..4e3c531a8d4e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -709,31 +709,29 @@ mt7925_nan_mcu_handle_de_event(struct mt792x_dev *dev, struct tlv *tlv)
 		return;
 	}
 
-	/* JOINED_CLUSTER has the same race as STARTED_CLUSTER above: the
-	 * firmware joins an existing cluster from inside its start-up passive
-	 * scan, so the event can land while NAN_START is still running and
-	 * nan.started is not set yet. Defer it the same way instead of
-	 * dropping it - a lost join leaves userspace unaware of the cluster it
-	 * is in and service discovery never completes.
-	 */
-	if (!dev->nan_vif || !ieee80211_vif_nan_started(dev->nan_vif)) {
-		spin_lock_bh(&dev->nan_deferred_lock);
-		memcpy(dev->nan_joined_cluster_id, cluster_id, ETH_ALEN);
-		set_bit(MT7925_NAN_DEFERRED_JOINED_CLUSTER,
-			&dev->nan_deferred_pending);
-		spin_unlock_bh(&dev->nan_deferred_lock);
-		ieee80211_queue_work(dev->mt76.hw, &dev->nan_deferred_work);
-		return;
-	}
-
 	dev_dbg(dev->mt76.dev, "nan: anchor_master_rank=%*phN\n",
 		NAN_ANCHOR_MASTER_RANK_NUM, de_evt->anchor_master_rank);
 
 	dev_dbg(dev->mt76.dev, "nan: own_nmi=%pM master_nmi=%pM\n",
 		de_evt->own_nmi, de_evt->master_nmi);
 
-	/* joined an existing cluster, not a self-anchored new one */
-	ieee80211_nan_cluster_joined(dev->nan_vif, cluster_id, false, GFP_KERNEL);
+	/* JOINED_CLUSTER has the same race as STARTED_CLUSTER above (the
+	 * firmware joins from inside its start-up passive scan, so the event
+	 * can land while NAN_START is still running), and it can also race
+	 * the work that is about to deliver a deferred STARTED_CLUSTER -
+	 * userspace keeps the last event it sees, so a directly sent JOINED
+	 * would be overwritten by the stale self cluster for the whole
+	 * session. Always deliver JOINED through the work, which sends
+	 * STARTED before JOINED.
+	 */
+	dev_dbg(dev->mt76.dev, "nan: deferring JOINED_CLUSTER cluster=%pM\n",
+		cluster_id);
+	spin_lock_bh(&dev->nan_deferred_lock);
+	memcpy(dev->nan_joined_cluster_id, cluster_id, ETH_ALEN);
+	set_bit(MT7925_NAN_DEFERRED_JOINED_CLUSTER,
+		&dev->nan_deferred_pending);
+	spin_unlock_bh(&dev->nan_deferred_lock);
+	ieee80211_queue_work(dev->mt76.hw, &dev->nan_deferred_work);
 }
 
 /* Runs the deferred NAN MCU events in process context; takes wiphy_lock
-- 
2.43.0


