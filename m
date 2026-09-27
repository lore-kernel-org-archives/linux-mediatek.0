Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D78C98338
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8o/w5oQz/mdjVqAVnhnoJdfXPk/8JAmt24eFT+WbC4=; b=lWBbnvX78hrBdVRc8MOBUn2wl9
	+Etjbr0YcNLMSmtA0xVPlLTKnzrNugc3lxEEHpsNSJZNRGTm+w954KNb6vXmPdBbV3BT7w35wqpad
	rU5Crewro2VTT47UYgyhQCqWTRKjVMTxPD/fMQ5OFtLL7NUe3ddOuE2rw5eOo+CwvWOl5n7Ox7NYA
	47UWQYWwe7fJixHiOJRhRPHj5KeyIjGay/4tJOIpDC+G0yFP2zx0uYHg36dbroVID5+2jGQl8Egkj
	UW7ESaQ/WqTg00MZqyM2uCcXg2OVbqTXd/QuPbxqHglzL7bWWxNO1Zbx0dz3+bxO1FoMx1w9XwGYS
	nc5XeLlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw2p-0000000Grbj-0QK6;
	Sun, 27 Sep 2026 21:04:23 +0000
Received: from mail-yw1-f171.google.com ([209.85.128.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw2m-0000000Grak-3Pd5
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:04:21 +0000
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8a87bc01e19so12430497b3.0
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543059; x=1791147859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8o/w5oQz/mdjVqAVnhnoJdfXPk/8JAmt24eFT+WbC4=;
        b=SwWbbpXdEqOwKVhs2tjciKcDYpOtBJ/j/+1KJlG7UBYNSZONIDlhZIAm01uaiKodB+
         Q7bE//pGH22Jr2sabNsKzavcqowp8EoTLEbJUTb+H0JZiNNaG0/CH1m6gxkzLKA4GXMJ
         D+5Z/agk7YmbuMelH8E77fSM+Qwhx2FMDL8pu2fc/lj3x7RR2+tkM5gtv3modysIe2Xa
         t9mAxK1TopnA9iFapB+rW06obgjkglK6TR9P+5hDabzxIs7RYfK8QCQGoFuOISfRXCYn
         Ydm4NmPnkRdUpePFV7s95QVKilFfCxgwKZ3o3/XPWt8G9jHxxBCgpqMj8H1okjPvHQtw
         XRNA==
X-Forwarded-Encrypted: i=1; AKwUvBzgvlqJ+xHNUx5NyJA6sWKP4dfZLYVNfcGarQfdESiWfwCG+8hsnI3mTi/D0eqWnJE1aOj2GbKkpyh/OOcLiQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKDjfPEoRaUwuJWky5KtMer+gAVxRwHz99D0JrV4lvh5x9WQvpy
	ukL/GkE2afxeNa+ToX9TO6E/AmkheQzGxifk2V6uMBcZvnkBeMSG/9I9MpwQKGpa
X-Gm-Gg: AYBFou0vyR//AUYdiv6HPfwXacAApU4expkDLgnL6v6eVMLaqn2Yke8Q5YjOS0XTq2j
	KCJ5WjlBNU4mEv2rt5i7uifJ21yF++FI486lUU3EJaSRg6LWlocypCIGLVEHttHrO4JIwcPFOhZ
	FeGQjsdStsR0T+k2ZYKHNhrGC9zQNyeAbZbUNBIK0lSqlq9AwjqX04gG2k1N8aNOl0dqy54Gu/n
	Z2jBXzmE5YdxH+dGTyJlze2pb6/iHxWeVGBh7CM1HNEiTJ/okAP1y+fCgnSUop0UXSwm5N8RdpW
	WA0vbtPF62tSurambRlRSi3o40S4gLVPaQEkx6Ej3aXeUefAxIQb6xGWNTRGQDCBQGxopkMV6A/
	wOVXIb3ZXweN5xLpjj1jIv4SmLtlE0XiTGoUldR8K7aQzD85bxct0yQRof36v1GB03ajQ/gea9m
	MiNg4qmeji5wv5aBe+6Pv1J//ydJQjKDUbxY59AM4vbUQQiNJx+R4sVCMXvntq1RWVSU3ZmWiLf
	j8+y26Mkio/r6sBVuQ4f6veJgEkJNzTHACyUjYb0nw7wdDhkQG5NKyMko+uFBm75B5ARGQ=
X-Received: by 2002:a05:690c:7107:b0:894:b231:7a0c with SMTP id 00721157ae682-8a647275e4fmr57902327b3.0.1790543059548;
        Sun, 27 Sep 2026 14:04:19 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:04:18 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Jacobs Wu <jacobs.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 18/23] wifi: mt76: mt7925: defer the NAN joined-cluster event out of NAN_START
Date: Sun, 27 Sep 2026 16:03:00 -0500
Message-ID: <20260927210306.737669-19-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_140420_871366_4AD1D541 
X-CRM114-Status: GOOD (  17.76  )
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
index 715e080ce4ee..7aacfd6527e4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -709,8 +709,20 @@ mt7925_nan_mcu_handle_de_event(struct mt792x_dev *dev, struct tlv *tlv)
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
 
@@ -732,6 +744,7 @@ mt7925_nan_deferred_work(struct work_struct *work)
 {
 	struct mt792x_dev *dev = container_of(work, struct mt792x_dev,
 					      nan_deferred_work);
+	u8 joined_cluster_id[ETH_ALEN];
 	struct ieee80211_vif *vif;
 	unsigned long pending;
 	u8 cluster_id[ETH_ALEN];
@@ -740,6 +753,7 @@ mt7925_nan_deferred_work(struct work_struct *work)
 	pending = dev->nan_deferred_pending;
 	dev->nan_deferred_pending = 0;
 	memcpy(cluster_id, dev->nan_started_cluster_id, ETH_ALEN);
+	memcpy(joined_cluster_id, dev->nan_joined_cluster_id, ETH_ALEN);
 	spin_unlock_bh(&dev->nan_deferred_lock);
 
 	if (!pending)
@@ -753,6 +767,10 @@ mt7925_nan_deferred_work(struct work_struct *work)
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
index 415fd6b6f0e6..32740e3769d6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -143,6 +143,7 @@ enum mt7925_nan_key_type {
  */
 enum mt7925_nan_deferred_event {
 	MT7925_NAN_DEFERRED_STARTED_CLUSTER,
+	MT7925_NAN_DEFERRED_JOINED_CLUSTER,
 	MT7925_NAN_DEFERRED_SCHED_UPDATE_DONE,
 };
 /* NAN 4.0 Table 79. Device Capability attribute format, Supported Bands */
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index ee462eab4028..8e1588970ac1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -446,6 +446,7 @@ struct mt792x_dev {
 	spinlock_t nan_deferred_lock;
 	unsigned long nan_deferred_pending;
 	u8 nan_started_cluster_id[ETH_ALEN];
+	u8 nan_joined_cluster_id[ETH_ALEN];
 };
 
 static inline struct mt792x_bss_conf *
-- 
2.43.0


