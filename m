Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CCBC61D85
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 19:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gauYIwgl2Vu7iNIyMHA7tBF5RnqpARB6Suyvu6qyhu4=; b=KlWDlPStfK5hqyUnXB6JIQYpfv
	t/TItdtnxa/llkJ2UnBZu9qY3S/CCrvsmiFAZbDpnQ9gKqJxqTuHKiEHXZxX/QvRYv6FS8gnuFmz1
	hEiGw7kF+FxtITMzrPqX4HYZvk0NahpIgKtS2rgDyCkUL0crbWNSanvpNyfhCxUTPz1M0ZaoSTq3H
	UDHCbvzePQnqgf/a9JZKZ96NqJ8F4zoXSQtabja51AeVV1ep7+/H4l41L1V654946ItJuuoKseFRb
	lHKry1fsV5Xd0tDm2PV1KHcaeEwGgv4If73+4ntOTUB3dxwgi40tHS71mU8aRU1jgc2sLowFzgXUf
	X6zOx5rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6FU9-005ceZ-1B;
	Thu, 23 Nov 2023 19:35:37 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6FT1-005bne-2C;
	Thu, 23 Nov 2023 19:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700768067; x=1732304067;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gV4qvzwrDTaHf4ixLMxBh2Hur2d7tzECkc7jI+eVgVw=;
  b=c+YQmTE42NHUqHsTcJd1/p40tBBGWXttiJ4qIuFgj3jBRz71Oua4Dda5
   IgJc11Ue5KgZffMHsc6CGgts4NdPbt/iMiKnRf8t3yudGF/q+jk2rBCJq
   yCPrTTBMpDt/MFjm0e3skVs+ynWbd2rQE3f9zNLY93xZ1NZGQLlECeRwU
   W1gMSZmTMC6uo7eQArDK3rRxabPz0cRz87YbQwRE73lXe7oYkZ6T3tazt
   FHi3FgqKLG76GbMrMbYktSxhigIPUd0EdgT7ZglDzdKGn5Nh9neL5xxcf
   3pPCe9PuGA/eFK/1NIdnDIIXWIulancRLGamuucOOK8Sf3O2AZZmVHHDS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="372482260"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="372482260"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 11:34:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833506177"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="833506177"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 23 Nov 2023 11:34:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9290AA0C; Thu, 23 Nov 2023 21:33:59 +0200 (EET)
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
Subject: [PATCH v2 19/21] pinctrl: renesas: Convert to use grp member
Date: Thu, 23 Nov 2023 21:31:47 +0200
Message-ID: <20231123193355.3400852-20-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
References: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_113427_794020_25A92C32 
X-CRM114-Status: GOOD (  13.19  )
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
 drivers/pinctrl/renesas/pinctrl-rza1.c  |  2 +-
 drivers/pinctrl/renesas/pinctrl-rza2.c  | 10 +++++-----
 drivers/pinctrl/renesas/pinctrl-rzg2l.c |  6 +++---
 drivers/pinctrl/renesas/pinctrl-rzv2m.c |  6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index ab334de89b69..b03f22c54ca8 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -1131,7 +1131,7 @@ static int rza1_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
 		return -EINVAL;
 
 	mux_confs = (struct rza1_mux_conf *)func->data;
-	for (i = 0; i < grp->num_pins; ++i) {
+	for (i = 0; i < grp->grp.npins; ++i) {
 		int ret;
 
 		ret = rza1_pin_mux_single(rza1_pctl, &mux_confs[i]);
diff --git a/drivers/pinctrl/renesas/pinctrl-rza2.c b/drivers/pinctrl/renesas/pinctrl-rza2.c
index 990b96d45967..af689d7c117f 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza2.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza2.c
@@ -447,15 +447,15 @@ static int rza2_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
 
 	psel_val = func->data;
 
-	for (i = 0; i < grp->num_pins; ++i) {
+	for (i = 0; i < grp->grp.npins; ++i) {
 		dev_dbg(priv->dev, "Setting P%c_%d to PSEL=%d\n",
-			port_names[RZA2_PIN_ID_TO_PORT(grp->pins[i])],
-			RZA2_PIN_ID_TO_PIN(grp->pins[i]),
+			port_names[RZA2_PIN_ID_TO_PORT(grp->grp.pins[i])],
+			RZA2_PIN_ID_TO_PIN(grp->grp.pins[i]),
 			psel_val[i]);
 		rza2_set_pin_function(
 			priv->base,
-			RZA2_PIN_ID_TO_PORT(grp->pins[i]),
-			RZA2_PIN_ID_TO_PIN(grp->pins[i]),
+			RZA2_PIN_ID_TO_PORT(grp->grp.pins[i]),
+			RZA2_PIN_ID_TO_PIN(grp->grp.pins[i]),
 			psel_val[i]);
 	}
 
diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 9de350ad7e7d..504e8716fc32 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -273,7 +273,7 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 	struct function_desc *func;
 	unsigned int i, *psel_val;
 	struct group_desc *group;
-	int *pins;
+	const int *pins;
 
 	func = pinmux_generic_get_function(pctldev, func_selector);
 	if (!func)
@@ -283,9 +283,9 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	psel_val = func->data;
-	pins = group->pins;
+	pins = group->grp.pins;
 
-	for (i = 0; i < group->num_pins; i++) {
+	for (i = 0; i < group->grp.npins; i++) {
 		unsigned int *pin_data = pctrl->desc.pins[pins[i]].drv_data;
 		u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
 		u32 pin = RZG2L_PIN_ID_TO_PIN(pins[i]);
diff --git a/drivers/pinctrl/renesas/pinctrl-rzv2m.c b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
index 21d7d5ac8c4a..eb66e306b8c8 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
@@ -165,7 +165,7 @@ static int rzv2m_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 	struct function_desc *func;
 	unsigned int i, *psel_val;
 	struct group_desc *group;
-	int *pins;
+	const int *pins;
 
 	func = pinmux_generic_get_function(pctldev, func_selector);
 	if (!func)
@@ -175,9 +175,9 @@ static int rzv2m_pinctrl_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	psel_val = func->data;
-	pins = group->pins;
+	pins = group->grp.pins;
 
-	for (i = 0; i < group->num_pins; i++) {
+	for (i = 0; i < group->grp.npins; i++) {
 		dev_dbg(pctrl->dev, "port:%u pin: %u PSEL:%u\n",
 			RZV2M_PIN_ID_TO_PORT(pins[i]), RZV2M_PIN_ID_TO_PIN(pins[i]),
 			psel_val[i]);
-- 
2.43.0.rc1.1.gbec44491f096


