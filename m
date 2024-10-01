Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B839CF318A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 00:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EIMVYLwIXxHJcv25n73ufbkJ6K09NM55kcrxLf+k2D0=; b=XZxOZ/jr9iksmULDSj40wv5PLf
	6P4snPy7vEIIZjIUTobgIutFZ8lAffMbGGD0nE6wI+lhUd+RvmdI3HdwxOs92yuxSOcfChGLYoKLf
	8vZq5pq6UR7+OPl9cUg9NRvDOxYDVntjUt3asYNRZR3xXHAktgbi0s8CZN5JaKYAjBHEuSl2xrYe1
	eGuE8Tc7n3rR/LX6I4nqvEsJ7+rUBKcIIKTIkPUKNxjBwKAcXufiHUxlq7dmj+ygYd4j6bvpUxvAj
	6Db0+aNRCiz85QMazJHfLrz6nx5kngJplW7VzjIPny+J4kTjk9CLLU5yqjo5V65sulMptddsNP2d/
	r0hOFg9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svmnZ-00000004QSO-08Eu;
	Wed, 02 Oct 2024 00:00:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svmmL-00000004QNb-3h7x;
	Tue, 01 Oct 2024 23:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=EIMVYLwIXxHJcv25n73ufbkJ6K09NM55kcrxLf+k2D0=; b=AxBkvyqsX7sP63fUtXEwrTyM9r
	ypa5KfAiFes8sBwKHQKoNPaWeAYoAteSN+tjoVvc31uYAqfP7Dhc1pfzqyRZ4uAuNsSDiSyIuBeFD
	uBalmaELN7tL9hY0ISIxQSObBSocHcINr/6ExFFE+AM2KEDGTKpF0vRGOiOXu/wElxpqnTXi1j9jR
	aKbfOGwneu8OkdU4quR/4hMpH9tYVoJA/mxIi5BAqPEv++yrlR1sBo9jdlNTTCtK/ZaCR6i/Nb+vQ
	dWZxPqy5OfMiCe0er3hyJL44BSraQP6rAGodCdqnEzUCk1qdJR/ML6O7YX3buaEAsDX0RZlCBNZu1
	uDDiE6DQ==;
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svmmI-00000003N6i-2men;
	Tue, 01 Oct 2024 23:59:40 +0000
Received: by mail-qv1-xf41.google.com with SMTP id 6a1803df08f44-6cb2f271043so63408446d6.0;
        Tue, 01 Oct 2024 16:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727827175; x=1728431975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EIMVYLwIXxHJcv25n73ufbkJ6K09NM55kcrxLf+k2D0=;
        b=Y0JN6fOTj/+hkLSgi1u2ewK8LA9GK7XXWLsU6KGiWUGTNL7oDcuoA+wAzgxoNl7+gr
         oUhOme8UklXshAYwwLsTVK6uX2hhGfriJ1qzdnwyMCL+0fCSJNRCw3+2qanGJXcmzFIC
         Jnk3sRWXKTaol0HyRM3P2kAvhuc1x0c9k+5St+QNQC6CU9xfdeHk5sezggXU+XQukNSK
         DPRw6V3N6tHWOZojXQi402T+d6hQdlFJ/pmFcIzBEnXZK2LAi18DQnEjh5VfXf5BsNfK
         XTmNaye0V+Fg8YCtmc2AtlPFr4BTPJ3FRnu+7rdtQKxm5eLN5TLR0x6xRc/JqCMGCysY
         TsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727827175; x=1728431975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIMVYLwIXxHJcv25n73ufbkJ6K09NM55kcrxLf+k2D0=;
        b=AO2zV7egVafi7W7MECcqkvSIkKSxqMhFmjhNopYIsrzYYg6Fck/SSLO4GMGApKgGNf
         Iw7Scjft6zlqcTcn9FouelMJi3N3V6jUdP/Wa1SiBCzIZH1D8MUr5LTIbfOnwRe79qaq
         yHgKgbj31ZGe/jk371Xo0M4eug7R7PJOOPrNNnbfN6dX4I0MReJW+aAXn9dC+CmL7Nm6
         4/BdEuion1bd332bKS/zfqW0tzlMCvFVNwwkFcnb4Ja/Y3DcCyzf5+5PqxP+N8PIaE4t
         EQJ7CMqSB/yb5HkvB3T1HRyfic1cnEo4MsGS8trdH8LZ0DcroNriftHeElxVKwWKsBdC
         gbXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEigyBHoUbAs6RH5h/mmXHmCY/+/8yJZ/MZdnQx2tMKRUOF55GoujNm9aXDOg/+8KcgWHMXyI9AOhWFdGir+g=@lists.infradead.org, AJvYcCXuNqw8XD+tswrH/0FtPeWA9xeP5Bt4JLB0vnr7qZSCwDUubtxzxiZAnr2NSUT7De1kSxCuBFRyRLaNSo+ka6hL@lists.infradead.org
