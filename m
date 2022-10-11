Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F287C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 09:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZCBQ9pRyGYGoN359eQ1u85NfaTIA0w7gUnTdClA8cE=; b=PToEmTZgocTgVbfMQD3SKXzxEK
	NnnvPoVYjAavDwiMuFTw1B8R5ZH56dkkgvs9RB9nEnBdvvGZunPt2E58Ho0mQ1J7p0wGiL2uiizW/
	JeE9ixc4P3YArpt4ZsNxq8oN0q5ybYKH9RQbpDMDYsSyIf/fFiRzXprdLS9ii47+Vel+UkPM5yKrf
	/sJzB1N/D2nvTreMPhrPSD32G11E7AZ8aPhAsk3CKqPC4q+FPOcqxPRBaKnwB0CKJX4tAkbiFJ7fx
	Wblch7lMJzab1rHpv9/fhXvMh+V3OrJ5m/agLaEg6mrPZN8Zk6tjQvsw2+MnkYCg/oQMgKOMgv4x/
	6pI3a0tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiBrw-003sl1-Sh; Tue, 11 Oct 2022 09:48:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiBrr-003sjL-Sb; Tue, 11 Oct 2022 09:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1665481689; x=1697017689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X7aXXVOlBHDkw90nWzBrfDp5Pw/UBVwOZTwSGqIfCIg=;
  b=U6QfSsrjr1fQF4sWRH62PuzV+OmW9RdBW9JB5gYUPvjNyq8hMwrrLKBM
   7OGaMfSy59OgFy+S7LEp6OrYjdZjRizDuE7n+Pd4i4MOerJ/P8ilGRRYm
   vTijO53WK3JzJIhdP7YJYWbnNkkrbj/VlC8cbotRpsS3kKWyQ8iNS9oCG
   KGmefOQNhBzSrKRRG+nFcgN5EOjW6gax+nTVY31JMVEY5za6/BBpY9r0P
   TZXir3dWoxsL4yZ8EWiiuvM/5T2unUN/35+BpEPP9uL4UY0Uc37l0DhtJ
   UyJPu+pEldn6tKWAihBiSpUmCyL8zQ56OCz2KdWvcSP3ahz5Nbmc6+xi4
   w==;
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="178123604"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Oct 2022 02:48:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 11 Oct 2022 02:47:59 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 11 Oct 2022 02:47:58 -0700
Date: Tue, 11 Oct 2022 11:52:33 +0200
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Kent
 Gibson" <warthog618@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Billy Tsai <billy_tsai@aspeedtech.com>, Thomas Gleixner <tglx@linutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>, Samuel Holland
	<samuel@sholland.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Phil Edworthy
	<phil.edworthy@renesas.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Fabien Dessenne
	<fabien.dessenne@foss.st.com>, Prathamesh Shete <pshete@nvidia.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, <linux-gpio@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linux-actions@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <linux-rpi-kernel@lists.infradead.org>,
	<alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
	<linux-mediatek@lists.infradead.org>, <linux-mips@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-omap@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-arm-msm@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam
	<mani@kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
	<joel@jms.id.au>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui
	<rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, Charles
 Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald
	<rf@opensource.cirrus.com>, Dong Aisheng <aisheng.dong@nxp.com>, "Fabio
 Estevam" <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai
	<ping.bai@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, "Andy
 Shevchenko" <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>, Andrew Lunn
	<andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, "Sebastian
 Hesselbarth" <sebastian.hesselbarth@gmail.com>, Avi Fishman
	<avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry
	<tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen
	<yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, "Ludovic
 Desroches" <ludovic.desroches@microchip.com>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Paul Cercueil
	<paul@crapouillou.net>, Damien Le Moal <damien.lemoal@wdc.com>, Tony Lindgren
	<tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Michal Simek <michal.simek@xilinx.com>, "Andy
 Gross" <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
	Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Viresh Kumar
	<vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	<soc@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, "Emil
 Renner Berthing" <kernel@esmil.dk>, Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v2 17/36] pinctrl: ocelot: Add missed header(s)
Message-ID: <20221011095233.jk2vypndisz2wgn6@soft-dev3-1.localhost>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-18-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221010201453.77401-18-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_024808_076402_300532C2 
X-CRM114-Status: GOOD (  12.87  )
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

The 10/10/2022 23:14, Andy Shevchenko wrote:
> 
> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.
> 
> While at it, sort headers alphabetically.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Acked-by: Horatiu Vultur <horatiu.vultur@microchip.com>

>  drivers/pinctrl/pinctrl-ocelot.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
> index 647e91490bac..a9343c242cd5 100644
> --- a/drivers/pinctrl/pinctrl-ocelot.c
> +++ b/drivers/pinctrl/pinctrl-ocelot.c
> @@ -13,15 +13,17 @@
>  #include <linux/of_device.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
> -#include <linux/pinctrl/pinctrl.h>
> -#include <linux/pinctrl/pinmux.h>
> -#include <linux/pinctrl/pinconf.h>
> -#include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
> 
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +
>  #include "core.h"
>  #include "pinconf.h"
>  #include "pinmux.h"
> --
> 2.35.1
> 

-- 
/Horatiu

