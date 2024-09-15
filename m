Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C39CC35FE4
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Sep 2024 11:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3jqgD7JGOh3XQ9WV2JGG8COEbPlsIIfrvC/7Hdf1d4I=; b=TWG+O39zfcHhjI2f6gKgN50Pae
	ye/2RbnDko/qsEwI4zOd4FytQY5NP86mCqw0PSj7uFshl0gHFEjUPHSt/jPVrt2kaHB5MjDvyrLGG
	ulnmzCCLSPqAqVcohqAQ76J+NnBwzWFY1gdFr94l16Nh60q98115hsUq0SmR/8uRrlQmp/pCAs+vN
	hD3wn34P7saKBgvzIn6rLFHZGCby+k2DdxF1yIMZLLft8Lw1pQk70UDbOamuYH9Beq9szhawAPJux
	pwpvxi3qNIezyGHzF56qdrVanPKY5Z3YWWm3we42pkbsQs4Qk74Iz4xJRSVc9FTy26ywn5rOEsRGz
	vccVv6cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spnVq-000000021Mh-3JTL;
	Sun, 15 Sep 2024 11:33:54 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spnUk-000000021Hc-0JlL
	for linux-mediatek@lists.infradead.org;
	Sun, 15 Sep 2024 11:32:48 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5356bb5522bso2905706e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 15 Sep 2024 04:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726399964; x=1727004764; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jqgD7JGOh3XQ9WV2JGG8COEbPlsIIfrvC/7Hdf1d4I=;
        b=eH3p9/Ycy1cyUA7/m6Y/pUD3UIskqSRGoFuPKiIrzGcey0T2ovTdZhSntsdImqsIpv
         OVc7qErUWKO7LMfLqWgPDkSa/F64GSNAnaW3GIPLDfjT44/gf6jX77geK5/VV16MRCwu
         P+N/jgZfDYaQpgt44exZHmgKfMAqkmE3QPdu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726399964; x=1727004764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jqgD7JGOh3XQ9WV2JGG8COEbPlsIIfrvC/7Hdf1d4I=;
        b=gxYfA+xkqDaNvk8Y3RYF/MsuPRPhO3CooOZlixDxnQ4jpFwQs2+855Lf+4+2O19Lh3
         IEpO9w9CF7EFkdsitQwCUNnn8Uy/Xr+LMnSu9f1SYMOA+HLwEnlBPacgMF17hXrqyz+J
         WgN5jnRKdFuR6RAvGeXBzja1uY+M4cQVzChzsbNVEXO5YXfCZDu/IvgJ8Z+vjy1j+w0G
         tVa1A2pxjLY2n6+hDHuMxzigVKAzLV7tgRGnP5WKwLVgAKXMnNUhlaw6io5mG3Obubpd
         +P4R5gesssPvatbfRReZhxgYs+Dygbcxi5geI8hwTCQlCjGXCbp32KqeTVvthnvafhCt
         JdWg==
X-Forwarded-Encrypted: i=1; AJvYcCVbFEkoBBsASn1SJcG12wt0G8/F7TsZKuIyB0thTjW0cHvj3ObjcGkuADnevjydITODTSCADDHZR/ca3jUwQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDNJUh96orjtFbA438oJYE8uhD4VKWLxVA5m/UbrvkVTSKQg5p
	l/ASTLhbsL4+5hmY5wo9NJq2ld2o0aKz6ZzMrnG9NNQYy4Z0+dGVwgMZMLWllHV8sBUfnpVgXdY
	xu06bUWM7Ze6CM4JHVEIpy67p/oJjwD7k6JZy
X-Google-Smtp-Source: AGHT+IFwmiQcKMAA0cM4UP9yt10EN0wVUgbSokaKnMqT+tBazXs/fmJfvGPNeXWF3G9iOi3lB19695luyPtvvpRK0xc=
X-Received: by 2002:a05:6512:a90:b0:535:3dae:a14b with SMTP id
 2adb3069b0e04-5367feba05emr4032845e87.2.1726399963747; Sun, 15 Sep 2024
 04:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-7-wenst@chromium.org>
 <CAD=FV=Udc9aP7bSzTWP82zsaztRD2YnVNpSDA54FC0dKQ-Nz2A@mail.gmail.com>
