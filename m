Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B191C27C43
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 09:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJVLD03TSbh0EX+KgNnmIHIuhindXa+wgSQyJxdLtmU=; b=cjOPNDY2HMZc3eVSS7ewCJMJlR
	Zea2PryXxUF1RYG2oI84EH5TK0ytCthnZl2wtz7Pc2yyeC/EO3nv3gyJxJAb7JrJ5FMZ7VfQXj1DP
	Pqm7gd6NSoVwZ8C9afujbE8t3XgYBiPa281r3i84WXhxDNQnmugcYsuBYIfktc7eWGz3Rr9P8inq/
	C+93AfyWaIVi92mxFn350YmVbJ2hLCb9ucE5TVkpVDlClNzNxoCNb5EcRd4kCQlAcUi9/f+WyEAQ9
	fiqOB0Lhl2Uhx2nlzw56Hw9J72No3g67SbT+8Y/fCIi91yKLatu0Xe23kpi+IGhu4BRdvYMHDzLWN
	kWYOaGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcLC-00000006sUc-3HvO;
	Thu, 30 May 2024 09:44:58 +0000
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcKy-00000006sQM-3R84
	for linux-mediatek@lists.infradead.org;
	Thu, 30 May 2024 09:44:46 +0000
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id bac30c71-1e62-11ef-8e2e-005056bdf889;
	Thu, 30 May 2024 11:58:06 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
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
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 02/11] pinctrl: equilibrium: Make use of struct pinfunction
Date: Thu, 30 May 2024 11:55:11 +0300
Message-ID: <20240530085745.1539925-3-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
References: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_024445_056419_D348F499 
X-CRM114-Status: GOOD (  16.58  )
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
 drivers/pinctrl/pinctrl-equilibrium.c | 24 +++++++++++++-----------
 drivers/pinctrl/pinctrl-equilibrium.h | 12 ------------
 2 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 6e1be38865c3..a6d089eaaae5 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -566,8 +566,8 @@ static const struct pinconf_ops eqbr_pinconf_ops = {
 	.pin_config_config_dbg_show	= pinconf_generic_dump_config,
 };
 
-static bool is_func_exist(struct eqbr_pmx_func *funcs, const char *name,
-			 unsigned int nr_funcs, unsigned int *idx)
+static bool is_func_exist(struct pinfunction *funcs, const char *name,
+			  unsigned int nr_funcs, unsigned int *idx)
 {
 	int i;
 
@@ -584,13 +584,14 @@ static bool is_func_exist(struct eqbr_pmx_func *funcs, const char *name,
 	return false;
 }
 
-static int funcs_utils(struct device *dev, struct eqbr_pmx_func *funcs,
+static int funcs_utils(struct device *dev, struct pinfunction *funcs,
 		       unsigned int *nr_funcs, funcs_util_ops op)
 {
 	struct device_node *node = dev->of_node;
 	struct device_node *np;
 	struct property *prop;
 	const char *fn_name;
+	const char **groups;
 	unsigned int fid;
 	int i, j;
 
@@ -620,15 +621,16 @@ static int funcs_utils(struct device *dev, struct eqbr_pmx_func *funcs,
 
 		case OP_COUNT_NR_FUNC_GRPS:
 			if (is_func_exist(funcs, fn_name, *nr_funcs, &fid))
-				funcs[fid].nr_groups++;
+				funcs[fid].ngroups++;
 			break;
 
 		case OP_ADD_FUNC_GRPS:
 			if (is_func_exist(funcs, fn_name, *nr_funcs, &fid)) {
-				for (j = 0; j < funcs[fid].nr_groups; j++)
-					if (!funcs[fid].groups[j])
+				groups = (const char **)funcs[fid].groups;
+				for (j = 0; j < funcs[fid].ngroups; j++)
+					if (!groups[j])
 						break;
-				funcs[fid].groups[j] = prop->value;
+				groups[j] = prop->value;
 			}
 			break;
 
@@ -645,7 +647,7 @@ static int funcs_utils(struct device *dev, struct eqbr_pmx_func *funcs,
 static int eqbr_build_functions(struct eqbr_pinctrl_drv_data *drvdata)
 {
 	struct device *dev = drvdata->dev;
-	struct eqbr_pmx_func *funcs = NULL;
+	struct pinfunction *funcs = NULL;
 	unsigned int nr_funcs = 0;
 	int i, ret;
 
@@ -666,9 +668,9 @@ static int eqbr_build_functions(struct eqbr_pinctrl_drv_data *drvdata)
 		return ret;
 
 	for (i = 0; i < nr_funcs; i++) {
-		if (!funcs[i].nr_groups)
+		if (!funcs[i].ngroups)
 			continue;
-		funcs[i].groups = devm_kcalloc(dev, funcs[i].nr_groups,
+		funcs[i].groups = devm_kcalloc(dev, funcs[i].ngroups,
 					       sizeof(*(funcs[i].groups)),
 					       GFP_KERNEL);
 		if (!funcs[i].groups)
@@ -688,7 +690,7 @@ static int eqbr_build_functions(struct eqbr_pinctrl_drv_data *drvdata)
 		ret = pinmux_generic_add_function(drvdata->pctl_dev,
 						  funcs[i].name,
 						  funcs[i].groups,
-						  funcs[i].nr_groups,
+						  funcs[i].ngroups,
 						  drvdata);
 		if (ret < 0) {
 			dev_err(dev, "Failed to register function %s\n",
diff --git a/drivers/pinctrl/pinctrl-equilibrium.h b/drivers/pinctrl/pinctrl-equilibrium.h
index 83768cc8b3db..b4d149bde39d 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.h
+++ b/drivers/pinctrl/pinctrl-equilibrium.h
@@ -67,18 +67,6 @@ struct gpio_irq_type {
 	unsigned int logic_type;
 };
 
-/**
- * struct eqbr_pmx_func: represent a pin function.
- * @name: name of the pin function, used to lookup the function.
- * @groups: one or more names of pin groups that provide this function.
- * @nr_groups: number of groups included in @groups.
- */
-struct eqbr_pmx_func {
-	const char		*name;
-	const char		**groups;
-	unsigned int		nr_groups;
-};
-
 /**
  * struct eqbr_pin_bank: represent a pin bank.
  * @membase: base address of the pin bank register.
-- 
2.45.1


