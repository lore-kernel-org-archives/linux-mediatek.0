Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F41C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 19:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1OZZcXaUJrEug5ykRsYsdCHq/5OCKuul8E2dpi8fgs=; b=SDEP0nOEKrCGuls07BNATNwTxP
	YlI+o8zHnnAFOfHOKhARAkVvAl+CTkoXupk/uq2ChoqTEhF53AJgzWFWljhM4tfD2OyujfXaFtbrC
	oovsqkBp2YFVmNeLF/+kx/ZEK1dbDfJd9WznzACd58I6lWzFAMV4NvG9pe3NMGzZDK3WmLS5iUxXy
	bKAkjYlAx6PSLvflCuLYjZ+cNzjiHg/zo2wt+K0DfdhcBfNE3Jb86OUt30h5y53tNNuyRd/HbABIv
	MfFo611qILp0HXVQ+Ow3ysK8XDBKyHSiysjas6nKuXBkDGRMksR5SYXUJ6LqE9jRWBIVozcjzqE0s
	/Ez4cZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rClZf-007Hh4-1R;
	Mon, 11 Dec 2023 19:04:15 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rClZ8-007H6Y-2X;
	Mon, 11 Dec 2023 19:03:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702321422; x=1733857422;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dl5meZK/9OQqeSluMo8zI6v5kxMv/grswCooUcDxnbw=;
  b=NXRgSpkyx2F0cPn+2BmHh8F+I5NIHOZVRODrKsOFrU2Xo7xkmiqMybTU
   FfawCYknDybzSVPXR1P15WLo86AqiuwZ5w8TS1khFsnMuc8FShhLdaaL/
   +TJz6vN05jL7KkbQCGD/dMa7Fz1LXtmoQ5WP/nZY/HOCV59y2oEpLnhQd
   MsP8acjkuWUQXoPj9CFkrgnIxxu48p/qQlROqMLodo09icEdPtH69lc0U
   NV0oY1flHiOAPY626Xe8xMFko2QXFmXacnDe4LG8WSjx1JkP9otvCNFvR
   7n1XiGZFr1ETxQBdRbTZBzKXUdeB8pKiprvq64zArZIU2u1R0AC+GmSCA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="379692582"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="379692582"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 11:03:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="946445109"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="946445109"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 11 Dec 2023 11:03:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DF69A30D; Mon, 11 Dec 2023 21:03:23 +0200 (EET)
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
Subject: [PATCH v5 11/13] pinctrl: renesas: Convert to use grp member
Date: Mon, 11 Dec 2023 20:58:04 +0200
Message-ID: <20231211190321.307330-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
References: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_110343_149500_D5069F9A 
X-CRM114-Status: GOOD (  14.38  )
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/renesas/pinctrl-rza1.c  |  2 +-
 drivers/pinctrl/renesas/pinctrl-rza2.c  | 10 +++++-----
 drivers/pinctrl/renesas/pinctrl-rzg2l.c |  4 ++--
 drivers/pinctrl/renesas/pinctrl-rzv2m.c |  4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

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
index 68fcc2a4efbc..f01aa51b00c4 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
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
index eb304fab1796..0767a5ac23e0 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
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


