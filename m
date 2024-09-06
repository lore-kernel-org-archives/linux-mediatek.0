Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5FFCE7AB0
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Sep 2024 03:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQg6ZHV3OdQlAidOiVD+50gKZuem+V/huVxuvPthNh0=; b=bPunlJ5XUCXwHGk5PENMl+0xMT
	Y3IEicV0dLJtGONKB6/0KMcLpoRWCpsQrhNHWAwphKUlubadX9USVmIr12UgciOC9TXkfIIChsuEH
	+FvizjVN2YUH4phwTUPInTgeqhzPi0t8tHgYKz4s/7TeMelgerS/gufMIPiQFmWENr7GoKILM3TWS
	+zTmY7LQcvCjgJabGRenrlkg2nnoCfh/cOaFqEZO9GmLYTDGA/hnN1zVHBu+7DV8/yd698dJsYbJP
	PuRyERLXQ5vtoYZQB2H6SjmYgjl+FyMPADwwwgFNBO0jHm0Gn7BPWcckvdE/0OuAoi776cA5/xzci
	19UVck+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smPuy-0000000AYgA-0EjO;
	Fri, 06 Sep 2024 03:45:52 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smPut-0000000AYfD-2bmV
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Sep 2024 03:45:50 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-535dc4ec181so1447674e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Sep 2024 20:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725594345; x=1726199145; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQg6ZHV3OdQlAidOiVD+50gKZuem+V/huVxuvPthNh0=;
        b=R9yCFt65KdQoJdvLNdydCcife7uekwUGZE3dsMXGfKPy5u91woEcKt6T0PIXKvT9lT
         qYUl9bfwQ6hXk8JGJ6H63WpP3U94VgR8wFJzZOuTubtRPV2/qnt/u1bVlS35LLkymcin
         gqqZwBSFwAhVJlydTXR1DkpL649WLmBltISgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725594345; x=1726199145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQg6ZHV3OdQlAidOiVD+50gKZuem+V/huVxuvPthNh0=;
        b=w2U+HqbLpPOSfkgN4NOg1b7Ob/u/DxRT6wMXCVq5nTibb7B+q6e9fgWBtbKQLmjSba
         4eYd/+rbUNKgc5G9ZSxlhD9Yjo/Gr7pVlwxmoPiz2uSuCW6gCSAGOuVTyttGKU0rVKsB
         Zod5mbntpt/M33hJ9p2qZawz3ypH5ejdx340K65tNky6GJiQH/yzVuXmZQBQ2JgJ1UMI
         6TLwiQ869PlDWmw51ojTOWbCWRzlID+0qIijucWUH1rEWTalkFKL/tx9IixmhILr+Jn+
         dkouVe4sYlx9QBXK55TxgN6QgM38T5TmZhXFhNc7mMOXbFUKn7RcFwbT46+PGlrfPzW+
         Vu2g==
X-Forwarded-Encrypted: i=1; AJvYcCUpO69nSSfC6nE4HQgOpufVn3MU1ybXYaYY/g58NRUcx/a9wVLLWwy602wfY8jdit6Q8ugKs+8EMiUCfpyxwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQMOOgPB/gADTo/A2PwJvubg8Pf7gbSE6jcH80KxjfCGMtPUxQ
	ntafHkH/bAJab+VPG28aTK4Qxy9IzVKPhYInIrOagOmBW6h3N1ygWxdMKwlFlMe60wCY56LdWrA
	J9P8gix2s+nB5wyrBlflyL99PlGFUs0DCVr4/
X-Google-Smtp-Source: AGHT+IG243ompPdx0bSLx60HLWBy1dMFQGFZ33UY1sxTQVuYCfEAueQxhuwkLwa9fvxCvh+SDZnngn0Tw4cydJcut8A=
X-Received: by 2002:a05:6512:3c96:b0:536:54bd:8375 with SMTP id
 2adb3069b0e04-536587c54bcmr603777e87.33.1725594344775; Thu, 05 Sep 2024
 20:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-10-wenst@chromium.org>
 <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
 <CAGXv+5F27K76t=ht5v75jKsNF-J+C0r5+m=czHz6PtV3t5DxcQ@mail.gmail.com> <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
In-Reply-To: <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 6 Sep 2024 11:45:32 +0800
Message-ID: <CAGXv+5HO=POHNL_tQHCsy+8=a0gPLMDVHcWMguferahVU+BnZA@mail.gmail.com>
Subject: Re: [PATCH v6 09/12] i2c: of-prober: Add regulator support
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
X-CRM114-CacheID: sfid-20240905_204547_717622_38B0A1E4 
X-CRM114-Status: GOOD (  76.70  )
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