In-Reply-To: <CAD=FV=Udc9aP7bSzTWP82zsaztRD2YnVNpSDA54FC0dKQ-Nz2A@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Sun, 15 Sep 2024 13:32:32 +0200
Message-ID: <CAGXv+5FRoiv+TPyeFTcuRanRuSh2-xUo6ttVPkW6o3tktUmcFA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240915_043246_173077_09675779 
X-CRM114-Status: GOOD (  63.37  )
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

On Sat, Sep 14, 2024 at 1:44=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, Sep 11, 2024 at 12:28=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> >
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
> > this change introduces a simple I2C component probe. function For a
>
> s/probe. function/probe function./

Ack.

> > +static int i2c_of_probe_enable_node(struct device *dev, struct device_=
node *node)
> > +{
> > +       int ret;
> > +
> > +       dev_info(dev, "Enabling %pOF\n", node);
> > +
> > +       struct of_changeset *ocs __free(kfree) =3D kzalloc(sizeof(*ocs)=
, GFP_KERNEL);
> > +       if (!ocs)
> > +               return -ENOMEM;
>
> I guess the kernel lets you mix code and declarations now? I'm still
> used to all declarations being together but maybe I'm old school... I
> would have put the "dev_info" below the allocation...

AFAIK this is an exception. Excerpt from include/linux/cleanup.h:

    When the unwind order matters it requires that variables be defined
    mid-function scope rather than at the top of the file.

and

    Given that the "__free(...) =3D NULL" pattern for variables defined at
    the top of the function poses this potential interdependency problem
    the recommendation is to always define and assign variables in one
    statement and not group variable definitions at the top of the
    function when __free() is used.


>
> > +/**
> > + * i2c_of_probe_component() - probe for devices of "type" on the same =
i2c bus
> > + * @dev: Pointer to the &struct device of the caller, only used for de=
v_printk() messages.
> > + * @cfg: Pointer to the &struct i2c_of_probe_cfg containing callbacks =
and other options
> > + *       for the prober.
> > + * @ctx: Context data for callbacks.
> > + *
> > + * Probe for possible I2C components of the same "type" (&i2c_of_probe=
_cfg->type)
> > + * on the same I2C bus that have their status marked as "fail".
>
> I may have missed it, but originally this was ones marked
> "fail-needs-probe", right? Now it tries all types of fail?
>
>
> > + * Assumes that across the entire device tree the only instances of no=
des
> > + * prefixed with "type" are the ones that need handling for second sou=
rce
> > + * components. In other words, if "type" is "touchscreen", then all de=
vice
> > + * nodes named "touchscreen*" are the ones that need probing. There ca=
nnot
>
> "touchscreen*" implies that it can have an arbitrary suffix. Can it?

That is the idea. The use case is for components that have conflicting
addresses and need special probing. Such device nodes obviously can't
have the same node name. This is planned but not implemented in this
series.

> ...or can it just have a unit address?

IIUC in DT jargon the "node name" does not include the address. The name
including the address is the "full name".

> > + * be another "touchscreen" node that is already enabled.
> > + *
> > + * Assumes that for each "type" of component, only one actually exists=
. In
> > + * other words, only one matching and existing device will be enabled.
> > + *
> > + * Context: Process context only. Does non-atomic I2C transfers.
> > + *          Should only be used from a driver probe function, as the f=
unction
> > + *          can return -EPROBE_DEFER if the I2C adapter or other resou=
rces
> > + *          are unavailable.
> > + * Return: 0 on success or no-op, error code otherwise.
> > + *         A no-op can happen when it seems like the device tree alrea=
dy
> > + *         has components of the type to be probed already enabled. Th=
is
> > + *         can happen when the device tree had not been updated to mar=
k
> > + *         the status of the to-be-probed components as "fail". Or thi=
s
> > + *         function was already run with the same parameters and succe=
eded
> > + *         in enabling a component. The latter could happen if the use=
r
>
> s/latter/later

Are you sure?

> > + *         had multiple types of components to probe, and one of them =
down
> > + *         the list caused a deferred probe. This is expected behavior=
.
> > + */
> > +int i2c_of_probe_component(struct device *dev, const struct i2c_of_pro=
be_cfg *cfg, void *ctx)
> > +{
> > +       const struct i2c_of_probe_ops *ops;
> > +       const char *type;
> > +       struct device_node *i2c_node;
> > +       struct i2c_adapter *i2c;
> > +       int ret;
> > +
> > +       if (!cfg)
> > +               return -EINVAL;
>
> Drop extra check of "!cfg". In general kernel conventions don't check
> for NULL pointers passed by caller unless it's an expected case. You
> don't check for a NULL "dev" and you shouldn't need to check for a
> NULL "cfg". They are both simply required parameters.

"dev" is only passed to dev_printk(), and that can handle "dev" being
NULL. Same can't be said for "cfg".

I don't know what the preference is though. Crashing is probably not the
nicest thing, even if it only happens to developers.

> There are a few other places in the patch series where it feels like
> there are extra arg checks that aren't really needed...
>
>
> > +       ops =3D cfg->ops ?: &i2c_of_probe_dummy_ops;
> > +       type =3D cfg->type;
> > +
> > +       i2c_node =3D i2c_of_probe_get_i2c_node(dev, type);
> > +       if (IS_ERR(i2c_node))
> > +               return PTR_ERR(i2c_node);
> > +
> > +       for_each_child_of_node_with_prefix(i2c_node, node, type) {
>
> I wouldn't object to a comment before this for loop:
>
> /* If any devices of this type are already enabled then the function
> is a noop */
>
> ...or it could be a helper function.

That is what the commeet within the loop is trying to say. I'll move
it before the loop and incorporate your words. The loop can then be
rewritten to return early.

> > +               if (!of_device_is_available(node))
> > +                       continue;
> > +
> > +               /*
> > +                * Device tree has component already enabled. Either th=
e
> > +                * device tree isn't supported or we already probed onc=
e.
> > +                */
> > +               ret =3D 0;
> > +               goto out_put_i2c_node;
> > +       }
> > +
> > +       i2c =3D of_get_i2c_adapter_by_node(i2c_node);
> > +       if (!i2c) {
> > +               ret =3D dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get=
 I2C adapter\n");
> > +               goto out_put_i2c_node;
> > +       }
> > +
> > +       /* Grab resources */
> > +       ret =3D 0;
> > +       if (ops->get_resources)
> > +               ret =3D ops->get_resources(dev, i2c_node, ctx);
> > +       if (ret)
> > +               goto out_put_i2c_adapter;
> > +
> > +       /* Enable resources */
> > +       if (ops->enable)
> > +               ret =3D ops->enable(dev, ctx);
> > +       if (ret)
> > +               goto out_release_resources;
>
> I won't insist, but a part of me wonders whether we should just
> combine "get_resources" and "enable" and then combine "cleanup" and
> "free_resources_late". They are always paired one after another and
> I'm having a hard time seeing why they need to be separate. It's not
> like you'll ever get the resources and then enable/disable multiple
> times.

Maybe. The structure was carried over from the original non-callback
version. I think it's easier to reason about if they are kept separate,
especially since the outgoing path is slightly different when no working
component is found and one of the callbacks ends up not getting called.

> > +/**
> > + * struct i2c_of_probe_ops - I2C OF component prober callbacks
> > + *
> > + * A set of callbacks to be used by i2c_of_probe_component().
> > + *
> > + * All callbacks are optional. Callbacks are called only once per run,=
 and are
> > + * used in the order they are defined in this structure.
> > + *
> > + * All callbacks that have return values shall return %0 on success,
> > + * or a negative error number on failure.
> > + *
> > + * The @dev parameter passed to the callbacks is the same as @dev pass=
ed to
> > + * i2c_of_probe_component(). It should only be used for dev_printk() c=
alls
> > + * and nothing else, especially not managed device resource (devres) A=
PIs.
> > + */
> > +struct i2c_of_probe_ops {
> > +       /** @get_resources: Retrieve resources for components. */
> > +       int (*get_resources)(struct device *dev, struct device_node *bu=
s_node, void *data);
> > +
> > +       /** @free_resources_early: Release exclusive resources prior to=
 enabling component. */
> > +       void (*free_resources_early)(void *data);
>
> It would be good if the doc here mentioned what happened if no
> components were found and thus nothing was enabled. Is the function
> still called? It looks like "no" and "cleanup" is in charge of
> cleaning in this case. Feels like the docs need to be more explicit.

Ack.


Thanks
ChenYu

