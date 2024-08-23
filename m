Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB056C52D7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 09:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M99BvE0ak8pOlurdL9IHAiYs0yZwQ7ZlfzDedMoUuTo=; b=YgzcCdVhUWUSD5V4jufd+3bog7
	7SEGz6E4L5J/YX3Mm9bNtJ9H29Xl5gAO4ojbSOz4nt9clmwjgb61K8PRq+5A6ClSqvAoOPSbCQRHo
	eEZANvIJJFT3TwAofkSLKGVlYJD/+YJo6wcmDek9ZG22TVNtJfwN6Wg+fh3q1yaowrW3lO74WfNPb
	BLeEI4H8Fc08Lz7FA/OAjwqGlg+oG6+/DCVugUc4rTUFkg63J9rt7CvhNIhruSXleseoo2yPgUcni
	POR6b4V/yRr2qIDOmp1gEhwAivetSD5K1NYxTQ6+Lt85kG+8o9RrnNLwIEjdewfUxUBF4RalspZmR
	GXY/AkqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shQiN-0000000G8qP-1MAl;
	Fri, 23 Aug 2024 09:36:15 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shQiK-0000000G8pO-14nP
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Aug 2024 09:36:13 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-530e062217eso2055570e87.1
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Aug 2024 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724405770; x=1725010570; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M99BvE0ak8pOlurdL9IHAiYs0yZwQ7ZlfzDedMoUuTo=;
        b=a1MZnHpVtEZ8/aRO4YGKR270c89XMJUZZZsNG4R7W8wS8h3vtWvqOEFKGDOAkt3YNI
         Ix+E6ypNyoghuSEl3WwpcOwT5DmjsVCcmDh7i/gnrmfMucwtLenycs7ukytx9HGnQvJJ
         tKmTr68KEnLjK1EPmodSLo8OX+Q4eH8SLr82o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724405770; x=1725010570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M99BvE0ak8pOlurdL9IHAiYs0yZwQ7ZlfzDedMoUuTo=;
        b=DDqeBKVxfzHG4PUEdra3fEXgWIYwYlE9vld66EXasgMR0dZYDuco4jcDwEKolN9Twt
         HGAMqXYVVVXnMJMYwSNwuRjit9XySixabBLfC9D7F25zeiqxaWz9dMd+WAlZaeIuO6x+
         q3yaR6Rg8sx9SNT82uZRx4edgc3HAAePDqgm8W7PeAbrXtwowh4JfdJIho3zEryRzNQg
         OhBvrv8gTM4BkaDglongFAQQMfsOQzBdBDWTp0PNrX09/VVHLJwYSK4i/zhU+LN7NIoG
         ssbigxrc0yCdTIOFDFCOevy9ofeh+cvgCNbU0e67PltzfiV+49kYgNGYKGHB6ycOvKEi
         lcNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKio36v8w1VMSXPI5g2QcqQDEhotIsouhnuWcL+CwBnMOoEcmmwce1pRVB0hUt98AbMWfdjU8NToOoZSBF4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzGghvicy+WKzXE2rpCpx7dOIyIvnGdEEGpA0JA97IeiiS5WOo
	VTk8f2kd3vlJTWbAZnBAJXY0k5uiu4W9PHL3Uny5QCLwUu8hfivY5ZG84PPqZGalB2VSviP6irT
	84bIAHZBkqQBpThDckEEKItv4H52NP/Go1ErinQozqOiLfVBrMg==
X-Google-Smtp-Source: AGHT+IF8+5/bPoCsCz59rChJbumZ9VHK/EHdKiSLptyL22YMjMEjXODaeoJvtP8nB6l8BDKCdUWw053JwFUxmGAyPbY=
X-Received: by 2002:a05:6512:ba0:b0:52e:91ff:4709 with SMTP id
 2adb3069b0e04-53438772179mr1273014e87.21.1724405770181; Fri, 23 Aug 2024
 02:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240822092006.3134096-1-wenst@chromium.org> <20240822092006.3134096-8-wenst@chromium.org>
 <ZsdGlMyq4pwWAOk4@smile.fi.intel.com>
In-Reply-To: <ZsdGlMyq4pwWAOk4@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 23 Aug 2024 17:35:59 +0800
Message-ID: <CAGXv+5FWaN4gGksCF7k3emuDyCmAtx7+DBwHHbFhf_FLpP+=aw@mail.gmail.com>
Subject: Re: [PATCH v5 07/10] i2c: of-prober: Add regulator support
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
X-CRM114-CacheID: sfid-20240823_023612_346527_6C71B424 
X-CRM114-Status: GOOD (  43.72  )
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

