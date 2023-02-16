Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E36C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 10:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZZSbDFZdEfEaPyBSTQ15cgo/opqxszYeJsFt/XNG7M=; b=gNyomxCfW+5Pc6HvAp+PmwUmZH
	0Usx6JVZX7PYSc5aYvng4ZK1UVLcMRAlzoBPEcxrfr/qcaSS49qeTm1yx2WMr59V3MYSydxN33ouh
	UElV9g0RRZjuAIjtJJeli6kba5EQ/wFsh7+egyZB9QH/9AjBHyqPQJFbVPtJydLUR4x1NVz1Gv7fl
	yWZrOWcOjzRjQ0Ly4qKTBy869yvcY9uOn0YsW6AnRM5Si/Vw0v7Z17YODozOkxkvQqsRxzsndETWs
	Us9qpfaOldA/CMFrV4tk3FTVFQS8cZSKLM8Z5qpH5+BFsOBDC6YODu5KLuOACcZzRLayidkzXMYjs
	mhny8+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbuP-009kXf-LC; Thu, 16 Feb 2023 10:54:37 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbth-009kDB-9a
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 10:53:55 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id b81so1001001vkf.1
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 02:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZZSbDFZdEfEaPyBSTQ15cgo/opqxszYeJsFt/XNG7M=;
        b=QDeUzI9Je50AAgNQq2xsr6jwaIdXh/sg9XnfmLstxf8PruPDgJBxlYv9Ps8Sk/ysOz
         hWe77FiSlo0d1waoUne9N+N6ir/Bwa4x0vtDDfk6A713G+TNc9Di8o4NP9NXnDkn9zdV
         Pf2QGG9/CT0qZkX05DsPCbTRAnOsS76jIhReM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZZSbDFZdEfEaPyBSTQ15cgo/opqxszYeJsFt/XNG7M=;
        b=EvcUkzxoYRLwEPBqsHuOQ16UbgwjEQ4Pbq1onPDGd4SRrFE/y0ggsJYsa/2iwDPit7
         q/T57nckOiHwTVFR7Jbw/KwFpYsf3BF3aciAzPd3y95rdurGlg95ibtK6iNniONKi3R6
         Qi/OkS4jmlPiVEXKLI95VV9WL+UYBOSUTsAKeKpbYazFvcm2ltfR/ymtOURrP9+zoNoC
         FF9SLljL3uePfY9TSHkUG9Pkk+Ozhn1y2pyQ5MWZM0o4XZjqV4NtG3lTrGXVDoohbOx2
         KhnQx38XtNyM2/EjsT1LraFzVNfXWVXWPLWkbYliBnFOYsEi2lCP/ePmk0OftHaAnPOj
         8fTg==
X-Gm-Message-State: AO0yUKXjysu4zcol2gPop1qPuga86NxLG1QqM1RT63ctpThemj/ElJsd
	zdabh8IR73lGHQ9/6bhl/CsZPOkq/hxVR/NWBa6p5g==
X-Google-Smtp-Source: AK7set+4875E+RvNe3i179TDI8aAI5xqgZHcUPIULqYbeKtQL2Yp7FSemOSYazgMxk92BeQAouA2zQrE2am+d8QiTxI=
X-Received: by 2002:a1f:a447:0:b0:3e8:66ce:a639 with SMTP id
 n68-20020a1fa447000000b003e866cea639mr840320vke.2.1676544829970; Thu, 16 Feb
 2023 02:53:49 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-25-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-25-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Feb 2023 18:53:39 +0800
