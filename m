Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43C3C32774
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1iZXrIX4OxA2n5vEsq07pYhl7rKDCQYXsxiPHsCM2g=; b=UBc5AT2Wes5yUaJcsH4dK90uim
	6M2lymL1YCJwSiT8SLspPQbcItT83YeznXo0hpicP2U/Q/PhqTtDmNB0pvuISfmkTulwOd1CRHDSG
	oT+Yxxv4CNourn/qAPS/EAC6oIC1ajDirrKi33Unk/AWxSH4Zts8gIuEJtxxVs0KtZfiNpWI53FHe
	ndovYrZuD7m9S8OlC/D5T3RpdZYiOmy9nG0LY3LNTzMVUrt8Ayr0Tq9SbCM88iSqWPEHDlbg9FhvX
	SkvQbpfC/8851AqGiiicRYu4qWybSCnyLz0MpV2XLZeb7SvJxyxcTeFdcQB84MGXztgNpNig6RXUj
	GjCSLAOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ8gE-00Bh0j-6C; Mon, 22 Aug 2022 14:45:30 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ8g8-00Bgkq-BW
	for linux-mediatek@lists.infradead.org; Mon, 22 Aug 2022 14:45:27 +0000
Received: by mail-wr1-x431.google.com with SMTP id b5so9231721wrr.5
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Aug 2022 07:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=a1iZXrIX4OxA2n5vEsq07pYhl7rKDCQYXsxiPHsCM2g=;
        b=0RTdnvWOtoD2zIozW9cq9CoU0b0VpvHqXpLv+o61LFYHt0pXq97w2/1Lphq6aLyCU5
         9q8QmkH/ZRKnPZXQ8uB5KPHu0izM0A/K3/PRlLXUUdaUfMoKSxbBIVN5OgIrH+WSFscc
         aklmxjsAkMobKiNtrOXwLH5nalhThb49GTSuh+VYdYkohIVk1ddkgHPVHmAXvhFptUhU
         5hrgoC5M23ndnQESF2AnE8YpwQLX7woD1Cg0kEn8GoNxVHEeXdWPGYIxq0zQ7JnlsMHG
         nuL+FlXCiEC+ohia/ZOFfVK+I4R6rB3pUHD/0o68L3m1QFRzuhFtNOT4xbKrWaI3mDco
         gSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=a1iZXrIX4OxA2n5vEsq07pYhl7rKDCQYXsxiPHsCM2g=;
        b=FNGRkSjGTdkAIA0Mgkw+fjcKr9JXkBYjaaftog4DWahDBzWxZW6Zq8Wh5SgqWeTdn6
         8HVYzkxlIn573IBkcuRfkm53AoRGlona1x4+h05TuHJJWBKSNrYHK+JpJ+o6NhA7RV0M
         KDyEu7h0VhbH3VY+VqA6dU6l3uqCk4ePecEFYNug5BHkg6+Sf71a633xGphJJj22YJ4M
         VoiZ9zwLGlKXEZpXPlByVl7oUsI+xRrAj8zAW5O7FXp7JSE7UBLa4LcV3lI6iutkvIUE
         VAftspyOCl8/jCtdTKkTBVwSooZjhQJyTiBLawUQ+nDvny5egj2l4tXCzTo8QCWPucHf
         f8tg==
X-Gm-Message-State: ACgBeo3oUX6YoKuQHIeqMebYcmkPX5GVtcDhOLvLe0AsljitCQCU2j6R
	E/+4fxteUKVp3WwOJRgWQQQAXA==
X-Google-Smtp-Source: AA6agR4qIR/Ei3WdW/ukb1I60l3z+3Vd1HGBT8z/XvP7Y6+oaR9FtidHTw7VxajFqH/a/F5o3FLtzg==
X-Received: by 2002:a5d:61c7:0:b0:225:307b:b557 with SMTP id q7-20020a5d61c7000000b00225307bb557mr10225664wrv.402.1661179523150;
        Mon, 22 Aug 2022 07:45:23 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a245:8020:2658:1f7c:362:3e99])
        by smtp.gmail.com with ESMTPSA id z24-20020a1cf418000000b003a5dadcf1a8sm14670935wma.19.2022.08.22.07.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 07:45:22 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Alexandre Bailon <abailon@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v3 2/4] soc: mediatek: Add support of WAY_EN operations
