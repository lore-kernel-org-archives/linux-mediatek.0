Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0086C531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 07:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NSqREulePxg8CKTf5awNX/HJBRiZ4QLVJ8cgBAYKHIo=; b=sPsTYnPDRjYAfOZLCerrOXG5Li
	Vp9lVlf5GfWUuukw9pOde1chx1C6a8r18U+qQt21Kz7D4bdMLhfuR0mQPXhM9apWutBRQiTaPtztR
	BmESx0+EQ56Bd5f4rNYxwwWet9HI4Zpo2BY5CL4H47DmRdFgaH8+sirszTICkb0b5Rp2j0musQ4W8
	Gu7l+V7XqTINkcpwlgPOLp9U485vI0ur+6SIt/bj/YYu95OPTUCKxKUZJGiNQISAuTPWl11CEtAgS
	c88NUijJpWJlK8Q5B5PK2c6GTDZjUou3nS0IhcFJKIQeHcvGkTUuXDgiH03Hjr6HR96gpzNHY4ZUH
	XXFG3hoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shONL-0000000FZZ2-00ot;
	Fri, 23 Aug 2024 07:06:23 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shOMZ-0000000FZSI-2kyE
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Aug 2024 07:05:37 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5334adf7249so2120501e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Aug 2024 00:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724396733; x=1725001533; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSqREulePxg8CKTf5awNX/HJBRiZ4QLVJ8cgBAYKHIo=;
        b=c8hRIZJWzPi+CjrEpf6Kl67S1sQJRfe3L4HMdWtU2mMKpCGk2g1c0SXMjal1PJg2bK
         EB+1IiZU/XfUnVQNpktVINNQ/SOh1eeEt6HVu9touTnyd32FNSLGRpaCOyvU20yFu1DM
         A4AaiWY1llVe5OKLM2Wv6pyMpFkZm+sogN/m0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724396733; x=1725001533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSqREulePxg8CKTf5awNX/HJBRiZ4QLVJ8cgBAYKHIo=;
        b=Tj+w+Odw5nfK3vrK9avlkve5IQq0xuaSqMIdy0x/aDSsx/tqNAoAzksKqqkVvSoQbw
         HP84KxiHuu6FEK1V0wAhf3k+yhLuZbfRCmo42W36R1PWVe6sF3qJJ3/ZACD+0vCw0cDP
         G/s8si7fsJfVQ7kaQT5jVE1tXKiO0T/UhZcLcOFU+c2QBdbQuJPOq7ZuD7vvQiEj7CHS
         dGPh9YuZQaWTMT1oMwwhnX3VRDTVkvv36GXjPDhbkCmIeK3U530aRlH/wu+2Fs7uiLQ+
         TDRBDMWAmRL0smu4xWa92q5C1uyDUrb+o4oCQLkzrYdPhd/tiRGvsgg76Yb2OuAejLDk
         dTvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+zgbsFrscF8589IT0+t1ih3pOUbRUDUIEloBZ9Y5iGVcRGxhjK3iqfRh/e2cGHGQK+SnJMzGHFfxNGPvMKg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy823CK4SnKWSQdSP/zceG2nPWfETzpR93H2AsArqNlYRcLfahi
	8pqsaqkyAu1SJJ7rwhIZEpMob/Pz0Sope7USGxbYCHQdTT/mxFhyfkt5PqVu5Q4kK5cPxU5PGaB
	qJ0OH8EnaSOSAa/aHRxUjIygzH06tonJj21nC
X-Google-Smtp-Source: AGHT+IGNtTDEfjRQCAU7zqH2LB9KdSvjRzwWhHcPb4xis4wVU2lVsZpgq0JMxBRDIb+KkRoJXAdbfiGPaOxPwtfJ6oc=
X-Received: by 2002:a05:6512:695:b0:530:b871:eb9a with SMTP id
 2adb3069b0e04-534387baca6mr662910e87.47.1724396733400; Fri, 23 Aug 2024
 00:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240822092006.3134096-1-wenst@chromium.org> <20240822092006.3134096-5-wenst@chromium.org>
 <ZsdC8wkgsdsMJuAL@smile.fi.intel.com>
