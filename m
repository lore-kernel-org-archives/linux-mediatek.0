Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF2AC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 10:12:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2646A64E62
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 10:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2646A64E62
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JV6/z/hMI9/1LkyXOB71UYMYsworT9oszFwx6xJEy5A=; b=lW105Zyp79oxd21HxDbqS801x
	FgKX948cJPtnKCEIw1BAUQAwZMY6EI2CLKUNe3itiUZ49L1g52DRoP/DtcFvmCCeumtVQPRTHBY4D
	EiV8JiMKNfbb5U1PJvEDlU62H221yimv7oS6qkEgZ1FxlXTbGt89BgkUNp0CGsQyGqfCkdItNDc5W
	ZKrhlCC2CYXduBd88ChXRKtwGKl/uoXELCe7j8FZKHVBq2vOrNQOPK6GwFFf2+2ZBx0uqAnjxY6fd
	0eaSYsXXTrrgBwAS42YyZxNIvRMYdMP41ozd+dNbtXd+Q9etkbRZxr/45mFagG7PIm7XsQJcwXI7p
	yb+L2cmtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5QlW-0000gE-Rp; Fri, 29 Jan 2021 10:12:34 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5QlJ-0000ZJ-9O
 for linux-mediatek@lists.infradead.org; Fri, 29 Jan 2021 10:12:24 +0000
Received: by mail-pj1-x1036.google.com with SMTP id md11so5558430pjb.0
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Jan 2021 02:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BvJFXC1qEew4bXdBf/hdJS1H6bx/+jOSNv75fHzm4RY=;
 b=BsqqTwf37zFfo9Byyv1A7xkxKFsrM4batXJgVpYwKzf5wRehuWbDNEoPyt/uDBUasL
 vWZnpI/KiXxtYbM4wSmhI0+I2wAwo7iBBJQi6I0o/PnT8YuFWZysaZGR9xUIuXlei0fC
 ly9KMSKTr1tg6XvJX0Tfo2tuG4Uexk3RvFPn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BvJFXC1qEew4bXdBf/hdJS1H6bx/+jOSNv75fHzm4RY=;
 b=W6Nvi3+3AZnvhR7pgvdYUcwiWAlcvBIy2TeWuDxP3ktzyDmZW/hBU/47Mr9soz0AF7
 5GAfrhAAsECuF3lT71qMEeNNAqZM2g+P6HCywHVvQH7c+LY1vGGG4PCtsPwWwiZI55Nz
 DvbOK3Sy7cMk8MVgMSXYLTYc2RMabdwIoSEB86GsdOaNFWSaE7IxYTc5kKRxnUQRDzfl
 Ykp48ZcGnQLBn3loKTKtWPHgp7yk/1mTTfkO1GJozULCrnEGKTR7DzinK8NFAs2VZNOG
 2ZO8RreOGrpDgUcuhSAzjfAQIfDWI4kVEMnD0YRuyyyF6cJr0biL5CMU4WQLbS1YpQg9
 DBgg==
X-Gm-Message-State: AOAM5321bJ0P+U1LjGi+dUYp9Ozk2LDEuEbcYUbFtXIuIQPjNpKy4Jal
 HSWbN7psFqa2lsm6clnMpt4MEg==
X-Google-Smtp-Source: ABdhPJyq/VlZLsZovmxGuBsWCLl4dimS1/wxL8QTv4yylHjZk4G9UEJw0n0YH6MxYJ19sI/nBVQI9A==
X-Received: by 2002:a17:90a:808a:: with SMTP id
 c10mr3887664pjn.229.1611915139162; 
 Fri, 29 Jan 2021 02:12:19 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id a2sm7532533pjm.51.2021.01.29.02.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 02:12:18 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 2/3] soc: mediatek: pm-domains: Add domain regulator supply
