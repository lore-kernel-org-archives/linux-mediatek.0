Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F2CCD98FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 18:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqMkVgPFvnHANIyPGIBBKdw4kieVUrc29sSkj0u1A2s=; b=tvj7zw8QilAzwVXu89KY6MuKYC
	Xm6qyztxNqDtD9aKc3SYYXA1levKThoxZd4Hql7j8qmJbsJWPnUAh6tczsedDktEheyW7dQlEzPO4
	1+Tv+AAKNPgCyGlqhijZMB3oDfE9NvW0g4O6+Z4BB/4YzhxcgMy5p23XKx2dNM0/Gh74uZemhwKKm
	DpMHUaF2qguVRCzxqcTHUSIc3oeQfxOLnPG8h6UNNaa957BfOxtOZcEcWdBJWYDShICspUxsd702M
	YfN5MTNwU9Cl9+g+1OAsBxzPL4/AG0VfAV5e2ZBBy59HGC+jlpEz04wcx6RxFFiEnId/tCNJfpxtK
	r4ewSPWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smH0p-00000009PRN-1P4C;
	Thu, 05 Sep 2024 18:15:19 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smH0m-00000009PPt-1Q4b
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Sep 2024 18:15:17 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso1221754276.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Sep 2024 11:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725560114; x=1726164914; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqMkVgPFvnHANIyPGIBBKdw4kieVUrc29sSkj0u1A2s=;
        b=fSYA5VHvv6lPmpLycJhjsVHKXMl5ySR1UwouoO5Y30WoVTOKEEUDscrJMAsBuWwnpe
         sVYQKCAA755VaA7cwEbyBHgI5Qf/D9l3AXVtEf9SBDe5RYkKZCvm3Bf3JZgnUrx6Je7U
         1uc5Rkqe3jOh8w0P3Yz0HqXm9Td5rJUjYXM68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725560114; x=1726164914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqMkVgPFvnHANIyPGIBBKdw4kieVUrc29sSkj0u1A2s=;
        b=cCX3bnUjeSw3dPoBmFTTb/fTxlp+SOwdJHEgJ0wOZrshOuDGyeMxfEGtRqt6Aqo5PK
         oAYX0Q1IT5/flyms86hvxmsxp5IQCXTO38IcLw/1Y1O/59rVqCVxiuMYUF/Rthg2Xw28
         mt3atiJgnvMh22bSMLHm2WVw0b5NOF5+ljXk6muO5xBWCedatVXaojEvjYAP7tBbJ1C8
         662fVN0pMfbirVAIOS6CwRvY5m15+jTauKtBAA3OJIMqEpWvFq3oB7GaJKeFtJv+qzwD
         o2lhAQ0ooQyUFyY2zMeOEp7ar6T/ERhdQdrugZxzufeVGMBoyONPSuaZq22OG3EAbqr/
         BYsg==
X-Forwarded-Encrypted: i=1; AJvYcCVgKitvsu3lLzfT6khGJ3zfBGFJac506jo1H1TGyMTXCSg6oJc+eHx3Ep6NDtKjf4bUGLpLq+bf2KK3BU2cug==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhelYMk5806rFXID2f603kD3q7epCtm4vzP1iB9/prqYdozEq3
	3OkVP/d04kqcxBLVGV/o0mTvdgqUY4HZ8YWx0fs9HZK2WtiuCOCLQKfdi5sofrafh4WpInGf2i4
	=
X-Google-Smtp-Source: AGHT+IE0krvDTMOkBm+7zHmkR6sQXmeZLp69Dypyix3iB5dYSSBZMskdIgU8wFo8PfR2Vcdw+e4KMQ==
X-Received: by 2002:a25:84c2:0:b0:e1a:ab3c:2a97 with SMTP id 3f1490d57ef6-e1d349cf0a6mr109858276.40.1725560113803;
        Thu, 05 Sep 2024 11:15:13 -0700 (PDT)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c5202de91fsm9577526d6.71.2024.09.05.11.15.13
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 11:15:13 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6c35334dfb1so6474646d6.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Sep 2024 11:15:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWn3vwl6cJeb6tUUxD7LS/Imi5Cb9KnZ8Sw4EhuAXAarAw0rk6hdbtj0hR8AqmvDMPVjuDSqj5ikIIzvEAvLg==@lists.infradead.org
X-Received: by 2002:a05:6214:3a8a:b0:6c3:5cf1:e5b2 with SMTP id
 6a1803df08f44-6c35cf1e7ddmr191248766d6.29.1725560112825; Thu, 05 Sep 2024
 11:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-10-wenst@chromium.org>
 <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com> <CAGXv+5F27K76t=ht5v75jKsNF-J+C0r5+m=czHz6PtV3t5DxcQ@mail.gmail.com>
