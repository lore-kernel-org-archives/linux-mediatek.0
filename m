Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430A7C25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 10:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzT5yCSvV57mMTYhBGzUgbIbwkfE5KRalJPYyg3Db1Q=; b=HsL/a3wUbFiNtDyVf/mG7Me3rt
	WwdF6XmlSuLAInGpROiOLmO4p5FjjJVlBdD6vLv/k0d6OlE26KTevisWSxI1lYNsYL/wm8O5PNGTe
	rmIkP4hvDjhYP7XGhV5EVwXQMUe2gxf4VvvNKQ9YIT//83EjnGWMsJpOxX4OVmDk0dfg60p/C97jz
	52igMtyV/2CHfNANk/4fuIonROLMYjSiCRmW9dZdyhWHMP6J6VhDYgzcvzjOih81ra7aaXfd4u4Wh
	knowWjjvMuinmXr/lAAG9tFUreh24Wz/lghZzPaKR+HVV63dQBeOBzquQvnyy3zH2E2p/rQHWW1uC
	isXjyxbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcpw-00000006xca-2iMJ;
	Thu, 30 May 2024 10:16:44 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcpr-00000006xZS-0JDQ
	for linux-mediatek@lists.infradead.org;
	Thu, 30 May 2024 10:16:41 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-52b78ef397bso824906e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 30 May 2024 03:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717064197; x=1717668997; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzT5yCSvV57mMTYhBGzUgbIbwkfE5KRalJPYyg3Db1Q=;
        b=EbRMbXfR9DJ0DWl39oc+Y+01kFZplPNHGe4o7R4CbaVQJcPY/LtTMuWeu6yZgoayjP
         YMX61PPO2Dt70O+zyxxWpBgQ1vsdA+JxE6rdqHLrq4wlX740YEv56LZLo8fP8SlzcrYa
         8/X754/Pw7OXl0UckIjdY4z84wcRQa0CIPS34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717064197; x=1717668997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzT5yCSvV57mMTYhBGzUgbIbwkfE5KRalJPYyg3Db1Q=;
        b=J5P2E5AZh0PSG6J8nfrXcKBOiSfiXD2pWH+m1p5ndTvav1jiqxm5xImc/EJ0YotkBt
         YvGYJ7RYxoDKYntQ7egXJz5HCXwxp5q0rpEgo9uZgLgGAPr2cBjTcGMbMREZr3CJCXu9
         CRvDtu0aN4bG2Rs1mSEhZjiBBUKU8SpgkRYDbqsGxxdcSZDkDNUaQt1VGmAqv1vqW7P1
         JuvqsQzEsm/TawusTcFyAw/JjyJEvVy+KBUwZBhkdwlTKiA01YB9qQA3nLorh9TjYmz5
         SqT9xoxsZIF6fLm6z1AEntd+4CUO1t6dfKKvVxnZphAjWiqUBWkXU3W6XpxQw8iIkIiz
         jPqA==
X-Forwarded-Encrypted: i=1; AJvYcCXNvSu+a2mSfg8wu/GbDhPzVZakKCUnC52Xmm5vRua/z8Xq6zZRjcCbEJKNPDCV0OBTIN40QAcew/pc/wrywKr5EmJa3JiJ2t6xc3z8jcsowDx1
X-Gm-Message-State: AOJu0YwiO3FJIVL+6cD3c8xWZ1mT0bO8pav/s5RgTC6Wrk4WVoOJJlZX
	DznQxF2Jp+Vk5bAxesevCekAaui9gazH+rICIJvsmzgHg0V6etUK286Q/fdvTO/j8qW4F0JEk+p
	vora9nXCNEBncWJpmVUK43E3FPs/WSDx6aM0W
X-Google-Smtp-Source: AGHT+IFQ1k/efBlxIyxFB1csG13ig4X/Xag1QwXMyDgIYBVAydIEN4a9Cvp5XFm54Ap13GSLIFikgOr4c5wgUFxmhYc=
X-Received: by 2002:a05:6512:505:b0:52b:2b11:a574 with SMTP id
 2adb3069b0e04-52b7e10cc61mr331899e87.15.1717064196733; Thu, 30 May 2024
 03:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org> <20240530083513.4135052-3-wenst@chromium.org>
 <5a5842d7-adad-410b-bac2-9e5cb03ae18c@collabora.com>
In-Reply-To: <5a5842d7-adad-410b-bac2-9e5cb03ae18c@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 30 May 2024 18:16:24 +0800
Message-ID: <CAGXv+5E5zFWVi+QmZj+mMb5jRfv138kz1FQyXiuzpe5Zz2KbZQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] clk: mediatek: Add mt8173-mfgtop driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_031639_254965_456049DB 
X-CRM114-Status: GOOD (  46.51  )
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

