Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016EBC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 13:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5GaiY4B+fVcmnXKAwsi7m8Aj4lGUBvR7I/9W6/qWXhE=; b=0ZPRFhwv1hkdl4z0HV14DaOySa
	TzcM4/3A2SI8FZAnRb6/89YA7xs+qNdRs7n88eYH+ax/HFQG8eehWQHvJD2NIYIx/wxByVrPXcEXi
	hYK1U4qKK0Y4yegFoNeublQL4U9nCiidJeDyE8+/Vm5o5T3yT0lftL9parEU7CCsu9ksdncsxousg
	HmPEIA8lYTUn1buHG3OPvI4txjVgseOGbnmsweW9AVJw/zkXc0iuIfRJzf5UT8aSAUnHAyAGybjgT
	CYYG/eA+cRB2jZqv1AJKpbIXoMG3qzhsYD1WYKTX2XSap3IHuyFa2u2EUHU1BoyqKzIY3cETKRfjj
	6csyxSTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDRF4-00E58e-6f; Mon, 18 Jul 2022 13:56:58 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDREc-00E4YP-5A; Mon, 18 Jul 2022 13:56:31 +0000
Received: by mail-wm1-x330.google.com with SMTP id x23-20020a05600c179700b003a30e3e7989so5205395wmo.0;
        Mon, 18 Jul 2022 06:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5GaiY4B+fVcmnXKAwsi7m8Aj4lGUBvR7I/9W6/qWXhE=;
        b=d6a2HGJ1DOesvRkrVZgSQ6iPEldBTUlBgQ9k3NnGUVcyNgxyKIcTc2kdsPDQKUOOsh
         4J/nvEVxTTl0E4onnZS0zUwKWxO9pjnNCxaD0wWN9PVUybjFPl6RI42KIuQHh4vfkShP
         fJQlXkKDNfpR7KD5Tx3SaGwhuYeDulAK9P9Z9Y+u2LOt3QOnTyc5mgmLl+C/m4bqct+H
         giOxHhFobOt82+YV6AxC1RpEI/zA+Ycz3NIWz/ErQN2V/axhvGGex1JNxkWjgMyy5t2n
         hhs2muTFQoUTJSosvO9Qpp180LKtT7CoNF5pYFKvDX2EJhZBU36QFMOIJKTt5qcIpZQi
         /qwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5GaiY4B+fVcmnXKAwsi7m8Aj4lGUBvR7I/9W6/qWXhE=;
        b=UYyzb4zb30tW6/yFKxB0wC7dGR1Fougv4FQRfECkJC5+EWmcHazLqV28Ww7rhESv86
         uoYe7llbxQYfZSBxv+yjespsizBvykyOsGC7yohBoYIC9UKY/NuxQ9NCX+Cuq1+8U+ae
         ePNX3k8kihCxMpuomFRMFFIkiJk80AxQ6pmZOl1danwd7G/gy446SLEYuIcOzZrmj+hf
         pEOpZ1YLnaHeQcnmSXXsacN2d96jOJC8HUmnNgQ/unvKyDmvcjxdNL/hNO9C1/ga0uoE
         RI4uWFEGlHe4hewLCiKZWJLmQdiQS0SK8rAOUT2HzmTAvZDHADiqIIBsDYh45pNews3G
         x9mQ==
X-Gm-Message-State: AJIora/qtkzUXGOELvsoAPhWinZSiXNDJtoIWfx6vJL23PUwNVdFt/yk
	/t8qBR+WvWwLvCt+ERjtk7sSNfTHt4h5wP4j6l4=
X-Google-Smtp-Source: AGRyM1t+b+B57G30zmJ6SDH+MUo5HsflVXfg85sd+e8uS0SrrTs9lUsnJSmOWUJajxJe7O8JYC1jvg/HjWwDmFR7Nok=
X-Received: by 2002:a05:600c:19c8:b0:3a1:792e:f913 with SMTP id
 u8-20020a05600c19c800b003a1792ef913mr32475753wmq.182.1658152587885; Mon, 18
 Jul 2022 06:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220715112607.591-1-peterwu.pub@gmail.com> <20220715112607.591-9-peterwu.pub@gmail.com>
 <CAHp75VdCgdTOu-CdNo9XGY+PrhPh93v_CkAHJC6hkArsKeiXbA@mail.gmail.com>
 <20220718080831.GA31509@cyhuang-hp-elitebook-840-g3.rt> <CAHp75Ve2_UcS9e3pJC2j4FBc21=S8878tQusyxNV1mXtQG423w@mail.gmail.com>
