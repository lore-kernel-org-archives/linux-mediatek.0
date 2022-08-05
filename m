Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6380FC00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 13:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FEi1CuKFHPWHETXS5rrQ8s9GwbgPfiuBefvLvAoBsk=; b=0sVwc7PuUIDkD6T1q8AQ/yfIm+
	1fidyC+Gj64Ki6lNEE1h3ihuHAY9dfZUw+pcY+z4sxkGV8kaSVDvaCuD5Tts04vZpk1pPBj4sDWMm
	eislranxjeWz1Wrn3HfhHKPMQV/erqOSndf3AQ/IWbNwPDcu7gAZwqg/lcitXR+Uv6PbWJ8XXKAlT
	XSQ64blX2WX9rbtOxugBzcJRjZxbhZhCrZCga1RwTCwM3yoSOnPTrGm1TmI+1k5osssGVfmVQOkKT
	3Q2csgeHJdjfQu5tccYpAmPXAD7Y8cGB/h/3VWywEDRNc6jQPS8TY+KVP5Jra9drLFQhMxtMKG+zy
	iTcbFdkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJx31-00FHei-2W; Fri, 05 Aug 2022 13:07:27 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJx2k-00FHRc-JE; Fri, 05 Aug 2022 13:07:15 +0000
Received: by mail-qk1-x736.google.com with SMTP id f14so1826967qkm.0;
        Fri, 05 Aug 2022 06:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=3FEi1CuKFHPWHETXS5rrQ8s9GwbgPfiuBefvLvAoBsk=;
        b=KgL/Ti/Sw5zH9EmMfo00bYbabUMlHnfPxzlYp138btnOZ5iHJws2jxCG33uwIKAM57
         ZH9pcxSaQ3WAvKMK+rlXSIpmF9goTDadcJBOaraf9vF+AYXYuuUCk1nn9mZTAv7A84VS
         IGN53sF6SexwC9WgkegcjbT+ydEtt7SJLKzuOXSjM7pv7pItuF3vkyrASesCL/DMFAma
         rvrzVZQfTooocv0qvKbynXnxhJZQrwyBscixkLCW31xTQ5ekgGyzVfdw4/3LfOktLn40
         aBpsyR98kiE/cfno9Vr7LLF4YuYZgav13rVMy6A3nxoUQo28k9pfuse69foAmsjNPvze
         VLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=3FEi1CuKFHPWHETXS5rrQ8s9GwbgPfiuBefvLvAoBsk=;
        b=a0rFzHf/oIr4s2xLUvKdAp7v4ad4T/EYFBl10rofAX0QqsBHgCKGFTOrtf3+1DQut1
         f8eeXcorak9igoHiB1Tmm+v6JL2nS6xix4U37SZhQv7RKadqE2tRGvDwsRHg2lU2+JxB
         88CMvt6/FCNhLgI3J6zLqfKgzjqWkedT5cmX/XxRFxi9SaUGixQoRNOc7t9qaaxeuQr6
         nf7RmLJAqzsjlLozxohI97WPIts0YTrzZZBwmhAWlBzfN53+YRILyMznZ5ClZqBMspDH
         P4MEVu/bKSsCvzrJSwwUlL9oFE4bW6wuel80MJEL3XYsxsDm5LGmHt8hF8b1YtouFJ0F
         z55g==
X-Gm-Message-State: ACgBeo1L/FYN26OeuyB4vIy6Ih/uDZrMIS6sf0xiyrSqa0rJNpIIGJ6f
	7pQ1cVQE3BGNxrEkgn+tYAW9tmwqnHCwHPlrDE4=
X-Google-Smtp-Source: AA6agR4j0zsJqZaQf0Yu4UVNEf1JelHQhvwq9j519MOA8iXjVXlQvyGrJ/GntjcmyE7xYpQsU0Y5iOHVvVZTTJcjLGA=
X-Received: by 2002:a05:620a:31a:b0:6b9:1f1a:7e13 with SMTP id
 s26-20020a05620a031a00b006b91f1a7e13mr727146qkm.748.1659704817063; Fri, 05
 Aug 2022 06:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220805070610.3516-1-peterwu.pub@gmail.com> <20220805070610.3516-14-peterwu.pub@gmail.com>
In-Reply-To: <20220805070610.3516-14-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Aug 2022 15:06:19 +0200
Message-ID: <CAHp75VfiYNzmcPN8LNqvU0jKuWVFR3ODY3iWaJwpDxUdSORTOg@mail.gmail.com>
Subject: Re: [PATCH v7 13/13] video: backlight: mt6370: Add MediaTek MT6370 support
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, Alice Chen <alice_chen@richtek.com>, 
	cy_huang <cy_huang@richtek.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_060710_659258_2658F9BC 
X-CRM114-Status: GOOD (  15.52  )
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

On Fri, Aug 5, 2022 at 9:08 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
>
> Add a support for the MediaTek MT6370 backlight driver.
> It controls 4 channels of 8 series WLEDs in
> 2048 (only for MT6370/MT6371) / 16384 (only for MT6372)
> current steps (30 mA) in exponential or linear mapping curves.

...

> +#include <linux/backlight.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/kernel.h>
> +#include <linux/minmax.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>

> +#include <linux/of_device.h>

Why? Since below drop this and use fully fwnode / device property APIs.

> +#include <linux/platform_device.h>

Missed property.h which is heavily used in.the driver

> +#include <linux/regmap.h>

...

> +       /*
> +        * MT6372 uses 14 bits to control the brightness but MT6370 and MT6371
> +        * use 11 bits. They are different so we have to use this function to
> +        * check the vendor ID and use different mask, shift and default
> +        * maxiimum brightness value.

Use spell-checker for all your patches.

> +        */

-- 
With Best Regards,
Andy Shevchenko

