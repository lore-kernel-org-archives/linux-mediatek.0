From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: Ignore interrupts that are wake
 only during resume
Date: Tue, 25 Jun 2019 15:50:50 +0200
Message-ID: <CACRpkdZd+0_7xqaa05mqNzNxDC1kKmEv9LLRoSVYqTmO=+3iGA@mail.gmail.com>
References: <20190429035515.73611-1-drinkcat@chromium.org> <20190429035515.73611-2-drinkcat@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190429035515.73611-2-drinkcat@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chuanjia Liu <Chuanjia.Liu@mediatek.com>, Evan Green <evgreen@chromium.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

On Mon, Apr 29, 2019 at 5:55 AM Nicolas Boichat <drinkcat@chromium.org> wrote:

> Before suspending, mtk-eint would set the interrupt mask to the
> one in wake_mask. However, some of these interrupts may not have a
> corresponding interrupt handler, or the interrupt may be disabled.
>
> On resume, the eint irq handler would trigger nevertheless,
> and irq/pm.c:irq_pm_check_wakeup would be called, which would
> try to call irq_disable. However, if the interrupt is not enabled
> (irqd_irq_disabled(&desc->irq_data) is true), the call does nothing,
> and the interrupt is left enabled in the eint driver.
>
> Especially for level-sensitive interrupts, this will lead to an
> interrupt storm on resume.
>
> If we detect that an interrupt is only in wake_mask, but not in
> cur_mask, we can just mask it out immediately (as mtk_eint_resume
> would do anyway at a later stage in the resume sequence, when
> restoring cur_mask).
>
> Fixes: bf22ff45bed ("genirq: Avoid unnecessary low level irq function calls")
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

Patch applied for fixes.
Hm a late ACK made me miss this, sorry.

Yours,
Linus Walleij
