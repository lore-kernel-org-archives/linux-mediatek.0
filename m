Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15B2C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 07:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDNHGN8nrxFSnRpITwz2xs02HiZezajyAaFZXBng49k=; b=kQebZJoMIxZatyBi2PBWJ1hIh7
	N8pfZMUU7G4tJXZCQIqfaDZcPNE0qddAkAp8sYr8abD5eTNOn0Vd+uM1XXzrOvkiNC2LSPA9dh8vB
	yrSZ+44nzIJiwXlDbywUeoXOSX5mqne1vej/6o4J+ORUjU2EHAAc4Iq0BkC2jPHG3MgkZcmplH7s/
	Yjal9PCFq0gXS2OQiCNy/1uzpGrP/HEcSE07UXg+/0fuVSgNkH7upLaoVQTDf+aCEjeMrAy/rNX1O
	dplkKDL1rvkwH+vlRF0EbYtVONRUyZ0Hrcb88g0yuAOVgHd81NNhY2OFa2Ng4Tsd3sZA3OW7yHdpd
	bW3OI0sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqaH-000oNI-Ci; Fri, 03 Feb 2023 07:34:09 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqaE-000oMT-J0
	for linux-mediatek@lists.infradead.org; Fri, 03 Feb 2023 07:34:08 +0000
Received: by mail-vs1-xe30.google.com with SMTP id m1so2630236vst.7
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 23:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kDNHGN8nrxFSnRpITwz2xs02HiZezajyAaFZXBng49k=;
        b=QTqtPauq1xzfYyDeru6IHHNrKqKNrAjrp+Fs0J0iLqOV82T4SijssLLRj0wG6mg1I+
         sxHDgVkM8wQQA5yg93FUWw5nkilzZbKom/LHi2JUL0WaChjvzGYuqh0awCAIAKyc08k5
         mFWjx/I2AAmgmGyKEkTeDEg9Kc+jNRFaXnEjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDNHGN8nrxFSnRpITwz2xs02HiZezajyAaFZXBng49k=;
        b=G9YKAks+hwy9INfxe8qh7dCYsEDkzwCwpED5CYS/X3FWiplh7JCxN9Mtyagb6W9bKk
         O0IC+eYtO22fVYjqLoRkxxMDdgKiUME3edW9HJa0GI+B6sduZYQ4MeXw6oALtgZIRj5X
         pSdnXF3hHegRzq2p4Cs3LdXKsQty91yc5241KB66PXTF58c2pqMvFrYAaGZ0YFhsGb9O
         OqG12nQ1ZTn2HGSLVdXHSWRaROvNiN+hCjRTXvpbsybOuR5V3KZ2JqCB5EBBqP1sBn9f
         1ZJUuo73OKOfTpUxfyKN8A/dOC3D4ry705grCAaNsMCHxjNhQhBaCBXjNQqnLqlEyeNf
         yzDw==
X-Gm-Message-State: AO0yUKUETNWAmlADJZXFg2HV9eqiSwEauoW6Ko3BkfgWUzJOuaAt7Gdb
	HBBQuwxwiSUU/SxPG0+YNflWlVPtxr4BZaOtON8iUQ==
X-Google-Smtp-Source: AK7set8G7nG0OeXnPgIUli6KfxxqD7unm1DYpGYRx69ixoGiyWzE6FunCrQhRFoxM1rwsGmMGajU0tYX8h2jhaRiRMY=
X-Received: by 2002:a05:6102:322a:b0:3fe:ae88:d22 with SMTP id
 x10-20020a056102322a00b003feae880d22mr1497500vsf.65.1675409645592; Thu, 02
 Feb 2023 23:34:05 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-16-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-16-Garmin.Chang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Feb 2023 15:33:54 +0800
Message-ID: <CAGXv+5GxcgRd13Dd_29+y3cUWw--92Uut_1cN1D24E9OJTKF4A@mail.gmail.com>
Subject: Re: [PATCH v5 15/19] clk: mediatek: Add MT8188 vppsys0 clock support
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
X-CRM114-CacheID: sfid-20230202_233406_650191_23D870CB 
X-CRM114-Status: GOOD (  18.60  )
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

