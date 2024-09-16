Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC2CC3ABB2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 15:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXbO+D2mVI+UBDU39q5KHUW0ColIXLF8fjiXY9cUqkk=; b=xtHx4bgd40fT+kxY9XPitKpKK9
	NK8F8sBS9Di/ypJ0Xvl3rGdCI/cSL7aUz/8YqVg4HZtB4wPHJYk1uJwOmt20zGsU9NQWucMEoKgWl
	rxlLJhpdw45hNPZW/y3nVuan3FiepaTpm0bF+vIYtfojsQ6O1QzMvynImXNXNVTb5I4WgP0PLvLia
	EKy23eGFvC0mRI38L9jR1c/M+7++rvWD7XwAoJEFsOlffYwDKZaPdMP6upebImzgl5F/teBhH3kCI
	17kvXDZRD+D2T8OWb9nje7U1nvIaqNI3lp2yiFOUNip+m+uPdIP+AoGLN/qnXO2eq76Hfnyblw3Ic
	AjDE70rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqDEH-00000004HcU-2jcy;
	Mon, 16 Sep 2024 15:01:29 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqDD3-00000004HI8-0sev
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Sep 2024 15:00:15 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5365d3f9d34so3563605e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Sep 2024 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726498811; x=1727103611; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXbO+D2mVI+UBDU39q5KHUW0ColIXLF8fjiXY9cUqkk=;
        b=MJZfFKDdg4WZHYHW2CHEnUi57OwZAF3o/qLJsmCwczDpjlB0kkfWJlZ4E5rnKghvrR
         DB8I33NOmW3iitWovQ+RDv4atLBtmERsIR0TbjIh6HHKKfaq2IfCE6UTxRBuL1NwhzoQ
         Ze9TyBL8WCjrqahNaRS0xCSdc3dql3cQi+jSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726498811; x=1727103611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXbO+D2mVI+UBDU39q5KHUW0ColIXLF8fjiXY9cUqkk=;
        b=HDUbFwxmjXKl4kDLyufURsw0RgyCDZxqQiD6VVU1rGs32glbcpITMVQ5g9JdKThedY
         6R6rELe/tgwulPjuTgI9itQgNUt8pxep5ZUtKnMgcc9RohY2P2L2mvngs5b9c8chZvvR
         V9SJ036JxElKlAp34GdFmBeQoyPLbMhfb38i4CoPJ+JV0GuwmHYG4epF+dVCerA0sPSx
         YAzHAahAohhG8IeCgO/UzWb+JbLtE+0c6FpyG3WMhzrP4JWoD0M/FnAZahYwM0lMecB9
         K+jLHnX7+ExkeKfHZZNepwfNinZO+smRdAFp7FEuJnSvojeaBaZE1mU5Mp4/DZythMnb
         LIaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW44S2tO0JbIj9JQMBFF3QwUTP9W+K4kYmgHLv6umxA+mhfPPC4Y7GcSV8nVd1qhV3PcJ6/bkv64kr7yqZQ0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCeyu5+WsR0zDB9fCqmzQr8YI6xb/o8CMwNJP2M9UzAWglziWl
	XKWRX8q4HzXmDb7BgzyGnrD1dBhsVXixKJ0IXDetCTuEugorRAhsYLJXQrUQrNcvuDfc3UGlrJc
	PkDcwlcAbZa0hP3IzlPx+Q/Bgi4keHFCLLQW5
X-Google-Smtp-Source: AGHT+IExxtSOdUaIDWYWqE4hbqGtSDreuAB4hMGiJcyjVPhu0E40r8ul9HIo9VA3zWefCMXKc/icuLN8A8D0fAPnWL0=
X-Received: by 2002:a05:6512:10d0:b0:536:5515:e9b5 with SMTP id
 2adb3069b0e04-5367ff3230fmr5531071e87.52.1726498810983; Mon, 16 Sep 2024
 08:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-7-wenst@chromium.org>
 <ZuQTFTNTBLCziD05@smile.fi.intel.com> <CAGXv+5HgkCZ=vdHGgvCW1U-nid=cQrVaxC+V+H2Gknf2pnTbYA@mail.gmail.com>
 <ZugKHrzs5BWoDr1c@smile.fi.intel.com>
In-Reply-To: <ZugKHrzs5BWoDr1c@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 16 Sep 2024 16:59:59 +0200
Message-ID: <CAGXv+5E09LH5UKXh0wHrsqAp-ps8xaGfSZ37GWZ6sbyoaOczfQ@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] i2c: Introduce OF component probe function
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
X-CRM114-CacheID: sfid-20240916_080013_276784_FF3A66BF 
X-CRM114-Status: GOOD (  26.70  )
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