On Thu, May 30, 2024 at 5:59=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 30/05/24 10:35, Chen-Yu Tsai ha scritto:
> > The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
> > in the datasheet, that contains clock gates, some power sequence signal
> > delays, and other unknown registers that get toggled when the GPU is
> > powered on.
> >
> > The clock gates are exposed as clocks provided by a clock controller,
> > while the power sequencing bits are exposed as one singular power domai=
n.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >   drivers/clk/mediatek/Kconfig             |   9 +
> >   drivers/clk/mediatek/Makefile            |   1 +
> >   drivers/clk/mediatek/clk-mt8173-mfgtop.c | 240 ++++++++++++++++++++++=
+
> >   3 files changed, 250 insertions(+)
> >   create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c
> >
> > diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfi=
g
> > index 70a005e7e1b1..9e279c739f1c 100644
> > --- a/drivers/clk/mediatek/Kconfig
> > +++ b/drivers/clk/mediatek/Kconfig
> > @@ -500,6 +500,15 @@ config COMMON_CLK_MT8173_IMGSYS
> >       help
> >         This driver supports MediaTek MT8173 imgsys clocks.
> >
> > +config COMMON_CLK_MT8173_MFGTOP
> > +     tristate "Clock and power driver for MediaTek MT8173 mfgtop"
> > +     depends on COMMON_CLK_MT8173
> > +     default COMMON_CLK_MT8173
> > +     select PM_GENERIC_DOMAINS
> > +     select PM_GENERIC_DOMAINS_OF
> > +     help
> > +       This driver supports MediaTek MT8173 mfgtop clocks and power do=
main.
> > +
> >   config COMMON_CLK_MT8173_MMSYS
> >          tristate "Clock driver for MediaTek MT8173 mmsys"
> >          depends on COMMON_CLK_MT8173
> > diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makef=
ile
> > index eeccfa039896..fdd3a76e12a1 100644
> > --- a/drivers/clk/mediatek/Makefile
> > +++ b/drivers/clk/mediatek/Makefile
> > @@ -77,6 +77,7 @@ obj-$(CONFIG_COMMON_CLK_MT8167_VDECSYS) +=3D clk-mt81=
67-vdec.o
> >   obj-$(CONFIG_COMMON_CLK_MT8173) +=3D clk-mt8173-apmixedsys.o clk-mt81=
73-infracfg.o \
> >                                  clk-mt8173-pericfg.o clk-mt8173-topckg=
en.o
> >   obj-$(CONFIG_COMMON_CLK_MT8173_IMGSYS) +=3D clk-mt8173-img.o
> > +obj-$(CONFIG_COMMON_CLK_MT8173_MFGTOP) +=3D clk-mt8173-mfgtop.o
> >   obj-$(CONFIG_COMMON_CLK_MT8173_MMSYS) +=3D clk-mt8173-mm.o
> >   obj-$(CONFIG_COMMON_CLK_MT8173_VDECSYS) +=3D clk-mt8173-vdecsys.o
> >   obj-$(CONFIG_COMMON_CLK_MT8173_VENCSYS) +=3D clk-mt8173-vencsys.o
> > diff --git a/drivers/clk/mediatek/clk-mt8173-mfgtop.c b/drivers/clk/med=
iatek/clk-mt8173-mfgtop.c
> > new file mode 100644
> > index 000000000000..85fa7a7453ed
> > --- /dev/null
> > +++ b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
> > @@ -0,0 +1,240 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2024 Google LLC
> > + * Author: Chen-Yu Tsai <wenst@chromium.org>
> > + *
> > + * Based on driver in downstream ChromeOS v5.15 kernel.
> > + *
> > + * Copyright (c) 2014 MediaTek Inc.
> > + * Author: Chiawen Lee <chiawen.lee@mediatek.com>
> > + */
> > +
> > +#include <dt-bindings/clock/mt8173-clk.h>
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_domain.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> > +
> > +#include "clk-gate.h"
> > +#include "clk-mtk.h"
> > +
> > +static const struct mtk_gate_regs mfg_cg_regs =3D {
> > +     .sta_ofs =3D 0x0000,
> > +     .clr_ofs =3D 0x0008,
> > +     .set_ofs =3D 0x0004,
> > +};
> > +
> > +#define GATE_MFG(_id, _name, _parent, _shift, _flags)        \
> > +             GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs, _shift,=
 &mtk_clk_gate_ops_setclr, _flags)
>
> Extra tabulation: please fix

