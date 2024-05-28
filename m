Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7FFC25B7C
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 May 2024 19:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6sn0pIWwwSnfY8AGhWWYQzwnQKI9fY7QhhOOQ0QLcw=; b=AwoqCuNXteEnr7XRnhUki4hxVt
	JBBSkd7dfO2fvyqHzVt1ao29SxYoJiQw+BGBAr1zrL0bbwG9nMNOH3ltuRZc294lph3C4zxkkBsYn
	8AKd2CyagMqj4A18/N1Y3Q1qGJDf8e1xVy6Rlj2zQ/vMSJmRCEORofeiiO/yMnziSZCbCbblbV9pl
	2qpsLvGaj6YVV/R36V9Utnut1klqGLHwCvn5tN0e59O/Rd4M0Z7xHe1aqZYAIlrKgTcndYaoctBEs
	mhT2gbqgbFju+vdi3aKUnGfUnRYX6EbM0VtAHcXsTD5U+uvmKCP1shsKv7hBpXWeSDMMYRCC7De7O
	dwC/JU3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC2qM-00000001szJ-2eUE;
	Tue, 28 May 2024 19:50:46 +0000
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC2ph-00000001sY0-3SLs
	for linux-mediatek@lists.infradead.org;
	Tue, 28 May 2024 19:50:08 +0000
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 7a1a2509-1d2b-11ef-aaf5-005056bdd08f;
	Tue, 28 May 2024 22:50:04 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 08/11] pinctrl: ingenic: Convert to use func member
Date: Tue, 28 May 2024 22:44:59 +0300
Message-ID: <20240528194951.1489887-9-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
References: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_125006_124882_4AA8542C 
X-CRM114-Status: GOOD (  12.07  )
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

Convert drivers to use func member embedded in struct function_desc,
because other members will be removed to avoid duplication and
desynchronisation of the generic pin function description.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 959b9ea83a66..31703737731b 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -96,9 +96,7 @@
 
 #define INGENIC_PIN_FUNCTION(_name_, id)							\
 	{											\
-		.name = _name_,									\
-		.group_names = id##_groups,							\
-		.num_group_names = ARRAY_SIZE(id##_groups),					\
+		.func = PINCTRL_PINFUNCTION(_name_, id##_groups, ARRAY_SIZE(id##_groups)),	\
 		.data = NULL,									\
 	}
 
@@ -3769,7 +3767,7 @@ static int ingenic_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->name, grp->grp.name);
+		func->func.name, grp->grp.name);
 
 	mode = (uintptr_t)grp->data;
 	if (mode <= 3) {
@@ -4317,14 +4315,14 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < chip_info->num_functions; i++) {
-		const struct function_desc *func = &chip_info->functions[i];
+		const struct function_desc *function = &chip_info->functions[i];
+		const struct pinfunction *func = &function->func;
 
 		err = pinmux_generic_add_function(jzpc->pctl, func->name,
-				func->group_names, func->num_group_names,
-				func->data);
+						  func->groups, func->ngroups,
+						  function->data);
 		if (err < 0) {
-			dev_err(dev, "Failed to register function %s\n",
-					func->name);
+			dev_err(dev, "Failed to register function %s\n", func->name);
 			return err;
 		}
 	}
-- 
2.45.1


