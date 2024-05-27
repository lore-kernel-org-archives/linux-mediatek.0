Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1483EC25B79
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 21:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqohlXEYvP8oNk6BDOFb67Q9sAYi8Fd9o4y6bKmpGHM=; b=juWJwiIaKnSi7fdlUbtpYPeWIO
	KVY5G1e4SVcIIzyOPPI7m3JUwSNpt0jnbHBxun50ZKjiQ1IyH1+cmHETx0jJCcwjjMwNgU+QReOJT
	jd/sMxyy1R4ekgZDsDvceFs0BnYoe50bS02a/b8xYMZbcgRynR2AoUgFhFiQIM2JRW4XsNJi1PBqL
	+VWpkUn11Hd9Udu5dI/RLAilu4EXgeYM2QH7/BgZw8wBtEqikRk3URl4mwijZEcwOWrOBpuVWsFzd
	5PBmugjj73erFl3dhkyMLcSpXAb+MknYXcmTKckAwi874PPQeQQgwaM5/x8cZxxQ8w8bN+oOYa/He
	9U6mcJxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBhsp-0000000GNkp-2qy7;
	Mon, 27 May 2024 21:27:55 +0000
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBhsm-0000000GNhQ-01S5
	for linux-mediatek@lists.infradead.org;
	Mon, 27 May 2024 21:27:53 +0000
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id f7303f91-1c6f-11ef-80bc-005056bdfda7;
	Tue, 28 May 2024 00:27:49 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 01/11] pinctrl: berlin: Make use of struct pinfunction
Date: Tue, 28 May 2024 00:24:36 +0300
Message-ID: <20240527212742.1432960-2-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527212742.1432960-1-andy.shevchenko@gmail.com>
References: <20240527212742.1432960-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_142752_388102_9EE494F2 
X-CRM114-Status: GOOD (  15.41  )
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

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Since pin control provides a generic data type for the pin function,
use it in the driver.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/berlin/berlin.c | 33 +++++++++++++--------------------
 drivers/pinctrl/berlin/berlin.h |  6 ------
 2 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index 9550cc8095c2..3c0873a00fd3 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -27,7 +27,7 @@ struct berlin_pinctrl {
 	struct regmap *regmap;
 	struct device *dev;
 	const struct berlin_pinctrl_desc *desc;
-	struct berlin_pinctrl_function *functions;
+	struct pinfunction *functions;
 	unsigned nfunctions;
 	struct pinctrl_dev *pctrl_dev;
 };
@@ -120,12 +120,12 @@ static const char *berlin_pinmux_get_function_name(struct pinctrl_dev *pctrl_dev
 static int berlin_pinmux_get_function_groups(struct pinctrl_dev *pctrl_dev,
 					     unsigned function,
 					     const char * const **groups,
-					     unsigned * const num_groups)
+					     unsigned * const ngroups)
 {
 	struct berlin_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
 
 	*groups = pctrl->functions[function].groups;
-	*num_groups = pctrl->functions[function].ngroups;
+	*ngroups = pctrl->functions[function].ngroups;
 
 	return 0;
 }
@@ -153,7 +153,7 @@ static int berlin_pinmux_set(struct pinctrl_dev *pctrl_dev,
 {
 	struct berlin_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
 	const struct berlin_desc_group *group_desc = pctrl->desc->groups + group;
-	struct berlin_pinctrl_function *func = pctrl->functions + function;
+	struct pinfunction *func = pctrl->functions + function;
 	struct berlin_desc_function *function_desc =
 		berlin_pinctrl_find_function_by_name(pctrl, group_desc,
 						     func->name);
@@ -180,7 +180,7 @@ static const struct pinmux_ops berlin_pinmux_ops = {
 static int berlin_pinctrl_add_function(struct berlin_pinctrl *pctrl,
 				       const char *name)
 {
-	struct berlin_pinctrl_function *function = pctrl->functions;
+	struct pinfunction *function = pctrl->functions;
 
 	while (function->name) {
 		if (!strcmp(function->name, name)) {
@@ -214,8 +214,7 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 	}
 
 	/* we will reallocate later */
-	pctrl->functions = kcalloc(max_functions,
-				   sizeof(*pctrl->functions), GFP_KERNEL);
+	pctrl->functions = kcalloc(max_functions, sizeof(*pctrl->functions), GFP_KERNEL);
 	if (!pctrl->functions)
 		return -ENOMEM;
 
@@ -242,8 +241,7 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 		desc_function = desc_group->functions;
 
 		while (desc_function->name) {
-			struct berlin_pinctrl_function
-				*function = pctrl->functions;
+			struct pinfunction *function = pctrl->functions;
 			const char **groups;
 			bool found = false;
 
@@ -260,20 +258,15 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 				return -EINVAL;
 			}
 
-			if (!function->groups) {
-				function->groups =
-					devm_kcalloc(&pdev->dev,
+			groups = devm_krealloc_array(&pdev->dev, function->groups,
 						     function->ngroups,
-						     sizeof(char *),
+						     sizeof(*function->groups),
 						     GFP_KERNEL);
-
-				if (!function->groups) {
-					kfree(pctrl->functions);
-					return -ENOMEM;
-				}
+			if (!groups) {
+				kfree(pctrl->functions);
+				return -ENOMEM;
 			}
-
-			groups = function->groups;
+			function->groups = groups;
 			while (*groups)
 				groups++;
 
diff --git a/drivers/pinctrl/berlin/berlin.h b/drivers/pinctrl/berlin/berlin.h
index d7787754d1ed..231aab61d415 100644
--- a/drivers/pinctrl/berlin/berlin.h
+++ b/drivers/pinctrl/berlin/berlin.h
@@ -28,12 +28,6 @@ struct berlin_pinctrl_desc {
 	unsigned			ngroups;
 };
 
-struct berlin_pinctrl_function {
-	const char	*name;
-	const char	**groups;
-	unsigned	ngroups;
-};
-
 #define BERLIN_PINCTRL_GROUP(_name, _offset, _width, _lsb, ...)		\
 	{								\
 		.name = _name,						\
-- 
2.45.1


