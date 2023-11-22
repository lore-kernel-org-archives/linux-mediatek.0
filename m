Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1366CC61D97
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytqtsK92HrXpTfDacc+6Vr7651YVUteABXDsTh3r7tw=; b=5Ad1SZUlxEaD25ToZv7Crc4tjc
	HE/oVsQ3KQMTAE6m2KnqNL+WOgAdB/kf+u2a/zksXWowhoO11b8zWx6bgqXqg1ft9EfuCD7HyQo5q
	Hv8/+YgZsn28DFrRq0PtdR/bc+mgmJlEPq3kFAQ1soEvjyYCmt4L8DVECcCsImEDmKyNhgyfsYlXt
	LKieIL5kI7PB872mZ16GXaOEAXKZqoNh93O6jq1cRRY45QgFbKKsKk4zjettwVuvLcipqPSBgGkXf
	5ksqoh3r/0Dk/pnfq+YIGQ08mt3pczyF/kR6AxQmmuuwD5gE0YDqrgxZvqtugBysjMLqaSP8pCYYv
	ZcKBUtvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qI1-002Wnf-2z;
	Wed, 22 Nov 2023 16:41:25 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qHq-002Wew-1u;
	Wed, 22 Nov 2023 16:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700671273; x=1732207273;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2IJ5RkmvKb06y4Pls/nYVezIgr9GrpPlE4qXI9p0tOg=;
  b=SGv9efCZ7RANbNLUei6R7Ydpl60IBu6pRn4IU12fYz7SgqQsnCXmB3dj
   7ydpIci54MguZaFBe/y5cpRjD0cvOyQcKtf+iqOx37ynFmCFNNazM+EKf
   LfyOP8y8QIMkvxpzbb6t02TDqBQ3tPPJwokLWXeCTYylQRFxi0YNfShma
   FgS2njVrMcLEPteqxtNG82aEFK9PVVk2cJgFAzwOKN6aBzdPikJkh7vUL
   uQiFKr9FI2/Dyxa/OcyVwtliYWXGOmQ8/efycuhu2nKHVRi4jMEplr4RM
   GO+8M67J2vu2CYhPOLR+vKe4/exPqOXG0gT+s6g7NSQpOUyr/+XzhgEmn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="456414337"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="456414337"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 08:41:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="884681649"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="884681649"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2023 08:41:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B90287E4; Wed, 22 Nov 2023 18:40:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
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
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v1 13/17] pinctrl: keembay: Convert to use grp member
Date: Wed, 22 Nov 2023 18:35:45 +0200
Message-ID: <20231122164040.2262742-14-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
References: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_084114_691978_0251748B 
X-CRM114-Status: GOOD (  13.80  )
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
 drivers/pinctrl/pinctrl-keembay.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 152c35bce8ec..ace61f8e8936 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -945,7 +945,7 @@ static int keembay_set_mux(struct pinctrl_dev *pctldev, unsigned int fun_sel,
 		return -EINVAL;
 
 	/* Change modes for pins in the selected group */
-	pin = *grp->pins;
+	pin = *grp->grp.pins;
 	pin_mode = *(u8 *)(func->data);
 
 	val = keembay_read_reg(kpc->base1 + KEEMBAY_GPIO_MODE, pin);
@@ -1528,12 +1528,11 @@ static int keembay_build_groups(struct keembay_pinctrl *kpc)
 	/* Each pin is categorised as one group */
 	for (i = 0; i < kpc->ngroups; i++) {
 		const struct pinctrl_pin_desc *pdesc = keembay_pins + i;
-		struct group_desc *kmb_grp = grp + i;
+		struct pingroup *pgrp = &grp[i].grp;
 
-		kmb_grp->name = pdesc->name;
-		kmb_grp->pins = (int *)&pdesc->number;
-		pinctrl_generic_add_group(kpc->pctrl, kmb_grp->name,
-					  kmb_grp->pins, 1, NULL);
+		pgrp->name = pdesc->name;
+		pgrp->pins = (int *)&pdesc->number;
+		pinctrl_generic_add_group(kpc->pctrl, pgrp->name, pgrp->pins, 1, NULL);
 	}
 
 	return 0;
-- 
2.43.0.rc1.1.gbec44491f096