One tab instead of two? OK.

> > +
> > +/* TODO: The block actually has dividers for the core and mem clocks. =
*/
> > +static const struct mtk_gate mfg_clks[] =3D {
> > +     GATE_MFG(CLK_MFG_AXI, "mfg_axi", "axi_mfg_in_sel", 0, CLK_SET_RAT=
E_PARENT),
> > +     GATE_MFG(CLK_MFG_MEM, "mfg_mem", "mem_mfg_in_sel", 1, CLK_SET_RAT=
E_PARENT),
> > +     GATE_MFG(CLK_MFG_G3D, "mfg_g3d", "mfg_sel", 2, CLK_SET_RATE_PAREN=
T),
> > +     GATE_MFG(CLK_MFG_26M, "mfg_26m", "clk26m", 3, 0),
> > +};
> > +
> > +static const struct mtk_clk_desc mfg_desc =3D {
> > +     .clks =3D mfg_clks,
> > +     .num_clks =3D ARRAY_SIZE(mfg_clks),
> > +};
> > +
> > +struct mt8173_mfgtop_data {
> > +     struct clk_hw_onecell_data *clk_data;
> > +     struct regmap *regmap;
> > +     struct generic_pm_domain genpd;
> > +     struct of_phandle_args parent_pd, child_pd;
> > +     struct clk *clk_26m;
> > +};
> > +
> > +static const struct of_device_id of_match_clk_mt8173_mfgtop[] =3D {
> > +     { .compatible =3D "mediatek,mt8173-mfgtop", .data =3D &mfg_desc }=
,
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_mfgtop);
>
> Please move of_match_clk_mt8173_mfgtop before clk_mt8173_mfgtop_drv for c=
onsistency
> with all the other clock drivers.

Ack.

> > +
> > +/* Delay count in clock cycles */
> > +#define MFG_ACTIVE_POWER_CON0        0x24
> > + #define RST_B_DELAY_CNT     GENMASK(7, 0)   /* pwr_rst_b de-assert de=
lay during power-up */
> > + #define CLK_EN_DELAY_CNT    GENMASK(15, 8)  /* CLK_DIS deassert delay=
 during power-up */
> > + #define CLK_DIS_DELAY_CNT   GENMASK(23, 16) /* CLK_DIS assert delay d=
uring power-down */
>
> The reason why I had EVT_FORCE_ABORT and ACTIVE_PWRCTL_EN in my driver is=
 to
> document that we're keeping the event force abort disabled and, more impo=
rtantly,
> we are keeping the "active power control" feature disabled.
>
> Please, add those two - or at least the ACTIVE_PWRCTL_EN - to keep that d=
ocumented,
> or this information will be lost for sure.
> If in the future the ACTIVE_PWRCTL feature will become usable, it's going=
 to be
> just a 30 seconds change, as the info is already there.

OK.

> > +
> > +#define MFG_ACTIVE_POWER_CON1        0x28
> > + #define PWR_ON_S_DELAY_CNT  GENMASK(7, 0)   /* pwr_on_s assert delay =
during power-up */
> > + #define ISO_DELAY_CNT               GENMASK(15, 8)  /* ISO assert del=
ay during power-down */
> > + #define ISOOFF_DELAY_CNT    GENMASK(23, 16) /* ISO de-assert delay du=
ring power-up */
> > + #define RST__DELAY_CNT              GENMASK(31, 24) /* pwr_rsb_b asse=
rt delay during power-down */
> > +
> > +static int clk_mt8173_mfgtop_power_on(struct generic_pm_domain *domain=
)
> > +{
> > +     struct mt8173_mfgtop_data *data =3D container_of(domain, struct m=
t8173_mfgtop_data, genpd);
> > +
> > +     /* drives internal power management */
> > +     clk_prepare_enable(data->clk_26m);
> > +
> > +     /* Power on/off delays for various signals */
> > +     regmap_write(data->regmap, MFG_ACTIVE_POWER_CON0,
> > +                  FIELD_PREP(RST_B_DELAY_CNT, 77) |
> > +                  FIELD_PREP(CLK_EN_DELAY_CNT, 61) |
> > +                  FIELD_PREP(CLK_DIS_DELAY_CNT, 60));
>
> I get that this is kinda odd to read, but still...
>
> FIELD_PREP(CLK_DIS_DELAY_CNT, 60) |
> FIELD_PREP(ACTIVE_PWRCTL_EN, 0));
>
> ...please :-)

Sure.

