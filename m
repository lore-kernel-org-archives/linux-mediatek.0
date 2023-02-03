Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51269C636CC
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 07:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnqohepmJa02iQzv6KIF3XV1XpzLx8j7mEp5PrY56aY=; b=36ev5UC1lEDfEHqjGpaBxuc83C
	Z9dzzjAW+IONuiJCBfJ6phSQPg+lfY8uDc1+VO+ee8lB2qNxwt6er0NF8+ZNyodeD8p5PnmgSIHoW
	jF8JQGiDQovfZ2a2ipnSUt6yPOXbP07qJffn37cA7Q9uzJDFcCNeLVXkSnk1zW954fCvEpg+1qURS
	UDhqmVHxOyMCnXKRyEoRPnbmH2TrWAoKqs3bHWqEtehjCIf3xZ4Ag3eNDc8fQiXl3zeCPwBTU0kPM
	aSZ9WcO7GDSlHTTzCbG29ynh3tImYY9IFueghMI2AsjPlFW1QOFVpSxUinWkqSgSat/bEWHL3vo+c
	4cIJlQjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqSR-000mt2-NL; Fri, 03 Feb 2023 07:26:03 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqSG-000mpZ-K0
	for linux-mediatek@lists.infradead.org; Fri, 03 Feb 2023 07:25:55 +0000
Received: by mail-vs1-xe29.google.com with SMTP id s24so4445926vsi.12
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 23:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qnqohepmJa02iQzv6KIF3XV1XpzLx8j7mEp5PrY56aY=;
        b=d1V4RalDykH+eYJ0ijdqMHKhTm9Br6Qy67RGt94My2LbwUpT2hKbh9NhJs/Q5WPKtJ
         p7B+9FPOZCJ5XgjJLmA0FyAi+1C1Q17gy0NMsJiDwj7HtLjowv1Ob7zPD+IicxWjAlSb
         BFuT/bx88qD9AGgcoGRekuLM3lnweBUz5C1x0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnqohepmJa02iQzv6KIF3XV1XpzLx8j7mEp5PrY56aY=;
        b=YBZPSleUtksivy8wAqG3dr+NKYM/DJTIKTaNR6aW96fY60rlhlIQzQ+93L39p48gnZ
         dIBa7fkn1tfOIziDoq41TRhiqzInbjdluBSci3ohx1I01LReAbyLTgrnqdGGftidEpaV
         qIcqpLhxrwVVtgue9NZf7A7664mJGPypT8Boakn9frgnru0Oq4sgSjMEIx7yGf+BBTso
         LwRmxp6TJPwNlME2QzsSs4oGW3d6daNj2kBAeTe24WTg1F0+0xpm3jCz+NjS/Q0QM6Jv
         SADGb9WAEUwkyQ+AABufGWTxB10VyM487MYGcPUcLP2N0IFN4IdRGkztO0e0M0p7hmhH
         7wQA==
X-Gm-Message-State: AO0yUKVTIoIN/+2vNl0XtdqDXWNHWE7MyuYbH0hilMZTjQYz4e2oHGNW
	RqQK/0S95b+Pem8KSs87SW7F7V0sZYiolLPdxrE+kg==
X-Google-Smtp-Source: AK7set/QhhNfvDnI8ndzCui1EaYl9KSQkOZVYXLyNV4ahcE56o+jXFfQpW+COvR08tXJVdwmEFSkso5rv+20ss21tG4=
X-Received: by 2002:a05:6102:23f2:b0:3ed:89c7:4bd2 with SMTP id
 p18-20020a05610223f200b003ed89c74bd2mr1674741vsc.26.1675409151465; Thu, 02
 Feb 2023 23:25:51 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-15-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-15-Garmin.Chang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Feb 2023 15:25:40 +0800
Message-ID: <CAGXv+5ECLKewj1_sU9WzJA9Z8pRyKBo6fxBLrogoBH76Y5f32w@mail.gmail.com>
Subject: Re: [PATCH v5 14/19] clk: mediatek: Add MT8188 vencsys clock support
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_232552_684713_15C0E493 
X-CRM114-Status: GOOD (  19.47  )
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

On Thu, Jan 19, 2023 at 8:55 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 vencsys clock controllers which provide clock gate
> control for video encoder.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> ---
>  drivers/clk/mediatek/Makefile          |  2 +-
>  drivers/clk/mediatek/clk-mt8188-venc.c | 52 ++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8188-venc.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index c654f4288e09..22a3840160fc 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -87,7 +87,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o
>                                    clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o \
>                                    clk-mt8188-cam.o clk-mt8188-ccu.o clk-mt8188-img.o \
>                                    clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o \
> -                                  clk-mt8188-vdo0.o clk-mt8188-vdo1.o
> +                                  clk-mt8188-vdo0.o clk-mt8188-vdo1.o clk-mt8188-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8188-venc.c b/drivers/clk/mediatek/clk-mt8188-venc.c
> new file mode 100644
> index 000000000000..375ef99e2349
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8188-venc.c
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2022 MediaTek Inc.
> +// Author: Garmin Chang <garmin.chang@mediatek.com>
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/clock/mediatek,mt8188-clk.h>
> +
> +#include "clk-gate.h"
> +#include "clk-mtk.h"
> +
> +static const struct mtk_gate_regs ven1_cg_regs = {

Like the vdecsys patch, please change "ven" to "venc" to be consistent
with usages elsewhere.

> +       .set_ofs = 0x4,
> +       .clr_ofs = 0x8,
> +       .sta_ofs = 0x0,
> +};
> +
> +#define GATE_VEN1(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &ven1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
> +
> +static const struct mtk_gate ven1_clks[] = {
> +       GATE_VEN1(CLK_VEN1_CKE0_LARB, "ven1_cke0_larb", "top_venc", 0),
> +       GATE_VEN1(CLK_VEN1_CKE1_VENC, "ven1_cke1_venc", "top_venc", 4),
> +       GATE_VEN1(CLK_VEN1_CKE2_JPGENC, "ven1_cke2_jpgenc", "top_venc", 8),
> +       GATE_VEN1(CLK_VEN1_CKE3_JPGDEC, "ven1_cke3_jpgdec", "top_venc", 12),
> +       GATE_VEN1(CLK_VEN1_CKE4_JPGDEC_C1, "ven1_cke4_jpgdec_c1", "top_venc", 16),
> +       GATE_VEN1(CLK_VEN1_CKE5_GALS, "ven1_cke5_gals", "top_venc", 28),
> +       GATE_VEN1(CLK_VEN1_CKE6_GALS_SRAM, "ven1_cke6_gals_sram", "top_venc", 31),

Is ckeN in both the macro name and clock name necessary? We don't really
care about the index.

ChenYu

> +};
> +
> +static const struct mtk_clk_desc ven1_desc = {
> +       .clks = ven1_clks,
> +       .num_clks = ARRAY_SIZE(ven1_clks),
> +};
> +
> +static const struct of_device_id of_match_clk_mt8188_ven1[] = {
> +       { .compatible = "mediatek,mt8188-vencsys", .data = &ven1_desc },
> +       { /* sentinel */ }
> +};
> +
> +static struct platform_driver clk_mt8188_ven1_drv = {
> +       .probe = mtk_clk_simple_probe,
> +       .remove = mtk_clk_simple_remove,
> +       .driver = {
> +               .name = "clk-mt8188-ven1",
> +               .of_match_table = of_match_clk_mt8188_ven1,
> +       },
> +};
> +
> +builtin_platform_driver(clk_mt8188_ven1_drv);
> +MODULE_LICENSE("GPL");
> --
> 2.18.0
>
>

