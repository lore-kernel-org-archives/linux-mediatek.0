From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: mediatek: Update cur_mask in mask/mask ops
Date: Thu, 27 Jun 2019 12:23:49 +0100
Message-ID: <CACRpkdaK1A2eS5_5Fg40hTV3bwRNvRmqfWidVMpNkxFkzVEVmw@mail.gmail.com>
References: <20190626035445.236406-1-drinkcat@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190626035445.236406-1-drinkcat@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chuanjia Liu <Chuanjia.Liu@mediatek.com>, Evan Green <evgreen@chromium.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

On Wed, Jun 26, 2019 at 4:54 AM Nicolas Boichat <drinkcat@chromium.org> wrote:

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
> Step by step, for a line that has both wake and interrupt enabled:
>  1. cur_mask[irq] = 1; wake_mask[irq] = 1; EINT_EN[irq] = 1 (interrupt
>     enabled at hardware level)
>  2. System suspends, resumes due to that line (at this stage EINT_EN
>     == wake_mask)
>  3. irq_pm_check_wakeup is called, and disables the interrupt =>
>     EINT_EN[irq] = 0, but we still have cur_mask[irq] = 1
>  4. mtk_eint_do_resume is called, and restores EINT_EN = cur_mask, so
>     it reenables EINT_EN[irq] = 1 => interrupt storm as the driver
>     is not yet ready to handle the interrupt.
>
> This patch fixes the issue in step 3, by recording all mask/unmask
> changes in cur_mask. This also avoids the need to read the current
> mask in eint_do_suspend, and we can remove mtk_eint_chip_read_mask
> function.
>
> The interrupt will be re-enabled properly later on, sometimes after
> mtk_eint_do_resume, when the driver is ready to handle it.
>
> Fixes: 58a5e1b64b ("pinctrl: mediatek: Implement wake handler and suspend resume")
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> Acked-by: Sean Wang <sean.wang@kernel.org>

Patch applied after extending the has for Fixes: to 12 digits.

Yours,
Linus Walleij
