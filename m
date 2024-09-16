Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E928C3ABB2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 14:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEjVxo0CmyP05sESlkGQPWhlG2jLiBb3+PXO6NFhtwk=; b=yuJc9cPyypN1svqhhsjU/AVxN9
	bXbh8wkOJ/k0VJaq/t8FGA9xY3cGxotsHU4NflV3+MGWbFm8XKZBU3+6vIm/bgclU5l7OA70GIH0p
	NuUYqGaS6zT6c983fQEbREtVA4eZ8VehpiiKyNTo92q12Ifekv6CmJdN9RGx9VOpt52zdT+LQV1ZA
	j4EJFYuJap8xWfo4jPR0Mu9pykA2H8omAIZ51VWHkQHNtyAWCvcC3rc9ap4JqDTG3aoAOIc1thAqP
	wM6djp66YB0rJzt6XxRYiYdD/DNNV52lbqWr1HbgDW1bujdXDOSMW/tX8KekBdfGM9b0KKAyQUX4s
	pjlB5SoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqClD-00000004Deu-2esF;
	Mon, 16 Sep 2024 14:31:27 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqClA-00000004De5-0dMj
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Sep 2024 14:31:25 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53568ffc525so5221181e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Sep 2024 07:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726497081; x=1727101881; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEjVxo0CmyP05sESlkGQPWhlG2jLiBb3+PXO6NFhtwk=;
        b=NsadmDI6ZJvrXadpydBKfSko+ZudYoRv51ZtjHG+SGNnH04tnmqazgWmMX1P+dogbo
         pXnRoyRtSrcmmhtcgl2wWhwlSlOYNe+B7U1lYPDeI7BWNQTHoVYmy8sPdRla+zEk1ki/
         dXnLeekONvKM6t26GyHFco17RrafR4qQdcSNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726497081; x=1727101881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEjVxo0CmyP05sESlkGQPWhlG2jLiBb3+PXO6NFhtwk=;
        b=WA+vf1oEqT23ulA//XYra18w8DQzTCMxy9VkwtPL0wcEX7OxKp+6CFupqGb51QY1FW
         mEWO3OHIOIIvykOgATAKEZLeGHrp6mya93tIsR9Y2K8FER/z9ab77bF8YHu/OnnEM/J+
         m+Z9elr4OG+EgGwMU6Tg2Dqcu+HPywuauSMsft4S9xqE11SLxT5DAgnUFVD8D/Nb7BJT
         RemwSm0kTcp5XvsAiy2SCSREjnNq7l1FuMUV2fQeG4HixdQ5Q/JUWV7rArEnjJ5Yq8qp
         u31QkGb0ALvJsC+tdYckXK8GoiRWqzQ9yb5eFDWXH2Ab1dIsQdPRTzrkD3+wkqkIBU7Y
         C5ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWCTNJS2uCGvVkxZxBYVL+flq7PM30nHdhSm4g0kjVAUOhK3Jla8GKjlZzlakbfQYWjAzBy8/7lenyYYRyZyw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjqZRBq6Axe1aoqwODCx/anXn+jS/Wkj5GKcwoONOVHczuGHhO
	XF7J4q4zzvx4SRDBuKyZeCr32llgeNf4OBqoRprYkflcPiYwBTgEu4p2AdLtva5GEHCku2XLWa8
	iZYGy1KG8yHYPKYv/Lc0Ao29OGq+ZzovVB9Tj
X-Google-Smtp-Source: AGHT+IF2gZvo4YLNzvfNxlnTgC8reRT76wxDzBx5nebPrFcFPFYPCHPUrhTxpiZOy4gaju7avMHM0oeFH4FKcyH9Q+Y=
X-Received: by 2002:ac2:4c49:0:b0:536:56d8:24b4 with SMTP id
 2adb3069b0e04-53678fb1d9emr7650183e87.5.1726497081139; Mon, 16 Sep 2024
 07:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-7-wenst@chromium.org>
 <CAD=FV=Udc9aP7bSzTWP82zsaztRD2YnVNpSDA54FC0dKQ-Nz2A@mail.gmail.com>
 <CAGXv+5FRoiv+TPyeFTcuRanRuSh2-xUo6ttVPkW6o3tktUmcFA@mail.gmail.com> <CAD=FV=UDoaBN4OLZhEB4uvs6vDRVS0ZAsce2=3rJOn5sKEu-hw@mail.gmail.com>
In-Reply-To: <CAD=FV=UDoaBN4OLZhEB4uvs6vDRVS0ZAsce2=3rJOn5sKEu-hw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 16 Sep 2024 16:31:09 +0200
Message-ID: <CAGXv+5Eo3r6WPDnHwEZPFz7PBd5v48n32iXXWy=Vr-v1H2zEoQ@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] i2c: Introduce OF component probe function
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_073124_232785_556896C2 
X-CRM114-Status: GOOD (  43.88  )
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

On Mon, Sep 16, 2024 at 4:16=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sun, Sep 15, 2024 at 4:32=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > > > + * Assumes that across the entire device tree the only instances o=
f nodes
> > > > + * prefixed with "type" are the ones that need handling for second=
 source
