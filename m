Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CE3EFCE53
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2026 23:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAqqe+aeOoyV8Ax1MI/sypRmEwsUTxpCb02A2MgON44=; b=W3g9Dpvnto6zeonqbRXW6VaRQx
	5R9bEcrwqCdkUSKbGS3YplGC3dOkUfxPEzcB6fhLBbOhpya4Me1ylCn6OgJTwLsBAWzsZ22zGjrez
	fsd6mcCjH2JrVaVi19QYLQGrBdLcYqKmvErZSzWu5go8oQg5HGNslt172Fco5yaqVtIgnzED14WAx
	/aHmW7nTGQdaPRBykoYGIDJ/NBlzE4DlxYPF5/IFNj/NDgvNv2o2k6RNDY0CvuLgvgB5fTe1OWspb
	aAStpJxxVQRHNFFzH628rferDs+feq0KFb3Sjff1oj0OpanGWrQQTHrIJiiIRR294S2ecUVNqxa3g
	3d7GlZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxvzq-00000000eKe-3QlV;
	Wed, 04 Mar 2026 23:51:18 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxvze-00000000eGc-3mr9
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Mar 2026 23:51:11 +0000
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-679f6f0855bso4475713eaf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Mar 2026 15:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668265; x=1773273065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VAqqe+aeOoyV8Ax1MI/sypRmEwsUTxpCb02A2MgON44=;
        b=ZNu3gAfn3DGhUW8xOsKAt2+mMswFHY1DPHlDc2q0iinAxqew919yW611yYhMoSMeO3
         OEMV1Rl4/LbkGuUQib0jOQ9r01bpaCY771pqlqzEKl06SSF5JLhniUq16nLyuGzJLH+a
         pvN3dc2Ffgx/9BCsZT81tV9LWDdb/iVz5LlwmzcN75gi1xi7kKbyFOf60cEUBT2vPy9n
         qwfVpUXxVeuT2wRHQNopOQGfWs//QJxweaXUq2iuog0/9P7mldgoEKnIGKXnOAgxvB8+
         a0lubG1cbpXwrFKRsTMMhfimXE1iN+H5mooTkE/l2HfXdd6NPP78HWcO98j+WvpAxgUs
         ImAg==
X-Forwarded-Encrypted: i=1; AJvYcCVsEkMGJXbj+niC24DVIHEEUrNLIGkdXY7JO2grZX15fuBaMTMdYldhBH7nv3o7dAAG5o2OBl8f8h1QRwcBMw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKWDRlVrUbLh6gw5BIqVttZ45VK67bgAtkW/NV7v/jBQ7HfKJ2
	yw1d/KSHGdVogGn4rMACRCRuZEOPHpDmaWtkmU9Ah9K1303IpbAmC270
X-Gm-Gg: ATEYQzyjOT7qsnuw6Y1DupwdK6s+HED2urQfXHKkqLIqsQ+t7++pPht4+WqSwcaT5vt
	WjIIj5LdxFRLpdVCVxOfcC+Wbvm7dgxb7ZXC4P2DE6/5ffKxYys2lJosQA1zkoAVlcsAo6VBJWb
	5ePyGFwce3JcjtJYG/xqCv1fPc8NdkB+Yc/8+3UxuyTlYQSDv4SQ6wLMikO9pT1cEoquwmACUXo
	ahefUxyxdmy3SW0tbcRAAp9ZEtBKItsNmIjig8PgpoenwBBfmV63k7DPlGe8GygtNL3yOvZUMBR
	tTKffZgH63v0cNqTRHpzQuRg4Co8TkYGgWaT1csrFPjuRtQpr+ODZjui1O3enO2+8iIvU1YeeAL
	EKdD2Z6N+6yr//xO8P3+ZwJaS1CEp6rS3+eMWY68BKy/kajaJ48c0i4xfh3zRIAtyVHHTo/RaU7
	xdfqk6z1t5sUvmIXxh335xs+2B+tnHEOPouPxzmFIWDj45oX8=
X-Received: by 2002:a05:6820:220a:b0:67a:1d88:46d5 with SMTP id 006d021491bc7-67b17703b4dmr2382992eaf.31.1772668265499;
        Wed, 04 Mar 2026 15:51:05 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2bfee3csm14410687eaf.7.2026.03.04.15.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:51:05 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	yuchi.wang@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 7/7] wifi: mt76: mt792x: build iface combinations dynamically for optional NAN
Date: Wed,  4 Mar 2026 17:50:20 -0600
Message-ID: <20260304235020.40451-7-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304235020.40451-1-sean.wang@kernel.org>
References: <20260304235020.40451-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_155106_951056_B99F6E20 
X-CRM114-Status: GOOD (  19.19  )
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

Expose NAN capability only when supported by firmware. Split chanctx
interface combinations into base and NAN sets and dynamically append NAN
combinations when available.

Co-developed-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x.h   |   4 +
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 113 ++++++++++++++++--
 2 files changed, 109 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index d3988e5b38c0..57c9a0437c5e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -23,6 +23,7 @@
 #define MT792x_CFEND_RATE_11B		0x03	/* 11B LP, 11M */
 
 #define MT792x_FW_TAG_FEATURE	4
+#define MT792x_FW_CAP_NAN	BIT(5)
 #define MT792x_FW_CAP_CNM	BIT(7)
 
 #define MT792x_CHIP_CAP_CLC_EVT_EN BIT(0)