> > +     regmap_write(data->regmap, MFG_ACTIVE_POWER_CON1,
> > +                  FIELD_PREP(PWR_ON_S_DELAY_CNT, 11) |
> > +                  FIELD_PREP(ISO_DELAY_CNT, 68) |
> > +                  FIELD_PREP(ISOOFF_DELAY_CNT, 69) |
> > +                  FIELD_PREP(RST__DELAY_CNT, 77));
> > +
> > +     /* Magic numbers related to core switch sequence and delays */
> > +     regmap_write(data->regmap, 0xe0, 0x7a710184);
> > +     regmap_write(data->regmap, 0xe4, 0x835f6856);
> > +     regmap_write(data->regmap, 0xe8, 0x002b0234);
> > +     regmap_write(data->regmap, 0xec, 0x80000000);
> > +     regmap_write(data->regmap, 0xa0, 0x08000000);
>
> Is there any way to retrieve information about what those registers are?

I asked. They said the project was too long ago, and they could only
figure out that it had something to do with core switch sequencing and
delays between each core, which is what I put in the comment there.

> > +
> > +     return 0;
> > +}
> > +
> > +static int clk_mt8173_mfgtop_power_off(struct generic_pm_domain *domai=
n)
> > +{
> > +     struct mt8173_mfgtop_data *data =3D container_of(domain, struct m=
t8173_mfgtop_data, genpd);
> > +
> > +     /* Magic numbers related to core switch sequence and delays */
> > +     regmap_write(data->regmap, 0xec, 0);
> > +
> > +     /* drives internal power management */
> > +     clk_disable_unprepare(data->clk_26m);
> > +
> > +     return 0;
> > +}
> > +
> > +static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct device_node *node =3D dev->of_node;
> > +     struct mt8173_mfgtop_data *data;
> > +     int ret;
> > +
> > +     data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return -ENOMEM;
> > +
> > +     platform_set_drvdata(pdev, data);
> > +
> > +     data->clk_data =3D mtk_devm_alloc_clk_data(dev, ARRAY_SIZE(mfg_cl=
ks));
> > +     if (!data->clk_data)
> > +             return -ENOMEM;
> > +
> > +     /* MTK clock gates also uses regmap */
> > +     data->regmap =3D device_node_to_regmap(node);
> > +     if (IS_ERR(data->regmap))
> > +             return dev_err_probe(dev, PTR_ERR(data->regmap), "Failed =
to get regmap\n");
> > +
> > +     data->child_pd.np =3D node;
> > +     data->child_pd.args_count =3D 0;
> > +     ret =3D of_parse_phandle_with_args(node, "power-domains", "#power=
-domain-cells", 0,
> > +                                      &data->parent_pd);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to parse power dom=
ain\n");
> > +
> > +     devm_pm_runtime_enable(dev);
> > +     /*
> > +      * Do a pm_runtime_resume_and_get() to workaround a possible
> > +      * deadlock between clk_register() and the genpd framework.
> > +      */
> > +     ret =3D pm_runtime_resume_and_get(dev);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "Failed to runtime resume device\=
n");
> > +             goto put_of_node;
> > +     }
> > +
> > +     ret =3D mtk_clk_register_gates(dev, node, mfg_clks, ARRAY_SIZE(mf=
g_clks),
> > +                                  data->clk_data);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "Failed to register clock gates\n=
");
> > +             goto put_pm_runtime;
> > +     }
> > +
> > +     data->clk_26m =3D clk_hw_get_clk(data->clk_data->hws[CLK_MFG_26M]=
, "26m");
> > +     if (IS_ERR(data->clk_26m)) {
> > +             dev_err_probe(dev, PTR_ERR(data->clk_26m), "Failed to get=
 26 MHz clock\n");
> > +             goto unregister_clks;
> > +     }
> > +
> > +     ret =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data-=
>clk_data);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "Failed to add clk OF provider\n"=
);
> > +             goto put_26m_clk;
> > +     }
> > +
> > +     data->genpd.name =3D "mfg_apm";
>
> "mfg-apm" or "mfg-pwr" please!

Ack.

> Everything else looks good.
>
> Thanks for taking care of that, I started this work way too much time ago=
 and
> realistically I wouldn't have been able to finish it due to time constrai=
nts.
>
> It's great to see that *finally* we can get some GPU upstream on this old=
 SoC.
> As its CPUs are really slow, LLVMPipe is quite unusable from a UX perspec=
tive
> hence its only big issue was the lack of 3D HW acceleration.

I think there's still more work on the GPU driver side. I was digging
through the mailing list to find ways to get it running, and evidently
it doesn't fully support zink yet.

> This makes machines embedding this SoC usable, and that's simply awesome.

I'll give the patches a week to simmer while I go work on some
other stuff.

ChenYu