On Mon, Sep 16, 2024 at 12:36=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Sep 15, 2024 at 12:44:13PM +0200, Chen-Yu Tsai wrote:
> > On Fri, Sep 13, 2024 at 12:25=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, Sep 11, 2024 at 03:27:44PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
> > > > +int i2c_of_probe_component(struct device *dev, const struct i2c_of=
_probe_cfg *cfg, void *ctx)
> > > > +{
> > > > +     const struct i2c_of_probe_ops *ops;
> > > > +     const char *type;
> > > > +     struct device_node *i2c_node;
> > > > +     struct i2c_adapter *i2c;
> > > > +     int ret;
> > > > +
> > > > +     if (!cfg)
> > > > +             return -EINVAL;
> > > > +
> > > > +     ops =3D cfg->ops ?: &i2c_of_probe_dummy_ops;
> > > > +     type =3D cfg->type;
> > > > +
> > > > +     i2c_node =3D i2c_of_probe_get_i2c_node(dev, type);
> > >
> > >
> > >         struct device_node *i2c_node __free(of_node_put) =3D
> > >                 i2c_...;
> >
> > cleanup.h says to not mix the two styles (scoped vs goto). I was trying
> > to follow that, though I realize now that with the scoped loops it
> > probably doesn't help.
> >
> > I'll revert back to having __free().
> >
> > > > +     if (IS_ERR(i2c_node))
> > > > +             return PTR_ERR(i2c_node);
> > > > +
> > > > +     for_each_child_of_node_with_prefix(i2c_node, node, type) {
> > > > +             if (!of_device_is_available(node))
> > > > +                     continue;
> > > > +
> > > > +             /*
> > > > +              * Device tree has component already enabled. Either =
the
> > > > +              * device tree isn't supported or we already probed o=
nce.
> > > > +              */
> > > > +             ret =3D 0;
> > >
> > > Shouldn't you drop reference count for "node"? (See also below)
> >
> > This for-each loop the "scoped". It just doesn't have the prefix anymor=
e.
> > I believe you asked if the prefix could be dropped and then Rob agreed.
>
> Hmm... I have looked into the implementation and I haven't found the evid=
ence
> that this is anyhow scoped. Can you point out what I have missed?

From patch 2:

+#define for_each_child_of_node_with_prefix(parent, child, prefix)      \
+       for (struct device_node *child __free(device_node) =3D            \

                                 ^^^^^^^^^^^^^^^^^^^^^^^^^ scoped here

+            of_get_next_child_with_prefix(parent, NULL, prefix);       \
+            child !=3D NULL;                                             \
+            child =3D of_get_next_child_with_prefix(parent, child, prefix)=
)
+

"node", or "child" in this snippet is scoped within the for loop.


ChenYu

> > > > +             goto out_put_i2c_node;
> > > > +     }
> > > > +
> > > > +     i2c =3D of_get_i2c_adapter_by_node(i2c_node);
> > > > +     if (!i2c) {
> > > > +             ret =3D dev_err_probe(dev, -EPROBE_DEFER, "Couldn't g=
et I2C adapter\n");
> > > > +             goto out_put_i2c_node;
> > > > +     }
> > > > +
> > > > +     /* Grab resources */
> > > > +     ret =3D 0;
> > > > +     if (ops->get_resources)
> > > > +             ret =3D ops->get_resources(dev, i2c_node, ctx);
> > > > +     if (ret)
> > > > +             goto out_put_i2c_adapter;
> > > > +
> > > > +     /* Enable resources */
> > > > +     if (ops->enable)
> > > > +             ret =3D ops->enable(dev, ctx);
> > > > +     if (ret)
> > > > +             goto out_release_resources;
> > > > +
> > > > +     ret =3D 0;
> > > > +     for_each_child_of_node_with_prefix(i2c_node, node, type) {
> > > > +             union i2c_smbus_data data;
> > > > +             u32 addr;
> > > > +
> > > > +             if (of_property_read_u32(node, "reg", &addr))
> > > > +                     continue;
> > > > +             if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I=
2C_SMBUS_BYTE, &data) < 0)
> > > > +                     continue;
> > > > +
> > > > +             /* Found a device that is responding */
> > > > +             if (ops->free_resources_early)
> > > > +                     ops->free_resources_early(ctx);
> > > > +             ret =3D i2c_of_probe_enable_node(dev, node);
> > >
> > > Hmm... Is "node" reference count left bumped up for a reason?
> >
> > Same as above.
>
> Same as above.
>
> > > > +             break;
> > > > +     }
> > > > +
> > > > +     if (ops->cleanup)
> > > > +             ops->cleanup(dev, ctx);
> > > > +out_release_resources:
> > > > +     if (ops->free_resources_late)
> > > > +             ops->free_resources_late(ctx);
> > > > +out_put_i2c_adapter:
> > > > +     i2c_put_adapter(i2c);
> > > > +out_put_i2c_node:
> > > > +     of_node_put(i2c_node);
> > > > +
> > > > +     return ret;
> > > > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

