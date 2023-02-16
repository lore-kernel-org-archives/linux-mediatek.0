Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754ADC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 10:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g85e4WuBLhzFev3Y5VQ9z5CZf87sSx8oeGtAD04aooo=; b=3dsUR96rHpB1iBgCZPXcP+6xnd
	JC06Vf5bjKbUgh1sYvmb/8CcF+gZxE7ePLNNZxmNsqvt+edRc5gpudEB904IOh41U1SkiCo+yjjUV
	29Iug9jR7mOCj24AC9EXKdWlj6HMuOkRjDlVIc54chH5+dp10oCwgRP5od8ZLk68QIKlmvgB+X2Fn
	FSdNBHAlFdfOdp4jF2/1+HOludJzODcyNbzUKUqYr6Hi0yhCGpxvUNY5nkhyYdDttFk5ww9o41Wgj
	IVCTR290LjrNb8UJuNU3HB5rWTt++Z4RUHv5pVQO0goxkJrqvZHc80CjT5z60Da5qegHGotPoWSxD
	zncpNm+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbxM-009m3J-Sd; Thu, 16 Feb 2023 10:57:40 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbwO-009lXp-LU
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 10:56:42 +0000
Received: by mail-vs1-xe36.google.com with SMTP id z15so1470870vsj.12
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 02:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g85e4WuBLhzFev3Y5VQ9z5CZf87sSx8oeGtAD04aooo=;
        b=dJJqSnRFBkuh+fxMQ7Aymj1b5+Ks9iTrbhwuk+QFyXo2yaEC99IvRckaEFxyO9a0Dn
         wQVoDTnUUOOMoeyA9fgKkRDNYnnaLznTotM7iKVmW0hM9KYRDS5g2xVABUqrLSPK7gfs
         Su4QJrhP+hC/FqicSs8Cd7LYgvn7BIk5GFTLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g85e4WuBLhzFev3Y5VQ9z5CZf87sSx8oeGtAD04aooo=;
        b=XhuDmXqd/e97xz8od2PiJRPesMnskN5ZIEyVdZ23KwhZ/LW+YJFXHpysGnd48gXVpD
         He4cj5eRuMUzzZCtBp3zVg6FTK90Qsc6CJjZXcSCfzdI16jJ6ww+5lH3+ucZZZnN/aBM
         CCakSEL3hx02QrUUBwLea6O698cvWbCBfIRhonUUUQgqfSJ6FJCkn4vGaIqsAVzmsbIM
         rxOBM4SlskS+53T9lWt5s4dpy6HEY5hbgPOAffQScrBnTm9cDbz7f7RI9/TsWJb4Q4Ri
         nTvq1+H5AsBN+/ig0xZLw8LvJF6OnvstbuAHzVrCsEnOpEPMYbGfdHJ2XNNgAyZAUsiP
         Lotg==
X-Gm-Message-State: AO0yUKXfnHw+7twavQN7Iv9n1S82YJ72QvO2TKMP5LGzAACtfKPr8cTk
	CR9jkcYsycbY2qQl1u0OBDrwcSYA6Qx1smh/L6lrKQ==
X-Google-Smtp-Source: AK7set8eg+iGw7Q343cvhYjqOIuGjWhWqu7k2x10ZvJDN/cCX+EgHhhuSW/6qdzp7XcQfrvJ120GVG6FSOFE7XxB4sY=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1013461vso.60.1676544999547; Thu, 16 Feb
 2023 02:56:39 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-27-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-27-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Feb 2023 18:56:28 +0800
