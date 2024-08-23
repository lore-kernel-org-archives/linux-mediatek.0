Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C133FC531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 10:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msee6vptApu2Z/Zxm5KrwvjqOV+8m1GWJRTDYPaGTQ0=; b=XWnkRZKGDINdWHEXxW7eRiL+YN
	MX6QAptzB+meTVXbyRRtluOPNbH6C2MalLaa/L792OO54vhNQocDmY5HYuVZzlKio71dlS4yPUO2c
	QI+2wKUjCJO9+L9OkwoGouCq0JsapKVe9noAwGO6n4hQbKHSoiz4xHwkTuB10c4kwzgVhzEAlznZd
	5EsawXtY7Ryr+nPM8m8qJfXUZbhyxdGitDlwE+9ZZXjWFBGAm+qoV0nLsGjsOr+oyumeox7jZUM+4
	0UnFrSCVj2VPf7cECHplIdub2BF4KsMXC8HVw8NEC/an5zg+LFnnixWVzu1GQW8ONEAYVq/idngiy
	XzvoXjhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shRbj-0000000GM8O-1u5j;
	Fri, 23 Aug 2024 10:33:27 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shRan-0000000GLyC-38R6
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Aug 2024 10:32:32 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-533521cd1c3so2099033e87.1
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Aug 2024 03:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724409148; x=1725013948; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msee6vptApu2Z/Zxm5KrwvjqOV+8m1GWJRTDYPaGTQ0=;
        b=lIMaHRLMUPNiyxiMD4JNhkINvR312IqbhLcvIlXWjLUdvh0gH0RIFzVU91ouIx13oz
         7KUHJGToTe8MxYljezb/AA69lQAzd53nl8dHxqmK3AiAdtOoTfNx9gEP5eTzFm9RlHtH
         3njyUEMthAWVTXgYvCqHInu+0lYcDuL6xALYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724409148; x=1725013948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msee6vptApu2Z/Zxm5KrwvjqOV+8m1GWJRTDYPaGTQ0=;
        b=uKfxR7bJSli9jA5h4GrNk1TMjD1/tuX10FtfijgH6unTPsvrgal4g3oVnMx52s/Zvu
         74ITS0qSt5P0rhgWeQ3u6gWusNPH39WfJpDBsJOwWlgcnYadvj4nS+DDjdlTDcyaz56x
         lLMeAOMQl8cCKbS/Ic/XwrDnofh1Rjz/x5TTAuJzo6n22A/rJovna6O/HU1z3KNQnfDg
         hfZ/bEGfQF7e2DUn9Uc664L2/ssLtmtoQHQea+s10ucm0qEVjk4ddKINY5tP2U/1ovUG
         1ZqSMpjXayrYXB62L2l6o6gGX+q+Oi20uq7wyrejuImFFYKbcGuBW9+10j2cahFHNjaO
         Jg/g==
X-Forwarded-Encrypted: i=1; AJvYcCVPzy9dtJCeQYxCAchTP/dB7eGGmIbs9kU4+5Mhi+BoRaO1VhPQYOqypn3PDumZTOpGy/ysI0a3te+HNjVXdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJGbG3mgGDih+ibf8T5EphLau6rB6k/XrM7yLl7b7aUbtY2lKi
	KeE3FEcwwFJ/oRZQf8GhZx4VVTNyuznqCXOCHnG0NvrleQFjnlRdV7r0JDswx/GGW/5MKjzcXaB
	eUnONIejPpQfA5yaMZhTCZiERugvzwE1tdq8R
X-Google-Smtp-Source: AGHT+IHeN+Mw9mA2FjlysvQEEAUELAjuWivKbkYmYOUv0QR8Nac49Wn18na13i/jZffEieHV1XNO2MlM81/zZrEAaDU=
X-Received: by 2002:a05:6512:1111:b0:530:e0fd:4a97 with SMTP id
 2adb3069b0e04-534387e89d7mr1529511e87.0.1724409147414; Fri, 23 Aug 2024
 03:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240822092006.3134096-1-wenst@chromium.org> <20240822092006.3134096-9-wenst@chromium.org>
 <ZsdJOUe44hiGur-s@smile.fi.intel.com>
In-Reply-To: <ZsdJOUe44hiGur-s@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 23 Aug 2024 18:32:16 +0800
Message-ID: <CAGXv+5G7h08Pvd24_6LoUB_8w_Cd0RntRSjNdn_FjrRH1ZF5oQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240823_033229_909737_03BBA3E4 
X-CRM114-Status: GOOD (  42.09  )
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

