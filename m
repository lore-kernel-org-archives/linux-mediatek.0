Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7EFC07E98
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 20:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1M43IP9OCd6RwU9m/d+ufBtKieIOsmZ5ZZ/ADpS1WM=; b=mZhGw4yuuOydmh095yDzl9Z+KO
	A0HEiELQMc7MQh+SBVb/JsCJBjDYYdAcoXnhJG0hKt596D7TMAUFi0v6JxcWyK0V10gCtvcGCnY4h
	oFy0U+Jj0YFArQELMa+wbJ6NCPXeX2Oiv7CtcQTII6iyOsuNEps6yawd0qbtIzixvESs9BoibuR14
	JoXh7A1Yg/IFg9i2PzuJJ32xvoFdhAsujCZAlQrN7iVEv+BaJcsvffs3pLe1gIqYKlnz1cKjvW8D9
	wjCQiNkzG8dW4yTnuwm0mu4ieYmIjKSD9cYLPc/rvimOd25CiKEP8JKnagJGIAk2cl0aDa02dNvN1
	Xt9eX7rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r84Ja-006CmO-0r;
	Tue, 28 Nov 2023 20:04:14 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r84JU-006Cig-1l;
	Tue, 28 Nov 2023 20:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701201848; x=1732737848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F5NaZOUNJt2aC961gQWly0juK4lUdpP0X8wiQRn5/3c=;
  b=OK94UtDwDWgj9K/LfIKAfQFXlYiML0FOsPtWDjFnrH4ZnuE1EEys8Ikl
   Fg7bg6FLXoIrDK1AW2y+ELS/yXpqY8Ldtz/A1gS2d5NW1U3vkTCVdjJA+
   w1WaM/2GozWyhzLPSckov2x5aUQWlMoLGecYPV5L/sxWQFabtNROKy6Uv
   9x8EM28XKyJkSN4WwzwMiXpMABVc+mpuOwkAruJty1Sa1QEk7DqGOwo3Y
   rBP+s48HGGzV1tQbV6rvANGk+WHwPFLuDTxiCpEGn5u/ahWt+cfwLM5+k
   LADro7ua3J/T4egTruF6ooZuzDtckOf10KjQKdhu/iVVXYMEzUqSiaJ+p
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="457345600"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="457345600"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 12:02:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="772420462"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="772420462"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 28 Nov 2023 12:02:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B30F0B48; Tue, 28 Nov 2023 22:01:58 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
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
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v3 16/22] pinctrl: imx: Convert to use grp member
Date: Tue, 28 Nov 2023 21:57:05 +0200
Message-ID: <20231128200155.438722-17-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_120408_625094_1D07DC7A 
X-CRM114-Status: GOOD (  14.61  )
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
 drivers/pinctrl/freescale/pinctrl-imx.c | 31 +++++++++++--------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9099a7c81d4a..4245189b59a5 100644
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


