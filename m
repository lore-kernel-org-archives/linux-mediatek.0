Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC223C07CA9
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 20:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxzKhYM/0Sg0zBNGbFDWdCpkW1uvPcAWRwicin9BmMw=; b=I6c1ri3kGgfCm6iqOY24cuwHqt
	58omMOcYu1ov8UUK/Xqly6mHhl21rhEbJPDmCOib/Lh3IiDs5Tl0YqPP9IGoi5v9cINfzA54RmKGJ
	g1DsOt6hTY0M2ROPSnRfgYtWgr8C2LZU73x9SNs4guiflxzGWbJwj7iK7wVP4naznwgbnehInnIpd
	mucAePAiJ6tiN2XauJOzDSh2qo5++Pppsgh6cpoPgmbB7WT0zgyOOPsUXsRXVM5WlYL5HIfAjeKa0
	1MYJieC9bRd4fYicTsvq2xG6mrHHLWBoq8aHSvSvZPPdBMlPiXj3wVSM3DapmKYdym8YqNMe5Olc4
	dszg2JQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r84RV-006EOK-28;
	Tue, 28 Nov 2023 20:12:25 +0000
Received: from mgamail.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r84RR-006ELV-3A;
	Tue, 28 Nov 2023 20:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701202342; x=1732738342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NbQPPAhSXc+lH2scgSPRWjHrBuSZh78A/g5NEt950rk=;
  b=RyP8aR6ggb8Ss0HsZ+HMuY1MaW5KzU6TaTuKMw/4GamPltTVw2eqvtWV
   mJ5/FjSpg8wf5P7TzZJI6D9JyePhcm1eP3YOn0z9sY3h59/ZdQrRdz1sp
   9Vq5B9Exwc6/0mnCbm2ZKX/flIzxT9wVfMJ1+ac5OVy1ZsL3UQEDzzhq9
   okcPyeF1P3RUFDkZf95Bxv7HtqRbfq6r7YDeSIDgsO18LW58gYmlnj39y
   eMv18kxwkyBqYBQ0mxXQr6hjqM7nkfLMUHT+fUfeSR5ZF+Ep5HZFX5SMX
   OOethgN1I1udqxHJ9IEWD5EApMgZo2/Ug3wX6BJg8QD8GVUU2yf9qhkod
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392767554"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="392767554"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 12:12:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="834754922"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="834754922"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 28 Nov 2023 12:12:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0EF69968; Tue, 28 Nov 2023 22:01:58 +0200 (EET)
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
Subject: [PATCH v3 04/22] pinctrl: equilibrium: Use temporary variable to hold pins
Date: Tue, 28 Nov 2023 21:56:53 +0200
Message-ID: <20231128200155.438722-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_121222_126231_8F9D8B88 
X-CRM114-Status: GOOD (  12.87  )
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
 drivers/pinctrl/pinctrl-equilibrium.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 54755b583d3f..fd59cfdeefac 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -704,7 +704,7 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 {
 	struct device *dev = drvdata->dev;
 	struct device_node *node = dev->of_node;
-	unsigned int *pinmux, pin_id, pinmux_id;
+	unsigned int *pins, *pinmux, pin_id, pinmux_id;
 	struct group_desc group;
 	struct device_node *np;
 	struct property *prop;
@@ -723,15 +723,14 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 		}
 		group.num_pins = err;
 		group.name = prop->value;
-		group.pins = devm_kcalloc(dev, group.num_pins,
-					  sizeof(*(group.pins)), GFP_KERNEL);
-		if (!group.pins) {
+		pins = devm_kcalloc(dev, group.num_pins, sizeof(*pins), GFP_KERNEL);
+		if (!pins) {
 			of_node_put(np);
 			return -ENOMEM;
 		}
+		group.pins = pins;
 
-		pinmux = devm_kcalloc(dev, group.num_pins, sizeof(*pinmux),
-				      GFP_KERNEL);
+		pinmux = devm_kcalloc(dev, group.num_pins, sizeof(*pinmux), GFP_KERNEL);
 		if (!pinmux) {
 			of_node_put(np);
 			return -ENOMEM;
@@ -750,7 +749,7 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 				of_node_put(np);
 				return -EINVAL;
 			}
-			group.pins[j] = pin_id;
+			pins[j] = pin_id;
 			if (of_property_read_u32_index(np, "pinmux", j, &pinmux_id)) {
 				dev_err(dev, "Group %s: Read intel pinmux id failed\n",
 					group.name);
-- 
2.43.0.rc1.1.gbec44491f096


