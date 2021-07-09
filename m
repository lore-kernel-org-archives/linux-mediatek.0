Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB26C07E99
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 09:30:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAB6E613D1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 09:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAB6E613D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHOTSiwCbjCvA2uyvs72nRqmnU30FSWn09hiInW7CjA=; b=LUJDDkVStbn79z
	zck39WVfHC3XeJgTAgO5sKRTBkSrQ3ny71PY2XYop0MXSpc+cbI6Gk6d5l+FLR4Jk9OxR4tTTJNf9
	uf+gfD3zemFsWvCTtRA1qgalmjL0+uUT3ftIqW04Sdj4b2YDOebGGlGlsEaemvQLAyVKlQ05oZ1qx
	h2S2TQa9ABK4Bp6DxZ46JIXrKbpY0pzn33s3IBziccjHnX7LRL/TzH3+b+bZxEmjffMYpdVjPIGP2
	wnBuxDB61KP1RKqhb4qbYURm4NgoeEPU+fgJdmhnfH6Ung8QZF5sRyErqupf6A8cCVsKGtmKrd06/
	kvfHGKvBAJTnH09/HK3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1mq4-001KWZ-C1; Fri, 09 Jul 2021 09:30:28 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1mq1-001KVV-8K
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 09:30:27 +0000
Received: by mail-lj1-x235.google.com with SMTP id a6so7070748ljq.3
 for <linux-mediatek@lists.infradead.org>; Fri, 09 Jul 2021 02:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UVZ3ulaIvieFnQbOO16griGzc0HyegeU7pDblHIW2fk=;
 b=AVIfFhjaDrX+xicDV5jotfaj82OLOOQLuIyVuJLdHqlE+dBxiJFDUlsVq4jVqGn9kB
 YMzvrfhk17oW79bPQ8DocBNpp7vCeIc+8xKPX47CAP8MhrdU+M4r1FpMAs90+VlA1+ls
 gNqqMRtelpp+xp26dvc8SO3BkhhjvTcW94CCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UVZ3ulaIvieFnQbOO16griGzc0HyegeU7pDblHIW2fk=;
 b=DxHIXSVY3AHwYFakeZeA+8ZCtxtapVXQLg3DIhE7Pj2LUmSWzIBRkqM4N6c4IPUaju
 YKACPaAY3ynEy981TpYgjwVZx3e4I4Ny3N7rm5twPjA8vcJznjyMt2pUfgilg/G1Tn4v
 XQ0yom6IqjiT0LVUax4p6uoKu2sqZ1vV4j/QCADKY+hf5gnHK3i01PMopJp/p1/gJ5JR
 VEC2z9xyaWYLRC/axuBYx4TCzTunDgrG2g3MSqsq1uqYLzGwMURss5fwpp8j5LAZsSzr
 LPw9u0D8AY4WqMEGGyJNGBMrcyKnP0zNkm6aAY5mPSHyCbGChZv3M+WB24AOkmqg9obM
 IEnw==
X-Gm-Message-State: AOAM532kZ3Vwq8SFKPk2MRtbncsidnZSTqC1XZ5/MC8uoPHtiKuSGZww
 5iygkZC5Y9dCmj7n/1HCqm+bDXWLqAWGIGf5ovG5Dw==
X-Google-Smtp-Source: ABdhPJyvUmaxIs5w1IdvIGwni7uJoasnkCSjkJwW8rOPWHTbO/mg6gcDkWtkIDHoACgC97iatzwT+d29YhzmvXfu7y4=
X-Received: by 2002:a05:651c:2115:: with SMTP id
 a21mr28217222ljq.185.1625823023471; 
 Fri, 09 Jul 2021 02:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-17-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-17-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 9 Jul 2021 17:30:11 +0800
Message-ID: <CAGXv+5F_hyjAXME1vGmNnRYtR-7b_pwKWdJgeWu_g=q-ENn+MA@mail.gmail.com>
Subject: Re: [PATCH 16/22] clk: mediatek: Add MT8195 vdosys1 clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_023025_382377_EE44AB40 
X-CRM114-Status: GOOD (  21.46  )
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

