Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA65C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 10:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWdp6edt6MkDuDnUTj7ug7sxU6dr8js9M8BKUFKe74M=; b=4CBZ50Xm8mE6RC
	YF5bv5hxOUcDtmoVEIiU60DsXWx06NIm1NymyMennRmEgRoODP0FAxh9sBbk4JK9XQc9O75jmRkCW
	imx3s/qrueHkQX4MWJUjf+E33V5eDuhLm+cOP5CKs1minUUTfxrnbQzVcRyi5lIyJWCi7vic4b2dd
	iy3UyzzsLWWEz7PLalVd7+pf1KnkAyqEEGWOdSbucrjQwjCOhh8rI67K/z7MZXFsF4xp5zwJyUqRh
	g/ENBt6B5f5Rxlos4NBQ5klvZyjM1L7c0MmWVJ2HqoBlyITC73+zncEF+fscR9WebvVADG40HLAbL
	E80/spBjuJYzgQyh8GpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRtKq-0086YV-Sf; Wed, 09 Mar 2022 10:14:24 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRtKd-0086VX-R7
 for linux-mediatek@lists.infradead.org; Wed, 09 Mar 2022 10:14:13 +0000
Received: by mail-yb1-xb33.google.com with SMTP id j2so3389943ybu.0
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Mar 2022 02:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KCZhZco+0KFMyvuCDhItj2e0NHWXHNetfjkFnAqoWkA=;
 b=S3cgBjeFwa4noJjQAcXN/JsibairXFtbUXo1zZduqt6MBg4NTVWQlXy7CyORsMtfCJ
 Yb79zDE3TZGRo+HW0IYQLkcA4VssO3t3ZLZoE/IcyyvJeDhjJb+gnDLXoP4eKepJ1mMp
 sCiw8DlUD8HAf1zQRugIGTRzk/SD/ww4tm4hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KCZhZco+0KFMyvuCDhItj2e0NHWXHNetfjkFnAqoWkA=;
 b=V5xtewbAsLo51YwgS+H2twiQvywVz+HtbKNO5y+GVnrCSAJryZvCHVCkN2T75e1CCm
 wADhAK7+9+KGWjwgFYLFLCPYdscK09b3kDlvRyfpnhcUqpYN+9cdDbA4t082dkCkCOL9
 LFiKb06FfFgQ443DzxvWDjP/FveALr4GVejmHvMngxFoh2iP3j2hr1eWeMmNe9ScG/LP
 BQY5CgseahFuXnjgVj7DTi+Bt9U9rThf+9vz1FwmWadqYLDBza3lF797nlnnpmgiM6q2
 BE9gFg2/W3SHooTvnPXQzI4AgDK7LxHXOjupmBvQL8K/NA4EwqTKxGVgLJLv3DosiAkk
 joBw==
X-Gm-Message-State: AOAM531ym8S/+hCcWh/LtdN0vgC/w6HaURFIae6g8yYvm/ZjTLmrpmKg
 xQBlmEPNQ8gDEe260dGLTFzwM/NE9QD2HhdNUZ46UQ==
X-Google-Smtp-Source: ABdhPJx2cW0ywz0SegJTQ+R92hI1gP1aKA2eosKmS45iuxzgvK62ipaxN+q/w5JWJ9Th9IBnbmcaCuX8B0vy11f6CL4=
X-Received: by 2002:a25:d449:0:b0:628:945d:713c with SMTP id
 m70-20020a25d449000000b00628945d713cmr16379825ybf.164.1646820850490; Wed, 09
 Mar 2022 02:14:10 -0800 (PST)
MIME-Version: 1.0
References: <20220221015258.913-1-chun-jie.chen@mediatek.com>
 <20220221015258.913-3-chun-jie.chen@mediatek.com>
In-Reply-To: <20220221015258.913-3-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 9 Mar 2022 18:13:59 +0800
Message-ID: <CAGXv+5Fq4_dZBWJvKZ8ADUSQF4bTu-QWZ+7KG1dsJoWDrT2nXg@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] clk: mediatek: Add MT8186 mcusys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_021411_923326_F0D06234 
X-CRM114-Status: GOOD (  28.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Feb 21, 2022 at 9:59 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8186 mcusys clock controller which provides muxes
> to select the clock source of APMCU.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig          |   8 ++
>  drivers/clk/mediatek/Makefile         |   1 +
>  drivers/clk/mediatek/clk-mt8186-mcu.c | 106 ++++++++++++++++++++++++++
>  3 files changed, 115 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8186-mcu.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 01ef02c54725..d5936cfb3bee 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -512,6 +512,14 @@ config COMMON_CLK_MT8183_VENCSYS
>         help
>           This driver supports MediaTek MT8183 vencsys clocks.
>
> +config COMMON_CLK_MT8186
> +       bool "Clock driver for MediaTek MT8186"
> +       depends on ARM64 || COMPILE_TEST
> +       select COMMON_CLK_MEDIATEK
> +       default ARCH_MEDIATEK
> +       help
> +         This driver supports MediaTek MT8186 clocks.
> +
>  config COMMON_CLK_MT8192
>         bool "Clock driver for MediaTek MT8192"
>         depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 7b0c2646ce4a..677fa4f0eea2 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -71,6 +71,7 @@ obj-$(CONFIG_COMMON_CLK_MT8183_MFGCFG) += clk-mt8183-mfgcfg.o
>  obj-$(CONFIG_COMMON_CLK_MT8183_MMSYS) += clk-mt8183-mm.o
>  obj-$(CONFIG_COMMON_CLK_MT8183_VDECSYS) += clk-mt8183-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT8183_VENCSYS) += clk-mt8183-venc.o
> +obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8186-mcu.c b/drivers/clk/mediatek/clk-mt8186-mcu.c
> new file mode 100644
> index 000000000000..6d82c5de16c1
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8186-mcu.c
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2022 MediaTek Inc.
> +// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +#include "clk-mtk.h"

