Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB1DC07E99
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 08:41:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E717E613C8
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 08:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E717E613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67H8skcFdL9DmDj5fdingYarMp2FIDiBU4oQASQmDs8=; b=HWlBZ80KBDOOt1
	t4gb8nOQ7bfFLs7jh7FcsvG3LHOK/FMR9TwGaYRjd6iDP+RNUbAphDGRAWcH2NdFKB1P6BMyRbN8i
	Wko/74G9zQpoILGGJt73MytATWFMCOQnYP/XU6ziWHFYiRZP5vHOtZkHr9+to10dx9n6VibaWYQ7o
	+TkP/UjwjjbbKw9qSjG3PQnkrXEOrmYay85VuNAZCNG70nMprwdOwIOGDBSR4UO13/yiCpirBzXNu
	va9KegSPc/7l9+QuoUdSbWdMUCwFc0XLUL2oYdxo9PxppM8mXwnygN2nwlxfCtG/J2iOzxkbViJR1
	RGJH48Yik3PmYphi3AtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1m4a-001Az8-6e; Fri, 09 Jul 2021 08:41:24 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1m4I-001Auw-HO
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 08:41:09 +0000
Received: by mail-lj1-x22e.google.com with SMTP id r20so6841711ljd.10
 for <linux-mediatek@lists.infradead.org>; Fri, 09 Jul 2021 01:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s9ysEL8huxU2AWOCNwXERtpklLMvq4dpnPKkchZzOjw=;
 b=bvBrsDokhh6s1kmHIWG5pza0A5d/C2X3XL8vsoYiZit+aPEE4TcZHLs87EbOsQKzkV
 QtDr8Z2N8K3OaTP02LITMimfFokRJYnVh0SPoeSrfGERioyEWTerDmB6B+Mz+qmBFtDa
 UGN0uiXgWSWC3RuwJ0m1h6tCt/dkBjLC0e2Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s9ysEL8huxU2AWOCNwXERtpklLMvq4dpnPKkchZzOjw=;
 b=hmp+nWJakBaR1ov5kfc9RhW0RV93EflYoo5m0vk0g3VgiGoN5rvKLBTNans+yTKDfz
 0rZ+OY2HUIDNgL8Mc7d2Wph/HXtpTllTC9qoU4Q9xcwIPiXTZZEB787kWJJZzpoH+okQ
 a485C4a63QhpfbXW8JID/h0P9jgG3zmT7N6kL2lFduNUzv47bTVUUA+ZaZzWZcqcnLWL
 2X05/SJ2kVBeEEi5oJwBJDgTuRzNH1Or/NlQ7tDRehuVCKZD4Ot50fiaexZ9qJnuRN/L
 cNNRkFAU3O2ZIfew2d4HvcBo2s9frBXwrem4tm08Q5nAp6H3I/ut6eDu5QpItVpHJAEC
 juoA==
X-Gm-Message-State: AOAM530rMslEe4Y2vlwqz2hrMNeq6Hbb5Uwl9vwuTOppAJABG/wrHoA3
 8vKf51jQJC5mYb6mVz1/By2ZQC+GfPI6Qv9J8p6ouA==
X-Google-Smtp-Source: ABdhPJw0A8Xx6mxsgAmLjYXEUr5pu2iZlVFWnKdDd+TBB1ERwfLINur9fK2TnvDhO84RWMlZzkAOKWwe1xzvDg4YNTw=
X-Received: by 2002:a2e:b55b:: with SMTP id a27mr17421733ljn.251.1625820064844; 
 Fri, 09 Jul 2021 01:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-15-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-15-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 9 Jul 2021 16:40:53 +0800
Message-ID: <CAGXv+5GbyKpT9mTseCc2t94UWBCoPWtrXUfd_ZqXOewhP3QEZw@mail.gmail.com>
Subject: Re: [PATCH 14/22] clk: mediatek: Add MT8195 vdecsys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_014106_610582_11FE15B8 
X-CRM114-Status: GOOD (  24.25  )
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

On Thu, Jun 17, 2021 at 7:02 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 vdecsys clock providers
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig           |   6 ++
>  drivers/clk/mediatek/Makefile          |   1 +
>  drivers/clk/mediatek/clk-mt8195-vdec.c | 106 +++++++++++++++++++++++++
>  3 files changed, 113 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-vdec.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index d34517728f4a..b7881b8ebb23 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -642,6 +642,12 @@ config COMMON_CLK_MT8195_NNASYS
>         help
>           This driver supports MediaTek MT8195 nnasys clocks.
>
> +config COMMON_CLK_MT8195_VDECSYS
> +       bool "Clock driver for MediaTek MT8195 vdecsys"
> +       depends on COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 vdecsys clocks.
> +

Same comments about the commit log and Kconfig option.

