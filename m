Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88507C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 20:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7pfQddT00wwybN55WXtE8jeGfJuRCDhkTs8A9N9Avc=; b=YJoYyJAkY5G8ClpguW+v/q3J95
	4oWBpdEUfuG+IJkIFd1HJ5fVod3oEN1n0kP5XkDUME34SQV+uWN7pYkagcSMTENsNLIBF3v2MjPF3
	UU8GxSYqEcm/0pk9pjHd34CTzUMqw/7o56xbbFrsZRWl0LEWYBMSUGTeqIn2IQIHS7fI0lfHunLA+
	ENMfY3u2LrAecysENjiC/DmYWLxdEv4if75tRYCrEP8qHY8tzMHpeSYSTLqpuisPHBsQFupG3LqRR
	2c+BaLQ5q2O5EZIRLPfoDNtElteOzL/HT3oX9rf7izMtZ0TRcvo2wd2iq4rLwzrRPCwZ564WL18I+
	W8Zfja7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8SoC-00CE7S-Ah; Mon, 04 Jul 2022 20:36:40 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Snz-00CE2I-4c; Mon, 04 Jul 2022 20:36:28 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id o2so13272595yba.7;
        Mon, 04 Jul 2022 13:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i7pfQddT00wwybN55WXtE8jeGfJuRCDhkTs8A9N9Avc=;
        b=juo7rzkgyOnogzMhLYCktRvFpSFkP3vvhbMY8Uk0vJKYeWueIKW+lWdoXP3yLwbds6
         vcrr5NUqPVbQnT0hwWaYs4EEj2Nkh5SCjrFrs18UN6hZAi3OYtxjuCQlEQvAQUlc9Dpv
         J7v71ibaYThmJdJsc986feiZcZN+aEpDukUNqgPRhJF8LMCaE4eeOYQA30SWbqQhe9N9
         uD2O3yv/dhvIOAfc/Yh+JrL6jYRzMb9TGUOPIk36TgGFoLO92g7jiweWYexkxNNBIGdE
         16csuxysxq+iUAOhEZmurW/lnrwSZZbdImIhQoMrVi+ukTjz9HsWjjHwlR4I1VW1mjTI
         xbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i7pfQddT00wwybN55WXtE8jeGfJuRCDhkTs8A9N9Avc=;
        b=mKa0nDX0vhZktQnRuVoKmqroSusGLPiwB/Gf08gxsu0v/XL5/8UmSyichHD300Yze0
         BjkFKa9o62vgyK9kWbm68vWlUwaEnlICmU1O5oqL1bQoh3BWmPP/+ix81cq6zg8bnyy7
         KKi9wWPqYIoulPeCNkq54MGWgxo1kEnptj+GodbcA2CFv5jEegVxv/bnmE+0uHCCmzSY
         T4j/yaaKjQFrRIlOmO8q4Lm8FZrpzwUWILGIEZpRxU4MDcsqLXc+08JVJkFB+bw/NR4y
         QhsYG8yJwrvblDj9goY3qkunHEzX3EwjBL9tj74vsGheEBQuTLIwqwfWqxzLuXf/aZ7v
         0/Xw==
X-Gm-Message-State: AJIora99PdIWAmYvqZ2aS2zv14n54V6jidbTlZHkTqMRZZf4PsuTvdqh
	Ftz2X5M9hYpXfF1gE+MkHIMkyKPPt1vXC+UvCmw=
X-Google-Smtp-Source: AGRyM1u/kp8kfUd0nPXCHFP2i3Eix2PxxDcpp8y9ipLkrPPb23jLPB36f0GfOZtN0YbNTf6oiGSAGugY2K6v9bhH1+c=
X-Received: by 2002:a5b:68a:0:b0:66e:472a:83f4 with SMTP id
 j10-20020a5b068a000000b0066e472a83f4mr8583937ybq.570.1656966985988; Mon, 04
 Jul 2022 13:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com> <20220704053901.728-10-peterwu.pub@gmail.com>
In-Reply-To: <20220704053901.728-10-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Jul 2022 22:35:47 +0200
Message-ID: <CAHp75Ve+-ht6J5PZXS1jO1qfxn6Nfd2wDfuW-NsigR_k7iRJGg@mail.gmail.com>
Subject: Re: [PATCH v4 09/13] iio: adc: mt6370: Add Mediatek MT6370 support
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
X-CRM114-CacheID: sfid-20220704_133627_243877_AEF60EF5 
X-CRM114-Status: GOOD (  15.10  )
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

On Mon, Jul 4, 2022 at 7:42 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> Add Mediatek MT6370 ADC support.

...

> +         This driver can also be built as a module. If so the module

If so,

> +         will be called "mt6370-adc.ko".

No ".ko" part.

...

> +#define ADC_CONV_TIME_US               35000

Since it's actually MS, drop this and use MS * 1000 whenever it's needed.


> +#define ADC_CONV_TIME_MS               (ADC_CONV_TIME_US / 1000)

...

> +static int mt6370_adc_read_label(struct iio_dev *iio_dev,
> +                                struct iio_chan_spec const *chan, char *label)
> +{
> +       return snprintf(label, PAGE_SIZE, "%s\n",
> +                       mt6370_channel_labels[chan->channel]);

sysfs_emit()

> +}

...

> +static int mt6370_adc_probe(struct platform_device *pdev)
> +{
> +       int ret;
> +       struct mt6370_adc_data *priv;
> +       struct regmap *regmap;
> +       struct iio_dev *indio_dev;

Per all your patches, use reversed xmas tree ordering ("longest line
first" rule).
Also it may be good to have a temporary variable for struct device pointer.

> +}

...

> +MODULE_DESCRIPTION("MT6370 ADC Drvier");

Driver. Spell check your patches.

-- 
With Best Regards,
Andy Shevchenko

