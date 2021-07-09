Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027E3C07E99
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 08:52:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBD04613CA
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 08:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBD04613CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VkJNfmTYddNCaEVhTh2x5U8CEoKGw6VbAI73JpZNVKo=; b=YO7/zR8HINENmu
	fAhuKkfVRYwsC4ulRg7aeHPdtLgFj86k7uv860FGg0/Ayrdp9IUoid+/+gVjhAvKY2Lo0MXS9UuSn
	kazoGzsqmRdPtkCPdN9u3IenyfCHetib56pcZGwl36984BaiYU8Z/1v9c8CZ+0DexbX1Yy78//9zA
	WY8vw4hoa09uJLKaKdXMuYR22udYT+odPftP2qNvZdkn1+naBDzwK3vcSDg6j7yaFbkNoRPVDD/D1
	faKa3tSTYfIjAoPD7iQT6VqWHr4ujJs0ncwpv4jUwxKZTWJNyZqMi7TVfQspIUh71F+YL8OiuPe8m
	TMOoIuymPDWUZDlwFwIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1mEi-001DEA-7L; Fri, 09 Jul 2021 08:51:52 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1mEe-001DBx-Ly
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 08:51:50 +0000
Received: by mail-lf1-x12d.google.com with SMTP id f30so21901739lfj.1
 for <linux-mediatek@lists.infradead.org>; Fri, 09 Jul 2021 01:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CwMW62WAAwpmyJgQD0h1DiuOTDS2nkEHBj7w1HcY3kM=;
 b=bgFvcNDm4rzhzmnJI8gAgjkVoelxZQajuh6oKo+BWa46Q9cCE9K6N64k9sOSXxMk3+
 XIuCvLx72F3RH2GfdNyic5FiPYqIG5U5SQPmzgnv99G+/A8dxyUL2VRdJZ312q+lI7Qn
 V9zg1Ve0Sjmp8IYfmfRLzUJgG4coj1oJ2/4LE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CwMW62WAAwpmyJgQD0h1DiuOTDS2nkEHBj7w1HcY3kM=;
 b=EpDH8CVJSQGNemuXWItZv8KCNKIynSJAwCiWOpV6nCxLSGss54xrZty90DcGs0Q1cA
 1eFIkEAVk/sZYBv/rnGBVeM72PnbDfhfnHn6cRE8U6IwvuhGzKQ2s1v3pHLzrrHCmNtG
 wi9XlfS2KhSTkRCJb5bnUzWkQ9LWxm8/sM2dRRbKBvoIpA0sQUmjTreLAT3Oj2s6Zf3K
 6tnipftx2qoDSBwfylVL41ogt1Qi0iVSVpmuE0fz+wx6o27cmi9vc5f1fzkxFUs+4DeU
 sQUSGAQXCLRIPxqiwk9QVrv3kZp9IsoX/hAxBM4PRDyzB8zwLdMDScvutPJ9OGp6337l
 8Gyw==
X-Gm-Message-State: AOAM5335MAr8N888DBuG9ln5QogZ+meXjYBTFUi0LheVaLBj52rtjw1b
 dGUDlreCjzvxurTgjOFnN0u6ei+MwzjjoSxnBOATtg==
X-Google-Smtp-Source: ABdhPJy2HfouwNNwkjfvfIGtS7PKmxFbKD3IPSiQtKRWJc8MEdZy4o5QBKE9wHvu2dWQOTcHB9oWvsAyTF66OmnsUz4=
X-Received: by 2002:a05:6512:3f13:: with SMTP id
 y19mr27455181lfa.444.1625820706714; 
 Fri, 09 Jul 2021 01:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-16-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-16-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 9 Jul 2021 16:51:35 +0800
Message-ID: <CAGXv+5GHwmL82q5ibTAh_GVLPny7yzMacm34uUxdR33Pzc-t2g@mail.gmail.com>
Subject: Re: [PATCH 15/22] clk: mediatek: Add MT8195 vdosys0 clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_015148_791135_7E831D83 
X-CRM114-Status: GOOD (  23.16  )
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

On Thu, Jun 17, 2021 at 7:03 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 vdosys0 clock provider
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig           |   6 ++
>  drivers/clk/mediatek/Makefile          |   1 +
>  drivers/clk/mediatek/clk-mt8195-vdo0.c | 114 +++++++++++++++++++++++++
>  3 files changed, 121 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-vdo0.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index b7881b8ebb23..6602f9ba13c7 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -648,6 +648,12 @@ config COMMON_CLK_MT8195_VDECSYS
>         help
>           This driver supports MediaTek MT8195 vdecsys clocks.
>
> +config COMMON_CLK_MT8195_VDOSYS0
> +       bool "Clock driver for MediaTek MT8195 vdosys0"
> +       depends on COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 vdosys0 clocks.
> +

