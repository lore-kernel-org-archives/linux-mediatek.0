From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Update cur_mask in mask/mask ops
Date: Thu, 20 Jun 2019 21:20:22 -0700
Message-ID: <CAGp9LzqyRQ0knQ8+NanTAC0VVqBudAFPuCQJiyymmabaT1Hyfw@mail.gmail.com>
References: <20190429035515.73611-1-drinkcat@chromium.org> <20190429035515.73611-3-drinkcat@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429035515.73611-3-drinkcat@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, Chuanjia Liu <Chuanjia.Liu@mediatek.com>, Evan Green <evgreen@chromium.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

Hi, Nicolas

On Sun, Apr 28, 2019 at 8:55 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> During suspend/resume, mtk_eint_mask may be called while
> wake_mask is active. For example, this happens if a wake-source
> with an active interrupt handler wakes the system:
> irq/pm.c:irq_pm_check_wakeup would disable the interrupt, so
> that it can be handled later on in the resume flow.
>
> However, this may happen before mtk_eint_do_resume is called:
> in this case, wake_mask is loaded, and cur_mask is restored
> from an older copy, re-enabling the interrupt, and causing
> an interrupt storm (especially for level interrupts).
>
> Instead, we just record mask/unmask changes in cur_mask. This
> also avoids the need to read the current mask in eint_do_suspend,
> and we can remove mtk_eint_chip_read_mask function.
>

The change is worth rewording the commit message you added above as an instance
and adding Fixes tag as a fixup to mean you're fixing the existing
problem in the driver.

And then Acked-by: Sean Wang <sean.wang@kernel.org>

> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
>  drivers/pinctrl/mediatek/mtk-eint.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index 737385e86beb807..7e526bcf5e0b55c 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -113,6 +113,8 @@ static void mtk_eint_mask(struct irq_data *d)
>         void __iomem *reg = mtk_eint_get_offset(eint, d->hwirq,
>                                                 eint->regs->mask_set);
>
> +       eint->cur_mask[d->hwirq >> 5] &= ~mask;
> +
>         writel(mask, reg);
>  }
>
> @@ -123,6 +125,8 @@ static void mtk_eint_unmask(struct irq_data *d)
>         void __iomem *reg = mtk_eint_get_offset(eint, d->hwirq,
>                                                 eint->regs->mask_clr);
>
> +       eint->cur_mask[d->hwirq >> 5] |= mask;
> +
>         writel(mask, reg);
>
>         if (eint->dual_edge[d->hwirq])
> @@ -217,19 +221,6 @@ static void mtk_eint_chip_write_mask(const struct mtk_eint *eint,
>         }
>  }
>
> -static void mtk_eint_chip_read_mask(const struct mtk_eint *eint,
> -                                   void __iomem *base, u32 *buf)
> -{
> -       int port;
> -       void __iomem *reg;
> -
> -       for (port = 0; port < eint->hw->ports; port++) {
> -               reg = base + eint->regs->mask + (port << 2);
> -               buf[port] = ~readl_relaxed(reg);
> -               /* Mask is 0 when irq is enabled, and 1 when disabled. */
> -       }
> -}
> -
>  static int mtk_eint_irq_request_resources(struct irq_data *d)
>  {
>         struct mtk_eint *eint = irq_data_get_irq_chip_data(d);
> @@ -384,7 +375,6 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
>
>  int mtk_eint_do_suspend(struct mtk_eint *eint)
>  {
> -       mtk_eint_chip_read_mask(eint, eint->base, eint->cur_mask);
>         mtk_eint_chip_write_mask(eint, eint->base, eint->wake_mask);
>
>         return 0;
> --
> 2.21.0.593.g511ec345e18-goog
>
