Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ED1CDB479
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 00:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVfDZKme2Ls4NvcZIFifaI+/XMY/L4bFWt9qeHwZTb4=; b=iHUKVgtDWYlusJSFwZv2cj0tVj
	3EdgTVHKnw/giChfVhuutIXK9KTBflNMlTohwgtODBUj6r2sdYTXpWTGOAIN73fVdKWT6vSnU76Lh
	bqGLCaMJPJIUKjrCQQIuU5YTz4tVerSis9ETD6yvGyQ8IVXptzoy5cWlBlFbdjcu/TyFZYDvqCMDc
	7EvYY2E4r7aORbtMyEhqjw+sdsggDEENFYrOsTOk5EP0mopYIQS3wf13NWoP9PvnoP/qs1QxnsXM9
	sg3cq7gOx8LOGUCesX9/f3X+eS/JRRGUmN0s7hm2jg7872cakXgBVjqy2IAup3l7z+834nLaYcgY8
	EqH2NQ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXp1-00000008Skz-2Z54;
	Thu, 25 Jun 2026 00:19:59 +0000
Received: from mail-pg1-f172.google.com ([209.85.215.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXoz-00000008SjY-3gOz
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 00:19:59 +0000
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c8ff15af279so1004014a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Jun 2026 17:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782346797; x=1782951597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sVfDZKme2Ls4NvcZIFifaI+/XMY/L4bFWt9qeHwZTb4=;
        b=Ke8oZ89l0eawL+wOz9XZcNPG7nCAvHv1izwt/8oFA9f2QWHILqCFmnkVOADSibJpBI
         BLfRh/2Ww3xpy00+9MDBiu8xf9kECfAVbcInq863fqMoq9ebXF1/s8ZUO3cV0pxcG72S
         YdUGzWjJ4l+NHp1aE57m9me/WC0dibILmKhHE985rT9ywNHE8XFFWEqSAGpcnTn5PA3b
         mQlRhY0l13p6kRRBIPQW7SSIivbFw/HfJdQ5adu+7TsuHsOUvePyT4LWkBD9Zcu8q157
         WFvFqaDyuNI6TppdDybFOnmtoOtAQJhnT8LsRM6fjFl1q1s/t210Q6f2xq6NMwGBMNAw
         2o+g==
X-Forwarded-Encrypted: i=1; AFNElJ/WLRU9sMmn3i50F3tUAT4msyUj3QS7R3VWVW9QormqFN5XThVRq67fAkGUOmHkwaIEzdoO0a8Uq/1Z/VM0MQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyijTL7gYS30eIAHHfczXLHLv/L/oJE7hUwMbpUfq/1b/TEQX0y
	YHd4WtWqPXsMVjVtJUktemUz1NR/daYOCDjRLB02AFQphwPQJ2ZlYfmX
X-Gm-Gg: AfdE7cmgEkNR8ZXt+tIsBFyIXboNVmAhRjGyFOVt3YLAKauB6LU9gL7EzXUmhl4HnlH
	wmTYGX1MvctZeLjMMBofTVFi4b3goe6nyvxyqxbrboMjiJ6XWJOqoHVgZEeBUjR+vWDYiapGfUS
	I3LhBex8fyuJeLSGg0rNzN61GoPU+dH55Bgy8+MKruW1nZIemkceOmQZaGggUhY5qmRlAskxem0
	7MzgO3w2FUDFS1aws8EHptp9IuAVyjkmkxmz71KUd35qgvTb6PlUR1zmbJAJx56uJ+yQiGkoSkz
	nPKv0c4VdVls8IA/oRWCNb51JclTJnAjIWTuzNRvSND1Mk62NrQy0S2MjEdAYhsJ5VHDC2sxVV1
	3GEsAmuwWVT7/wW1Prt0SjXP1u7QYaRXmI9bYoybS0NBEQSFH/txmhhpuOZq4i9vTWIylFkCVhN
	7qu37to1gH9s0equ1e89rg1+LAMsid92cmUV682N0wQlmedQWEo9EOslnxSZjdRVIh63wmb6VvE
	jjdmqk0ikVIr4f0ZetL0UWdTufRs357qdWV//LY
X-Received: by 2002:a05:6a20:6a1b:b0:3b4:b30e:1b4d with SMTP id adf61e73a8af0-3bd4afb8cdamr262712637.40.1782346796989;
        Wed, 24 Jun 2026 17:19:56 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bc1e0d10sm586839a12.21.2026.06.24.17.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 17:19:56 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: chengwei.yu@mediatek.com,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 8/9] wifi: mt76: mt792x: build iface combinations dynamically
Date: Wed, 24 Jun 2026 19:18:33 -0500
Message-ID: <20260625001834.475094-9-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625001834.475094-1-sean.wang@kernel.org>
References: <20260625001834.475094-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_171957_923191_0477BEAC 
X-CRM114-Status: GOOD (  14.87  )
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

From: Sean Wang <sean.wang@mediatek.com>

Move mt792x interface combination selection into a helper and store the
selected table in mt792x device state.

This keeps the existing non-CNM and CNM combinations unchanged while
making later firmware-gated extensions add combinations without touching
the common wiphy setup path.

Co-developed-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
Co-developed-by: Jeremy Yu <chengwei.yu@mediatek.com>
Signed-off-by: Jeremy Yu <chengwei.yu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  2 ++
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 36 ++++++++++++++-----
 2 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 9d5a2adc81f6..73f2333c2970 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -324,6 +324,8 @@ struct mt792x_dev {
 	struct ieee80211_chanctx_conf *new_ctx;
 
 	struct ieee80211_vif *nan_vif;
+	const struct ieee80211_iface_combination *iface_combinations;
+	int n_iface_combinations;
 };
 
 static inline struct mt792x_bss_conf *
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index a0db815c27bc..ffe0bcdf1df6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -60,7 +60,7 @@ static const struct ieee80211_iface_limit if_limits_chanctx_scc[] = {
 	}
 };
 