On Thu, Aug 22, 2024 at 10:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 22, 2024 at 05:20:01PM +0800, Chen-Yu Tsai wrote:
> > This adds GPIO management to the I2C OF component prober.
> > Components that the prober intends to probe likely require their
> > regulator supplies be enabled, and GPIOs be toggled to enable them or
> > bring them out of reset before they will respond to probe attempts.
> > regulator support was added in the previous patch.
> >
> > Without specific knowledge of each component's resource names or
> > power sequencing requirements, the prober can only enable the
> > regulator supplies all at once, and toggle the GPIOs all at once.
> > Luckily, reset pins tend to be active low, while enable pins tend to
> > be active high, so setting the raw status of all GPIO pins to high
> > should work. The wait time before and after resources are enabled
> > are collected from existing drivers and device trees.
> >
> > The prober collects resources from all possible components and enables
> > them together, instead of enabling resources and probing each component
> > one by one. The latter approach does not provide any boot time benefits
> > over simply enabling each component and letting each driver probe
> > sequentially.
> >
> > The prober will also deduplicate the resources, since on a component
> > swap out or co-layout design, the resources are always the same.
> > While duplicate regulator supplies won't cause much issue, shared
> > GPIOs don't work reliably, especially with other drivers. For the
> > same reason, the prober will release the GPIOs before the successfully
> > probed component is actually enabled.
>
> ...
>
> > +     struct fwnode_handle *fwnode =3D of_fwnode_handle(node);
> > +     struct gpio_descs *gpiods;
> > +     struct gpio_desc *gpiod;
> > +     char con[32]; /* 32 is max size of property name */
>
> Use 'propname' to be aligned with GPIO library usages.

Ack.

> > +     char *con_id =3D NULL;
> > +     size_t new_size;
> > +     int len;
>
> ...
>
> > +     if (len >=3D sizeof(con) - 1) {
>
> This can be transformed to check the returned value from strscpy().

Ack.

> > +             pr_err("%pOF: length of GPIO name \"%s\" exceeds current =
limit\n",
> > +                    node, prop->name);
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (len > 0) {
> > +             strscpy(con, prop->name, len + 1);
>
> The correct (robust) call is with destination size. Which means here that=
 you
> may use 2-argument strscpy().

Ack.

> > +             con_id =3D con;
> > +     }
>
> ...
>
> > +     if (!data->gpiods)
> > +             return 0;
>
> If it comes a new code (something else besides GPIOs and regulators) this=
 will be a (small) impediment. Better to have a helper for each case and do
>
>         ret =3D ..._gpiods();
>         if (ret)
>                 ...
>
> Same for regulators and anything else in the future, if any.

I'm not sure I follow. Do you mean wrap each individual type in a wrapper
and call those here, like the following?

    i2c_of_probe_enable_res(...)
    {
        ret =3D i2c_of_probe_enable_regulators(...)
        if (ret)
              return ret;

        ret =3D i2c_of_probe_enable_gpios(...)
        if (ret)
              goto error_disable_regulators;

        ...
    }

> > +             /*
> > +              * reset GPIOs normally have opposite polarity compared t=
o
>
> "reset"
>
> > +              * enable GPIOs. Instead of parsing the flags again, simp=
ly
>
> "enable"
>
> > +              * set the raw value to high.
>
> This is quite a fragile assumption. Yes, it would work in 98% cases, but =
will
> break if it's not true somewhere else.

Well, this seems to be the de facto standard. Or it would have to remember
what each GPIO descriptor's name is, and try to classify those into either
"enable" or "reset", and set their respective logical values to 1 or 0.
And then you run into a peripheral with a broken binding that has its
"reset" GPIO inverted, i.e. it's driver behavior needs to follow the
"enable" GPIO style. The class of devices this prober targets are
consumer electronics (laptops, tablets, phones) that at least have gone
through some component selection where the options won't have conflicting
requirements.

And if the polarities of the possible components don't line up, then this
probe structure can't really do anything. One would need something that
power sequences each component separately and probes it. I would really
like to avoid that if possible, as it makes the boot time (to peripheral
available) dependent on which component you have and how far down the
list it is. We have Chromebooks that have 4 touchscreen components
introduced over the years. In that case something more like Doug's
original proposal would work better: something that forces mutual
exclusivity among a class of devices.

> > +              */
>
> ...
>
> > +     /* largest post-reset-deassert delay seen in tree for Elan I2C HI=
D */
> > +     msleep(300);
>
> Same Q, how do you monitor _all_ the drivers?

Discussion in the previous patch.

> ...
>
> > +disable_gpios:
> > +     for (gpio_i--; gpio_i >=3D 0; gpio_i--)
> > +             gpiod_set_raw_value_cansleep(data->gpiods->desc[gpio_i], =
0);
>
> Can't you call the _array() variant here?

I thought that without |struct gpio_array| the _array() variant wouldn't
help, i.e. it would still be a loop internally. Looks like I was wrong.

> ...
>
> > -     dev_dbg(dev, "Resources: # of regulator supplies =3D %d\n", probe=
_data.regulators_num);
> > +     dev_dbg(dev, "Resources: # of GPIOs =3D %d, # of regulator suppli=
es =3D %d\n",
> > +             probe_data.gpiods ? probe_data.gpiods->ndescs : 0,
> > +             probe_data.regulators_num);
>
> I would issue one message per class of the devices (GPIOs, regulators, ..=
.)

Ack.


Thank you for the review.
ChenYu

