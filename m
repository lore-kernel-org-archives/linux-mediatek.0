Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE0D606A323
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 23:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=artkaQBa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ovr1vQdfY8B1hnPOa0U9HTNe54gtsAljzjaukZV1nY8=; b=artkaQBaEsewjS
	q1iwJzDjice7ztnutw2kC5BZLD8oOCousN0fqffbo0wLoHV0+PhLrw/pKEfjS3+oNWqMD9ODkvNXh
	h3y74T/zjysUaxwTbelztlOkEJ6eYgziUz0nGlMydvlqeEW5aZNsV5b/CLIcc7SnZaF4Uf/ZIe1o/
	olgsPZEPwEwvJXbt74XEuQE8W0xMlTWn6pNQVuRwJbvlgMyxlWVUJC11D2UM9Ykl6TvasXq/mt4Xw
	gOg1+TuqXNAMTZxdEM21Y6Wgp0q7Cw92FZaMvFqLAlB5bjeDfO9FJK/c5AEoh5lRqwOi8LEA61HZm
	O5Rv3I7Dn8RC8fam5ptQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5zH-000000049k9-1X9V;
	Mon, 16 Nov 2026 23:19:47 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5zF-000000049jY-1xQx
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 23:19:46 +0000
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-57309bd40b1so898748b6e.3
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:19:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871184; x=1795475984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ovr1vQdfY8B1hnPOa0U9HTNe54gtsAljzjaukZV1nY8=;
        b=zoYPcl9BDBLqPY+Tc/H0SKw0e6W6r347HkMfu0/6fbKjPTz/71ieM/vsnaEcSGUE5W
         EZ2dkYa2AsoJq2Jwj9h2oSoEPphtwwEDa4pUPZ95u2KQ3ROdJapcSdG7+bNjthQTCpqB
         jUM0QLsCVPsZag9t+BTIwlvI0s5VQU+bGBurpeQZ5ja/4Bze4A/QtkPagywWp6NdiftN
         LB7TLQmLgbxa2w4bmj1JRUNQfxkzIoOQGdMaTu4E3BCUPqUJn6QMK9ciQGYEo47UFqyk
         DqVTs7ZpvFX7aTaaQJ/2N6sOPjlos4g1L08a+vw0CRokoGziymV0tbKdICSpDCUXsDd2
         zWTQ==
X-Forwarded-Encrypted: i=1; AL+hErFhJoFU38i1xwNwAW35Xz3QmVhYf4NJ1L4tAVrrJAP1tpLP1AMu6A6HjkQXhze58YV6TVQn16hQygtVyGiYzQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/vriIOMfoP5X0eiKpAHL6ydrrzhzcQBYa3YUa/Kr3rcBN1iVL3
	0cGlOPCT564q+b2htyK6qulA8mxnEcdBiEtqeFEmVdkDktSS3Pbgg6yr
X-Gm-Gg: AYBFou1iaZf+fEr686lBPfcyU3HnEtdBP1tXOaI7ESWhkqQra6PBBNOJiqDkMFi7j9L
	Xjm4VvjQbpQN14HEf/8lau0rf/UWT79emxDt/AvVbslMnqlJjVBtN4wrFFErNEQ0yLKPw8UVdJI
	Y3fg4b8z+vMgI8eu8GynfPcO6e7AChovH1WYC6/VSP8f99CN3jBm1Kg7aqnYu1/t5WNZ0UOFybA
	a1TNJsXxkwAH0EtWtAvTa4I+KYV+YhP6EsgTNI9V8o70aPPjmf6TP0DsnAXrthwGg5k5jgM5w/K
	BcFKPbzfl3yKF3EDCBY89aATLLb2cDcypVWLR6jbB23aESCjQolU0BWgVDzBrYf5NNt7mk4TQxQ
	lknRLlJkmtrBSktSIjyaq9JQHLuKnlcUIKLS2ZyKeZpDBOsEC/YGOVBVQ8xyo0qO7X/ZmtvKXse
	8FZxijJSBT+zvwBOhPDQExt3XcfvzHeaatr4ZQPwJ9s3TvFIMuBun0EhbRysYDHnvCn80zABIfR
	WysMKIkYAwO2N1TQhf2AMnT0e5E9fqadR3e/ADZP6TBTBirTdldpSnmLRDAyQoebIo6uTMCspyv
	5tZSZliIi64n3BJ5LGlKMyYyxwwpLsSEyK+GMHPm/c/dcld8i3luovADSrU+bOH/gRBfY1seDxb
	VRqaVmD/d4ouquCe/Ad2NOa/ZJ+Gtc3g=
X-Received: by 2002:a05:6808:10cf:b0:563:e8b6:c5d5 with SMTP id 5614622812f47-56e64cf4cb6mr11277026b6e.44.1794871184505;
        Mon, 16 Nov 2026 15:19:44 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:44 -0800 (PST)
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
Subject: [PATCH v2 13/19] wifi: mt76: mt7925: defer the NAN joined-cluster event out of NAN_START
Date: Mon, 16 Nov 2026 17:16:24 -0600
Message-ID: <20261116231630.1733906-14-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_151945_537614_27125D24 
X-CRM114-Status: GOOD (  17.66  )
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

