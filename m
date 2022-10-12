Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20543C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 09:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Cc:To:Subject:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+g0+ssYTgL3cZkE5/H6taOX78xERs3DGn3pyH5uewU=; b=EaWCX+mF9TKzEoFkmQEXKOIU41
	a/cZH8MRBjuffuBWeHFLtF4UVh23rDuCwReTZxX8xpkwn6c9ELVJ/Dza/QUuezuwAbLDFZqNPOrY2
	OyV8XcskJ/ZgC+4jgPJa4QNgW/uRPMAwgCNmT9pgyvFg/7D+G3XqmWlnGJS67YR0LY5RNjWlfr7Ef
	EEI8aAi5YRhPKzitSaqLVmJ3TeAgxckFHI6GM5Pnyujedd37uGD8OYK9l1Jh7dlOlteuM+boIkjC5
	8zxbYJblndWjGSRusXJuGrq/acUN8s+q3RvVJtsyfbmcPJyaOZy4JeXBRrN5dfYJKIg3d87XIJWwy
	7wcKZUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiXqa-007ULh-NH; Wed, 12 Oct 2022 09:16:16 +0000
Received: from aposti.net ([89.234.176.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiXqQ-007UJu-Sr; Wed, 12 Oct 2022 09:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1665566157; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s+g0+ssYTgL3cZkE5/H6taOX78xERs3DGn3pyH5uewU=;
	b=q1TTDkSv+2wywK6AIXiGaOkH7iZ2YU3VEKYOBAZiyQM7JBPfmc8c6P2ZhHrYUGYo8pdYOS
	dts7t4kZKIQ9e1u3iLHUzQuRMcbtwmO5Z8KpYm4wJCUKd79SLah8Tf9+RyDQWaVWq5AUrm
	d0C/wxgx1Yk/JFU/GDZxLIKL5vEmKNw=
Date: Wed, 12 Oct 2022 10:15:29 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 11/36] pinctrl: ingenic: Add missed header(s)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Kent Gibson <warthog618@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>, Thomas Gleixner
	<tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>, Samuel Holland
	<samuel@sholland.org>, Horatiu Vultur <horatiu.vultur@microchip.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>, Bjorn Andersson
	<bjorn.andersson@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Phil Edworthy
	<phil.edworthy@renesas.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Fabien Dessenne
	<fabien.dessenne@foss.st.com>, Prathamesh Shete <pshete@nvidia.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-actions@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
	Andreas =?iso-8859-1?q?F=E4rber?= <afaerber@suse.de>, Manivannan Sadhasivam
	<mani@kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
	<joel@jms.id.au>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui
	<rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald
	<rf@opensource.cirrus.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>, Andy Shevchenko <andy@kernel.org>,
	Sean Wang <sean.wang@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Damien Le Moal
	<damien.lemoal@wdc.com>, Tony Lindgren <tony@atomide.com>, Haojian Zhuang
	<haojian.zhuang@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Michal Simek
	<michal.simek@xilinx.com>, Andy Gross <agross@kernel.org>, Konrad Dybcio
	<konrad.dybcio@somainline.org>, Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim
	<shiraz.linux.kernel@gmail.com>, soc@kernel.org, Orson Zhai
	<orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu
	<mhiramat@kernel.org>
Message-Id: <T1VMJR.YAQIRYFT8EC22@crapouillou.net>
In-Reply-To: <20221010201453.77401-12-andriy.shevchenko@linux.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
	<20221010201453.77401-12-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_021607_113545_6744733F 
X-CRM114-Status: GOOD (  11.59  )
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



Le lun., oct. 10 2022 at 23:14:27 +0300, Andy Shevchenko=20
<andriy.shevchenko@linux.intel.com> a =E9crit :
> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.
>=20
> While at it, sort headers alphabetically.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  drivers/pinctrl/pinctrl-ingenic.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c=20
> b/drivers/pinctrl/pinctrl-ingenic.c
> index 7e732076dedf..dbc25a60fbff 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -14,16 +14,18 @@
>  #include <linux/kernel.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/of.h>
> -#include <linux/pinctrl/pinctrl.h>
> -#include <linux/pinctrl/pinmux.h>
> -#include <linux/pinctrl/pinconf.h>
> -#include <linux/pinctrl/pinconf-generic.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>=20
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
>=20



