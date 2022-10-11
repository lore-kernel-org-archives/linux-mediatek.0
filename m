Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCA1C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 08:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RG7je/SPkrUeGbyJflxBun3+ZBOYqWehWXWhY9Ywba0=; b=PXrhGya/LTwFLX54xc2AZdsxF7
	pztjUtgh86rPYpbObw2UnwEwBPzDZoL76sfIjMvP76cbbwSA3AusNEvPHA5Emx5Yyk5dHwyPf+j0h
	wVDbJhI0r/fUFzrfRsqh83EPlvTL5wFXWcRNuA1Z30lNk9WqmPQ5jQQ3lhpA4DU1sqvZePO56atIc
	dJ3LNSUxEwznOkrDxST424j3Cv009EpUDVry5i9+vQ9kLMO0uUH9tGmrL76RLWAq9ddWm+pwCvmzY
	f5tKeqAnbY+u4xoAu1lg7VGAnA0Wqq3vpnqVXHuvirImW48ri/RWRNAYNBtxrDX2QUKeBssqiZVMw
	xdCBWCRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiAua-003lRp-SH; Tue, 11 Oct 2022 08:46:52 +0000
Received: from mail-qv1-f44.google.com ([209.85.219.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiAuW-003lQR-Rk; Tue, 11 Oct 2022 08:46:50 +0000
Received: by mail-qv1-f44.google.com with SMTP id de14so8546738qvb.5;
        Tue, 11 Oct 2022 01:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RG7je/SPkrUeGbyJflxBun3+ZBOYqWehWXWhY9Ywba0=;
        b=gT3lHliTE5GrKiqC3uEgSy7evr/7mRWpGq6pscwDtGi1ivLrGFRKCMsQVTG2WXgSJr
         wx+oDShRzKLtIAFQ/y/7a8eaRiSxBoUgUmBy2OJhwaTFS2qk1cowsraM0EzzP5e3DvKZ
         sYYJHmcAk0D6gvCEc27qZWMXyqV3Kp2yDbCkz4Y+aj4VvFfU97x5NDCP6vb4q3bAQet3
         spcL+kydxjHMGQlCU22pTYB9HdK2IvZ8U1Gw10oRjMvxHyDPxGDC/gnzoMeViyZWDkoe
         J9CPcS0KE9RQ1GQm7+TlxYb8kMv8MoQ4vJTJgpCyMyTLHl0D1Sxt7wXRlhlR+gsumZAZ
         ecRw==
X-Gm-Message-State: ACrzQf2YS83raYZlVTZ1LfpcLdFWP5uiPTeIQU/r/PqhJXWQY4RnYYSz
	MEP8T1ohwko+XurptXp942wQReq7ivlEtw3+
X-Google-Smtp-Source: AMsMyM4RzVSj/J9m5p35es9nzDWH+P/Qu6tAHVZ86D2OizVsX6loOiuKVnnXAkPnJYH5346lwCalYA==
X-Received: by 2002:ad4:5be6:0:b0:4b3:ff39:7ad4 with SMTP id k6-20020ad45be6000000b004b3ff397ad4mr7734229qvc.126.1665478006263;
        Tue, 11 Oct 2022 01:46:46 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id f11-20020a05620a280b00b006ce515196a7sm12599208qkp.8.2022.10.11.01.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 01:46:45 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-35befab86a4so120950637b3.8;
        Tue, 11 Oct 2022 01:46:45 -0700 (PDT)
X-Received: by 2002:a0d:de43:0:b0:349:31bd:e8d5 with SMTP id
 h64-20020a0dde43000000b0034931bde8d5mr20151543ywe.283.1665478004869; Tue, 11
 Oct 2022 01:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-37-andriy.shevchenko@linux.intel.com> <d63088d7-202b-a550-01e5-345a22de5f7d@amd.com>
In-Reply-To: <d63088d7-202b-a550-01e5-345a22de5f7d@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Oct 2022 10:46:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUfdQnisexfs4yLjeKs-LUPY1HjChrgeNjNL1qSErir9Q@mail.gmail.com>
Message-ID: <CAMuHMdUfdQnisexfs4yLjeKs-LUPY1HjChrgeNjNL1qSErir9Q@mail.gmail.com>
Subject: Re: [PATCH v2 36/36] pinctrl: Clean up headers
To: Basavaraj Natikar <bnatikar@amd.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Marc Zyngier <maz@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Prathamesh Shete <pshete@nvidia.com>, 
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
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Andy Shevchenko <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, 
	Paul Cercueil <paul@crapouillou.net>, Damien Le Moal <damien.lemoal@wdc.com>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Michal Simek <michal.simek@xilinx.com>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_014648_924247_199A6489 
X-CRM114-Status: GOOD (  27.59  )
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

On Tue, Oct 11, 2022 at 9:31 AM Basavaraj Natikar <bnatikar@amd.com> wrote:
> On 10/11/2022 1:44 AM, Andy Shevchenko wrote:
> > There is a few things done:
> > - include only the headers we are direct user of
> > - when pointer is in use, provide a forward declaration
> > - add missed headers
> > - group generic headers and subsystem headers
> > - sort each group alphabetically
> >
> > While at it, fix some awkward indentations.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/pinctrl/core.c                  | 19 ++++++++-------
> >  drivers/pinctrl/core.h                  | 12 +++++++++-
> >  drivers/pinctrl/devicetree.h            |  6 +++++
> >  drivers/pinctrl/pinconf.h               | 10 ++++++++
> >  drivers/pinctrl/pinctrl-utils.h         |  5 ++++
> >  drivers/pinctrl/pinmux.c                | 17 ++++++++------
> >  drivers/pinctrl/pinmux.h                | 11 +++++++++
> >  include/linux/pinctrl/consumer.h        | 31 +++++++++++--------------
> >  include/linux/pinctrl/devinfo.h         |  6 +++--
> >  include/linux/pinctrl/machine.h         |  8 ++++---
> >  include/linux/pinctrl/pinconf-generic.h | 23 ++++++++++--------
> >  include/linux/pinctrl/pinctrl.h         | 18 +++++++-------
> >  include/linux/pinctrl/pinmux.h          |  5 ++--
> >  13 files changed, 110 insertions(+), 61 deletions(-)
> >
> > diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> > index 9e57f4c62e60..655f9502e73f 100644
> > --- a/drivers/pinctrl/core.c
> > +++ b/drivers/pinctrl/core.c
> > @@ -12,19 +12,21 @@
> >   */
> >  #define pr_fmt(fmt) "pinctrl core: " fmt
> >
> > -#include <linux/kernel.h>
> > -#include <linux/kref.h>
> > -#include <linux/export.h>
> > -#include <linux/init.h>
> > +#include <linux/debugfs.h>
> >  #include <linux/device.h>
> > -#include <linux/slab.h>
> >  #include <linux/err.h>
> > +#include <linux/export.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/kref.h>
> >  #include <linux/list.h>
> > -#include <linux/debugfs.h>
> >  #include <linux/seq_file.h>
> > +#include <linux/slab.h>
> > +
> >  #include <linux/pinctrl/consumer.h>
> > -#include <linux/pinctrl/pinctrl.h>
> > +#include <linux/pinctrl/devinfo.h>
> >  #include <linux/pinctrl/machine.h>
> > +#include <linux/pinctrl/pinctrl.h>
> >
> >  #ifdef CONFIG_GPIOLIB
> >  #include "../gpio/gpiolib.h"
> > @@ -33,9 +35,8 @@
> >
> >  #include "core.h"
> >  #include "devicetree.h"
> > -#include "pinmux.h"
> >  #include "pinconf.h"
> > -
> > +#include "pinmux.h"
> >
> >  static bool pinctrl_dummy_state;
> >
> > diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
> > index 840103c40c14..4d0bdb9fb99b 100644
> > --- a/drivers/pinctrl/core.h
> > +++ b/drivers/pinctrl/core.h
> > @@ -9,12 +9,22 @@
> >   */
> >
> >  #include <linux/kref.h>
> > +#include <linux/list.h>
> >  #include <linux/mutex.h>
> >  #include <linux/radix-tree.h>
> > -#include <linux/pinctrl/pinconf.h>
>
> Removing pinconf.h from the core.h may cause build failure in other files
> because where-ever core.h is included to use =E2=80=9Cstruct pinconf_ops=
=E2=80=9D, there
> is a need to include pinconf.h.

I can confirm adding

    #include <linux/pinctrl/pinconf.h>

to drivers/pinctrl/renesas/pinctrl-rzn1.c and drivers/pinctrl/pinctrl-singl=
e.c
fixes the issues I was seeing with shmobile_defconfig and (out-of-tree)
renesas_defconfig.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

