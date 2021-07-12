Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78379C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 08:51:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31AB260FF3
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 08:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31AB260FF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gdn9UO7sT8ZfQ+0wWmHYRpFbWq9v2hKGhwAt3aL2YMI=; b=v5kWlDHR0PRSGZ
	4Z1v1LSuyRInNQtGisBK0BiDEF1EwBjOyjpoylKb7SJyPrkJknn9cXQJ7FSTwhUu8CdV4avKQ4Mev
	kVlzYFPyf5uzdW5CzcbbCC1xjL1ZYBlzkMcU344eRQcg1mKmfWMqweI/SOxotjVJ9Rays0C7cMt6E
	8p2uc3/8JDFnEQkusY/yon88PT25ZAxY8lxoBn1e9smTJEFlcJLjL0NqfXj9Zx9GhLyV1dWzkAnJ/
	+lAmH8gG/Xv0H2z06gGKvT6Ywz+KfapFWJ/avJF+8N/Lca4bqcN1oe94o2Kse8BXmyCP8UIieVfbs
	/1XobrWOQ8zwUYN2I5GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2rfI-006efX-AR; Mon, 12 Jul 2021 08:51:48 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2rfF-006eeQ-3X
 for linux-mediatek@lists.infradead.org; Mon, 12 Jul 2021 08:51:47 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 141so6420318ljj.2
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Jul 2021 01:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sR4KnKKgxHN9z8BeYEVAscsOfy0MsCFzGozgJRmjHoQ=;
 b=KBTKNUYZKpv1sfofoG4yBTpCqrXuE/QxxcU5XAWeL7z1AGVZFoAa5YAou4XmMVTWqr
 oKvV+cFzMqHu22KtQT1+v+8BIhMvn9fPjAqM+CkB2XEcVzcqyWrW/KgN16Lto6pSAWNW
 yMOezXNLCbp6WHbZzS+yVgpy7N2WIXBtiL8DA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sR4KnKKgxHN9z8BeYEVAscsOfy0MsCFzGozgJRmjHoQ=;
 b=atDaWDUzP6ag37KwweUm+GnKFVSH9qW4WimL929Hl81UqAT5IvHGWqwydps3y00Rbv
 OXQQRhH0qRaoxaWjCFvtNxk31i6X1ly8DlSxLTJnXlkHIDYg68uxYMbUl7MVD11N6T0J
 CinzBZvkszomX1CO04hAN+EJZy4OjBMUelEMujm+999YacW6ZjXMZtbWybWSbVwinVzC
 WCx21oulVy/nknU5ALT7/QddPThb05eLbpgR4IyHf/ksDAldxnLyDOJQ6PXlKi0yZ+P9
 +qGvBW3hukF0E5Qt6zIsb8BBiQbN5Fdqn6b7/zlEajf1LXJUBtigMzN5D+nBQGCYNz9u
 6ZLQ==
X-Gm-Message-State: AOAM533TRtnSvFrWKeEPfkzbt4TVR88S/mWY6JyEIbM8wX4v3u4lakXa
 Ytb/ycSyC075530XgcLWnEQBac6k5BT0OBstb5afKA==
X-Google-Smtp-Source: ABdhPJznoaETcAUcESZx3FrbuVmH9FyPfOB6iuI5K/5+igBo1ampLvrOGeE2zzhzQgFOCefiXeU1BA4Gn8l8OL90wfU=
X-Received: by 2002:a05:651c:2115:: with SMTP id
 a21mr41006635ljq.185.1626079903572; 
 Mon, 12 Jul 2021 01:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-23-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-23-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jul 2021 16:51:32 +0800
