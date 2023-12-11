Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9390FC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 19:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXD7+gBQlWpkwhFxJl8dN0Mrp9A3SDGr0y2GjsPVWjg=; b=2JZAotNZChcNWU6TiQ6g9IEtD3
	ceWqF6e+yllbiFfTZLtQavlJT2iZvcgpayTs0sxzTXRlpvRjL+OM+W+pd6QMaRuyNIGu+ajnbi8Wv
	DTiIHIvB89jSO5Qh/OtKX4KCWIf4AMXPAE1FbXa3k0F2zt3PIgw6dXu59e5rQ6cyt1SRsUfcuqg9B
	OkGicX/Owa0gf2/EvpBPxITYCl5x/YsK1FzVGqdNCsArdJrbni2B8hgCOYTEyB64FylMp3KLDQcRw
	YtenPv9hVPgONhDQYZiSTvJ1BZN/MIGVyArJ+g54Qr7oD5iG8b1ALlUDdWd4kyvRbMYG9NpIpT2bA
	rQAhBi3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rClZH-007HFc-03;
	Mon, 11 Dec 2023 19:03:51 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rClZ6-007H0t-1d;
	Mon, 11 Dec 2023 19:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702321420; x=1733857420;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jT5aMdLnWQi+FETkAhi9wCFmGc0jKKEFEHjIqYKnUWw=;
  b=Nn0voCmGPJDA6IHhoxweSVvkDnFsTplswe3WMvdYStBVtaxT7KK8PcRn
   hUsRNyK6icv2qm2rd4bVoxaYCX9KQa+edS4KbYQtoW9+17mONRe2yOxwV
   jKP7EBi0YpVYFYl+vK1mbYBFLuUxCSyL0oNJ+NxAbcM+S86ZxVVsO9aTp
   dkPBZrOC1oU8HgM0Gdg7TntCHYuSVDewBd5HBkh6t4d7Tssl0ba9l673I
   EpFaW9A6lhbOdIKaN3gmsln0D7aEWRHqJ1Kvw0CFvvxcFxW57fD8Mfiu0
   izVzqnt2UQOVkqkGU4/lJWFVNxLpD0klyLd7HpjUFtbFfW1S0ygoxJHmi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="480893507"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="480893507"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 11:03:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="766491687"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="766491687"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 11 Dec 2023 11:03:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BB59872F; Mon, 11 Dec 2023 21:03:23 +0200 (EET)
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
Subject: [PATCH v5 08/13] pinctrl: ingenic: Convert to use grp member
Date: Mon, 11 Dec 2023 20:58:01 +0200
Message-ID: <20231211190321.307330-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
References: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_110340_620796_D9AA53A7 
X-CRM114-Status: GOOD (  14.15  )
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

Acked-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index f5661dcdedf5..bc6358a686fc 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -84,17 +84,13 @@
 
 #define INGENIC_PIN_GROUP_FUNCS(_name_, id, funcs)					\
 	{										\
-		.name = _name_,								\
-		.pins = id##_pins,							\
-		.num_pins = ARRAY_SIZE(id##_pins),					\
+		.grp = PINCTRL_PINGROUP(_name_, id##_pins, ARRAY_SIZE(id##_pins)),	\
 		.data = funcs,								\
 	}
 
 #define INGENIC_PIN_GROUP(_name_, id, func)						\
 	{										\
-		.name = _name_,								\
-		.pins = id##_pins,							\
-		.num_pins = ARRAY_SIZE(id##_pins),					\
+		.grp = PINCTRL_PINGROUP(_name_, id##_pins, ARRAY_SIZE(id##_pins)),	\
 		.data = (void *)func,							\
 	}
 
@@ -3766,17 +3762,17 @@ static int ingenic_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->name, grp->name);
+		func->name, grp->grp.name);
 
 	mode = (uintptr_t)grp->data;
 	if (mode <= 3) {
-		for (i = 0; i < grp->num_pins; i++)
-			ingenic_pinmux_set_pin_fn(jzpc, grp->pins[i], mode);
+		for (i = 0; i < grp->grp.npins; i++)
+			ingenic_pinmux_set_pin_fn(jzpc, grp->grp.pins[i], mode);
 	} else {
 		pin_modes = grp->data;
 
-		for (i = 0; i < grp->num_pins; i++)
-			ingenic_pinmux_set_pin_fn(jzpc, grp->pins[i], pin_modes[i]);
+		for (i = 0; i < grp->grp.npins; i++)
+			ingenic_pinmux_set_pin_fn(jzpc, grp->grp.pins[i], pin_modes[i]);
 	}
 
 	return 0;
@@ -4303,12 +4299,12 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 
 	for (i = 0; i < chip_info->num_groups; i++) {
 		const struct group_desc *group = &chip_info->groups[i];
+		const struct pingroup *grp = &group->grp;
 
-		err = pinctrl_generic_add_group(jzpc->pctl, group->name,
-				group->pins, group->num_pins, group->data);
+		err = pinctrl_generic_add_group(jzpc->pctl, grp->name, grp->pins, grp->npins,
+						group->data);
 		if (err < 0) {
-			dev_err(dev, "Failed to register group %s\n",
-					group->name);
+			dev_err(dev, "Failed to register group %s\n", grp->name);
 			return err;
 		}
 	}
-- 
2.43.0.rc1.1.gbec44491f096