On Fri, Sep 6, 2024 at 2:15=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Thu, Sep 5, 2024 at 8:10=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
> >
> > On Thu, Sep 5, 2024 at 6:57=E2=80=AFAM Doug Anderson <dianders@chromium=
.org> wrote:
> > >
> > > Hi,
> > >
> > > On Wed, Sep 4, 2024 at 2:01=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.o=
rg> wrote:
> > > >
> > > > This adds regulator management to the I2C OF component prober.
> > > > Components that the prober intends to probe likely require their
> > > > regulator supplies be enabled, and GPIOs be toggled to enable them =
or
> > > > bring them out of reset before they will respond to probe attempts.
> > > > GPIOs will be handled in the next patch.
> > > >
> > > > Without specific knowledge of each component's resource names or
> > > > power sequencing requirements, the prober can only enable the
> > > > regulator supplies all at once, and toggle the GPIOs all at once.
> > > > Luckily, reset pins tend to be active low, while enable pins tend t=
o
> > > > be active high, so setting the raw status of all GPIO pins to high
> > > > should work. The wait time before and after resources are enabled
> > > > are collected from existing drivers and device trees.
> > > >
> > > > The prober collects resources from all possible components and enab=
les
> > > > them together, instead of enabling resources and probing each compo=
nent
> > > > one by one. The latter approach does not provide any boot time bene=
fits
> > > > over simply enabling each component and letting each driver probe
> > > > sequentially.
> > > >
> > > > The prober will also deduplicate the resources, since on a componen=
t
> > > > swap out or co-layout design, the resources are always the same.
> > > > While duplicate regulator supplies won't cause much issue, shared
> > > > GPIOs don't work reliably, especially with other drivers. For the
> > > > same reason, the prober will release the GPIOs before the successfu=
lly
> > > > probed component is actually enabled.
> > > >
> > > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > ---
> > > > Changes since v5:
> > > > - Split of_regulator_bulk_get_all() return value check and explain
> > > >   "ret =3D=3D 0" case
> > > > - Switched to of_get_next_child_with_prefix_scoped() where applicab=
le
> > > > - Used krealloc_array() instead of directly calculating size
> > > > - copy whole regulator array in one memcpy() call
> > > > - Drop "0" from struct zeroing initializer
> > > > - Split out regulator helper from i2c_of_probe_enable_res() to keep
> > > >   code cleaner when combined with the next patch
> > > > - Added options for customizing power sequencing delay
> > > > - Rename i2c_of_probe_get_regulator() to i2c_of_probe_get_regulator=
s()
> > > > - Add i2c_of_probe_free_regulator() helper
> > > >
> > > > Changes since v4:
> > > > - Split out GPIO handling to separate patch
> > > > - Rewrote using of_regulator_bulk_get_all()
> > > > - Replaced "regulators" with "regulator supplies" in debug messages
> > > >
> > > > Changes since v3:
> > > > - New patch
> > > >
> > > > This change is kept as a separate patch for now since the changes a=
re
> > > > quite numerous.
> > > > ---
> > > >  drivers/i2c/i2c-core-of-prober.c | 154 +++++++++++++++++++++++++++=
++--
> > > >  include/linux/i2c.h              |  10 +-
> > > >  2 files changed, 155 insertions(+), 9 deletions(-)
> > >
> > > I never jumped back into looking at this since you started sending ne=
w
> > > versions last month (sorry), but I finally did...
> > >
> > > At a high level, I have to say I'm not really a fan of the "reach int=
o
> > > all of the devices, jam their regulators on, force their GPIOs high,
> > > and hope for the best" approach. It just feels like it's going to
> > > break at the first bit of slightly different hardware and cause power
> > > sequence violations left and right. If nothing else, regulators often
> > > need delays between when one regulator is enabled and the next. There
> > > may also be complex relationships between regulators and GPIOs, GPIOs=
,
> > > GPIOs that need to be low, or even GPIO "toggle sequences" (power on
> > > rail 1, wait 1 ms, assert reset, wait 10 ms, deassert reset, power on
> > > rail 2).
> > >
> > > IMO the only way to make this reliable is to have this stuff be much
> > > less automatic and much more driven by the board.
> > >
> > > I think that, in general, before the board prober checks i2c address
> > > then the prober should be in charge of setting up pinctrl and turning
> > > on regulators / GPIOs. Given that the same regulator(s) and GPIO(s)
> > > may be specified by different children, the prober will just have to
> > > pick one child to find those resources. It should have enough
> > > board-specific knowledge to make this choice. Then the prober should
> > > turn them on via a board-specific power-on sequence that's known to
> > > work for all the children. Then it should start probing.
> > >
> > > I think there can still be plenty of common helper functions that the
> > > board-specific prober can leverage, but overall I'd expect the actual
> > > power-on and power-off code to be board-specific.
> > >
> > > If many boards have in common that we need to turn on exactly one
> > > regulator + one GPIO, or just one regulator, or whatever then having =
a
> > > helper function that handles these cases is fine. ...but it should be
> > > one of many choices that a board proper could use and not the only
> > > one.
> >
> > IIUC we could have the "options" data structure have much more board
> > specific information:
> >
> >   - name of node to fetch resources (regulator supplies and GPIOs) from
> >   - names of the resources for the node given from the previous item
> >   - delay time after each resource is toggled
> >   - polarity in the case of GPIOs
> >   - prober callback to do power sequencing
> >
> > The "resource collection" step would use the first two items to retriev=
e
> > the regulator supplies and GPIOS instead of the bulk APIs used right no=
w.
> >
> > The power sequencing callback would use the resources combined with the
> > given delays to enable the supplies and toggle the GPIOs.
> >
> > For now I would probably only implement a generic one regulator supply
> > plus one GPIO helper. That is the common case for touchscreens and
> > trackpads connected over a ribbon cable.
> >
> > Does that sound like what you have in mind?
>
> I guess I'd have to see how the code looks to know for sure, but if I
> understand it sounds a little awkward. Specifically, the "options"
> sound like they might become complicated enough that you're inventing
> your own little programming language (with delays, abilities to drive
> pins low and high, abilities to turn on/off clocks, and abilities to
> turn off/on regulators) and then probers need to code up their
> programs in this language. You also need to handle undoing things
> properly if there is a failure in the middle. Like your "program"
> would look like this (obviously you'd have to play with enums more,
> but you get the idea):
>
> {
>    { OPCODE_TURN_REGULATOR_ON, "vdd" },
>    { OPCODE_DELAY, 10 },
>    { OPCODE_GPIO_ASSERT, "reset" },
>    { OPCODE_DELAY, 5 },
>    { OPCODE_GPIO_DEASSERT "reset" },
>    { OPCODE_DELAY, 100 },
>    { OPCODE_TURN_REGULATOR_ON, "vddIO" },
> }
>
> Why not just expect the board probers to write C code to turn things
> on before looking for i2c devices, then provide helpers to the C code?
>
> So there wouldn't be some generic "resource collection" API, but you'd
> provide a helper to make it easy to grab regulators from one of the
> nodes by name. If you think bulk enabling regulators is common then
> you could make a helper that grabs all of the regulators from a node
> in a way that is consistent with the bulk APIs, but I wouldn't expect
> every driver to use that since devices I've seen expect regulators to
> be enabled in a very specific order even if they don't need a delay
> between them.
>
> I wouldn't expect a "collect all GPIOs" API because it seems really
> weird to me that we'd ever want to jam multiple GPIOs in a state
> without knowing exactly which GPIO was what and asserting them in the
> right sequence.

