Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11EFEE01F6
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 00:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXQuFZTJ8lIqW5Ag+qwYyd702ndWzlmLQdZRxiEWDFg=; b=bGaBjQdyZqckpl1amnEt4lRrl6
	gAFREiDpXscMttigm8fVKM69BKBLpZDVFXENjJbkZQ+gZsuNq5WWZIK9biDgwJURfdXvEk8g7GVGa
	uqoZDIdsbE5xtFdHzGFzSAuftZo0dP3Bf/S/vJ3koZnnvxLgPMHX2Hww4DFDLbZeNMKimRmTLtx+b
	qJ5OLdUTx3OD2KJQK1wZRgXqqOAxmdRwRr2UGaeEam1zayUjmv99hOdn3dRa7wsSjA/7IXnTkkcTa
	sJd7xKLWL3N3IqtMZZnaxjHzJEojGVcsw+g8UPhBry+VL4iPn1xStIN4Q4PR0SMUZ8Ax+tMXC2cbR
	2ypAhuvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soBFZ-00000007aMh-1KSS;
	Wed, 11 Sep 2024 00:30:25 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soBFW-00000007aLk-0j34
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 00:30:23 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4581ee65b46so27937611cf.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Sep 2024 17:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726014620; x=1726619420; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXQuFZTJ8lIqW5Ag+qwYyd702ndWzlmLQdZRxiEWDFg=;
        b=DCGQLaPaagqUxXV9nkbZ10ARSDH4G9gB2W43Gc049unkVY6arMq7GcESBhSJQVZ6nk
         npxvfrocSgU4K56Hsjq9D8M/2BVKtL0S9cMOuuBDvBEtryJxDJXKkHn4tqWi+2wSgRiN
         JGW3hV11mYP2VD3cjiGIGjwPmRW2GihsadxI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726014620; x=1726619420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXQuFZTJ8lIqW5Ag+qwYyd702ndWzlmLQdZRxiEWDFg=;
        b=FJXUMaNxhRr1RGQtFHx9N32y+kCFXyU02U/gbTMAaJuzMWdgPhN/5cPi5N6zqlXVfg
         JbvkvEuud5dhIXmTEMMYBp0ryfGbZ91gNc8zyMj9cJTryJQGsS8sZa+UcfH2+oqDVL0H
         XM4q+QViRn5dNmtUZ85rSxjrxaiogF2oWOL0BBpiN7cxdkAjv2+vCmuF6E1eJ7JiUbYK
         5uAygEhR91bXl8yeTay+qXeOPN505D4ydhmaudN2TVO7PG2DLV1y0OL1IxWzwCyhwDGA
         ipspGPoqhthufoWN8DctL3yNYW/fouTowgsrUqZ5yc25q+gAbna/Gw7U59yROXmK+Ych
         ICWg==
X-Forwarded-Encrypted: i=1; AJvYcCXuvbXYP3K9ZXtqcz5dMHVK6m/aos3a0y8usbA1DnHe0AFiieVcCCz55es0nYC0OIeyqOb/+VvijtlCe7mPTw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yww8w62zJXu1GOLfKWzrXQuQCp5OxFLK7AiIf1xRx5PDgTvKecq
	j0roTWigR8VWRPV2yPqRK4EtQLDzgm6MYospl3KwnMZiX3PYkLMuW/rm77MzxS1BVIrbFq7h8SQ
	=
