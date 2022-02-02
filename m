Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEA3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 09:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMO2KR9w+SGgxpaRltVQPyQ21YCVN9ihz6xVFOP7ApA=; b=egndRtYMUO3dw3
	4Ex47ebbW8HCncEDZ9GDxoaNlsqW6fGxV2EmfWrilx0B//64rFweHXk2OjnUGOQWtrdYtzl7/1beh
	yIvd+pd+726CUny61cFfKfWFuVpwFhLDDz2TPknqmnuPjSzFha1i3kR0ykClyjaJ+KjwRrcjxFpBY
	X1/ycOb8GGDvDFoGp00K7jDoJySKS0mPoVZ5dYdhxaSuGD4jkI3oULlPoOWpUKSvYvqZGG5CN2QDO
	Nfd2LrHToTj4lHMzn24fsEYgGq8s8+VXhbFiRS3aiOPyg4Pb/gY8baIeTe2c6Z0ENueI3WoesdWdV
	GnNbg/+4DndO6OwLD1dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFBls-00EkIk-AB; Wed, 02 Feb 2022 09:17:48 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFBlY-00EkBk-AD
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 09:17:30 +0000
Received: by mail-ej1-x62b.google.com with SMTP id jx6so63810871ejb.0
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 01:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y/kYiRInfsvyElPIDI39Lqck87rYrQWofhDpEmZtPSY=;
 b=n+zSRRWNoLDbgRRKBeTh+H1uwEewljSjvlihvbIbFUw3/JNwm4kM38DZanK8Dpg7AI
 +dj2/gAKUckeWANIRVKUrPXyonam/wV5zyN7FV50rmYde2p97d+Yi3FrrB01iAYR+aXM
 Gum5F3bCNEE25rxs56m2NlmRQh6eW/jDg7HIV3U0Gu10+6C6J8hl7gbvJaKoexUHnUz3
 c+NCfqJ7i2IsQR/J37EPCprXo5Kjx3pE4isRsLZ91uu9bP64VNLyKplBDsypDvjktOHL
 YApmDzYRqxp0PBbZpj6v1gulDj6jcdVtQnU/slBRlRN3cSzfXC9Pom0j0U2POdrEe2jR
 JP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y/kYiRInfsvyElPIDI39Lqck87rYrQWofhDpEmZtPSY=;
 b=Tbkn6xfxc4PPFcCWlcdMGdfKs/CEbuEVcX5deHMR8GuANSF0VThMoyt3bDPYUtjGUg
 Ck70+WjqODiuEUUEFfPeRcM/Ao0N3cjV4e1x71m6FWkTUy5+mUqRCnKU4VrWsd/Y8KUG
 6aqErTy1FaSZLsI4sdw1GPNqvfdAe/nJwanRsOB4CtWbpyYCv/XpSRE/bC5kN86yualV
 l249FUy0se3iqEh/4vely+mQLkgGD9yo3SbHLRH/XzWwgAWjFZVEFEYnqa0oSfpt19PY
 fNoHhGfXx6F45OPKgYEZGi7jJVByvKcVI+h03QwC5n4WUmG724n3blbwT9BypgyFoMf0
 2j+w==
X-Gm-Message-State: AOAM5333bKzBTHHuwn4SQSXaCY3V/BGQMoBPTHO2Ht36CGRh6jSa3bxA
 LmMg9oebQ/uZQFPaMxfSEh69gySdIA+BHERkwi4YDg==
X-Google-Smtp-Source: ABdhPJxsThSLIsef6dEfWt17Wr72wwi5nMcsD+ZG0OofJafpJ2Dp54PSSoa0LpSQl4SlOtjdSg1W/OdtjHGnap7Rq78=
X-Received: by 2002:a17:906:eb8a:: with SMTP id
 mh10mr21471265ejb.492.1643793446481; 
 Wed, 02 Feb 2022 01:17:26 -0800 (PST)
