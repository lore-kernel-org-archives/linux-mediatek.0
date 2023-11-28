Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13993C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 20:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GowjPTZqE0Smv4YJ/cKzcAfCEv2JanCnDlRvdPyHm+A=; b=Wx692asJaGl6FkWbQxwk6DMSf+
	+pK0keBgTDTktklICZfvJVZwsQVp5Ewvd/hWX/igoAYzXKfGsmjlf9yzsTNlMrC/mRuvpZZY7yNFL
	XOi0ZCUkLeiakz1DIaWbinWDagR5OKMVma1d13VdTz4wWtKgl0t0PavTXKRM3Cn8db85d45/VYdJu
	cjCnZaOxy5eKgsrUjvMFWTmRlLg/neHPMZnTnSPmmg63+htWZTGDJ0MwBSvwZsM5pMlGt4SGJywi9
	tDHGAxeTtBiOMDwZoEnh3nW+hZtPFg0EDYESlTx+R72zxo2Nbt1ta/C8EAdxBwwkmboqdaSDKyVVh
	qRWx1skg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r84Lh-006Dht-3A;
	Tue, 28 Nov 2023 20:06:25 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r84Le-006Dgk-1o;
	Tue, 28 Nov 2023 20:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701201982; x=1732737982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zSzJJSBORuSF8Rt+BZ5mH8g+0I9DsPIRgct4EsYRglY=;
  b=mScvoEpbsDTKICS0lSgdY77ciMy4oXg2iWYH265K+0t1lIT4J6/OK6VS
   o6hIsGnZ+jyPllDJ2g22oUpiDCTo5iuT1lqWsFIhgSDrGeQpwZjuT0JQo
   A8adchNyZXLFCndG6BpGIBZyH24RmN4YxrGn1wigteJetmn+VdrsFAcnQ
   xsjvMgIDo6wq+7Rk5BlckxmO/3VJhcY/jRRhp30BRm28cpKS6LtounRw1
   ay90qJ8XS+ykKSOUiXW4L2Z1NMla4I7ml92cZi1fu/fZcD+1qdE9HG9gS
   Sju1GDxz5IYv50yS4YVDfQp0B3AfjI1yDmY9oJodC5/f2142syB629zFs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6218546"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="6218546"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 12:02:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="797688000"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="797688000"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 28 Nov 2023 12:02:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 07AA8C4F; Tue, 28 Nov 2023 22:01:59 +0200 (EET)
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
	Hal Feng <hal.feng@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH v3 21/22] pinctrl: starfive: Convert to use grp member
Date: Tue, 28 Nov 2023 21:57:10 +0200
Message-ID: <20231128200155.438722-22-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_120622_663977_30A071BB 
X-CRM114-Status: GOOD (  13.34  )
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

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 8 ++++----
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
index ea70b8c61679..21bfbbaede72 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
@@ -654,7 +654,7 @@ static int starfive_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	pinmux = group->data;
-	for (i = 0; i < group->num_pins; i++) {
+	for (i = 0; i < group->grp.npins; i++) {
 		u32 v = pinmux[i];
 		unsigned int gpio = starfive_pinmux_to_gpio(v);
 		u32 dout = starfive_pinmux_to_dout(v);
@@ -797,7 +797,7 @@ static int starfive_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (!group)
 		return -EINVAL;
 
-	return starfive_pinconf_get(pctldev, group->pins[0], config);
+	return starfive_pinconf_get(pctldev, group->grp.pins[0], config);
 }
 
 static int starfive_pinconf_group_set(struct pinctrl_dev *pctldev,
@@ -876,8 +876,8 @@ static int starfive_pinconf_group_set(struct pinctrl_dev *pctldev,
 		}
 	}
 
-	for (i = 0; i < group->num_pins; i++)
-		starfive_padctl_rmw(sfp, group->pins[i], mask, value);
+	for (i = 0; i < group->grp.npins; i++)
+		starfive_padctl_rmw(sfp, group->grp.pins[i], mask, value);
 
 	return 0;
 }
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
index 9d71e8c13310..60160965cd29 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
@@ -307,7 +307,7 @@ static int jh7110_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	pinmux = group->data;
-	for (i = 0; i < group->num_pins; i++) {
+	for (i = 0; i < group->grp.npins; i++) {
 		u32 v = pinmux[i];
 
 		if (info->jh7110_set_one_pin_mux)
@@ -437,7 +437,7 @@ static int jh7110_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (!group)
 		return -EINVAL;
 
-	return jh7110_pinconf_get(pctldev, group->pins[0], config);
+	return jh7110_pinconf_get(pctldev, group->grp.pins[0], config);
 }
 
 static int jh7110_pinconf_group_set(struct pinctrl_dev *pctldev,
@@ -508,8 +508,8 @@ static int jh7110_pinconf_group_set(struct pinctrl_dev *pctldev,
 		}
 	}
 
-	for (i = 0; i < group->num_pins; i++)
-		jh7110_padcfg_rmw(sfp, group->pins[i], mask, value);
+	for (i = 0; i < group->grp.npins; i++)
+		jh7110_padcfg_rmw(sfp, group->grp.pins[i], mask, value);
 
 	return 0;
 }
-- 
2.43.0.rc1.1.gbec44491f096