In-Reply-To: <CAGXv+5F27K76t=ht5v75jKsNF-J+C0r5+m=czHz6PtV3t5DxcQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Sep 2024 11:14:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
Message-ID: <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240905_111516_453723_07CE31D7 
X-CRM114-Status: GOOD (  66.99  )
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

On Thu, Sep 5, 2024 at 8:10=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> On Thu, Sep 5, 2024 at 6:57=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > Hi,
> >
> > On Wed, Sep 4, 2024 at 2:01=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> > >
> > > This adds regulator management to the I2C OF component prober.
> > > Components that the prober intends to probe likely require their
> > > regulator supplies be enabled, and GPIOs be toggled to enable them or
> > > bring them out of reset before they will respond to probe attempts.
> > > GPIOs will be handled in the next patch.
> > >
> > > Without specific knowledge of each component's resource names or
> > > power sequencing requirements, the prober can only enable the
> > > regulator supplies all at once, and toggle the GPIOs all at once.
> > > Luckily, reset pins tend to be active low, while enable pins tend to
> > > be active high, so setting the raw status of all GPIO pins to high
> > > should work. The wait time before and after resources are enabled
> > > are collected from existing drivers and device trees.
> > >
> > > The prober collects resources from all possible components and enable=
s
> > > them together, instead of enabling resources and probing each compone=
nt
> > > one by one. The latter approach does not provide any boot time benefi=
ts
> > > over simply enabling each component and letting each driver probe
> > > sequentially.
> > >
> > > The prober will also deduplicate the resources, since on a component
> > > swap out or co-layout design, the resources are always the same.
> > > While duplicate regulator supplies won't cause much issue, shared
> > > GPIOs don't work reliably, especially with other drivers. For the
> > > same reason, the prober will release the GPIOs before the successfull=
y
> > > probed component is actually enabled.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > > Changes since v5:
> > > - Split of_regulator_bulk_get_all() return value check and explain
> > >   "ret =3D=3D 0" case
> > > - Switched to of_get_next_child_with_prefix_scoped() where applicable
> > > - Used krealloc_array() instead of directly calculating size
> > > - copy whole regulator array in one memcpy() call
> > > - Drop "0" from struct zeroing initializer
> > > - Split out regulator helper from i2c_of_probe_enable_res() to keep
> > >   code cleaner when combined with the next patch
> > > - Added options for customizing power sequencing delay
> > > - Rename i2c_of_probe_get_regulator() to i2c_of_probe_get_regulators(=
)
> > > - Add i2c_of_probe_free_regulator() helper
> > >
> > > Changes since v4:
> > > - Split out GPIO handling to separate patch
> > > - Rewrote using of_regulator_bulk_get_all()
> > > - Replaced "regulators" with "regulator supplies" in debug messages
> > >
> > > Changes since v3:
> > > - New patch
> > >
> > > This change is kept as a separate patch for now since the changes are
> > > quite numerous.
> > > ---
> > >  drivers/i2c/i2c-core-of-prober.c | 154 +++++++++++++++++++++++++++++=
--
> > >  include/linux/i2c.h              |  10 +-
> > >  2 files changed, 155 insertions(+), 9 deletions(-)
> >
> > I never jumped back into looking at this since you started sending new
> > versions last month (sorry), but I finally did...
> >
> > At a high level, I have to say I'm not really a fan of the "reach into
> > all of the devices, jam their regulators on, force their GPIOs high,
> > and hope for the best" approach. It just feels like it's going to
> > break at the first bit of slightly different hardware and cause power
> > sequence violations left and right. If nothing else, regulators often
> > need delays between when one regulator is enabled and the next. There
> > may also be complex relationships between regulators and GPIOs, GPIOs,
> > GPIOs that need to be low, or even GPIO "toggle sequences" (power on
> > rail 1, wait 1 ms, assert reset, wait 10 ms, deassert reset, power on
> > rail 2).
> >
> > IMO the only way to make this reliable is to have this stuff be much
> > less automatic and much more driven by the board.
> >
> > I think that, in general, before the board prober checks i2c address
> > then the prober should be in charge of setting up pinctrl and turning
> > on regulators / GPIOs. Given that the same regulator(s) and GPIO(s)
> > may be specified by different children, the prober will just have to
> > pick one child to find those resources. It should have enough
> > board-specific knowledge to make this choice. Then the prober should
> > turn them on via a board-specific power-on sequence that's known to
> > work for all the children. Then it should start probing.
> >
> > I think there can still be plenty of common helper functions that the
> > board-specific prober can leverage, but overall I'd expect the actual
> > power-on and power-off code to be board-specific.
> >
> > If many boards have in common that we need to turn on exactly one
> > regulator + one GPIO, or just one regulator, or whatever then having a
> > helper function that handles these cases is fine. ...but it should be
> > one of many choices that a board proper could use and not the only
> > one.
>
> IIUC we could have the "options" data structure have much more board
> specific information:
>
>   - name of node to fetch resources (regulator supplies and GPIOs) from
>   - names of the resources for the node given from the previous item
>   - delay time after each resource is toggled
>   - polarity in the case of GPIOs
>   - prober callback to do power sequencing
>
> The "resource collection" step would use the first two items to retrieve
> the regulator supplies and GPIOS instead of the bulk APIs used right now.
>
> The power sequencing callback would use the resources combined with the
> given delays to enable the supplies and toggle the GPIOs.
>
> For now I would probably only implement a generic one regulator supply
> plus one GPIO helper. That is the common case for touchscreens and
> trackpads connected over a ribbon cable.
>
> Does that sound like what you have in mind?

