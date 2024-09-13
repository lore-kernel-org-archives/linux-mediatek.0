Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D80FC6184
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 23:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Sb9UtIlLwG79dUWEaupctUHL7lQqw6cZ7frxycygKw=; b=B6rEX3fap9MKJ3+Wm2s8LXdk9Z
	ykkoSc2i8qhNo10UAupxNluVbtIfoTUMdw7I9k/FzYM762w58dj6wdG3L06hEMIPZD0xw0ssh9NI2
	/enQ1r5orLMToKXSdf/Se52q1gjjOmTUAudjuy/cU4ovW5DxIXxW93DB/U6/yQYetj2ggKPOX/j6f
	Y8yY8sIqkTHv5zrRDy/pnwFDcaol+mM9bABQt0iCKwT9u7RCxPZt3uM298qCp/1NP8rBN6umUPzLT
	8yPWXjSS46CqhpaO4VcTWuVPiQIvU74BlWX1pJLZWNSFYGGr6gQX4zg5S2WEvwlbmNiPFy7HfQNao
	TQ8YnpxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spFxm-0000000HN8y-00F6;
	Fri, 13 Sep 2024 23:44:30 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spFwi-0000000HMxk-1LhI
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Sep 2024 23:43:25 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7a9a7bea3d8so209063385a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Sep 2024 16:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726270998; x=1726875798; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Sb9UtIlLwG79dUWEaupctUHL7lQqw6cZ7frxycygKw=;
        b=g9mRFJIzjy2a0jF74LtHJDoHNdrG1vdLjdhGC62Au/230pfYTEXhMx57m78ioQ1G+J
         +/YfG4Wor1/rAuHo7t3uMyJBHpZ3JuUVkC90QZrYy3j+4SRhk6Sf+oE2Odwkud/i1QC/
         hSfKNk+jRditXdgISCvjfyq6AEbM1IFdHjqIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726270998; x=1726875798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Sb9UtIlLwG79dUWEaupctUHL7lQqw6cZ7frxycygKw=;
        b=H/sVoMgUh/DEHmajoXEzQHoe1AbLoIUo54ygC1fmsjkBn7zy7y4b/+fKVSlwstkjI4
         VrAqQojrbbpayBk6ZkXKkbURlfkntEZECz7OVPorJrXOYH1HM5bHb1JG5YGdgZE322/W
         YZ+rNSPuvibTZcPYQ6HTQkDgC8oToH4N7Nqv+GPA2VGCkI380noUwTVMQONvYoaveOKQ
         ZEY8b5mvTRtqE0CkgP9ByMvZurs7W3FxiWoOMr7kttdDsh4G7pjGCABMz0wvpC4XwJzp
         G6WYxWkmkJTYPTj3lAnUVAStaz5cNJkcKmzN5vvlXuf+zxsuxLdDIAz1ULCGmZt7YReN
         KhUA==
X-Forwarded-Encrypted: i=1; AJvYcCV48/JNK6lPyrP77VPdIRnjhrUZ5khcV4Ez5wKvlgZIjPl2UYToxWjD6g+wY1vp6D5WMpR9eOy8yuWwcAJRAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHgKHLRT+sJ7KyBC4ENFqAMX+DamWTI7oblflqTx024WPpPl2i
	0S5j2SttYTtthqm+WyPnft4rld4RMSQUcJEpJDlCxKqyJcx//yqza4eCKtOt5ad92pI1oGB9cLo
	=
X-Google-Smtp-Source: AGHT+IFGdMqLC/XtrCQBNnjXstoBEvTQ5x/9KucXcxrU7oAY0UflhDpOi91x8knMgbLPktL9MLfggA==
X-Received: by 2002:a05:620a:4045:b0:7a3:5004:43dc with SMTP id af79cd13be357-7a9e5f67513mr1331381685a.40.1726270997724;
        Fri, 13 Sep 2024 16:43:17 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ab3e95bd5fsm14160285a.25.2024.09.13.16.43.16
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 16:43:17 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6bf7ad1ec3aso19610706d6.0
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Sep 2024 16:43:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUryhgqvCKP1ztRR1QJ8QODbehtfSi/XtAZJi2LCWLaY4KtdGDi3s26DqwjxtYtLFq17JAbgPV4VxOAptKwrQ==@lists.infradead.org
X-Received: by 2002:a05:6214:4489:b0:6c5:1121:ab9d with SMTP id
 6a1803df08f44-6c573590a56mr132730356d6.49.1726270995740; Fri, 13 Sep 2024
 16:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240911072751.365361-1-wenst@chromium.org> <20240911072751.365361-7-wenst@chromium.org>
