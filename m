Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A3FC07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 08:34:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC9A161006
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 08:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC9A161006
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TrXkz0oB0MUYD+uBU/oCcsKGVpBE+yHAfj8nv13XNzI=; b=svg0iHd/JTQVdJ
	8xNj490OZkyAgk1uLU15oW5k1eG+ZVwIOGozkLkIXVWW8GR4R5lRWjo6KIl/CocwH5z3jM8/I6mtN
	39RAkw/BuY8KOtRt6fAFjtYXJUlTGPH4Y7NEaOPqHZOwdfT08FDVaS4l31ylKhUnQ29CY0e6Ouw/g
	b6ZsbnDDI8VIp66EbXM00iZdBdzCK/OfLOMfGUUaktMLjV+p7S3eBeog4Y1Gp3i5sVP8M/kyvmeyR
	Uje6Fzs3PuzVPUPn6lCStZF07GfwN1HuqxKXLUuIpIBPmhY/mC8P1428XoYU5WzlEXXN1VeXKHnM0
	U1pj2cQ/UDENSbO6AR0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2rOg-006bDv-Rt; Mon, 12 Jul 2021 08:34:38 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2rOT-006b6O-L4
 for linux-mediatek@lists.infradead.org; Mon, 12 Jul 2021 08:34:27 +0000
Received: by mail-lj1-x229.google.com with SMTP id u25so22865541ljj.11
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Jul 2021 01:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zJuNTiw2bAkp/x3xoDaz/4iXGg6QuhO9H12Y5RswVAY=;
 b=Upj1aAMvSSjVrIBLSBG1/ArPEg+RtCIqWSn8VtfvPFm+4dLX/hYh/lN9B2+SjtJ0VD
 dsqrzKohAQn11rgT0yvIotdYQd8LmgTU2axJuDOwhvzFEtUxyIgycMsEhY2wdyoWMeLC
 CzGpXBvSewJUnVQMHlbXXkQyOHm1BMnZX9GbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zJuNTiw2bAkp/x3xoDaz/4iXGg6QuhO9H12Y5RswVAY=;
 b=G9deMYwiLB3rUUYjUIwewizWURNuk7zCiWTSLY8N4V18kjHKF/NkGb3wMQehrNIazA
 Iz8ggyXsqQ6+L+XydSd7zJ/PYRP5DH/UzRO9Wb+RA8JDqWEV6aFS9APrlmy6q0LuqrDY
 l0Nt9DY+JCJ9/+2utKtp5LDbe0tQtq/TH9tncQW0oyI7src/PK6aNpmTAtHQM2kaFaX4
 go/5D9jtrG6x9546ZQv77hA25WXmOlS2mofWozkPHrA7E5AX+r/i7xzthMSeX4FHPFoL
 KOO3wGgrQhJqv3UqZp6Efi67TPAr99QEhMuvtmde+VPqDZpCtPr0eoMv9kTkLNsFTNpm
 3/cA==
X-Gm-Message-State: AOAM5316WvCpLHKXcSP6HJJSHsAeEHYRwrvKOBKP7xAvF5fHdiopigzl
 oXZjihxNogrL+1Vr38/fllFLRlTWvOhXcjlOlzRTwg==
X-Google-Smtp-Source: ABdhPJxTwmQouyNY1518GgGLKn95Fz9OMBBHdc/D2dJN+ng1GSyTFAPjXSgn07w0W+HnJc3plqNsRFgWxNDSx2LRQ8g=
X-Received: by 2002:a2e:a583:: with SMTP id m3mr41341251ljp.305.1626078863525; 
 Mon, 12 Jul 2021 01:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-22-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-22-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jul 2021 16:34:12 +0800
Message-ID: <CAGXv+5G1-ruOkK4R1J-ZUzVARHHdyZ88hri6u3ej-+v1Ox8bKw@mail.gmail.com>
Subject: Re: [PATCH 21/22] clk: mediatek: Add MT8195 imp i2c wrapper clock
 support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_013425_727835_8849C295 
X-CRM114-Status: GOOD (  23.41  )
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