X-Google-Smtp-Source: AGHT+IEbuuvR1cGMwRYAOSKz8W/we7Un4ipvx7LzK1PGL7QBdqk+/ua8lDsrsVWXhZ04ntyH1oES6Q==
X-Received: by 2002:a05:6214:4389:b0:6c3:54a4:eea1 with SMTP id 6a1803df08f44-6c5282f921dmr198824156d6.9.1726014620246;
        Tue, 10 Sep 2024 17:30:20 -0700 (PDT)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c5343296afsm35238696d6.2.2024.09.10.17.30.20
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 17:30:20 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6c53bc6f9faso22056926d6.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Sep 2024 17:30:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMfMjirmUki6EXv02jmtHwXjqgRNt2jbWGUtqLXg9IMVwKoTvi7BTiDlc4qPss3ZgeeRPiEJ3A7ZSsUl9tkA==@lists.infradead.org
X-Received: by 2002:a05:6214:5b06:b0:6c5:52d5:bbd0 with SMTP id
 6a1803df08f44-6c552d5bbf8mr80721586d6.32.1726014619235; Tue, 10 Sep 2024
 17:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-10-wenst@chromium.org>
 <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
 <CAGXv+5F27K76t=ht5v75jKsNF-J+C0r5+m=czHz6PtV3t5DxcQ@mail.gmail.com>
 <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com> <CAGXv+5HO=POHNL_tQHCsy+8=a0gPLMDVHcWMguferahVU+BnZA@mail.gmail.com>
In-Reply-To: <CAGXv+5HO=POHNL_tQHCsy+8=a0gPLMDVHcWMguferahVU+BnZA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Sep 2024 17:30:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U2yDGv74GQWRQuHN9sjdY5iThqpH-br-jYXMkV1cujEg@mail.gmail.com>
Message-ID: <CAD=FV=U2yDGv74GQWRQuHN9sjdY5iThqpH-br-jYXMkV1cujEg@mail.gmail.com>
Subject: Re: [PATCH v6 09/12] i2c: of-prober: Add regulator support
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
X-CRM114-CacheID: sfid-20240910_173022_229274_8DE9D84A 
X-CRM114-Status: GOOD (  57.49  )
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

On Thu, Sep 5, 2024 at 8:45=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> > > IIUC we could have the "options" data structure have much more board
> > > specific information:
> > >
> > >   - name of node to fetch resources (regulator supplies and GPIOs) fr=
om
> > >   - names of the resources for the node given from the previous item
> > >   - delay time after each resource is toggled
> > >   - polarity in the case of GPIOs
> > >   - prober callback to do power sequencing
> > >
> > > The "resource collection" step would use the first two items to retri=
eve
> > > the regulator supplies and GPIOS instead of the bulk APIs used right =
now.
> > >
> > > The power sequencing callback would use the resources combined with t=
he
> > > given delays to enable the supplies and toggle the GPIOs.
> > >
> > > For now I would probably only implement a generic one regulator suppl=
y
> > > plus one GPIO helper. That is the common case for touchscreens and
> > > trackpads connected over a ribbon cable.
> > >
> > > Does that sound like what you have in mind?
> >
> > I guess I'd have to see how the code looks to know for sure, but if I
> > understand it sounds a little awkward. Specifically, the "options"
> > sound like they might become complicated enough that you're inventing
> > your own little programming language (with delays, abilities to drive
> > pins low and high, abilities to turn on/off clocks, and abilities to
> > turn off/on regulators) and then probers need to code up their
> > programs in this language. You also need to handle undoing things
> > properly if there is a failure in the middle. Like your "program"
> > would look like this (obviously you'd have to play with enums more,
> > but you get the idea):
> >
> > {
> >    { OPCODE_TURN_REGULATOR_ON, "vdd" },
> >    { OPCODE_DELAY, 10 },
> >    { OPCODE_GPIO_ASSERT, "reset" },
> >    { OPCODE_DELAY, 5 },
> >    { OPCODE_GPIO_DEASSERT "reset" },
> >    { OPCODE_DELAY, 100 },
> >    { OPCODE_TURN_REGULATOR_ON, "vddIO" },
> > }
> >
> > Why not just expect the board probers to write C code to turn things
> > on before looking for i2c devices, then provide helpers to the C code?
> >
> > So there wouldn't be some generic "resource collection" API, but you'd
> > provide a helper to make it easy to grab regulators from one of the
> > nodes by name. If you think bulk enabling regulators is common then
> > you could make a helper that grabs all of the regulators from a node
> > in a way that is consistent with the bulk APIs, but I wouldn't expect
> > every driver to use that since devices I've seen expect regulators to
> > be enabled in a very specific order even if they don't need a delay
> > between them.
> >
> > I wouldn't expect a "collect all GPIOs" API because it seems really
> > weird to me that we'd ever want to jam multiple GPIOs in a state
> > without knowing exactly which GPIO was what and asserting them in the
> > right sequence.
>
> So I'm slightly confused, as it sounds like at this point the i2c prober
> would be litter more than just a framework, and the heavy lifting is to
> be all done by callbacks provided by the board-specific driver?
>
> So the framework becomes something like:
>
> 1. find i2c bus node
> 2. call provided callback with i2c bus node to gather resources;
>    let callback handle specifics
> 3. call provided callback to enable resources
> 4. for each i2c component, call provided callback to probe