-static const struct ieee80211_iface_combination if_comb_chanctx[] = {
+static const struct ieee80211_iface_combination if_comb_chanctx_base[] = {
 	{
 		.limits = if_limits_chanctx_mcc,
 		.n_limits = ARRAY_SIZE(if_limits_chanctx_mcc),
@@ -77,6 +77,22 @@ static const struct ieee80211_iface_combination if_comb_chanctx[] = {
 	}
 };
 
+static int mt792x_setup_iface_combinations(struct mt792x_dev *dev)
+{
+	const bool cnm = !!(dev->fw_features & MT792x_FW_CAP_CNM);
+
+	if (!cnm) {
+		dev->iface_combinations = if_comb;
+		dev->n_iface_combinations = ARRAY_SIZE(if_comb);
+		return 0;
+	}
+
+	dev->iface_combinations = if_comb_chanctx_base;
+	dev->n_iface_combinations = ARRAY_SIZE(if_comb_chanctx_base);
+
+	return 0;
+}
+
 void mt792x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 	       struct sk_buff *skb)
 {
@@ -663,6 +679,7 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 	struct mt792x_dev *dev = phy->dev;
 	struct wiphy *wiphy = hw->wiphy;
+	int err;
 
 	hw->queues = 4;
 	if (dev->has_eht) {
@@ -683,15 +700,17 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 	hw->vif_data_size = sizeof(struct mt792x_vif);
 	hw->chanctx_data_size = sizeof(struct mt792x_chanctx);
 
-	if (dev->fw_features & MT792x_FW_CAP_CNM) {
+	if (dev->fw_features & MT792x_FW_CAP_CNM)
 		wiphy->flags |= WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
-		wiphy->iface_combinations = if_comb_chanctx;
-		wiphy->n_iface_combinations = ARRAY_SIZE(if_comb_chanctx);
-	} else {
+	else
 		wiphy->flags &= ~WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
-		wiphy->iface_combinations = if_comb;
-		wiphy->n_iface_combinations = ARRAY_SIZE(if_comb);
-	}
+
+	err = mt792x_setup_iface_combinations(dev);
+	if (err)
+		return err;
+
+	wiphy->iface_combinations = dev->iface_combinations;
+	wiphy->n_iface_combinations = dev->n_iface_combinations;
 	wiphy->flags &= ~(WIPHY_FLAG_IBSS_RSN | WIPHY_FLAG_4ADDR_AP |
 			  WIPHY_FLAG_4ADDR_STATION);
 	wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION) |
@@ -699,6 +718,7 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 				 BIT(NL80211_IFTYPE_P2P_CLIENT) |
 				 BIT(NL80211_IFTYPE_P2P_GO) |
 				 BIT(NL80211_IFTYPE_P2P_DEVICE);
+
 	wiphy->max_scan_ie_len = MT76_CONNAC_SCAN_IE_LEN;
 	wiphy->max_scan_ssids = 4;
 	wiphy->max_sched_scan_plan_interval =
-- 
2.43.0


