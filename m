Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B4BC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 08:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7+haveSoq7m2f2Pj8HBweyY+n64mswSOvsdXSe1aV8=; b=3B1ZL3/yDlwzid4QOxdsxonfE4
	2DB1UJcmW1dCsc4iqHzOShk+L7mSCCRl2tSVtMGhcVyIUrALsHMN+ScMSM1+V/gcHyVY9zZS2pltG
	GQQBHVUMrj3xYJAApxsHv/+MAniBMY3dV5wv4pcdsPMoI0Jk25GoRn/Y/9CA2jwXCui976qgOdzTp
	vHzQXO/GnIH9Ymtml27G4/ytd7WaqexHACcXA328LEOoQdA9pO7gipPUAyOGbtVvQY0O9PKvmofNx
	cpNShPxrprhVC1b1FrVq94WfkmDlnpWK5xjK3EchSmrh19t1I+2QbxdoeKHhjUolBWIwNTXcsRP2n
	0EuF3QAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8FrR-007SQC-1Q;
	Wed, 29 Nov 2023 08:23:57 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8FrO-007SO8-0f
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Nov 2023 08:23:55 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5094cb3a036so8944421e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Nov 2023 00:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701246232; x=1701851032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7+haveSoq7m2f2Pj8HBweyY+n64mswSOvsdXSe1aV8=;
        b=ac38AGBQ0Qn2rn2QpedP+bUcZhuh+PLupro0c5IhtMnf2Eshh6zdOYdEpBgWrrPNIF
         be3zd0+fh+h3PHz+wNa5TOoIhcbLoiGA6P172COzm+bOUarO2iwNXBGpn06ljo/LSrhZ
         dN+nzQ2cJiUFPbD7kSd9maifsbgwcFvm/jDHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701246232; x=1701851032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7+haveSoq7m2f2Pj8HBweyY+n64mswSOvsdXSe1aV8=;
        b=lKKqdX8mRCQruK1/DA/Cin6mo/52Bemkf2hl9aL7ZaX0yrySSCIQvEmhW0JqPkI1+K
         C5AD6eyoPEXsuLG24lkA87eNL588X0STalgK1v84dgGManJPRrT9DGQuLiFxCtIhWXpx
         VJdF/6im7IgXh2diowHU38/puHvkQoo37NkSfW80DSVM9J3Xxz6onLQZT9JEO2pvJWzG
         EEKJey2baKv436qtMRviIPeSLWyaR+/CrcIUyllAurwjIWlDon1wOKCcrnrtRxeeVZAi
         JBMVawdvP+6/Nbhizo8IyOq3ifHC0VZAqYNUSCH4/n7Bg52FY4Icw/fw4R65JhyWmqnB
         QMkg==
X-Gm-Message-State: AOJu0Yxt6Kj4kv4KGZ2XjfyExfX09xSfWQU6ekvaHPElthTzwprH+0IE
	R6o2Mn/H39WNxB95pCA2kq+FGrN43/FIm342+6OqLA==
X-Google-Smtp-Source: AGHT+IEtWhB/1EU4Pgqrnwxww3bANfSl0NJ1NAjrSVHkHzZ34kpFTEDs7eij5sHcmcrKNah8R2KVsBjvlDihDkrrAjY=
X-Received: by 2002:a05:6512:3081:b0:507:a1dd:5a86 with SMTP id
 z1-20020a056512308100b00507a1dd5a86mr12720343lfd.13.1701246232561; Wed, 29
 Nov 2023 00:23:52 -0800 (PST)
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-4-wenst@chromium.org>
 <ZWYUi3Q5ptQXR0uQ@smile.fi.intel.com>
In-Reply-To: <ZWYUi3Q5ptQXR0uQ@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Nov 2023 16:23:41 +0800
Message-ID: <CAGXv+5EG4wO2sD0f_j1VDTkOcyN46oyfTYs3nf7cP7xFPg1fYQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/5] platform/chrome: Introduce device tree
 hardware prober
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, linus.walleij@linaro.org, 
	broonie@kernel.org, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	james.clark@arm.com, james@equiv.tech, keescook@chromium.org, 
	rafael@kernel.org, tglx@linutronix.de, Jeff LaBundy <jeff@labundy.com>, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_002354_248041_63F0B436 
X-CRM114-Status: GOOD (  36.15  )
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

On Wed, Nov 29, 2023 at 12:26=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Nov 28, 2023 at 04:42:32PM +0800, Chen-Yu Tsai wrote:
> > Some devices are designed and manufactured with some components having
> > multiple drop-in replacement options. These components are often
> > connected to the mainboard via ribbon cables, having the same signals
> > and pin assignments across all options. These may include the display
> > panel and touchscreen on laptops and tablets, and the trackpad on
> > laptops. Sometimes which component option is used in a particular devic=
e
> > can be detected by some firmware provided identifier, other times that
> > information is not available, and the kernel has to try to probe each
> > device.
> >
> > This change attempts to make the "probe each device" case cleaner. The
> > current approach is to have all options added and enabled in the device
> > tree. The kernel would then bind each device and run each driver's prob=
e
> > function. This works, but has been broken before due to the introductio=
n
> > of asynchronous probing, causing multiple instances requesting "shared"
> > resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> > time, with only one instance succeeding. Work arounds for these include
> > moving the pinmux to the parent I2C controller, using GPIO hogs or
> > pinmux settings to keep the GPIO pins in some fixed configuration, and
> > requesting the interrupt line very late. Such configurations can be see=
n
> > on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> > Lenovo Thinkpad 13S.
> >
> > Instead of this delicate dance between drivers and device tree quirks,
> > this change introduces a simple I2C component prober. For any given
> > class of devices on the same I2C bus, it will go through all of them,
> > doing a simple I2C read transfer and see which one of them responds.
> > It will then enable the device that responds.
> >
> > This requires some minor modifications in the existing device tree.
> > The status for all the device nodes for the component options must be
> > set to "failed-needs-probe". This makes it clear that some mechanism is
> > needed to enable one of them, and also prevents the prober and device
> > drivers running at the same time.
>
> ...
>
> > +#include <linux/array_size.h>
> > +#include <linux/i2c.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
>
> init.h for init calls.

Added to next version.

> > +static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
> > +{
> > +     for (size_t i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
> > +             if (of_machine_is_compatible(hw_prober_platforms[i].compa=
tible)) {
> > +                     int ret;
>
> Perhaps
>
>                 if (!of_machine_is_compatible(hw_prober_platforms[i].comp=
atible))
>                         continue;
>
> ?

Works for me. One less level of indentation.

Thanks
ChenYu

> > +                     ret =3D hw_prober_platforms[i].prober(&pdev->dev,
> > +                                                         hw_prober_pla=
tforms[i].data);
> > +                     if (ret)
> > +                             return ret;
> > +             }
> > +
> > +     return 0;
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

