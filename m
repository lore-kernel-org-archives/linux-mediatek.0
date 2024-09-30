Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA8DCEB2C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 21:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vsQ/e2xiI+dJT8z4JJ8m8p+LUueRGlcK8RjgeON3V5o=; b=1963kcqdomAS75JBO2MnLyGsUG
	umLvohUk7XnEsPNx63lfCh8FqEVY1v66OiWpnexIJtUftAvSh6/zLlOxtTZHq6MjeCRNQS1EJIHTk
	KcxXX/6Jh8UDtpN30jcp5XntE051pg/c5DHVcQon/JYZdtLv65XUvzlJN8ltjmpqp3x6SIrmEeX1X
	moQTIiPYuip86sIRUKWm2UGFR83ozdj6SJE2YfsB5WALIOC08PsWnMWRwajPgZRci8EsocvZd3WXh
	7zWC3bYfNSjHQw3cJguHzp/1x1e3rJV7XCB7nmYlzGSjA+UJmMBn3YLKQKulhnIsQW6Sx5Em51yos
	iYiozqYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svNq5-00000000shv-2nZh;
	Mon, 30 Sep 2024 21:21:53 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svNoq-00000000scm-1ftk;
	Mon, 30 Sep 2024 21:20:38 +0000
Received: by mail-qt1-x841.google.com with SMTP id d75a77b69052e-457ce5fda1aso42243161cf.1;
        Mon, 30 Sep 2024 14:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727731235; x=1728336035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vsQ/e2xiI+dJT8z4JJ8m8p+LUueRGlcK8RjgeON3V5o=;
        b=g4DM27FfZ9aj+XjIw0WlcOJP67/A2eq4Q0Hd1dig50XwYFzSYc1ttEdZTm0XJN+wRh
         I9vGnCgFTLqjvonjEU+HvV/qcfpkp4heXHbStlmtJoZAClLovMiugZnf/R17yN+X+5fp
         G1HK5Ctr3SOSw+KUJm8am+xjIbb+YfN7ojFIl2Jl134IbCTVSljgTpPAiUyyvtEqBZ7i
         VlsOZCEEQgZQPBM2G9iSDFRa5VKqVuEK0c0YuNd4U8Cy9C+B3wLlkObM+IrlCF4FzEUi
         xengKWPaGmLVFFjZugey/Vz1jC6HAoDtJbxKyapW0x/gvWdZ65W1D8x1Fq0ZrgLDE1z8
         abcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727731235; x=1728336035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsQ/e2xiI+dJT8z4JJ8m8p+LUueRGlcK8RjgeON3V5o=;
        b=KB6QFps82NGgtwfrcUoj9Lgkh+L4ipNpE+dZqodbG3VgJPM+Ep9OJ0abXUXlDyTZ7W
         p9UTZIedgvTiY7PFMv/qEd0kTIPmTlCGCiIYzTzom1Fh1CPFllvMDjdGVrN0+zXoAlPW
         iEgMjBkvE0spbtD94uS22E1IxUQdQfwekBeBb/Xra8AM9de+zlQ3j7eQ3j9tuS1oyo3N
         pU2n2N0Phs1Rr+JIJJO41NraSJCNJyaZYdnNT019IvmpThXPaKRHpmDO9JL4mxQQoXaN
         brtbR1LRcyk0tPWUsjM0lV4+j31U6dl3P7U/mRI1fu9F+xafp2GFR4Eom4CAYy8tC/Pk
         KMMA==
X-Forwarded-Encrypted: i=1; AJvYcCV7yzmNKB2Hi7OPZ+pfJMxCbv2ONx38rTPGKKOxn80bAjj/omWYLdq2zoFQTlXGa/OcAp2QEXNk0Tn4ZG4+NeGE@lists.infradead.org, AJvYcCX9C9J4Z31O3NVmuMHImrEY2E73SRk80oOyooZlZm66i6LPJ+uP7x+0AF5wU3CNVup49nDZyC/MSNVUchyvpMM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/Zvbi6adD4XSIn41sk7lqg9O9hGBN+vs9h+jS7GwVLmfNBBsw
	uRmaAfFcbrAI9FBsLmWV2pUAeKIrV+xofNOj6qTcl6i03AMJ8BHc
