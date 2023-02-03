Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C1BC61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 07:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHxnq4NIAvqcaAQqKPv9unLZ6dk9i+ul3lPvliSm8to=; b=mfC+Jb6zIbPxCWe/2HkbY0+YFn
	pUYJah40VC4d8U5+d8+ZIwLH2Zy6Uqw/64b2qyLhyAjl4APnJEFR2W44lTK6KGveAzlIBnclj/1NO
	e7IDQfl23LZs/2rHNn5ZS93dl3PEUNx/zH3dUyiq0xx2HSiraMs0LI2ld5Lr7T7Zhz3wuW5220xDa
	AfJ7JyURH802EpYXxksAMAfxhako1+9c2I34dYfQ3hY0u1eYrfPO+kokGsjkaDjKKaY834Vnzv50M
	yVL/4Ai/DyeMRzuoOMXQihZlveyW1iaLVXA04GGWASDKCnAuSBIFv2qjsEpvvOP1MKkSS+oDQAtXM
	xgMnKmMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNq5k-000f5u-Qp; Fri, 03 Feb 2023 07:02:36 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNq5i-000f45-5F
	for linux-mediatek@lists.infradead.org; Fri, 03 Feb 2023 07:02:35 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id u199so2104703vkb.12
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 23:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHxnq4NIAvqcaAQqKPv9unLZ6dk9i+ul3lPvliSm8to=;
        b=i+piRv4aM1OJLjMLD6b35atiMLDBkWlgdjMTQx2ceBe7f2oj2MubVl2GOeYz8svWBL
         JCj0B5LIykOnqKn1Xzvx0lbNKW5MiDYo4R6gEjjpfX9UxpMYpTu3fny1wERq2gd70BU+
         wy/PsccjJ2lZMarPhrYApiZegzi/vuPR6d/r0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHxnq4NIAvqcaAQqKPv9unLZ6dk9i+ul3lPvliSm8to=;
        b=VfG3YfcVrlohZnqA/ruP3ZeXPSuuZL8X4R1lhelautJuDoM+wS/aG6VPeb6lFXBteG
         fWSRwAdQ98iw+WRnv4Z/0pNcFmc7rJ9nD4WMFy+6DqfBZSeiAAqPcUJBucQijnByMRrK
         hQSeZxGoqwGOJpEaHMN9GsGTa+lsKUrTakb27ShQ6o1xSvkYOce9gQbPatOiZ9ASNFZj
         DsfnronE7lGFugMpx3oX3QdCvwq9vBdfBjdkPKHFMjg/b659rDpdTqsesKSYUczMUSiz
         wFkLjIMu/GAPfNUHHiJtLaLhVVikS+voI49kG24/ycJ8DaF8U2qp4k0I0HMhX7v2lKt0
         v9xw==
X-Gm-Message-State: AO0yUKWPuNcaeJorSb25gyaUitBfG4+D96WuLGwHNo8oCgLhZe+5GN7G
	ssMRVdLqaW/+l+osvqMCrYhyal5YmYqUG/Jz0WgjyA==
X-Google-Smtp-Source: AK7set+aTOijar/puEUL78ABZvo/AOqIKUR8h1vEUaV4Q1CRoGlXDNr1x4ZpVZTctOHPDyk/5tzwRCQVHGrQ0dN6omE=
X-Received: by 2002:a05:6122:131:b0:3e8:8f:f3a7 with SMTP id
 a17-20020a056122013100b003e8008ff3a7mr1321932vko.30.1675407752112; Thu, 02
 Feb 2023 23:02:32 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-11-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-11-Garmin.Chang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Feb 2023 15:02:21 +0800
Message-ID: <CAGXv+5FGCVSihGu5diCQ1Q=jPRHz7RQ2KrXk-13LL4z1wbkfjg@mail.gmail.com>
Subject: Re: [PATCH v5 10/19] clk: mediatek: Add MT8188 mfgcfg clock support
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
X-CRM114-CacheID: sfid-20230202_230234_224731_FF119683 
X-CRM114-Status: GOOD (  16.13  )
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

On Thu, Jan 19, 2023 at 8:50 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 mfg clock controller which provides clock gate
> control for GPU.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> ---
>  drivers/clk/mediatek/Makefile         |  2 +-
>  drivers/clk/mediatek/clk-mt8188-mfg.c | 47 +++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8188-mfg.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 4a599122f761..a0fd87a882b5 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -86,7 +86,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
>  obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o \
>                                    clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o \
>                                    clk-mt8188-cam.o clk-mt8188-ccu.o clk-mt8188-img.o \
> -                                  clk-mt8188-ipe.o
> +                                  clk-mt8188-ipe.o clk-mt8188-mfg.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8188-mfg.c b/drivers/clk/mediatek/clk-mt8188-mfg.c
> new file mode 100644
> index 000000000000..57b0afb5f4df
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8188-mfg.c
> @@ -0,0 +1,47 @@
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
> +static const struct mtk_gate_regs mfgcfg_cg_regs = {
> +       .set_ofs = 0x4,
> +       .clr_ofs = 0x8,
> +       .sta_ofs = 0x0,
> +};
> +
> +#define GATE_MFG(_id, _name, _parent, _shift)                          \
> +       GATE_MTK_FLAGS(_id, _name, _parent, &mfgcfg_cg_regs, _shift,    \
> +                      &mtk_clk_gate_ops_setclr, CLK_SET_RATE_PARENT)
> +
> +static const struct mtk_gate mfgcfg_clks[] = {
> +       GATE_MFG(CLK_MFGCFG_BG3D, "mfgcfg_bg3d", "top_mfg_core_tmp", 0),

Are you sure the parent isn't "mfg_ck_fast_ref"?

ChenYu

