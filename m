From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 03/12] clk: mediatek: add configurable pcwibits and fmin to mtk_pll_data
Date: Fri, 14 Dec 2018 14:02:25 -0800
Message-ID: <154482494548.19322.11090762587126084086@swboyd.mtv.corp.google.com>
References: <20181210073240.32278-1-weiyi.lu@mediatek.com> <20181210073240.32278-5-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181210073240.32278-5-weiyi.lu@mediatek.com>
Sender: stable-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>, Owen Chen <owen.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Quoting Weiyi Lu (2018-12-09 23:32:31)
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pl=
l.c
> index f0ff5f535c7e..81400601f107 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -69,11 +71,13 @@ static unsigned long __mtk_pll_recalc_rate(struct mtk=
_clk_pll *pll, u32 fin,
>  {
>         int pcwbits =3D pll->data->pcwbits;
>         int pcwfbits;
> +       int ibits;
>         u64 vco;
>         u8 c =3D 0;
> =20
>         /* The fractional part of the PLL divider. */
> -       pcwfbits =3D pcwbits > INTEGER_BITS ? pcwbits - INTEGER_BITS : 0;
> +       ibits =3D pll->data->pcwibits ? pll->data->pcwibits : INTEGER_BIT=
S;
> +       pcwfbits =3D pcwbits > ibits ? pcwbits - ibits : 0;

This is practically unreadable. It should be changed to an if statement.

> =20
>         vco =3D (u64)fin * pcw;
> =20
> @@ -167,9 +171,10 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll=
 *pll, u32 pcw,
>  static void mtk_pll_calc_values(struct mtk_clk_pll *pll, u32 *pcw, u32 *=
postdiv,
>                 u32 freq, u32 fin)
>  {
> -       unsigned long fmin =3D 1000 * MHZ;
> +       unsigned long fmin =3D pll->data->fmin ? pll->data->fmin : (1000 =
* MHZ);
>         const struct mtk_pll_div_table *div_table =3D pll->data->div_tabl=
e;
>         u64 _pcw;
> +       int ibits;
>         u32 val;
> =20
>         if (freq > pll->data->fmax)
> @@ -193,7 +198,8 @@ static void mtk_pll_calc_values(struct mtk_clk_pll *p=
ll, u32 *pcw, u32 *postdiv,
>         }
> =20
>         /* _pcw =3D freq * postdiv / fin * 2^pcwfbits */
> -       _pcw =3D ((u64)freq << val) << (pll->data->pcwbits - INTEGER_BITS=
);
> +       ibits =3D pll->data->pcwibits ? pll->data->pcwibits : INTEGER_BIT=
S;
> +       _pcw =3D ((u64)freq << val) << (pll->data->pcwbits - ibits);

Similar comment. Readability is low here.