I guess I'd have to see how the code looks to know for sure, but if I
understand it sounds a little awkward. Specifically, the "options"
sound like they might become complicated enough that you're inventing
your own little programming language (with delays, abilities to drive
pins low and high, abilities to turn on/off clocks, and abilities to
turn off/on regulators) and then probers need to code up their
programs in this language. You also need to handle undoing things
properly if there is a failure in the middle. Like your "program"
would look like this (obviously you'd have to play with enums more,
but you get the idea):

{
   { OPCODE_TURN_REGULATOR_ON, "vdd" },
   { OPCODE_DELAY, 10 },
   { OPCODE_GPIO_ASSERT, "reset" },
   { OPCODE_DELAY, 5 },
   { OPCODE_GPIO_DEASSERT "reset" },
   { OPCODE_DELAY, 100 },
   { OPCODE_TURN_REGULATOR_ON, "vddIO" },
}

Why not just expect the board probers to write C code to turn things
on before looking for i2c devices, then provide helpers to the C code?

So there wouldn't be some generic "resource collection" API, but you'd
provide a helper to make it easy to grab regulators from one of the
nodes by name. If you think bulk enabling regulators is common then
you could make a helper that grabs all of the regulators from a node
in a way that is consistent with the bulk APIs, but I wouldn't expect
every driver to use that since devices I've seen expect regulators to
be enabled in a very specific order even if they don't need a delay
between them.

I wouldn't expect a "collect all GPIOs" API because it seems really
weird to me that we'd ever want to jam multiple GPIOs in a state
without knowing exactly which GPIO was what and asserting them in the
right sequence.


> This next item would be a later enhancement (which isn't implemented in
> this series anyway):
>
>   - optional prober callback that does actual probing
>
> In our case it would only be used for cases where an HID-over-I2C
> component shares the same address as a non-HID one, and some extra
> work is needed to determine which type it is. I still need to think
> about the structure of this.

IMO _that_ would be a great option to the i2c prober. It feels like
you could have an optional register read that needs to match to have
the i2c prober succeed. Most people would leave it blank (just the i2c
device existing is enough) but probably a single register read would
be enough to confirm you got the right device. Most i2c devices have
some sort of "version" / "vendor" / "id" type register somewhere.

-Doug

