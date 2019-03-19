From: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v5 06/14] soc: mediatek: Refactor clock control
Date: Tue, 19 Mar 2019 20:02:53 +0800
Message-ID: <CANMq1KCxhnn+fKaxS1RbpYYJ7pcXzD8XkqTBJHiauHbfrYVTGA@mail.gmail.com>
References: <20190319080140.24055-1-weiyi.lu@mediatek.com> <20190319080140.24055-7-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190319080140.24055-7-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, srv_heupstream <srv_heupstream@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Tue, Mar 19, 2019 at 4:02 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> Put clock enable and disable control in separate function.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-scpsys.c | 49 ++++++++++++++++++++-----------
>  1 file changed, 32 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index 765ad4a5e5df..3e9be07a2627 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -208,6 +208,33 @@ static int scpsys_regulator_disable(struct scp_domain *scpd)
>         return regulator_disable(scpd->supply);
>  }
>
> +static int scpsys_clk_enable(struct clk *clk[], int max_num)
> +{
> +       int i, ret = 0;
> +
> +       for (i = 0; i < max_num && clk[i]; i++) {
> +               ret = clk_prepare_enable(clk[i]);
> +               if (ret) {
> +                       for (--i; i >= 0; i--)
> +                               clk_disable_unprepare(clk[i]);

Would it be simpler to just call scpsys_clk_disable(clk, i) ?

> +
> +                       break;
> +               }
> +       }
> +
> +       return ret;
> +}

Maybe not for this series, but could you use clk_bulk_prepare_enable
instead? The only issue is that it'd still call clk_prepare_enable on
NULL clocks, but that does nothing, so it's just a little less
efficient...

> +
> +static void scpsys_clk_disable(struct clk *clk[], int max_num)
> +{
> +       int i;
> +
> +       for (i = max_num - 1; i >= 0; i--) {
> +               if (clk[i])

if test not needed, clk_disable_unprepare ignores NULL parameters.

> +                       clk_disable_unprepare(clk[i]);
> +       }
> +}

ditto: clk_bulk_disable_unprepare

> +
>  static int scpsys_power_on(struct generic_pm_domain *genpd)
>  {
>         struct scp_domain *scpd = container_of(genpd, struct scp_domain, genpd);
> @@ -216,21 +243,14 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>         u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
>         u32 val;
>         int ret, tmp;
> -       int i;
>
>         ret = scpsys_regulator_enable(scpd);
>         if (ret < 0)
>                 return ret;
>
> -       for (i = 0; i < MAX_CLKS && scpd->clk[i]; i++) {
> -               ret = clk_prepare_enable(scpd->clk[i]);
> -               if (ret) {
> -                       for (--i; i >= 0; i--)
> -                               clk_disable_unprepare(scpd->clk[i]);
> -
> -                       goto err_clk;
> -               }
> -       }
> +       ret = scpsys_clk_enable(scpd->clk, MAX_CLKS);
> +       if (ret)
> +               goto err_clk;
>
>         val = readl(ctl_addr);
>         val |= PWR_ON_BIT;
> @@ -283,10 +303,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>         return 0;
>
>  err_pwr_ack:
> -       for (i = MAX_CLKS - 1; i >= 0; i--) {
> -               if (scpd->clk[i])
> -                       clk_disable_unprepare(scpd->clk[i]);
> -       }
> +       scpsys_clk_disable(scpd->clk, MAX_CLKS);
>  err_clk:
>         scpsys_regulator_disable(scpd);
>
> @@ -303,7 +320,6 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>         u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
>         u32 val;
>         int ret, tmp;
> -       int i;
>
>         if (scpd->data->bus_prot_mask) {
>                 ret = mtk_infracfg_set_bus_protection(scp->infracfg,
> @@ -344,8 +360,7 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>         if (ret < 0)
>                 goto out;
>
> -       for (i = 0; i < MAX_CLKS && scpd->clk[i]; i++)
> -               clk_disable_unprepare(scpd->clk[i]);
> +       scpsys_clk_disable(scpd->clk, MAX_CLKS);
>
>         ret = scpsys_regulator_disable(scpd);
>         if (ret < 0)
> --
> 2.18.0
>