In-Reply-To: <ZsdC8wkgsdsMJuAL@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 23 Aug 2024 15:05:22 +0800
Message-ID: <CAGXv+5H3RvWFTg6dnMR6QBG-gLnv29fEC_5icdHE7Tjfy7fvxA@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] regulator: Do pure DT regulator lookup in of_regulator_bulk_get_all()
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
X-CRM114-CacheID: sfid-20240823_000535_753375_B0D1E8FB 
X-CRM114-Status: GOOD (  33.04  )
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

On Thu, Aug 22, 2024 at 9:54=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 22, 2024 at 05:19:57PM +0800, Chen-Yu Tsai wrote:
> > The to-be-introduced I2C component prober needs to enable regulator
> > supplies (and toggle GPIO pins) for the various components it intends
> > to probe. To support this, a new "pure DT lookup" method for getting
> > regulator supplies is needed, since the device normally requesting
> > the supply won't get created until after the component is probed to
> > be available.
> >
> > Convert the existing of_regulator_bulk_get_all() for this purpose.
> > This function has no in-tree users, as the original patch [1] that
> > used it was never landed. This patch changes the function ABI, but
> > it is straightforward to convert users.
> >
> > The underlying code that supports the existing regulator_get*()
> > functions has been reworked in previous patches to support this
> > specific case. An internal OF-specific version of regulator_get(),
> > of_regulator_get_optional(), is added for this.
>
> > [1] https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@g=
mail.com/
>
> Make it Link tag
>
> Link: https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@g=
mail.com/ [1]
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> ...
>
> >       /* first do a dt based lookup */
> >       if (dev && dev->of_node) {
>
>         if (dev_of_node())
>

Not part of the original change, but I don't see why not.

> > -             r =3D of_regulator_dev_lookup(dev, supply);
> > +             r =3D of_regulator_dev_lookup(dev, dev->of_node, supply);
>
>         dev_of_node()

Ack.

> >               if (!IS_ERR(r))
> >                       return r;
> >               if (PTR_ERR(r) =3D=3D -EPROBE_DEFER)
>
> ...
>
> >  /**
> >   * of_get_regulator - get a regulator device node based on supply name
> > - * @dev: Device pointer for the consumer (of regulator) device
> > + * @dev: Device pointer for dev_printk messages
>
> dev_printk()

Ack.

> > + * @node: Device node pointer for supply property lookup
> >   * @supply: regulator supply name
> >   *
> >   * Extract the regulator device node corresponding to the supply name.
> >   * returns the device node corresponding to the regulator if found, el=
se
> >   * returns NULL.
> >   */
>
> ...
>
> >  /** of_regulator_dev_lookup - lookup a regulator device with device tr=
ee only
> > - * @dev: Device pointer for regulator supply lookup.
> > + * @dev: Device pointer for dev_printk messages.
>
> Ditto.

Ack.

> > + * @node: Device node pointer for regulator supply lookup.
> >   * @supply: Supply name or regulator ID.
> >   *
> >   * If successful, returns a struct regulator_dev that corresponds to t=
he name
> > @@ -636,13 +639,13 @@ static struct regulator_dev *of_find_regulator_by=
_node(struct device_node *np)
> >   * -ENODEV if lookup fails permanently, -EPROBE_DEFER if lookup could =
succeed
> >   * in the future.
> >   */
>
> ...
>
> > +/**
> > + * of_regulator_get_optional - get optional regulator via device tree =
lookup
> > + * @dev: device used for dev_printk messages
>
> Ditto.

Ack.

> > + * @node: device node for regulator "consumer"
> > + * @id: Supply name
> > + *
> > + * Returns a struct regulator corresponding to the regulator producer,
> > + * or IS_ERR() condition containing errno.
> > + *
> > + * This is intended for use by consumers that want to get a regulator
> > + * supply directly from a device node, and can and want to deal with
> > + * absence of such supplies. This will _not_ consider supply aliases.
> > + * See regulator_dev_lookup().
>
> Fix kernel-doc warning.

Ack.


Thanks
ChenYu

> > + */
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

