Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A72CC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 18:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htpW4KO87Pa3rfVeMc6d2EASyy2GIlidpaFdVmoZj4s=; b=DnCL3QYwk4xe59/WitPC6uiN7E
	0N6BgyKSVkX9snmYeZEVfySPXftthyHE7BzvdEZ5XKMXXHRPpcgOym/lTjBmGR0be0YY66CKPNgkV
	eGxLpQ1Me64a/1Mq5GOQsxxacWtY0vhfVhipyFApHJbKbk7kT7u3s+TyLquuOR1YJA1w1CuWTLAUp
	brdHeHi0Kl5E7gZwY+AjVZB9akZYzWIvCKa0s/YdJj6/soEnRgYxwJWrrejmQ8VuvBE2AWpK0164b
	7+ISgAaFCXF5mgbaRoZFaVFItKN306pJzJd+dLhHWiPc0YJ5nx8YgLxSXw42UUlkmwjbSiL2XTB3x
	f+cd2KAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4R9A-00GEdC-Kh; Thu, 23 Jun 2022 18:01:40 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4R8y-00GEZL-S2; Thu, 23 Jun 2022 18:01:30 +0000
Received: by mail-lf1-x12f.google.com with SMTP id a2so307193lfg.5;
        Thu, 23 Jun 2022 11:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=htpW4KO87Pa3rfVeMc6d2EASyy2GIlidpaFdVmoZj4s=;
        b=Mccp92zjcX1919GaiWQ+VcL44gQ1EA9AwWWZhvKCZACiwpUQzrT5asRNoyYMMeJKeC
         yy/NqYIyPtk0agQcs5WsY9lJn2YR5/tQ19F7LTwOI6teZ09YI+MJW+vrfMnml19eJH9W
         StZkhocl5dtWKAdtG5QOWy4AoGTqZajadCgPjbh8vbjw3qjfrBxQFGbGKG1S1eFika4f
         iz3UbI46YvLKErei68dWMmN2PQPtZXRGKO8UnvCMrqWl1yG1JjteJCCwXoerzr0t2A1N
         VjVir3hJ6EXhYzrkJ65P/LA8tcdSLX4Y6vsnbVAIdq9UTFeXC3SdGD4c7gIFoLF41/ya
         hC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=htpW4KO87Pa3rfVeMc6d2EASyy2GIlidpaFdVmoZj4s=;
        b=QME6kagTWyhOTXK2fx88+p7J2rOFBueDVMg2duKT/0dEv3AWzptl3CwPxGKYQiHVyD
         wvyACwv1o5fLHsxbc+83+48Z763dzpuvpsMfGgt3s33N/dNxEYRRgjye3Z1q9gDp/581
         5sBGtiNQvWCfK7o/9aQ0P1Ht9UjIzL8SmCCfgySMeI/BQvoJYpV4pePPzxOYkycUm/4k
         /vsNVrFu5fvAUzF/z6Tjh5og4b3b7TxarsGvVUluvDR/uezgNTX+voWuQuKmzzC0JVM0
         4kt8SmQgrpB0GttcRHP9bmd0Jm4RD3j4cgCN0zZdyVmjnQvexiMSYbHs/3j02uIlPvHN
         zDmw==
X-Gm-Message-State: AJIora+Ks5Rez1w9P+IKXId+rJhuRuNYI9U8jc9wzkv6JaJ4UjL3LUap
	yqTKfHQhVJgZ+qbOSMqIZqdd+GXqoEIn3lnPT28=
X-Google-Smtp-Source: AGRyM1tGbyFaN7xD4syfsOma3gUoWvRL9AeKqEpXbVc0stZoknt2cnh9AdCxTQhuI7/2pxW4uHg+rH97OEElrDn8l58=
X-Received: by 2002:a05:6512:3183:b0:47f:79f3:af9a with SMTP id
 i3-20020a056512318300b0047f79f3af9amr6025265lfe.182.1656007284378; Thu, 23
 Jun 2022 11:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com> <20220623115631.22209-8-peterwu.pub@gmail.com>
