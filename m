Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFADC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 20:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dfqRnJBLpCtBPKOFVu1A2Kr68JaXCGbAM1c8IQgwtuI=; b=tcOpAWKX9gq1jV4CGCqQ44ldr7
	ia1pFAFipt8dwyMZsVg02inqUiO6u83SkICtR0WW3orrFCRZX8YXinMGzYQSx8ZvGy1zcfSRmj56O
	4816hfBJAKUivFCdqPSkQUmEzM6uQbE7tqu+EraZ88OwDfWmVQpctdQhF4lxfg8TRDHZv4cwxe/MI
	TXL9OhZ0LpoEMyD0D/3pGrgJ2UQLAUgDuDrljJQIHh8wDdQbqbjflJpbNFXPMEcgDjzmPuqvynVHP
	dPSa6vPj0obA/L0neY5z3w4ueeBTy/7CjF7Tbmkuy5MtuEoAsK/A4wLPO4bGDeOvLCOhVeLrw0hXJ
	O4SGfinQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r84JL-006CfH-0A;
	Tue, 28 Nov 2023 20:03:59 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r84JG-006Ccb-2n;
	Tue, 28 Nov 2023 20:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701201835; x=1732737835;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qqh2pcByd+e2zO9M4U/s3/66TY0T4He1j0iO/aoG8Gg=;
  b=UZ4wjiG18lPdvNmRoZxP0ppxh1AtPUpJ2EbHXMxhuV2OIclLpHGRk6XG
   gTEFVmkiJoZSheUHGmEU2G2JD0qMBDYFAqSnYSRkPuk5aY4NjpUwJyQaJ
   zK543yvYdXd+xa66Bpf/aRolZGzRZnMGqhTPdA9IQ1OkOFTNWmgjg6boA
   ZUjnACRLoRMVem/qnqRyb6EX9bDpEvDxzD1uHvWSMLFeZRKWIKKaoz6J3
   UghyOeaoYkc8KLFsO65RhgwgPqQFfDIB2NPTbuXb8O9FHYYcSTTOrj8VH
   6sZvO80bLjufeqn7dhrl+qhMhqrZbNpumm7oBF6pbL7sjGy9Zcek1G1Za
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6217544"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="6217544"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 12:02:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="797687914"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="797687914"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 28 Nov 2023 12:01:59 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C7DC423E; Tue, 28 Nov 2023 22:01:57 +0200 (EET)
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
Subject: [PATCH v3 00/22] pinctrl: Convert struct group_desc to use struct pingroup
Date: Tue, 28 Nov 2023 21:56:49 +0200
Message-ID: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_120354_922200_1C479EFF 
X-CRM114-Status: GOOD (  13.40  )
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

The struct group_desc has a lot of duplication with struct pingroup.
Deduplicate that by embeddind the latter in the former and convert
users.

Linus, assuming everything is fine, I can push this to my tree.
Or you can apply it (assumming all CIs and people are happy with
the series).

NB. It seems to me that GCC 7.x has an issue when compound literal
is being assigned to a constant object. I believe it's a false positive
(at least I can't reproduce this with recent GCC and LLVM and hence
I haven't touched the code in order to address this.

NB. This series contains previously sent patches for Qualcomm and
Nuovoton. Here the updated version for Qualcomm that splits previous
patch to two and fixes compilation warnings.

NB. The function_desc is in plan to follow the similar deduplication.

In v3:
- fixed reported bug in equilibrium code (LKP)
- collected tags (Emil, Florian, Paul)

v2: https://lore.kernel.org/r/20231123193355.3400852-1-andriy.shevchenko@linux.intel.com

In v2:
- added a few patches to fix multiple compile-time errors (LKP)
- added tag (Jonathan)

v1: https://lore.kernel.org/r/20231122164040.2262742-1-andriy.shevchenko@linux.intel.com

Andy Shevchenko (22):
  pinctrl: qcom: lpass-lpi: Replace kernel.h with what is being used
  pinctrl: qcom: lpass-lpi: Remove unused member in struct lpi_pingroup
  pinctrl: equilibrium: Unshadow error code of
    of_property_count_u32_elems()
  pinctrl: equilibrium: Use temporary variable to hold pins
  pinctrl: imx: Use temporary variable to hold pins
  pinctrl: core: Make pins const in struct group_desc
  pinctrl: equilibrium: Convert to use struct pingroup
  pinctrl: keembay: Convert to use struct pingroup
  pinctrl: nuvoton: Convert to use struct pingroup and
    PINCTRL_PINGROUP()
  pinctrl: core: Add a convenient define PINCTRL_GROUP_DESC()
  pinctrl: ingenic: Make use of PINCTRL_GROUP_DESC()
  pinctrl: mediatek: Make use of PINCTRL_GROUP_DESC()
  pinctrl: core: Embed struct pingroup into struct group_desc
  pinctrl: bcm: Convert to use grp member
  pinctrl: equilibrium: Convert to use grp member
  pinctrl: imx: Convert to use grp member
  pinctrl: ingenic: Convert to use grp member
  pinctrl: keembay: Convert to use grp member
  pinctrl: mediatek: Convert to use grp member
  pinctrl: renesas: Convert to use grp member
  pinctrl: starfive: Convert to use grp member
  pinctrl: core: Remove unused members from struct group_desc

 drivers/pinctrl/bcm/pinctrl-ns.c              |  4 +-
 drivers/pinctrl/core.c                        | 13 +++---
 drivers/pinctrl/core.h                        | 19 +++++---
 drivers/pinctrl/freescale/pinctrl-imx.c       | 44 +++++++++----------
 drivers/pinctrl/mediatek/pinctrl-moore.c      | 13 +++---
 drivers/pinctrl/mediatek/pinctrl-moore.h      |  7 +--
 drivers/pinctrl/mediatek/pinctrl-paris.h      |  7 +--
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c     |  9 ++--
 drivers/pinctrl/pinctrl-equilibrium.c         | 42 +++++++++---------
 drivers/pinctrl/pinctrl-ingenic.c             | 27 +++++-------
 drivers/pinctrl/pinctrl-keembay.c             |  6 +--
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.h      |  6 +--
 .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   | 16 -------
 .../pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 20 ---------
 .../pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   | 20 ---------
 .../pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 15 -------
 .../pinctrl/qcom/pinctrl-sm8350-lpass-lpi.c   | 16 -------
 .../pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 24 ----------
 .../pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 24 ----------
 .../pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 24 ----------
 drivers/pinctrl/renesas/pinctrl-rza1.c        |  2 +-
 drivers/pinctrl/renesas/pinctrl-rza2.c        | 10 ++---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  6 +--
 drivers/pinctrl/renesas/pinctrl-rzv2m.c       |  6 +--
 .../starfive/pinctrl-starfive-jh7100.c        |  8 ++--
 .../starfive/pinctrl-starfive-jh7110.c        |  8 ++--
 26 files changed, 108 insertions(+), 288 deletions(-)

-- 
2.43.0.rc1.1.gbec44491f096


