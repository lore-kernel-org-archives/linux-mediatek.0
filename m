Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED4FC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:03:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A0F361357
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A0F361357
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpzDuYXz54G+ez0YRdObmyiO/ZH0WKgp4MnDRZzg7p8=; b=rOLVRkHtSgKubj
	fKizYfSuDbDNsIinE0hzDYl2WuUt7eN73PBUT5iSCFX/fPCxUS971SB3rvDqomMR/djj8T4+XUaAu
	4AvEbmcPiiZlklMnB+UZJfnpEKmmCnydHOCOwnYtRDA3nuAxB9xrVZC/fYnl7/tMH1wXE/HXgDn0W
	yOHeykLvJVUNQfvZ29VKj7LvvbMLWqUsDsLywU+lrDGA3UMppMHegRT5rdmvkNBI0qCdu89zwav/l
	NybixQlsBGpUeguPiDoG+wxIKM1Ur77iOc7acgOAeIKe9tjCXIy8aKoQEX7vGxM+1TEqSFpcquWkR
	CWC2CjYWEOIcBOzpKKYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI8fZ-00Gf5D-5F; Mon, 23 Aug 2021 12:03:13 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI8fJ-00GeyS-0w
 for linux-mediatek@lists.infradead.org; Mon, 23 Aug 2021 12:03:01 +0000
Received: by mail-lf1-x136.google.com with SMTP id x27so37407242lfu.5
 for <linux-mediatek@lists.infradead.org>; Mon, 23 Aug 2021 05:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k1wN6uWWUAEncK245AcEkXi5X3BYGhPR13+cEKc80po=;
 b=IQhmAOTh076A8tMT6pk5HbQgbaeVpSVv5uJSMAJwH3wR/oCvOzx29eHnE6YNtmNo3D
 r1dogrV1Dcy5VXqbQGikn8CVjv/9HMI+9sw8jPjJf57RIHJJ7aQZYd/A8Km8wDhreyqB
 yEAFrozQ76vPYJ7DcZVdYpdIyh9pWQiYWCvpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k1wN6uWWUAEncK245AcEkXi5X3BYGhPR13+cEKc80po=;
 b=E3DKC0Z6NqEAvgtD1Z2sHMY1GZEJGBlTw0xPC9YoIzB10cYtMgmfnXL/FI8E0FMzXQ
 lxGe9uq0CC/mPCJ0i3gFwzML9EkHHr78IuH3fJgmhNCFRDjIn/+CzngBdkRqO0fdQUpX
 Ralq+9xglQRYOAnvz1n6AFp7BwMkduR2xVcfe7taT9Nn+N2I2XP42w1BhC+lrRBw/1Vh
 URSUVpLH0442MMDUE8OWQlNcwhPKM0B7sXK03+ZKeAgCCOi6O+VHcJ2kWh51VGouKT27
 1JCYHhmMNnJbzND+y6f45+ptG1qeIQxtBmAVASLpPlwxmayC7F6mYY661Mm82TybA/VW
 ox6g==
X-Gm-Message-State: AOAM5316avCyDn0mVl3cc6xuLrBrMLsfJkPcvtn/D8t37FW36zvg5qQh
 NRMb8nD7wixeLAwSEAkTrzcXdM9BY3Ha4/H8a7unBA==
X-Google-Smtp-Source: ABdhPJyH1oi6Z4h+7qyE77UctpAsFaN4P2z2I8M6V2yCSw97FXpzm2rm4h5jNd7jUciTrW6+SfLgUk14QDVhIU48l8g=
X-Received: by 2002:ac2:5e8f:: with SMTP id b15mr22598853lfq.656.1629720163409; 
 Mon, 23 Aug 2021 05:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-15-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-15-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Aug 2021 20:02:32 +0800
Message-ID: <CAGXv+5H-NqZYeGUwsZQnu45DQLn=JX=4zrpuGHZ4ArC7p3Ks=Q@mail.gmail.com>
Subject: Re: [v2 14/24] clk: mediatek: Add MT8195 mfgcfg clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_050257_128480_DE800D10 
X-CRM114-Status: GOOD (  22.95  )
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

On Fri, Aug 20, 2021 at 7:26 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 mfg clock controller which provides clock gate
> control for Main Frame Graphic.

I think it would be easier to understand if it just said GPU instead. Or
it could write:

     ... for Main Frame Graphic, aka integrated GPU.

Try to use more generic terms. The idea is for people with at least some
basic knowledge to be able to understand.

> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Makefile         |  2 +-
>  drivers/clk/mediatek/clk-mt8195-mfg.c | 47 +++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-mfg.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 84d315a6b3e4..042db433245a 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -81,6 +81,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o clk-mt8195-cam.o \
> -                                       clk-mt8195-ccu.o clk-mt8195-img.o clk-mt8195-ipe.o
> +                                       clk-mt8195-ccu.o clk-mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o

Wrap line, please.


Regards
ChenYu


>  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
>  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt8195-mfg.c b/drivers/clk/mediatek/clk-mt8195-mfg.c
> new file mode 100644
> index 000000000000..0a81fe1fe50e
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8195-mfg.c
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +//
> +// Copyright (c) 2021 MediaTek Inc.
> +// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +#include "clk-gate.h"
> +#include "clk-mtk.h"
> +
> +#include <dt-bindings/clock/mt8195-clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +
> +static const struct mtk_gate_regs mfg_cg_regs = {
> +       .set_ofs = 0x4,
> +       .clr_ofs = 0x8,
> +       .sta_ofs = 0x0,
> +};
> +
> +#define GATE_MFG(_id, _name, _parent, _shift)                  \
> +       GATE_MTK(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +static const struct mtk_gate mfg_clks[] = {
> +       GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "top_mfg_core_tmp", 0),
> +};
> +
> +static const struct mtk_clk_desc mfg_desc = {
> +       .clks = mfg_clks,
> +       .num_clks = ARRAY_SIZE(mfg_clks),
> +};
> +
> +static const struct of_device_id of_match_clk_mt8195_mfg[] = {
> +       {
> +               .compatible = "mediatek,mt8195-mfgcfg",
> +               .data = &mfg_desc,
> +       }, {
> +               /* sentinel */
> +       }
> +};
> +
> +static struct platform_driver clk_mt8195_mfg_drv = {
> +       .probe = mtk_clk_simple_probe,
> +       .driver = {
> +               .name = "clk-mt8195-mfg",
> +               .of_match_table = of_match_clk_mt8195_mfg,
> +       },
> +};
> +builtin_platform_driver(clk_mt8195_mfg_drv);
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