In-Reply-To: <20240911072751.365361-7-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Sep 2024 16:43:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Udc9aP7bSzTWP82zsaztRD2YnVNpSDA54FC0dKQ-Nz2A@mail.gmail.com>
Message-ID: <CAD=FV=Udc9aP7bSzTWP82zsaztRD2YnVNpSDA54FC0dKQ-Nz2A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240913_164324_374901_DB6B2AFD 
X-CRM114-Status: GOOD (  48.02  )
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

On Wed, Sep 11, 2024 at 12:28=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> Some devices are designed and manufactured with some components having
> multiple drop-in replacement options. These components are often
> connected to the mainboard via ribbon cables, having the same signals
> and pin assignments across all options. These may include the display
> panel and touchscreen on laptops and tablets, and the trackpad on
> laptops. Sometimes which component option is used in a particular device
> can be detected by some firmware provided identifier, other times that
> information is not available, and the kernel has to try to probe each
> device.
>
> This change attempts to make the "probe each device" case cleaner. The
> current approach is to have all options added and enabled in the device
> tree. The kernel would then bind each device and run each driver's probe
> function. This works, but has been broken before due to the introduction
> of asynchronous probing, causing multiple instances requesting "shared"
> resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> time, with only one instance succeeding. Work arounds for these include
> moving the pinmux to the parent I2C controller, using GPIO hogs or
> pinmux settings to keep the GPIO pins in some fixed configuration, and
> requesting the interrupt line very late. Such configurations can be seen
> on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> Lenovo Thinkpad 13S.
>
> Instead of this delicate dance between drivers and device tree quirks,
> this change introduces a simple I2C component probe. function For a

s/probe. function/probe function./


