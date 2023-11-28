Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E2EC07E97
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 20:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSdgwu4Um0fPrArS43eyiDKxgk95EXRlAl/9yrQGGrA=; b=xUazC8zEUAoandSDKciuFfQLCp
	2t+7qXQzhrH8Ct1sF7LPWuyQodGIrciNmmyiYdDKrdbwk9eJO6hoWI+v/Zzw6CdCwKKF2C47IC4FR
	8Jgv5F8Hv0iDiov6JlUdGVg9zpFMoXgSiJ235uCmesTSQSG0PFGeuiZf/nP0Dyf1Bi0tb5HaSk1Fq
	bJZlaTpnEsuSwcwLIgXcZWg+7VjL7cZ6kg68yrIQtmUm2hBk8b2Dj1GV0FTp9Jb276vgkpDn6c4xk
	tPbJULJ/PyHns7XvgujWztrHKfR09ESKivv3AJ3iM72dUx4Y3SFDaR95b891Llp/siM/mYJo6eJpu
	/j4ZY7xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r84JI-006Cdx-2i;
	Tue, 28 Nov 2023 20:03:56 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r84JF-006Ccb-1a;
	Tue, 28 Nov 2023 20:03:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701201834; x=1732737834;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3uSEXFAfigJrZCoXVJ4ZtMtwaJ+4f5OEieqGUBtBbV0=;
  b=A+DIenp3GsG5ercT3CGJSnme2k869dgqlsbSmZ0kvumfBimspCybBhLY
   7oJuWykA4V1t4abl9JiNtpAZVBxOXCyHvUfZfr6/1YLSBZmBpDwqR+3rY
   NMHMA+DSLF27EQrzEXfj6zr6qFexVGtDwxtyxlPrq0g0RMikSc036JcpN
   ORubwSdOZACPwFfThPLs7NRMnUyhpkfRsM4W367FOn4qEoeBE/yf04Czo
   hdeChbgpd3LMDTZp9W+seQKNjJ0D5zXBwjPTU2DxD3HYixA8K3UwQoaN4
   inFC0pKwf43EGhuccxJ8LRCEju0NukeeMvdPg/PcPi48GERW2Lh0xmU0b
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6217554"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="6217554"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 12:02:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="797687918"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="797687918"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 28 Nov 2023 12:01:59 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id F27D879F; Tue, 28 Nov 2023 22:01:57 +0200 (EET)
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
Subject: [PATCH v3 03/22] pinctrl: equilibrium: Unshadow error code of of_property_count_u32_elems()
Date: Tue, 28 Nov 2023 21:56:52 +0200
Message-ID: <20231128200155.438722-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_120353_542664_96CBE11C 
X-CRM114-Status: GOOD (  13.28  )
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

of_property_count_u32_elems() might return an error code in some cases.
It's naturally better to assign what it's returned to the err variable
and supply the real code to the upper layer(s). Besides that, it's a
common practice to avoid assignments for the data in cases when we know
that the error condition happened. Refactor the code accordingly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 5b5ddf7e5d0e..54755b583d3f 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -715,12 +715,13 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 		if (!prop)
 			continue;
 
-		group.num_pins = of_property_count_u32_elems(np, "pins");
-		if (group.num_pins < 0) {
+		err = of_property_count_u32_elems(np, "pins");
+		if (err < 0) {
 			dev_err(dev, "No pins in the group: %s\n", prop->name);
 			of_node_put(np);
-			return -EINVAL;
+			return err;
 		}
+		group.num_pins = err;
 		group.name = prop->value;
 		group.pins = devm_kcalloc(dev, group.num_pins,
 					  sizeof(*(group.pins)), GFP_KERNEL);
-- 
2.43.0.rc1.1.gbec44491f096


