From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v4 08/12] clk: mediatek: Add MT8183 clock support
Date: Wed, 27 Feb 2019 10:51:37 +0800
Message-ID: <1551235897.1047.11.camel@mtksdaap41>
References: <20190201083016.25856-1-weiyi.lu@mediatek.com>
         <20190201083016.25856-10-weiyi.lu@mediatek.com>
         <155120345816.260864.13433355004684800350@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <155120345816.260864.13433355004684800350@swboyd.mtv.corp.google.com>
Sender: stable-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, James Liao <jamesjj.liao@mediatek.com>, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-02-26 at 09:50 -0800, Stephen Boyd wrote:
> Quoting Weiyi Lu (2019-02-01 00:30:12)
> > diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
> > new file mode 100644
> > index 000000000000..e9de9fe774ca
> > --- /dev/null
> > +++ b/drivers/clk/mediatek/clk-mt8183.c
> > @@ -0,0 +1,1285 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// Copyright (c) 2018 MediaTek Inc.
> > +// Author: Weiyi Lu <weiyi.lu@mediatek.com>
> > +
> > +#include <linux/delay.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +
> [....]
> > +
> > +static int clk_mt8183_top_probe(struct platform_device *pdev)
> > +{
> > +       struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       void __iomem *base;
> > +       struct clk_onecell_data *clk_data;
> > +       struct device_node *node = pdev->dev.of_node;
> > +
> > +       base = devm_ioremap_resource(&pdev->dev, res);
> > +       if (IS_ERR(base)) {
> > +               pr_err("%s(): ioremap failed\n", __func__);
> 
> This API already prints an error so please remove this duplicate error
> message
> 

ok, I'll remove those duplicate error message in next version.

> > +               return PTR_ERR(base);
> > +       }
> > +
> > +       clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
> > +
> > +       mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
> > +               clk_data);
> > +
> > +       mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
> > +
> > +       mtk_clk_register_muxes(top_muxes, ARRAY_SIZE(top_muxes),
> > +               node, &mt8183_clk_lock, clk_data);
> > +
> > +       mtk_clk_register_composites(top_aud_muxes, ARRAY_SIZE(top_aud_muxes),
> > +               base, &mt8183_clk_lock, clk_data);
> > +
> > +       mtk_clk_register_composites(top_aud_divs, ARRAY_SIZE(top_aud_divs),
> > +               base, &mt8183_clk_lock, clk_data);
> > +
> > +       mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks),
> > +               clk_data);
> > +
> > +       return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> > +}
> > +
> > +static int clk_mt8183_infra_probe(struct platform_device *pdev)
> > +{
> > +       struct clk_onecell_data *clk_data;
> > +       struct device_node *node = pdev->dev.of_node;
> > +
> > +       clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
> > +
> > +       mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks),
> > +               clk_data);
> > +
> > +       return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> > +}
> > +
> > +static int clk_mt8183_mcu_probe(struct platform_device *pdev)
> > +{
> > +       struct clk_onecell_data *clk_data;
> > +       struct device_node *node = pdev->dev.of_node;
> > +       void __iomem *base;
> > +       struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +
> > +       base = devm_ioremap_resource(&pdev->dev, res);
> > +       if (IS_ERR(base)) {
> > +               pr_err("%s(): ioremap failed\n", __func__);
> > +               return PTR_ERR(base);
> > +       }
> > +
> > +       clk_data = mtk_alloc_clk_data(CLK_MCU_NR_CLK);
> 
> Can this fail? It doesn't seem to be checked for failure so I guess we
> don't care?
> 

It might fail but we have data validity checks in all the
mtk_clk_register APIs.

> > +
> > +       mtk_clk_register_composites(mcu_muxes, ARRAY_SIZE(mcu_muxes), base,
> > +                       &mt8183_clk_lock, clk_data);
> > +
> > +       return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> > +}
> > +
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
