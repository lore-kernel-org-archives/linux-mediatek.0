Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0004FC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 11:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WM+zWzeYAitwMFZLUVsc8lp6MA3Zpo/kJcizrD/8ssk=; b=jBNz2oBRvZHe3BNRIp0YrM0YJt
	QDRe49Uj+t5UWW1OG9iI2BC/pRpic2QNTT15OcuVjcAHxZQW/lh+IqIM0PfC38WKT+QCcS1+L4Jza
	pgB5wZoycv9TvqRj0wXuGPiF2OMU73KH6trr7RrdHHasso+GkQVhe+MvnuaEWebhtcLc8zANk6fdo
	fENrvuSv4qJLsA6Jswbdtl8dK+EHt8BXvGxYLxMuTrq6CmBwem0yBiGbxLPhnQwgp8v4OFtzBP1T6
	qspBXhBg7SKVGlAywYxe9z9M4tIvqj+fnXVziLHs4ie71GdfcR7zmbG0OEtTjv4a3L24hxaX0PO+0
	Rddypx9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDP61-00CuXw-Do; Mon, 18 Jul 2022 11:39:29 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDP5m-00CuP8-By; Mon, 18 Jul 2022 11:39:15 +0000
Received: by mail-ed1-x531.google.com with SMTP id w12so14804193edd.13;
        Mon, 18 Jul 2022 04:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WM+zWzeYAitwMFZLUVsc8lp6MA3Zpo/kJcizrD/8ssk=;
        b=OvcuKUIjR4uhqpfL8lpsxLQ88mCYxcDOZ5lSaz8YMU5SyNSpWm2LhWIoS9CC+qDuiX
         DI/fnwo811XGeH4U+R290EOyJleoAHOZMLhaBd4hEdDGJHO0ZVerBEE3gVl6te9BpcT4
         KyyXCEIlVZI9vzIm3Fjqb3WD+Kz4vqa72ux+kIiV8AtKAdtI87dFPLp0/j+Mpfxof+su
         lev/A8157qmlXkCgs9+5cRS0ruqiTC3/PHuZcO3JHcb+eMLKX823Z/MyUYWDhywL+lc6
         ZEQD7h68BhRbIcXy5EQnFOo4JXLrkrtrSYjrBnXa5BTwwYZFNpiLwNcI86j6oai3JcHf
         Kb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WM+zWzeYAitwMFZLUVsc8lp6MA3Zpo/kJcizrD/8ssk=;
        b=ohhmWxdHQH3GiRBxNwPlaUmMk4xouVa5aQot2vTXCvEoEq2Sg8GY3lyml8q9SwqFC/
         rPUByulX3l7lMCaubPTahwukim/oJgeEnAGuLNkWBMQcYtXRMdlWcsOsO6owWXoNdBNJ
         /e0fksD0S53w0+gtVuFy1AXdZZJQb+xhbD2W8Dw9LivOkRXL8mvj+CvFUZ8/OVWU5PhY
         quAghxuNx0ZxjC5G1Ofw9ffNyOibPD3F1A/1KIeqCQPWbJ2Xn9QIkk4fw1+EfkwFVRtq
         qn5xA/3HdYdgDStEfoAnSB5kdKoDJ1P5agYw9tlGD3EddXhcLWYDajyHTf50kPsE4t3f
         bMtA==
X-Gm-Message-State: AJIora9n92h/W29LE8c8fktT66e8SfuOKXdyBE5+6SEynuiy5NySjYx0
	lcWOYUn9np+KVE2ZNVQ0rgwmO8SBqI8vGirAPGc=
X-Google-Smtp-Source: AGRyM1uLSUr+2lvxiCg3cwvu9VMJCLD+uDi8ZOzhv3dgH0XROSPP5YW44n0Pb3saV+i0UvUB6nImoWisC6NYG7PACSY=
X-Received: by 2002:a05:6402:34c5:b0:43a:8f90:e643 with SMTP id
 w5-20020a05640234c500b0043a8f90e643mr35599070edc.88.1658144351737; Mon, 18
 Jul 2022 04:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220715112607.591-1-peterwu.pub@gmail.com> <20220715112607.591-9-peterwu.pub@gmail.com>
 <CAHp75VdCgdTOu-CdNo9XGY+PrhPh93v_CkAHJC6hkArsKeiXbA@mail.gmail.com> <20220718080831.GA31509@cyhuang-hp-elitebook-840-g3.rt>
In-Reply-To: <20220718080831.GA31509@cyhuang-hp-elitebook-840-g3.rt>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 18 Jul 2022 13:38:35 +0200
Message-ID: <CAHp75Ve2_UcS9e3pJC2j4FBc21=S8878tQusyxNV1mXtQG423w@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] usb: typec: tcpci_mt6370: Add MediaTek MT6370
 tcpci driver
To: ChiYuan Huang <u0084500@gmail.com>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
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
X-CRM114-CacheID: sfid-20220718_043914_456523_A26D881B 
X-CRM114-Status: GOOD (  27.98  )
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

On Mon, Jul 18, 2022 at 10:08 AM ChiYuan Huang <u0084500@gmail.com> wrote:
> On Fri, Jul 15, 2022 at 03:10:42PM +0200, Andy Shevchenko wrote:
> > On Fri, Jul 15, 2022 at 1:28 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:

...

> > > This commit add support for the Type-C & Power Delivery controller in
> >
> > This commit add -> Add
> >
> Upper case? Or rewrite it as 'This commit is to add .....'?

Please, read this documentation [1] for better understanding. It
should clarify this and perhaps other possible questions.

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

> > > MediaTek MT6370 IC.

...

> > > +       ret = devm_request_threaded_irq(dev, priv->irq, NULL,
> > > +                                       mt6370_irq_handler, IRQF_ONESHOT,
> > > +                                       dev_name(dev), priv);
> > > +       if (ret) {
> >
> > > +               tcpci_unregister_port(priv->tcpci);
> >
> > This is wrong.
> > You mixed devm_ with non-devm. Either drop devm_ *after* the first
> > non-devm_ call, or convert everything to be managed.
> >
> How about to add 'devm_add_action_or_reset' for tcpci_unregister_port?
> This will convert all as 'devm_' version.

I think it would work, that wrapper was designed to cover cases like this.

> > > +               return dev_err_probe(dev, ret, "Failed to allocate irq\n");
> > > +       }

...

> > > +static int mt6370_tcpc_remove(struct platform_device *pdev)
> > > +{
> > > +       struct mt6370_priv *priv = platform_get_drvdata(pdev);
> >
> > > +       disable_irq(priv->irq);
> >
> > Why?
> > An ugly workaround due to ordering issues in ->probe()?
> >
> Yes, due to the ordering in probe.
> 'bus remove' will be called before device resource releases.
>
> Like as you said, another way is to convert all as non-devm
> version after 'tcpci_unregister_port'.
>
> If to keep the original order, 'disable_irq' before
> 'tcpci_unregister_port' can make the flow more safe.
>
> Or you can think one case if irq triggers after
> 'tcpci_unregister_port'. Null pointer occurs.
>
> Anyway, in next revision, I'll convert all to be 'devm_' version.
> For this remove callback, only 'dev_pm_clear_wake_irq' and
> 'device_init_wakeup' will be kept.
>
> Is this better?

Sounds like a plan!

> > > +       tcpci_unregister_port(priv->tcpci);
> > > +       dev_pm_clear_wake_irq(&pdev->dev);
> > > +       device_init_wakeup(&pdev->dev, false);
> > > +
> > > +       return 0;
> > > +}

-- 
With Best Regards,
Andy Shevchenko