Message-ID: <CAGXv+5EkunhQMnEP1gfkM-t1X+wUed1PkBTA+RZTdBQ3OGgd3g@mail.gmail.com>
Subject: Re: [PATCH 22/22] clk: mediatek: Add MT8195 apusys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_015145_217611_CBFBA296 
X-CRM114-Status: GOOD (  29.06  )
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
> Add MT8195 apusys clock provider
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig                 |  6 ++
>  drivers/clk/mediatek/Makefile                |  1 +
>  drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 84 ++++++++++++++++++++
>  3 files changed, 91 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-apusys_pll.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index ade85a52b7ed..9bd1ebff61f2 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -690,6 +690,12 @@ config COMMON_CLK_MT8195_IMP_IIC_WRAP
>         help
>           This driver supports MediaTek MT8195 imp_iic_wrap clocks.
>
> +config COMMON_CLK_MT8195_APUSYS_PLL
> +       bool "Clock driver for MediaTek MT8195 apusys_pll"
> +       depends on COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 apusys_pll clocks.
> +
>  config COMMON_CLK_MT8516
>         bool "Clock driver for MediaTek MT8516"
>         depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index b10c6267ba98..676ed7d665b7 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -98,5 +98,6 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS0) += clk-mt8195-vpp0.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS1) += clk-mt8195-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) += clk-mt8195-wpe.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_IMP_IIC_WRAP) += clk-mt8195-imp_iic_wrap.o
> +obj-$(CONFIG_COMMON_CLK_MT8195_APUSYS_PLL) += clk-mt8195-apusys_pll.o
>  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
>  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
> new file mode 100644
> index 000000000000..d9b49cf71281
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
> @@ -0,0 +1,84 @@
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
> +#define MT8195_PLL_FMAX                (3800UL * MHZ)
> +#define MT8195_PLL_FMIN                (1500UL * MHZ)
> +#define MT8195_INTEGER_BITS    8
> +
> +#define PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags,      \
> +                       _rst_bar_mask, _pcwbits, _pd_reg, _pd_shift,    \
> +                       _tuner_reg, _tuner_en_reg, _tuner_en_bit,       \
> +                       _pcw_reg, _pcw_shift, _pcw_chg_reg,                             \
> +                       _en_reg, _pll_en_bit) {                                 \

Some of these fields are always set to zero in this driver. Either they
use the same value, or it means the particular function is not supported
in the hardware.

You could move the fixed value for unsupported functions, such as rst_bar_mask,
or even all common values, into the macro to simplify the macro argument list.
And if you do so, please also add comments explaining which values are shared,
and why they can be shared.

I believe the same could also be done for the APLL driver.

> +               .id = _id,                                              \
> +               .name = _name,                                          \
> +               .reg = _reg,                                            \
> +               .pwr_reg = _pwr_reg,                                    \
> +               .en_mask = _en_mask,                                    \
> +               .flags = _flags,                                        \
> +               .rst_bar_mask = _rst_bar_mask,                          \
> +               .fmax = MT8195_PLL_FMAX,                                \
> +               .fmin = MT8195_PLL_FMIN,                                \
> +               .pcwbits = _pcwbits,                                    \
> +               .pcwibits = MT8195_INTEGER_BITS,                        \
> +               .pd_reg = _pd_reg,                                      \
> +               .pd_shift = _pd_shift,                                  \
> +               .tuner_reg = _tuner_reg,                                \
> +               .tuner_en_reg = _tuner_en_reg,                          \
> +               .tuner_en_bit = _tuner_en_bit,                          \
> +               .pcw_reg = _pcw_reg,                                    \
> +               .pcw_shift = _pcw_shift,                                \
> +               .pcw_chg_reg = _pcw_chg_reg,                            \
> +               .en_reg = _en_reg,                                      \
> +               .pll_en_bit = _pll_en_bit,                              \
> +       }
> +
> +static const struct mtk_pll_data apusys_plls[] = {
> +       PLL(CLK_APUSYS_PLL_APUPLL, "apusys_pll_apupll", 0x008, 0x014, 0,
> +               0, 0, 22, 0x00c, 24, 0, 0, 0, 0x00c, 0, 0, 0, 0),
> +       PLL(CLK_APUSYS_PLL_NPUPLL, "apusys_pll_npupll", 0x018, 0x024, 0,
> +               0, 0, 22, 0x01c, 24, 0, 0, 0, 0x01c, 0, 0, 0, 0),
> +       PLL(CLK_APUSYS_PLL_APUPLL1, "apusys_pll_apupll1", 0x028, 0x034, 0,
> +               0, 0, 22, 0x02c, 24, 0, 0, 0, 0x02c, 0, 0, 0, 0),
> +       PLL(CLK_APUSYS_PLL_APUPLL2, "apusys_pll_apupll2", 0x038, 0x044, 0,
> +               0, 0, 22, 0x03c, 24, 0, 0, 0, 0x03c, 0, 0, 0, 0),

The datasheet doesn't provide names for these clocks. The values here look
correct though.

> +};
> +
> +static int clk_mt8195_apusys_pll_probe(struct platform_device *pdev)
> +{
> +       struct clk_onecell_data *clk_data;
> +       struct device_node *node = pdev->dev.of_node;
> +
> +       clk_data = mtk_alloc_clk_data(CLK_APUSYS_PLL_NR_CLK);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       mtk_clk_register_plls(node, apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
> +
> +       return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +}
> +
> +static const struct of_device_id of_match_clk_mt8195_apusys_pll[] = {
> +       { .compatible = "mediatek,mt8195-apusys_pll", },
> +       {}
> +};
> +
> +static struct platform_driver clk_mt8195_apusys_pll_drv = {
> +       .probe = clk_mt8195_apusys_pll_probe,
> +       .driver = {
> +               .name = "clk-mt8195-apusys_pll",
> +               .of_match_table = of_match_clk_mt8195_apusys_pll,
> +       },
> +};
> +

The general comments from the other patches apply as well


Regards
ChenYu


> +builtin_platform_driver(clk_mt8195_apusys_pll_drv);
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
