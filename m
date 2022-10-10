Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE9BC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 20:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vuTwOsXum/HH21TqZAERNh7Vwe2qq0rvXZxcwkpqIRM=; b=pkyLpx33nv/pZGZJdH+PMI20NT
	C99fELUawnfYa1VORAkJZuQIahG26YSmatOfCe49LVYntz5IG6d+/is2ECODDvGNdoxO0btjn7R0n
	fPNcT1i6sJpOc5UrcOmpcroJ6wrAfVB5ayEGizXJczrQXgM/hC2t3P1L2/4eXNbGza4mo/QWHPHTq
	yRXHy7sa9we0EEtKr6fXYsvnhzDmxYnrcYjQ+4b4Gh4hVpA9WX3dfEytERetpTNTlIyQ6ELY7DPRM
	2Bi6ITDhIeuwFH/+mBVWcL9Kehg9Xe5Hd4gEy3tOoUnRKtQ25uzvRZYIpp7S2W+JPyU07XnQn8ayP
	d8gHhVkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohzDT-0024mt-Ph; Mon, 10 Oct 2022 20:17:35 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohzBS-00236l-Cs; Mon, 10 Oct 2022 20:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665432930; x=1696968930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yllurymkr/5yq2OEGIe+P3xaBffcWvgrsbGDtoshOgQ=;
  b=GVTHQRms0wiRwSkOUzKMhAQpcX+Ikok3zGHIVCz1aZ3NwZIOaVWB4vt3
   eopb+UC0bpOgvFJ7ue5o5w7ap084y6EHMnJrl5Cwlgqoheg8QvD3TYi0/
   +GUld3DAiS1ccQiA+HmYTIPBMnng8neH2ZvxdGOgZwJyFQPCcDshYGU2+
   CXjWs4PgdD8LazPDJFLH8p6nIyiKSt4eqQrj3tnrHHwykyia2WKJK2HME
   ICyEwcs1KYmiVYFpujvtjcht+XE4nD2aSPMNkJYVpzBR8ySMViwSJ7G2g
   J1v8hxosAW/za93K36qS/sakKhI/WFz2emqsCiQw08GFLnkr0yvYyyC5b
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="305949416"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="305949416"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 13:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="603862909"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="603862909"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 10 Oct 2022 13:15:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1FE815F9; Mon, 10 Oct 2022 23:15:13 +0300 (EEST)
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
Subject: [PATCH v2 14/36] pinctrl: mediatek: Add missed header(s)
Date: Mon, 10 Oct 2022 23:14:30 +0300
Message-Id: <20221010201453.77401-15-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_131530_595099_B8480A90 
X-CRM114-Status: GOOD (  10.59  )
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

Do not imply that some of the generic headers may be always included.
Instead, include explicitly what we are direct user of.

While at it, sort headers alphabetically.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c | 3 +++
 drivers/pinctrl/mediatek/pinctrl-paris.c | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 526faaebaf77..9474ada5addb 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -9,6 +9,9 @@
  */
 
 #include <linux/gpio/driver.h>
+
+#include <linux/pinctrl/consumer.h>
+
 #include "pinctrl-moore.h"
 
 #define PINCTRL_PINCTRL_DEV		KBUILD_MODNAME
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 74517e810958..475f4172d508 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -11,7 +11,12 @@
 
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
+#include <linux/seq_file.h>
+
+#include <linux/pinctrl/consumer.h>
+
 #include <dt-bindings/pinctrl/mt65xx.h>
+
 #include "pinctrl-paris.h"
 
 #define PINCTRL_PINCTRL_DEV	KBUILD_MODNAME
-- 
2.35.1


