From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v1 3/3] clk: mediatek: mt2712: add pll reference support
Date: Fri, 12 Oct 2018 10:53:23 -0700
Message-ID: <153936680359.5275.14901579706860255114@swboyd.mtv.corp.google.com>
References: <20180920095727.11868-1-weiyi.lu@mediatek.com>
 <20180920095727.11868-5-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180920095727.11868-5-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Weiyi Lu (2018-09-20 02:57:27)
> For some MT2712 projects, audpll could select another reference
> clock source if there exists an extra Crystal Oscillators than
> the default clk26m XTAL.
> Declare with the property "mediatek,refclk-aud" to switch
> the audpll reference clock.
> And also support to modify the reference clock of all PLL with
> property "mediatek,refclk" instead of the default source "clk26m".
> =

> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
> diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk=
-mt2712.c
> index e36f4aab634d..2a4db1718089 100644
> --- a/drivers/clk/mediatek/clk-mt2712.c
> +++ b/drivers/clk/mediatek/clk-mt2712.c
[...]
> +       size_t i;
> +       u32 r;
> +
> +       base =3D of_iomap(node, 0);
> +       if (base) {
> +               sel_addr =3D base + 0x40;
> +       } else {
> +               pr_err("%s(): ioremap failed\n", __func__);
> +               return;
> +       }

Nitpick: Write this as

	base =3D of_iomap();
	if (!base)
		return;
	sel_addr =3D base + 0x40;

> +
> +       rc =3D of_parse_phandle_with_args(node, "mediatek,refclk",
> +                       "#clock-cells", 0, &refclk);
> +       if (!rc) {
> +               of_property_read_string(refclk.np, "clock-output-names",
> +                               &refclk_name);
> +               for (i =3D 0; i < num_plls; i++)
> +                       plls[i].parent_name =3D refclk_name;

Use of_clk_parent_fill()?

> +       }
> +
> +       rc =3D of_parse_phandle_with_args(node, "mediatek,refclk-aud",
> +                       "#clock-cells", 0, &refclk_aud);

This is odd. Is this a custom 'clocks' property? What's going on here?
Why can't we use assigned clock parents for this?

> +       if (!rc) {
> +               of_property_read_string(refclk_aud.np, "clock-output-name=
s",
> +                               &refclk_aud_name);
> +               if (strcmp(refclk_name, refclk_aud_name)) {
> +                       plls[CLK_APMIXED_APLL1].parent_name =3D refclk_au=
d_name;
> +                       plls[CLK_APMIXED_APLL2].parent_name =3D refclk_au=
d_name;
> +                       r =3D readl(sel_addr) | 0x60000;
> +               } else {
> +                       r =3D readl(sel_addr) & ~0x60000;
> +               }
> +
> +               writel(r, sel_addr);
> +       }
> +}
> +
