Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91FBC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 20:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPuhUdOjAWJEaCRyfNF1IlapG251gNSYm96EGdpOvEA=; b=sGQXJX9qMUFmvW0PKKa+jbhdAW
	LVYwmFkPNZW9QNGz4VjYiAiXHS7banMCeRwjd0WP5s2YYmY2S0BD/Jc0qvhGDy+naUfMI1weDzynu
	MZjecoZqAG7yA5AEvN1gFULfVhRYKTaUUHKUOc+vjuykgYUAxZbvMmTLfYH2Ap/nRfuozS5uiDN8S
	0KyDTqV01fBeG6bXChLaGvS5O38ykpofKWTeptTxyqSa+33GyMVjcHX8zfJ4tHRm1Lub56Ti60IUk
	ESfVhutAP6GyOo/q2X4SnF3TDWqkjjs3PKdCPyFl4K5OPp1UVw2cetRug0P5NjXuIax1qg+ISs0SU
	lFU0WJ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r84K0-006D2M-11;
	Tue, 28 Nov 2023 20:04:40 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r84Jg-006Cp4-0Y;
	Tue, 28 Nov 2023 20:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701201860; x=1732737860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mX8nkFa+pUFM3JtjtNpLHJ2j2h/kDkAZjOuxZ+/LWq0=;
  b=CeHJs2lUOEP3BLLdOa7ukgUwjOeZDEA3O/FNNg3J5BGs8hoy3s7mjbs/
   77ovvMeNjoo9EdErdYEN6LfruFF+GZOfCRCU9iCM88GSzXpxtSj1siRxI
   8WgcLonFJcq8CPfRaQRVmDTs6uI6970YAZgH0UcjRXNLehft2ojoCZ3IW
   p158NTRMHIqazVl8I+0QHChHY7NEWGn8AmpdzH38vWe5j2F8J6eTOYTSS
   9PUsFgD/Nab5vbxvDTU3h8GEyODkav1csJfCW2fvqt9/Ic61r2wYbKBD5
   dFwEGq8FjsPLnb7xloadtsxwoQEvDunkyQzaDevpXLPWtYNTOABjguepK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6217748"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="6217748"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 12:02:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="797687945"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="797687945"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 28 Nov 2023 12:02:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 420E1A94; Tue, 28 Nov 2023 22:01:58 +0200 (EET)
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
Subject: [PATCH v3 08/22] pinctrl: keembay: Convert to use struct pingroup
Date: Tue, 28 Nov 2023 21:56:57 +0200
Message-ID: <20231128200155.438722-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_120420_233302_52B91CDE 
X-CRM114-Status: GOOD (  13.50  )
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

The pin control header provides struct pingroup.
Utilize it instead of open coded variants in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-keembay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 152c35bce8ec..87d328853ae4 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1517,7 +1517,7 @@ static int keembay_gpiochip_probe(struct keembay_pinctrl *kpc,
 
 static int keembay_build_groups(struct keembay_pinctrl *kpc)
 {
-	struct group_desc *grp;
+	struct pingroup *grp;
 	unsigned int i;
 
 	kpc->ngroups = kpc->npins;
@@ -1528,7 +1528,7 @@ static int keembay_build_groups(struct keembay_pinctrl *kpc)
 	/* Each pin is categorised as one group */
 	for (i = 0; i < kpc->ngroups; i++) {
 		const struct pinctrl_pin_desc *pdesc = keembay_pins + i;
-		struct group_desc *kmb_grp = grp + i;
+		struct pingroup *kmb_grp = grp + i;
 
 		kmb_grp->name = pdesc->name;
 		kmb_grp->pins = (int *)&pdesc->number;
-- 
2.43.0.rc1.1.gbec44491f096


