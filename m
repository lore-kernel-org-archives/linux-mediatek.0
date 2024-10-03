Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1476CF34BD
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 18:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=stIg9esjqTBVOCrbixO0axas16PaKZ9mDSWypU0VeBY=; b=ld3B2MCLIp0IocRl06Uch1uJ7c
	wre0GPGK95N5pBSWGFjGM6EhgUlbNCo0fzpEDzKt9HKtaqKUXef92zT1rOfF+PX/87xjHIiNilAFT
	9Ewn6R+nPI5m/yHNICXLCRLaD71eZHqx3flnu/Q/bZZdKowOa9qLd09Yp06NTjyv8VVhflAFAr8xt
	W01cvcOdWhw10zfXyieUgfzwBG1woNgDk1vyRTqLTcWfoO707La/nC6b34dC2icA8Ljqp43stkHvZ
	bQggj+3OOP4ERR75DJsgJ0t5i2w93cGRdSR1nUu7t6DGJo90tsUUtqv2BYTH/HVzhiDDzKg+v/Q0p
	85LE90bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swQIp-0000000A3U5-2nPL;
	Thu, 03 Oct 2024 18:11:51 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swQHZ-0000000A3Q1-1R3j;
	Thu, 03 Oct 2024 18:10:34 +0000
Received: by mail-qk1-x743.google.com with SMTP id af79cd13be357-7a9b72749bcso105319385a.0;
        Thu, 03 Oct 2024 11:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727979031; x=1728583831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=stIg9esjqTBVOCrbixO0axas16PaKZ9mDSWypU0VeBY=;
        b=l6bX1RuB1cxQnh4+vKa+8QnpVklt0/EyLS0cx25+uJwKGjLQSyQSXPbtit5I3rFpG7
         qiwRLS/XMoxriTNi2YDXBQAohARVgtV69AqYWnksmQHQzeFEz5bUl2XfZLxPEjXynkzE
         MaMpBEKfznDZEK+VR5qCnW5kMXb4cExiee89u2PDEdmA/RdHvCbTE4UGr27QP+L6xMbB
         zbOPqjvsqo6oGzR8lqHYur+/+5eMzVsTH+LYyF+5KzDlAdAz3TepWLGDUFld/5WdKFLg
         /Kp3Ys1cjrNraHf2wfNUPIpMSHEjCs4MOjI1k5oAHem3UUu+xiQYba7rA/f+pMFmBqVS
         x5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727979031; x=1728583831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stIg9esjqTBVOCrbixO0axas16PaKZ9mDSWypU0VeBY=;
        b=t1Yyle3qI30rqHTG1J6zv9RHz1MqAH9trYIfRf9hMYwLvAY726o8k0OivjJBHJ/bv4
         WxztaP8PODUkJ7D99U+l2e6GfXNggwBGSZ8pmJwijU3MLWHIvb/7G0+mGOYiDDght+ru
         XA887xn2mh3J+nXn6WJ8l8uIpt94q8gn6D091G4qKZ54eT7iEKHErflq+dB7AROzc/IF
         wOXo+x+vt/rCC8TmM0cPQqb5MSNUXe79Hav6BjcM855QhsKxYAHlysJk055OXJCfLLBB
         gSUT8x2y+cLOv1XyKcimqjtGN1C5uQGYImVXOhs5WnHcOORHkYPODgVH8aj9/Nd3oRu2
         DQvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG/ndnPpm7wr0JwlOwmbT28G8f93QC8gBkNj6WXALYc5DOsMNO1yABT9zt/cdEzH7Tyj9UYAyJpeLg9VnsfjTA@lists.infradead.org, AJvYcCX/8+CH6AgsSY6hc5yPVm1cJCQlRxIvi5kcispUm4r2Vp5Pxcgn5Jr/vXMy+TZKsK7Nx7mlasy06FW5MgyL0PU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAfjXnMyyT7rck1ZyDn3HbTTZ4ULYu+DTYwUfHKaE26i5dXBbC
	Vz7a694a1URt1UYc89/+9K8RT/iB09D9te/d1xrwalzPk5u02/Bp
X-Google-Smtp-Source: AGHT+IFTmn46ifwLoMc4eILjoM44c4aHtVzURhmUi0RKIZEq8CxXspB4gOtL7Nd6CsXfGNQ/pWRJew==
X-Received: by 2002:a05:620a:2443:b0:7a9:b744:fc41 with SMTP id af79cd13be357-7ae6f43705amr21400685a.14.1727979031521;
        Thu, 03 Oct 2024 11:10:31 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae6b3dc0bfsm69082285a.121.2024.10.03.11.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 11:10:31 -0700 (PDT)
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
	meichia.chiu@mediatek.com,
	krzk@kernel.org
Cc: linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chenyuan0y@gmail.com,
	zzjas98@gmail.com,
	Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH v5] wifi: mt76: Fix NULL Dereference caused by mt76_connac_get_he_phy_cap()
Date: Thu,  3 Oct 2024 13:09:59 -0500
Message-Id: <20241003180959.12158-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_111033_388984_854298B4 
X-CRM114-Status: UNSURE (   9.47  )
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

From: Zichen Xie <zichenxie0106@gmail.com>

mt76_connac_get_he_phy_cap() may return a NULL pointer,
leading to NULL Pointer Dereference.
Add a NULL check for the returned pointer.

Fixes: a5c372f77aa7 ("wifi: mt76: mt7925: extend mt7925_mcu_bss_he_tlv for per-link BSS")
Fixes: e6d557a78b60 ("mt76: mt7915: rely on mt76_connac_get_phy utilities")
Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
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