> +static int i2c_of_probe_enable_node(struct device *dev, struct device_no=
de *node)
> +{
> +       int ret;
> +
> +       dev_info(dev, "Enabling %pOF\n", node);
> +
> +       struct of_changeset *ocs __free(kfree) =3D kzalloc(sizeof(*ocs), =
GFP_KERNEL);
> +       if (!ocs)
> +               return -ENOMEM;

I guess the kernel lets you mix code and declarations now? I'm still
used to all declarations being together but maybe I'm old school... I
would have put the "dev_info" below the allocation...


> +/**
> + * i2c_of_probe_component() - probe for devices of "type" on the same i2=
c bus
> + * @dev: Pointer to the &struct device of the caller, only used for dev_=
printk() messages.
> + * @cfg: Pointer to the &struct i2c_of_probe_cfg containing callbacks an=
d other options
> + *       for the prober.
> + * @ctx: Context data for callbacks.
> + *
> + * Probe for possible I2C components of the same "type" (&i2c_of_probe_c=
fg->type)
> + * on the same I2C bus that have their status marked as "fail".

I may have missed it, but originally this was ones marked
"fail-needs-probe", right? Now it tries all types of fail?


> + * Assumes that across the entire device tree the only instances of node=
s
> + * prefixed with "type" are the ones that need handling for second sourc=
e
> + * components. In other words, if "type" is "touchscreen", then all devi=
ce
> + * nodes named "touchscreen*" are the ones that need probing. There cann=
ot

"touchscreen*" implies that it can have an arbitrary suffix. Can it?
...or can it just have a unit address?


> + * be another "touchscreen" node that is already enabled.
> + *
> + * Assumes that for each "type" of component, only one actually exists. =
In
> + * other words, only one matching and existing device will be enabled.
> + *
> + * Context: Process context only. Does non-atomic I2C transfers.
> + *          Should only be used from a driver probe function, as the fun=
ction
> + *          can return -EPROBE_DEFER if the I2C adapter or other resourc=
es
> + *          are unavailable.
> + * Return: 0 on success or no-op, error code otherwise.
> + *         A no-op can happen when it seems like the device tree already
> + *         has components of the type to be probed already enabled. This
> + *         can happen when the device tree had not been updated to mark
> + *         the status of the to-be-probed components as "fail". Or this
> + *         function was already run with the same parameters and succeed=
ed
> + *         in enabling a component. The latter could happen if the user

s/latter/later

> + *         had multiple types of components to probe, and one of them do=
wn
> + *         the list caused a deferred probe. This is expected behavior.
> + */
> +int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe=
_cfg *cfg, void *ctx)
> +{
> +       const struct i2c_of_probe_ops *ops;
> +       const char *type;
> +       struct device_node *i2c_node;
> +       struct i2c_adapter *i2c;
> +       int ret;
> +
> +       if (!cfg)
> +               return -EINVAL;

Drop extra check of "!cfg". In general kernel conventions don't check
for NULL pointers passed by caller unless it's an expected case. You
don't check for a NULL "dev" and you shouldn't need to check for a
NULL "cfg". They are both simply required parameters.

There are a few other places in the patch series where it feels like
there are extra arg checks that aren't really needed...


> +       ops =3D cfg->ops ?: &i2c_of_probe_dummy_ops;
> +       type =3D cfg->type;
> +
> +       i2c_node =3D i2c_of_probe_get_i2c_node(dev, type);
> +       if (IS_ERR(i2c_node))
> +               return PTR_ERR(i2c_node);
> +
> +       for_each_child_of_node_with_prefix(i2c_node, node, type) {

I wouldn't object to a comment before this for loop:

/* If any devices of this type are already enabled then the function
is a noop */

...or it could be a helper function.


> +               if (!of_device_is_available(node))
> +                       continue;
> +
> +               /*
> +                * Device tree has component already enabled. Either the
> +                * device tree isn't supported or we already probed once.
> +                */
> +               ret =3D 0;
> +               goto out_put_i2c_node;
> +       }
> +
> +       i2c =3D of_get_i2c_adapter_by_node(i2c_node);
> +       if (!i2c) {
> +               ret =3D dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get I=
2C adapter\n");
> +               goto out_put_i2c_node;
> +       }
> +
> +       /* Grab resources */
> +       ret =3D 0;
> +       if (ops->get_resources)
> +               ret =3D ops->get_resources(dev, i2c_node, ctx);
> +       if (ret)
> +               goto out_put_i2c_adapter;
> +
> +       /* Enable resources */
> +       if (ops->enable)
> +               ret =3D ops->enable(dev, ctx);
> +       if (ret)
> +               goto out_release_resources;

I won't insist, but a part of me wonders whether we should just
combine "get_resources" and "enable" and then combine "cleanup" and
"free_resources_late". They are always paired one after another and
I'm having a hard time seeing why they need to be separate. It's not
like you'll ever get the resources and then enable/disable multiple
times.


> +/**
> + * struct i2c_of_probe_ops - I2C OF component prober callbacks
> + *
> + * A set of callbacks to be used by i2c_of_probe_component().
> + *
> + * All callbacks are optional. Callbacks are called only once per run, a=
nd are
> + * used in the order they are defined in this structure.
> + *
> + * All callbacks that have return values shall return %0 on success,
> + * or a negative error number on failure.
> + *
> + * The @dev parameter passed to the callbacks is the same as @dev passed=
 to
> + * i2c_of_probe_component(). It should only be used for dev_printk() cal=
ls
> + * and nothing else, especially not managed device resource (devres) API=
s.
> + */
> +struct i2c_of_probe_ops {
> +       /** @get_resources: Retrieve resources for components. */
> +       int (*get_resources)(struct device *dev, struct device_node *bus_=
node, void *data);
> +
> +       /** @free_resources_early: Release exclusive resources prior to e=
nabling component. */
> +       void (*free_resources_early)(void *data);

It would be good if the doc here mentioned what happened if no
components were found and thus nothing was enabled. Is the function
still called? It looks like "no" and "cleanup" is in charge of
cleaning in this case. Feels like the docs need to be more explicit.

