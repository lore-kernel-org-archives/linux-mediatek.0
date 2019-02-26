From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 08/12] clk: mediatek: Add MT8183 clock support
Date: Tue, 26 Feb 2019 09:50:58 -0800
Message-ID: <155120345816.260864.13433355004684800350@swboyd.mtv.corp.google.com>
References: <20190201083016.25856-1-weiyi.lu@mediatek.com> <20190201083016.25856-10-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201083016.25856-10-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Weiyi Lu (2019-02-01 00:30:12)
> diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk=
-mt8183.c
> new file mode 100644
> index 000000000000..e9de9fe774ca
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8183.c
> @@ -0,0 +1,1285 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2018 MediaTek Inc.
> +// Author: Weiyi Lu <weiyi.lu@mediatek.com>
> +
> +#include <linux/delay.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
[....]
> +
> +static int clk_mt8183_top_probe(struct platform_device *pdev)
> +{
> +       struct resource *res =3D platform_get_resource(pdev, IORESOURCE_M=
EM, 0);
> +       void __iomem *base;
> +       struct clk_onecell_data *clk_data;
> +       struct device_node *node =3D pdev->dev.of_node;
> +
> +       base =3D devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(base)) {
> +               pr_err("%s(): ioremap failed\n", __func__);

This API already prints an error so please remove this duplicate error
message

> +               return PTR_ERR(base);
> +       }
> +
> +       clk_data =3D mtk_alloc_clk_data(CLK_TOP_NR_CLK);
> +
> +       mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_=
clks),
> +               clk_data);
> +
> +       mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data=
);
> +
> +       mtk_clk_register_muxes(top_muxes, ARRAY_SIZE(top_muxes),
> +               node, &mt8183_clk_lock, clk_data);
> +
> +       mtk_clk_register_composites(top_aud_muxes, ARRAY_SIZE(top_aud_mux=
es),
> +               base, &mt8183_clk_lock, clk_data);
> +
> +       mtk_clk_register_composites(top_aud_divs, ARRAY_SIZE(top_aud_divs=
),
> +               base, &mt8183_clk_lock, clk_data);
> +
> +       mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks),
> +               clk_data);
> +
> +       return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data=
);
> +}
> +
> +static int clk_mt8183_infra_probe(struct platform_device *pdev)
> +{
> +       struct clk_onecell_data *clk_data;
> +       struct device_node *node =3D pdev->dev.of_node;
> +
> +       clk_data =3D mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
> +
> +       mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks),
> +               clk_data);
> +
> +       return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data=
);
> +}
> +
> +static int clk_mt8183_mcu_probe(struct platform_device *pdev)
> +{
> +       struct clk_onecell_data *clk_data;
> +       struct device_node *node =3D pdev->dev.of_node;
> +       void __iomem *base;
> +       struct resource *res =3D platform_get_resource(pdev, IORESOURCE_M=
EM, 0);
> +
> +       base =3D devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(base)) {
> +               pr_err("%s(): ioremap failed\n", __func__);
> +               return PTR_ERR(base);
> +       }
> +
> +       clk_data =3D mtk_alloc_clk_data(CLK_MCU_NR_CLK);

Can this fail? It doesn't seem to be checked for failure so I guess we
don't care?

> +
> +       mtk_clk_register_composites(mcu_muxes, ARRAY_SIZE(mcu_muxes), bas=
e,
> +                       &mt8183_clk_lock, clk_data);
> +
> +       return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data=
);
> +}
> +
