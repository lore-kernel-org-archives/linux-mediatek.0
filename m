Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0B0C07E98
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 20:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhDb/HHOY9FsCnNlIgyCIkjJpR6gLHDbwVIHtDdGEQ0=; b=ROy6daVyZPPqGAsJ4m3+w620WJ
	JzHuz+WjzDuLLGZGyegS8eGNTAcPPLl6MmIA/Sq7xs1LoNpfMiNrI+dOCPYwUuSC4jle5fkOxnmKn
	pyXjlX0ATgodFXrYgUGnbmhcUb4t1YNTbQNc/c+42kdPc/Bjg1vt8vHij66yK31tLItPmJLwZOHjK
	HENw1Fbs1IXHh+/e9TgoIPoWSIyB+9x24Lf/wGM1C46BPigbKAb8AfKz47s0efu4ZwDPpg/Om0aso
	Qih5JEc34rkfsnVYRF/NxAo5UCQY00cJ/jxBi40RQrbjSBnm6C+jcaLIRbnN41DNjOOHPHlisXBjD
	Wkd9scVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r84RW-006EOe-0L;
	Tue, 28 Nov 2023 20:12:26 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r84RR-006ELC-2x;
	Tue, 28 Nov 2023 20:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701202341; x=1732738341;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GcznTEzkYh7381dOAmLl/g2Ovk3HvI9vfBlGPtxsvN8=;
  b=Edi0ND81gvL3may2S3yv4651wy/kdbuOssQWalPKmsj1dXIjuVlyNOjI
   7By33Cq/sUDfLVQC3S0+9T6KJ6DA55mwYLU8pGQWbyhfEhStUbm3JJ6wN
   M2O3BwA/haJoPY7DbK+uON9H+emiTgXP4ovyxnm/AZzPfclxxXzU1Ywt3
   YSxvvzJMnW8EPld3+2qVUJFUbMDoGs+ztQvjrbmMqmnq5gzdRd5Qm4+ZZ
   aUupON2A9WH8/cja60FiHr+G8Sn/FYyzwNbiWws7Cw1bzNCJziTAiP8a3
   9uUhryzCZNUIAZgCKSwBZdi+gNpZULAvBFL0IMOkhEg3wFm4bRNAmZFQu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392767521"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="392767521"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 12:12:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="834754923"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="834754923"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 28 Nov 2023 12:12:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 34A01A7D; Tue, 28 Nov 2023 22:01:58 +0200 (EET)
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
Subject: [PATCH v3 07/22] pinctrl: equilibrium: Convert to use struct pingroup
Date: Tue, 28 Nov 2023 21:56:56 +0200
Message-ID: <20231128200155.438722-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_121221_972440_3B5E07F7 
X-CRM114-Status: GOOD (  13.70  )
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

The pin control header provides struct pingroup.
Utilize it instead of open coded variants in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index fd59cfdeefac..4ebae516d1b1 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -705,7 +705,7 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 	struct device *dev = drvdata->dev;
 	struct device_node *node = dev->of_node;
 	unsigned int *pins, *pinmux, pin_id, pinmux_id;
-	struct group_desc group;
+	struct pingroup group, *grp = &group;
 	struct device_node *np;
 	struct property *prop;
 	int j, err;
@@ -721,49 +721,49 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 			of_node_put(np);
 			return err;
 		}
-		group.num_pins = err;
-		group.name = prop->value;
-		pins = devm_kcalloc(dev, group.num_pins, sizeof(*pins), GFP_KERNEL);
+		grp->npins = err;
+		grp->name = prop->value;
+		pins = devm_kcalloc(dev, grp->npins, sizeof(*pins), GFP_KERNEL);
 		if (!pins) {
 			of_node_put(np);
 			return -ENOMEM;
 		}
-		group.pins = pins;
+		grp->pins = pins;
 
-		pinmux = devm_kcalloc(dev, group.num_pins, sizeof(*pinmux), GFP_KERNEL);
+		pinmux = devm_kcalloc(dev, grp->npins, sizeof(*pinmux), GFP_KERNEL);
 		if (!pinmux) {
 			of_node_put(np);
 			return -ENOMEM;
 		}
 
-		for (j = 0; j < group.num_pins; j++) {
+		for (j = 0; j < grp->npins; j++) {
 			if (of_property_read_u32_index(np, "pins", j, &pin_id)) {
 				dev_err(dev, "Group %s: Read intel pins id failed\n",
-					group.name);
+					grp->name);
 				of_node_put(np);
 				return -EINVAL;
 			}
 			if (pin_id >= drvdata->pctl_desc.npins) {
 				dev_err(dev, "Group %s: Invalid pin ID, idx: %d, pin %u\n",
-					group.name, j, pin_id);
+					grp->name, j, pin_id);
 				of_node_put(np);
 				return -EINVAL;
 			}
 			pins[j] = pin_id;
 			if (of_property_read_u32_index(np, "pinmux", j, &pinmux_id)) {
 				dev_err(dev, "Group %s: Read intel pinmux id failed\n",
-					group.name);
+					grp->name);
 				of_node_put(np);
 				return -EINVAL;
 			}
 			pinmux[j] = pinmux_id;
 		}
 
-		err = pinctrl_generic_add_group(drvdata->pctl_dev, group.name,
-						group.pins, group.num_pins,
+		err = pinctrl_generic_add_group(drvdata->pctl_dev,
+						grp->name, grp->pins, grp->npins,
 						pinmux);
 		if (err < 0) {
-			dev_err(dev, "Failed to register group %s\n", group.name);
+			dev_err(dev, "Failed to register group %s\n", grp->name);
 			of_node_put(np);
 			return err;
 		}
-- 
2.43.0.rc1.1.gbec44491f096


