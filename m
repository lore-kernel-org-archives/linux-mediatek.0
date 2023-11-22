Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98258C61D9B
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 16:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7zRKHolBLv5gVPiB/7MCiE6HClGY+C3zfglzlEMz6o=; b=UDdc46rcd/qCy/T15LgdqobAvC
	LNshTY7ShLAsWVahfuzM50/qvq9gVOpOn2i3JRlLoGZBbsLsACBzw40QAjWVpRQHWpckZlbaggd/U
	9tRUti9vxw4iXUcxh9/yKQOzJBvW9mRXyBCSk1MeJBNjg0qslon52tawgRubPzero0bumdspoYanb
	iBz/LgpfvGjPYflL8whz2jy3YqURuQ3KxlXarV1/3sDXYRdzfCOaMJ+TEUZKeaeEG17Sd/gSfN3Ls
	MoiN7wAoNNfZXhBD1N7uP3HTixMgRAswM5iJ+XIgnK5QW4CioIqj+00o2w7sDxICetnoQ+8DxGn1x
	oPoMZK5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qX0-002ahW-1p;
	Wed, 22 Nov 2023 16:56:54 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qWx-002af3-0m;
	Wed, 22 Nov 2023 16:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700672211; x=1732208211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+w70dijnIhYAk0vVK1fe5YJSScdtigXGehzr6Lwxbvg=;
  b=Fo1bH2zaymHWc3zj+u3yeUqyze1phAb+wHZbCWJgkDkWyRlUIRUJG4dj
   0ZEhwZPLq8u0rpC7rO+jIFV3EBsukFKPuEO1jt4y2NL3v7q0qqYI9OnyK
   z7T9PmuEVH/1OcR71/w8hDky2yhfk3hZvxGome0sHtFx0Qnz0n+NNJyLy
   Jq2u0kjrPiO2auIq5MmgGN30YqOlEvTLskonzGJ+K2pnXAR6VtgOHFMRd
   s1yRZbnHR8H72uOFRxx/XWc8UXABmvhjDQkIjmReG1xAvbjveDE/HzyY2
   jno6jahaTij+yO3BiR/jFGRgiLCZdlvmnFUGcQUYKTglmkCmrLvfl/m5O
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5235479"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="5235479"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 08:56:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="857815517"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="857815517"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Nov 2023 08:56:16 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E3FE6FD; Wed, 22 Nov 2023 18:40:44 +0200 (EET)
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
Subject: [PATCH v1 01/17] pinctrl: equilibrium: Convert to use struct pingroup
Date: Wed, 22 Nov 2023 18:35:33 +0200
Message-ID: <20231122164040.2262742-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
References: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_085651_300557_DA772264 
X-CRM114-Status: GOOD (  15.65  )
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
 drivers/pinctrl/pinctrl-equilibrium.c | 32 +++++++++++++--------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 5b5ddf7e5d0e..9202a60b4ec7 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -705,7 +705,7 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 	struct device *dev = drvdata->dev;
 	struct device_node *node = dev->of_node;
 	unsigned int *pinmux, pin_id, pinmux_id;
-	struct group_desc group;
+	struct pingroup group, *grp = &group;
 	struct device_node *np;
 	struct property *prop;
 	int j, err;
@@ -715,55 +715,53 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 		if (!prop)
 			continue;
 
-		group.num_pins = of_property_count_u32_elems(np, "pins");
-		if (group.num_pins < 0) {
+		grp->npins = of_property_count_u32_elems(np, "pins");
+		if (grp->npins < 0) {
 			dev_err(dev, "No pins in the group: %s\n", prop->name);
 			of_node_put(np);
 			return -EINVAL;
 		}
-		group.name = prop->value;
-		group.pins = devm_kcalloc(dev, group.num_pins,
-					  sizeof(*(group.pins)), GFP_KERNEL);
-		if (!group.pins) {
+		grp->name = prop->value;
+		grp->pins = devm_kcalloc(dev, grp->npins, sizeof(*grp->pins), GFP_KERNEL);
+		if (!grp->pins) {
 			of_node_put(np);
 			return -ENOMEM;
 		}
 
-		pinmux = devm_kcalloc(dev, group.num_pins, sizeof(*pinmux),
-				      GFP_KERNEL);
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
-			group.pins[j] = pin_id;
+			grp->pins[j] = pin_id;
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
+		err = pinctrl_generic_add_group(drvdata->pctl_dev, grp->name,
+						grp->pins, grp->num_pins,
 						pinmux);
 		if (err < 0) {
-			dev_err(dev, "Failed to register group %s\n", group.name);
+			dev_err(dev, "Failed to register group %s\n", grp->name);
 			of_node_put(np);
 			return err;
 		}
-- 
2.43.0.rc1.1.gbec44491f096