X-Google-Smtp-Source: AGHT+IGd7PGLabE8elrrXK6SjnFi/BH8/IOka198aIEgOeWLSyPWOgxqBQ5q9mzYuHp41bzSL9jlIg==
X-Received: by 2002:a05:6214:3d8a:b0:6cb:32ef:d55f with SMTP id 6a1803df08f44-6cb3b5b7ef0mr236171746d6.6.1727731234766;
        Mon, 30 Sep 2024 14:20:34 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b630438sm43196826d6.70.2024.09.30.14.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 14:20:33 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johannes.berg@intel.com,
	quic_adisi@quicinc.com,
	deren.wu@mediatek.com,
	chui-hao.chiu@mediatek.com,
	meichia.chiu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	howard-yh.hsu@mediatek.com,
	StanleyYP.Wang@mediatek.com,
	allen.ye@mediatek.com,
	benjamin-jw.lin@mediatek.com,
	Bo.Jiao@mediatek.com,
	Money.Wang@mediatek.com
Cc: linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Gax-c <zichenxie0106@gmail.com>,
	Zijie Zhao <zzjas98@gmail.com>,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] wifi: mt76: Fix NULL Pointer Dereference caused by mt76_connac_get_he_phy_cap()
Date: Mon, 30 Sep 2024 16:20:14 -0500
Message-Id: <20240930212014.30607-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_142036_612397_2C8B8FBA 
X-CRM114-Status: GOOD (  10.18  )
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

like commit f503ae90c735 ("wifi: mt76: mt7996: fix NULL pointer dereference in mt7996_mcu_sta_bfer_he"), mt76_connac_get_he_phy_cap() may return a NULL pointer, leading to NULL Pointer Dereference.
Add a null check for the returned pointer.

Fixes: a5c372f77aa7 ("wifi: mt76: mt7925: extend mt7925_mcu_bss_he_tlv for per-link BSS")
Fixes: e6d557a78b60 ("mt76: mt7915: rely on mt76_connac_get_phy utilities")
Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
Reported-by: Zichen Xie <zichenxie0106@gmail.com>
Reported-by: Zijie Zhao <zzjas98@gmail.com>
Reported-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 6 ++++++
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 3 +++
 3 files changed, 12 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 87d0dd040001..941a6e40e94c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -552,6 +552,9 @@ mt7915_mcu_bss_he_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 
 	cap = mt76_connac_get_he_phy_cap(phy->mt76, vif);
 
+	if (!cap)
+		return;
+
 	tlv = mt76_connac_mcu_add_tlv(skb, BSS_INFO_HE_BASIC, sizeof(*he));
 
 	he = (struct bss_info_he *)tlv;
@@ -1145,6 +1148,9 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 	u8 nss_mcs = mt7915_mcu_get_sta_nss(mcs_map);
 	u8 snd_dim, sts;
 
+	if (!vc)
+		return;
+
 	bf->tx_mode = MT_PHY_TYPE_HE_SU;
 
 	mt7915_mcu_sta_sounding_rate(bf);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 748ea6adbc6b..1caf3e3e0e87 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2509,6 +2509,9 @@ mt7925_mcu_bss_he_tlv(struct sk_buff *skb, struct ieee80211_bss_conf *link_conf,
 
 	cap = mt76_connac_get_he_phy_cap(phy->mt76, link_conf->vif);
 
+	if (!cap)
+		return;
+
 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_HE_BASIC, sizeof(*he));
 
 	he = (struct bss_info_uni_he *)tlv;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 6c445a9dbc03..e547729701b7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -799,6 +799,9 @@ mt7996_mcu_bss_he_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 
 	cap = mt76_connac_get_he_phy_cap(phy->mt76, vif);
 
+	if (!cap)
+		return;
+
 	tlv = mt7996_mcu_add_uni_tlv(skb, UNI_BSS_INFO_HE_BASIC, sizeof(*he));
 
 	he = (struct bss_info_uni_he *)tlv;
-- 
2.25.1


