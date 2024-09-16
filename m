Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C029C3ABA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 14:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZE+jV0zHlg6zy6Ts72y2t3G+5soo/pTPKebVXXxYvbc=; b=k9kzSWM0IyB4k3OpKUooHYckKa
	u17zff+AZ6TjcVc4bkFlBM0AmZfBH92GP2Df2mMfJP0YD15z73/hprWCPcrv1bNpQRqyt9YWzzJt/
	oVIF8KeKYykkqUx+juU7dzDn+jblvAcSt7Enq3pHAx4TdUZWkUkQjZOpDjbehG453plSKFCOY5FdA
	r3tdlmUHi2rZ+bGaQpUFapUp0zvMaLsJeH5F9ZDFvyjG5n10RY8BlPp9skF2pS5kshR+cpN1/KnP2
	x03c8xsRUjSObBSr6Dm5tCgO7tlMV9IhbBS6tm/kB1L3/0RjqjXAJ/M6sik0GyPyveE5342cpaIKZ
	KF1neWEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqCWv-00000004Bye-0126;
	Mon, 16 Sep 2024 14:16:41 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqCWF-00000004BtA-2bSe
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Sep 2024 14:16:01 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7a9a23fc16fso489170785a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Sep 2024 07:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726496158; x=1727100958; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZE+jV0zHlg6zy6Ts72y2t3G+5soo/pTPKebVXXxYvbc=;
        b=kC7XMJ14qGB4oBwHVYmefux5n936B/UISVeEugZnuu/U7EDg0B4OYQlE8JwQRPKTB8
         kZx6PYnWTmOrtjKA6kot0fBpMkhsm5RWmv8QPzrFHPLKxsPuAriKAgk8SnKUvguSzRzA
         cat557ST9DIkv8YAlHRZrbCC+A2jyzLYWqmys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726496158; x=1727100958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZE+jV0zHlg6zy6Ts72y2t3G+5soo/pTPKebVXXxYvbc=;
        b=pN2tmZ4NHLqbqYufWRKiwsMp37sBbAdCy4ibGEpByHpflLweoGAkk8kdEOFl7FAHeI
         /ukKfTb9lpYwzJgNDtB3GmNJO4sMLd+B7kqXxQtb9Gla/uUXSxA2f7EWXYczftwjzYUV
         Q90w3wvTU4tl8VriEkA2TgpQWvBjr98Z+sIU2gWAqexGm13cUdV2DSo8rWuTXfsKqUq4
         qp4kaoKlHE5TX+6FHIiuFjHhTtO8NxAQ0Jrrs5JEl+xqRHJdYZmJDn9zs7h98PvmZOy/
         jcUwUTF0uCV4Vn5UlRC87xxeo2FmQ3tXBgtzxLIcM7jh+IYzjbegpqecQcbawu8y/Dac
         BT0A==
X-Forwarded-Encrypted: i=1; AJvYcCW30JKHpzagWQUhMfr6aYVFRjLueWM+kYfcXYKRzc1M4tcEfIcW61J8NhL+Gnxz/i08fgAPnBqzd4TSZiHEUg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6cVQ29VvJBbIEpzLD68ZAo7W4JEorUh6VvilukkyHXfMXTOVk
	p4oPjFuob6GI+yE+GSeoLzzvI5bm6GpxXTruCJmm4bX8DrQc/L29K9YN9Qa57uAFLUCebK4gMH8
	q0g==
X-Google-Smtp-Source: AGHT+IETOiD/fnVaI7HlCUvzudMnRRTDxHkI9zQSOOTkGEdDBCgLlWaLvSy4vbuVYOwf9yPymsVixQ==
X-Received: by 2002:a05:6214:5345:b0:6c3:6d28:c2ed with SMTP id 6a1803df08f44-6c573590297mr296652986d6.28.1726496157819;
        Mon, 16 Sep 2024 07:15:57 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c58c7d7372sm24972226d6.133.2024.09.16.07.15.57
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 07:15:57 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6c36ff6e981so34934436d6.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Sep 2024 07:15:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXj4MBhCsreZgC4Gluyy1pSUd5i5yYEXsxpcW0mncrRJhfHLvDTsW95qaCeYop6ziKDaSzjbTpZ3bUKczWq+g==@lists.infradead.org
X-Received: by 2002:a05:6214:5245:b0:6c3:6e5e:64d4 with SMTP id
 6a1803df08f44-6c5736c8fdbmr253820506d6.32.1726496156795; Mon, 16 Sep 2024
 07:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-7-wenst@chromium.org>
 <CAD=FV=Udc9aP7bSzTWP82zsaztRD2YnVNpSDA54FC0dKQ-Nz2A@mail.gmail.com> <CAGXv+5FRoiv+TPyeFTcuRanRuSh2-xUo6ttVPkW6o3tktUmcFA@mail.gmail.com>
In-Reply-To: <CAGXv+5FRoiv+TPyeFTcuRanRuSh2-xUo6ttVPkW6o3tktUmcFA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Sep 2024 07:15:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UDoaBN4OLZhEB4uvs6vDRVS0ZAsce2=3rJOn5sKEu-hw@mail.gmail.com>
Message-ID: <CAD=FV=UDoaBN4OLZhEB4uvs6vDRVS0ZAsce2=3rJOn5sKEu-hw@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] i2c: Introduce OF component probe function
To: Chen-Yu Tsai <wenst@chromium.org>
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
X-CRM114-CacheID: sfid-20240916_071559_711550_4E0AF3F8 
X-CRM114-Status: GOOD (  37.45  )
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