@@ -263,6 +264,9 @@ struct mt792x_dev {
 	struct ieee80211_chanctx_conf *new_ctx;
 
 	struct ieee80211_vif *nan_vif;
+
+	const struct ieee80211_iface_combination *iface_combinations;
+	int n_iface_combinations;
 };
 
 static inline struct mt792x_bss_conf *
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index f12cbfb35f9b..e0850998cb4e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -3,6 +3,7 @@
 
 #include <linux/module.h>
 #include <linux/firmware.h>
+#include <linux/slab.h>
 
 #include "mt792x.h"
 #include "dma.h"
@@ -60,7 +61,33 @@ static const struct ieee80211_iface_limit if_limits_chanctx_scc[] = {
 	}
 };
 
-static const struct ieee80211_iface_combination if_comb_chanctx[] = {
+static const struct ieee80211_iface_limit if_limits_nan_mcc[] = {
+	{
+		.max = 2,
+		.types = BIT(NL80211_IFTYPE_STATION),
+	},
+	{
+		.max = 1,
+		.types = BIT(NL80211_IFTYPE_NAN),
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
+		.max = 1,
+		.types = BIT(NL80211_IFTYPE_AP),
+	},
+};
+
+static const struct ieee80211_iface_combination if_comb_chanctx_base[] = {
 	{
 		.limits = if_limits_chanctx_mcc,
 		.n_limits = ARRAY_SIZE(if_limits_chanctx_mcc),
@@ -77,6 +104,60 @@ static const struct ieee80211_iface_combination if_comb_chanctx[] = {
 	}
 };
 
+static const struct ieee80211_iface_combination if_comb_chanctx_nan[] = {
+	{
+		.limits = if_limits_nan_mcc,
+		.n_limits = ARRAY_SIZE(if_limits_nan_mcc),
+		.max_interfaces = 3,
+		.num_different_channels = 2,
+		.beacon_int_infra_match = false,
+	},
+	{
+		.limits = if_limits_nan_scc,
+		.n_limits = ARRAY_SIZE(if_limits_nan_scc),
+		.max_interfaces = 4,
+		.num_different_channels = 1,
+		.beacon_int_infra_match = false,
+	},
+};
+
+static int mt792x_setup_iface_combinations(struct mt792x_dev *dev,
+					   struct wiphy *wiphy)
+{
+	const bool cnm = !!(dev->fw_features & MT792x_FW_CAP_CNM);
+	const bool nan = !!(dev->fw_features & MT792x_FW_CAP_NAN);
+	const int n_base = ARRAY_SIZE(if_comb_chanctx_base);
+	const int n_nan = ARRAY_SIZE(if_comb_chanctx_nan);
+	struct ieee80211_iface_combination *comb;
+
+	if (!cnm) {
+		dev->iface_combinations = if_comb;
+		dev->n_iface_combinations = ARRAY_SIZE(if_comb);
+		return 0;
+	}
+
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
+
+	return 0;
+}
+
 void mt792x_tx(struct ieee80211_hw *hw, struct ieee80211_tx_control *control,
 	       struct sk_buff *skb)
 {
@@ -621,6 +702,7 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
 	struct mt792x_dev *dev = phy->dev;
 	struct wiphy *wiphy = hw->wiphy;
+	int err;
 
 	hw->queues = 4;
 	if (dev->has_eht) {
@@ -641,15 +723,17 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
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
+	err = mt792x_setup_iface_combinations(dev, wiphy);
+	if (err)
+		return err;
+
+	wiphy->iface_combinations = dev->iface_combinations;
+	wiphy->n_iface_combinations = dev->n_iface_combinations;
 	wiphy->flags &= ~(WIPHY_FLAG_IBSS_RSN | WIPHY_FLAG_4ADDR_AP |
 			  WIPHY_FLAG_4ADDR_STATION);
 	wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION) |
@@ -657,6 +741,19 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 				 BIT(NL80211_IFTYPE_P2P_CLIENT) |
 				 BIT(NL80211_IFTYPE_P2P_GO) |
 				 BIT(NL80211_IFTYPE_P2P_DEVICE);
+	if ((dev->fw_features & MT792x_FW_CAP_CNM) &&
+	    (dev->fw_features & MT792x_FW_CAP_NAN)) {
+		wiphy->interface_modes |= BIT(NL80211_IFTYPE_NAN);
+		wiphy->nan_supported_bands = BIT(NL80211_BAND_2GHZ);
+		wiphy->nan_capa.flags = WIPHY_NAN_FLAGS_CONFIGURABLE_SYNC |
+					WIPHY_NAN_FLAGS_USERSPACE_DE;
+		wiphy->nan_capa.op_mode = NAN_OP_MODE_PHY_MODE_MASK;
+		wiphy->nan_capa.n_antennas = 0x22;
+		wiphy->nan_capa.max_channel_switch_time = 12;
+		wiphy->nan_capa.dev_capabilities = NAN_DEV_CAPA_EXT_KEY_ID_SUPPORTED |
+						   NAN_DEV_CAPA_NDPE_SUPPORTED;
+	}
+
 	wiphy->max_remain_on_channel_duration = 5000;
 	wiphy->max_scan_ie_len = MT76_CONNAC_SCAN_IE_LEN;
 	wiphy->max_scan_ssids = 4;
-- 
2.43.0