On Thu, Aug 22, 2024 at 10:09=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 22, 2024 at 05:20:00PM +0800, Chen-Yu Tsai wrote:
> > This adds regulator management to the I2C OF component prober.
> > Components that the prober intends to probe likely require their
> > regulator supplies be enabled, and GPIOs be toggled to enable them or
> > bring them out of reset before they will respond to probe attempts.
> > GPIOs will be handled in the next patch.
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
> >  /*
>
> >   * address responds.
> >   *
> >   * TODO:
> > - * - Support handling common regulators and GPIOs.
> > + * - Support handling common GPIOs.
>
> You can split this to two lines in the first place and have less churn in=
 this
> patch and the other one.

Ack.

> >   * - Support I2C muxes
> >   */
>
> ..
>
> > +/* Returns number of regulator supplies found for node, or error. */
> > +static int i2c_of_probe_get_regulator(struct device *dev, struct devic=
e_node *node,
> > +                                   struct i2c_of_probe_data *data)
> > +{
> > +     struct regulator_bulk_data *tmp, *new_regulators;
> > +     int ret;
> > +
> > +     ret =3D of_regulator_bulk_get_all(dev, node, &tmp);
> > +     if (ret <=3D 0)
> > +             return ret;
>
> I would split this and explain 0 case.

Ack.

> > +     if (!data->regulators) {
> > +             data->regulators =3D tmp;
> > +             data->regulators_num =3D ret;
> > +             return ret;
> > +     };
> > +
> > +     new_regulators =3D krealloc(data->regulators,
> > +                               sizeof(*tmp) * (data->regulators_num + =
ret),
>
> krealloc_array()

Ack. Somehow I didn't find this function while I was rewriting the code.

> > +                               GFP_KERNEL);
> > +     if (!new_regulators) {
> > +             regulator_bulk_free(ret, tmp);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     data->regulators =3D new_regulators;
>
> > +     for (unsigned int i =3D 0; i < ret; i++)
> > +             memcpy(&data->regulators[data->regulators_num++], &tmp[i]=
, sizeof(*tmp));
>
> Seems like copying array to array, no? If so, can't be done in a single m=
emcpy() call?

Ack.

> > +     return ret;
> > +}
>
> ...
>
> > +static int i2c_of_probe_get_res(struct device *dev, struct device_node=
 *node,
> > +                             struct i2c_of_probe_data *data)
> > +{
> > +     struct property *prop;
> > +     int ret;
> > +
> > +     ret =3D i2c_of_probe_get_regulator(dev, node, data);
> > +     if (ret < 0) {
> > +             dev_err_probe(dev, ret, "Failed to get regulator supplies=
 from %pOF\n", node);
> > +             goto err_cleanup;
> > +     }
> > +
> > +     return 0;
> > +
> > +err_cleanup:
> > +     i2c_of_probe_free_res(data);
> > +     return ret;
> > +}
>
> Hmm... why not
>
> static int i2c_of_probe_get_res(struct device *dev, struct device_node *n=
ode,
>                                 struct i2c_of_probe_data *data)
> {
>         struct property *prop;
>         int ret;
>
>         ret =3D i2c_of_probe_get_regulator(dev, node, data);
>         if (ret < 0) {
>                 i2c_of_probe_free_res(data);
>                 return dev_err_probe(dev, ret, "Failed to get regulator s=
upplies from %pOF\n", node);
>         }
>
>         return 0;
> }
>
> ...

That would be more churn in the next patch, which introduces another
error condition requiring the same cleanup.

> > +static int i2c_of_probe_enable_res(struct device *dev, struct i2c_of_p=
robe_data *data)
> > +{
> > +     int ret =3D 0;
>
> Redundant assignment.

Ack.

> > +     dev_dbg(dev, "Enabling regulator supplies\n");
> > +
> > +     ret =3D regulator_bulk_enable(data->regulators_num, data->regulat=
ors);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* largest post-power-on pre-reset-deassert delay seen among driv=
ers */
> > +     msleep(500);
>
> How would we monitor if any [new] driver wants to use bigger timeout?

The assumption is that the person doing the integration should test for
this. This prober doesn't get called everywhere. It needs a driver to
call it, and that driver is written by someone for some specific platform.
Maybe I should explicitly spell that out in the function description?
Or even make it a parameter?

Also, having an arbitrarily large number here doesn't help platforms that
want to minimize boot time. On that front I'm also thinking about whether
it is possible to do a handover to the actual driver so that the latter
doesn't have to go through the whole power sequence again.

> > +     return 0;
> > +}
>
> ...
>
> >       struct i2c_adapter *i2c;
> > +     struct i2c_of_probe_data probe_data =3D {0};
>
> Reversed xmas tree order?

OK...

> '0' is not needed.

Ack.

> ...
>
> > +     /* Grab resources */
> > +     for_each_child_of_node_scoped(i2c_node, node) {
> > +             u32 addr;
> > +
> > +             if (!of_node_name_prefix(node, type))
> > +                     continue;
>
> Is it third or fourth copy of this code? At some point you probably want
>
> #define for_each_child_of_node_with_prefix_scoped()
>         for_each_if(...)
>
> (or equivalent)

Ack.


Thank you for the review.

ChenYu

> > +             if (of_property_read_u32(node, "reg", &addr))
> > +                     continue;
> > +
> > +             dev_dbg(dev, "Requesting resources for %pOF\n", node);
> > +             ret =3D i2c_of_probe_get_res(dev, node, &probe_data);
> > +             if (ret)
> > +                     return ret;
> > +     }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

