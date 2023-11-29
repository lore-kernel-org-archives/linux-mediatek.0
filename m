Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AA9C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 16:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohBA0Q2Y2sZJUHauV56J20hVr/j8raMLkTBc6Ta5Kxg=; b=TW0Xd0N/vgkDOCWUWEnTuV1ERj
	qpD5mrhDV6DMjbt5znisOsuezyTTla514LwErSkL1cQqXoOHEdb0ZsnaNeT2IDuFZlja5mUTzrOrY
	Tq7OTWCNz/hJoU2FOcdXAMxLiRwlbYobYe8xmFHSPvevyno7t9XFzD9GhqvnvSEynaDQk6whjestO
	A3SJ4es7Bovs1F2cP71vidwK8o4M8A88TqF8CI4yD3LmoJk33iwtonvvBvNhzhLy4aza18fkjVxbR
	QtyOSv0ZFlH6j8uuxmrXELYEdm+AFFjw/hA+DjZ3rq0Aks+tAUbmLuI3a6u/zKONDvl18JS92LuIa
	5KxUpfQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8NEB-008qL3-1o;
	Wed, 29 Nov 2023 16:15:55 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8NDd-008q0T-2q;
	Wed, 29 Nov 2023 16:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701274521; x=1732810521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SFzYcvt8nYJFDLsXPGBxYCQBelQiacFrTnZyjf10dTA=;
  b=C6v2bohN9YNcbviKj8HjhIJhvd9EDTMx3rCVOeVs+WpNsV4k0fT85//J
   Sa6jSuKbfytPYBuyiCouvFquPD952fL+AaKB/sxRP+hVk7zpyIri9Z610
   uBuWAlew67iJLOAb9zY+YJEvDMxMXV2eSAzINF+GZdSKMRE0sBM2DFaLl
   crc7UXq32pwQ2SzSsbdaJrbPW920GfF7qYcSt8bu00vVMpgZjEEALHcXJ
   xV91jDjNmP/cWTEf5LyLVdQ4sFBl4k857mWvLvxC5tBLuPzEg6Z1a0cwa
   JMzYdDApXwvjVTWyYz1OfuP3rqDzXZqbDA4o1RPqJOIqEIcQzUXeULf/t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373372605"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="373372605"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:15:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="892498870"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="892498870"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 29 Nov 2023 08:15:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6C5D2A5F; Wed, 29 Nov 2023 18:15:01 +0200 (EET)
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
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v4 05/23] pinctrl: imx: Use temporary variable to hold pins
Date: Wed, 29 Nov 2023 18:06:28 +0200
Message-ID: <20231129161459.1002323-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_081521_966257_5691F095 
X-CRM114-Status: GOOD (  14.37  )
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

The pins are allocated from the heap, but in order to pass
them as constant object, we need to use non-constant pointer.
Achieve this by using a temporary variable.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 9bc16943014f..28164b04b1be 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -511,6 +511,7 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 {
 	const struct imx_pinctrl_soc_info *info = ipctl->info;
 	struct imx_pin *pin;
+	unsigned int *pins;
 	int size, pin_size;
 	const __be32 *list;
 	int i;
@@ -557,20 +558,20 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 	grp->data = devm_kcalloc(ipctl->dev,
 				 grp->num_pins, sizeof(struct imx_pin),
 				 GFP_KERNEL);
-	grp->pins = devm_kcalloc(ipctl->dev,
-				 grp->num_pins, sizeof(unsigned int),
-				 GFP_KERNEL);
-	if (!grp->pins || !grp->data)
+	if (!grp->data)
 		return -ENOMEM;
 
+	pins = devm_kcalloc(ipctl->dev, grp->num_pins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+	grp->pins = pins;
+
 	for (i = 0; i < grp->num_pins; i++) {
 		pin = &((struct imx_pin *)(grp->data))[i];
 		if (info->flags & IMX_USE_SCU)
-			info->imx_pinctrl_parse_pin(ipctl, &grp->pins[i],
-						  pin, &list);
+			info->imx_pinctrl_parse_pin(ipctl, &pins[i], pin, &list);
 		else
-			imx_pinctrl_parse_pin_mmio(ipctl, &grp->pins[i],
-						   pin, &list, np);
+			imx_pinctrl_parse_pin_mmio(ipctl, &pins[i], pin, &list, np);
 	}
 
 	return 0;
-- 
2.43.0.rc1.1.gbec44491f096


