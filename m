Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1BCC41535
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 19:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iG0Xz0E9ZGwvtBs6hF7W0uwF+ucyKb8B0PZCu5CXZgE=; b=dHCzE0sG4S7iCci2nOGqq4Tajn
	mZKid36ynUTtRmAiW82SYjn/swsUS8QRJ9XpFg84sdVyV+7aYjUCB1QKSv5nUUFab9sKI3L/AmNhl
	a4muBABZDl7XoBkrBsCJvpNDfPLMWqF2IlHSFfrzgF6hxmQtDh7S2k/udgm9mSo04c/jiOBO580Yr
	pF9UaSNA4/YZHxxGaq2i2eAmnCi3Q6aKAkPyje5z6Ax3MAMuZilf5oqSps8nKKpQAfZs92km2rmDq
	HDuFJP/MwDx2vd20GCHm9gZVsd5GMAFrM/ZRdfhHMf5xXag7BLZMVCFRWRRQsm6tmjyqpgn+NeAiC
	YYOSpZrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rClZH-007HGY-2v;
	Mon, 11 Dec 2023 19:03:51 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rClZ6-007H3g-2I;
	Mon, 11 Dec 2023 19:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702321420; x=1733857420;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jBgMUxoaE0sg0WlUT7okBsBkokT5icXyzOHzcQhn8e4=;
  b=KBzL0mJuoHnNHSoi0QVeGbRry3vfsHxQgI2Ap50f62hnzDQs3CjgzMRS
   4BbI2xpn8MV0IxJLjLVlL5TLM13Zq5raqEPEeRXKVcUhxnJseHnhJXtEd
   wkPL4zssAO9CNhMBft/kdUG9XsaM42UVCMk/s3M7ErJqNfyfI2t4axH6v
   WHJM5WDpW7gQtV2xPq4/m1bV9OplbZ20LOmLM7u5ywj+JM7AELtEh042H
   sF6JYj/5zGBfOcbl/HXJuEV/MCkC1LcFokszHjULKIcE9mYtOl2ndjHpU
   udxFA+O/hFoWtNgzPr6PRfErj1juImI1wVD7NOBeXQEupJlwRZzIuKKQj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="379692537"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="379692537"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 11:03:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="946445103"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="946445103"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 11 Dec 2023 11:03:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id ADD346A6; Mon, 11 Dec 2023 21:03:23 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
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
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v5 07/13] pinctrl: imx: Convert to use grp member
Date: Mon, 11 Dec 2023 20:58:00 +0200
Message-ID: <20231211190321.307330-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
References: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_110340_898850_BD29C7A0 
X-CRM114-Status: GOOD (  15.34  )
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

Convert drivers to use grp member embedded in struct group_desc,
because other members will be removed to avoid duplication and
desynchronisation of the generic pin group description.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 31 +++++++++++--------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 28164b04b1be..2d3d80921c0d 100644
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
@@ -526,7 +526,7 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 		pin_size = FSL_PIN_SIZE;
 
 	/* Initialise group */
-	grp->name = np->name;
+	grp->grp.name = np->name;
 
 	/*
 	 * the binding format is fsl,pins = <PIN_FUNC_ID CONFIG ...>,
@@ -554,19 +554,17 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 		return -EINVAL;
 	}
 
-	grp->num_pins = size / pin_size;
-	grp->data = devm_kcalloc(ipctl->dev,
-				 grp->num_pins, sizeof(struct imx_pin),
-				 GFP_KERNEL);
+	grp->grp.npins = size / pin_size;
+	grp->data = devm_kcalloc(ipctl->dev, grp->grp.npins, sizeof(*pin), GFP_KERNEL);
 	if (!grp->data)
 		return -ENOMEM;
 
-	pins = devm_kcalloc(ipctl->dev, grp->num_pins, sizeof(*pins), GFP_KERNEL);
+	pins = devm_kcalloc(ipctl->dev, grp->grp.npins, sizeof(*pins), GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
-	grp->pins = pins;
+	grp->grp.pins = pins;
 
-	for (i = 0; i < grp->num_pins; i++) {
+	for (i = 0; i < grp->grp.npins; i++) {
 		pin = &((struct imx_pin *)(grp->data))[i];
 		if (info->flags & IMX_USE_SCU)
 			info->imx_pinctrl_parse_pin(ipctl, &pins[i], pin, &list);
@@ -613,8 +611,7 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 
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


