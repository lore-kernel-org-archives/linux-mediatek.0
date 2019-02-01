From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v3 03/12] clk: mediatek: add configurable pcwibits and
 fmin to mtk_pll_data
Date: Fri, 1 Feb 2019 16:22:13 +0800
Message-ID: <1549009333.22634.2.camel@mtksdaap41>
References: <20181210073240.32278-1-weiyi.lu@mediatek.com>
         <20181210073240.32278-5-weiyi.lu@mediatek.com>
         <154482494548.19322.11090762587126084086@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154482494548.19322.11090762587126084086@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, stable@vger.kernel.org, Owen Chen <owen.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org


On Fri, 2018-12-14 at 14:02 -0800, Stephen Boyd wrote:
> Quoting Weiyi Lu (2018-12-09 23:32:31)
> > diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> > index f0ff5f535c7e..81400601f107 100644
> > --- a/drivers/clk/mediatek/clk-pll.c
> > +++ b/drivers/clk/mediatek/clk-pll.c
> > @@ -69,11 +71,13 @@ static unsigned long __mtk_pll_recalc_rate(struct mtk_clk_pll *pll, u32 fin,
> >  {
> >         int pcwbits = pll->data->pcwbits;
> >         int pcwfbits;
> > +       int ibits;
> >         u64 vco;
> >         u8 c = 0;
> >  
> >         /* The fractional part of the PLL divider. */
> > -       pcwfbits = pcwbits > INTEGER_BITS ? pcwbits - INTEGER_BITS : 0;
> > +       ibits = pll->data->pcwibits ? pll->data->pcwibits : INTEGER_BITS;
> > +       pcwfbits = pcwbits > ibits ? pcwbits - ibits : 0;
> 
> This is practically unreadable. It should be changed to an if statement.
> 

OK, will be fixed in next version.

> >  
> >         vco = (u64)fin * pcw;
> >  
> > @@ -167,9 +171,10 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
> >  static void mtk_pll_calc_values(struct mtk_clk_pll *pll, u32 *pcw, u32 *postdiv,
> >                 u32 freq, u32 fin)
> >  {
> > -       unsigned long fmin = 1000 * MHZ;
> > +       unsigned long fmin = pll->data->fmin ? pll->data->fmin : (1000 * MHZ);
> >         const struct mtk_pll_div_table *div_table = pll->data->div_table;
> >         u64 _pcw;
> > +       int ibits;
> >         u32 val;
> >  
> >         if (freq > pll->data->fmax)
> > @@ -193,7 +198,8 @@ static void mtk_pll_calc_values(struct mtk_clk_pll *pll, u32 *pcw, u32 *postdiv,
> >         }
> >  
> >         /* _pcw = freq * postdiv / fin * 2^pcwfbits */
> > -       _pcw = ((u64)freq << val) << (pll->data->pcwbits - INTEGER_BITS);
> > +       ibits = pll->data->pcwibits ? pll->data->pcwibits : INTEGER_BITS;
> > +       _pcw = ((u64)freq << val) << (pll->data->pcwbits - ibits);
> 
> Similar comment. Readability is low here.

I thought these two lines here are clean enough. Just simple conditional
assignment and shift operation. I'd like to not to change it.

> 
