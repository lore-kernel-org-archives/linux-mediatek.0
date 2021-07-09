Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60BDC07E9B
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 10:26:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AB7861248
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 10:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AB7861248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FVV9Ysk7hyvUTA32LqMl6Sdli9MmSNB6hXF7L+qv+zg=; b=Gk9MNi4LRVF69r
	KRqxRnAKaKN6YLArFJ/8Gyq7No0uoTn5MuTiJl9Yn/0xAjPjV2pgqLJzLrOf/iAensBQYNgKa1C4I
	ZIS1tFtbkLUqoKuvGlhbDLEWJy4FDoQaawkPupjBNFNeRSg0CeA4xe3DdREmf66vCF3SYCSkiVidz
	zNBpLeEknNEHAbULWALWM+cGv544OPW7Rw5VW1j2i5Ct761eFcJyPMnr+g16f4x4cEJukl4usYvQ5
	MGD6Ul12E3aQxPQVcN+wqEZjpHh+7Ix4LQPQj2NWFVy8IgmmSIpns9NWpMA5VUwp9CSZdeO9I4cib
	rNgb5CDdhAmuN4d3sd+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1ni8-001VD0-9M; Fri, 09 Jul 2021 10:26:20 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1ni4-001VBt-Tw
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 10:26:18 +0000
Received: by mail-lf1-x136.google.com with SMTP id t17so22418527lfq.0
 for <linux-mediatek@lists.infradead.org>; Fri, 09 Jul 2021 03:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AiaAvA+vLz3FtrBULzF8WYojeUlJAsTsVtqvKG72rx8=;
 b=n6i8wmahbKpTtiTt0jZRJpTElaUmS8kvMSaaMepN4+Z4nT1EWnUVTcrFySgZVpkyEv
 7WnelJAP3/nh8X1jVzN6ZI74Jo63Z3tjeLfj0gUuC1ngOQEQJvLLHjhKKjCggLbtlmNN
 wUjHJCZTwSVD0YxS2JqHVQkuEUSKGN6hGZUxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AiaAvA+vLz3FtrBULzF8WYojeUlJAsTsVtqvKG72rx8=;
 b=FSCgv5SgunEe0tqW+CTIBONiUalEJGYFvTWSWaj40v4Le4vWB5cpjlyBVgwuINnnkI
 s6qZ89z88qCGAWPkTFIj/pKiEKhjHYpEYSW5AKdnDet1ID8mBUESliKKD+zXc1VFvy9V
 3r2NbWh6Dxd4+1gTodLQc/9VXLJZ5fPEFeGT/o6K90vgjZ6Pgz/hyKzcL8XDCuBYRMex
 OWfpO9rsVKicJ6wiQKaKFO1NB5FqKnciv4CzvIFSJHhc5wFed8jc23LoFgw655geELDK
 uL+3rKqY+LVzNkcj7W4eXk+KmPtciNupfvhJ9/f6Ub/b9gGIas4nZGMjD1/jg20MJcsb
 /ixg==
X-Gm-Message-State: AOAM531Z+ws3wYOMjWx3diwYjro4+tEgA8l9CI4heE+BMl7TYkdK+Je7
 bClPZtsm13V+V99u0Z9AQ8UkugB504nwy33gZVLqCw==
X-Google-Smtp-Source: ABdhPJyTbIWxzkC7SuGEvymnm5fWso+1YwVVNumQfR2/BL/A4l+vH4cT2fmxdtPEjDSgvQYB1IhmFTLBsrM2cgSPZoU=
X-Received: by 2002:a05:6512:39cb:: with SMTP id
 k11mr3933643lfu.587.1625826374731; 
 Fri, 09 Jul 2021 03:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-18-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-18-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 9 Jul 2021 18:26:03 +0800
Message-ID: <CAGXv+5ELfV_zogQQrTWFPHezyaZ8zm5HJ8uVMi98q68vVG+WSg@mail.gmail.com>
Subject: Re: [PATCH 17/22] clk: mediatek: Add MT8195 vencsys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_032617_030633_AAA5ED9B 
X-CRM114-Status: GOOD (  25.29  )
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

