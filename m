Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940CEC61D9B
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 16:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kMUEx5c28CerSi7jjNgLDj80xCT27KV6mWEifCFExs=; b=bjXmlsKRQZDhUMl3RAnj2bihnQ
	cV8mf2X4yRwBNI4/gjdNikZRutKdTM39DrbwYWosAWd/dUc9+3ATg8AxR3Z0sLiAdm1vMBP95rmL4
	y+gaOYIPGcCW9rpl7A/JDzDJpDHj5TBPXJ3c+sFx6Gkv8P3jIXc7hq/qp5I0DKc4t90aOZmlxceMl
	vyVI5/bDz5IkhZ0Zb0l3CyhxBNlmD8Vx+7VpGlKv7FVq1PzjsRjqYwAuKYRUT9CU4oKhABYZEEKes
	uIoBge2Af5t3BxFGkhvIfFuNRy6MsdHoBoDq4A/b/MIXr8hXLahLNCwVncl/1gfwaCsKoHXCnwRcZ
	iOjnWxUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qHt-002Wi6-1k;
	Wed, 22 Nov 2023 16:41:17 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qHp-002WYo-31;
	Wed, 22 Nov 2023 16:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700671272; x=1732207272;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S9PopjMUnYzwjGKURdUp+ZGQEbM4U+H2UAWy5ZIaHFk=;
  b=l29nNnSVUTbb9jLj7YTm7oawqhn1INw1z9lNsw9lLJOtqM+ldOsb3y/1
   +UAeEb7EWEDBsRe11b0Vdy7tfOgiOvUpRXCknIIHSy+CX95dmoraUtBLR
   RzRIjMAbAMncTDiM3dGazlzSJ8IrD/xNk2xiC9k2bB/8zCe4K+dYeE8kP
   qcIATo3DkFR6lEZD2RTtw6V5VxjeHGxRW/zQI+Sodo9OUXIpUP9YKzHT5
   CdMxjfskmBVUyhhUmL5jjYQUQDZc1nXkPw9azW3mE98ghGMCEZgYJL5OD
   /RkWBL8sO6rHazjVScnl5LwXdF67UJv9VqU9VygPkCDdpxeA2Okk4lAkW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="456414322"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="456414322"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 08:41:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="884681647"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="884681647"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2023 08:41:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 927D66E3; Wed, 22 Nov 2023 18:40:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	linux-mips@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v1 11/17] pinctrl: imx: Convert to use grp member
Date: Wed, 22 Nov 2023 18:35:43 +0200
Message-ID: <20231122164040.2262742-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
References: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_084114_053049_19D54C18 
X-CRM114-Status: GOOD (  17.52  )
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

Convert drivers to use grp member embedded in struct group_desc.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 44 ++++++++++++-------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9bc16943014f..680faa00b623 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -42,7 +42,7 @@ static inline const struct group_desc *imx_pinctrl_find_group_by_name(
 
 	for (i = 0; i < pctldev->num_groups; i++) {
 		grp = pinctrl_generic_get_group(pctldev, i);
-		if (grp && !strcmp(grp->name, name))
+		if (grp && !strcmp(grp->grp.name, name))
 			break;
 	}
 
@@ -79,9 +79,9 @@ static int imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 	}
 
 	if (info->flags & IMX_USE_SCU) {
-		map_num += grp->num_pins;
+		map_num += grp->grp.npins;
 	} else {
-		for (i = 0; i < grp->num_pins; i++) {
+		for (i = 0; i < grp->grp.npins; i++) {
 			pin = &((struct imx_pin *)(grp->data))[i];
 			if (!(pin->conf.mmio.config & IMX_NO_PAD_CTL))
 				map_num++;
@@ -109,7 +109,7 @@ static int imx_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	/* create config map */
 	new_map++;
-	for (i = j = 0; i < grp->num_pins; i++) {
+	for (i = j = 0; i < grp->grp.npins; i++) {
 		pin = &((struct imx_pin *)(grp->data))[i];
 
 		/*
@@ -263,10 +263,10 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	if (!func)
 		return -EINVAL;
 
-	npins = grp->num_pins;
+	npins = grp->grp.npins;
 
 	dev_dbg(ipctl->dev, "enable function %s group %s\n",
-		func->name, grp->name);
+		func->name, grp->grp.name);
 
 	for (i = 0; i < npins; i++) {
 		/*
@@ -423,7 +423,7 @@ static void imx_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 	if (!grp)
 		return;
 
-	for (i = 0; i < grp->num_pins; i++) {
+	for (i = 0; i < grp->grp.npins; i++) {
 		struct imx_pin *pin = &((struct imx_pin *)(grp->data))[i];
 
 		name = pin_get_name(pctldev, pin->pin);
@@ -510,6 +510,7 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 				    u32 index)
 {
 	const struct imx_pinctrl_soc_info *info = ipctl->info;
+	struct pingroup *pgrp = &grp->grp;
 	struct imx_pin *pin;
 	int size, pin_size;
 	const __be32 *list;
@@ -524,9 +525,6 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 	else
 		pin_size = FSL_PIN_SIZE;
 
-	/* Initialise group */
-	grp->name = np->name;
-
 	/*
 	 * the binding format is fsl,pins = <PIN_FUNC_ID CONFIG ...>,
 	 * do sanity check and calculate pins number
@@ -553,23 +551,24 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 		return -EINVAL;
 	}
 
-	grp->num_pins = size / pin_size;
-	grp->data = devm_kcalloc(ipctl->dev,
-				 grp->num_pins, sizeof(struct imx_pin),
-				 GFP_KERNEL);
-	grp->pins = devm_kcalloc(ipctl->dev,
-				 grp->num_pins, sizeof(unsigned int),
-				 GFP_KERNEL);
-	if (!grp->pins || !grp->data)
+	/* Initialise group */
+	pgrp->npins = size / pin_size;
+	pgrp->pins = devm_kcalloc(ipctl->dev, pgrp->npins, sizeof(*pgrp->pins), GFP_KERNEL);
+	if (!pgrp->pins)
+		return -ENOMEM;
+	pgrp->name = np->name;
+
+	grp->data = devm_kcalloc(ipctl->dev, pgrp->npins, sizeof(*pin), GFP_KERNEL);
+	if (!grp->data)
 		return -ENOMEM;
 
-	for (i = 0; i < grp->num_pins; i++) {
+	for (i = 0; i < pgrp->npins; i++) {
 		pin = &((struct imx_pin *)(grp->data))[i];
 		if (info->flags & IMX_USE_SCU)
-			info->imx_pinctrl_parse_pin(ipctl, &grp->pins[i],
+			info->imx_pinctrl_parse_pin(ipctl, &pgrp->pins[i],
 						  pin, &list);
 		else
-			imx_pinctrl_parse_pin_mmio(ipctl, &grp->pins[i],
+			imx_pinctrl_parse_pin_mmio(ipctl, &pgrp->pins[i],
 						   pin, &list, np);
 	}
 
@@ -612,8 +611,7 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 
 	i = 0;
 	for_each_child_of_node(np, child) {
-		grp = devm_kzalloc(ipctl->dev, sizeof(struct group_desc),
-				   GFP_KERNEL);
+		grp = devm_kzalloc(ipctl->dev, sizeof(*grp), GFP_KERNEL);
 		if (!grp) {
 			of_node_put(child);
 			return -ENOMEM;
-- 
2.43.0.rc1.1.gbec44491f096