On Thu, Jun 17, 2021 at 7:03 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 vdosys1 clock provider
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig           |   6 ++
>  drivers/clk/mediatek/Makefile          |   1 +
>  drivers/clk/mediatek/clk-mt8195-vdo1.c | 131 +++++++++++++++++++++++++
>  3 files changed, 138 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-vdo1.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 6602f9ba13c7..1e89c68f6c6c 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -654,6 +654,12 @@ config COMMON_CLK_MT8195_VDOSYS0
>         help
>           This driver supports MediaTek MT8195 vdosys0 clocks.
>
> +config COMMON_CLK_MT8195_VDOSYS1
> +       bool "Clock driver for MediaTek MT8195 vdosys1"
> +       depends on COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 vdosys1 clocks.
> +
>  config COMMON_CLK_MT8516
>         bool "Clock driver for MediaTek MT8516"
>         depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 6aa1ba00342a..76c0fa837cb0 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -92,5 +92,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195_SCP_ADSP) += clk-mt8195-scp_adsp.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_NNASYS) += clk-mt8195-nna.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VDECSYS) += clk-mt8195-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS0) += clk-mt8195-vdo0.o
> +obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS1) += clk-mt8195-vdo1.o
>  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
>  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt8195-vdo1.c b/drivers/clk/mediatek/clk-mt8195-vdo1.c
> new file mode 100644
> index 000000000000..4d16f2e9c03a
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8195-vdo1.c
> @@ -0,0 +1,131 @@
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
> +static const struct mtk_gate_regs vdo10_cg_regs = {

You might want to name these vdo1_X_cg_regs. This would be easier to read
and parse.

> +       .set_ofs = 0x104,
> +       .clr_ofs = 0x108,
> +       .sta_ofs = 0x100,
> +};
> +
> +static const struct mtk_gate_regs vdo11_cg_regs = {
> +       .set_ofs = 0x124,
> +       .clr_ofs = 0x128,
> +       .sta_ofs = 0x120,
> +};
> +
> +static const struct mtk_gate_regs vdo12_cg_regs = {
> +       .set_ofs = 0x134,
> +       .clr_ofs = 0x138,
> +       .sta_ofs = 0x130,
> +};
> +
> +static const struct mtk_gate_regs vdo13_cg_regs = {
> +       .set_ofs = 0x144,
> +       .clr_ofs = 0x148,
> +       .sta_ofs = 0x140,
> +};
> +
> +#define GATE_VDO10(_id, _name, _parent, _shift)                        \
> +       GATE_MTK(_id, _name, _parent, &vdo10_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +#define GATE_VDO11(_id, _name, _parent, _shift)                        \
> +       GATE_MTK(_id, _name, _parent, &vdo11_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +#define GATE_VDO12(_id, _name, _parent, _shift)                        \
> +       GATE_MTK(_id, _name, _parent, &vdo12_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +#define GATE_VDO13(_id, _name, _parent, _shift)                        \
> +       GATE_MTK(_id, _name, _parent, &vdo13_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +static const struct mtk_gate vdo1_clks[] = {
> +       /* VDO10 */
> +       GATE_VDO10(CLK_VDO1_SMI_LARB2, "vdo1_smi_larb2", "vpp_sel", 0),
> +       GATE_VDO10(CLK_VDO1_SMI_LARB3, "vdo1_smi_larb3", "vpp_sel", 1),
> +       GATE_VDO10(CLK_VDO1_GALS, "vdo1_gals", "vpp_sel", 2),
> +       GATE_VDO10(CLK_VDO1_FAKE_ENG0, "vdo1_fake_eng0", "vpp_sel", 3),
> +       GATE_VDO10(CLK_VDO1_FAKE_ENG, "vdo1_fake_eng", "vpp_sel", 4),
> +       GATE_VDO10(CLK_VDO1_MDP_RDMA0, "vdo1_mdp_rdma0", "vpp_sel", 5),
> +       GATE_VDO10(CLK_VDO1_MDP_RDMA1, "vdo1_mdp_rdma1", "vpp_sel", 6),
> +       GATE_VDO10(CLK_VDO1_MDP_RDMA2, "vdo1_mdp_rdma2", "vpp_sel", 7),
> +       GATE_VDO10(CLK_VDO1_MDP_RDMA3, "vdo1_mdp_rdma3", "vpp_sel", 8),
> +       GATE_VDO10(CLK_VDO1_VPP_MERGE0, "vdo1_vpp_merge0", "vpp_sel", 9),
> +       GATE_VDO10(CLK_VDO1_VPP_MERGE1, "vdo1_vpp_merge1", "vpp_sel", 10),
> +       GATE_VDO10(CLK_VDO1_VPP_MERGE2, "vdo1_vpp_merge2", "vpp_sel", 11),
> +       GATE_VDO10(CLK_VDO1_VPP_MERGE3, "vdo1_vpp_merge3", "vpp_sel", 12),
> +       GATE_VDO10(CLK_VDO1_VPP_MERGE4, "vdo1_vpp_merge4", "vpp_sel", 13),
> +       GATE_VDO10(CLK_VDO1_VPP2_TO_VDO1_DL_ASYNC, "vdo1_vpp2_to_vdo1_dl_async", "vpp_sel", 14),
> +       GATE_VDO10(CLK_VDO1_VPP3_TO_VDO1_DL_ASYNC, "vdo1_vpp3_to_vdo1_dl_async", "vpp_sel", 15),
> +       GATE_VDO10(CLK_VDO1_DISP_MUTEX, "vdo1_disp_mutex", "vpp_sel", 16),
> +       GATE_VDO10(CLK_VDO1_MDP_RDMA4, "vdo1_mdp_rdma4", "vpp_sel", 17),
> +       GATE_VDO10(CLK_VDO1_MDP_RDMA5, "vdo1_mdp_rdma5", "vpp_sel", 18),
> +       GATE_VDO10(CLK_VDO1_MDP_RDMA6, "vdo1_mdp_rdma6", "vpp_sel", 19),
> +       GATE_VDO10(CLK_VDO1_MDP_RDMA7, "vdo1_mdp_rdma7", "vpp_sel", 20),
> +       GATE_VDO10(CLK_VDO1_DP_INTF0_MM, "vdo1_dp_intf0_mm", "vpp_sel", 21),
> +       GATE_VDO10(CLK_VDO1_DPI0_MM, "vdo1_dpi0_mm", "vpp_sel", 22),
> +       GATE_VDO10(CLK_VDO1_DPI1_MM, "vdo1_dpi1_mm", "vpp_sel", 23),
> +       GATE_VDO10(CLK_VDO1_DISP_MONITOR, "vdo1_disp_monitor", "vpp_sel", 24),
> +       GATE_VDO10(CLK_VDO1_MERGE0_DL_ASYNC, "vdo1_merge0_dl_async", "vpp_sel", 25),
> +       GATE_VDO10(CLK_VDO1_MERGE1_DL_ASYNC, "vdo1_merge1_dl_async", "vpp_sel", 26),
> +       GATE_VDO10(CLK_VDO1_MERGE2_DL_ASYNC, "vdo1_merge2_dl_async", "vpp_sel", 27),
> +       GATE_VDO10(CLK_VDO1_MERGE3_DL_ASYNC, "vdo1_merge3_dl_async", "vpp_sel", 28),
> +       GATE_VDO10(CLK_VDO1_MERGE4_DL_ASYNC, "vdo1_merge4_dl_async", "vpp_sel", 29),
> +       GATE_VDO10(CLK_VDO1_VDO0_DSC_TO_VDO1_DL_ASYNC, "vdo1_vdo0_dsc_to_vdo1_dl_async",
> +               "vpp_sel", 30),
> +       GATE_VDO10(CLK_VDO1_VDO0_MERGE_TO_VDO1_DL_ASYNC, "vdo1_vdo0_merge_to_vdo1_dl_async",
> +               "vpp_sel", 31),
> +       /* VDO11 */
> +       GATE_VDO11(CLK_VDO1_HDR_VDO_FE0, "vdo1_hdr_vdo_fe0", "vpp_sel", 0),
> +       GATE_VDO11(CLK_VDO1_HDR_GFX_FE0, "vdo1_hdr_gfx_fe0", "vpp_sel", 1),
> +       GATE_VDO11(CLK_VDO1_HDR_VDO_BE, "vdo1_hdr_vdo_be", "vpp_sel", 2),
> +       GATE_VDO11(CLK_VDO1_HDR_VDO_FE1, "vdo1_hdr_vdo_fe1", "vpp_sel", 16),
> +       GATE_VDO11(CLK_VDO1_HDR_GFX_FE1, "vdo1_hdr_gfx_fe1", "vpp_sel", 17),
> +       GATE_VDO11(CLK_VDO1_DISP_MIXER, "vdo1_disp_mixer", "vpp_sel", 18),
> +       GATE_VDO11(CLK_VDO1_HDR_VDO_FE0_DL_ASYNC, "vdo1_hdr_vdo_fe0_dl_async", "vpp_sel", 19),
> +       GATE_VDO11(CLK_VDO1_HDR_VDO_FE1_DL_ASYNC, "vdo1_hdr_vdo_fe1_dl_async", "vpp_sel", 20),
> +       GATE_VDO11(CLK_VDO1_HDR_GFX_FE0_DL_ASYNC, "vdo1_hdr_gfx_fe0_dl_async", "vpp_sel", 21),
> +       GATE_VDO11(CLK_VDO1_HDR_GFX_FE1_DL_ASYNC, "vdo1_hdr_gfx_fe1_dl_async", "vpp_sel", 22),
> +       GATE_VDO11(CLK_VDO1_HDR_VDO_BE_DL_ASYNC, "vdo1_hdr_vdo_be_dl_async", "vpp_sel", 23),
> +       /* VDO12 */
> +       GATE_VDO12(CLK_VDO1_DPI0, "vdo1_dpi0", "vpp_sel", 0),
> +       GATE_VDO12(CLK_VDO1_DISP_MONITOR_DPI0, "vdo1_disp_monitor_dpi0", "vpp_sel", 1),
> +       GATE_VDO12(CLK_VDO1_DPI1, "vdo1_dpi1", "vpp_sel", 8),
> +       GATE_VDO12(CLK_VDO1_DISP_MONITOR_DPI1, "vdo1_disp_monitor_dpi1", "vpp_sel", 9),
> +       GATE_VDO12(CLK_VDO1_DPINTF, "vdo1_dpintf", "vpp_sel", 16),
> +       GATE_VDO12(CLK_VDO1_DISP_MONITOR_DPINTF, "vdo1_disp_monitor_dpintf", "vpp_sel", 17),
> +       /* VDO13 */
> +       GATE_VDO13(CLK_VDO1_26M_SLOW, "vdo1_26m_slow", "clk26m", 8),
> +};
> +
> +static const struct mtk_clk_desc vdo1_desc = {
> +       .clks = vdo1_clks,
> +       .num_clks = ARRAY_SIZE(vdo1_clks),
> +};
> +
> +static const struct of_device_id of_match_clk_mt8195_vdo1[] = {
> +       {
> +               .compatible = "mediatek,mt8195-vdosys1",
> +               .data = &vdo1_desc,
> +       }, {
> +               /* sentinel */
> +       }
> +};
> +
> +static struct platform_driver clk_mt8195_vdo1_drv = {
> +       .probe = mtk_clk_simple_probe,
> +       .driver = {
> +               .name = "clk-mt8195-vdo1",
> +               .of_match_table = of_match_clk_mt8195_vdo1,
> +       },
> +};
> +
> +builtin_platform_driver(clk_mt8195_vdo1_drv);

Same general comments as the previous patch applies. Code looks good
otherwise.

ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