On Thu, Jun 17, 2021 at 7:10 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 vencsys clock providers
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig           |  6 +++
>  drivers/clk/mediatek/Makefile          |  1 +
>  drivers/clk/mediatek/clk-mt8195-venc.c | 71 ++++++++++++++++++++++++++
>  3 files changed, 78 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-venc.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 1e89c68f6c6c..3352686d98cf 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -660,6 +660,12 @@ config COMMON_CLK_MT8195_VDOSYS1
>         help
>           This driver supports MediaTek MT8195 vdosys1 clocks.
>
> +config COMMON_CLK_MT8195_VENCSYS
> +       bool "Clock driver for MediaTek MT8195 vencsys"
> +       depends on COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 vencsys clocks.
> +
>  config COMMON_CLK_MT8516
>         bool "Clock driver for MediaTek MT8516"
>         depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 76c0fa837cb0..76a6b404e34b 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -93,5 +93,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195_NNASYS) += clk-mt8195-nna.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VDECSYS) += clk-mt8195-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS0) += clk-mt8195-vdo0.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS1) += clk-mt8195-vdo1.o
> +obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) += clk-mt8195-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
>  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt8195-venc.c b/drivers/clk/mediatek/clk-mt8195-venc.c
> new file mode 100644
> index 000000000000..410ca69d5759
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8195-venc.c
> @@ -0,0 +1,71 @@
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
> +static const struct mtk_gate_regs venc_cg_regs = {
> +       .set_ofs = 0x4,
> +       .clr_ofs = 0x8,
> +       .sta_ofs = 0x0,
> +};
> +
> +#define GATE_VENC(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &venc_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
> +
> +static const struct mtk_gate venc_clks[] = {
> +       GATE_VENC(CLK_VENC_LARB, "venc_larb", "venc_sel", 0),
> +       GATE_VENC(CLK_VENC_VENC, "venc_venc", "venc_sel", 4),
> +       GATE_VENC(CLK_VENC_JPGENC, "venc_jpgenc", "venc_sel", 8),
> +       GATE_VENC(CLK_VENC_JPGDEC, "venc_jpgdec", "venc_sel", 12),
> +       GATE_VENC(CLK_VENC_JPGDEC_C1, "venc_jpgdec_c1", "venc_sel", 16),
> +       GATE_VENC(CLK_VENC_GALS, "venc_gals", "venc_sel", 28),
> +};
> +
> +static const struct mtk_gate venc_core1_clks[] = {
> +       GATE_VENC(CLK_VENC_CORE1_LARB, "venc_core1_larb", "venc_sel", 0),
> +       GATE_VENC(CLK_VENC_CORE1_VENC, "venc_core1_venc", "venc_sel", 4),
> +       GATE_VENC(CLK_VENC_CORE1_JPGENC, "venc_core1_jpgenc", "venc_sel", 8),
> +       GATE_VENC(CLK_VENC_CORE1_JPGDEC, "venc_core1_jpgdec", "venc_sel", 12),
> +       GATE_VENC(CLK_VENC_CORE1_JPGDEC_C1, "venc_core1_jpgdec_c1", "venc_sel", 16),
> +       GATE_VENC(CLK_VENC_CORE1_GALS, "venc_core1_gals", "venc_sel", 28),
> +};

So I'm not sure why there are two sets of clocks for each endpoint.
Since this hardware block is not documented in the datasheet, maybe
you could provide some explanation? What I'm wondering is if the
first set is actually some clock gate for bus access and the second
set is the main module clock that drives the internal logic.

The general comments from the other patches apply as well.


ChenYu

> +
> +static const struct mtk_clk_desc venc_desc = {
> +       .clks = venc_clks,
> +       .num_clks = ARRAY_SIZE(venc_clks),
> +};
> +
> +static const struct mtk_clk_desc venc_core1_desc = {
> +       .clks = venc_core1_clks,
> +       .num_clks = ARRAY_SIZE(venc_core1_clks),
> +};
> +
> +static const struct of_device_id of_match_clk_mt8195_venc[] = {
> +       {
> +               .compatible = "mediatek,mt8195-vencsys",
> +               .data = &venc_desc,
> +       }, {
> +               .compatible = "mediatek,mt8195-vencsys_core1",
> +               .data = &venc_core1_desc,
> +       }, {
> +               /* sentinel */
> +       }
> +};
> +
> +static struct platform_driver clk_mt8195_venc_drv = {
> +       .probe = mtk_clk_simple_probe,
> +       .driver = {
> +               .name = "clk-mt8195-venc",
> +               .of_match_table = of_match_clk_mt8195_venc,
> +       },
> +};
> +
> +builtin_platform_driver(clk_mt8195_venc_drv);
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