Please move local headers after global ones. And please do this for all
patches.

> +
> +#include <dt-bindings/clock/mt8186-clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +
> +static DEFINE_SPINLOCK(mt8186_clk_lock);
> +
> +static const char * const mcu_armpll_ll_parents[] = {
> +       "clk26m",
> +       "armpll_ll",
> +       "mainpll",
> +       "univpll_d2"
> +};
> +
> +static const char * const mcu_armpll_bl_parents[] = {
> +       "clk26m",
> +       "armpll_bl",
> +       "mainpll",
> +       "univpll_d2"
> +};
> +
> +static const char * const mcu_armpll_bus_parents[] = {
> +       "clk26m",
> +       "ccipll",
> +       "mainpll",
> +       "univpll_d2"
> +};
> +
> +static struct mtk_composite mcu_muxes[] = {
> +       /* CPU_PLLDIV_CFG0 */
> +       MUX(CLK_MCU_ARMPLL_LL_SEL, "mcu_armpll_ll_sel", mcu_armpll_ll_parents, 0x2A0, 9, 2),

Can you add a comment stating that these registers have other bits that
should not be touched? Otherwise anyone reading the datasheet might
consider this to be incomplete.

I assume the other bits (such as one field that looks like a divider) are
configured in the bootloader, or the POR defaults are correct.

> +       /* CPU_PLLDIV_CFG1 */
> +       MUX(CLK_MCU_ARMPLL_BL_SEL, "mcu_armpll_bl_sel", mcu_armpll_bl_parents, 0x2A4, 9, 2),
> +       /* BUS_PLLDIV_CFG */
> +       MUX(CLK_MCU_ARMPLL_BUS_SEL, "mcu_armpll_bus_sel", mcu_armpll_bus_parents, 0x2E0, 9, 2),
> +};

Note: I've checked the register bits against the datasheet.

> +
> +static const struct of_device_id of_match_clk_mt8186_mcu[] = {
> +       { .compatible = "mediatek,mt8186-mcusys", },
> +       {}
> +};
> +
> +static int clk_mt8186_mcu_probe(struct platform_device *pdev)
> +{
> +       struct clk_onecell_data *clk_data;
> +       struct device_node *node = pdev->dev.of_node;
> +       int r;
> +       void __iomem *base;
> +
> +       clk_data = mtk_alloc_clk_data(CLK_MCU_NR_CLK);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(base)) {
> +               r = PTR_ERR(base);
> +               goto free_mcu_data;
> +       }
> +
> +       r = mtk_clk_register_composites(mcu_muxes, ARRAY_SIZE(mcu_muxes), base,
> +                                       &mt8186_clk_lock, clk_data);

I don't think you need the lock. None of the bit fields you have defined
in this driver have overlapping registers.


Regards
ChenYu

> +       if (r)
> +               goto free_mcu_data;
> +
> +       r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +       if (r)
> +               goto unregister_composite_muxes;
> +
> +       platform_set_drvdata(pdev, clk_data);
> +
> +       return r;
> +
> +unregister_composite_muxes:
> +       mtk_clk_unregister_composites(mcu_muxes, ARRAY_SIZE(mcu_muxes), clk_data);
> +free_mcu_data:
> +       mtk_free_clk_data(clk_data);
> +       return r;
> +}
> +
> +static int clk_mt8186_mcu_remove(struct platform_device *pdev)
> +{
> +       struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
> +       struct device_node *node = pdev->dev.of_node;
> +
> +       of_clk_del_provider(node);
> +       mtk_clk_unregister_composites(mcu_muxes, ARRAY_SIZE(mcu_muxes), clk_data);
> +       mtk_free_clk_data(clk_data);
> +
> +       return 0;
> +}
> +
> +static struct platform_driver clk_mt8186_mcu_drv = {
> +       .probe = clk_mt8186_mcu_probe,
> +       .remove = clk_mt8186_mcu_remove,
> +       .driver = {
> +               .name = "clk-mt8186-mcu",
> +               .of_match_table = of_match_clk_mt8186_mcu,
> +       },
> +};
> +builtin_platform_driver(clk_mt8186_mcu_drv);
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
