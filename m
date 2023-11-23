Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09FFC61D85
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 19:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cjgpy1GAzUxwLaRkjdqHOFNY/W5xSOeyu36MG+cMmGc=; b=UWmF6FTRjKrAo+FEYNPJfb0q6L
	vKFrpi496nHM8XjJnSUFLVDTvqz/mJKr7NexlQsHS6/XiwCUBRBmeUI0gUAg7KR0djhQwoy+n78Ps
	yHayFQvdW2oDOcJN72/HFOpucifMmRgLqhhWNFwcAPDM9BucIoKDUI6dT7AWTY1kGPRIH68xNQUGi
	GJjzb3WKwE5jsV4UXC8vrI5fYZCyTClNggKkp3an/lZxEkiWWjB1NALfwbyXaRR+R84rf+zHdXLQe
	OKIo1RdamLNPDYUOpv1miIjgkxVsVcdFBlBa6ah8v7fccdpdmlq5KisBxZyQQ0eoKvDu9si1ZsbRK
	AJaWxpoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6FTy-005cTR-0a;
	Thu, 23 Nov 2023 19:35:26 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6FT1-005bnN-1h;
	Thu, 23 Nov 2023 19:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700768067; x=1732304067;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NE+17+HWJqu1tvwDbF/Yy56Y9wnjeE8kjUUulypb5zo=;
  b=em05ECfCPuo35UL9mbDxJSZ+CrjErnbp73rZC3QcgYPop67BuT6AcdQj
   i5V8xwGytQs2KBCj06Z75/uaZbmbRcqQQ+A+Q9UVJEwI9AdTDMMebc2qK
   s7UuTvBSh/Tk7WwTQFszvIz8TjdAG9UIrXEqcpHl6zzABTDJrDlWIFPT7
   lOp63vyNVb35BsEVb9eeUYywUbqL+LJfaiVExdpM7X59vtTg7QWOjocBw
   v0uXXEXOV0NEMrrwQv+/BV6xAe19tagdWMKUIO4QAvBrEBPIZO15iJY3v
   VIAWdneFaNz6ePWRVRyej3MVytcI3lWRmk2c/6TOjCFh1BYrvkhE/M6xI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="371671532"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="371671532"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 11:34:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="771062268"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="771062268"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 23 Nov 2023 11:34:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 657F38FE; Thu, 23 Nov 2023 21:33:59 +0200 (EET)
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
Subject: [PATCH v2 16/21] pinctrl: ingenic: Convert to use grp member
Date: Thu, 23 Nov 2023 21:31:44 +0200
Message-ID: <20231123193355.3400852-17-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
References: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_113427_579844_3BCB87A0 
X-CRM114-Status: GOOD (  12.84  )
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
 drivers/pinctrl/pinctrl-ingenic.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 393873de910a..6806fede5df4 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -3756,17 +3756,17 @@ static int ingenic_pinmux_set_mux(struct pinctrl_dev *pctldev,
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
@@ -4293,12 +4293,12 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 
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