Message-ID: <CAGXv+5EOQbZWrCZNf4qtxytDC=HdcZCxpkXb_Y=QFaW_g8urfQ@mail.gmail.com>
Subject: Re: [PATCH v2 24/47] clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_025353_387000_7378C96D 
X-CRM114-Status: GOOD (  23.37  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The infracfg driver cannot be converted to clk_mtk_simple_probe() as
> it registers cpumuxes, which is not supported on the common probing
> mechanism: for this reason, move it to its own file.
>
> While at it, also convert it to be a platform driver instead.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile              |   3 +-
>  drivers/clk/mediatek/clk-mt7622-infracfg.c | 127 +++++++++++++++++++++
>  drivers/clk/mediatek/clk-mt7622.c          |  78 +------------
>  3 files changed, 134 insertions(+), 74 deletions(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt7622-infracfg.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index c1bee331eebf..0f2cd735d9fd 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -46,7 +46,8 @@ obj-$(CONFIG_COMMON_CLK_MT2712_MFGCFG) += clk-mt2712-mfg.o
>  obj-$(CONFIG_COMMON_CLK_MT2712_MMSYS) += clk-mt2712-mm.o
>  obj-$(CONFIG_COMMON_CLK_MT2712_VDECSYS) += clk-mt2712-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT2712_VENCSYS) += clk-mt2712-venc.o
> -obj-$(CONFIG_COMMON_CLK_MT7622) += clk-mt7622.o clk-mt7622-apmixedsys.o
> +obj-$(CONFIG_COMMON_CLK_MT7622) += clk-mt7622.o clk-mt7622-apmixedsys.o \
> +                                  clk-mt7622-infracfg.o
>  obj-$(CONFIG_COMMON_CLK_MT7622_ETHSYS) += clk-mt7622-eth.o
>  obj-$(CONFIG_COMMON_CLK_MT7622_HIFSYS) += clk-mt7622-hif.o
>  obj-$(CONFIG_COMMON_CLK_MT7622_AUDSYS) += clk-mt7622-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
> new file mode 100644
> index 000000000000..09d8ac4d483a
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2017 MediaTek Inc.
> + * Copyright (c) 2023 Collabora, Ltd.
> + *               AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + */
> +
> +#include <dt-bindings/clock/mt7622-clk.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-cpumux.h"
> +#include "clk-gate.h"
> +#include "clk-mtk.h"
> +#include "reset.h"
> +
> +#define GATE_INFRA(_id, _name, _parent, _shift)                                \
> +       GATE_MTK(_id, _name, _parent, &infra_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +static const struct mtk_gate_regs infra_cg_regs = {
> +       .set_ofs = 0x40,
> +       .clr_ofs = 0x44,
> +       .sta_ofs = 0x48,
> +};
> +
> +static const char * const infra_mux1_parents[] = {
> +       "clkxtal",
> +       "armpll",
> +       "main_core_en",
> +       "armpll"
> +};
> +
> +static const struct mtk_composite cpu_muxes[] = {
> +       MUX(CLK_INFRA_MUX1_SEL, "infra_mux1_sel", infra_mux1_parents, 0x000, 2, 2),
> +};
> +
> +static const struct mtk_gate infra_clks[] = {
> +       GATE_INFRA(CLK_INFRA_DBGCLK_PD, "infra_dbgclk_pd", "axi_sel", 0),
> +       GATE_INFRA(CLK_INFRA_TRNG, "trng_ck", "axi_sel", 2),
> +       GATE_INFRA(CLK_INFRA_AUDIO_PD, "infra_audio_pd", "aud_intbus_sel", 5),
> +       GATE_INFRA(CLK_INFRA_IRRX_PD, "infra_irrx_pd", "irrx_sel", 16),
> +       GATE_INFRA(CLK_INFRA_APXGPT_PD, "infra_apxgpt_pd", "f10m_ref_sel", 18),
> +       GATE_INFRA(CLK_INFRA_PMIC_PD, "infra_pmic_pd", "pmicspi_sel", 22),
> +};
> +
> +static u16 infrasys_rst_ofs[] = { 0x30 };
> +
> +static const struct mtk_clk_rst_desc clk_rst_desc = {
> +       .version = MTK_RST_SIMPLE,
> +       .rst_bank_ofs = infrasys_rst_ofs,
> +       .rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
> +};
> +
> +static const struct of_device_id of_match_clk_mt7622_infracfg[] = {
> +       { .compatible = "mediatek,mt7622-infracfg" },
> +       { /* sentinel */ }
> +};
> +
> +static int clk_mt7622_infracfg_probe(struct platform_device *pdev)
> +{
> +       struct clk_hw_onecell_data *clk_data;
> +       struct device_node *node = pdev->dev.of_node;
> +       void __iomem *base;
> +       int ret;
> +
> +       base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(base))
> +               return PTR_ERR(base);
> +
> +       clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       ret = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
> +       if (ret)
> +               goto free_clk_data;
> +
> +       ret = mtk_clk_register_gates(&pdev->dev, node, infra_clks,
> +                                    ARRAY_SIZE(infra_clks), clk_data);
> +       if (ret)
> +               goto free_clk_data;
> +
> +       ret = mtk_clk_register_cpumuxes(&pdev->dev, node, cpu_muxes,
> +                                       ARRAY_SIZE(cpu_muxes), clk_data);
> +       if (ret)
> +               goto unregister_gates;
> +
> +       ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> +       if (ret)
> +               goto unregister_cpumuxes;
> +
> +       return 0;
> +
> +unregister_cpumuxes:
> +       mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
> +unregister_gates:
> +       mtk_clk_unregister_gates(infra_clks, ARRAY_SIZE(infra_clks), clk_data);
> +free_clk_data:
> +       mtk_free_clk_data(clk_data);

Implementing error handling deserves a separate commit, or at least a mention.

ChenYu