Date: Mon, 22 Aug 2022 16:43:01 +0200
Message-Id: <20220822144303.3438467-3-msp@baylibre.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220822144303.3438467-1-msp@baylibre.com>
References: <20220822144303.3438467-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_074524_521791_2C658FBF 
X-CRM114-Status: GOOD (  19.67  )
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

From: Alexandre Bailon <abailon@baylibre.com>

This updates the power domain to support WAY_EN operations. These
operations enable a path between different units of the chip and are
labeled as 'way_en' in the register descriptions.

This operation is required by the mt8365 for the MM power domain.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---

Notes:
    Changes in v3:
    - Separated the way_en functions for clarity
    - Added some checks for infracfg_nao
    
    Changes in v2:
    - some minor style fixes.
    - Renamed 'wayen' to 'way_en' to clarify the meaning
    - Updated commit message

 drivers/soc/mediatek/mtk-pm-domains.c | 162 +++++++++++++++++++++-----
 drivers/soc/mediatek/mtk-pm-domains.h |  28 +++--
 2 files changed, 149 insertions(+), 41 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 9734f1091c69..c2cbe0de6aa1 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -43,6 +43,7 @@ struct scpsys_domain {
 	struct clk_bulk_data *clks;
 	int num_subsys_clks;
 	struct clk_bulk_data *subsys_clks;
+	struct regmap *infracfg_nao;
 	struct regmap *infracfg;
 	struct regmap *smi;
 	struct regulator *supply;
@@ -117,26 +118,61 @@ static int scpsys_sram_disable(struct scpsys_domain *pd)
 					MTK_POLL_TIMEOUT);
 }
 