I don't think I'd do it as callbacks but just have the HW prober call
the functions directly. AKA, instead of doing:

  i2c_of_probe_component(dev, "touchscreen", ts_opts, ts_callbacks);

Do:

  grab_touchscreen_resources(...);
  power_on_touchscreens(...);
  i2c_of_probe_component(...);
  power_off_touchscreen(...);
  release_touchscreen_resources(...);

Obviously I'm spitballing here, though. Without writing the code it's
hard for me to know that my proposal would be better, but my gut tells
me that trying to write something overly generic with lots of options
/ callbacks would be more confusing.


>   If the probe succeeded:
>
>     5. call provided callback for early release of resources (GPIOs)
>     6. set "status" to "okay"
>     7. call provided callback for late release of resources (regulators)
>
>   Otherwise at the end of the loop
>
> 8. release resources
>
> The current code can be reworked into helpers for steps 2, 3, 5, 7 for
> the single regulator single GPIO case.
>
> > > This next item would be a later enhancement (which isn't implemented =
in
> > > this series anyway):
> > >
> > >   - optional prober callback that does actual probing
> > >
> > > In our case it would only be used for cases where an HID-over-I2C
> > > component shares the same address as a non-HID one, and some extra
> > > work is needed to determine which type it is. I still need to think
> > > about the structure of this.
> >
> > IMO _that_ would be a great option to the i2c prober. It feels like
> > you could have an optional register read that needs to match to have
> > the i2c prober succeed. Most people would leave it blank (just the i2c
> > device existing is enough) but probably a single register read would
> > be enough to confirm you got the right device. Most i2c devices have
> > some sort of "version" / "vendor" / "id" type register somewhere.
>
> At least for the stuff that we have (touchscreens and trackpads) such
> registers typically don't exist, unless it's an HID-over-I2C device,
> in which case there's the standard HID descriptor at some address.
> But, yeah, reading the HID descriptor was the use case I had in mind.
>
> At least for one Chromebooks it's a bit more tricky because that one
> HID-over-I2C component shares the same address as a non-HID one. We
> currently have different SKU IDs and thus different device trees for
> them, but we could make the prober work with this. It just has be able
> to tell if the component it's currently probing needs the special
> prober and is it responding correctly. This bit I need to think about.

I guess Mark Brown also thought that there wouldn't be some magic
register, but my gut still tells me that most i2c devices have some
way to confirm that they are what you expect even if it's not an
official "vendor" or "version" register. Some type of predictable
register at a predictable location that you could use, at least if you
knew all of the options that someone might stuff.

For instance, in elan trackpads you can see elan_i2c_get_product_id().
That just reads a location (ETP_I2C_UNIQUEID_CMD =3D 0x0101) that could
theoretically be used to figure out (maybe in conjunction with other
registers) that it's an elan trackpad instead of an i2c-hid one. You'd
have to (of course) confirm that an i2c-hid device wouldn't somehow
return back data from this read that made it look like an elan
trackpad, but it feels like there ought to be some way to figure it
out with a few i2c register reads.

...that being said, I guess my original assertion that you might be
able to figure out with a simple register read was naive and you'd
actually need a function (maybe as a callback) to figure this out.


-Doug

