Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A281C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 20:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3sI1a23Ta/vfF+Bhk70CJTtJGC0SWBvIvafddMjqE5w=; b=Dc2HaKLZgthG/+uGqWmsdo+Ibj
	stoBI+OujLEBtCvYO0O0tv3OEGUR4ie1XaQtu8SxD9PoSB5oAGcyND+G7/JRSDuxF96CaDnYKSDeE
	Y0GD2PQnV6RNBHtI6iorbVP+fSozxefYDBDTpAcb+xeEr/kSyXG27d7MlqSHNsrkwiG/w5RBFMmYo
	9aYp5lBNoSRV0mb2tffzdz71hchysD1ZFs3ti9M12cQ1n+MXaBvHdQepkmZ5Wua/EbhsLsjcOC9Ee
	HxrHqBYER8SjYENI99qnExqNNIRVOrjMRzI4jVsKdBOYzQfeekDlj6R4WDpG/AEDPXUnOTr7i2nxk
	ncvQGXcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohzB7-0022uU-9K; Mon, 10 Oct 2022 20:15:09 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohzB0-0022qP-SM; Mon, 10 Oct 2022 20:15:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665432902; x=1696968902;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hoHtp7ua/tOZfAXpLOK1gBSb/sEyQkWFQ6Xh4kF5nfY=;
  b=Bl/nRQfOkqTV59RJ7pqaDYg363oyHCUGvOxwBpuCqCjIoc5PdqSCNMEN
   RhWYe7bcbj3R1na7R3l5gVkCQ4uCxeykNUanmFTsfirbboLA+RzORGU7Q
   AEPYaYUqFG82fEKZ2eVVl9UMhC4+k0lgJx6SmO8Wufwznrx2AmoeegDmb
   ZUgRqE+HXasLn9h3jR1+QAtHUrockOTOac0Sd085kq9p8eumGPgPtYcl8
   plnk8O6T4fIHgaFUtugY2DS7nol/m3qQ9vpGkWXQfR3QeBiJ+DVQGcjSC
   1VORa8siBhMqCYQGLi7tHaXcJqQVeHV/sSYI8wgEVSEN5W4NX8CkBt4Ye
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="301936313"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="301936313"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 13:14:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="603862730"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="603862730"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 10 Oct 2022 13:14:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8E95D1C8; Mon, 10 Oct 2022 23:15:08 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marc Zyngier <maz@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Kent Gibson <warthog618@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Samuel Holland <samuel@sholland.org>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Prathamesh Shete <pshete@nvidia.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-actions@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: [rft, PATCH v2 00/36] pinctrl: Clean up and add missed headers
Date: Mon, 10 Oct 2022 23:14:16 +0300
Message-Id: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_131502_958045_2ADA9FDE 
X-CRM114-Status: GOOD (  14.37  )
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

Currently the header inclusion inside the pinctrl headers seems more arbitrary
than logical. This series is basically out of two parts:
- add missed headers to the pin control drivers / users
- clean up the headers of pin control subsystem

The idea is to have this series to be pulled after -rc1 by the GPIO and
pin control subsystems, so all new drivers will utilize cleaned up headers
of the pin control.

Please, review and comment.

Changelog v2:
- added preparatory patches: all, but last (LKP)
- added missed forward declaration to the last patch (LKP)

