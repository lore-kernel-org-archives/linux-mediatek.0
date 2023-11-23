Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62246C624B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 19:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQLqhWdcmCuYocJAB6MhLGmTkQ/W4BV3c/F3CsAFf8M=; b=jjmkmUFef3rYsVsEnsIhO6fk5Z
	4QGk18kv77tvkO+gXI4077Qq8+CRYVwKwmA22jR1u6zPprpW5ku30kIKN4hNolOT0vO4LYlQ7J0q3
	desRyzT+OmIBzysaYPQFJy99Uyj2ziZhl/2AA83oxct9fUeigvZl3639BL6rgo/6rwCtqQE/hCBKP
	MamgHgPd1beaMimbWuSodvcBXOxKpbMIhlJLSLbtPdTULfA3x1qH7wIY7Er/3Ek5ir845pzpP+y4G
	L/qzupXdKDzfywZEsZ07rowfplY71HZ1sOvk24NUGBXNmNWrxC3H2k3efO2YaqKkCetF0ci5Wqdby
	x6HEeuUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6FSo-005beS-1D;
	Thu, 23 Nov 2023 19:34:14 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6FSl-005bcI-2R;
	Thu, 23 Nov 2023 19:34:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700768051; x=1732304051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cro7IHIecIo02j6c7iYOhKh81yiulS+fo6g+HwOWxo8=;
  b=PPd7Tf/ziBro3eBkUIMME4uPP7IdQfpTsvfCcRgKkMjVJFGp9rItsVZz
   2EdsXox++S5FmzkQrrL0yujSUG0Y4pkjClobcxlz0L2gPHpQitcCc7eLX
   nzSAM03idgLmdY18cnSXrbM7u+kkPWz/yjKfbj2MggbdxR4BrhYfX8W39
   WSIx60o5g/Of3gP/eovovUU1a6ruBsqtJU+h5FCdIFuxzGnNE9zRnrW6C
   huQb0SFr6uCwcHtLSAC2to6exKdo3kTL50XGYG2EYM0ID7+/En2V9w64h
   l5IALU111pctYpi2jyiGa5prT/hICr5mxNqY9xh6fU+Rsj+N4cuYWme1w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="372482079"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="372482079"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 11:34:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833506147"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="833506147"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 23 Nov 2023 11:33:59 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B843A38C; Thu, 23 Nov 2023 21:33:58 +0200 (EET)
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
Subject: [PATCH v2 04/21] pinctrl: imx: Use temporary variable to hold pins
Date: Thu, 23 Nov 2023 21:31:32 +0200
Message-ID: <20231123193355.3400852-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
References: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_113411_805390_C5A3E9D4 
X-CRM114-Status: GOOD (  12.66  )
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
index 9bc16943014f..9099a7c81d4a 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -513,6 +513,7 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 	struct imx_pin *pin;
 	int size, pin_size;
 	const __be32 *list;
+	int *pins;
 	int i;
 
 	dev_dbg(ipctl->dev, "group(%d): %pOFn\n", index, np);
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


