Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E53BC07E99
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 10:38:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28993613E3
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 10:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28993613E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9szXa6t6KM/GS0Rbu0lUDKQ+Xxjd6Oz0OnYPkzLBNU=; b=b/nICAY9HVGtLq
	UIMPUtO5OKzJh0b7aP1thCFZMvmqXtDD8hjq8ZY2tgwsMLdtGkweQjF5yG5wYI+qSO85cvInIP+dG
	FBmvCglPXDcgDxhK4YqeGIcp5G3oSe9FEvdfmbn5zW8tFvxoKkhGwkNZzJp2CBZJVB/w3QGrWPQvT
	FWSd3ygCXBHu7e7Gmeukm41vHFVQJjTauOCgx4vpSJ7pxf9UMk48QfQyVIKAQzJO00IOHHlxl/uCq
	NVoDaVWtAk2KqjI8j2Q1Jy3k1j2znQUYt8LprK+35fH1Eic6P2zyYQZDl0YTra4Jw6J2a98xR+mWn
	K5gQ1eAHownoRKmjiHBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1ntu-001Yqi-LF; Fri, 09 Jul 2021 10:38:30 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1nth-001YoW-32
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 10:38:19 +0000
Received: by mail-lf1-x130.google.com with SMTP id y42so22425090lfa.3
 for <linux-mediatek@lists.infradead.org>; Fri, 09 Jul 2021 03:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kr+mzl4YBf0/RmdEJ7awDHnpgGzk2lig2YhllN5tTq0=;
 b=FZ4LYicw/5tcOYffzm8t0tDPekesR/UlaYnmgU7IPabvYleTMDcQPSlWx5JsbrYdyQ
 DzJwhaB0iZafGCl5ToypD4Y9kBGMHZTbgX9KQDo+cxQipu56EgZEEXa2vuWh/9eFVpv9
 6qWjQJGmYDr5eqgWwirUNBeX+dQF39tbHe4D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kr+mzl4YBf0/RmdEJ7awDHnpgGzk2lig2YhllN5tTq0=;
 b=bSukzOYQGmmX8ojhIFRMKk2qIB6NmNpJ8ng3FZWUY3S0wWghb5Nm7tMXsQFxkGQOJU
 hqe3ZL46NmRqbjUJZIyt8gNFCy7rvsmxHNHlcXsn78d8YctkgBL05mxnD2cE9ovkTJfJ
 UeRb+SnpzF7rTD0wGw8PB7EYR21BtOJhyROfhl7lpaXH5qPBfCc2nXXQQhJX7hkkOd11
 vFvNc3/S/j77w+Q/jPnNhpwB7XaDwabcz24R8SNeEqtLvV21kRZRonugCp6lUdJ8CoGA
 UD02iHhCdQJJ0i2ni9xTFNS1/rX/7dw1ittUKaU1M0xs+3yM8DlPbd+eoVpUtVHlpWGz
 LIYQ==
X-Gm-Message-State: AOAM531mfPBoosqC/SpLR+xPE+BYNTrS9fpjzn3i2/K6a2sHII2ku9j/
 3zGv2MwLZG61Gz3ei/nGILyldF0sJQ10/O/OH5LyBg==
X-Google-Smtp-Source: ABdhPJz5V2lqK1lm3Yjt/SqYNsoS6SUNHeE/yvRazu6AV415xvrALqJtUOXg8UBG9cV+ctPKrLNIZboGOZS8Zy3KjKc=
X-Received: by 2002:a19:858b:: with SMTP id h133mr9083244lfd.656.1625827094943; 
 Fri, 09 Jul 2021 03:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-19-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-19-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 9 Jul 2021 18:38:03 +0800
Message-ID: <CAGXv+5Ga+Q91OYkOvJ+5ZoFgFrvJE4VNa1o1um00HjCmp+uB8w@mail.gmail.com>
Subject: Re: [PATCH 18/22] clk: mediatek: Add MT8195 vppsys0 clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_033817_206119_D988A811 
X-CRM114-Status: GOOD (  23.69  )
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

