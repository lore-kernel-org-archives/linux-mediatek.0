Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCB4C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5rSRKJzZCEe75lE89H4BacTqhlHPMQzJe7RV2ORfWI=; b=QZD2nrzwYVmrU8sdCcfuTPfqwE
	BFnmXa3kfeQpERGrW1FuJb8HKSoA1OJfQG8pvIKBwUmyvvBn3Y4JwSLYj63hKkREd9wLPIK7qzXvc
	zNZnuSKp8WB2lpFUj93D1l/ZA9XoWsb/gRrOb0y1AURuWXs/BaoLlSt6m7kKJ8yM1zCBEnwOv2Rqm
	Y5SwZgB5tYcUkWVDgtnUfbZwpJJyphVzk+NWERnc5m1yE5srnxlkt0EWu/xsiC+b6rFgBjeVbVhGf
	MEhOH3SFAumiXQztLDZbj025bZdovkc3Le0NlSFj4jKMIUHYtvS5jZBSrverebzB6IPqfDvRFT2Gu
	PFXOkOvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtQK-006peE-53; Mon, 25 Jul 2022 08:26:44 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtPO-006ono-Es; Mon, 25 Jul 2022 08:25:47 +0000
Received: by mail-ej1-x636.google.com with SMTP id ss3so19104795ejc.11;
        Mon, 25 Jul 2022 01:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J5rSRKJzZCEe75lE89H4BacTqhlHPMQzJe7RV2ORfWI=;
        b=BNlVjsxRro5TG97838xZbVcQ/pG/LD+g/7G/AjwrIrlPvPS37j9HRk59ZPvQZFMbo9
         MnOMniee2k168J7vlVevltwedsYw1fwJcNYMweUNuLPFL7JEp9m9CEssAgQLNBEXPpLX
         65np3ghAZ/JI0ou7IY+VAdXdeEM9Dx5l6K3VMtdxVw5MaZ+JcN9Mz6qTKX+a72GlbThf
         YgqMy4pPKGjxlN3v8ojq6p7cX1h0ysW9lnKZ5pLCEPb56UCWlozkB+OoACaoaIIUBRbZ
         /V/wW4p+YYsXXLnpTvXofuXoBPwxmOEVHWVRTZH6OK6PGjSYJaBn82vKtB7a1B3eaVvy
         gAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J5rSRKJzZCEe75lE89H4BacTqhlHPMQzJe7RV2ORfWI=;
        b=q1M6hxfrhEBlbk5YSKXiv5QlMj1izcYvRD5eBSCYqRZgD7DsYGafjBVVrikdc+Tdwk
         rTjEi1yNTE6UwdPevO5hbXaN8QH8MJlhrBB7FD02M+Xr4DzLlM+VHMCLd6hTHSnaALGQ
         6So6yd3TTWxvI6MuPPnE7QhmrfEJ8Y+miwRsLbUEJZRt5yPF/FMgARKWGtZ4qRpgza/j
         KwfqVlwdAD73YHSCPxiD3Dhhb5v5IhbrmDuDgVSv9Zk0XUs7z0Do6uhQKmNgx8KrkICI
         nooZvDgjuBBttCRzn9SHvc/J9c0HjyfSFpm/BqmQaZ11N17MswWU237PExyarZ+Znv0U
         4SyQ==
X-Gm-Message-State: AJIora+SfjA8o/+XOG/cwO2rvmPJkKICTVdT1bOi4+THnRStl7TmrpZx
	OxF+zV5+pa8mob7Fh0Z0m0vK8eUJXezxsoINcF8=
X-Google-Smtp-Source: AGRyM1tb8lf0258KwCgCSc1j2TNtucrsLChWD53/F5ZAYHmenBBMp0FJqJ/Hs5trX2iqStdOTyF6IVkbw5ytFnaOucM=
X-Received: by 2002:a17:906:8a4a:b0:72b:5b23:3065 with SMTP id
 gx10-20020a1709068a4a00b0072b5b233065mr9396194ejc.557.1658737543426; Mon, 25
 Jul 2022 01:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-11-peterwu.pub@gmail.com>
In-Reply-To: <20220722102407.2205-11-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 10:25:06 +0200
Message-ID: <CAHp75VeafmppD=Ge-kGZ7ab8=P9p5wmZXi_1fKFf+1uVA-SNog@mail.gmail.com>
Subject: Re: [PATCH v6 10/13] power: supply: mt6370: Add MediaTek MT6370
 charger driver
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
X-CRM114-CacheID: sfid-20220725_012546_548629_96710DAF 
X-CRM114-Status: GOOD (  18.34  )
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

On Fri, Jul 22, 2022 at 12:25 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
>
> This adds MediaTek MT6370 Charger driver support. The charger module
> of MT6370 supports High-Accuracy Voltage/Current Regulation,
> Average Input Current Regulation, Battery Temperature Sensing,
> Over-Temperature Protection, DPDM Detection for BC1.2.

...

> +static inline void mt6370_chg_enable_irq(struct mt6370_priv *priv,
> +                                        const char *irq_name, bool en)
> +{
> +       int irq_num;
> +       struct platform_device *pdev = to_platform_device(priv->dev);
> +
> +       irq_num = platform_get_irq_byname(pdev, irq_name);

Every time the IRQ is not found you will get an error message printed here.
1) Is IRQ optional?
2) If not, can't you do validation only once?

> +       if (irq_num < 0)
> +               return;
> +
> +       if (en)
> +               enable_irq(irq_num);
> +       else
> +               disable_irq_nosync(irq_num);
> +}


...

> +       ret = mt6370_chg_field_set(priv, F_USBCHGEN, 0);
> +       if (ret < 0) {

> +       ret = mt6370_chg_field_set(priv, F_ICHG, 900000);
> +       if (ret < 0) {

> +       ret = mt6370_chg_field_set(priv, F_IINLMTSEL, 3);
> +       if (ret < 0) {

Do all these ' < 0' parts make sense?
(Not only these cases, but in many in the entire driver)

...

> +       /* Check in otg mode or not */

OTG

...

> +               ret = devm_request_threaded_irq(priv->dev, ret, NULL,
> +                                               mt6370_chg_irqs[i].handler,
> +                                               IRQF_TRIGGER_FALLING,
> +                                               dev_name(priv->dev), priv);

> +

Redundant blank line.

> +               if (ret < 0)
> +                       return dev_err_probe(priv->dev, ret,
> +                                            "Failed to request irq %s\n",
> +                                            mt6370_chg_irqs[i].name);
> +       }

-- 
With Best Regards,
Andy Shevchenko

