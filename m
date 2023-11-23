Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26653C5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 19:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzbCptLRuu1GV53O4GULzqD/Pq+hy3/rRyRgiJFweEI=; b=Ulw2lg5hmA8KIlPqiF6f/j8DsV
	4irRydNai5OTCa8/9VxUxvSvefKP6cRBuCUbm4jXDGfEpSkakE2A8RmVMQ8BPPhziv1acfoOSNgNt
	iED6D8A75eMXl6tE/URb+Kr1tBrb4l3zC4VRhtrYUVbaeBMzFdwrcFaaZKStpGaDjaL7LcYJB6IxW
	vTqMZnsGKguvnT9Q/s0w0iBP7EXqJOK/jM/PbNOuG9pnwv33XPM0s9NMeQEaofSpNvT9jWGzFrLUm
	rN+K001vHqSBX5q09Xl+7vbYg2ir5JR5gfAzpVrgev5OhDZLkz7N2vOuBRGaICGlfSQd/d9oOng+3
	k/FqTwyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6FU4-005cZK-24;
	Thu, 23 Nov 2023 19:35:32 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6FT2-005bcN-0i;
	Thu, 23 Nov 2023 19:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700768068; x=1732304068;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7v2CAg5DroP23VK/yC7/YkMVF79slYQ+EVkLEfbZi+o=;
  b=ZDd4oTT7ffsO+VGwQ3qM/WVlplzpASJqYh/wMGWeieDUaFAkLMV9pTmd
   ESVojHvntSrHoktqbEe23INyukltibWwffryRlbntN5pixYmzPolIYYSx
   oBwPzfOA05YU7ScqsMJMBJRNRuH0bIOqP2cov2ForS4yJbnICP3VHwuJs
   ZcX8Xeg21bhOqXdlaZoSIBT0gnjDqBC8L04APIcFEA+O0PDFoHah4lI5C
   AeJzEBp7TxQSfkcQIi+Ryt1h3F+v5l1TItTveRRx4/2fNseouSDbbDT2a
   G9vaSJ9tqnjBZjQBP2XcmkLD8XW1btKduTuTJHcWXhWBoeM5/Z3ZmenWd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="371671543"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="371671543"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 11:34:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="771062272"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="771062272"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 23 Nov 2023 11:34:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A1209A7A; Thu, 23 Nov 2023 21:33:59 +0200 (EET)
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
Subject: [PATCH v2 20/21] pinctrl: starfive: Convert to use grp member
Date: Thu, 23 Nov 2023 21:31:48 +0200
Message-ID: <20231123193355.3400852-21-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
References: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_113428_311599_2C25DB3F 
X-CRM114-Status: GOOD (  13.01  )
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


