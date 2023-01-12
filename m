Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51DCC54EBE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 18:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sD0WmciD6aGDnjJ0n0Y1RfhYHb+M6lM1mw5QbrXgp2o=; b=qxb/UeAu9hFStsoVMX4dSVTm6m
	qzAohYbzD7wvNk/hzNs5V5FaoFHIX9EJ2xGLgFqedzTzdeUKuUh2s1tkGBWpoppTPXJZNDmdpO16o
	eQvGHZkdvOjXdvVcE53XxyghObks5XQSz1o1kOxCdYE3I0l12f57350ycIHOvKf3byJ4RVk4DUZkI
	J87b8o5Y2AaxtOL/RkmZwbyMagSviSIN6Zp0rpbx4IhrazBJBFVh8y+GnA5jWh+AhEfrmG25X2jXi
	DmwT+Hc3ap4oNQy2FPK4KcvvHlW7M9DGQV8xqvHED8cN+fSjNrS57R5U3Vwzi7Z1/X+O1Knj+wae0
	cNoGjW7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG2Y2-00GKFY-AM; Thu, 12 Jan 2023 18:43:34 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG2Xr-00GKCw-H0; Thu, 12 Jan 2023 18:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673549003; x=1705085003;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XQH5u3DL5ISx2GfFC4iQ4W+ecE1+55/FppouOEOhfe8=;
  b=cnSaXf7JHFk17qVj+ybJu1VvcrfANg6gw4X7J/NWbvmxAWphpIRby1kX
   xo5Ct61Z+UCF7QFMGMz0F+KmvlmOin/MstGCm+UwG1Jd7xSFlj7Azxp9A
   /YAkaUw28cQ+exOgIXCC/ciuz1x1GHAPPxAmtH5/pROZVjYpfaAWEr89w
   y2QMtwBCHnSgCohw0MwIB0CwwZYG53dRQLYXZrDHZ86kFJHgJBm0EvTWx
   mIq2dJL0WP4UbvqJBPpYAUWehowwzwl7hc4Z0itRYCOygiT8e8VonwRxq
   PUtofkeycl+8wyOPfpsRgp1m/Il6GHfIa2ysm7XfdoCN2ahMi/nthF3YQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="325844579"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; 
   d="scan'208";a="325844579"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 10:43:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="781868438"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; 
   d="scan'208";a="781868438"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 12 Jan 2023 10:43:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 074E0130; Thu, 12 Jan 2023 20:43:42 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] pinctrl: mediatek: Remove duplicate assignment of of_gpio_n_cells
Date: Thu, 12 Jan 2023 20:43:40 +0200
Message-Id: <20230112184340.79606-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_104323_629747_81C2C593 
X-CRM114-Status: GOOD (  10.69  )
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

The of_gpio_n_cells default is 2 when ->of_xlate() callback is
not defined. No need to assign it explicitly in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c      | 1 -
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 1 -
 drivers/pinctrl/mediatek/pinctrl-paris.c      | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 1ec0413959e1..007b98ce5631 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -574,7 +574,6 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	chip->set_config	= mtk_gpio_set_config;
 	chip->base		= -1;
 	chip->ngpio		= hw->soc->npins;
-	chip->of_gpio_n_cells	= 2;
 
 	ret = gpiochip_add_data(chip, hw);
 	if (ret < 0)
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 553d16703475..665dec419e7c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -906,7 +906,6 @@ static const struct gpio_chip mtk_gpio_chip = {
 	.set			= mtk_gpio_set,
 	.to_irq			= mtk_gpio_to_irq,
 	.set_config		= mtk_gpio_set_config,
-	.of_gpio_n_cells	= 2,
 };
 
 static int mtk_eint_suspend(struct device *device)
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 475f4172d508..17eead44b675 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -987,7 +987,6 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	chip->set_config	= mtk_gpio_set_config;
 	chip->base		= -1;
 	chip->ngpio		= hw->soc->npins;
-	chip->of_gpio_n_cells	= 2;
 
 	ret = gpiochip_add_data(chip, hw);
 	if (ret < 0)
-- 
2.39.0