Hi,

On Sun, Sep 15, 2024 at 4:32=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> > > + * Assumes that across the entire device tree the only instances of =
nodes
> > > + * prefixed with "type" are the ones that need handling for second s=
ource
> > > + * components. In other words, if "type" is "touchscreen", then all =
device
> > > + * nodes named "touchscreen*" are the ones that need probing. There =
cannot
> >
> > "touchscreen*" implies that it can have an arbitrary suffix. Can it?
>
> That is the idea. The use case is for components that have conflicting
> addresses and need special probing. Such device nodes obviously can't
> have the same node name. This is planned but not implemented in this
> series.

Maybe "touchscreen@*" instead of "touchscreen*" if I'm understanding correc=
tly.


> > > + * be another "touchscreen" node that is already enabled.
> > > + *
> > > + * Assumes that for each "type" of component, only one actually exis=
ts. In
> > > + * other words, only one matching and existing device will be enable=
d.
> > > + *
> > > + * Context: Process context only. Does non-atomic I2C transfers.
> > > + *          Should only be used from a driver probe function, as the=
 function
> > > + *          can return -EPROBE_DEFER if the I2C adapter or other res=
ources
> > > + *          are unavailable.
> > > + * Return: 0 on success or no-op, error code otherwise.
> > > + *         A no-op can happen when it seems like the device tree alr=
eady
> > > + *         has components of the type to be probed already enabled. =
This
> > > + *         can happen when the device tree had not been updated to m=
ark
> > > + *         the status of the to-be-probed components as "fail". Or t=
his
> > > + *         function was already run with the same parameters and suc=
ceeded
> > > + *         in enabling a component. The latter could happen if the u=
ser
> >
> > s/latter/later
>
> Are you sure?

No. latter looked weird to me and I searched quickly and thought I was
right. With a more full search looks like you're right.


> > > +int i2c_of_probe_component(struct device *dev, const struct i2c_of_p=
robe_cfg *cfg, void *ctx)
> > > +{
> > > +       const struct i2c_of_probe_ops *ops;
> > > +       const char *type;
> > > +       struct device_node *i2c_node;
> > > +       struct i2c_adapter *i2c;
> > > +       int ret;
> > > +
> > > +       if (!cfg)
> > > +               return -EINVAL;
> >
> > Drop extra check of "!cfg". In general kernel conventions don't check
> > for NULL pointers passed by caller unless it's an expected case. You
> > don't check for a NULL "dev" and you shouldn't need to check for a
> > NULL "cfg". They are both simply required parameters.
>
> "dev" is only passed to dev_printk(), and that can handle "dev" being
> NULL. Same can't be said for "cfg".
>
> I don't know what the preference is though. Crashing is probably not the
> nicest thing, even if it only happens to developers.

Honestly as a developer I'd prefer the crash. It points out the exact
line where I had an invalid NULL. Returning an error code means I've
got to compile/boot several more times to track down where the error
code is coming from.

I'm fairly certain that the kernel convention is to only check things
for NULL if it's part of the API to accept NULL or if the value can be
NULL due to untrusted data. If the only way it can be NULL is due to
buggy code elsewhere in the kernel then you should omit the error
checks.

> > > +               if (!of_device_is_available(node))
> > > +                       continue;
> > > +
> > > +               /*
> > > +                * Device tree has component already enabled. Either =
the
> > > +                * device tree isn't supported or we already probed o=
nce.
> > > +                */
> > > +               ret =3D 0;
> > > +               goto out_put_i2c_node;
> > > +       }
> > > +
> > > +       i2c =3D of_get_i2c_adapter_by_node(i2c_node);
> > > +       if (!i2c) {
> > > +               ret =3D dev_err_probe(dev, -EPROBE_DEFER, "Couldn't g=
et I2C adapter\n");
> > > +               goto out_put_i2c_node;
> > > +       }
> > > +
> > > +       /* Grab resources */
> > > +       ret =3D 0;
> > > +       if (ops->get_resources)
> > > +               ret =3D ops->get_resources(dev, i2c_node, ctx);
> > > +       if (ret)
> > > +               goto out_put_i2c_adapter;
> > > +
> > > +       /* Enable resources */
> > > +       if (ops->enable)
> > > +               ret =3D ops->enable(dev, ctx);
> > > +       if (ret)
> > > +               goto out_release_resources;
> >
> > I won't insist, but a part of me wonders whether we should just
> > combine "get_resources" and "enable" and then combine "cleanup" and
> > "free_resources_late". They are always paired one after another and
> > I'm having a hard time seeing why they need to be separate. It's not
> > like you'll ever get the resources and then enable/disable multiple
> > times.
>
> Maybe. The structure was carried over from the original non-callback
> version. I think it's easier to reason about if they are kept separate,
> especially since the outgoing path is slightly different when no working
> component is found and one of the callbacks ends up not getting called.

Actually, both of the outgoing callbacks are always called. It's only
the 3rd callback (the "early" one) that's called sometimes.

I won't insist on combining them, but I still feel like combining them
would be better. I'd be interested in other opinions, though.


-Doug

