Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E53C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 18:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVm8MjXTsJMX8WBaTQ/Z/W23uteGk2WgxtylOJuMvn4=; b=qXX5UPBI1G4a4ChE76wVyZHvws
	MGZoloMKoj8T93+/GtFAxyAVzLIClsH61rjFwtj3zHbH5g0MuRCi5IrNU10s99N6Ti24hhoyVXdYT
	oyjM66dEdI4U9AVkYnlift/qtIW+wJK4FSTQNFQBVMsDVkDbL/OXJO5wta+EAU9voqpGnUwi0tclN
	fitgUy/lZv2UmAhZyBcmH9JxuvfxC7Ci3tb6BKDlogl11ZCOZcu4efFNMD1DcvlFSui1PRDoBHKjn
	+Q+SpoN6NJykOZ9Peq0sGT+r94hIGyCvdeQf9wRrEP8bLOm51+qthH2HFKMQKoNVWGaiTICraH/sX
	4OnRKHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4RFQ-00GG9L-Mg; Thu, 23 Jun 2022 18:08:08 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4RFE-00GG6R-L7; Thu, 23 Jun 2022 18:07:58 +0000
Received: by mail-lj1-x234.google.com with SMTP id s14so86554ljs.3;
        Thu, 23 Jun 2022 11:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pVm8MjXTsJMX8WBaTQ/Z/W23uteGk2WgxtylOJuMvn4=;
        b=ROMSf98OAyUaa6eEUsFo3GNphishFltifgt5QEQzrZNe7sjAM+HfSxcOzzy9W6RXT/
         G9dAp8BarXJwUQv1+UFIl9pO6g0/KNAziFw8OQyNNA2F7tBBoJs6F4EVswlaZ/mtrOUr
         QkvM84BF5zxaVCCNT37WNd2okHNEk6IyyAzwEh1EwAophtbnp7iFhuLKO8Z/XOD1lnUl
         suS5mf6pbLbWkjRhB9QoLtb2LLY0TBOsJTxfjC7JtzRG8wnlujGjvT+fxjiuxQ7n37lq
         7hRGbeT6p1p4iK5XNA2XXK6FCYcJpRLpc3dd/qxtlN637sF3jF8kcCu0NSjABQOuH24p
         9Wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pVm8MjXTsJMX8WBaTQ/Z/W23uteGk2WgxtylOJuMvn4=;
        b=00uAx+atqiqB4w/NmvCUn6yFqPgIDjbPjc/UYNTwTIFSXXO328Aqn2wUb0deKZC8DY
         7rp4scdUeTr0q2z69/HPYB2KSbm9eOxi+qrFL0wGWjmMwVanxONr8b0B+M1qwRzINKT9
         rq+yEKgez0cKDXOejJXTGq1ICUv2yVtb91/Cl35gNVkECQtB0LGCH/V344ZhhFIRk4iC
         b2XmaH9d/RT+bqe/LoXrfUnlMnqgd7NxAVzhj6Xvc6rl4iy/WupGVEg82zkGIrUQSt5P
         Sk4G9qPF4RhEby5STUPkPAzVtujzqQX4VS9a+jtXcBQDMR0QXxaC7dbLaMLdNDvWiSjB
         Jzwg==
X-Gm-Message-State: AJIora+RWSy/4O4vJuXHrmU2J3MMglFOSncMCCsqm905A13f8JASLtxa
	xBkvW64+LgECOR3cEJNoQ6b9hKBJFf5QxxEY36ex6i09DiF32Q==
X-Google-Smtp-Source: AGRyM1vZgKzYKINQvL/hjv/QKJoSpgQjofBcH1c6rGieXJWJEFKaIjpnuwM4pmWPjKf5o83t+GJsAhFvgJCR3nJUMSQ=
X-Received: by 2002:a2e:b8d2:0:b0:255:93e3:6fb2 with SMTP id
 s18-20020a2eb8d2000000b0025593e36fb2mr5737201ljp.334.1656007673996; Thu, 23
 Jun 2022 11:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com> <20220623115631.22209-9-peterwu.pub@gmail.com>
In-Reply-To: <20220623115631.22209-9-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 23 Jun 2022 20:07:17 +0200
Message-ID: <CAHp75Vchspgg_VaM+7JHD+2x+-JPkJXSdtLoqQGAx=kg5uAdSg@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] usb: typec: tcpci_mt6370: Add Mediatek MT6370
 tcpci driver
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, chiaen_wu@richtek.com, 
	alice_chen@richtek.com, cy_huang <cy_huang@richtek.com>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_110756_752356_6AAFB22A 
X-CRM114-Status: GOOD (  17.60  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jun 23, 2022 at 2:00 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiYuan Huang <cy_huang@richtek.com>
>
> Add chip level mt6370 tcpci driver.

...

> +config TYPEC_TCPCI_MT6370
> +       tristate "Mediatek MT6370 Type-C driver"
> +       depends on MFD_MT6370
> +       help
> +         Mediatek MT6370 is a multi-functional IC that includes
> +         USB Type-C. It works with Type-C Port Controller Manager
> +         to provide USB PD and USB Type-C functionalities.

What will be the module name?

...

> +#include <linux/bits.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>

> +#include <linux/of.h>

No user of this header is found in this file.

> +#include <linux/platform_device.h>
> +#include <linux/pm_wakeup.h>
> +#include <linux/pm_wakeirq.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/usb/tcpm.h>
> +#include "tcpci.h"

...

> +       if (did == MT6370_TCPC_DID_A) {
> +               ret = regmap_write(data->regmap, TCPC_FAULT_CTRL, 0x80);
> +               if (ret)
> +                       return ret;

return regmap_write(...);

> +       }
> +
> +       return 0;

...

> +       if (ret && !source)
> +               ret = regulator_disable(priv->vbus);
> +       else if (!ret && source)
> +               ret = regulator_enable(priv->vbus);
> +       else
> +               ret = 0;
> +
> +       return ret;

Can it be

  if (ret && ...)
    return regulator_disable(...);
  if (!ret && ...)
    return regulator_enable(...);

  return 0;

?

...

> +       if (!priv->tcpci_data.regmap) {
> +               dev_err(&pdev->dev, "Failed to init regmap\n");
> +               return -ENODEV;
> +       }

return dev_err_probe(...); ?

...

> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to check vendor info (%d)\n", ret);
> +               return ret;
> +       }

Ditto.

...

> +       priv->irq = platform_get_irq(pdev, 0);
> +       if (priv->irq < 0) {

> +               dev_err(&pdev->dev, "Failed to get TCPC irq (%d)\n", priv->irq);

The message like this is printed in case of error inside
platform_get_irq(), no need to duplicate.

> +               return priv->irq;
> +       }

...

> +       priv->tcpci = tcpci_register_port(&pdev->dev, &priv->tcpci_data);
> +       if (IS_ERR(priv->tcpci)) {
> +               dev_err(&pdev->dev, "Failed to register tcpci port\n");
> +               return PTR_ERR(priv->tcpci);

return dev_err_probe(); ?

> +       }

...

> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to allocate irq (%d)\n", ret);
> +               tcpci_unregister_port(priv->tcpci);
> +               return ret;

Ditto.

> +       }

-- 
With Best Regards,
Andy Shevchenko