In-Reply-To: <CAHp75Ve2_UcS9e3pJC2j4FBc21=S8878tQusyxNV1mXtQG423w@mail.gmail.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Mon, 18 Jul 2022 21:56:15 +0800
Message-ID: <CADiBU3-DbJpD_pyGaOsh8EF=0NpCWgUP5T=RHgxXzwqZzwCyQA@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] usb: typec: tcpci_mt6370: Add MediaTek MT6370
 tcpci driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_065630_238020_55C63AF5 
X-CRM114-Status: GOOD (  31.28  )
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

Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=E6=9C=
=8818=E6=97=A5 =E9=80=B1=E4=B8=80 =E6=99=9A=E4=B8=8A7:39=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Mon, Jul 18, 2022 at 10:08 AM ChiYuan Huang <u0084500@gmail.com> wrote=
:
> > On Fri, Jul 15, 2022 at 03:10:42PM +0200, Andy Shevchenko wrote:
> > > On Fri, Jul 15, 2022 at 1:28 PM ChiaEn Wu <peterwu.pub@gmail.com> wro=
te:
>
> ...
>
> > > > This commit add support for the Type-C & Power Delivery controller =
in
> > >
> > > This commit add -> Add
> > >
> > Upper case? Or rewrite it as 'This commit is to add .....'?
>
> Please, read this documentation [1] for better understanding. It
> should clarify this and perhaps other possible questions.
>
> [1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.ht=
ml#describe-your-changes
>
I'm thinking why to change it from 'add' to "Add'.
Ah, I misunderstand it.
> > > > MediaTek MT6370 IC.
>
> ...
>
> > > > +       ret =3D devm_request_threaded_irq(dev, priv->irq, NULL,
> > > > +                                       mt6370_irq_handler, IRQF_ON=
ESHOT,
> > > > +                                       dev_name(dev), priv);
> > > > +       if (ret) {
> > >
> > > > +               tcpci_unregister_port(priv->tcpci);
> > >
> > > This is wrong.
> > > You mixed devm_ with non-devm. Either drop devm_ *after* the first
> > > non-devm_ call, or convert everything to be managed.
> > >
> > How about to add 'devm_add_action_or_reset' for tcpci_unregister_port?
> > This will convert all as 'devm_' version.
>
> I think it would work, that wrapper was designed to cover cases like this=
.
>
> > > > +               return dev_err_probe(dev, ret, "Failed to allocate =
irq\n");
> > > > +       }
>
> ...
>
> > > > +static int mt6370_tcpc_remove(struct platform_device *pdev)
> > > > +{
> > > > +       struct mt6370_priv *priv =3D platform_get_drvdata(pdev);
> > >
> > > > +       disable_irq(priv->irq);
> > >
> > > Why?
> > > An ugly workaround due to ordering issues in ->probe()?
> > >
> > Yes, due to the ordering in probe.
> > 'bus remove' will be called before device resource releases.
> >
> > Like as you said, another way is to convert all as non-devm
> > version after 'tcpci_unregister_port'.
> >
> > If to keep the original order, 'disable_irq' before
> > 'tcpci_unregister_port' can make the flow more safe.
> >
> > Or you can think one case if irq triggers after
> > 'tcpci_unregister_port'. Null pointer occurs.
> >
> > Anyway, in next revision, I'll convert all to be 'devm_' version.
> > For this remove callback, only 'dev_pm_clear_wake_irq' and
> > 'device_init_wakeup' will be kept.
> >
> > Is this better?
>
> Sounds like a plan!
>
Already did. Just to double confirm the changes.
Thanks. All are clear.
> > > > +       tcpci_unregister_port(priv->tcpci);
> > > > +       dev_pm_clear_wake_irq(&pdev->dev);
> > > > +       device_init_wakeup(&pdev->dev, false);
> > > > +
> > > > +       return 0;
> > > > +}
>
> --
> With Best Regards,
> Andy Shevchenko