On Thu, Jun 17, 2021 at 6:59 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 imp i2c wrapper clock providers
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig                  |  6 ++
>  drivers/clk/mediatek/Makefile                 |  1 +
>  .../clk/mediatek/clk-mt8195-imp_iic_wrap.c    | 68 +++++++++++++++++++
>  3 files changed, 75 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 5089bacdf0a5..ade85a52b7ed 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -684,6 +684,12 @@ config COMMON_CLK_MT8195_WPESYS
>         help
>           This driver supports MediaTek MT8195 wpesys clocks.
>
> +config COMMON_CLK_MT8195_IMP_IIC_WRAP
> +       bool "Clock driver for MediaTek MT8195 imp_iic_wrap"
> +       depends on COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 imp_iic_wrap clocks.
> +

General comments from other patches also apply.

>  config COMMON_CLK_MT8516
>         bool "Clock driver for MediaTek MT8516"
>         depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 32cfb0030d92..b10c6267ba98 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -97,5 +97,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) += clk-mt8195-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS0) += clk-mt8195-vpp0.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS1) += clk-mt8195-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) += clk-mt8195-wpe.o
> +obj-$(CONFIG_COMMON_CLK_MT8195_IMP_IIC_WRAP) += clk-mt8195-imp_iic_wrap.o
>  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
>  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
> new file mode 100644
> index 000000000000..efb62f484bbe
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2021 MediaTek Inc.
> +// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-mtk.h"
> +#include "clk-gate.h"
> +
> +#include <dt-bindings/clock/mt8195-clk.h>
> +
> +static const struct mtk_gate_regs imp_iic_wrap_cg_regs = {
> +       .set_ofs = 0xe08,
> +       .clr_ofs = 0xe04,
> +       .sta_ofs = 0xe00,
> +};
> +
> +#define GATE_IMP_IIC_WRAP(_id, _name, _parent, _shift)                         \
> +       GATE_MTK_FLAGS(_id, _name, _parent, &imp_iic_wrap_cg_regs, _shift,      \
> +               &mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
> +
> +static const struct mtk_gate imp_iic_wrap_s_clks[] = {
> +       GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_S_I2C5, "imp_iic_wrap_s_i2c5", "i2c_sel", 0),
> +       GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_S_I2C6, "imp_iic_wrap_s_i2c6", "i2c_sel", 1),
> +       GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_S_I2C7, "imp_iic_wrap_s_i2c7", "i2c_sel", 2),
> +};
> +
> +static const struct mtk_gate imp_iic_wrap_w_clks[] = {
> +       GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C0, "imp_iic_wrap_w_i2c0", "i2c_sel", 0),
> +       GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C1, "imp_iic_wrap_w_i2c1", "i2c_sel", 1),
> +       GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C2, "imp_iic_wrap_w_i2c2", "i2c_sel", 2),
> +       GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C3, "imp_iic_wrap_w_i2c3", "i2c_sel", 3),
> +       GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_W_I2C4, "imp_iic_wrap_w_i2c4", "i2c_sel", 4),

The datasheet doesn't provide the actual index numbers for each bit,
but based on the address range groupings I'd say the numbering here
is reasonable.


ChenYu

> +};
> +
> +static const struct mtk_clk_desc imp_iic_wrap_s_desc = {
> +       .clks = imp_iic_wrap_s_clks,
> +       .num_clks = ARRAY_SIZE(imp_iic_wrap_s_clks),
> +};
> +
> +static const struct mtk_clk_desc imp_iic_wrap_w_desc = {
> +       .clks = imp_iic_wrap_w_clks,
> +       .num_clks = ARRAY_SIZE(imp_iic_wrap_w_clks),
> +};
> +
> +static const struct of_device_id of_match_clk_mt8195_imp_iic_wrap[] = {
> +       {
> +               .compatible = "mediatek,mt8195-imp_iic_wrap_s",
> +               .data = &imp_iic_wrap_s_desc,
> +       }, {
> +               .compatible = "mediatek,mt8195-imp_iic_wrap_w",
> +               .data = &imp_iic_wrap_w_desc,
> +       }, {
> +               /* sentinel */
> +       }
> +};
> +
> +static struct platform_driver clk_mt8195_imp_iic_wrap_drv = {
> +       .probe = mtk_clk_simple_probe,
> +       .driver = {
> +               .name = "clk-mt8195-imp_iic_wrap",
> +               .of_match_table = of_match_clk_mt8195_imp_iic_wrap,
> +       },
> +};
> +
> +builtin_platform_driver(clk_mt8195_imp_iic_wrap_drv);
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
