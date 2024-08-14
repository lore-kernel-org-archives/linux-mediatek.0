Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF220C52D7B
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Aug 2024 10:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQxN/7VWNI1muBwzClG5Zirbw85McBRj904vS8Fpu0c=; b=GuH2GajmWpeBTu4OSyjDEFWz7I
	1qYbjlCm7B89G/8BkINaCwJIDsO2pfNW6HhdVU0GnYLkLULSOJLWoAzBszWUDBit91dJXHS1+rKhy
	lnSUv8QXtzX2WH857yCGVBB4/bhKZ1A74OXwaBoXwyv0sLEpV2irLX10k+Bo5bnjzHIp00CZSWFPv
	wwimKvKtrkR9hGJzvU7svk3UAk0rq3SILUztf1qpkK3KAEr+MKk5hx0xutFXnDsbRPGNBHBvA2H04
	OviGkXPXAjD8TfUSJPf+RYmWi8z9Sr7+mmnYnqg5G0KM+N6A4snqKDSN2MKABvjZRjrTqmereeWRN
	D8ArP/6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seAy2-00000006Wgz-1gxb;
	Wed, 14 Aug 2024 10:10:58 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seAxN-00000006WW0-2wi0
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Aug 2024 10:10:19 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2f025b94e07so76185211fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Aug 2024 03:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723630215; x=1724235015; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQxN/7VWNI1muBwzClG5Zirbw85McBRj904vS8Fpu0c=;
        b=OAuJAKrel3Y66HmgEvr8USn3u1O+wP0QbkX519kOpimytp2CGcUfFXO49OOrPS5u/i
         YGk2S9AFNIFzBFEqZECskFfeUz4qtTtQFibed7DvUXd3AGopRB6dCWCguTk05LifdQF6
         enRNKjOuUQiC7Tm2QNOnTFKlCuBiaTAgbqu10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723630215; x=1724235015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQxN/7VWNI1muBwzClG5Zirbw85McBRj904vS8Fpu0c=;
        b=HVmvj6IzAVJt9yCcNZGI3yxko03JFGq7FxEj72LtcrNLu33+XV+3vCD9TvgHNz9gVG
         xB4t16yO8C2W+64vDFNr3RDJinbh/scTk3YsxREM6J5UMYsNfKwmB0imhcvohqod7q7j
         aYvkfP0Umli9AMLIi3A3f0O6xpzAWvG3FSbnozAybXTxsXT62Koc0mbEr8AZHLsu5p9C
         nJ9822zc8xs1Ut451DfrAXqp7c2YmHtpbXkVtPwIqUM8ZBcfHJCijzOH/vp6XqUF8667
         +pOSov9T/4zJe0ZgkHVKGqP7nc2vOb9noT/9+mclBzZW+JezCt0qmow5wh2h8XKAcDhU
         RiDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXzOLngJ4qBhlJw8uRfHR7463Mvm8LvPp6rZmcDN0y177Ms2fF+xKFSTBFGA1XE5vMrsOqqwdsWOulY1R3mA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9HUvL0RoBCA6JrNkSpqgWj4MAM/+awtG9nkTDnmrnXAqFBAxs
	68I9GJbC2VGuaCVhZoqMlEOwS3Y+cdcpzsYN3ALeaS0qc9hyw+uZUgQ67l2LD7VGYnpogTFdjAl
	WtAmYtfcfBise6Xehg32fs7twzOeWlvDSFZJg
X-Google-Smtp-Source: AGHT+IEe32jN8gUqbf1l9ngrSD5IPLARvV8fpV4Tje3WEqH7kkd+ZQY+1xW4UvomRXZlgVtw/pLaiYHStH4ShpBNc/E=
X-Received: by 2002:a2e:4a1a:0:b0:2f0:33e:d286 with SMTP id
 38308e7fff4ca-2f3aa1a5198mr14064661fa.20.1723630214840; Wed, 14 Aug 2024
 03:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240808095931.2649657-1-wenst@chromium.org> <20240808095931.2649657-6-wenst@chromium.org>
 <ZrtHhcNMiyHmKbal@smile.fi.intel.com>
In-Reply-To: <ZrtHhcNMiyHmKbal@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 14 Aug 2024 18:10:03 +0800
Message-ID: <CAGXv+5EgqdziyheOt7wzkbe036fqPcw_UpSHiMsB3W_nTB3NWQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] platform/chrome: Introduce device tree hardware prober
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_031017_822954_75DBD4BC 
X-CRM114-Status: GOOD (  39.62  )
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

On Tue, Aug 13, 2024 at 7:46=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 08, 2024 at 05:59:28PM +0800, Chen-Yu Tsai wrote:
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
> > + * Copyright (c) 2023 Google LLC
>
> At bare minimum we are in 2024 now.

Ack.

> ...
>
> > +#include <linux/array_size.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
>
> > +#include <linux/of.h>
>
> Why?

Might have been left over from previous work and squashed into the wrong
commit. Will remove.

> > +#include <linux/platform_device.h>
>
> ...
>
> > +     for (size_t i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++) {
> > +             if (!of_machine_is_compatible(hw_prober_platforms[i].comp=
atible))
> > +                     continue;
>
> > +             int ret;
>
> I didn't know we allow this kind of definition mix besides for-loop and
> __free()... Can you point me out where this style change was discussed?

Will move to the top of the for loop block.

> > +             ret =3D hw_prober_platforms[i].prober(&pdev->dev, hw_prob=
er_platforms[i].data);
> > +             /* Ignore unrecoverable errors and keep going through oth=
er probers */
> > +             if (ret =3D=3D -EPROBE_DEFER)
> > +                     return ret;
> > +     }
>
> ...
>
> > +static void chromeos_of_hw_prober_driver_exit(void)
> > +{
> > +     if (!chromeos_of_hw_prober_pdev)
> > +             return;
>
> First of all, this is dup for the next call, second, when may this condit=
ional
> be true?

When the module is loaded on a machine that doesn't match any entry,
neither the driver nor the device are registered. Hence the check.

Or maybe the proper way to handle it is to return -ENODEV or something?
I'll work towards that.

Thanks
ChenYu

> > +     platform_device_unregister(chromeos_of_hw_prober_pdev);
> > +     platform_driver_unregister(&chromeos_of_hw_prober_driver);
> > +}
> > +module_exit(chromeos_of_hw_prober_driver_exit);
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

