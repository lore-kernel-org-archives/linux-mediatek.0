Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B3CC35273
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 19:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8S96D+36L0Uxbv6QRnXmrtjod90vUuESxq/F9Qjjbhc=; b=x0gx+ZPJKXhwTCq6OLprNKzQUw
	PMxjoacFLovFKsbZRg6ndj+3CbNX4ysKG0iJMyjyHqgiWIMRrxN4er7RWYAiumnx1B9wkEasoN05k
	DTgc8TShu1X0wlhDBjPp8wtpAykvUIPYaf+fZypZ6QS176GUrI8JtxnWgEjYu7brsqM7dCLvCd2k4
	RqZA5+Ge8AVVViDXEzDjAjQrLNtspA3zrhQxD2t4l43gDkW/I2hp+Qap1is3Zjrspj6e9PHqFUPCi
	MWlVxCpwAgShkLGutmiAbkGPskQCP+bAW6tHyMH42AS0NzZKsHIOWs4eYGTGt/63rMMXc17PqLvAK
	Xeylbr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rClZX-007HWo-0K;
	Mon, 11 Dec 2023 19:04:07 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rClZ8-007H63-1V;
	Mon, 11 Dec 2023 19:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702321422; x=1733857422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6S0za2ArzaZgRtTIp/prxGbnlaukelwxoBpv7MAxWdo=;
  b=kVynlCKCC+8SvleRFMgUadipjaArkpjVtfIr33m10iTWMVKRq5kHwxNl
   EyfkMZf5KFq4ZdotsbL0s24noK/vNxbepU9H7UdUq3B+yOP8GC7JY0TBp
   ANjAyxidTiPDRbhj9mg/ivS/dksRJyoAFnHhYJZ2Y4plZfglp1AfIFW4H
   96YxiM7p9KTpxfBOpaiuDwMnMobHWTjj4p6u5jZv6g20RfMZFr6QhMRKp
   vxNeTcMmeLPjQHJV37nOTgNUn/87KYe9uxuQEYVf/2kESB8i4KkxqWL+G
   1E5XVobb9ESg3D/numx6rDmq1mdyjzbCcXjExZADkOLhPwmqM8m4ARdf+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="480893535"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="480893535"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 11:03:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="766491696"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="766491696"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 11 Dec 2023 11:03:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D5A28892; Mon, 11 Dec 2023 21:03:23 +0200 (EET)
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
Subject: [PATCH v5 10/13] pinctrl: mediatek: Convert to use grp member
Date: Mon, 11 Dec 2023 20:58:03 +0200
Message-ID: <20231211190321.307330-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
References: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_110342_562630_206BD898 
X-CRM114-Status: GOOD (  14.33  )
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
 drivers/pinctrl/mediatek/pinctrl-moore.c | 13 ++++++-------
 drivers/pinctrl/mediatek/pinctrl-moore.h |  4 +---
 drivers/pinctrl/mediatek/pinctrl-paris.h |  4 +---
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index c3d59eddd994..d972584c0519 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -56,12 +56,12 @@ static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->name, grp->name);
+		func->name, grp->grp.name);
 
-	for (i = 0; i < grp->num_pins; i++) {
+	for (i = 0; i < grp->grp.npins; i++) {
 		const struct mtk_pin_desc *desc;
 		int *pin_modes = grp->data;
-		int pin = grp->pins[i];
+		int pin = grp->grp.pins[i];
 
 		desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 		if (!desc->name)
@@ -602,13 +602,12 @@ static int mtk_build_groups(struct mtk_pinctrl *hw)
 
 	for (i = 0; i < hw->soc->ngrps; i++) {
 		const struct group_desc *group = hw->soc->grps + i;
+		const struct pingroup *grp = &group->grp;
 
-		err = pinctrl_generic_add_group(hw->pctrl, group->name,
-						group->pins, group->num_pins,
+		err = pinctrl_generic_add_group(hw->pctrl, grp->name, grp->pins, grp->npins,
 						group->data);
 		if (err < 0) {
-			dev_err(hw->dev, "Failed to register group %s\n",
-				group->name);
+			dev_err(hw->dev, "Failed to register group %s\n", grp->name);
 			return err;
 		}
 	}
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.h b/drivers/pinctrl/mediatek/pinctrl-moore.h
index 36ee0021cf7e..e0313e7a1fe0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.h
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.h
@@ -39,9 +39,7 @@
 
 #define PINCTRL_PIN_GROUP(_name_, id)							\
 	{										\
-		.name = _name_,								\
-		.pins = id##_pins,							\
-		.num_pins = ARRAY_SIZE(id##_pins),					\
+		.grp = PINCTRL_PINGROUP(_name_, id##_pins, ARRAY_SIZE(id##_pins)),	\
 		.data = id##_funcs,							\
 	}
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.h b/drivers/pinctrl/mediatek/pinctrl-paris.h
index 5c4e5b74e43e..948ce126aa0c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.h
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.h
@@ -51,9 +51,7 @@
 
 #define PINCTRL_PIN_GROUP(_name_, id)							\
 	{										\
-		.name = _name_,								\
-		.pins = id##_pins,							\
-		.num_pins = ARRAY_SIZE(id##_pins),					\
+		.grp = PINCTRL_PINGROUP(_name_,id##_pins, ARRAY_SIZE(id##_pins)),	\
 		.data = id##_funcs,							\
 	}
 
-- 
2.43.0.rc1.1.gbec44491f096