Date: Fri, 29 Jan 2021 18:12:07 +0800
Message-Id: <20210129101208.2625249-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129101208.2625249-1-hsinyi@chromium.org>
References: <20210129101208.2625249-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_051221_474880_FD5C760D 
X-CRM114-Status: GOOD (  18.47  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some power domains (eg. mfg) needs to turn on power supply before power
on.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 drivers/soc/mediatek/mt8183-pm-domains.h |  1 +
 drivers/soc/mediatek/mtk-pm-domains.c    | 42 +++++++++++++++++++++++-
 drivers/soc/mediatek/mtk-pm-domains.h    |  1 +
 3 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mt8183-pm-domains.h b/drivers/soc/mediatek/mt8183-pm-domains.h
index 8d996c5d2682d..aa5230e6c12f8 100644
--- a/drivers/soc/mediatek/mt8183-pm-domains.h
+++ b/drivers/soc/mediatek/mt8183-pm-domains.h
@@ -38,6 +38,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.ctl_offs = 0x0338,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_DOMAIN_SUPPLY,
 	},
 	[MT8183_POWER_DOMAIN_MFG_CORE0] = {
 		.sta_mask = BIT(7),
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index fb70cb3b07b36..1e0a65fbce1db 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/soc/mediatek/infracfg.h>
 
 #include "mt8173-pm-domains.h"
@@ -40,6 +41,7 @@ struct scpsys_domain {
 	struct clk_bulk_data *subsys_clks;
 	struct regmap *infracfg;
 	struct regmap *smi;
+	struct regulator *supply;
 };
 
 struct scpsys {
@@ -187,6 +189,16 @@ static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
 	return _scpsys_bus_protect_disable(pd->data->bp_infracfg, pd->infracfg);
 }
 
+static int scpsys_regulator_enable(struct regulator *supply)
+{
+	return supply ? regulator_enable(supply) : 0;
+}
+
+static int scpsys_regulator_disable(struct regulator *supply)
+{
+	return supply ? regulator_disable(supply) : 0;
+}
+
 static int scpsys_power_on(struct generic_pm_domain *genpd)
 {
 	struct scpsys_domain *pd = container_of(genpd, struct scpsys_domain, genpd);
@@ -194,10 +206,14 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	bool tmp;
 	int ret;
 
-	ret = clk_bulk_enable(pd->num_clks, pd->clks);
+	ret = scpsys_regulator_enable(pd->supply);
 	if (ret)
 		return ret;
 
+	ret = clk_bulk_enable(pd->num_clks, pd->clks);
+	if (ret)
+		goto err_reg;
+
 	/* subsys power on */
 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
 	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT);
@@ -232,6 +248,8 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
 err_pwr_ack:
 	clk_bulk_disable(pd->num_clks, pd->clks);
+err_reg:
+	scpsys_regulator_disable(pd->supply);
 	return ret;
 }
 
@@ -267,6 +285,8 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 
 	clk_bulk_disable(pd->num_clks, pd->clks);
 
+	scpsys_regulator_disable(pd->supply);
+
 	return 0;
 }
 
@@ -275,6 +295,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 {
 	const struct scpsys_domain_data *domain_data;
 	struct scpsys_domain *pd;
+	struct device_node *root_node = scpsys->dev->of_node;
 	struct property *prop;
 	const char *clk_name;
 	int i, ret, num_clks;
@@ -307,6 +328,25 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 	pd->data = domain_data;
 	pd->scpsys = scpsys;
 
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_DOMAIN_SUPPLY)) {
+		/*
+		 * Find regulator in current power domain node.
+		 * devm_regulator_get() finds regulator in a node and its child
+		 * node, so set of_node to current power domain node then change
+		 * back to original node after regulator is found for current
+		 * power domain node.
+		 */
+		scpsys->dev->of_node = node;
+		pd->supply = devm_regulator_get(scpsys->dev, "domain");
+		scpsys->dev->of_node = root_node;
+		if (IS_ERR(pd->supply)) {
+			dev_err_probe(scpsys->dev, PTR_ERR(pd->supply),
+				      "%pOF: failed to get power supply.\n",
+				      node);
+			return ERR_CAST(pd->supply);
+		}
+	}
+
 	pd->infracfg = syscon_regmap_lookup_by_phandle_optional(node, "mediatek,infracfg");
 	if (IS_ERR(pd->infracfg))
 		return ERR_CAST(pd->infracfg);
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index a2f4d8f97e058..b2770b5266dba 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -7,6 +7,7 @@
 #define MTK_SCPD_FWAIT_SRAM		BIT(1)
 #define MTK_SCPD_SRAM_ISO		BIT(2)
 #define MTK_SCPD_KEEP_DEFAULT_OFF	BIT(3)
+#define MTK_SCPD_DOMAIN_SUPPLY		BIT(4)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
 
 #define SPM_VDE_PWR_CON			0x0210
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