>  config COMMON_CLK_MT8516
>         bool "Clock driver for MediaTek MT8516"
>         depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 49e585a7ac8e..9acfa705f1de 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -90,5 +90,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195_IPESYS) += clk-mt8195-ipe.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_MFGCFG) += clk-mt8195-mfg.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_SCP_ADSP) += clk-mt8195-scp_adsp.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_NNASYS) += clk-mt8195-nna.o
> +obj-$(CONFIG_COMMON_CLK_MT8195_VDECSYS) += clk-mt8195-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
>  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt8195-vdec.c b/drivers/clk/mediatek/clk-mt8195-vdec.c
> new file mode 100644
> index 000000000000..9ab84e75e1a0
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8195-vdec.c
> @@ -0,0 +1,106 @@
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

Please order alphabetically. I think this applies to all the other patches.
I missed this in the earlier ones, but please fix them nonetheless.

> +
> +#include <dt-bindings/clock/mt8195-clk.h>
> +
> +static const struct mtk_gate_regs vdec0_cg_regs = {
> +       .set_ofs = 0x0,
> +       .clr_ofs = 0x4,
> +       .sta_ofs = 0x0,
> +};
> +
> +static const struct mtk_gate_regs vdec1_cg_regs = {
> +       .set_ofs = 0x200,
> +       .clr_ofs = 0x204,
> +       .sta_ofs = 0x200,
> +};
> +
> +static const struct mtk_gate_regs vdec2_cg_regs = {
> +       .set_ofs = 0x8,
> +       .clr_ofs = 0xc,
> +       .sta_ofs = 0x8,
> +};
> +
> +#define GATE_VDEC0(_id, _name, _parent, _shift)                        \
> +       GATE_MTK(_id, _name, _parent, &vdec0_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
> +
> +#define GATE_VDEC1(_id, _name, _parent, _shift)                        \
> +       GATE_MTK(_id, _name, _parent, &vdec1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
> +
> +#define GATE_VDEC2(_id, _name, _parent, _shift)                        \
> +       GATE_MTK(_id, _name, _parent, &vdec2_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
> +
> +static const struct mtk_gate vdec_clks[] = {
> +       /* VDEC0 */
> +       GATE_VDEC0(CLK_VDEC_VDEC, "vdec_vdec", "vdec_sel", 0),
> +       /* VDEC1 */
> +       GATE_VDEC1(CLK_VDEC_LAT, "vdec_lat", "vdec_sel", 0),
> +       /* VDEC2 */
> +       GATE_VDEC2(CLK_VDEC_LARB1, "vdec_larb1", "vdec_sel", 0),
> +};
> +
> +static const struct mtk_gate vdec_core1_clks[] = {
> +       /* VDEC0 */
> +       GATE_VDEC0(CLK_VDEC_CORE1_VDEC, "vdec_core1_vdec", "vdec_sel", 0),
> +       /* VDEC1 */
> +       GATE_VDEC1(CLK_VDEC_CORE1_LAT, "vdec_core1_lat", "vdec_sel", 0),
> +       /* VDEC2 */
> +       GATE_VDEC2(CLK_VDEC_CORE1_LARB1, "vdec_core1_larb1", "vdec_sel", 0),
> +};
> +
> +static const struct mtk_gate vdec_soc_clks[] = {
> +       /* VDEC0 */
> +       GATE_VDEC0(CLK_VDEC_SOC_VDEC, "vdec_soc_vdec", "vdec_sel", 0),
> +       /* VDEC1 */
> +       GATE_VDEC1(CLK_VDEC_SOC_LAT, "vdec_soc_lat", "vdec_sel", 0),
> +       /* VDEC2 */
> +       GATE_VDEC2(CLK_VDEC_SOC_LARB1, "vdec_soc_larb1", "vdec_sel", 0),
> +};
> +
> +static const struct mtk_clk_desc vdec_desc = {
> +       .clks = vdec_clks,
> +       .num_clks = ARRAY_SIZE(vdec_clks),
> +};
> +
> +static const struct mtk_clk_desc vdec_core1_desc = {
> +       .clks = vdec_core1_clks,
> +       .num_clks = ARRAY_SIZE(vdec_core1_clks),
> +};
> +
> +static const struct mtk_clk_desc vdec_soc_desc = {
> +       .clks = vdec_soc_clks,
> +       .num_clks = ARRAY_SIZE(vdec_soc_clks),
> +};
> +
> +static const struct of_device_id of_match_clk_mt8195_vdec[] = {
> +       {
> +               .compatible = "mediatek,mt8195-vdecsys",
> +               .data = &vdec_desc,
> +       }, {
> +               .compatible = "mediatek,mt8195-vdecsys_core1",
> +               .data = &vdec_core1_desc,
> +       }, {
> +               .compatible = "mediatek,mt8195-vdecsys_soc",
> +               .data = &vdec_soc_desc,
> +       }, {
> +               /* sentinel */
> +       }
> +};
> +
> +static struct platform_driver clk_mt8195_vdec_drv = {
> +       .probe = mtk_clk_simple_probe,
> +       .driver = {
> +               .name = "clk-mt8195-vdec",
> +               .of_match_table = of_match_clk_mt8195_vdec,
> +       },
> +};
> +

Nit: you could drop the empty line here. Same in the other patches.

ChenYu


> +builtin_platform_driver(clk_mt8195_vdec_drv);
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