> > > > + * components. In other words, if "type" is "touchscreen", then al=
l device
> > > > + * nodes named "touchscreen*" are the ones that need probing. Ther=
e cannot
> > >
> > > "touchscreen*" implies that it can have an arbitrary suffix. Can it?
> >
> > That is the idea. The use case is for components that have conflicting
> > addresses and need special probing. Such device nodes obviously can't
> > have the same node name. This is planned but not implemented in this
> > series.
>
> Maybe "touchscreen@*" instead of "touchscreen*" if I'm understanding corr=
ectly.

Then it would be "touchscreen*@*".

> > > > + * be another "touchscreen" node that is already enabled.
> > > > + *
> > > > + * Assumes that for each "type" of component, only one actually ex=
ists. In
> > > > + * other words, only one matching and existing device will be enab=
led.
> > > > + *
> > > > + * Context: Process context only. Does non-atomic I2C transfers.
> > > > + *          Should only be used from a driver probe function, as t=
he function
> > > > + *          can return -EPROBE_DEFER if the I2C adapter or other r=
esources
> > > > + *          are unavailable.
> > > > + * Return: 0 on success or no-op, error code otherwise.
> > > > + *         A no-op can happen when it seems like the device tree a=
lready
> > > > + *         has components of the type to be probed already enabled=
. This
> > > > + *         can happen when the device tree had not been updated to=
 mark
> > > > + *         the status of the to-be-probed components as "fail". Or=
 this
> > > > + *         function was already run with the same parameters and s=
ucceeded
> > > > + *         in enabling a component. The latter could happen if the=
 user
> > >
> > > s/latter/later
> >
> > Are you sure?
>
> No. latter looked weird to me and I searched quickly and thought I was
> right. With a more full search looks like you're right.
>
>
> > > > +int i2c_of_probe_component(struct device *dev, const struct i2c_of=
_probe_cfg *cfg, void *ctx)
> > > > +{
> > > > +       const struct i2c_of_probe_ops *ops;
> > > > +       const char *type;
> > > > +       struct device_node *i2c_node;
> > > > +       struct i2c_adapter *i2c;
> > > > +       int ret;
> > > > +
> > > > +       if (!cfg)
> > > > +               return -EINVAL;
> > >
> > > Drop extra check of "!cfg". In general kernel conventions don't check
> > > for NULL pointers passed by caller unless it's an expected case. You
> > > don't check for a NULL "dev" and you shouldn't need to check for a
> > > NULL "cfg". They are both simply required parameters.
> >
> > "dev" is only passed to dev_printk(), and that can handle "dev" being
> > NULL. Same can't be said for "cfg".
> >
> > I don't know what the preference is though. Crashing is probably not th=
e
> > nicest thing, even if it only happens to developers.
>
> Honestly as a developer I'd prefer the crash. It points out the exact
> line where I had an invalid NULL. Returning an error code means I've
> got to compile/boot several more times to track down where the error
> code is coming from.
>
> I'm fairly certain that the kernel convention is to only check things
> for NULL if it's part of the API to accept NULL or if the value can be
> NULL due to untrusted data. If the only way it can be NULL is due to
> buggy code elsewhere in the kernel then you should omit the error
> checks.

Make sense.

> > > > +               if (!of_device_is_available(node))
> > > > +                       continue;
> > > > +
> > > > +               /*
> > > > +                * Device tree has component already enabled. Eithe=
r the
> > > > +                * device tree isn't supported or we already probed=
 once.
> > > > +                */
> > > > +               ret =3D 0;
> > > > +               goto out_put_i2c_node;
> > > > +       }
> > > > +
> > > > +       i2c =3D of_get_i2c_adapter_by_node(i2c_node);
> > > > +       if (!i2c) {
> > > > +               ret =3D dev_err_probe(dev, -EPROBE_DEFER, "Couldn't=
 get I2C adapter\n");
> > > > +               goto out_put_i2c_node;
> > > > +       }
> > > > +
> > > > +       /* Grab resources */
> > > > +       ret =3D 0;
> > > > +       if (ops->get_resources)
> > > > +               ret =3D ops->get_resources(dev, i2c_node, ctx);
> > > > +       if (ret)
> > > > +               goto out_put_i2c_adapter;
> > > > +
> > > > +       /* Enable resources */
> > > > +       if (ops->enable)
> > > > +               ret =3D ops->enable(dev, ctx);
> > > > +       if (ret)
> > > > +               goto out_release_resources;
> > >
> > > I won't insist, but a part of me wonders whether we should just
> > > combine "get_resources" and "enable" and then combine "cleanup" and
> > > "free_resources_late". They are always paired one after another and
> > > I'm having a hard time seeing why they need to be separate. It's not
> > > like you'll ever get the resources and then enable/disable multiple
> > > times.
> >
> > Maybe. The structure was carried over from the original non-callback
> > version. I think it's easier to reason about if they are kept separate,
> > especially since the outgoing path is slightly different when no workin=
g
> > component is found and one of the callbacks ends up not getting called.
>
> Actually, both of the outgoing callbacks are always called. It's only
> the 3rd callback (the "early" one) that's called sometimes.

So IIRC do "get + enable" and "cleanup + release_late", and leave
"release_early" alone?

ChenYu

> I won't insist on combining them, but I still feel like combining them
> would be better. I'd be interested in other opinions, though.
>
>
> -Doug
>