The firmware can join an existing cluster from inside the passive scan it
runs at the start of NAN_START, so NAN_EVENT_ID_JOINED_CLUSTER lands while
the start path is still executing and ieee80211_vif_nan_started() is not
true yet. The handler dropped the event with a warning, leaving userspace
unaware of the cluster it had joined, and service discovery then never
completed: measured 4 failures in 12 NDP bring-ups on an MT7925 pair, each
one accompanied by exactly one dropped event on the joining side and none
on the side that created the cluster.

NAN_EVENT_ID_STARTED_CLUSTER already defers past NAN_START through
nan_deferred_work for the same reason; JOINED_CLUSTER is the other exit of
the same firmware warm-up branch and needs the same treatment. Queue it on
that work with its own cluster id, so a started and a joined event pending
at once cannot overwrite each other.

Fixes: a5487a682406 ("wifi: mt76: mt7925: add NAN MCU helpers")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 20 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7925/nan.h   |  1 +
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  1 +
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 2d6760c50fc5..0fe8ae6c0d26 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -706,8 +706,20 @@ mt7925_nan_mcu_handle_de_event(struct mt792x_dev *dev, struct tlv *tlv)
 		return;
 	}
 
+	/* JOINED_CLUSTER has the same race as STARTED_CLUSTER above: the
+	 * firmware joins an existing cluster from inside its start-up passive
+	 * scan, so the event can land while NAN_START is still running and
+	 * nan.started is not set yet. Defer it the same way instead of
+	 * dropping it - a lost join leaves userspace unaware of the cluster it
+	 * is in and service discovery never completes.
+	 */
 	if (!dev->nan_vif || !ieee80211_vif_nan_started(dev->nan_vif)) {
-		dev_warn(dev->mt76.dev, "nan: joined-cluster event but NAN not started\n");
+		spin_lock_bh(&dev->nan_deferred_lock);
+		memcpy(dev->nan_joined_cluster_id, cluster_id, ETH_ALEN);
+		set_bit(MT7925_NAN_DEFERRED_JOINED_CLUSTER,
+			&dev->nan_deferred_pending);
+		spin_unlock_bh(&dev->nan_deferred_lock);
+		ieee80211_queue_work(dev->mt76.hw, &dev->nan_deferred_work);
 		return;
 	}
 
@@ -729,6 +741,7 @@ mt7925_nan_deferred_work(struct work_struct *work)
 {
 	struct mt792x_dev *dev = container_of(work, struct mt792x_dev,
 					      nan_deferred_work);
+	u8 joined_cluster_id[ETH_ALEN];
 	struct ieee80211_vif *vif;
 	unsigned long pending;
 	u8 cluster_id[ETH_ALEN];
@@ -737,6 +750,7 @@ mt7925_nan_deferred_work(struct work_struct *work)
 	pending = dev->nan_deferred_pending;
 	dev->nan_deferred_pending = 0;
 	memcpy(cluster_id, dev->nan_started_cluster_id, ETH_ALEN);
+	memcpy(joined_cluster_id, dev->nan_joined_cluster_id, ETH_ALEN);
 	spin_unlock_bh(&dev->nan_deferred_lock);
 
 	if (!pending)
@@ -750,6 +764,10 @@ mt7925_nan_deferred_work(struct work_struct *work)
 	if (test_bit(MT7925_NAN_DEFERRED_STARTED_CLUSTER, &pending))
 		ieee80211_nan_cluster_joined(vif, cluster_id, true, GFP_KERNEL);
 
+	if (test_bit(MT7925_NAN_DEFERRED_JOINED_CLUSTER, &pending))
+		ieee80211_nan_cluster_joined(vif, joined_cluster_id, false,
+					     GFP_KERNEL);
+
 	if (test_bit(MT7925_NAN_DEFERRED_SCHED_UPDATE_DONE, &pending))
 		ieee80211_nan_sched_update_done(vif);
 out:
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index 165cf21b787b..94d8d4bc445e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -144,6 +144,7 @@ enum mt7925_nan_key_type {
  */
 enum mt7925_nan_deferred_event {
 	MT7925_NAN_DEFERRED_STARTED_CLUSTER,
+	MT7925_NAN_DEFERRED_JOINED_CLUSTER,
 	MT7925_NAN_DEFERRED_SCHED_UPDATE_DONE,
 };
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 78901585d784..c46b88467193 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -424,6 +424,7 @@ struct mt792x_dev {
 	spinlock_t nan_deferred_lock;
 	unsigned long nan_deferred_pending;
 	u8 nan_started_cluster_id[ETH_ALEN];
+	u8 nan_joined_cluster_id[ETH_ALEN];
 
 	struct {
 		void *va;
-- 
2.43.0