On Thu, Jan 19, 2023 at 8:54 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 vppsys0 clock controller which provides clock gate
> controller for Video Processor Pipe.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> ---
>  drivers/clk/mediatek/Makefile          |   3 +-
>  drivers/clk/mediatek/clk-mt8188-vpp0.c | 143 +++++++++++++++++++++++++
>  2 files changed, 145 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8188-vpp0.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 22a3840160fc..48deecc6b520 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -87,7 +87,8 @@ obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o
>                                    clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o \
>                                    clk-mt8188-cam.o clk-mt8188-ccu.o clk-mt8188-img.o \
>                                    clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o \
> -                                  clk-mt8188-vdo0.o clk-mt8188-vdo1.o clk-mt8188-venc.o
> +                                  clk-mt8188-vdo0.o clk-mt8188-vdo1.o clk-mt8188-venc.o \
> +                                  clk-mt8188-vpp0.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8188-vpp0.c b/drivers/clk/mediatek/clk-mt8188-vpp0.c
> new file mode 100644
> index 000000000000..e7b46142d653
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8188-vpp0.c
> @@ -0,0 +1,143 @@
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
> +static const struct mtk_gate_regs vpp0_0_cg_regs = {
> +       .set_ofs = 0x24,
> +       .clr_ofs = 0x28,
> +       .sta_ofs = 0x20,
> +};
> +
> +static const struct mtk_gate_regs vpp0_1_cg_regs = {
> +       .set_ofs = 0x30,
> +       .clr_ofs = 0x34,
> +       .sta_ofs = 0x2c,
> +};
> +
> +static const struct mtk_gate_regs vpp0_2_cg_regs = {
> +       .set_ofs = 0x3c,
> +       .clr_ofs = 0x40,
> +       .sta_ofs = 0x38,
> +};
> +
> +#define GATE_VPP0_0(_id, _name, _parent, _shift)                       \
> +       GATE_MTK(_id, _name, _parent, &vpp0_0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +#define GATE_VPP0_1(_id, _name, _parent, _shift)                       \
> +       GATE_MTK(_id, _name, _parent, &vpp0_1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +#define GATE_VPP0_2(_id, _name, _parent, _shift)                       \
> +       GATE_MTK(_id, _name, _parent, &vpp0_2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +static const struct mtk_gate vpp0_clks[] = {
> +       /* VPP0_0 */
> +       GATE_VPP0_0(CLK_VPP0_MDP_FG, "vpp0_mdp_fg", "top_vpp", 1),
> +       GATE_VPP0_0(CLK_VPP0_STITCH, "vpp0_stitch", "top_vpp", 2),
> +       GATE_VPP0_0(CLK_VPP0_PADDING, "vpp0_padding", "top_vpp", 7),
> +       GATE_VPP0_0(CLK_VPP0_MDP_TCC, "vpp0_mdp_tcc", "top_vpp", 8),
> +       GATE_VPP0_0(CLK_VPP0_WARP0_ASYNC_TX, "vpp0_warp0_async_tx", "top_vpp", 10),
> +       GATE_VPP0_0(CLK_VPP0_WARP1_ASYNC_TX, "vpp0_warp1_async_tx", "top_vpp", 11),
> +       GATE_VPP0_0(CLK_VPP0_MUTEX, "vpp0_mutex", "top_vpp", 13),
> +       GATE_VPP0_0(CLK_VPP02VPP1_RELAY, "vpp02vpp1_relay", "top_vpp", 14),
> +       GATE_VPP0_0(CLK_VPP0_VPP12VPP0_ASYNC, "vpp0_vpp12vpp0_async", "top_vpp", 15),
> +       GATE_VPP0_0(CLK_VPP0_MMSYSRAM_TOP, "vpp0_mmsysram_top", "top_vpp", 16),
> +       GATE_VPP0_0(CLK_VPP0_MDP_AAL, "vpp0_mdp_aal", "top_vpp", 17),
> +       GATE_VPP0_0(CLK_VPP0_MDP_RSZ, "vpp0_mdp_rsz", "top_vpp", 18),
> +       /* VPP0_1 */
> +       GATE_VPP0_1(CLK_VPP0_SMI_COMMON_MMSRAM, "vpp0_smi_common_mmsram", "top_vpp", 0),
> +       GATE_VPP0_1(CLK_VPP0_GALS_VDO0_LARB0_MMSRAM, "vpp0_gals_vdo0_larb0_mmsram", "top_vpp", 1),
> +       GATE_VPP0_1(CLK_VPP0_GALS_VDO0_LARB1_MMSRAM, "vpp0_gals_vdo0_larb1_mmsram", "top_vpp", 2),
> +       GATE_VPP0_1(CLK_VPP0_GALS_VENCSYS_MMSRAM, "vpp0_gals_vencsys_mmsram", "top_vpp", 3),
> +       GATE_VPP0_1(CLK_VPP0_GALS_VENCSYS_CORE1_MMSRAM,
> +                   "vpp0_gals_vencsys_core1_mmsram", "top_vpp", 4),
> +       GATE_VPP0_1(CLK_VPP0_GALS_INFRA_MMSRAM, "vpp0_gals_infra_mmsram", "top_vpp", 5),
> +       GATE_VPP0_1(CLK_VPP0_GALS_CAMSYS_MMSRAM, "vpp0_gals_camsys_mmsram", "top_vpp", 6),
> +       GATE_VPP0_1(CLK_VPP0_GALS_VPP1_LARB5_MMSRAM, "vpp0_gals_vpp1_larb5_mmsram", "top_vpp", 7),
> +       GATE_VPP0_1(CLK_VPP0_GALS_VPP1_LARB6_MMSRAM, "vpp0_gals_vpp1_larb6_mmsram", "top_vpp", 8),
> +       GATE_VPP0_1(CLK_VPP0_SMI_REORDER_MMSRAM, "vpp0_smi_reorder_mmsram", "top_vpp", 9),
> +       GATE_VPP0_1(CLK_VPP0_SMI_IOMMU, "vpp0_smi_iommu", "top_vpp", 10),
> +       GATE_VPP0_1(CLK_VPP0_GALS_IMGSYS_CAMSYS, "vpp0_gals_imgsys_camsys", "top_vpp", 11),
> +       GATE_VPP0_1(CLK_VPP0_MDP_RDMA, "vpp0_mdp_rdma", "top_vpp", 12),
> +       GATE_VPP0_1(CLK_VPP0_MDP_WROT, "vpp0_mdp_wrot", "top_vpp", 13),
> +       GATE_VPP0_1(CLK_VPP0_GALS_EMI0_EMI1, "vpp0_gals_emi0_emi1", "top_vpp", 16),
> +       GATE_VPP0_1(CLK_VPP0_SMI_SUB_COMMON_REORDER, "vpp0_smi_sub_common_reorder", "top_vpp", 17),
> +       GATE_VPP0_1(CLK_VPP0_SMI_RSI, "vpp0_smi_rsi", "top_vpp", 18),
> +       GATE_VPP0_1(CLK_VPP0_SMI_COMMON_LARB4, "vpp0_smi_common_larb4", "top_vpp", 19),
> +       GATE_VPP0_1(CLK_VPP0_GALS_VDEC_VDEC_CORE1, "vpp0_gals_vdec_vdec_core1", "top_vpp", 20),
> +       GATE_VPP0_1(CLK_VPP0_GALS_VPP1_WPESYS, "vpp0_gals_vpp1_wpesys", "top_vpp", 21),
> +       GATE_VPP0_1(CLK_VPP0_GALS_VDO0_VDO1_VENCSYS_CORE1,
> +                   "vpp0_gals_vdo0_vdo1_vencsys_core1", "top_vpp", 22),
> +       GATE_VPP0_1(CLK_VPP0_FAKE_ENG, "vpp0_fake_eng", "top_vpp", 23),
> +       GATE_VPP0_1(CLK_VPP0_MDP_HDR, "vpp0_mdp_hdr", "top_vpp", 24),
> +       GATE_VPP0_1(CLK_VPP0_MDP_TDSHP, "vpp0_mdp_tdshp", "top_vpp", 25),
> +       GATE_VPP0_1(CLK_VPP0_MDP_COLOR, "vpp0_mdp_color", "top_vpp", 26),
> +       GATE_VPP0_1(CLK_VPP0_MDP_OVL, "vpp0_mdp_ovl", "top_vpp", 27),
> +       GATE_VPP0_1(CLK_VPP0_DSIP_RDMA, "vpp0_dsip_rdma", "top_vpp", 28),
> +       GATE_VPP0_1(CLK_VPP0_DISP_WDMA, "vpp0_disp_wdma", "top_vpp", 29),
> +       GATE_VPP0_1(CLK_VPP0_MDP_HMS, "vpp0_mdp_hms", "top_vpp", 30),
> +       /* VPP0_2 */
> +       GATE_VPP0_2(CLK_VPP0_WARP0_RELAY, "vpp0_warp0_relay", "top_wpe_vpp", 0),
> +       GATE_VPP0_2(CLK_VPP0_WARP0_ASYNC, "vpp0_warp0_async", "top_wpe_vpp", 1),
> +       GATE_VPP0_2(CLK_VPP0_WARP1_RELAY, "vpp0_warp1_relay", "top_wpe_vpp", 2),
> +       GATE_VPP0_2(CLK_VPP0_WARP1_ASYNC, "vpp0_warp1_async", "top_wpe_vpp", 3),
> +};
> +
> +static int clk_mt8188_vpp0_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *node = dev->parent->of_node;
> +       struct clk_hw_onecell_data *clk_data;
> +       int r;
> +
> +       clk_data = mtk_alloc_clk_data(CLK_VPP0_NR_CLK);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       r = mtk_clk_register_gates(node, vpp0_clks, ARRAY_SIZE(vpp0_clks), clk_data);

This API has changed. Please rebase and update.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