On Thu, Jun 17, 2021 at 7:10 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 vppsys0 clock provider
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig           |   6 ++
>  drivers/clk/mediatek/Makefile          |   1 +
>  drivers/clk/mediatek/clk-mt8195-vpp0.c | 112 +++++++++++++++++++++++++
>  3 files changed, 119 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-vpp0.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 3352686d98cf..2deef026fbb4 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -666,6 +666,12 @@ config COMMON_CLK_MT8195_VENCSYS
>         help
>           This driver supports MediaTek MT8195 vencsys clocks.
>
> +config COMMON_CLK_MT8195_VPPSYS0
> +       bool "Clock driver for MediaTek MT8195 vppsys0"
> +       depends on COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 vppsys0 clocks.
> +
>  config COMMON_CLK_MT8516
>         bool "Clock driver for MediaTek MT8516"
>         depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 76a6b404e34b..34cd7f2c71ac 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -94,5 +94,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VDECSYS) += clk-mt8195-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS0) += clk-mt8195-vdo0.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS1) += clk-mt8195-vdo1.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) += clk-mt8195-venc.o
> +obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS0) += clk-mt8195-vpp0.o
>  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
>  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt8195-vpp0.c b/drivers/clk/mediatek/clk-mt8195-vpp0.c
> new file mode 100644
> index 000000000000..cecd8fab7b7e
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8195-vpp0.c
> @@ -0,0 +1,112 @@
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
> +static const struct mtk_gate_regs vpp00_cg_regs = {

Like with VDOSYS, please add a separator between the two indices.

> +       .set_ofs = 0x24,
> +       .clr_ofs = 0x28,
> +       .sta_ofs = 0x20,
> +};
> +
> +static const struct mtk_gate_regs vpp01_cg_regs = {
> +       .set_ofs = 0x30,
> +       .clr_ofs = 0x34,
> +       .sta_ofs = 0x2c,
> +};
> +
> +static const struct mtk_gate_regs vpp02_cg_regs = {
> +       .set_ofs = 0x3c,
> +       .clr_ofs = 0x40,
> +       .sta_ofs = 0x38,
> +};
> +
> +#define GATE_VPP00(_id, _name, _parent, _shift)                        \
> +       GATE_MTK(_id, _name, _parent, &vpp00_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +#define GATE_VPP01(_id, _name, _parent, _shift)                        \
> +       GATE_MTK(_id, _name, _parent, &vpp01_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +#define GATE_VPP02(_id, _name, _parent, _shift)                        \
> +       GATE_MTK(_id, _name, _parent, &vpp02_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +static const struct mtk_gate vpp0_clks[] = {
> +       /* VPP00 */
> +       GATE_VPP00(CLK_VPP0_MDP_FG, "vpp0_mdp_fg", "vpp_sel", 1),
> +       GATE_VPP00(CLK_VPP0_STITCH, "vpp0_stitch", "vpp_sel", 2),
> +       GATE_VPP00(CLK_VPP0_PADDING, "vpp0_padding", "vpp_sel", 7),
> +       GATE_VPP00(CLK_VPP0_MDP_TCC, "vpp0_mdp_tcc", "vpp_sel", 8),
> +       GATE_VPP00(CLK_VPP0_WARP0_ASYNC_TX, "vpp0_warp0_async_tx", "vpp_sel", 10),
> +       GATE_VPP00(CLK_VPP0_WARP1_ASYNC_TX, "vpp0_warp1_async_tx", "vpp_sel", 11),
> +       GATE_VPP00(CLK_VPP0_MUTEX, "vpp0_mutex", "vpp_sel", 13),
> +       GATE_VPP00(CLK_VPP0_VPP02VPP1_RELAY, "vpp0_vpp02vpp1_relay", "vpp_sel", 14),
> +       GATE_VPP00(CLK_VPP0_VPP12VPP0_ASYNC, "vpp0_vpp12vpp0_async", "vpp_sel", 15),
> +       GATE_VPP00(CLK_VPP0_MMSYSRAM_TOP, "vpp0_mmsysram_top", "vpp_sel", 16),
> +       GATE_VPP00(CLK_VPP0_MDP_AAL, "vpp0_mdp_aal", "vpp_sel", 17),
> +       GATE_VPP00(CLK_VPP0_MDP_RSZ, "vpp0_mdp_rsz", "vpp_sel", 18),
> +       /* VPP01 */
> +       GATE_VPP01(CLK_VPP0_SMI_COMMON, "vpp0_smi_common", "vpp_sel", 0),
> +       GATE_VPP01(CLK_VPP0_GALS_VDO0_LARB0, "vpp0_gals_vdo0_larb0", "vpp_sel", 1),
> +       GATE_VPP01(CLK_VPP0_GALS_VDO0_LARB1, "vpp0_gals_vdo0_larb1", "vpp_sel", 2),
> +       GATE_VPP01(CLK_VPP0_GALS_VENCSYS, "vpp0_gals_vencsys", "vpp_sel", 3),
> +       GATE_VPP01(CLK_VPP0_GALS_VENCSYS_CORE1, "vpp0_gals_vencsys_core1", "vpp_sel", 4),
> +       GATE_VPP01(CLK_VPP0_GALS_INFRA, "vpp0_gals_infra", "vpp_sel", 5),
> +       GATE_VPP01(CLK_VPP0_GALS_CAMSYS, "vpp0_gals_camsys", "vpp_sel", 6),
> +       GATE_VPP01(CLK_VPP0_GALS_VPP1_LARB5, "vpp0_gals_vpp1_larb5", "vpp_sel", 7),
> +       GATE_VPP01(CLK_VPP0_GALS_VPP1_LARB6, "vpp0_gals_vpp1_larb6", "vpp_sel", 8),
> +       GATE_VPP01(CLK_VPP0_SMI_REORDER, "vpp0_smi_reorder", "vpp_sel", 9),
> +       GATE_VPP01(CLK_VPP0_SMI_IOMMU, "vpp0_smi_iommu", "vpp_sel", 10),
> +       GATE_VPP01(CLK_VPP0_GALS_IMGSYS_CAMSYS, "vpp0_gals_imgsys_camsys", "vpp_sel", 11),
> +       GATE_VPP01(CLK_VPP0_MDP_RDMA, "vpp0_mdp_rdma", "vpp_sel", 12),
> +       GATE_VPP01(CLK_VPP0_MDP_WROT, "vpp0_mdp_wrot", "vpp_sel", 13),
> +       GATE_VPP01(CLK_VPP0_GALS_EMI0_EMI1, "vpp0_gals_emi0_emi1", "vpp_sel", 16),
> +       GATE_VPP01(CLK_VPP0_SMI_SUB_COMMON_REORDER, "vpp0_smi_sub_common_reorder", "vpp_sel", 17),
> +       GATE_VPP01(CLK_VPP0_SMI_RSI, "vpp0_smi_rsi", "vpp_sel", 18),
> +       GATE_VPP01(CLK_VPP0_SMI_COMMON_LARB4, "vpp0_smi_common_larb4", "vpp_sel", 19),
> +       GATE_VPP01(CLK_VPP0_GALS_VDEC_VDEC_CORE1, "vpp0_gals_vdec_vdec_core1", "vpp_sel", 20),
> +       GATE_VPP01(CLK_VPP0_GALS_VPP1_WPE, "vpp0_gals_vpp1_wpe", "vpp_sel", 21),
> +       GATE_VPP01(CLK_VPP0_GALS_VDO0_VDO1_VENCSYS_CORE1, "vpp0_gals_vdo0_vdo1_vencsys_core1",
> +               "vpp_sel", 22),
> +       GATE_VPP01(CLK_VPP0_FAKE_ENG, "vpp0_fake_eng", "vpp_sel", 23),
> +       GATE_VPP01(CLK_VPP0_MDP_HDR, "vpp0_mdp_hdr", "vpp_sel", 24),
> +       GATE_VPP01(CLK_VPP0_MDP_TDSHP, "vpp0_mdp_tdshp", "vpp_sel", 25),
> +       GATE_VPP01(CLK_VPP0_MDP_COLOR, "vpp0_mdp_color", "vpp_sel", 26),
> +       GATE_VPP01(CLK_VPP0_MDP_OVL, "vpp0_mdp_ovl", "vpp_sel", 27),
> +       /* VPP02 */
> +       GATE_VPP02(CLK_VPP0_WARP0_RELAY, "vpp0_warp0_relay", "wpe_vpp_sel", 0),
> +       GATE_VPP02(CLK_VPP0_WARP0_MDP_DL_ASYNC, "vpp0_warp0_mdp_dl_async", "wpe_vpp_sel", 1),
> +       GATE_VPP02(CLK_VPP0_WARP1_RELAY, "vpp0_warp1_relay", "wpe_vpp_sel", 2),
> +       GATE_VPP02(CLK_VPP0_WARP1_MDP_DL_ASYNC, "vpp0_warp1_mdp_dl_async", "wpe_vpp_sel", 3),
> +};

Unfortunately bits 0 - 11 in VPP01 and bits 1 and 3 in VPP02 are marked
as reserved in our datasheet, so I can't check the validity of them.
Same goes for bits 16-22 in VPP02 which are only marked as SMI.

Same general comments as before also apply.


ChenYu

> +
> +static const struct mtk_clk_desc vpp0_desc = {
> +       .clks = vpp0_clks,
> +       .num_clks = ARRAY_SIZE(vpp0_clks),
> +};
> +
> +static const struct of_device_id of_match_clk_mt8195_vpp0[] = {
> +       {
> +               .compatible = "mediatek,mt8195-vppsys0",
> +               .data = &vpp0_desc,
> +       }, {
> +               /* sentinel */
> +       }
> +};
> +
> +static struct platform_driver clk_mt8195_vpp0_drv = {
> +       .probe = mtk_clk_simple_probe,
> +       .driver = {
> +               .name = "clk-mt8195-vpp0",
> +               .of_match_table = of_match_clk_mt8195_vpp0,
> +       },
> +};
> +
> +builtin_platform_driver(clk_mt8195_vpp0_drv);
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
