Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704D5C636CC
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 07:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WP6MW/AxTXjVByX3Tw5+ZQ2b+cfJfjcOdQtYVTAliZk=; b=T6UCiNvt+Dtj1fOre0pi6dgose
	0SiEOEkAZcKOuFvjsRXof+vYEtyajE1IwZrW1Gx8cuPyhYUPNf6p5O0+cM3u1MgVGKYjIZ1rRnaMd
	c0yMAPFfROhD4YPhRCRRLWrKAs+SeZRWNNMwNEVk0Wb9Ahvk1Gdf3QWWXO73GGkzCltAF9HbTj3s9
	LNTQ07N2XxSw9idCxOl/YJc8owZBclLKhXgOtSna3VPS86UlgEQgfo2GTd0SCS/fU2STnqL3kza1E
	ITi1gzHMSLb79ujwIplFOMsXlOqBLWb9tegHzutLQXpiK6yGYGHPrs7BrOe+1qYY+DRJWiyPWyLrV
	fai8f1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqJv-000l2s-9q; Fri, 03 Feb 2023 07:17:15 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqJs-000l1f-6v
	for linux-mediatek@lists.infradead.org; Fri, 03 Feb 2023 07:17:13 +0000
Received: by mail-vs1-xe35.google.com with SMTP id h19so4429840vsv.13
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 23:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WP6MW/AxTXjVByX3Tw5+ZQ2b+cfJfjcOdQtYVTAliZk=;
        b=aKRsAKk3/tQQjWAq76ElA8GyUDDyLbiVUpOBYDhOFOOpN39NDlJDp7QhfjWvqLF6gQ
         NFl8GueeryM2GB3Cw+xJir/zhirD/tdS4tX5G3ZHNTtSvoCe6AW+fZ1qUD4b+wVAkylF
         1I6x7t4VPdTQIxwtQ4Scq7d1g8zvIrmj7qWqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WP6MW/AxTXjVByX3Tw5+ZQ2b+cfJfjcOdQtYVTAliZk=;
        b=kClbx1ZdZChfaDt8wrqaQupi+VwZ6f4iL9YW23J9sHZAD/ozVb0NIq+WZn93wG7p6C
         UvV1NAM6XpVBRFUcj2frwdGXuqfH3eBW349BgY51taB2CU515j4rZI2VEJyMBJmXz93C
         dcukbtrvtbnoGu7K92xLXzBzKDsnv1Sy2YwnrqNs9Xk6B7OoxcWafYrbmiqkik4rsb0L
         KVRENqS9yvE0KLdUEOBM0t3KVebo+g/1wtSogKzkuunhUdiVcbDSheJOrLdNP7qh4ITk
         P2+Q4uSeksCSjt1zJZ8Y/Lhl8A2KpHXHwYi+9/Y5+kn0LAIOprFQgeYiPFRipCsNJafe
         X8Ww==
X-Gm-Message-State: AO0yUKUzh5xWhnqGS9ZLK+aNsw+MMjth16D+jWVY+IQRj/M6H+ojh1Zi
	FstR2xPDoteZzliW91orhALVkYTHtCDrawFdMfPF3A==
X-Google-Smtp-Source: AK7set+SibYPv5VxOZavVaTXiZ4zOO474EeZunS1fpxZm92G7Fj+lArt7EhMvgZpDSSJrbsgV1bpwWy/kPckgN38X5s=
X-Received: by 2002:a67:f551:0:b0:3e8:d5a8:3fbe with SMTP id
 z17-20020a67f551000000b003e8d5a83fbemr1543370vsn.9.1675408631029; Thu, 02 Feb
 2023 23:17:11 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-12-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-12-Garmin.Chang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Feb 2023 15:17:00 +0800
Message-ID: <CAGXv+5HtzbrA5dpzXSoSXMFooHXoeX7iwJA9A1HJKQ09qm+Umw@mail.gmail.com>
Subject: Re: [PATCH v5 11/19] clk: mediatek: Add MT8188 vdecsys clock support
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
X-CRM114-CacheID: sfid-20230202_231712_303531_D624C251 
X-CRM114-Status: GOOD (  19.59  )
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

