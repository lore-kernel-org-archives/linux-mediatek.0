Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB922CDB479
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 00:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxGQdM0c2TatqyA1QygknbGg8MMT1//ZBGDzhZkibBo=; b=zqJ0r0JbTb38B9rxW1VniTNGfW
	lTaKV3Yp1ApVZIh45gtmPC5yfWN9rZbRmAi1AQv2k8+oISATrfkIDsn4Wkspbc7A9zfsIHNZLVoym
	7lAgNmQ5NcXwBh/StHinen0fnvQ04N6GUXhQDqr32VQsGqblc1SyhubPtqr8YOe2PwyTXbfM2HNT4
	2x1iu63pagNQ+JYbv2mg3/yEi/ArAw9sDZHvWEkxb0GekQSXSvOagf+CjsNmgPFkSeSVEb/uRZyNi
	9cYLv2MAWHJ+oPnH6XVgKgFpJgPuT7RoA7eOK5RjZZTEVLd5T5arBjvUyIYzuk0tL49u4Ml2nwi2c
	omDru86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXpC-00000008Snr-2lEU;
	Thu, 25 Jun 2026 00:20:10 +0000
Received: from mail-pg1-f180.google.com ([209.85.215.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcXpA-00000008SnX-16C6
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 00:20:09 +0000
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c88b8fe9059so580079a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Jun 2026 17:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782346807; x=1782951607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hxGQdM0c2TatqyA1QygknbGg8MMT1//ZBGDzhZkibBo=;
        b=peTRboMk/JDM+RAJu+kU65twAqoyvO5W+QB3GdE/eJZpS5TbkEWr/47ld4lIw6WXwW
         dQXeQFIg/hYnkHjRGlyhnrP1dopcG80MApasurwvDa/vIgQO2BwH6GpAQ2VEE0n8mTi9
         WzGOYPq1SIq7fTGdxuVfbzhlWBounioYkd2db6yg0pHtbhkFpfNG3Z8ecTRtKkFV0voV
         odomo0BuST8Aq8XcPHpABh39pnvbHnXVXxbr1rHsc/b0br2CaII4TP6j5sBdxLcFAqrI
         UsWEgFmMv7vuXMnj7ZQk/z5fr4TD3j/2cGiePw1YTiOU0L3h5OgX321gro5gvVVR6sJu
         gG3A==
X-Forwarded-Encrypted: i=1; AFNElJ9Irfr59rerdYn6W6D3h/5R54Qe/9jgnHojKDlFBfGSRFKuKB8zJbbGW9wI3aohHcX/tnu3EOyakcE/f3Jl0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnqogSEhNEzDmlk7RjC5jiwozmbF0nUAAgPaJYChChaxqoNPOH
	/7rq9+8osH5SqU4oD+kSbWz5JCJVDJSYkw3nn1BLmZozt6Mdr+trSoO+
X-Gm-Gg: AfdE7clBKVvGbnygLPyL/z7S++9f/sy/iASCiCVA+ibrRE51iS5iScwCmptGEmkn7VQ
	vClAsdFlwVANRTSP8hCmhPu01HQrwBC70szFCKRM9CpfZhHaMO/IOQFa9Nh3rMiSdBMMbIZ5xKi
	hbpmR1zb1ojV4FNgNi6+4o6QRF4xNOjq70ppvWUWu7tbZgcvil1kIHNcnGXZ1AekUiffeJvUxC1
	epsi81+Xd0+JtP1OgWDWeZCqBzf0plFTQrBf9fl1Zf0DxFVbOLe0zwgJc8OoTmpPhrbqD9K+ujM
	HhQKxAUuZlJqc+BL+bYLedXd7NxqExIQVAPq/85u3Cw09NO0yLYS/CrWKYvlFd+LZNB2qjNGh08
	B9ESdKtvv3M7Drc9PDMc0AXAb3kab2x9KEwReEiKRf2qVPrY9oGa2v9Lamxd7egPhZ02D7pZw4M
	gfDkrS38QiCl67PZQ0l7M3hrURtxZ6pOpjHGJhN7vDqDnf+T5Zd5z1yahXvBUjCAtWihcpPr1Tz
	gJjxmWqLeoqmuBmXdfUXclAw2O4bw==
X-Received: by 2002:a05:6a21:9982:b0:3ba:e5e2:73bf with SMTP id adf61e73a8af0-3bd4afd8113mr325777637.43.1782346807421;
        Wed, 24 Jun 2026 17:20:07 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bc1e0d10sm586839a12.21.2026.06.24.17.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 17:20:06 -0700 (PDT)
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
Subject: [PATCH v2 9/9] wifi: mt76: mt792x: advertise NAN data support
Date: Wed, 24 Jun 2026 19:18:34 -0500
Message-ID: <20260625001834.475094-10-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625001834.475094-1-sean.wang@kernel.org>
References: <20260625001834.475094-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_172008_327287_8FCBABD9 
X-CRM114-Status: GOOD (  15.73  )
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

Advertise NAN and NAN data support when firmware exposes NAN
capability.

Add NAN interface combinations on top of the dynamic combination
framework, advertise 2.4 GHz and 5 GHz NAN bands, and enable secure
NAN.

Keep the base interface combinations unchanged when NAN is unavailable
so existing STA/AP/P2P modes keep the same limits.

Co-developed-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
Co-developed-by: Jeremy Yu <chengwei.yu@mediatek.com>
Signed-off-by: Jeremy Yu <chengwei.yu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 96 ++++++++++++++++++-
 1 file changed, 92 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index ffe0bcdf1df6..411c04640add 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -3,6 +3,7 @@
 
 #include <linux/module.h>
 #include <linux/firmware.h>
+#include <linux/slab.h>
 
 #include "mt792x.h"
 #include "dma.h"
@@ -60,6 +61,40 @@ static const struct ieee80211_iface_limit if_limits_chanctx_scc[] = {
 	}
 };
 
+static const struct ieee80211_iface_limit if_limits_nan_mcc[] = {
+	{
+		.max = 2,
+		.types = BIT(NL80211_IFTYPE_STATION),
+	},
+	{
+		.max = 1,
+		.types = BIT(NL80211_IFTYPE_NAN),
+	},
+	{
+		.max = 2,
+		.types = BIT(NL80211_IFTYPE_NAN_DATA),
+	},
+};
+
+static const struct ieee80211_iface_limit if_limits_nan_scc[] = {
+	{
+		.max = 2,
+		.types = BIT(NL80211_IFTYPE_STATION),
+	},
+	{
+		.max = 1,
+		.types = BIT(NL80211_IFTYPE_NAN),
+	},
+	{
+		.max = 2,
+		.types = BIT(NL80211_IFTYPE_NAN_DATA),
+	},
+	{
+		.max = 1,
+		.types = BIT(NL80211_IFTYPE_AP),
+	},
+};
+
 static const struct ieee80211_iface_combination if_comb_chanctx_base[] = {
 	{
 		.limits = if_limits_chanctx_mcc,
@@ -77,9 +112,31 @@ static const struct ieee80211_iface_combination if_comb_chanctx_base[] = {
 	}
 };
 
-static int mt792x_setup_iface_combinations(struct mt792x_dev *dev)
+static const struct ieee80211_iface_combination if_comb_chanctx_nan[] = {
+	{
+		.limits = if_limits_nan_mcc,
+		.n_limits = ARRAY_SIZE(if_limits_nan_mcc),
+		.max_interfaces = MT792x_MAX_INTERFACES,
+		.num_different_channels = 2,
+		.beacon_int_infra_match = false,
+	},
+	{
+		.limits = if_limits_nan_scc,
+		.n_limits = ARRAY_SIZE(if_limits_nan_scc),
+		.max_interfaces = MT792x_MAX_INTERFACES,
+		.num_different_channels = 1,
+		.beacon_int_infra_match = false,
+	},
+};
+
+static int mt792x_setup_iface_combinations(struct mt792x_dev *dev,
+					   struct wiphy *wiphy)
 {
 	const bool cnm = !!(dev->fw_features & MT792x_FW_CAP_CNM);
+	const bool nan = !!(dev->fw_features & MT792x_FW_CAP_NAN);
+	const int n_base = ARRAY_SIZE(if_comb_chanctx_base);
+	const int n_nan = ARRAY_SIZE(if_comb_chanctx_nan);
+	struct ieee80211_iface_combination *comb;
 
 	if (!cnm) {
 		dev->iface_combinations = if_comb;
@@ -87,8 +144,24 @@ static int mt792x_setup_iface_combinations(struct mt792x_dev *dev)
 		return 0;
 	}
 
-	dev->iface_combinations = if_comb_chanctx_base;
-	dev->n_iface_combinations = ARRAY_SIZE(if_comb_chanctx_base);
+	/* CNM enabled, NAN optional */
+	if (!nan) {
+		dev->iface_combinations = if_comb_chanctx_base;
+		dev->n_iface_combinations = ARRAY_SIZE(if_comb_chanctx_base);
+		return 0;
+	}
+
+	/* CNM + NAN: dynamically build base + nan list */
+	comb = devm_kcalloc(&wiphy->dev, n_base + n_nan, sizeof(*comb),
+			    GFP_KERNEL);
+	if (!comb)
+		return -ENOMEM;
+
+	memcpy(comb, if_comb_chanctx_base, sizeof(if_comb_chanctx_base));
+	memcpy(comb + n_base, if_comb_chanctx_nan, sizeof(if_comb_chanctx_nan));
+
+	dev->iface_combinations = comb;
+	dev->n_iface_combinations = n_base + n_nan;
 
 	return 0;
 }
@@ -705,7 +778,7 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 	else
 		wiphy->flags &= ~WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
 
-	err = mt792x_setup_iface_combinations(dev);
+	err = mt792x_setup_iface_combinations(dev, wiphy);
 	if (err)
 		return err;
 
@@ -719,6 +792,21 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 				 BIT(NL80211_IFTYPE_P2P_GO) |
 				 BIT(NL80211_IFTYPE_P2P_DEVICE);
 
+	if ((dev->fw_features & MT792x_FW_CAP_CNM) &&
+	    (dev->fw_features & MT792x_FW_CAP_NAN)) {
+		wiphy->interface_modes |= BIT(NL80211_IFTYPE_NAN) |
+					  BIT(NL80211_IFTYPE_NAN_DATA);
+		wiphy->nan_supported_bands = BIT(NL80211_BAND_2GHZ) |
+					      BIT(NL80211_BAND_5GHZ);
+		wiphy->nan_capa.flags = WIPHY_NAN_FLAGS_CONFIGURABLE_SYNC |
+					WIPHY_NAN_FLAGS_USERSPACE_DE;
+		wiphy->nan_capa.op_mode = NAN_OP_MODE_PHY_MODE_MASK;
+		wiphy->nan_capa.n_antennas = 0x22;
+		wiphy->nan_capa.max_channel_switch_time = 12;
+		wiphy->nan_capa.dev_capabilities = NAN_DEV_CAPA_EXT_KEY_ID_SUPPORTED;
+		wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_SECURE_NAN);
+	}
+
 	wiphy->max_scan_ie_len = MT76_CONNAC_SCAN_IE_LEN;
 	wiphy->max_scan_ssids = 4;
 	wiphy->max_sched_scan_plan_interval =
-- 
2.43.0


