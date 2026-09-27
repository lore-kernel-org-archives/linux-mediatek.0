Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0535C98338
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnVe5wEQo3FDnPgMfTarlYCeiDz8F+kBL76gyVnRNvs=; b=vbserdEMxPBvVVv6zgjiFiN5Pr
	gXzVVpraCXmDoh80UCmPL6KrXUn9UX4LI7dgzj7sgzNXtocFcAzQL2Wlm4H1lE687+O+RH9KTcuwY
	n/sRYXWom6Fxo06tdYdm+kBPa76y7+GxRRazl/5hCeprCk2FqxoMnuhK+20Eyi6LelStiK9YJNr/J
	IfcprfoUnPjKBMSk0qSLcFlBElseinJSEvXTwKc+7Ma51JDiup9nC0dj4X6y+73F77dj9oUxg4Ajb
	pTKe485p1ZK9MHt/5zejlK/NzFDxjx4lXfZTsJ4BEB9UjRbBBch74AfB6g+Ce30JDiHuF5deFDail
	mlztPyJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw1z-0000000GrTA-21Zo;
	Sun, 27 Sep 2026 21:03:31 +0000
Received: from mail-yx1-f49.google.com ([74.125.224.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw1x-0000000GrSF-2Ukf
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:03:30 +0000
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6714595153cso2022064d50.0
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543008; x=1791147808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tnVe5wEQo3FDnPgMfTarlYCeiDz8F+kBL76gyVnRNvs=;
        b=cwROQwBypIHlUPNbktjzxMSFyh6lQFpHObqOT+SCJ3qMJGkmNGlFE2SDvokcoHTqY1
         dqezYNS+crnbKptVJ30DKkeyYktsWnGyabQqZD2vnUGAiTSc6rQjH2PgtXXnGkA57s16
         ZTTnH7usZq3Qr++FvRsgIOHrz3KAfDa8ZmMFJh1Cle0Mm8Cc4EHll6xz7WuAgTC+Q/qH
         PcdxDHcuUsWfa8r4a66vn0T2MnDmGFYgNstJpA+swTcGqP0M/yxVmhWyJIVvwPNuUxye
         w0IxnCmj5WqoBMIuL7B2gDh+W1Cxcb3exi8IRmlx+vg1+RpPehsdpurpcUwyOOOWdpRk
         YPuA==
X-Forwarded-Encrypted: i=1; AKwUvBw1LVARkMz6APqNLM1NeDsOLe1e+BXr3iTQDHoqZfHnbeJDUSJGg7GyeRV3f2WHQG+WN1J3WR6BkmsKlZGGIg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLx7Ca822SJu+ee7N58LGLfGvkZlf6mAV7GfOyWgWoXAGiS42kK
	fLKY6WcXix8Ta03z48Ekz8Nb4ZNtZlGAOixt7uFiINWvRxRyyGV6l7ZN
X-Gm-Gg: AYBFou2GUWLHJuHF0wp0yXfyPX2MeMUPhzO6F1rl8i5EClHEIi8l7KLpWu2U07N4VAx
	4dFbFMdY+DV8b2KeI44aOKAvHtuBpPAAVnkz5JJQL35t9VxHHN+HhVJzcwRd6BzaJUKX4HH6yZJ
	yioo0RWqYoMsYLTjN+3catZ06kLMUu8npbCdj4BccmSSubyEocirIQqbU8mRrMlf0x3AkcjsCYw
	wSMbZOOUrPqY5Rs3IaMUxykCkrGTcG3/FGDS/QZNJ/eVmIbsImEJKig/dI7RUORLe5oNfTeSY26
	zuP9qoNONjywLqFy3a/06TFqmixzhMhqsFRg1ljTLG8KAX7TblJ0zOS9xwn9UVUb6s1K/QWB+nQ
	FcIhs2UIyhlei4cRSD6YNJ0qZzvUHEn/RPLldBk1Ce1XshgxmBCIpZeM1AL+kE3308HdimfQv2N
	8SP6smuEU9d7J9Xpi5nZflag0ETLu69/Mfjd2nLArGIEHvaxd/KFSO4Apkzz9Pwfnp6JJZEqRBG
	1nNd8k93Tw5J813CBcSwRsfBqePWSXj3V644zAPOHW1/2f0JXu0Ahhcbveggl16JckkMkU=
X-Received: by 2002:a53:d017:0:b0:675:3363:676e with SMTP id 956f58d0204a3-67533636cfamr1249316d50.10.1790543008270;
        Sun, 27 Sep 2026 14:03:28 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:03:26 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Chengwei Yu <chengwei.yu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 03/23] wifi: mt76: mt7925: implement NAN MAC address randomization
Date: Sun, 27 Sep 2026 16:02:45 -0500
Message-ID: <20260927210306.737669-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_140329_646174_FCD409D5 
X-CRM114-Status: GOOD (  14.70  )
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

From: Chengwei Yu <chengwei.yu@mediatek.com>

Add mt7925_nan_start/stop_mac_randomization() using a per-vif
delayed_work and period stored in struct mt792x_nan.

Per-vif (not per-dev) because the NAN iface combinations allow up
to two concurrent NAN_DATA vifs; a single dev-wide field would
silently lose randomization for the second NDI or let it overwrite
the first vif's pending work.

delayed_work (not timer_list) because the work function calls
mt7925_nan_set_nmi/ndi_address() which invokes mt76_mcu_send_msg()
with wait_resp=true; that can sleep, which is not allowed in softirq
context. This is consistent with scan_work, mlo_pm_work and ps_work
in this driver.

stop_mac_randomization() must be called without holding the dev
mutex since the work function acquires it. No caller is wired up
yet; the next patch does that in add/remove_interface.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chengwei Yu <chengwei.yu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 59 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/nan.h   |  7 +++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  9 +++
 3 files changed, 75 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index abbd3f7b081c..0b94bd4005d4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -745,6 +745,65 @@ int mt7925_nan_set_ndi_address(struct ieee80211_vif *vif,
 	return 0;
 }
 
+void mt7925_nan_mac_rand_work(struct work_struct *work)
+{
+	struct mt792x_vif *mvif = container_of(work, struct mt792x_vif,
+					       nan.mac_rand_work.work);
+	struct mt792x_dev *dev = mvif->phy->dev;
+	struct ieee80211_vif *vif =
+		container_of((void *)mvif, struct ieee80211_vif, drv_priv);
+	bool is_nmi = (vif->type == NL80211_IFTYPE_NAN);
+	u8 addr[ETH_ALEN];
+	int ret;
+
+	mt792x_mutex_acquire(dev);
+
+	if (!mvif->nan.mac_rand_period_sec)
+		goto out;
+
+	eth_random_addr(addr);
+
+	ret = is_nmi ? mt7925_nan_set_nmi_address(vif, dev, addr)
+		     : mt7925_nan_set_ndi_address(vif, dev, addr);
+
+	if (ret)
+		dev_err(dev->mt76.dev,
+			"NAN: failed to randomize %s address: %d\n",
+			is_nmi ? "NMI" : "NDI", ret);
+
+	ieee80211_queue_delayed_work(mt76_hw(dev), &mvif->nan.mac_rand_work,
+				     secs_to_jiffies(mvif->nan.mac_rand_period_sec));
+out:
+	mt792x_mutex_release(dev);
+}
+
+void mt7925_nan_start_mac_randomization(struct ieee80211_vif *vif,
+					u32 period_sec)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_dev *dev = mvif->phy->dev;
+
+	if (!period_sec)
+		return;
+
+	mvif->nan.mac_rand_period_sec = period_sec;
+
+	ieee80211_queue_delayed_work(mt76_hw(dev), &mvif->nan.mac_rand_work, 0);
+}
+
+/*
+ * Must be called without holding the dev mutex: mt7925_nan_mac_rand_work()
+ * acquires it, so cancel_delayed_work_sync() here would deadlock against a
+ * concurrently running instance of that work otherwise.
+ */
+void mt7925_nan_stop_mac_randomization(struct ieee80211_vif *vif)
+{
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+
+	mvif->nan.mac_rand_period_sec = 0;
+	cancel_delayed_work_sync(&mvif->nan.mac_rand_work);
+}
+
 static int mt7925_nan_avail_ctrl_tlv(struct sk_buff *skb,
 				     struct ieee80211_vif *vif)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index 9fd349e1cdab..191134825c3b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -503,6 +503,13 @@ int mt7925_nan_set_ndi_address(struct ieee80211_vif *vif,
 			       struct mt792x_dev *dev,
 			       const u8 *mac_address);
 
+void mt7925_nan_mac_rand_work(struct work_struct *work);
+
+void mt7925_nan_start_mac_randomization(struct ieee80211_vif *vif,
+					u32 period_sec);
+
+void mt7925_nan_stop_mac_randomization(struct ieee80211_vif *vif);
+
 void mt7925_nan_local_sched_changed(struct mt792x_dev *dev,
 				    struct ieee80211_vif *vif);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 9722d840c1af..64cca8852359 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -181,6 +181,15 @@ struct mt792x_nan {
 
 	/* Connection index bitmap, up to NAN_MAX_CONN_CFG peers */
 	unsigned long conn_bitmap;
+
+	/*
+	 * NMI/NDI MAC address randomization. Kept per-vif (rather than a
+	 * single pointer on mt792x_dev) because up to two NAN_DATA vifs can
+	 * coexist (see if_limits_nan_mcc/scc), each needing its own
+	 * independent randomization period and pending work.
+	 */
+	struct delayed_work mac_rand_work;
+	u32 mac_rand_period_sec;
 };
 
 struct mt792x_vif {
-- 
2.43.0


