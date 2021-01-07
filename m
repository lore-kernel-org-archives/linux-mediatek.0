Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C23DC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 10:50:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF05C2312F
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 10:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF05C2312F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UuuUc8S4Ba2+0njBNXKnRnUw4hz1B99a/nyWMVyfjwE=; b=SjLUZEopuBlEJcqPTbyIKvht1
	beQyYvX7/GT91VVE8MIItjn8e6zvCA2uu6ZyqSI0EEDyy/1U+6x1bBk1zxCYNZiC/UPbgBR8jKkDL
	g7kF4CyrIw9Bu/gZVKcQ6fz1kcJmv6fDC/rON6jj2IE5JVW9CcgWk1JMUILsXT3yd2IvdpLxoR4qe
	Io/Eo4u7JglOpa4NUe4+6S99HH3ot9d6Uk6/KuQ8p5mDcCq21U3BKfYP8YC/12+uL+xMYM6S9VGHD
	aBzFmYLvzmOS8kRhJdPJ71vYdBZwx08XZF+lrFnXSYrBnxkPhmXLeb48bvtGIfu1qI0bDYZSpdxsi
	84aCTQSdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxSrY-0005fQ-ML; Thu, 07 Jan 2021 10:49:52 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxSrI-0005Y4-QI
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 10:49:39 +0000
Received: by mail-pl1-x62d.google.com with SMTP id s15so3274417plr.9
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Jan 2021 02:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WHbg07GzTampsEN+7TlNCFgYTM4CkUTYWdUop2Smzxo=;
 b=BZnnxMI3ogRKPiN+lqopl3amKlqSam6Xb3EomzxrR88q/T1NYFQqbZpzZ+NVsnnNXq
 FRwVyPWb6E9CGl+fdp1GOWjhF73p5vt64s5858ztkVU9B3bf5xaymGCQox9w+w0xNNaw
 mR2LZwBmrNyaAK0c9qx31VSsoliCO4ZCFu0eA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WHbg07GzTampsEN+7TlNCFgYTM4CkUTYWdUop2Smzxo=;
 b=pX20jPkyk7WM12a+AE1Yu9xbf9eT7rHnf/E9YhstpR1M8uXAgFv94PNZ7VBFD3aDtd
 /avL7SMXSONPy+kV1sHs5ZnBmeTzthWKKDtuaTTo3y8K6makz0azBM9acxLX3JhtbsP5
 QIYwMdyq/4mAa83R+TvuxPOuByP2nNsr50x9jRSEPggSN+XwxECAIoZ7+9KM2qOWhyZq
 TfB0v3eztjHwhiT0eN7/UommyNWHYS8KAgxp53lWg0uVm7yA5h3GpYInpUKfilzJdPYz
 uYrg5Wu4tc+O0D8bz90kXcFXlM/esVemgrSuG7n2P72H3BQsSpi5R1+x4Ec7Ntbf2gmR
 w9NQ==
X-Gm-Message-State: AOAM531w86pLtbbETjrUQ+c3Y+Vt60Oj13SO6y+Fnun73OQ1USve8PBW
 RfxzCclGVP0wjvdmIXrtbXuTtg==
X-Google-Smtp-Source: ABdhPJxlgKhXruWAVkyY2B+N24BePzFnlvcti5g7xO9EIngx76rTpHoVz5PmVeJ6zsCrXxKw2APoQQ==
X-Received: by 2002:a17:90a:348f:: with SMTP id
 p15mr8752738pjb.125.1610016574329; 
 Thu, 07 Jan 2021 02:49:34 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id n10sm5381974pfu.176.2021.01.07.02.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 02:49:33 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] soc: mediatek: pm-domains: Add domain regulator supply
Date: Thu,  7 Jan 2021 18:49:15 +0800
Message-Id: <20210107104915.2888408-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210107104915.2888408-1-hsinyi@chromium.org>
References: <20210107104915.2888408-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_054936_930220_77088E27 
X-CRM114-Status: GOOD (  18.94  )
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
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some power domains (eg. mfg) needs to turn on power supply before power
on.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/soc/mediatek/mt8183-pm-domains.h |  1 +
 drivers/soc/mediatek/mtk-pm-domains.c    | 36 +++++++++++++++++++++++-
 drivers/soc/mediatek/mtk-pm-domains.h    |  1 +
 3 files changed, 37 insertions(+), 1 deletion(-)

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
index fb70cb3b07b36..ae255aa7b1a97 100644
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
+	struct device_node *np = scpsys->dev->of_node;
 	struct property *prop;
 	const char *clk_name;
 	int i, ret, num_clks;
@@ -307,6 +328,19 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 	pd->data = domain_data;
 	pd->scpsys = scpsys;
 
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_DOMAIN_SUPPLY)) {
+		/* Find regulator in current power domain node */
+		scpsys->dev->of_node = node;
+		pd->supply = devm_regulator_get(scpsys->dev, "domain");
+		scpsys->dev->of_node = np;
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
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
