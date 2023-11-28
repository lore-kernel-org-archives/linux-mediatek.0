Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9B1C07CA9
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 20:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQT0T6WFk4RchgUW8R7M88uDT0L5ZWJs2n4aaV0f1Pw=; b=ObJZxj5gI32DLNg6eVY/frBVUm
	kBLIBug+0lmnakGk1D9binY7vwYlv4FCrwofStAfopr+MPAgJxQtCOxrudQLQSQl92B3TbzYl72mw
	qpjQS3T3T7gBcaHuvqtRmRqtTvmhkhy7PJvL6qIGbdB0tZMfftfXUs+06g/PVN1gE5sOG0mLvwsag
	5aTocaqOsmrTQpQiuU0fvRc+Ydzi7q016eOL2Y9EpOzvgjNu5fLrGOBfrGGkUuTQYAIosDT02mcY6
	nt/K/aBaM7Wpgh21XrjILIuaVshTpPVSwdRH/bovWjEQH0ukAWfvyFrBT6zGRCb7mNibpUm7CKr7J
	EV9dT37Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r84JZ-006Cm1-2W;
	Tue, 28 Nov 2023 20:04:13 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r84JT-006Ci2-1E;
	Tue, 28 Nov 2023 20:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701201847; x=1732737847;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3i/qNugva+8rE/EMw94820KaaNfJNx5Amurjj3c6AyU=;
  b=XceizemGHYI0M7oOW3K0iU51caYPeb5ozKem1szudCDbNhw06V2pXzey
   Hrk8E0x1zGjXVpzmbv5susNdbrz/kiUMdN9rxX12JePHYCWm4tHG2FgO3
   B+VLi8isrT478qA+uijngUQKISQZBzic9HeR5R5Do06HM3Gnir5btxEJx
   LUNOI9Q2NK6cmDSaHbQNHWgbw0PIEwozDPG+mKulGukAO6kGlHnGWZEo/
   qehnlN/UNwt1NFp6sTXpxtgwMOpZ2htZscLVRrfxMVamTi5XuoeXTfMXt
   gITsl5VcjI4NP8Q2yUBN5Nsjo4Q9g/StGNEOKbuQgJuQ9KvKwZstaGKnI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="457345579"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="457345579"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 12:02:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="772420459"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="772420459"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 28 Nov 2023 12:02:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9678DB11; Tue, 28 Nov 2023 22:01:58 +0200 (EET)
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
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [PATCH v3 14/22] pinctrl: bcm: Convert to use grp member
Date: Tue, 28 Nov 2023 21:57:03 +0200
Message-ID: <20231128200155.438722-15-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_120407_523160_0168984C 
X-CRM114-Status: GOOD (  12.15  )
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

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/bcm/pinctrl-ns.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns.c b/drivers/pinctrl/bcm/pinctrl-ns.c
index d099a7f25f64..6bb2b461950b 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns.c
@@ -171,8 +171,8 @@ static int ns_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev,
 	if (!group)
 		return -EINVAL;
 
-	for (i = 0; i < group->num_pins; i++)
-		unset |= BIT(group->pins[i]);
+	for (i = 0; i < group->grp.npins; i++)
+		unset |= BIT(group->grp.pins[i]);
 
 	tmp = readl(ns_pinctrl->base);
 	tmp &= ~unset;
-- 
2.43.0.rc1.1.gbec44491f096


