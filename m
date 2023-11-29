Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE9DC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 16:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+h9fNAe+Kj+f6iiP3LcZzBKoYB534wEuEh4u8iQTkLc=; b=UBoc1DDLIcNrL0q0OPCv9R1qWW
	40ODn18BUSOlSKv7bM9REy9HxZdlcxU8gZXqaQKsYjdCJ6JjmXZmzaDgMlB5qVgyqD37C+wqJTrY+
	8MuLcrhMNmsdCzYGkoKIyrTBfFjKBr6vZ4p+Nn2G5ycNppq3LEY71NR3eICdmO37tWu4vTZvKdS7t
	3abLBjGmBVXI8hLO8XgFjgfuTjEyIGtndcypF2xsJxyWGrFg1J9wPYTuDM7b75JDTXtiDIOOw6Xrc
	ftgoxMdiRskNdiWo0clYxa4QIoaYZKQemtShEZcun7QLIA+GYy/XvZx+B0k/rb3OlZ8n4H6oAfU0B
	ncSsr6aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8NFT-008qy0-2X;
	Wed, 29 Nov 2023 16:17:15 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8NDo-008q3h-0N;
	Wed, 29 Nov 2023 16:15:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701274532; x=1732810532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PGY8MTlj1zxv8/c+SyAmL9CgRA2hWCcICDO7OAfEpv4=;
  b=gzJKoVV+3VLJ82dBGMl+YzsLb2Fpj7490GROkgIWWmnG5iQsg2jqjE8h
   kjy3zV+yWLSXQ1+EwJJH6Q37F2CbXm0lxKosP6Yp5WOiDSlS/FMC/KUHL
   KxRKZ5RiegemkxCoHg2jpnxOb3NliicypgQ9k7z02ji2dI/JNE5dWTyHn
   2Wr8WM1A/w/6+rUfz6N5Qjg/tJ8TGq9uXj/Gb1NfbMFFSnHs8cG3h0dQc
   ++Nu7dp25j8WCpWEua8GTpPm+mQPX+TOQhPIMf3d0TJYwIjoKBXmjRgJ7
   +KQkxPztE6xOXJOUGaCEkZ+Y3diD+DCPLa6HDAFLwVIAVFeLWZPSzFqGe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373372798"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="373372798"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:15:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="892498903"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="892498903"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 29 Nov 2023 08:15:21 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 17ACBB48; Wed, 29 Nov 2023 18:15:02 +0200 (EET)
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
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v4 15/23] pinctrl: equilibrium: Convert to use grp member
Date: Wed, 29 Nov 2023 18:06:38 +0200
Message-ID: <20231129161459.1002323-16-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_081532_205877_8DC8E5CA 
X-CRM114-Status: GOOD (  12.83  )
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
 drivers/pinctrl/pinctrl-equilibrium.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 4ebae516d1b1..6e1be38865c3 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -331,8 +331,8 @@ static int eqbr_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	pinmux = grp->data;
-	for (i = 0; i < grp->num_pins; i++)
-		eqbr_set_pin_mux(pctl, pinmux[i], grp->pins[i]);
+	for (i = 0; i < grp->grp.npins; i++)
+		eqbr_set_pin_mux(pctl, pinmux[i], grp->grp.pins[i]);
 
 	return 0;
 }
-- 
2.43.0.rc1.1.gbec44491f096


