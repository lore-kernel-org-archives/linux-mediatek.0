Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0122C606A323
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 23:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BHnlIQNn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aovF2yrGT1mwBB687PZlkCKn8D9c8kfCi3UtUzpVZCA=; b=BHnlIQNnEzrnan
	iJL8s6Ys1v2pxtTvSxaEZZa2jkZ0FB8kEDNyjJ6wSpY4On1Gw3Rme0Lc2/znK694/BqusoRqvlCQb
	CtUsZYrONaa39ji/w+zMp+8YrgA0aCGl/34nnxdSWosEBoaBGxMexVv3mVZn6wICfO0X1CQ5TKP3+
	vMIPPYpaZmsdYTmcaLO1qgz2cLX9D4DVoJIcKJciK9ewIaDZDk0FUcPMC34ZYgnGppIqXP468KZbh
	Et/W2zUvBm9qJJ1BiDVsfqvwBgu6ibX45xGy8g1AJDrMWrgud1BaGoJjEGLUUARWUsAqKQm29IcvT
	qkStXRgPS7o0YbubtgIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5zf-000000049wH-35Jg;
	Mon, 16 Nov 2026 23:20:11 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5za-000000049tN-0yJH
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 23:20:08 +0000
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4d198f1a591so3436811b6e.2
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:20:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871205; x=1795476005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aovF2yrGT1mwBB687PZlkCKn8D9c8kfCi3UtUzpVZCA=;
        b=1hPfnbSiRhM2ewUTlrSPG3XEVrJ4AxJIMLQIoG/02Gz3o+cNYOK8AMNDPQhXo6Qjdd
         cpv09GcS9DNvTUzLgraT2x4+flBlz6ZB32uq6dA2UPP+9DFhsj5YEfcaURyCz6WmDZsh
         bqwBxkkvCGk8VIKEnGy00+IQHckQP3OTnh9cac1SDXuXVj9g+PI0qnWR1SKTPFmSnCPI
         TIVPq+tzZbg1rp8ibZLBl/dZBo9uiQjPn43r0Gn6gyZb27H7j+LzvGKBlpKEy2VgURUs
         xoHdljaJeWrZpHvYdWXmi7gw9C0BqEKNgzgWuddE7r8sAKw3yv3Vj39IiZaUuQN20h3t
         mjmQ==
X-Forwarded-Encrypted: i=1; AL+hErEPW5UVVV2b/YZkcvghyIv7kdmgnOU8N0krVbqdWV9oXhsETNkE0Svdu+BkOomfuAR/r11m4AmYT6RlW2Ibuw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9mADM3ibN73nk5Kx8MJjTHiMpd/hMdME/d8sD6t1+HxuH1eNT3
	+RVdqpxd3Ahgvs7FKGEiMzmWpS0F9C8YQtQT9CLa3mvtu7g0jAvjJGkd
X-Gm-Gg: AYBFou2RWeAL2lcFSm5NaF84UuY1/lwY+XOxrPO3u39PU8GY9fOWjGt6URu4SlKKGzx
	mVn7P44h40akcz5Nvlgb27DIFzosIulbGOjdsClABUoSvdKhHCQFwnHFkxAun61Lw+QEJOZC4AQ
	vWjtc7LDk1JgcgL65byrBE/Mdlw6yt1sDTditBtH30N2nK5g+giG4ANCCNibzq/44Eqb40MvwQa
	ZvJXrA8Q9Otr4SfMdvk4LWeB1qW7z1mpuBm3/+JvRpLLT/ABBhYY0SXIzZPIOebnymGytOKfHQT
	t5MsQ92u9f/SKO+diMHLmL323MuwqT1mVw004yOBce14piHcZHUjxSEU5mfcNK3s7PrJ+6rlPYO
	UB9Ru9wYtNhV+KozlkprkYiCo3ELJ16Lp/QAYXee00lCsMfjfxycXv7/7kGNLOjDDmCahDtfDJ5
	OS9cs7Q9GR+qBnRhghBz3qIjZzdyydNs2f8gE41nuu6Cd80WmjC1cJc+m2J95yFN65laSjTxqat
	L2EKOqf5OcutAtlwoya+9J5lF3miCZzdKQyvIWC2SpJZZjVcuuod7Jh2D1gD7jiJuz7njvkAZcF
	djtv7J0r8zASOMu8ldBqUwrfYtXzaFI0QD/zYg4yzdtohVFV3jsjRlVL/VZq03exgtTRkXMUCKm
	l7ueyX27z
X-Received: by 2002:a05:6808:1584:b0:557:308a:9e9a with SMTP id 5614622812f47-56e63ba5734mr11364381b6e.21.1794871205155;
        Mon, 16 Nov 2026 15:20:05 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:20:03 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: yu-ching.liu@mediatek.com,
	chengwei.yu@mediatek.com,
	jacobs.wu@mediatek.com,
	posh.sun@mediatek.com,
	clifford.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 18/19] wifi: mt76: mt7925: always deliver the joined-cluster event through the deferred work
Date: Mon, 16 Nov 2026 17:16:29 -0600
Message-ID: <20261116231630.1733906-19-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_152007_219217_EA2A8F5B 
X-CRM114-Status: GOOD (  16.05  )
X-Spam-Score: -0.5 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index aa030dca7e01..f63e2d342eb4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -706,31 +706,29 @@ mt7925_nan_mcu_handle_de_event(struct mt792x_dev *dev, struct tlv *tlv)
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


