From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v5 08/14] soc: mediatek: Refactor bus protection control
Date: Wed, 19 Jun 2019 17:31:21 +0800
Message-ID: <1560936681.2158.16.camel@mtksdaap41>
References: <20190319080140.24055-1-weiyi.lu@mediatek.com>
         <20190319080140.24055-9-weiyi.lu@mediatek.com>
         <CANMq1KDkzWk-CSib7NBtc-2zqmoW31vFrO5sOj1up-vFvnmhjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANMq1KDkzWk-CSib7NBtc-2zqmoW31vFrO5sOj1up-vFvnmhjQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: Rob Herring <robh@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>, lkml <linux-kernel@vger.kernel.org>, Fan Chen <fan.chen@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-03-19 at 20:09 +0800, Nicolas Boichat wrote:
> On Tue, Mar 19, 2019 at 4:02 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> >
> > Put bus protection enable and disable control in separate functions.
> >
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-scpsys.c | 48 ++++++++++++++++++++++---------
> >  1 file changed, 34 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> > index 65b734b40098..6bf846cb1893 100644
> > --- a/drivers/soc/mediatek/mtk-scpsys.c
> > +++ b/drivers/soc/mediatek/mtk-scpsys.c
> > @@ -279,6 +279,34 @@ static int scpsys_sram_disable(struct scp_domain *scpd, void __iomem *ctl_addr)
> >                         MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> >  }
> >
> > +static int scpsys_bus_protect_enable(struct scp_domain *scpd)
> > +{
> > +       struct scp *scp = scpd->scp;
> > +       int ret = 0;
> > +
> > +       if (scpd->data->bus_prot_mask) {
> > +               ret = mtk_infracfg_set_bus_protection(scp->infracfg,
> > +                               scpd->data->bus_prot_mask,
> > +                               scp->bus_prot_reg_update);
> > +       }
> > +
> > +       return ret;
> 
> Maybe other people have different opinions, but I prefer:
> 
> if (!scpd->data->bus_prot_mask)
>     return 0;
> 
> return mtk_infracfg_set_bus_protection(...);
> 

ok, I'll update in next version.

> > +}
> > +
> > +static int scpsys_bus_protect_disable(struct scp_domain *scpd)
> > +{
> > +       struct scp *scp = scpd->scp;
> > +       int ret = 0;
> > +
> > +       if (scpd->data->bus_prot_mask) {
> > +               ret = mtk_infracfg_clear_bus_protection(scp->infracfg,
> > +                               scpd->data->bus_prot_mask,
> > +                               scp->bus_prot_reg_update);
> > +       }
> > +
> > +       return ret;
> > +}
> > +
> >  static int scpsys_power_on(struct generic_pm_domain *genpd)
> >  {
> >         struct scp_domain *scpd = container_of(genpd, struct scp_domain, genpd);
> > @@ -321,13 +349,9 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
> >         if (ret < 0)
> >                 goto err_pwr_ack;
> >
> > -       if (scpd->data->bus_prot_mask) {
> > -               ret = mtk_infracfg_clear_bus_protection(scp->infracfg,
> > -                               scpd->data->bus_prot_mask,
> > -                               scp->bus_prot_reg_update);
> > -               if (ret)
> > -                       goto err_pwr_ack;
> > -       }
> > +       ret = scpsys_bus_protect_disable(scpd);
> > +       if (ret < 0)
> > +               goto err_pwr_ack;
> >
> >         return 0;
> >
> > @@ -349,13 +373,9 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
> >         u32 val;
> >         int ret, tmp;
> >
> > -       if (scpd->data->bus_prot_mask) {
> > -               ret = mtk_infracfg_set_bus_protection(scp->infracfg,
> > -                               scpd->data->bus_prot_mask,
> > -                               scp->bus_prot_reg_update);
> > -               if (ret)
> > -                       goto out;
> > -       }
> > +       ret = scpsys_bus_protect_enable(scpd);
> > +       if (ret < 0)
> > +               goto out;
> >
> >         ret = scpsys_sram_disable(scpd, ctl_addr);
> >         if (ret < 0)
> > --
> > 2.18.0
> >
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
