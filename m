Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF04C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 18:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBMGPYDRnJPeUwS8rUCcWoIIaqQNv7Xsce74kY6zINI=; b=uiJdiNgfEljFByOaShFMCi3+K1
	wJ7e6bXtEUXghfvIAhnJtRtBmocY6mCXjjkQex/lGZUxGz+7oz8iiFjSMTfJfoORdWI3BDOvugBEn
	Skv6z1Pe4lsL9j9cidozt361H0CthekpwBZzmQA0zcrXZbRmTtoslmNfMzg3SMO4+pLjUMc6SEG8s
	fBMHgBj+7TGKXthM0JY/Rfz3Zs+qyDyxDlXVoIwvkuptm4ShytTfVXKk2f6qopW5WyEPrghpUPHBh
	rBCWjS/yToLBTpjnouSKKTow/0rW5KfCJLLIsHjOwL9wTYoRNAuNlGUFoSZTZcGsHOWT3wCC3sfco
	7aX54zxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4RQh-00GIwP-HW; Thu, 23 Jun 2022 18:19:47 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4RQW-00GIt0-LY; Thu, 23 Jun 2022 18:19:38 +0000
Received: by mail-lf1-x12a.google.com with SMTP id j21so427823lfe.1;
        Thu, 23 Jun 2022 11:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sBMGPYDRnJPeUwS8rUCcWoIIaqQNv7Xsce74kY6zINI=;
        b=BJrh0YPvvBPOk2FgsQMFRa2Mypjcm71ylJrq31IKtpANvhN4g8KLB7ntFQNq9IZHVF
         l6ZhSU+TlBFMgNnWeh7Eoj5Ib1pOugR8/ndpuPy4VRRMJ6LnlT4CTMEzgfF4vBExrKon
         Wo9h20LnpfRWOTcCAHW7Udyx6kQ1lpY2Hv/XvCOnPkvGMJrQAMlcIYbPHW/+QvkLPw/v
         z1lAydtVEKdwcueGxWsSL7la7BCLCRYzBxgeXh32PNyM7jHQtn8jXHCrjG/yF8ym1dip
         s0nAMXw5V2WlQuo+mpIp+OLG/gu7Zn8xLGMejPmMkd4+e9tWrl/+j7x7jETixBbgqiPc
         vqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sBMGPYDRnJPeUwS8rUCcWoIIaqQNv7Xsce74kY6zINI=;
        b=l/TaugY2+Za3miDoL5elg7HMYxR8R5oFbXtSar5ACjnbjuCRGUl5JArpMhbLbL3OD9
         sTRmgRQLEADcsTqliPZslsGK6olw/Tn8mMjaQ9QtTgDMRJnEACWVaV10nUaidU+q01i7
         O4BuAZ0/h2i3P6RzN+5HPax3EQApyu5l9Yanj29umVyejCXzcG50B1+r69Y/10wCC8jF
         GQeMqP+O+7G5sZVDwCtuHXzqW3lqzS3fYqJkgJjgKDy+4Th+eqLNRl9+0W44ehtGRarw
         Fit/ynEEOXRYYmhpLxX6kFqFYhsJvAZTd43dwdA7yi5vnTq+Gd3F2thw7PaUNBi62/Mg
         AutQ==
X-Gm-Message-State: AJIora/jMV4AdtJ2JmDPJ6osTY5YHVRN2dghn3b84J6aO2PsI5mAtVSC
	MG7So7A3OlASGUQRaduq5YpolKGz/B/m2jz6Mjs=
X-Google-Smtp-Source: AGRyM1sSt9RqJEWu2voYn8rYod2JWrA9S0VKzO5KainJy6NBR3RGPl9JAy9lFNfNLGcH9lioXFXtCJIfjWl2wSCUbcc=
X-Received: by 2002:a05:6512:151f:b0:47d:dd0c:1d1c with SMTP id
 bq31-20020a056512151f00b0047ddd0c1d1cmr6036883lfb.207.1656008372915; Thu, 23
 Jun 2022 11:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com> <20220623115631.22209-10-peterwu.pub@gmail.com>
In-Reply-To: <20220623115631.22209-10-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 23 Jun 2022 20:18:56 +0200
Message-ID: <CAHp75VdgxR9aFQmi_MPrX=t7RMnKDiLAwWMvxbpW9OoQMJkKyw@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] regulator: mt6370: Add mt6370 DisplayBias and
 VibLDO support
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
X-CRM114-CacheID: sfid-20220623_111936_716184_59F25DE6 
X-CRM114-Status: GOOD (  15.75  )
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
> Add mt6370 DisplayBias and VibLDO support.

...

> +#include <linux/bits.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>

> +#include <linux/of.h>

Any users of this? (See below)

> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>

...

> +#define MT6370_LDO_MINUV       1600000
> +#define MT6370_LDO_STPUV       200000
> +#define MT6370_LDO_N_VOLT      13
> +#define MT6370_DBVBOOST_MINUV  4000000
> +#define MT6370_DBVBOOST_STPUV  50000
> +#define MT6370_DBVBOOST_N_VOLT 45
> +#define MT6370_DBVOUT_MINUV    4000000
> +#define MT6370_DBVOUT_STPUV    50000
> +#define MT6370_DBVOUT_N_VOLT   41

If UV is a unit suffix, make it _UV.

...

> +               .of_match = of_match_ptr("dsvbst"),

Would it even be called / used if CONFIG_OF=n?

...

> +               .regulators_node = of_match_ptr("regulators"),

Ditto.

...

> +       for (i = 0; i < ARRAY_SIZE(mt6370_irqs); i++) {
> +               irq = platform_get_irq_byname(pdev, mt6370_irqs[i].name);
> +
> +               rdev = priv->rdev[mt6370_irqs[i].rid];
> +
> +               ret = devm_request_threaded_irq(priv->dev, irq, NULL,
> +                                               mt6370_irqs[i].handler, 0,
> +                                               mt6370_irqs[i].name, rdev);
> +               if (ret) {

> +                       dev_err(priv->dev,
> +                               "Failed to register (%d) interrupt\n", i);
> +                       return ret;

return dev_err_probe(...); ?

> +               }
> +       }

...

> +       for (i = 0; i < MT6370_MAX_IDX; i++) {
> +               rdev = devm_regulator_register(priv->dev,
> +                                              mt6370_regulator_descs + i,
> +                                              &cfg);
> +               if (IS_ERR(rdev)) {

> +                       dev_err(priv->dev,
> +                               "Failed to register (%d) regulator\n", i);
> +                       return PTR_ERR(rdev);

return dev_err_probe(...); ?

> +               }
> +
> +               priv->rdev[i] = rdev;
> +       }

...

> +       if (!priv->regmap) {
> +               dev_err(&pdev->dev, "Failed to init regmap\n");
> +               return -ENODEV;
> +       }

return dev_err_probe(...);

-- 
With Best Regards,
Andy Shevchenko

