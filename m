From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/4] PCI: mediatek: Add system pm support for MT2712
 and MT7622
Date: Fri, 7 Sep 2018 14:33:09 +0200
Message-ID: <CAPDyKFpFpR_NhtNW6rChMFw4KLweut8zC3x2V1ZBbdrV05iuTQ@mail.gmail.com>
References: <1530518264-6125-1-git-send-email-honghui.zhang@mediatek.com>
 <1530518264-6125-4-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1530518264-6125-4-git-send-email-honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: Linux PCI <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

-trimmed cc-list

On 2 July 2018 at 09:57,  <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> From: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> The MTCMOS of PCIe Host for MT2712 and MT7622 will be off when system
> suspend, and all the internal control register will be reset after system
> resume. The PCIe link should be re-established and the related control
> register values should be re-set after system resume.

Sounds very familiar as what is implemented in
drivers/mmc/host/sdhci-xenon.c. Please have a look, possibly you can
get inspired to use the similar pattern.

A few comments below. However, please note, I am not an expert in PCIe
so I may overlook some obvious things. I am relying on Lorenzo or some
other PCIe expert, to fill in.

>
> Signed-off-by: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Acked-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 67 ++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 86918d4..175d7b6 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -134,12 +134,14 @@ struct mtk_pcie_port;
>  /**
>   * struct mtk_pcie_soc - differentiate between host generations
>   * @need_fix_class_id: whether this host's class ID needed to be fixed or not
> + * @pm_support: whether the host's MTCMOS will be off when suspend
>   * @ops: pointer to configuration access functions
>   * @startup: pointer to controller setting functions
>   * @setup_irq: pointer to initialize IRQ functions
>   */
>  struct mtk_pcie_soc {
>         bool need_fix_class_id;
> +       bool pm_support;
>         struct pci_ops *ops;
>         int (*startup)(struct mtk_pcie_port *port);
>         int (*setup_irq)(struct mtk_pcie_port *port, struct device_node *node);
> @@ -1197,12 +1199,75 @@ static int mtk_pcie_probe(struct platform_device *pdev)
>         return err;
>  }
>
> +static int __maybe_unused mtk_pcie_suspend_noirq(struct device *dev)

I am not sure I understand why you need to suspend the device in the
"noirq" phase. Isn't it fine to do that in the regular suspend phase?

> +{
> +       struct mtk_pcie *pcie = dev_get_drvdata(dev);
> +       const struct mtk_pcie_soc *soc = pcie->soc;
> +       struct mtk_pcie_port *port;
> +
> +       if (!soc->pm_support)
> +               return 0;
> +
> +       if (list_empty(&pcie->ports))
> +               return 0;
> +
> +       list_for_each_entry(port, &pcie->ports, list) {
> +               clk_disable_unprepare(port->pipe_ck);
> +               clk_disable_unprepare(port->obff_ck);
> +               clk_disable_unprepare(port->axi_ck);
> +               clk_disable_unprepare(port->aux_ck);
> +               clk_disable_unprepare(port->ahb_ck);
> +               clk_disable_unprepare(port->sys_ck);
> +               phy_power_off(port->phy);
> +               phy_exit(port->phy);
> +       }
> +
> +       mtk_pcie_subsys_powerdown(pcie);

Why not gate clocks, unconditionally not depending on if pm_support is
set or not, during system suspend?

I understand that you for some SoCs needs also to restore registers
during system resume, but that's a different thing, isn't it?

> +
> +       return 0;
> +}
> +
> +static int __maybe_unused mtk_pcie_resume_noirq(struct device *dev)
> +{
> +       struct mtk_pcie *pcie = dev_get_drvdata(dev);
> +       const struct mtk_pcie_soc *soc = pcie->soc;
> +       struct mtk_pcie_port *port, *tmp;
> +
> +       if (!soc->pm_support)
> +               return 0;
> +
> +       if (list_empty(&pcie->ports))
> +               return 0;
> +
> +       if (dev->pm_domain) {
> +               pm_runtime_enable(dev);
> +               pm_runtime_get_sync(dev);

I noticed, Lorenzo wanted me to comment on this, so here it goes.

I guess the reason to why you make these pm_runtime_*() calls, is
because you want to restore the actions taken during
mtk_pcie_suspend_noirq() (which calls mtk_pcie_subsys_powerdown ->
pm_runtime_disable|put*())?

If that's the case, I would rather avoid calling pm_runtime_disable()
and pm_runtime_put() via mtk_pcie_suspend_noirq(), simply because it
isn't needed.

Of course, another option is to follow the pattern in
drivers/mmc/host/sdhci-xenon.c.

Overall, I am also wondering why only runtime PM is used when there is
a PM domain attached to the device? That seems to make the logic in
the driver, unnecessary complicated. Why not use runtime
unconditionally and thus enable it during ->probe()?

> +       }
> +
> +       clk_prepare_enable(pcie->free_ck);
> +
> +       list_for_each_entry_safe(port, tmp, &pcie->ports, list)
> +               mtk_pcie_enable_port(port);
> +
> +       /* In case of EP was removed while system suspend. */
> +       if (list_empty(&pcie->ports))
> +               mtk_pcie_subsys_powerdown(pcie);
> +
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops mtk_pcie_pm_ops = {
> +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_pcie_suspend_noirq,
> +                                     mtk_pcie_resume_noirq)
> +};
> +
>  static const struct mtk_pcie_soc mtk_pcie_soc_v1 = {
>         .ops = &mtk_pcie_ops,
>         .startup = mtk_pcie_startup_port,
>  };
>
>  static const struct mtk_pcie_soc mtk_pcie_soc_mt2712 = {
> +       .pm_support = true,
>         .ops = &mtk_pcie_ops_v2,
>         .startup = mtk_pcie_startup_port_v2,
>         .setup_irq = mtk_pcie_setup_irq,
> @@ -1210,6 +1275,7 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt2712 = {
>
>  static const struct mtk_pcie_soc mtk_pcie_soc_mt7622 = {
>         .need_fix_class_id = true,
> +       .pm_support = true,
>         .ops = &mtk_pcie_ops_v2,
>         .startup = mtk_pcie_startup_port_v2,
>         .setup_irq = mtk_pcie_setup_irq,
> @@ -1229,6 +1295,7 @@ static struct platform_driver mtk_pcie_driver = {
>                 .name = "mtk-pcie",
>                 .of_match_table = mtk_pcie_ids,
>                 .suppress_bind_attrs = true,
> +               .pm = &mtk_pcie_pm_ops,
>         },
>  };
>  builtin_platform_driver(mtk_pcie_driver);
> --
> 2.6.4
>

Kind regards
Uffe