On Thu, Jan 19, 2023 at 8:49 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 vdec clock controllers which provide clock gate
> control for video decoder.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> ---
>  drivers/clk/mediatek/Makefile          |  2 +-
>  drivers/clk/mediatek/clk-mt8188-vdec.c | 90 ++++++++++++++++++++++++++
>  2 files changed, 91 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8188-vdec.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index a0fd87a882b5..7d09e9fc6538 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -86,7 +86,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
>  obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o \
>                                    clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o \
>                                    clk-mt8188-cam.o clk-mt8188-ccu.o clk-mt8188-img.o \
> -                                  clk-mt8188-ipe.o clk-mt8188-mfg.o
> +                                  clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8188-vdec.c b/drivers/clk/mediatek/clk-mt8188-vdec.c
> new file mode 100644
> index 000000000000..e05a27957136
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8188-vdec.c
> @@ -0,0 +1,90 @@
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
> +static const struct mtk_gate_regs vde0_cg_regs = {

Could you replace all instances of "vde" (both upper and lower case)
with "vdec" to be consistent with usages elsewhere?

> +       .set_ofs = 0x0,
> +       .clr_ofs = 0x4,
> +       .sta_ofs = 0x0,
> +};
> +
> +static const struct mtk_gate_regs vde1_cg_regs = {
> +       .set_ofs = 0x200,
> +       .clr_ofs = 0x204,
> +       .sta_ofs = 0x200,
> +};
> +
> +static const struct mtk_gate_regs vde2_cg_regs = {
> +       .set_ofs = 0x8,
> +       .clr_ofs = 0xc,
> +       .sta_ofs = 0x8,
> +};
> +
> +#define GATE_VDE0(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &vde0_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
> +
> +#define GATE_VDE1(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &vde1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
> +
> +#define GATE_VDE2(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &vde2_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
> +
> +static const struct mtk_gate vde1_clks[] = {
> +       /* VDE1_0 */
> +       GATE_VDE0(CLK_VDE1_SOC_VDEC, "vde1_soc_vdec", "top_vdec", 0),
> +       GATE_VDE0(CLK_VDE1_SOC_VDEC_ACTIVE, "vde1_soc_vdec_active", "top_vdec", 4),
> +       GATE_VDE0(CLK_VDE1_SOC_VDEC_ENG, "vde1_soc_vdec_eng", "top_vdec", 8),
> +       /* VDE1_1 */
> +       GATE_VDE1(CLK_VDE1_SOC_LAT, "vde1_soc_lat", "top_vdec", 0),
> +       GATE_VDE1(CLK_VDE1_SOC_LAT_ACTIVE, "vde1_soc_lat_active", "top_vdec", 4),
> +       GATE_VDE1(CLK_VDE1_SOC_LAT_ENG, "vde1_soc_lat_eng", "top_vdec", 8),
> +       /* VDE12 */

Add an underscore like the above?

ChenYu

> +       GATE_VDE2(CLK_VDE1_SOC_LARB1, "vde1_soc_larb1", "top_vdec", 0),
> +};
> +
> +static const struct mtk_gate vde2_clks[] = {
> +       /* VDE2_0 */
> +       GATE_VDE0(CLK_VDE2_VDEC, "vde2_vdec", "top_vdec", 0),
> +       GATE_VDE0(CLK_VDE2_VDEC_ACTIVE, "vde2_vdec_active", "top_vdec", 4),
> +       GATE_VDE0(CLK_VDE2_VDEC_ENG, "vde2_vdec_eng", "top_vdec", 8),
> +       /* VDE2_1 */
> +       GATE_VDE1(CLK_VDE2_LAT, "vde2_lat", "top_vdec", 0),
> +       /* VDE2_2 */
> +       GATE_VDE2(CLK_VDE2_LARB1, "vde2_larb1", "top_vdec", 0),
> +};
> +
> +static const struct mtk_clk_desc vde1_desc = {
> +       .clks = vde1_clks,
> +       .num_clks = ARRAY_SIZE(vde1_clks),
> +};
> +
> +static const struct mtk_clk_desc vde2_desc = {
> +       .clks = vde2_clks,
> +       .num_clks = ARRAY_SIZE(vde2_clks),
> +};
> +
> +static const struct of_device_id of_match_clk_mt8188_vde[] = {
> +       { .compatible = "mediatek,mt8188-vdecsys-soc", .data = &vde1_desc },
> +       { .compatible = "mediatek,mt8188-vdecsys", .data = &vde2_desc },
> +       { /* sentinel */ }
> +};
> +
> +static struct platform_driver clk_mt8188_vde_drv = {
> +       .probe = mtk_clk_simple_probe,
> +       .remove = mtk_clk_simple_remove,
> +       .driver = {
> +               .name = "clk-mt8188-vde",
> +               .of_match_table = of_match_clk_mt8188_vde,
> +       },
> +};
> +
> +builtin_platform_driver(clk_mt8188_vde_drv);
> +MODULE_LICENSE("GPL");
> --
> 2.18.0
>
>