X-Gm-Message-State: AOJu0YyMaEY1n33v7oPJNlYF4VG1TR5aXYK4BbCxH5sK0/zfZ5Gt7yFU
	Tc/48fqe3REnb4XCytz9mKsvFu7MszgSnwlE1cscBVFu8woZn9Vj
X-Google-Smtp-Source: AGHT+IFRGDetIIOogdXr7hM3QGLlkwxkKdUDQzBEOwXFyl/7/DUQTfRZKup3mPRitlBLh6GpQHzd2Q==
X-Received: by 2002:a05:6214:3a83:b0:6c7:c668:17fd with SMTP id 6a1803df08f44-6cb819dcd4cmr17609316d6.1.1727827175399;
        Tue, 01 Oct 2024 16:59:35 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b66d0d5sm55104956d6.81.2024.10.01.16.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 16:59:34 -0700 (PDT)
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
	mingyen.hsieh@mediatek.com,
	howard-yh.hsu@mediatek.com,
	StanleyYP.Wang@mediatek.com,
	allen.ye@mediatek.com,
	benjamin-jw.lin@mediatek.com,
	Bo.Jiao@mediatek.com,
	evelyn.tsai@mediatek.com,
	meichia.chiu@mediatek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	zzjas98@gmail.com,
	chenyuan0y@gmail.com,
	Gax-c <zichenxie0106@gmail.com>
Subject: [PATCH] wifi: mt76: Fix NULL Dereference caused by mt76_connac_get_he_phy_cap()
Date: Tue,  1 Oct 2024 18:59:08 -0500
Message-Id: <20241001235908.19431-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_005938_886207_F3CB2B14 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

mt76_connac_get_he_phy_cap() may return a NULL pointer,
leading to NULL Pointer Dereference.
Add a NULL check for the returned pointer.

Fixes: a5c372f77aa7 ("wifi: mt76: mt7925: extend mt7925_mcu_bss_he_tlv for per-link BSS")
Fixes: e6d557a78b60 ("mt76: mt7915: rely on mt76_connac_get_phy utilities")
Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
Reported-by: Zichen Xie <zichenxie0106@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 87d0dd040001..762be3a37228 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -551,6 +551,8 @@ mt7915_mcu_bss_he_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	struct tlv *tlv;
 
 	cap = mt76_connac_get_he_phy_cap(phy->mt76, vif);
+	if (!cap)
+		return;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, BSS_INFO_HE_BASIC, sizeof(*he));
 
@@ -1145,6 +1147,9 @@ mt7915_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
 	u8 nss_mcs = mt7915_mcu_get_sta_nss(mcs_map);
 	u8 snd_dim, sts;
 
+	if (!vc)
+		return;
+
 	bf->tx_mode = MT_PHY_TYPE_HE_SU;
 
 	mt7915_mcu_sta_sounding_rate(bf);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 748ea6adbc6b..55e4cda2f20f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2508,6 +2508,8 @@ mt7925_mcu_bss_he_tlv(struct sk_buff *skb, struct ieee80211_bss_conf *link_conf,
 	struct tlv *tlv;
 
 	cap = mt76_connac_get_he_phy_cap(phy->mt76, link_conf->vif);
+	if (!cap)
+		return;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_HE_BASIC, sizeof(*he));
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 6c445a9dbc03..55bb2d0e67e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -798,6 +798,8 @@ mt7996_mcu_bss_he_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	struct tlv *tlv;
 
 	cap = mt76_connac_get_he_phy_cap(phy->mt76, vif);
+	if (!cap)
+		return;
 
 	tlv = mt7996_mcu_add_uni_tlv(skb, UNI_BSS_INFO_HE_BASIC, sizeof(*he));
 
-- 
2.25.1


