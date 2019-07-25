From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4,2/2] clk: reset: Modify reset-controller driver
Date: Thu, 25 Jul 2019 14:11:04 -0700
Message-ID: <20190725211105.0FD50218EA@mail.kernel.org>
References: <20190725082002.17400-1-yong.liang@mediatek.com>
 <20190725082002.17400-2-yong.liang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190725082002.17400-2-yong.liang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: chunhui.dai@mediatek.com, drinkcat@chromium.org, eddie.huang@mediatek.com, erin.lo@mediatek.com, jamesjj.liao@mediatek.com, jasu@njomotys.info, mark.rutland@arm.com, matthias.bgg@gmail.com, mturquette@baylibre.com, owen.chen@mediatek.com, robh+dt@kernel.org, weiyi.lu@mediatek.com
Cc: "yong.liang" <yong.liang@mediatek.com>, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Quoting Yong Liang (2019-07-25 01:20:02)
> From: "yong.liang" <yong.liang@mediatek.com>
> 
> Set reset signal by a register and clear reset signal by
> another register for 8183.
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> ---
> 
> Base on https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git branch clk-next and https://patchwork.kernel.org/patch/10856987/

Use --base= in git format-patch instead.

> diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
> index 9d8651033ae9..f695eb7eb5a1 100644
> --- a/drivers/clk/mediatek/clk-mt8183.c
> +++ b/drivers/clk/mediatek/clk-mt8183.c
> @@ -1204,13 +1204,24 @@ static int clk_mt8183_infra_probe(struct platform_device *pdev)
>  {
>         struct clk_onecell_data *clk_data;
>         struct device_node *node = pdev->dev.of_node;
> +       int r;
>  
>         clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
>  
>         mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks),
>                 clk_data);
>  
> -       return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +       r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +       if (r) {
> +               dev_err(&pdev->dev,
> +                       "%s(): could not register clock provider: %d\n"
> +                       ,__func__, r);
> +               return r;
> +       }
> +
> +       mtk_register_reset_controller_set_clr(node, 4, 0x120);

What is this line doing? Maybe add a comment so we understand what 0x120
is.

> +
> +       return r;
>  }
>  
>  static int clk_mt8183_mcu_probe(struct platform_device *pdev)
> diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
> index d3551d5efef2..fccc8fcb6a20 100644
> --- a/drivers/clk/mediatek/reset.c
> +++ b/drivers/clk/mediatek/reset.c
> @@ -95,3 +131,18 @@ void mtk_register_reset_controller(struct device_node *np,
>                 return;
>         }
>  }
> +
> +void mtk_register_reset_controller(struct device_node *np,
> +       unsigned int num_regs, int regofs)
> +{
> +       mtk_register_reset_controller_common(np, num_regs, regofs,
> +               &mtk_reset_ops);
> +}
> +
> +void mtk_register_reset_controller_set_clr(struct device_node *np,
> +       unsigned int num_regs, int regofs)
> +{
> +       mtk_register_reset_controller_common(np, num_regs, regofs,
> +               &mtk_reset_ops_set_clr);
> +}
> +

If this is an extra newline at the end of the file, please remove it.

> diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/include/dt-bindings/reset-controller/mt8183-resets.h
> new file mode 100644
> index 000000000000..81136c932f75
> --- /dev/null
> +++ b/include/dt-bindings/reset-controller/mt8183-resets.h
> @@ -0,0 +1,88 @@
> +/*
> + * Copyright (c) 2017 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> + * See  http://www.gnu.org/licenses/gpl-2.0.html for more details.

Please use SPDX tags instead of this boilerplate.
