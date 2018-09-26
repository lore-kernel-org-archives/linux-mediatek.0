From: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 3/4] PCI: mediatek: Add system pm support for MT2712
 and MT7622
Date: Wed, 26 Sep 2018 17:14:04 +0800
Message-ID: <1537953244.14753.12.camel@mhfsdcap03>
References: <1530518264-6125-1-git-send-email-honghui.zhang@mediatek.com>
 <1530518264-6125-4-git-send-email-honghui.zhang@mediatek.com>
 <CAPDyKFpFpR_NhtNW6rChMFw4KLweut8zC3x2V1ZBbdrV05iuTQ@mail.gmail.com>
 <20180921171033.GB27651@e107981-ln.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180921171033.GB27651-4tUPXFaYRHv6sAKXYmQ0tx/iLCjYCKR+VpNB7YpNyf8@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Linux PCI <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2018-09-21 at 18:10 +0100, Lorenzo Pieralisi wrote:
> On Fri, Sep 07, 2018 at 02:33:09PM +0200, Ulf Hansson wrote:
> 
> [...]
> 
> > > +static int __maybe_unused mtk_pcie_suspend_noirq(struct device *dev)
> > 
> > I am not sure I understand why you need to suspend the device in the
> > "noirq" phase. Isn't it fine to do that in the regular suspend phase?
> > 
> > > +{
> > > +       struct mtk_pcie *pcie = dev_get_drvdata(dev);
> > > +       const struct mtk_pcie_soc *soc = pcie->soc;
> > > +       struct mtk_pcie_port *port;
> > > +
> > > +       if (!soc->pm_support)
> > > +               return 0;
> 
> I have an additional comment on this. Isn't there a nicer and more
> generic way to detect whether the soc supports pm rather than using
> this utterly ugly pm_support static variable ?
> 
> Can't we sort out at core level (ie by not "registering" dev_pm_ops) ?
> 
> How is this situation handled in other drivers ?
> 

Hmm, yes, this pm_support is removable, I guess we add the system
suspend callbacks for MT7622 is fine, if MT7622 is not supported system
suspend, I guess these callbacks will never have a change to be
executed. Adding these callbacks will have no harm for MT7622.

Anyway, I will check other host driver, and try another approach to
distinguish those SoCs for system suspend callbacks.

Thanks very much for your comments.

> Thanks,
> Lorenzo
> 
> > > +       if (list_empty(&pcie->ports))
> > > +               return 0;
> > > +
> > > +       list_for_each_entry(port, &pcie->ports, list) {
> > > +               clk_disable_unprepare(port->pipe_ck);
> > > +               clk_disable_unprepare(port->obff_ck);
> > > +               clk_disable_unprepare(port->axi_ck);
> > > +               clk_disable_unprepare(port->aux_ck);
> > > +               clk_disable_unprepare(port->ahb_ck);
> > > +               clk_disable_unprepare(port->sys_ck);
> > > +               phy_power_off(port->phy);
> > > +               phy_exit(port->phy);
> > > +       }
> > > +
> > > +       mtk_pcie_subsys_powerdown(pcie);
> > 
> > Why not gate clocks, unconditionally not depending on if pm_support is
> > set or not, during system suspend?
> > 
> > I understand that you for some SoCs needs also to restore registers
> > during system resume, but that's a different thing, isn't it?
> > 
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int __maybe_unused mtk_pcie_resume_noirq(struct device *dev)
> > > +{
> > > +       struct mtk_pcie *pcie = dev_get_drvdata(dev);
> > > +       const struct mtk_pcie_soc *soc = pcie->soc;
> > > +       struct mtk_pcie_port *port, *tmp;
> > > +
> > > +       if (!soc->pm_support)
> > > +               return 0;
> > > +
> > > +       if (list_empty(&pcie->ports))
> > > +               return 0;
> > > +
> > > +       if (dev->pm_domain) {
> > > +               pm_runtime_enable(dev);
> > > +               pm_runtime_get_sync(dev);
> > 
> > I noticed, Lorenzo wanted me to comment on this, so here it goes.
> > 
> > I guess the reason to why you make these pm_runtime_*() calls, is
> > because you want to restore the actions taken during
> > mtk_pcie_suspend_noirq() (which calls mtk_pcie_subsys_powerdown ->
> > pm_runtime_disable|put*())?
> > 
> > If that's the case, I would rather avoid calling pm_runtime_disable()
> > and pm_runtime_put() via mtk_pcie_suspend_noirq(), simply because it
> > isn't needed.
> > 
> > Of course, another option is to follow the pattern in
> > drivers/mmc/host/sdhci-xenon.c.
> > 
> > Overall, I am also wondering why only runtime PM is used when there is
> > a PM domain attached to the device? That seems to make the logic in
> > the driver, unnecessary complicated. Why not use runtime
> > unconditionally and thus enable it during ->probe()?
> > 
> > > +       }
> > > +
> > > +       clk_prepare_enable(pcie->free_ck);
> > > +
> > > +       list_for_each_entry_safe(port, tmp, &pcie->ports, list)
> > > +               mtk_pcie_enable_port(port);
> > > +
> > > +       /* In case of EP was removed while system suspend. */
> > > +       if (list_empty(&pcie->ports))
> > > +               mtk_pcie_subsys_powerdown(pcie);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static const struct dev_pm_ops mtk_pcie_pm_ops = {
> > > +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_pcie_suspend_noirq,
> > > +                                     mtk_pcie_resume_noirq)
> > > +};
> > > +
> > >  static const struct mtk_pcie_soc mtk_pcie_soc_v1 = {
> > >         .ops = &mtk_pcie_ops,
> > >         .startup = mtk_pcie_startup_port,
> > >  };
> > >
> > >  static const struct mtk_pcie_soc mtk_pcie_soc_mt2712 = {
> > > +       .pm_support = true,
> > >         .ops = &mtk_pcie_ops_v2,
> > >         .startup = mtk_pcie_startup_port_v2,
> > >         .setup_irq = mtk_pcie_setup_irq,
> > > @@ -1210,6 +1275,7 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt2712 = {
> > >
> > >  static const struct mtk_pcie_soc mtk_pcie_soc_mt7622 = {
> > >         .need_fix_class_id = true,
> > > +       .pm_support = true,
> > >         .ops = &mtk_pcie_ops_v2,
> > >         .startup = mtk_pcie_startup_port_v2,
> > >         .setup_irq = mtk_pcie_setup_irq,
> > > @@ -1229,6 +1295,7 @@ static struct platform_driver mtk_pcie_driver = {
> > >                 .name = "mtk-pcie",
> > >                 .of_match_table = mtk_pcie_ids,
> > >                 .suppress_bind_attrs = true,
> > > +               .pm = &mtk_pcie_pm_ops,
> > >         },
> > >  };
> > >  builtin_platform_driver(mtk_pcie_driver);
> > > --
> > > 2.6.4
> > >
> > 
> > Kind regards
> > Uffe
