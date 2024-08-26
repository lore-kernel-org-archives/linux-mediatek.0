Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1299C5321D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 08:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9s80hAoba+vF/YE3Nvr8fKfluCQHu+8VdHsPUZS9vM=; b=GEIzVPkxb+0mU3o8xhlveZyby5
	KetJkXHX/DIu7I+vWA+Gyh1ec8cbOBhYyWpcPmujHeoK73vddyQUl+BKk5xxfv1J0t5bGdeErTpso
	16tcafznwIcxSefhdguoEX8f+dAyRD0QZloYMimakRSMbWgaSQwV8MwixE2ER2s1gg/jddAWwBAdc
	6HoKwXi9tuSJSeBj/9xBrBVfkztU0RIJ9ovd2ImwVLeXcAmAGC3v8Dy9RKa0+pZ5eKxk/DetCdML/
	0FgNULBwDxWrOiKF98UXTz5kFAz0h94saNVlzO+l247oHw44Q9sfxeWLCjzAGK0kMDZdkya+pM9FF
	PUGrpDPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siV7H-00000006VFf-1Cdt;
	Mon, 26 Aug 2024 08:30:23 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siU2O-00000006Ez7-2x7h
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Aug 2024 07:21:18 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-533496017f8so5330816e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Aug 2024 00:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724656875; x=1725261675; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9s80hAoba+vF/YE3Nvr8fKfluCQHu+8VdHsPUZS9vM=;
        b=Iu85CGf4+7TszhudV1p+eie3fkiqpDPJw9KsqbwFC9HPHgEODnYZiA+g7qXK9W7tnE
         JohUDTEV5OX17pJJeB/ZkIO8K8UokVaaHuzOc6OtJ5ZixWebibeDeLCp5I2/1hKK+jaY
         fTIvTzQyiLNy+lxLEyOngorq9xcYBY/Bsm4fI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724656875; x=1725261675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9s80hAoba+vF/YE3Nvr8fKfluCQHu+8VdHsPUZS9vM=;
        b=My1fjp7B8ovejDiusSYcIpBInOjpOtYxWa2l83xuTkrKU0eNWcynBUytydHduQ4Jnd
         5/eGvV1khTcjiPtP/3i+F+tfc0vyCX4N4vOGv2G5YU7dH7KuUrlxcuP5rhIHafvDXHLi
         0zitELkoMllcv0XcRpueo6MTJx6WnOPURiVwnkzKNZDaa0tKIfqEoLz5v4nJqxzl+ioY
         xCITl6M9nvfVZfdFAkKiardFtv89o0taW1xkp7rIjMRg36TrywxBKMqg1H+kKZejfnBJ
         oetnNcz/t4tJE2mHYQyIhWQoW9nTRu6S7NGBLvKjk3+wWm3USUMKk3x2cD0uBErlloBU
         fOTA==
X-Forwarded-Encrypted: i=1; AJvYcCVcSFtUHfF/QBNVuvunnJlJmzkv1EAAFh6EEzi2rOisxWdIMYVjAs5txPucBTk0zn4gTgLGLZapkOO62RpNzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqxYCRmsMFx+w1o+rLbrBItZ4dtBjpJfysjY2LgWhjFGJ+Mj4A
	yRFTcbs53oU7HzBvq2XmzrZsV9SEhoREdvFXT1m5YBK+K8Gl57GN00o5BxgC7L13iIfF1b+JWM5
	y4V4oIEt+i+1/V/vEucrJ+tryCRHkJDVMdcfa
X-Google-Smtp-Source: AGHT+IGihttkaipApdxajdI+u8zonSwerG1x9HLpL1VsK/H7AuQIzQB7NEiNyk7f9sK11N97AVeIrS8sEeRsiAeiSOI=
X-Received: by 2002:a05:6512:3087:b0:52c:dc25:d706 with SMTP id
 2adb3069b0e04-53438868deemr6871597e87.52.1724656874411; Mon, 26 Aug 2024
 00:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240822092006.3134096-1-wenst@chromium.org> <20240822092006.3134096-9-wenst@chromium.org>
 <ZsdJOUe44hiGur-s@smile.fi.intel.com> <CAGXv+5G7h08Pvd24_6LoUB_8w_Cd0RntRSjNdn_FjrRH1ZF5oQ@mail.gmail.com>
 <ZsiWALpt1IpTHsKg@smile.fi.intel.com>