-static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd, struct regmap *regmap)
+static int __scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd,
+				       struct regmap *regmap)
+{
+	u32 val;
+	u32 mask = bpd->bus_prot_mask;
+	u32 sta_mask = bpd->bus_prot_sta_mask;
+
+	if (bpd->bus_prot_reg_update)
+		regmap_set_bits(regmap, bpd->bus_prot_set, mask);
+	else
+		regmap_write(regmap, bpd->bus_prot_set, mask);
+
+	return regmap_read_poll_timeout(regmap, bpd->bus_prot_sta, val,
+					(val & sta_mask) == sta_mask,
+					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+}
+
+static int scpsys_bus_way_disable(const struct scpsys_bus_prot_data *bpd,
+				  struct regmap *regmap,
+				  struct regmap *ack_regmap)
+{
+	u32 val;
+	u32 mask = bpd->bus_prot_mask;
+	u32 sta_mask = bpd->bus_prot_sta_mask;
+
+	if (bpd->bus_prot_reg_update)
+		regmap_clear_bits(regmap, bpd->bus_prot_set, mask);
+	else
+		regmap_write(regmap, bpd->bus_prot_set, mask);
+
+	if (bpd->ignore_clr_ack)
+		return 0;
+
+	return regmap_read_poll_timeout(ack_regmap, bpd->bus_prot_sta, val,
+					(val & sta_mask) == sta_mask,
+					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+}
+
+static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd,
+				      struct regmap *regmap, struct regmap *infracfg_nao)
 {
 	int i, ret;
 
 	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
-		u32 val, mask = bpd[i].bus_prot_mask;
-
-		if (!mask)
+		if (!bpd[i].bus_prot_mask)
 			break;
 
-		if (bpd[i].bus_prot_reg_update)
-			regmap_set_bits(regmap, bpd[i].bus_prot_set, mask);
+		if (bpd[i].way_en)
+			ret = scpsys_bus_way_disable(&bpd[i], regmap, infracfg_nao);
 		else
-			regmap_write(regmap, bpd[i].bus_prot_set, mask);
-
-		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
-					       val, (val & mask) == mask,
-					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
-		if (ret)
+			ret = __scpsys_bus_protect_enable(&bpd[i], regmap);
+		if (ret) {
+			pr_err("%s %d %d\n", __PRETTY_FUNCTION__, __LINE__, ret);
 			return ret;
+		}
 	}
 
 	return 0;
@@ -146,37 +182,71 @@ static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
 {
 	int ret;
 
-	ret = _scpsys_bus_protect_enable(pd->data->bp_infracfg, pd->infracfg);
+	ret = _scpsys_bus_protect_enable(pd->data->bp_infracfg,
+					 pd->infracfg, pd->infracfg_nao);
 	if (ret)
 		return ret;
 
-	return _scpsys_bus_protect_enable(pd->data->bp_smi, pd->smi);
+	return _scpsys_bus_protect_enable(pd->data->bp_smi, pd->smi, NULL);
+}
+
+static int __scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
+					struct regmap *regmap)
+{
+	u32 val;
+	u32 mask = bpd->bus_prot_mask;
+	u32 sta_mask = bpd->bus_prot_sta_mask;
+
+	if (bpd->bus_prot_reg_update)
+		regmap_clear_bits(regmap, bpd->bus_prot_clr, mask);
+	else
+		regmap_write(regmap, bpd->bus_prot_clr, mask);
+
+	if (bpd->ignore_clr_ack)
+		return 0;
+
+	return regmap_read_poll_timeout(regmap, bpd->bus_prot_sta, val,
+					!(val & sta_mask), MTK_POLL_DELAY_US,
+					MTK_POLL_TIMEOUT);
+}
+
+static int scpsys_bus_way_enable(const struct scpsys_bus_prot_data *bpd,
+				 struct regmap *regmap,
+				 struct regmap *ack_regmap)
+{
+	u32 val;
+	u32 mask = bpd->bus_prot_mask;
+	u32 sta_mask = bpd->bus_prot_sta_mask;
+
+	if (bpd->bus_prot_reg_update)
+		regmap_set_bits(regmap, bpd->bus_prot_clr, mask);
+	else
+		regmap_write(regmap, bpd->bus_prot_clr, mask);
+
+	return regmap_read_poll_timeout(ack_regmap, bpd->bus_prot_sta, val,
+					(val & sta_mask) == sta_mask,
+					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 }
 
 static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
-				       struct regmap *regmap)
+				       struct regmap *regmap,
+				       struct regmap *infracfg_nao)
 {
 	int i, ret;
 
 	for (i = SPM_MAX_BUS_PROT_DATA - 1; i >= 0; i--) {
-		u32 val, mask = bpd[i].bus_prot_mask;
-
-		if (!mask)
+		if (!bpd[i].bus_prot_mask)
 			continue;
 
-		if (bpd[i].bus_prot_reg_update)
-			regmap_clear_bits(regmap, bpd[i].bus_prot_clr, mask);
+		if (bpd[i].way_en)
+			ret = scpsys_bus_way_enable(&bpd[i], regmap,
+						    infracfg_nao);
 		else
-			regmap_write(regmap, bpd[i].bus_prot_clr, mask);
-
-		if (bpd[i].ignore_clr_ack)
-			continue;
-
-		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
-					       val, !(val & mask),
-					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
-		if (ret)
+			ret = __scpsys_bus_protect_disable(&bpd[i], regmap);
+		if (ret) {
+			pr_err("%s %d %d\n", __PRETTY_FUNCTION__, __LINE__, ret);
 			return ret;
+		}
 	}
 
 	return 0;
@@ -186,11 +256,12 @@ static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
 {
 	int ret;
 
-	ret = _scpsys_bus_protect_disable(pd->data->bp_smi, pd->smi);
+	ret = _scpsys_bus_protect_disable(pd->data->bp_smi, pd->smi, NULL);
 	if (ret)
 		return ret;
 
-	return _scpsys_bus_protect_disable(pd->data->bp_infracfg, pd->infracfg);
+	return _scpsys_bus_protect_disable(pd->data->bp_infracfg,
+			pd->infracfg, pd->infracfg_nao);
 }
 
 static int scpsys_regulator_enable(struct regulator *supply)
@@ -294,6 +365,21 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	return 0;
 }
 
