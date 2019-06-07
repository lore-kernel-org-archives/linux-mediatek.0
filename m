From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1] clk: mediatek: mt8183: Register 13MHz clock earlier for clocksource
Date: Fri, 07 Jun 2019 10:59:21 -0700
Message-ID: <20190607175922.6D5F5208C0@mail.kernel.org>
References: <1559877112-21064-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1559877112-21064-1-git-send-email-weiyi.lu@mediatek.com>
Sender: stable-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, Dehui Sun <dehui.sun@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Weiyi Lu (2019-06-06 20:11:52)
> diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk=
-mt8183.c
> index 9d86510..a8f50bc 100644
> --- a/drivers/clk/mediatek/clk-mt8183.c
> +++ b/drivers/clk/mediatek/clk-mt8183.c
> @@ -1167,37 +1169,62 @@ static int clk_mt8183_apmixed_probe(struct platfo=
rm_device *pdev)
>         return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data=
);
>  }
> =20
> +static struct clk_onecell_data *top_clk_data;
> +
> +static void clk_mt8183_top_init_early(struct device_node *node)
> +{
> +       int i;
> +
> +       if (!top_clk_data) {

Is this function ever called more than once? I believe the answer is no
so this check should be removed.

> +               top_clk_data =3D mtk_alloc_clk_data(CLK_TOP_NR_CLK);
> +
> +               for (i =3D 0; i < CLK_TOP_NR_CLK; i++)
> +                       top_clk_data->clks[i] =3D ERR_PTR(-EPROBE_DEFER);
> +       }
> +
> +       mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_div=
s),
> +                       top_clk_data);
> +
> +       of_clk_add_provider(node, of_clk_src_onecell_get, top_clk_data);
> +}
> +
> +CLK_OF_DECLARE_DRIVER(mt8183_topckgen, "mediatek,mt8183-topckgen",
> +                       clk_mt8183_top_init_early);
> +
>  static int clk_mt8183_top_probe(struct platform_device *pdev)
>  {
>         struct resource *res =3D platform_get_resource(pdev, IORESOURCE_M=
EM, 0);
>         void __iomem *base;
> -       struct clk_onecell_data *clk_data;
>         struct device_node *node =3D pdev->dev.of_node;
> =20
>         base =3D devm_ioremap_resource(&pdev->dev, res);
>         if (IS_ERR(base))
>                 return PTR_ERR(base);
> =20
> -       clk_data =3D mtk_alloc_clk_data(CLK_TOP_NR_CLK);
> +       if (!top_clk_data)
> +               top_clk_data =3D mtk_alloc_clk_data(CLK_TOP_NR_CLK);

And then this can be removed because top_clk_data must be allocated at
this point.