In-Reply-To: <ZsiWALpt1IpTHsKg@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Aug 2024 15:21:03 +0800
Message-ID: <CAGXv+5FzMb3fERnUwd5DF_=TqXr2_6h+n_UPpfvJc_-eu7pNYg@mail.gmail.com>
Subject: Re: [PATCH v5 08/10] i2c: of-prober: Add GPIO support
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
X-CRM114-CacheID: sfid-20240826_002116_789304_E365AAAA 
X-CRM114-Status: GOOD (  39.59  )
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

On Fri, Aug 23, 2024 at 10:01=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Aug 23, 2024 at 06:32:16PM +0800, Chen-Yu Tsai wrote:
> > On Thu, Aug 22, 2024 at 10:20=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Aug 22, 2024 at 05:20:01PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
> > > > +     if (!data->gpiods)
> > > > +             return 0;
> > >
> > > If it comes a new code (something else besides GPIOs and regulators) =
this
> > > will be a (small) impediment. Better to have a helper for each case a=
nd do
> > >
> > >         ret =3D ..._gpiods();
> > >         if (ret)
> > >                 ...
> > >
> > > Same for regulators and anything else in the future, if any.
> >
> > I'm not sure I follow. Do you mean wrap each individual type in a wrapp=
er
> > and call those here, like the following?
> >
> >     i2c_of_probe_enable_res(...)
> >     {
> >         ret =3D i2c_of_probe_enable_regulators(...)
> >         if (ret)
> >               return ret;
> >
> >         ret =3D i2c_of_probe_enable_gpios(...)
> >         if (ret)
> >               goto error_disable_regulators;
> >
> >         ...
> >     }
>
> Yes.
>
> ...
>
> > > > +             /*
> > > > +              * reset GPIOs normally have opposite polarity compar=
ed to
> > >
> > > "reset"
> > >
> > > > +              * enable GPIOs. Instead of parsing the flags again, =
simply
> > >
> > > "enable"
> > >
> > > > +              * set the raw value to high.
> > >
> > > This is quite a fragile assumption. Yes, it would work in 98% cases, =
but will
> > > break if it's not true somewhere else.
> >
> > Well, this seems to be the de facto standard. Or it would have to remem=
ber
> > what each GPIO descriptor's name is, and try to classify those into eit=
her
> > "enable" or "reset", and set their respective logical values to 1 or 0.
> > And then you run into a peripheral with a broken binding that has its
> > "reset" GPIO inverted, i.e. it's driver behavior needs to follow the
> > "enable" GPIO style. The class of devices this prober targets are
> > consumer electronics (laptops, tablets, phones) that at least have gone
> > through some component selection where the options won't have conflicti=
ng
> > requirements.
>
> I'm talking from real life example(s) :-)
>
> Recently I looked at the OV7251 sensor driver that expects "enable" GPIO =
while
> all users supply "reset"-as-"enable" with the exact trouble I described.
> Yet it's pure software / ABI issue in that case, but who knows what PCB
> engineers may come up with.

For the OV7251 case specifically, the current approach works fine, as the
polarity is the same: high electric level for a working chip.

But now that you mention it, camera sensors are exactly the case I had
in mind, though not the same chip. Some of the OmniVision and GalaxyCore
sensors have a "shutdown" pin that is active high, i.e. high electric
level shuts down the chip.

So I guess the alternative would be to remember each GPIO's name, and
do the appropriate thing based on the name, and also set the logical
value, not the raw value. If it says "shutdown" or "reset", set the
logical value to 0; if it says "enable", set it to 1. And hopefully
we don't run into a binding which has "shutdown" but is actually
"enable" ...

I don't have this case and I kind of want to leave it as a TODO though.
I feel like the scope of the series is expanding ever so slightly.


ChenYu

> > And if the polarities of the possible components don't line up, then th=
is
> > probe structure can't really do anything. One would need something that
> > power sequences each component separately and probes it. I would really
> > like to avoid that if possible, as it makes the boot time (to periphera=
l
> > available) dependent on which component you have and how far down the
> > list it is. We have Chromebooks that have 4 touchscreen components
> > introduced over the years. In that case something more like Doug's
> > original proposal would work better: something that forces mutual
> > exclusivity among a class of devices.
>
> Maybe. I just pointed out the potential problem.
>
> > > > +              */
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

