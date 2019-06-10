From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v1] clk: mediatek: mt8183: Register 13MHz clock earlier
 for clocksource
Date: Mon, 10 Jun 2019 10:09:09 +0800
Message-ID: <1560132549.16837.1.camel@mtksdaap41>
References: <1559877112-21064-1-git-send-email-weiyi.lu@mediatek.com>
 <20190607175922.6D5F5208C0@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190607175922.6D5F5208C0@mail.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Dehui Sun <dehui.sun@mediatek.com>, Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com, James Liao <jamesjj.liao@mediatek.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2019-06-07 at 10:59 -0700, Stephen Boyd wrote:
> Quoting Weiyi Lu (2019-06-06 20:11:52)
> > diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
> > index 9d86510..a8f50bc 100644
> > --- a/drivers/clk/mediatek/clk-mt8183.c
> > +++ b/drivers/clk/mediatek/clk-mt8183.c
> > @@ -1167,37 +1169,62 @@ static int clk_mt8183_apmixed_probe(struct platform_device *pdev)
> >         return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> >  }
> >  
> > +static struct clk_onecell_data *top_clk_data;
> > +
> > +static void clk_mt8183_top_init_early(struct device_node *node)
> > +{
> > +       int i;
> > +
> > +       if (!top_clk_data) {
> 
> Is this function ever called more than once? I believe the answer is no
> so this check should be removed.
> 

Thanks for reminding. I'll fix in next version.

> > +               top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
> > +
> > +               for (i = 0; i < CLK_TOP_NR_CLK; i++)
> > +                       top_clk_data->clks[i] = ERR_PTR(-EPROBE_DEFER);
> > +       }
> > +
> > +       mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs),
> > +                       top_clk_data);
> > +
> > +       of_clk_add_provider(node, of_clk_src_onecell_get, top_clk_data);
> > +}
> > +
> > +CLK_OF_DECLARE_DRIVER(mt8183_topckgen, "mediatek,mt8183-topckgen",
> > +                       clk_mt8183_top_init_early);
> > +
> >  static int clk_mt8183_top_probe(struct platform_device *pdev)
> >  {
> >         struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >         void __iomem *base;
> > -       struct clk_onecell_data *clk_data;
> >         struct device_node *node = pdev->dev.of_node;
> >  
> >         base = devm_ioremap_resource(&pdev->dev, res);
> >         if (IS_ERR(base))
> >                 return PTR_ERR(base);
> >  
> > -       clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
> > +       if (!top_clk_data)
> > +               top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
> 
> And then this can be removed because top_clk_data must be allocated at
> this point.
> 

I'll fix in next version. Many thanks.

> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
