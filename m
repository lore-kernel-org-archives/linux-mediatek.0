Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC08C636CC
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 06:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHKoj/lNK1SyccOL7n5WUnvmfnTUkgJ46XEZvhcRCyY=; b=IF5FAU4RA88pa9A4HSuk8E/4pW
	SzuQVorq094liDFN2QIk5jN0JWOm5bbVRuGyKs0GCmSCa5+xAmqV5sNrqWQT22aLPkmm4O7CWcL2E
	54z26Qvcx7aBQVnTMXtgleDvW3QrWAFdLrbQHJjlne2/lbNYTDAd94le34/FKGl4Y1wy4ftu8E6di
	MQ0xMgmR4tvIS4K52DyuK0uxHaWORnkjYCFwsac3TLCLXjkjoIDmegJPsc3zvBX5cyFoUzGLsN5NE
	hI8/AgbIqZpX4EjoGOr/GVmzANFFOoPSVpsg5T3IFK4cQ8zRTOl+eRQdfhnSfohr8B1nDD565lY70
	QRKP6e5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNpzP-000dQ4-86; Fri, 03 Feb 2023 06:56:03 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNpzG-000dMZ-6O
	for linux-mediatek@lists.infradead.org; Fri, 03 Feb 2023 06:55:55 +0000
Received: by mail-vs1-xe36.google.com with SMTP id p10so4426642vsu.5
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 22:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qHKoj/lNK1SyccOL7n5WUnvmfnTUkgJ46XEZvhcRCyY=;
        b=Amjypi/xdCz4Oais1y4zdg0oZuD41KjgKO4zyvIrBalcduanO82pOycBtAWhUSBMJo
         9vDNImp5FdnQcQiJEsmBPOHpN1Zrodzy/iFctJuTncCf5WvYsS77sTc0IVyWXDqqwXau
         JLGB2ZfCjF7Dm5pjw9B4QhvIvD7VvcbcZWUg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qHKoj/lNK1SyccOL7n5WUnvmfnTUkgJ46XEZvhcRCyY=;
        b=yjyf9Fh/DVDksfj5w5ZbFJd4GZPmS+I8YcqXfJzQ9yYH11bnfw4ahvBr/ABGe68TyX
         qM4T7zMm2GFS+84gsg35IHDfe7Pk4XI48clNpWnvihWwgcj4cCyaE7/rCb3P3+KWLzt5
         /gLwciagVo1OFrzfZ5nko0tdFqarUs8oIG7Lh2DTjCRrX+b4eRyOY+bxU1dsHd9Eixu5
         Bp5bU+ExUdlBsuywTy5tu5kmgAZRBjXg5koicGjgaYv8XlsLmpbu5WprmhBjQD+iFnE/
         XR8SvsNzOtc8yb+D2e08zvr1TGGdCBYtLvLeZN1p+A6EN98bo7dM9KfNqvQ2gWu6qNAq
         fssA==
X-Gm-Message-State: AO0yUKUQsLdr56DGkVxJstRGBREO3RAwgV/Um/+YdlSLqGX4LTIEaN2X
	Nmeza/kqlCfsSXW85Dfk9o+Vqx2EzDpiBDAqidyFWA==
X-Google-Smtp-Source: AK7set9+GjVQgYaX//p0S73gy4+yUQFJoCUCVrG5O5cMJEX9te26GuvuoE/hJdV/3CNOGppezAuuf69FtUyzrmp/FXM=
X-Received: by 2002:a67:fc92:0:b0:3f7:93c4:9e56 with SMTP id
 x18-20020a67fc92000000b003f793c49e56mr1690844vsp.85.1675407350436; Thu, 02
 Feb 2023 22:55:50 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-8-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-8-Garmin.Chang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Feb 2023 14:55:39 +0800
Message-ID: <CAGXv+5Gg1FGbKmg05pfuGOyzZAXiTYBxJG4Sbkxx86pY=SZ4Rw@mail.gmail.com>
Subject: Re: [PATCH v5 07/19] clk: mediatek: Add MT8188 ccusys clock support
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
X-CRM114-CacheID: sfid-20230202_225554_241881_A1C8201B 
X-CRM114-Status: GOOD (  19.16  )
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
> Add MT8188 ccusys clock controller which provides clock gate
> control in Camera Computing Unit.

If this is also for camera related functions, could you fold this into
the previous CAM clock driver? That would save a bit of space.

The code looks OK.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> ---
>  drivers/clk/mediatek/Makefile         |  2 +-
>  drivers/clk/mediatek/clk-mt8188-ccu.c | 48 +++++++++++++++++++++++++++
>  2 files changed, 49 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8188-ccu.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index dc247bf67e8b..dbd140b81763 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -85,7 +85,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
>                                    clk-mt8186-cam.o clk-mt8186-mdp.o clk-mt8186-ipe.o
>  obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o \
>                                    clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o \
> -                                  clk-mt8188-cam.o
> +                                  clk-mt8188-cam.o clk-mt8188-ccu.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8188-ccu.c b/drivers/clk/mediatek/clk-mt8188-ccu.c
> new file mode 100644
> index 000000000000..b7380060f906
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8188-ccu.c
> @@ -0,0 +1,48 @@
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
> +static const struct mtk_gate_regs ccu_cg_regs = {
> +       .set_ofs = 0x4,
> +       .clr_ofs = 0x8,
> +       .sta_ofs = 0x0,
> +};
> +
> +#define GATE_CCU(_id, _name, _parent, _shift)                  \
> +       GATE_MTK(_id, _name, _parent, &ccu_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
> +
> +static const struct mtk_gate ccu_clks[] = {
> +       GATE_CCU(CLK_CCU_LARB27, "ccu_larb27", "top_ccu", 0),
> +       GATE_CCU(CLK_CCU_AHB, "ccu_ahb", "top_ccu", 1),
> +       GATE_CCU(CLK_CCU_CCU0, "ccu_ccu0", "top_ccu", 2),
> +};
> +
> +static const struct mtk_clk_desc ccu_desc = {
> +       .clks = ccu_clks,
> +       .num_clks = ARRAY_SIZE(ccu_clks),
> +};
> +
> +static const struct of_device_id of_match_clk_mt8188_ccu[] = {
> +       { .compatible = "mediatek,mt8188-ccusys", .data = &ccu_desc},
> +       { /* sentinel */ }
> +};
> +
> +static struct platform_driver clk_mt8188_ccu_drv = {
> +       .probe = mtk_clk_simple_probe,
> +       .remove = mtk_clk_simple_remove,
> +       .driver = {
> +               .name = "clk-mt8188-ccu",
> +               .of_match_table = of_match_clk_mt8188_ccu,
> +       },
> +};
> +
> +builtin_platform_driver(clk_mt8188_ccu_drv);
> +MODULE_LICENSE("GPL");
> --
> 2.18.0
>
>