Same comments about commit log and Kconfig option.

>  config COMMON_CLK_MT8516
>         bool "Clock driver for MediaTek MT8516"
>         depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 9acfa705f1de..6aa1ba00342a 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -91,5 +91,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195_MFGCFG) += clk-mt8195-mfg.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_SCP_ADSP) += clk-mt8195-scp_adsp.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_NNASYS) += clk-mt8195-nna.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VDECSYS) += clk-mt8195-vdec.o
> +obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS0) += clk-mt8195-vdo0.o
>  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
>  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt8195-vdo0.c b/drivers/clk/mediatek/clk-mt8195-vdo0.c
> new file mode 100644
> index 000000000000..4a34ccb0beed
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8195-vdo0.c
> @@ -0,0 +1,114 @@
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

Alphabetical order within the same group please.

> +
> +#include <dt-bindings/clock/mt8195-clk.h>
> +
> +static const struct mtk_gate_regs vdo00_cg_regs = {
> +       .set_ofs = 0x104,
> +       .clr_ofs = 0x108,
> +       .sta_ofs = 0x100,
> +};
> +
> +static const struct mtk_gate_regs vdo01_cg_regs = {
> +       .set_ofs = 0x114,
> +       .clr_ofs = 0x118,
> +       .sta_ofs = 0x110,
> +};
> +
> +static const struct mtk_gate_regs vdo02_cg_regs = {
> +       .set_ofs = 0x124,
> +       .clr_ofs = 0x128,
> +       .sta_ofs = 0x120,
> +};
> +
> +#define GATE_VDO00(_id, _name, _parent, _shift)                        \
> +       GATE_MTK(_id, _name, _parent, &vdo00_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +#define GATE_VDO01(_id, _name, _parent, _shift)                        \
> +       GATE_MTK(_id, _name, _parent, &vdo01_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +#define GATE_VDO02(_id, _name, _parent, _shift)                        \
> +       GATE_MTK(_id, _name, _parent, &vdo02_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +static const struct mtk_gate vdo0_clks[] = {
> +       /* VDO00 */
> +       GATE_VDO00(CLK_VDO0_DISP_OVL0, "vdo0_disp_ovl0", "vpp_sel", 0),
> +       GATE_VDO00(CLK_VDO0_DISP_COLOR0, "vdo0_disp_color0", "vpp_sel", 2),
> +       GATE_VDO00(CLK_VDO0_DISP_COLOR1, "vdo0_disp_color1", "vpp_sel", 3),
> +       GATE_VDO00(CLK_VDO0_DISP_CCORR0, "vdo0_disp_ccorr0", "vpp_sel", 4),
> +       GATE_VDO00(CLK_VDO0_DISP_CCORR1, "vdo0_disp_ccorr1", "vpp_sel", 5),
> +       GATE_VDO00(CLK_VDO0_DISP_AAL0, "vdo0_disp_aal0", "vpp_sel", 6),
> +       GATE_VDO00(CLK_VDO0_DISP_AAL1, "vdo0_disp_aal1", "vpp_sel", 7),
> +       GATE_VDO00(CLK_VDO0_DISP_GAMMA0, "vdo0_disp_gamma0", "vpp_sel", 8),
> +       GATE_VDO00(CLK_VDO0_DISP_GAMMA1, "vdo0_disp_gamma1", "vpp_sel", 9),
> +       GATE_VDO00(CLK_VDO0_DISP_DITHER0, "vdo0_disp_dither0", "vpp_sel", 10),
> +       GATE_VDO00(CLK_VDO0_DISP_DITHER1, "vdo0_disp_dither1", "vpp_sel", 11),
> +       GATE_VDO00(CLK_VDO0_DISP_OVL1, "vdo0_disp_ovl1", "vpp_sel", 16),
> +       GATE_VDO00(CLK_VDO0_DISP_WDMA0, "vdo0_disp_wdma0", "vpp_sel", 17),
> +       GATE_VDO00(CLK_VDO0_DISP_WDMA1, "vdo0_disp_wdma1", "vpp_sel", 18),
> +       GATE_VDO00(CLK_VDO0_DISP_RDMA0, "vdo0_disp_rdma0", "vpp_sel", 19),
> +       GATE_VDO00(CLK_VDO0_DISP_RDMA1, "vdo0_disp_rdma1", "vpp_sel", 20),
> +       GATE_VDO00(CLK_VDO0_DSI0, "vdo0_dsi0", "vpp_sel", 21),
> +       GATE_VDO00(CLK_VDO0_DSI1, "vdo0_dsi1", "vpp_sel", 22),
> +       GATE_VDO00(CLK_VDO0_DSC_WRAP0, "vdo0_dsc_wrap0", "vpp_sel", 23),
> +       GATE_VDO00(CLK_VDO0_VPP_MERGE0, "vdo0_vpp_merge0", "vpp_sel", 24),
> +       GATE_VDO00(CLK_VDO0_DP_INTF0, "vdo0_dp_intf0", "vpp_sel", 25),
> +       GATE_VDO00(CLK_VDO0_DISP_MUTEX0, "vdo0_disp_mutex0", "vpp_sel", 26),
> +       GATE_VDO00(CLK_VDO0_DISP_IL_ROT0, "vdo0_disp_il_rot0", "vpp_sel", 27),
> +       GATE_VDO00(CLK_VDO0_APB_BUS, "vdo0_apb_bus", "vpp_sel", 28),
> +       GATE_VDO00(CLK_VDO0_FAKE_ENG0, "vdo0_fake_eng0", "vpp_sel", 29),
> +       GATE_VDO00(CLK_VDO0_FAKE_ENG1, "vdo0_fake_eng1", "vpp_sel", 30),
> +       /* VDO01 */
> +       GATE_VDO01(CLK_VDO0_DL_ASYNC0, "vdo0_dl_async0", "vpp_sel", 0),
> +       GATE_VDO01(CLK_VDO0_DL_ASYNC1, "vdo0_dl_async1", "vpp_sel", 1),
> +       GATE_VDO01(CLK_VDO0_DL_ASYNC2, "vdo0_dl_async2", "vpp_sel", 2),
> +       GATE_VDO01(CLK_VDO0_DL_ASYNC3, "vdo0_dl_async3", "vpp_sel", 3),
> +       GATE_VDO01(CLK_VDO0_DL_ASYNC4, "vdo0_dl_async4", "vpp_sel", 4),
> +       GATE_VDO01(CLK_VDO0_DISP_MONITOR0, "vdo0_disp_monitor0", "vpp_sel", 5),
> +       GATE_VDO01(CLK_VDO0_DISP_MONITOR1, "vdo0_disp_monitor1", "vpp_sel", 6),
> +       GATE_VDO01(CLK_VDO0_DISP_MONITOR2, "vdo0_disp_monitor2", "vpp_sel", 7),
> +       GATE_VDO01(CLK_VDO0_DISP_MONITOR3, "vdo0_disp_monitor3", "vpp_sel", 8),
> +       GATE_VDO01(CLK_VDO0_DISP_MONITOR4, "vdo0_disp_monitor4", "vpp_sel", 9),
> +       GATE_VDO01(CLK_VDO0_SMI_GALS, "vdo0_smi_gals", "vpp_sel", 10),
> +       GATE_VDO01(CLK_VDO0_SMI_COMMON, "vdo0_smi_common", "vpp_sel", 11),
> +       GATE_VDO01(CLK_VDO0_SMI_EMI, "vdo0_smi_emi", "vpp_sel", 12),
> +       GATE_VDO01(CLK_VDO0_SMI_IOMMU, "vdo0_smi_iommu", "vpp_sel", 13),
> +       GATE_VDO01(CLK_VDO0_SMI_LARB, "vdo0_smi_larb", "vpp_sel", 14),
> +       GATE_VDO01(CLK_VDO0_SMI_RSI, "vdo0_smi_rsi", "vpp_sel", 15),
> +       /* VDO02 */
> +       GATE_VDO02(CLK_VDO0_DSI0_DSI, "vdo0_dsi0_dsi", "dsi_occ_sel", 0),
> +       GATE_VDO02(CLK_VDO0_DSI1_DSI, "vdo0_dsi1_dsi", "dsi_occ_sel", 8),
> +       GATE_VDO02(CLK_VDO0_DP_INTF0_DP_INTF, "vdo0_dp_intf0_dp_intf", "edp_sel", 16),
> +};
> +
> +static const struct mtk_clk_desc vdo0_desc = {
> +       .clks = vdo0_clks,
> +       .num_clks = ARRAY_SIZE(vdo0_clks),
> +};
> +
> +static const struct of_device_id of_match_clk_mt8195_vdo0[] = {
> +       {
> +               .compatible = "mediatek,mt8195-vdosys0",
> +               .data = &vdo0_desc,
> +       }, {
> +               /* sentinel */
> +       }
> +};
> +
> +static struct platform_driver clk_mt8195_vdo0_drv = {
> +       .probe = mtk_clk_simple_probe,
> +       .driver = {
> +               .name = "clk-mt8195-vdo0",
> +               .of_match_table = of_match_clk_mt8195_vdo0,
> +       },
> +};
> +

Can drop the empty line here.

Overall the code looks good.


ChenYu


> +builtin_platform_driver(clk_mt8195_vdo0_drv);
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