MIME-Version: 1.0
References: <20220130145116.88406-1-nbd@nbd.name>
 <20220130145116.88406-13-nbd@nbd.name>
In-Reply-To: <20220130145116.88406-13-nbd@nbd.name>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Feb 2022 10:17:15 +0100
Message-ID: <CAMRc=MeuGpO3-M=_46K-B5L84ZrfL_tonLtoNHCM3GYgF=Z_Eg@mail.gmail.com>
Subject: Re: [PATCH v9 12/13] gpio: Add support for Airoha EN7523 GPIO
 controller
To: Felix Fietkau <nbd@nbd.name>
Cc: Linus Walleij <linus.walleij@linaro.org>, soc@kernel.org, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 John Crispin <john@phrozen.org>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_011728_385414_E829B7F2 
X-CRM114-Status: GOOD (  28.42  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jan 30, 2022 at 3:54 PM Felix Fietkau <nbd@nbd.name> wrote:
>
> From: John Crispin <john@phrozen.org>
>
> Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
> GPIOs. Each instance in DT is for a single bank.
>
> Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  drivers/gpio/Kconfig       |  10 +++
>  drivers/gpio/Makefile      |   1 +
>  drivers/gpio/gpio-en7523.c | 137 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 148 insertions(+)
>  create mode 100644 drivers/gpio/gpio-en7523.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 60d9374c72c0..0e9aacbcb4bd 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -247,6 +247,16 @@ config GPIO_EM
>         help
>           Say yes here to support GPIO on Renesas Emma Mobile SoCs.
>
> +config GPIO_EN7523
> +       tristate "Airoha GPIO support"
> +       depends on ARCH_AIROHA
> +       default ARCH_AIROHA
> +       select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP
> +       help
> +         Say Y or M here to support the GPIO controller block on the
> +         Airoha EN7523 SoC. It supports two banks of 32 GPIOs.
> +
>  config GPIO_EP93XX
>         def_bool y
>         depends on ARCH_EP93XX
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 71ee9fc2ff83..d2269ee0948e 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -56,6 +56,7 @@ obj-$(CONFIG_GPIO_DLN2)                       += gpio-dln2.o
>  obj-$(CONFIG_GPIO_DWAPB)               += gpio-dwapb.o
>  obj-$(CONFIG_GPIO_EIC_SPRD)            += gpio-eic-sprd.o
>  obj-$(CONFIG_GPIO_EM)                  += gpio-em.o
> +obj-$(CONFIG_GPIO_EN7523)              += gpio-en7523.o
>  obj-$(CONFIG_GPIO_EP93XX)              += gpio-ep93xx.o
>  obj-$(CONFIG_GPIO_EXAR)                        += gpio-exar.o
>  obj-$(CONFIG_GPIO_F7188X)              += gpio-f7188x.o
> diff --git a/drivers/gpio/gpio-en7523.c b/drivers/gpio/gpio-en7523.c
> new file mode 100644
> index 000000000000..f836a8db4c1d
> --- /dev/null
> +++ b/drivers/gpio/gpio-en7523.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/types.h>
> +#include <linux/io.h>
> +#include <linux/bits.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +
> +#define AIROHA_GPIO_MAX                32
> +
> +/**
> + * airoha_gpio_ctrl - Airoha GPIO driver data
> + * @gc: Associated gpio_chip instance.
> + * @data: The data register.
> + * @dir0: The direction register for the lower 16 pins.
> + * @dir1: The direction register for the higher 16 pins.
> + * @output: The output enable register.
> + */
> +struct airoha_gpio_ctrl {
> +       struct gpio_chip gc;
> +       void __iomem *data;
> +       void __iomem *dir[2];
> +       void __iomem *output;
> +};
> +
> +static struct airoha_gpio_ctrl *gc_to_ctrl(struct gpio_chip *gc)
> +{
> +       return container_of(gc, struct airoha_gpio_ctrl, gc);
> +}
> +
> +static int airoha_dir_set(struct gpio_chip *gc, unsigned int gpio,
> +                         int val, int out)
> +{
> +       struct airoha_gpio_ctrl *ctrl = gc_to_ctrl(gc);
> +       u32 dir = ioread32(ctrl->dir[gpio / 16]);
> +       u32 output = ioread32(ctrl->output);
> +       u32 mask = BIT((gpio % 16) * 2);
> +
> +       if (out) {
> +               dir |= mask;
> +               output |= BIT(gpio);
> +       } else {
> +               dir &= ~mask;
> +               output &= ~BIT(gpio);
> +       }
> +
> +       iowrite32(dir, ctrl->dir[gpio / 16]);
> +
> +       if (out)
> +               gc->set(gc, gpio, val);
> +
> +       iowrite32(output, ctrl->output);
> +
> +       return 0;
> +}
> +
> +static int airoha_dir_out(struct gpio_chip *gc, unsigned int gpio,
> +                         int val)
> +{
> +       return airoha_dir_set(gc, gpio, val, 1);
> +}
> +
> +static int airoha_dir_in(struct gpio_chip *gc, unsigned int gpio)
> +{
> +       return airoha_dir_set(gc, gpio, 0, 0);
> +}
> +
> +static int airoha_get_dir(struct gpio_chip *gc, unsigned int gpio)
> +{
> +       struct airoha_gpio_ctrl *ctrl = gc_to_ctrl(gc);
> +       u32 dir = ioread32(ctrl->dir[gpio / 16]);
> +       u32 mask = BIT((gpio % 16) * 2);
> +
> +       return (dir & mask) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
> +}
> +
> +static int airoha_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct airoha_gpio_ctrl *ctrl;
> +       int err;
> +
> +       ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
> +       if (!ctrl)
> +               return -ENOMEM;
> +
> +       ctrl->data = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(ctrl->data))
> +               return PTR_ERR(ctrl->data);
> +
> +       ctrl->dir[0] = devm_platform_ioremap_resource(pdev, 1);
> +       if (IS_ERR(ctrl->dir[0]))
> +               return PTR_ERR(ctrl->dir[0]);
> +
> +       ctrl->dir[1] = devm_platform_ioremap_resource(pdev, 2);
> +       if (IS_ERR(ctrl->dir[1]))
> +               return PTR_ERR(ctrl->dir[1]);
> +
> +       ctrl->output = devm_platform_ioremap_resource(pdev, 3);
> +       if (IS_ERR(ctrl->output))
> +               return PTR_ERR(ctrl->output);
> +
> +       err = bgpio_init(&ctrl->gc, dev, 4, ctrl->data, NULL,
> +                        NULL, NULL, NULL, 0);
> +       if (err)
> +               return dev_err_probe(dev, err, "unable to init generic GPIO");
> +
> +       ctrl->gc.ngpio = AIROHA_GPIO_MAX;
> +       ctrl->gc.owner = THIS_MODULE;
> +       ctrl->gc.direction_output = airoha_dir_out;
> +       ctrl->gc.direction_input = airoha_dir_in;
> +       ctrl->gc.get_direction = airoha_get_dir;
> +
> +       return devm_gpiochip_add_data(dev, &ctrl->gc, ctrl);
> +}
> +
> +static const struct of_device_id airoha_gpio_of_match[] = {
> +       { .compatible = "airoha,en7523-gpio" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, airoha_gpio_of_match);
> +
> +static struct platform_driver airoha_gpio_driver = {
> +       .driver = {
> +               .name = "airoha-gpio",
> +               .of_match_table = airoha_gpio_of_match,
> +       },
> +       .probe = airoha_gpio_probe,
> +};
> +module_platform_driver(airoha_gpio_driver);
> +
> +MODULE_DESCRIPTION("Airoha GPIO support");
> +MODULE_AUTHOR("John Crispin <john@phrozen.org>");
> +MODULE_LICENSE("GPL v2");
> --
> 2.32.0 (Apple Git-132)
>

Queued for next, thanks!

Bart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
