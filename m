Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3ED9C07E99
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 08:24:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC41461158
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 08:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC41461158
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXCQC574lmsLsFaaFLJeh3lBSozRIEp2CdLu5rDgU8o=; b=viuwoJozH9MmUT
	fTCCWvQlvllD1/eyq/pSqOum8/ZLb0O6oQXRVWW6aYFTPgX5y5J1ENAyHxswYFk0KX11PtclMsRWn
	03YMONz2ZcU5ax7XvU4aA3Etn9No1WZQOfSeNGxoI098gCEuVKAvQZiDX36iRB54GznsuPkvCT9/I
	LTNZ2rHvoBOTqH5HOReoYlaN2qc/ADuhEp6LBiRbs+Tx0pKGqS/H0/U1ZxM5EdU2EHtof9y1V78UL
	fU84Z0Y1i4MCwHPtHSvfqz2gViGO7iHNlMfGnkyeHj+C29OSrdGydt8xc1cWX27+jZcwR6DjRwwWG
	RihJuV4R/oaN0jsAYr0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1loE-0017C9-A6; Fri, 09 Jul 2021 08:24:30 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1lo9-0017AW-25
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 08:24:27 +0000
Received: by mail-lf1-x12b.google.com with SMTP id p1so21662202lfr.12
 for <linux-mediatek@lists.infradead.org>; Fri, 09 Jul 2021 01:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R9ROpNEhva5nhBZc7A0DO1wS4iiAe3klQ1xnW3ni7+o=;
 b=ZFngDI6rL2z3UXY3NgGKNkaymnfJ5c/exdXGaBqKVa7gAfKnWRNo6Gh0k71hv2iTff
 JbXuDbgYEEr5bWu4yGTLhcICHA3aZMuHU5KCvv7f2iF+tq7XXi1DsLq12CFWoKtzPsTL
 s3l1zSutrAiJ1wJzAv9eM/YGGtDQzsanwB/bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R9ROpNEhva5nhBZc7A0DO1wS4iiAe3klQ1xnW3ni7+o=;
 b=PiMTnw7I7Lr/EzKP0fayJCpiTJgCZWtAjRSHpmf6jpvf6PGDjMYqDpV9+6dxaJHRtG
 FOepuu8vr14UfAswntfPkyEaoGTUTVzjhPYwpoiFKdKN2ac1sSM8ge9oVoLbxwk5xJFj
 fYeSPeuNgSXqfXHZZevRdnJtZ95rpSMjYwn26eMLmf3IO6Jp0g+AqmmjZbSxdBy+aSVV
 hPsUuy6wjetOUnRnWsXl9YBJ6JbXANPzLJ6nnIlbPwvwYnjnEEqhTKSQEeAf//+ophxY
 eQE2IUWCB1U2Et3BkYgBGn1WBIGNFbPJNsQAZLNHlaSOePvjxkl1WJSbLgiNt4ram1EO
 ELzg==
X-Gm-Message-State: AOAM530UCLA2pBtDCB/xf7WOYoMxy34wADGCruSmvnL1O4GPtLzs6HF9
 JeVSKKnXBf6BC+1BVoB7bA5MPcVn0B723OY1p8H0vw==
X-Google-Smtp-Source: ABdhPJxqMm0yEfmyZT02/vhmXv/W0H893rDty1n/dYZfWN32qRFcvyRqmfmHZo7Fpj5imIGkuoLW1bG5lqRRgfPv3bc=
X-Received: by 2002:ac2:4308:: with SMTP id l8mr29357326lfh.342.1625819063439; 
 Fri, 09 Jul 2021 01:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-14-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-14-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 9 Jul 2021 16:24:12 +0800
Message-ID: <CAGXv+5GR7gRnAMJSJTPbq1QUL58Fq5oejuAvaEwLHTYNMwVBzQ@mail.gmail.com>
Subject: Re: [PATCH 13/22] clk: mediatek: Add MT8195 nnasys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_012425_176924_5F4BC9C2 
X-CRM114-Status: GOOD (  28.12  )
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

On Thu, Jun 17, 2021 at 7:00 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 nnasys clock provider
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig          |   6 ++
>  drivers/clk/mediatek/Makefile         |   1 +
>  drivers/clk/mediatek/clk-mt8195-nna.c | 128 ++++++++++++++++++++++++++
>  3 files changed, 135 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-nna.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 7cb745d47770..d34517728f4a 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -636,6 +636,12 @@ config COMMON_CLK_MT8195_SCP_ADSP
>         help
>           This driver supports MediaTek MT8195 scp_adsp clocks.
>
> +config COMMON_CLK_MT8195_NNASYS
> +       bool "Clock driver for MediaTek MT8195 nnasys"
> +       depends on COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 nnasys clocks.
> +
>  config COMMON_CLK_MT8516
>         bool "Clock driver for MediaTek MT8516"
>         depends on ARCH_MEDIATEK || COMPILE_TEST

Same comments about commit log and Kconfig option apply.

> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 058ff55468a2..49e585a7ac8e 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -89,5 +89,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195_IMGSYS) += clk-mt8195-img.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_IPESYS) += clk-mt8195-ipe.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_MFGCFG) += clk-mt8195-mfg.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_SCP_ADSP) += clk-mt8195-scp_adsp.o
> +obj-$(CONFIG_COMMON_CLK_MT8195_NNASYS) += clk-mt8195-nna.o
>  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
>  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt8195-nna.c b/drivers/clk/mediatek/clk-mt8195-nna.c
> new file mode 100644
> index 000000000000..4210c6cf5ef4
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8195-nna.c
> @@ -0,0 +1,128 @@
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
> +static const struct mtk_gate_regs nna0_cg_regs = {
> +       .set_ofs = 0x104,
> +       .clr_ofs = 0x104,
> +       .sta_ofs = 0x104,

You are using the _no_setclr_ops variant. That means the .set_ofs and
.clr_ofs fields don't have any meaning and are not used. Please just
don't initialize them.

I think this applies to some of the other patches as well.

> +};
> +
> +static const struct mtk_gate_regs nna1_cg_regs = {
> +       .set_ofs = 0x110,
> +       .clr_ofs = 0x110,
> +       .sta_ofs = 0x110,
> +};
> +
> +static const struct mtk_gate_regs nna2_cg_regs = {
> +       .set_ofs = 0x90,
> +       .clr_ofs = 0x90,
> +       .sta_ofs = 0x90,
> +};
> +
> +static const struct mtk_gate_regs nna3_cg_regs = {
> +       .set_ofs = 0x94,
> +       .clr_ofs = 0x94,
> +       .sta_ofs = 0x94,
> +};
> +
> +static const struct mtk_gate_regs nna4_cg_regs = {
> +       .set_ofs = 0x98,
> +       .clr_ofs = 0x98,
> +       .sta_ofs = 0x98,
> +};
> +
> +static const struct mtk_gate_regs nna5_cg_regs = {
> +       .set_ofs = 0x9c,
> +       .clr_ofs = 0x9c,
> +       .sta_ofs = 0x9c,
> +};
> +
> +static const struct mtk_gate_regs nna6_cg_regs = {
> +       .set_ofs = 0xa0,
> +       .clr_ofs = 0xa0,
> +       .sta_ofs = 0xa0,
> +};
> +
> +static const struct mtk_gate_regs nna7_cg_regs = {
> +       .set_ofs = 0xa4,
> +       .clr_ofs = 0xa4,
> +       .sta_ofs = 0xa4,
> +};

Unfortunately this hardware block is not documented in the datasheets,
so I can't verify these register offsets.

> +
> +#define GATE_NNA0(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &nna0_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +
> +#define GATE_NNA1(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &nna1_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +
> +#define GATE_NNA2(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &nna2_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +
> +#define GATE_NNA3(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &nna3_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +
> +#define GATE_NNA4(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &nna4_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +
> +#define GATE_NNA5(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &nna5_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +
> +#define GATE_NNA6(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &nna6_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +
> +#define GATE_NNA7(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &nna7_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)

Defining a bunch of macros, only to have each of them used once doesn't
provide any gains with regards to reusing code. Please consider just using
GATE_MTK directly below.

In the general case I would probably make some derivatives of GATE_MTK,
such that the ops field (which seems to be the longest) is hidden, but
all the other fields are exposed.

> +static const struct mtk_gate nna_clks[] = {
> +       /* NNA0 */
> +       GATE_NNA0(CLK_NNA_F26M, "nna_f26m", "clk26m", 0),
> +       /* NNA1 */
> +       GATE_NNA1(CLK_NNA_AXI, "nna_axi", "axi_sel", 0),
> +       /* NNA2 */
> +       GATE_NNA2(CLK_NNA_NNA0, "nna_nna0", "nna0_sel", 0),
> +       /* NNA3 */
> +       GATE_NNA3(CLK_NNA_NNA1, "nna_nna1", "nna0_sel", 0),

Is this correct? I would expect the clock for nna1 to be fed from
"nna1_sel".

ChenYu

> +       /* NNA4 */
> +       GATE_NNA4(CLK_NNA_NNA0_EMI, "nna_nna0_emi", "mem_466m", 0),
> +       GATE_NNA4(CLK_NNA_CKGEN_MEM, "nna_ckgen_mem", "mem_466m", 4),
> +       /* NNA5 */
> +       GATE_NNA5(CLK_NNA_NNA1_EMI, "nna_nna1_emi", "mem_466m", 0),
> +       /* NNA6 */
> +       GATE_NNA6(CLK_NNA_NNA0_AXI, "nna_nna0_axi", "axi_sel", 0),
> +       /* NNA7 */
> +       GATE_NNA7(CLK_NNA_NNA1_AXI, "nna_nna1_axi", "axi_sel", 0),
> +};
> +
> +static const struct mtk_clk_desc nna_desc = {
> +       .clks = nna_clks,
> +       .num_clks = ARRAY_SIZE(nna_clks),
> +};
> +
> +static const struct of_device_id of_match_clk_mt8195_nna[] = {
> +       {
> +               .compatible = "mediatek,mt8195-nnasys",
> +               .data = &nna_desc,
> +       }, {
> +               /* sentinel */
> +       }
> +};
> +
> +static struct platform_driver clk_mt8195_nna_drv = {
> +       .probe = mtk_clk_simple_probe,
> +       .driver = {
> +               .name = "clk-mt8195-nna",
> +               .of_match_table = of_match_clk_mt8195_nna,
> +       },
> +};
> +
> +builtin_platform_driver(clk_mt8195_nna_drv);
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
