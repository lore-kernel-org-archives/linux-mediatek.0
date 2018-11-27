From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v2 03/11] clk: mediatek: Disable tuner_en before change
 PLL rate
Date: Tue, 27 Nov 2018 12:36:58 -0800
Message-ID: <CAGp9Lzro5YHCYqzOWFJJa4g75odf6yK52cean_aS3p2STOtJYg@mail.gmail.com>
References: <20181127034254.24721-1-weiyi.lu@mediatek.com> <20181127034254.24721-5-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181127034254.24721-5-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: weiyi.lu@mediatek.com
Cc: drinkcat@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>, sboyd@codeaurora.org, robh@kernel.org, jamesjj.liao@mediatek.com, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, fan.chen@mediatek.com, linux-mediatek@lists.infradead.org, owen.chen@mediatek.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Weiyi Lu <weiyi.lu@mediatek.com> =E6=96=BC 2018=E5=B9=B411=E6=9C=8826=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:45=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Owen Chen <owen.chen@mediatek.com>
>
> PLLs with tuner_en bit, such as APLL1, need to disable
> tuner_en before apply new frequency settings, or the new frequency
> settings (pcw) will not be applied.
> The tuner_en bit will be disabled during changing PLL rate
> and be restored after new settings applied.

It looks like a bug fix. If so, you should add a fixes tag and even cc
stable tree

>
> Signed-off-by: Owen Chen <owen.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-pll.c | 33 +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pl=
l.c
> index 1db161aced31..81400601f107 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -27,7 +27,7 @@
>  #define CON0_BASE_EN           BIT(0)
>  #define CON0_PWR_ON            BIT(0)
>  #define CON0_ISO_EN            BIT(1)
> -#define CON0_PCW_CHG           BIT(31)
> +#define CON1_PCW_CHG           BIT(31)

it seems like an unnecessary change

>
>  #define AUDPLL_TUNER_EN                BIT(31)
>
> @@ -97,9 +97,31 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *=
pll, u32 pcw,
>  {
>         u32 con1, val;
>         int pll_en;
> +       u32 tuner_en =3D 0;
> +       u32 tuner_en_mask;
> +       void __iomem *tuner_en_addr =3D NULL;
>
>         pll_en =3D readl(pll->base_addr + REG_CON0) & CON0_BASE_EN;
>
> +       /* disable tuner */

similar code pieces are ready on mtk_pll_[un]prepare. maybe we can add
common tuner operations for them to reuse.

> +       if (pll->tuner_en_addr) {
> +               tuner_en_addr =3D pll->tuner_en_addr;
> +               tuner_en_mask =3D BIT(pll->data->tuner_en_bit);
> +       } else if (pll->tuner_addr) {
> +               tuner_en_addr =3D pll->tuner_addr;
> +               tuner_en_mask =3D AUDPLL_TUNER_EN;
> +       }
> +
> +       if (tuner_en_addr) {
> +               val =3D readl(tuner_en_addr);
> +               tuner_en =3D val & tuner_en_mask;
> +
> +               if (tuner_en) {
> +                       val &=3D ~tuner_en_mask;
> +                       writel(val, tuner_en_addr);
> +               }
> +       }
> +
>         /* set postdiv */
>         val =3D readl(pll->pd_addr);
>         val &=3D ~(POSTDIV_MASK << pll->data->pd_shift);
> @@ -120,12 +142,19 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pl=
l *pll, u32 pcw,
>         con1 =3D readl(pll->base_addr + REG_CON1);
>
>         if (pll_en)
> -               con1 |=3D CON0_PCW_CHG;
> +               con1 |=3D CON1_PCW_CHG;
>
>         writel(con1, pll->base_addr + REG_CON1);
>         if (pll->tuner_addr)
>                 writel(con1 + 1, pll->tuner_addr);
>
> +       /* restore tuner_en */
> +       if (tuner_en_addr && tuner_en) {

if (tuner_en) is sufficient

> +               val =3D readl(tuner_en_addr);
> +               val |=3D tuner_en_mask;
> +               writel(val, tuner_en_addr);
> +       }
> +
>         if (pll_en)
>                 udelay(20);
>  }
> --
> 2.18.0
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