Message-ID: <CAGXv+5Eq81k3hjTrM9JeP3bjnExjujDPsc-DcCVuryHrT-7KOw@mail.gmail.com>
Subject: Re: [PATCH v2 26/47] clk: mediatek: mt8516: Move apmixedsys clock
 driver to its own file
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_025640_747773_707E1423 
X-CRM114-Status: GOOD (  21.67  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for migrating mt8516 clocks to the common simple
> probe mechanism, convert the apmixedsys to be a separated
> platform driver and move it to clk-mt8516-apmixedsys.c.
> While at it, also fix some indentation issues.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile                |   2 +-
>  drivers/clk/mediatek/clk-mt8516-apmixedsys.c | 121 +++++++++++++++++++
>  drivers/clk/mediatek/clk-mt8516.c            |  81 -------------
>  3 files changed, 122 insertions(+), 82 deletions(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8516-apmixedsys.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 0f2cd735d9fd..3133ad8c2028 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -120,5 +120,5 @@ obj-$(CONFIG_COMMON_CLK_MT8365_MFG) += clk-mt8365-mfg.o
>  obj-$(CONFIG_COMMON_CLK_MT8365_MMSYS) += clk-mt8365-mm.o
>  obj-$(CONFIG_COMMON_CLK_MT8365_VDEC) += clk-mt8365-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT8365_VENC) += clk-mt8365-venc.o
> -obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
> +obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o clk-mt8516-apmixedsys.o
>  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt8516-apmixedsys.c b/drivers/clk/mediatek/clk-mt8516-apmixedsys.c
> new file mode 100644
> index 000000000000..5b87c9fb81f5
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8516-apmixedsys.c
> @@ -0,0 +1,121 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + *               James Liao <jamesjj.liao@mediatek.com>
> + *               Fabien Parent <fparent@baylibre.com>
> + *
> + * Copyright (c) 2023 Collabora, Ltd.
> + *               AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + */
> +
> +#include <dt-bindings/clock/mt8516-clk.h>
> +#include <linux/clk.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-mtk.h"
> +#include "clk-pll.h"
> +
> +#define MT8516_PLL_FMAX                (1502UL * MHZ)
> +
> +#define CON0_MT8516_RST_BAR    BIT(27)
> +
> +#define PLL_B(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits,  \
> +                       _pd_reg, _pd_shift, _tuner_reg, _pcw_reg,       \
> +                       _pcw_shift, _div_table) {                       \
> +               .id = _id,                                              \
> +               .name = _name,                                          \
> +               .reg = _reg,                                            \
> +               .pwr_reg = _pwr_reg,                                    \
> +               .en_mask = _en_mask,                                    \
> +               .flags = _flags,                                        \
> +               .rst_bar_mask = CON0_MT8516_RST_BAR,                    \
> +               .fmax = MT8516_PLL_FMAX,                                \
> +               .pcwbits = _pcwbits,                                    \
> +               .pd_reg = _pd_reg,                                      \
> +               .pd_shift = _pd_shift,                                  \
> +               .tuner_reg = _tuner_reg,                                \
> +               .pcw_reg = _pcw_reg,                                    \
> +               .pcw_shift = _pcw_shift,                                \
> +               .div_table = _div_table,                                \
> +       }
> +
> +#define PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits,    \
> +                       _pd_reg, _pd_shift, _tuner_reg, _pcw_reg,       \
> +                       _pcw_shift)                                     \
> +               PLL_B(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits, \
> +                       _pd_reg, _pd_shift, _tuner_reg, _pcw_reg, _pcw_shift, \
> +                       NULL)
> +
> +static const struct mtk_pll_div_table mmpll_div_table[] = {
> +       { .div = 0, .freq = MT8516_PLL_FMAX },
> +       { .div = 1, .freq = 1000000000 },
> +       { .div = 2, .freq = 604500000 },
> +       { .div = 3, .freq = 253500000 },
> +       { .div = 4, .freq = 126750000 },
> +       { } /* sentinel */
> +};
> +
> +static const struct mtk_pll_data plls[] = {
> +       PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0100, 0x0110, 0, 0,
> +           21, 0x0104, 24, 0, 0x0104, 0),
> +       PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0120, 0x0130, 0,
> +           HAVE_RST_BAR, 21, 0x0124, 24, 0, 0x0124, 0),
> +       PLL(CLK_APMIXED_UNIVPLL, "univpll", 0x0140, 0x0150, 0x30000000,
> +           HAVE_RST_BAR, 7, 0x0144, 24, 0, 0x0144, 0),
> +       PLL_B(CLK_APMIXED_MMPLL, "mmpll", 0x0160, 0x0170, 0, 0,
> +             21, 0x0164, 24, 0, 0x0164, 0, mmpll_div_table),
> +       PLL(CLK_APMIXED_APLL1, "apll1", 0x0180, 0x0190, 0, 0,
> +           31, 0x0180, 1, 0x0194, 0x0184, 0),
> +       PLL(CLK_APMIXED_APLL2, "apll2", 0x01A0, 0x01B0, 0, 0,
> +           31, 0x01A0, 1, 0x01B4, 0x01A4, 0),
> +};
> +
> +static int clk_mt8516_apmixed_probe(struct platform_device *pdev)
> +{
> +       void __iomem *base;
> +       struct clk_hw_onecell_data *clk_data;
> +       struct device_node *node = pdev->dev.of_node;
> +       struct device *dev = &pdev->dev;
> +       int ret;
> +
> +       base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(base))
> +               return PTR_ERR(base);
> +
> +       clk_data = mtk_devm_alloc_clk_data(dev, CLK_APMIXED_NR_CLK);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       ret = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
> +       if (ret)
> +               return ret;
> +
> +       ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> +       if (ret)
> +               goto unregister_plls;

Adding error handling deserves a separate commit, or at least a mention.

ChenYu