In-Reply-To: <20220623115631.22209-8-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 23 Jun 2022 20:00:47 +0200
Message-ID: <CAHp75Vd95sEQz8y4ZcviUKaC9ic27yitR+VCwkfb38MTTe0mkg@mail.gmail.com>
Subject: Re: [PATCH v3 07/14] mfd: mt6370: Add Mediatek MT6370 support
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
X-CRM114-CacheID: sfid-20220623_110128_943713_98AC2CA8 
X-CRM114-Status: GOOD (  18.02  )
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

On Thu, Jun 23, 2022 at 1:59 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiYuan Huang <cy_huang@richtek.com>
>
> Add Mediatek MT6370 MFD support.

...

> +config MFD_MT6370
> +       tristate "Mediatek MT6370 SubPMIC"
> +       select MFD_CORE
> +       select REGMAP_I2C
> +       select REGMAP_IRQ
> +       depends on I2C
> +       help
> +         Say Y here to enable MT6370 SubPMIC functional support.
> +         It consists of a single cell battery charger with ADC monitoring, RGB
> +         LEDs, dual channel flashlight, WLED backlight driver, display bias
> +         voltage supply, one general purpose LDO, and the USB Type-C & PD
> +         controller complies with the latest USB Type-C and PD standards.

What will be the module name in case it's chosen to be built as a module?

...

>  obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)  += intel_soc_pmic_bxtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)     += intel_soc_pmic_chtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)  += intel_soc_pmic_chtdc_ti.o
>  obj-$(CONFIG_MFD_MT6360)       += mt6360-core.o
> +obj-$(CONFIG_MFD_MT6370)       += mt6370.o
>  mt6397-objs                    := mt6397-core.o mt6397-irq.o mt6358-irq.o
>  obj-$(CONFIG_MFD_MT6397)       += mt6397.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_MRFLD)     += intel_soc_pmic_mrfld.o

This whole bunch of drivers is in the wrong place in Makefile.

https://lore.kernel.org/all/20220616182524.7956-2-andriy.shevchenko@linux.intel.com/

...

> +#define MT6370_REG_MAXADDR     0x1FF

Wondering if (BIT(10) - 1) gives a better hint on how hardware limits
this (so it will be clear it's 10-bit address).

...

> +static int mt6370_check_vendor_info(struct mt6370_info *info)
> +{
> +       unsigned int devinfo;
> +       int ret;
> +
> +       ret = regmap_read(info->regmap, MT6370_REG_DEV_INFO, &devinfo);
> +       if (ret)
> +               return ret;
> +
> +       switch (FIELD_GET(MT6370_VENID_MASK, devinfo)) {
> +       case MT6370_VENID_RT5081:
> +       case MT6370_VENID_RT5081A:
> +       case MT6370_VENID_MT6370:
> +       case MT6370_VENID_MT6371:
> +       case MT6370_VENID_MT6372P:
> +       case MT6370_VENID_MT6372CP:

return 0;

> +               break;
> +       default:
> +               dev_err(info->dev, "Unknown Vendor ID 0x%02x\n", devinfo);
> +               return -ENODEV;
> +       }
> +
> +       return 0;

...and drop these two lines?

> +}

...

> +       bank_idx = *(u8 *)reg_buf;
> +       bank_addr = *(u8 *)(reg_buf + 1);

Why not

  const u8 *u8_buf = reg_buf;

  bank_idx = u8_buf[0];
  bank_addr = u8_buf[1];

?

...

> +       if (ret < 0)
> +               return ret;
> +       else if (ret != val_size)

Redundant 'else'.

> +               return -EIO;

...

> +       bank_idx = *(u8 *)data;
> +       bank_addr = *(u8 *)(data + 1);

As per above.

-- 
With Best Regards,
Andy Shevchenko

