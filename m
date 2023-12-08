Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01E4C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Dec 2023 15:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNnSwjzfk0DFwMUnASYe+Mep7H717D8Hg3L4xcCwxL4=; b=wr6pql2Ilz4RTwgSVlPKVEuP0Y
	hvZMGigTVkSsqll8IcRJO5vkTGZO6c86gEzZ6DmJ/lwHOSqB5lU6FiuGwUnjYluV+PvmtBP2yQmnd
	XRJVs3B7X4UG7RDGgCAquvC7Z9kUZmdwrE/Zr2bmshikLDfODuTOfTIm1B++hBfp8Z6HUTPZiLqMm
	NoCirAKDTr2/olIhY3r4tvRX5abwgxw1EjnQerFcExcz7UHrUsKdNtqs/GXAmXBwaNJNynPMpj3WI
	YOYiiHRW418q0ZkC5B7eO3xp5KX7W3cHs+/ASzWrYhWy8PFCEKfW4U/Rt9g3x5GzP1SR5vEQZEkP2
	DZKzdjcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBcUf-00Fqj5-2i;
	Fri, 08 Dec 2023 15:10:21 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBcUc-00Fqi4-0t;
	Fri, 08 Dec 2023 15:10:19 +0000
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3b83fc26e4cso1386046b6e.2;
        Fri, 08 Dec 2023 07:10:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702048217; x=1702653017;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNnSwjzfk0DFwMUnASYe+Mep7H717D8Hg3L4xcCwxL4=;
        b=FIrCMmB7+sIBtrbPzEBZb9lH36QJkORy+/thbtVg4g+fd2anUIRWzXnnw+bDnS0Uon
         5S2kCYPj73tNJNAbkOJ/kKSVWpYfJWaJ5hxBwCssW4gnBQ/X3A68+zJtm4af79xKz9Tv
         3uGqs/xuw2icpcKkN9kr/w2E0sl12loWrRe0em3LMH8VfkgVzr9Xv8Q9lHHanLBXAzeU
         06xIq3bMSDFcbuy3xLgv3JyriJlSFfYoKsXoc7M8bOPWSxNpa5O0IJKcmBiIxKLav3he
         rjsjnWRv7kSK2CdHOU4Vcm99UnIluX0Ecbs1dzzxodDLhPSswnm1Kn0ROeSipIhFoec7
         CCzg==
X-Gm-Message-State: AOJu0YwaP67uzlDAlwZc0TeczXGw0+xi5EXLdjWgNWj1ZiledLijMzO6
	51bu3wcwVcjWO0QI3n8adA==
X-Google-Smtp-Source: AGHT+IEvVmbu2+Qv9wFJy8R9H8r5dTeownvX+CKH+WYzlbAzevvw6b0vu0w5WzVXyWLw9sofpqWUuA==
X-Received: by 2002:a05:6808:d4d:b0:3b8:b063:8258 with SMTP id w13-20020a0568080d4d00b003b8b0638258mr172675oik.90.1702048217115;
        Fri, 08 Dec 2023 07:10:17 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 14-20020aca280e000000b003b8b3bdeb6bsm348309oix.30.2023.12.08.07.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:10:16 -0800 (PST)
Received: (nullmailer pid 1354509 invoked by uid 1000);
	Fri, 08 Dec 2023 15:10:11 -0000
Date: Fri, 8 Dec 2023 09:10:11 -0600
From: Rob Herring <robh@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Frank Rowand <frowand.list@gmail.com>, 
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
Subject: Re: [RFC PATCH v3 2/5] i2c: of: Introduce component probe function
Message-ID: <20231208151011.GA1289359-robh@kernel.org>
References: <20231128084236.157152-1-wenst@chromium.org>
 <20231128084236.157152-3-wenst@chromium.org>
 <CAD=FV=U_+iQJtV0Wii89DQT1V_fJCeS9wcqA8EJAs-hmmmLLLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=U_+iQJtV0Wii89DQT1V_fJCeS9wcqA8EJAs-hmmmLLLg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_071018_314865_B5451BD7 
X-CRM114-Status: GOOD (  33.55  )
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

On Fri, Dec 01, 2023 at 04:57:46PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Tue, Nov 28, 2023 at 12:45 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > @@ -217,4 +217,114 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
> >  struct notifier_block i2c_of_notifier = {
> >         .notifier_call = of_i2c_notify,
> >  };
> > +
> > +/*
> > + * Some devices, such as Google Hana Chromebooks, are produced by multiple
> > + * vendors each using their preferred components. Such components are all
> > + * in the device tree. Instead of having all of them enabled and having each
> > + * driver separately try and probe its device while fighting over shared
> > + * resources, they can be marked as "fail-needs-probe" and have a prober
> > + * figure out which one is actually used beforehand.
> > + *
> > + * This prober assumes such drop-in parts are on the same I2C bus, have
> > + * non-conflicting addresses, and can be directly probed by seeing which
> > + * address responds.
> > + *
> > + * TODO:
> > + * - Support handling common regulators and GPIOs.
> 
> IMO you should prototype how you're going to handle regulators and
> GPIOs before finalizing the design. I was going to write that you
> should just document that it was up to the caller to power things up
> before calling this function, but then I realized that the caller
> would have to duplicate much of this function in order to do so. In
> the very least they'd have to find the nodes of the relevant devices
> so that they could grab regulators and/or GPIOs. In order to avoid
> this duplication, would the design need to change? Perhaps this would
> be as simple as adding a callback function here that's called with all
> of the nodes before probing? If that's right, it would be nice to have
> that callback from the beginning so we don't need two variants of the
> function...
> 
> > + * - Support I2C muxes
> > + */
> > +
> > +/**
> > + * i2c_of_probe_component() - probe for devices of "type" on the same i2c bus
> > + * @dev: &struct device of the caller, only used for dev_* printk messages
> > + * @type: a string to match the device node name prefix to probe for
> > + *
> > + * Probe for possible I2C components of the same "type" on the same I2C bus
> > + * that have their status marked as "fail".
> 
> Should document these current limitations with the code:
> 
> * Assumes that across the entire device tree the only instances of
> nodes named "type" are ones we're trying to handle second sourcing
> for. In other words if we're searching for "touchscreen" then all
> nodes named "touchscreen" are ones that need to be probed.

named "type" and marked as needs probe.

> 
> * Assumes that there is exactly one group of each "type". In other
> words, if we're searching for "touchscreen" then exactly one
> touchscreen will be enabled across the whole tree.

Does that need to be a limitation? If you just keep going thru all 
devices, wouldn't that just work?

Rob