Andy Shevchenko (36):
  gpiolib: tegra186: Add missed header(s)
  gpiolib: cdev: Add missed header(s)
  media: c8sectpfe: Add missed header(s)
  pinctrl: actions: Add missed header(s)
  pinctrl: aspeed: Add missed header(s)
  pinctrl: at91: Add missed header(s)
  pinctrl: axp209: Add missed header(s)
  pinctrl: bcm: Add missed header(s)
  pinctrl: cygnus-mux: Add missed header(s)
  pinctrl: imx: Add missed header(s)
  pinctrl: ingenic: Add missed header(s)
  pinctrl: k210: Add missed header(s)
  pinctrl: lochnagar: Add missed header(s)
  pinctrl: mediatek: Add missed header(s)
  pinctrl: mvebu: Add missed header(s)
  pinctrl: npcm7xx: Add missed header(s)
  pinctrl: ocelot: Add missed header(s)
  pinctrl: qcom: Add missed header(s)
  pinctrl: renesas: Add missed header(s)
  pinctrl: samsung: Add missed header(s)
  pinctrl: single: Add missed header(s)
  pinctrl: spear: Add missed header(s)
  pinctrl: sprd: Add missed header(s)
  pinctrl: st: Add missed header(s)
  pinctrl: starfive: Add missed header(s)
  pinctrl: stm32: Add missed header(s)
  pinctrl: stmfx: Add missed header(s)
  pinctrl: tegra: Add missed header(s)
  pinctrl: ti-iodelay: Add missed header(s)
  pinctrl: uniphier: Add missed header(s)
  pinctrl: zynqmp: Add missed header(s)
  pinctrl: cherryview: Add missed header(s)
  pinctrl: lynxpoint: Add missed header(s)
  pinctrl: merrifield: Add missed header(s)
  pinctrl: intel: Add missed header(s)
  pinctrl: Clean up headers

 drivers/gpio/gpio-tegra186.c                  |  3 +-
 drivers/gpio/gpiolib-cdev.c                   |  6 ++--
 .../st/sti/c8sectpfe/c8sectpfe-core.c         |  8 +++--
 drivers/pinctrl/actions/pinctrl-owl.c         | 10 +++---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c       |  1 +
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c        | 13 +++++---
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c      |  9 ++++--
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c      | 12 ++++---
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c         |  8 +++--
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c         |  8 +++--
 drivers/pinctrl/cirrus/pinctrl-lochnagar.c    |  6 ++--
 drivers/pinctrl/core.c                        | 19 ++++++------
 drivers/pinctrl/core.h                        | 12 ++++++-
 drivers/pinctrl/devicetree.h                  |  6 ++++
 drivers/pinctrl/freescale/pinctrl-imx.c       |  8 +++--
 drivers/pinctrl/intel/pinctrl-cherryview.c    |  6 ++--
 drivers/pinctrl/intel/pinctrl-intel.c         |  6 ++--
 drivers/pinctrl/intel/pinctrl-lynxpoint.c     |  6 ++--
 drivers/pinctrl/intel/pinctrl-merrifield.c    |  4 ++-
 drivers/pinctrl/mediatek/pinctrl-moore.c      |  3 ++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  5 +++
 drivers/pinctrl/mvebu/pinctrl-mvebu.c         | 14 +++++----
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c     | 11 ++++---
 drivers/pinctrl/pinconf.h                     | 10 ++++++
 drivers/pinctrl/pinctrl-at91-pio4.c           | 10 ++++--
 drivers/pinctrl/pinctrl-at91.c                | 16 +++++-----
 drivers/pinctrl/pinctrl-axp209.c              |  8 +++--
 drivers/pinctrl/pinctrl-ingenic.c             | 10 +++---
 drivers/pinctrl/pinctrl-k210.c                | 12 ++++---
 drivers/pinctrl/pinctrl-ocelot.c              | 10 +++---
 drivers/pinctrl/pinctrl-single.c              |  5 ++-
 drivers/pinctrl/pinctrl-st.c                  | 21 ++++++++-----
 drivers/pinctrl/pinctrl-stmfx.c               |  2 ++
 drivers/pinctrl/pinctrl-utils.h               |  5 +++
 drivers/pinctrl/pinctrl-zynqmp.c              |  4 ++-
 drivers/pinctrl/pinmux.c                      | 17 +++++-----
 drivers/pinctrl/pinmux.h                      | 11 +++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      |  8 +++--
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c       |  8 +++--
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  7 +++--
 drivers/pinctrl/renesas/pinctrl-rzv2m.c       |  4 ++-
 drivers/pinctrl/renesas/pinctrl.c             |  8 +++--
 drivers/pinctrl/samsung/pinctrl-samsung.c     | 11 ++++---
 drivers/pinctrl/spear/pinctrl-spear.c         |  6 ++--
 drivers/pinctrl/sprd/pinctrl-sprd.c           |  6 ++--
 .../starfive/pinctrl-starfive-jh7100.c        |  2 ++
 drivers/pinctrl/stm32/pinctrl-stm32.c         | 16 +++++-----
 drivers/pinctrl/tegra/pinctrl-tegra.c         |  6 ++--
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c       |  8 +++--
 .../pinctrl/uniphier/pinctrl-uniphier-core.c  |  8 +++--
 include/linux/pinctrl/consumer.h              | 31 +++++++++----------
 include/linux/pinctrl/devinfo.h               |  6 ++--
 include/linux/pinctrl/machine.h               |  8 +++--
 include/linux/pinctrl/pinconf-generic.h       | 23 ++++++++------
 include/linux/pinctrl/pinctrl.h               | 18 +++++------
 include/linux/pinctrl/pinmux.h                |  5 ++-
 56 files changed, 328 insertions(+), 186 deletions(-)


base-commit: 9d157c89c5569f0ef560b7a5b2d7bf59ae98499c
-- 
2.35.1


