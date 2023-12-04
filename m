Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EC0C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 07:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Xxz1IMztyI/DW8EzDBtMH+QkyqwQ5t+SJRSYEC/SOc=; b=PzeKifZ+MH5V5AHie+fbH6nVYd
	tDK4TOYL2vSPvtICfBrxUaLJs/TF427pukns64wd+3VZaGxQlcHNjaK6z2HI98ebSEmF/Uig8xSCS
	PB9jOIJPxkEtu+3HT3kS8C3oY9s5dX5Y+vuD3PzOmZrl7mTjhSM0MhGOQl/EH9/dyDNifMvh+cB23
	RJ35GVbEYENdri72eNhcTTwLq6DGwjQsT6svgyo9Gez7ctuWNdsXNYBuABQSHCoyTMbwqPOEIjcUJ
	08/z8+RmmMD+qkJII3V6MG7/RZObtSPe4KxtTD3YVNvmalT0o5GI3LbjKdA6iWHQY+E1NTHwMIMnE
	QLRbo+JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA3K7-00397c-0C;
	Mon, 04 Dec 2023 07:24:59 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA3K3-00396w-2p
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 07:24:57 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50be03cc8a3so2782943e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 03 Dec 2023 23:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701674693; x=1702279493; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Xxz1IMztyI/DW8EzDBtMH+QkyqwQ5t+SJRSYEC/SOc=;
        b=ii2mxmPGOkmeIuSins5E1oBUz23jXZPC5rlYaFJR6EBzdO+6DSYsh3TqULITmqAwXb
         wO48Cr90yFlj+89I4cpUMJUWrK1h0l6LUwPLlMMBMKcNujHQHwgmI08I0IWN3qTOXekR
         M3TKLC1d2xW6OKCZJKqZL0TsY9G3ctpts9tnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701674693; x=1702279493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Xxz1IMztyI/DW8EzDBtMH+QkyqwQ5t+SJRSYEC/SOc=;
        b=LtNmtFS4r3Rtsu02fYJGCMDSuXCsKYv2ICRmbt4pevpXVoBVbt2lnc+5AL2I0e3bJ5
         ViOcm+7T9MEC+Jgyet7nMV8bpDKRSnxz7GETH9L+YIyQ/G/t8/55UDCwjuHaAEfi7eFq
         mYs2GHhEn4/h+3hfLR0WlmYho+tJ2p4D+mj99aawi55+mVTady6IGRShXjv+XezyjIzg
         +yup4lYXelAmTJeiQ6UMjkrkniGhdjUeAApw0lH2dscViUTjLQkdjK1Sw/ovSu3Yh3QB
         TygZ/BEWuHy75ei8eXYlENhPkL0U/a28pFGxHDuf7t+DakHttSZJtiv1bLmgIKgK1ZWA
         WJWA==
X-Gm-Message-State: AOJu0YwkfHltp6NWiqKoONYep0So0spsjRc8c+AUGS/Ram+YZo0z2HTq
	6qTdRBtuwilyIb0n87H/LDFX/IOnroW/l+cJF98c/A==
X-Google-Smtp-Source: AGHT+IFtbMn5A8+mOCK7ju+ZruOqp6ANHem62c8eBAnYZlXhRPomaeKDI0QPJC1GJ9Q8Tj324VrRaJX0WX0KLLlp1+M=
X-Received: by 2002:a19:ac4a:0:b0:50b:f51a:299a with SMTP id
 r10-20020a19ac4a000000b0050bf51a299amr600460lfc.32.1701674693388; Sun, 03 Dec
 2023 23:24:53 -0800 (PST)
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-4-wenst@chromium.org>
 <CAD=FV=XV0+G=uFBE_n6WFGVW2szGcKToZgCNTdSrNf3LVk9MOQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XV0+G=uFBE_n6WFGVW2szGcKToZgCNTdSrNf3LVk9MOQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Dec 2023 15:24:42 +0800
Message-ID: <CAGXv+5Hz3wfjCRa2AiOQgOv7zo8bzAmtG=a=jWJhO2MZNrFtpw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231203_232455_931336_1EF42ED8 
X-CRM114-Status: GOOD (  28.79  )
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

On Sat, Dec 2, 2023 at 8:58=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
> > @@ -61,6 +61,17 @@ config CHROMEOS_TBMC
> >           To compile this driver as a module, choose M here: the
> >           module will be called chromeos_tbmc.
> >
> > +config CHROMEOS_OF_HW_PROBER
> > +       bool "ChromeOS Device Tree Hardware Prober"
>
> Any reason that it can't be a module?

No technical one. However if it's a module, the user has to manually load
it. So I think it's more of a usability thing.

OOTH I think this needs to be a module if I2C is built as a module.
Somehow I had thought of it at one point but then it slipped my mind.

> > +       depends on OF
> > +       depends on I2C
> > +       select OF_DYNAMIC
> > +       default OF
>
> You probably don't want "default OF". This means that everyone will
> automatically get this new driver enabled which is unlikely to be
> right.

I thought this whole section was guarded behind KCONFIG_CHROME_PLATFORMS.
So if the user has CHROME_PLATFORMS enabled and has OF enabled, they
likely need the prober.

> > +static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
> > +{
> > +       for (size_t i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
> > +               if (of_machine_is_compatible(hw_prober_platforms[i].com=
patible)) {
> > +                       int ret;
> > +
> > +                       ret =3D hw_prober_platforms[i].prober(&pdev->de=
v,
> > +                                                           hw_prober_p=
latforms[i].data);
> > +                       if (ret)
>
> Should it only check for -EPROBE_DEFER here? ...and then maybe warn
> for other cases and go through the loop? If there's some error
> enabling the touchscreen I'd still want the trackpad to probe...

Makes sense. However there's no extra information to give in the
warning though.

> > +                               return ret;
> > +               }
> > +
> > +       return 0;
>
> Random thought: once we get here, the driver is useless / just wasting
> memory. Any way to have it freed? ;-)

I don't think there is a good way to do that, except maybe marking all
the functions as __init? But that likely doesn't work in combination
with deferred probing (say the i2c driver is a module).

ChenYu

