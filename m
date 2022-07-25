Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C9CC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cFBmHW3aWYSVzhv+dCF1Vjg7vV6HTDbULFzKNdh7eA=; b=B5DlL9YMHeiswu9rS+HAdHygUK
	iImAljU0zcSRMHbONnQJ+QHgPZWsYep6iQIZf5chYx/JXPUwjpphITvc+B3ko0q/95tYFtFyjdQmA
	ZtZqVeX1L8kFoLwrogvp65jtUKLQgmKKZowc1P/qVb3t5rSLTFLtpdIbWw9bwHq0OvcvvGHRmgX2S
	f8aPidQfCAOc/iec0yoJUUTsVEqdxAr1qlUst6zzvE4/XWwZ0jzCxEhgMfFUzkOKpSBsRadlP+ZrH
	1Ul/3uUdtiZBL8I4OSUjcVNmG9YSgMZAJtSZNe9wCtzW5pfG208BdL30X53ZYpuz9boHJ+PZJnsMH
	TLs+kAKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFt0l-006RyY-UW; Mon, 25 Jul 2022 08:00:19 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFt0U-006Red-P2; Mon, 25 Jul 2022 08:00:04 +0000
Received: by mail-ej1-x62e.google.com with SMTP id tk8so19068607ejc.7;
        Mon, 25 Jul 2022 01:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/cFBmHW3aWYSVzhv+dCF1Vjg7vV6HTDbULFzKNdh7eA=;
        b=D59brI8ncH+WCdwU0Nfnk9ctLnRDZ3UUdc+xeXG2BjO1rrMZJ0I+JhW0C2WVRsU6I7
         ahgas2HVf3s+Q1M1+toqG4BgdFjA14FX2WipfWZqqPlpU/p57MdP2KZYLh9lAwA5I3P2
         78VXDrlkxZllvMa8g5WSechgcttVRJFweVlLmJ6o0bSzPej2NwYO4DbX/BcfTjOk0y/T
         XpvbkQ4bjio6MMumjuisV+WVTBnLQJzUwpW1vfpHFzzVndm/NE5Ss1d3hZjedpOJXc7m
         LuSKiZVCLZQUmdrfrVkrncRSqXCACm1BmRyqtDh1etSR8scG0DGif8X1+PGv78ob7tYR
         qx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/cFBmHW3aWYSVzhv+dCF1Vjg7vV6HTDbULFzKNdh7eA=;
        b=cXH4C6MWbKD9hFdl5+No8ZjPjPcXm2CX6WatFgQ+LuGg4e2CQtsakpM8qEXtm7KNqX
         WccpzzRxnSsCJy8y2ml70BNFvn229qTk941QZzfnSN8uIoyVibYcWbaPpoBaLOolh5+s
         MrPkCZrk1deyHc/94scepoMLnh9otoQs6jHMvPjfbC3Y8HQHPDv+vhMkW7Aba4qAwLyz
         edn25NdXl0p74mWLBVgnTLQZrShzMCsSBVp8omSh2CD/SU2ic30gVgHsBHiDy19gdqZ8
         14QLmONiFtUt39zpzKVq88q6heMm4anA1c6dxTf67oI/0HAEKQecXGTb3RlcuT2Nq1kX
         +sNA==
X-Gm-Message-State: AJIora8WJvPgSc4bV3YwbWntbH3R5V+e/bF1k3FrshtmPgHpTvYuIkIA
	hAUtu6XkK4vsmb0oLrFOYf6e7YItbAZ1MhqQP7E=
X-Google-Smtp-Source: AGRyM1unetnhWIzb3en09GsAOIg0xuhKBXgSQV7z/NkK9g6NHIamuCgYKepx6i2vYNKCBrnrnWiAXWzNdcPwAolpJPg=
X-Received: by 2002:a17:907:75da:b0:72b:3ce0:2524 with SMTP id
 jl26-20020a17090775da00b0072b3ce02524mr9140700ejc.394.1658735999558; Mon, 25
 Jul 2022 00:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-8-peterwu.pub@gmail.com>
In-Reply-To: <20220722102407.2205-8-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 09:59:23 +0200
Message-ID: <CAHp75VfiKMROzxeEaCH6qCthK9qanJPqbjADLMVH-V0upKf+9Q@mail.gmail.com>
Subject: Re: [PATCH v6 07/13] mfd: mt6370: Add MediaTek MT6370 support
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
X-CRM114-CacheID: sfid-20220725_010002_856765_6658CF49 
X-CRM114-Status: GOOD (  12.16  )
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
> From: ChiYuan Huang <cy_huang@richtek.com>
>
> This adds support for the MediaTek MT6370 SubPMIC. MediaTek MT6370 is a
> SubPMIC consisting of a single cell battery charger with ADC monitoring,
> RGB LEDs, dual channel flashlight, WLED backlight driver, display bias
> voltage supply, one general purpose LDO, and the USB Type-C & PD controller
> complies with the latest USB Type-C and PD standards.

...

> +#define MT6370_REG_DEV_INFO    0x100
> +#define MT6370_REG_CHG_IRQ1    0x1C0
> +#define MT6370_REG_CHG_MASK1   0x1E0
> +
> +#define MT6370_VENID_MASK      GENMASK(7, 4)
> +
> +#define MT6370_NUM_IRQREGS     16
> +#define MT6370_USBC_I2CADDR    0x4E

> +#define MT6370_REG_ADDRLEN     2
> +#define MT6370_REG_MAXADDR     0x1FF

These two more logically to have near to other _REG_* definitions above.

-- 
With Best Regards,
Andy Shevchenko

