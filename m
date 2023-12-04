Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA13C10DC3
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SzWfC6WDG0HEDP8yk1dI76L7Vjoulwh6flVXPbKqmw=; b=kCwY4z6BHd40/bRppqixl5Q4R5
	QBNtvtTrtYzceATTCOMczd0sfmm7aJcZUWmF4j7FL7bZ5WPUj4QgT2ESlwpCwsSNUu7ShkTFqgBYH
	R05YRri1csEeuVfSDNzyqvNNY3SnPU0qS5n1jBaxiehYvenyDI3OJhHEDiaUlX+qp7dNkBcsdSebD
	wp46Z+s7HUZkTS7N2RD1wd8GXJxC/vTwX9DrZEI8c5jgPzXX9AVjNWwe2C1lYZCk5TZQLE4YwlTk0
	W0uo/+ZcnOxmofK+Ada5vmKCEt5BAhyRc5ZCEuSAyGUiWZ/Ej4FnExsRj/TBz0I2aqVtIxbfryxgE
	eZN9XL5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA3m0-003CVe-0S;
	Mon, 04 Dec 2023 07:53:48 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA3lw-003CSh-21
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 07:53:46 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50bf7bc38c0so675233e87.2
        for <linux-mediatek@lists.infradead.org>; Sun, 03 Dec 2023 23:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701676423; x=1702281223; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SzWfC6WDG0HEDP8yk1dI76L7Vjoulwh6flVXPbKqmw=;
        b=FW03r1Fp9f+bA5AQwMzND1+Cfko2W3jahsaIzgqC0q1CV7Oi6/92uFpX05sSxMB1Ez
         T3nT99MRstFAFxIqWTEV5NjuK2dVnB+r0o1UV8FRf0CJOEIpfhAqnJCgApObnFLJl/OK
         UtyeNWB4Xu4C1lIlH1cmcKJURflet4v9CW1qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701676423; x=1702281223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2SzWfC6WDG0HEDP8yk1dI76L7Vjoulwh6flVXPbKqmw=;
        b=OQ0ZeIzTaQP+gtIm2H0ehmXtU9GsG0uZxLtGnQbS4X0qyfAyBTFEsCjwMas483yXDJ
         Xr97YnL9VIJDONFGdHFslJgN5xI3k9W2PH+JFKOj8BAY6ragWinFdhz93Hgxef9NdrMp
         wzkzsufGSFqWN2hOMy994WqEt1GJDmEqArDlRBgeDCtHTbQDUgFK+Wn6y3M9n4E+Xie4
         p9LpqTGsT442RUYoIU7/YSDpHPpIkicJRu4pBQ4q8g/uzm90jRth21DJ/Ed40fg44wM/
         ri1tBIlEMIaDwkBwbWIWsqWJvL92Q7piagxbKjBWoIxkFkGdgZS20X8EvqICyvh3xaJn
         Ca9w==
X-Gm-Message-State: AOJu0YzZzMSzpSFST0Kwoe9QVhII8/zElryBT9HlopEjqrNqGJeB9tnl
	TpWNPIUNQbBiqgLURIAgnqlbV0UErtSs0mJn7C6w1A==
X-Google-Smtp-Source: AGHT+IGrPmPXLIsd+pzC6dzwBwPyO8KWCO9Fyx9YUVOkHlF5xJpwelZzOKlQkT88eTqzfYlBmWVj2CBHMAJkZ8Aj9xw=
X-Received: by 2002:a05:6512:3088:b0:50b:d764:64a7 with SMTP id
 z8-20020a056512308800b0050bd76464a7mr2985712lfd.92.1701676422869; Sun, 03 Dec
 2023 23:53:42 -0800 (PST)
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-4-wenst@chromium.org>
 <CAD=FV=XV0+G=uFBE_n6WFGVW2szGcKToZgCNTdSrNf3LVk9MOQ@mail.gmail.com> <CAGXv+5Hz3wfjCRa2AiOQgOv7zo8bzAmtG=a=jWJhO2MZNrFtpw@mail.gmail.com>
In-Reply-To: <CAGXv+5Hz3wfjCRa2AiOQgOv7zo8bzAmtG=a=jWJhO2MZNrFtpw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Dec 2023 15:53:31 +0800
Message-ID: <CAGXv+5HQeXPyRVFXaPKwX6GDoeMVM0Sneqk4CJx1AWGYT-mAEg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/5] platform/chrome: Introduce device tree
 hardware prober
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de, 
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_235344_716905_4E303D99 
X-CRM114-Status: GOOD (  34.43  )
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

On Mon, Dec 4, 2023 at 3:24=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> On Sat, Dec 2, 2023 at 8:58=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > Hi,
> >
> > On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.o=
rg> wrote:
> > >
> > > @@ -61,6 +61,17 @@ config CHROMEOS_TBMC
> > >           To compile this driver as a module, choose M here: the
> > >           module will be called chromeos_tbmc.
> > >
> > > +config CHROMEOS_OF_HW_PROBER
> > > +       bool "ChromeOS Device Tree Hardware Prober"
> >
> > Any reason that it can't be a module?
>
> No technical one. However if it's a module, the user has to manually load
> it. So I think it's more of a usability thing.

We could probably manually add module aliases. I thought about aliases
against the machine compatibles, but there doesn't seem to be a device
for it to trigger. Or target something common to ChromeOS devices like
the EC? It's really hacky though.

ChenYu

> OOTH I think this needs to be a module if I2C is built as a module.
> Somehow I had thought of it at one point but then it slipped my mind.
>
> > > +       depends on OF
> > > +       depends on I2C
> > > +       select OF_DYNAMIC
> > > +       default OF
> >
> > You probably don't want "default OF". This means that everyone will
> > automatically get this new driver enabled which is unlikely to be
> > right.
>
> I thought this whole section was guarded behind KCONFIG_CHROME_PLATFORMS.
> So if the user has CHROME_PLATFORMS enabled and has OF enabled, they
> likely need the prober.
>
> > > +static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
> > > +{
> > > +       for (size_t i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++=
)
> > > +               if (of_machine_is_compatible(hw_prober_platforms[i].c=
ompatible)) {
> > > +                       int ret;
> > > +
> > > +                       ret =3D hw_prober_platforms[i].prober(&pdev->=
dev,
> > > +                                                           hw_prober=
_platforms[i].data);
> > > +                       if (ret)
> >
> > Should it only check for -EPROBE_DEFER here? ...and then maybe warn
> > for other cases and go through the loop? If there's some error
> > enabling the touchscreen I'd still want the trackpad to probe...
>
> Makes sense. However there's no extra information to give in the
> warning though.
>
> > > +                               return ret;
> > > +               }
> > > +
> > > +       return 0;
> >
> > Random thought: once we get here, the driver is useless / just wasting
> > memory. Any way to have it freed? ;-)
>
> I don't think there is a good way to do that, except maybe marking all
> the functions as __init? But that likely doesn't work in combination
> with deferred probing (say the i2c driver is a module).
>
> ChenYu

