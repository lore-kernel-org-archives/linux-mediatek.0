From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: mt6397: Implement wake handler and suspend/resume
 for mt6397-core.c
Date: Mon, 10 Aug 2015 12:42:24 +0100
Message-ID: <20150810114224.GD3249@x1>
References: <1438268846-22451-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1438268846-22451-1-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Flora Fu <flora.fu@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

No need to mention the filename in the subject line.  You already
mentioned which driver is effected by the change.

> Register mt6393_irq as wake up source to pinctrl by flag "IRQF_NO_SUS=
PEND".
> Implement .irq_set_wake() function of pmic to keep who is wakeup sour=
ce,
> and enable irq on .suspend()and restore irq on .resume().
>=20
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>  drivers/mfd/mt6397-core.c       | 49 +++++++++++++++++++++++++++++++=
+++++++++-
>  include/linux/mfd/mt6397/core.h |  1 +
>  2 files changed, 49 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 03929a6..aebdee5 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c

[...]

> @@ -142,6 +161,7 @@ static int mt6397_irq_domain_map(struct irq_domai=
n *d, unsigned int irq,
>  	irq_set_chip_data(irq, mt6397);
>  	irq_set_chip_and_handler(irq, &mt6397_irq_chip, handle_level_irq);
>  	irq_set_nested_thread(irq, 1);
> +

Remainder of the patch looks okay, but this irrelevant change, which
has nothing to do with the remainder of the patch will cause issues if
I attempt to apply it.  Please remove and re-submit.

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