+static bool scpsys_bp_infracfg_has_way_en(const struct scpsys_bus_prot_data *bpd)
+{
+	int i;
+
+	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
+		if (!bpd[i].bus_prot_mask)
+			break;
+
+		if (bpd[i].way_en)
+			return true;
+	}
+
+	return false;
+}
+
 static struct
 generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_node *node)
 {
@@ -364,6 +450,20 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 			return ERR_CAST(pd->smi);
 	}
 
+	if (scpsys_bp_infracfg_has_way_en(pd->data->bp_smi)) {
+		dev_err(scpsys->dev, "bp_smi does not support WAY_EN\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	pd->infracfg_nao = syscon_regmap_lookup_by_phandle_optional(
+		node, "mediatek,infracfg_nao");
+	if (IS_ERR(pd->infracfg_nao)) {
+		if (scpsys_bp_infracfg_has_way_en(pd->data->bp_infracfg))
+			return ERR_CAST(pd->infracfg_nao);
+
+		pd->infracfg_nao = NULL;
+	}
+
 	num_clks = of_clk_get_parent_count(node);
 	if (num_clks > 0) {
 		/* Calculate number of subsys_clks */
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index 7d3c0c36316c..974c68a1d89c 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -41,23 +41,29 @@
 
 #define SPM_MAX_BUS_PROT_DATA		6
 
-#define _BUS_PROT(_mask, _set, _clr, _sta, _update, _ignore) {	\
-		.bus_prot_mask = (_mask),			\
-		.bus_prot_set = _set,				\
-		.bus_prot_clr = _clr,				\
-		.bus_prot_sta = _sta,				\
-		.bus_prot_reg_update = _update,			\
-		.ignore_clr_ack = _ignore,			\
+#define _BUS_PROT(_mask, _sta_mask, _set, _clr, _sta, _update, _ignore, _way_en) {	\
+		.bus_prot_mask = (_mask),				\
+		.bus_prot_set = _set,					\
+		.bus_prot_clr = _clr,					\
+		.bus_prot_sta = _sta,					\
+		.bus_prot_sta_mask = _sta_mask,				\
+		.bus_prot_reg_update = _update,				\
+		.ignore_clr_ack = _ignore,				\
+		.way_en = _way_en,					\
 	}
 
 #define BUS_PROT_WR(_mask, _set, _clr, _sta)			\
-		_BUS_PROT(_mask, _set, _clr, _sta, false, false)
+		_BUS_PROT(_mask, _mask, _set, _clr, _sta, false, false, false)
 
 #define BUS_PROT_WR_IGN(_mask, _set, _clr, _sta)		\
-		_BUS_PROT(_mask, _set, _clr, _sta, false, true)
+		_BUS_PROT(_mask, _mask, _set, _clr, _sta, false, true, false)
 
 #define BUS_PROT_UPDATE(_mask, _set, _clr, _sta)		\
-		_BUS_PROT(_mask, _set, _clr, _sta, true, false)
+		_BUS_PROT(_mask, _mask, _set, _clr, _sta, true, false, false)
+
+#define BUS_PROT_WAY_EN(_en_mask, _sta_mask, _set, _sta)	\
+		_BUS_PROT(_en_mask, _sta_mask, _set, _set, _sta, true, false, \
+			  true)
 
 #define BUS_PROT_UPDATE_TOPAXI(_mask)				\
 		BUS_PROT_UPDATE(_mask,				\
@@ -70,8 +76,10 @@ struct scpsys_bus_prot_data {
 	u32 bus_prot_set;
 	u32 bus_prot_clr;
 	u32 bus_prot_sta;
+	u32 bus_prot_sta_mask;
 	bool bus_prot_reg_update;
 	bool ignore_clr_ack;
+	bool way_en;
 };
 
 /**
-- 
2.37.2