So I'm slightly confused, as it sounds like at this point the i2c prober
would be litter more than just a framework, and the heavy lifting is to
be all done by callbacks provided by the board-specific driver?

So the framework becomes something like:

1. find i2c bus node
2. call provided callback with i2c bus node to gather resources;
   let callback handle specifics
3. call provided callback to enable resources
4. for each i2c component, call provided callback to probe

  If the probe succeeded:

    5. call provided callback for early release of resources (GPIOs)
    6. set "status" to "okay"
    7. call provided callback for late release of resources (regulators)

  Otherwise at the end of the loop

8. release resources

The current code can be reworked into helpers for steps 2, 3, 5, 7 for
the single regulator single GPIO case.

> > This next item would be a later enhancement (which isn't implemented in
> > this series anyway):
> >
> >   - optional prober callback that does actual probing
> >
> > In our case it would only be used for cases where an HID-over-I2C
> > component shares the same address as a non-HID one, and some extra
> > work is needed to determine which type it is. I still need to think
> > about the structure of this.
>
> IMO _that_ would be a great option to the i2c prober. It feels like
> you could have an optional register read that needs to match to have
> the i2c prober succeed. Most people would leave it blank (just the i2c
> device existing is enough) but probably a single register read would
> be enough to confirm you got the right device. Most i2c devices have
> some sort of "version" / "vendor" / "id" type register somewhere.

At least for the stuff that we have (touchscreens and trackpads) such
registers typically don't exist, unless it's an HID-over-I2C device,
in which case there's the standard HID descriptor at some address.
But, yeah, reading the HID descriptor was the use case I had in mind.

At least for one Chromebooks it's a bit more tricky because that one
HID-over-I2C component shares the same address as a non-HID one. We
currently have different SKU IDs and thus different device trees for
them, but we could make the prober work with this. It just has be able
to tell if the component it's currently probing needs the special
prober and is it responding correctly. This bit I need to think about.


ChenYu

