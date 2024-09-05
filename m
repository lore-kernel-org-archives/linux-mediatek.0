Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E42ECD5BD0
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 16:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbZG96yCjg3dP1dRLPb67mYWLsYBymVv/aX2fCRRjEc=; b=FFCqVKtpLmmreC/6i8gFZTAVEg
	fVg29ZfPyIJR+Fh2L6hnR5YFsNY+N3Yq58mpLXMcA9c9JfJc+jIWCQZa3rEBw86AGbjEqSuhqh/a7
	xXpaC5rwr9Nus7VBYC34pukMv7ZrMhu3IR0s8FD747QABJXFMCZ9i67D6yrgQq7dXGH2e6NZ0Xyxf
	wB15Ql2bh3+QxVwTuzukdyDe4z0CAZtfbymI1pRe+pi58nmt4YeC1bA7EEiAKhEYN6SBK36YGKW4L
	C81R8ZT21NieKIoUj1bVa1xzt+DwbkZP3UdSdAiXvbtKjmHT7JDmK9uuvQb623F2bN1l3gEqzurHb
	MnOMrjMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smF9V-000000094l4-1b6D;
	Thu, 05 Sep 2024 16:16:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smE8L-00000008tkL-2UsF
	for linux-mediatek@bombadil.infradead.org;
	Thu, 05 Sep 2024 15:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lbZG96yCjg3dP1dRLPb67mYWLsYBymVv/aX2fCRRjEc=; b=Lp5AOYcbgqYpvvTyXw2UBxZuh5
	3wLIN4pKB7dOv5U/B79/V1VSjkP8Ky+t1exzTO10rqlRGqlT//ETXV6/6E5dHu+dOMFSfGO5T94XS
	ykGuayAqfar2LqC/uCMKRL/wvjO2UQ38lx3w1pzb+fcHx4U6gbMRgZtIo9n6KdvjAskgqeq2bB5LS
	oQwFZy/IIoEMdYKsiVtrUnUG64REOIJlay6AskXlPSmPm0aJZ8QYnOZytwaR7dz4Lj0Num4ZPcKX3
	0F9qnb0GUA+VTBZNWQpnZucdd3+oOZXJRI9xwSm2deA52VFlEtY3in9SYQMFdDJmUiSn0z410cXI1
	dqEAO3Lw==;
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1smE8H-00000000VOv-3ChD
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Sep 2024 15:10:51 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2f50966c478so11000241fa.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Sep 2024 08:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725549047; x=1726153847; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbZG96yCjg3dP1dRLPb67mYWLsYBymVv/aX2fCRRjEc=;
        b=AD5fkfiRsrXG6u4ji2Q+NdGjPwI8xcBBFvl8Y7U+b4yRcGC5yO+cZtfcfrkpPp8F4V
         0J1uGIBSCzivA1yl9t+WYayUQVALwOvRwv4kAdsOOZ4OW7voRbiAI4phXLvZfOXaL2m4
         fQV/hhhCmm4mg9MdqgAerJ8zJDmfIJ2/SCB/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725549047; x=1726153847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbZG96yCjg3dP1dRLPb67mYWLsYBymVv/aX2fCRRjEc=;
        b=jncNFRk3ZcybjxZEsT+G4BwKGz7Sz7dPjjG/53xF2M+pXlMnxL8IXnaQEobmeVP7KJ
         rh5CktPFCHorSu9Fue+/1rO1Drs6QbHJKjAjNv+PhcQHzM7hzf7DZHdUArzFOvBOQEOp
         MfO+0J90YqyZGC89pjy1wvYNY6G8fm2LJj+z7CGvq8YBkESF7lUvbkNtikCbicq4bdf0
         6VO0du8bcSGwAbww9AOszFOycys023zyQ9EFjQG/MSlXhIjf136DmsItBdMFrmXzueev
         mq7RPpLaEcihdr6sjr5XkjpxNXtkT+TxRh4eoGdJvx+rVB7QtA9tBYAqJ3B4IzOoQqBh
         0dvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLCBh5j/2NgoE5MTNx6VYJFZV88lnJdyymzYT2qLEBhhMCEzwast1Zp/PUwLdBFkL5T9OCV2pRkELjPEzYOA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0TXXgkoP3lfqRQ8FYlAeX/+NChHnbqViUqtyutmXUjibpTyey
	dmzNV8nqvRBv7uTNRMnZK7RDtyFda+6D91AQunY2EWIUWWYEafpmT8pas++UmOSivdKMWJxA9OG
	dvDgEbu+RWUOHxoO0rI9zOePB+3VeO4bvCwwV
X-Google-Smtp-Source: AGHT+IEoyY9FAQCs2QvyohjteVuKx8qEJUbTxgD4g5/TL4wAkdAbEbByYe9g569nCl27ndm/hY5F+Ctp+XibXgbNBjM=
X-Received: by 2002:a2e:f1a:0:b0:2f6:5f7b:e5e0 with SMTP id
 38308e7fff4ca-2f65f7be680mr30625541fa.21.1725549046375; Thu, 05 Sep 2024
 08:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <20240904090016.2841572-10-wenst@chromium.org>
 <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 5 Sep 2024 23:10:34 +0800
Message-ID: <CAGXv+5F27K76t=ht5v75jKsNF-J+C0r5+m=czHz6PtV3t5DxcQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240905_161050_031024_DCF6E1A1 
X-CRM114-Status: GOOD (  51.15  )
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

On Thu, Sep 5, 2024 at 6:57=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Wed, Sep 4, 2024 at 2:01=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
> >
> > This adds regulator management to the I2C OF component prober.
> > Components that the prober intends to probe likely require their
> > regulator supplies be enabled, and GPIOs be toggled to enable them or
> > bring them out of reset before they will respond to probe attempts.
> > GPIOs will be handled in the next patch.
> >
> > Without specific knowledge of each component's resource names or
> > power sequencing requirements, the prober can only enable the
> > regulator supplies all at once, and toggle the GPIOs all at once.
> > Luckily, reset pins tend to be active low, while enable pins tend to
> > be active high, so setting the raw status of all GPIO pins to high
> > should work. The wait time before and after resources are enabled
> > are collected from existing drivers and device trees.
> >
> > The prober collects resources from all possible components and enables
> > them together, instead of enabling resources and probing each component
> > one by one. The latter approach does not provide any boot time benefits
> > over simply enabling each component and letting each driver probe
> > sequentially.
> >
> > The prober will also deduplicate the resources, since on a component
> > swap out or co-layout design, the resources are always the same.
> > While duplicate regulator supplies won't cause much issue, shared
> > GPIOs don't work reliably, especially with other drivers. For the
> > same reason, the prober will release the GPIOs before the successfully
> > probed component is actually enabled.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v5:
> > - Split of_regulator_bulk_get_all() return value check and explain
> >   "ret =3D=3D 0" case
> > - Switched to of_get_next_child_with_prefix_scoped() where applicable
> > - Used krealloc_array() instead of directly calculating size
> > - copy whole regulator array in one memcpy() call
> > - Drop "0" from struct zeroing initializer
> > - Split out regulator helper from i2c_of_probe_enable_res() to keep
> >   code cleaner when combined with the next patch
> > - Added options for customizing power sequencing delay
> > - Rename i2c_of_probe_get_regulator() to i2c_of_probe_get_regulators()
> > - Add i2c_of_probe_free_regulator() helper
> >
> > Changes since v4:
> > - Split out GPIO handling to separate patch
> > - Rewrote using of_regulator_bulk_get_all()
> > - Replaced "regulators" with "regulator supplies" in debug messages
> >
> > Changes since v3:
> > - New patch
> >
> > This change is kept as a separate patch for now since the changes are
> > quite numerous.
> > ---
> >  drivers/i2c/i2c-core-of-prober.c | 154 +++++++++++++++++++++++++++++--
> >  include/linux/i2c.h              |  10 +-
> >  2 files changed, 155 insertions(+), 9 deletions(-)
>
> I never jumped back into looking at this since you started sending new
> versions last month (sorry), but I finally did...
>
> At a high level, I have to say I'm not really a fan of the "reach into
> all of the devices, jam their regulators on, force their GPIOs high,
> and hope for the best" approach. It just feels like it's going to
> break at the first bit of slightly different hardware and cause power
> sequence violations left and right. If nothing else, regulators often
> need delays between when one regulator is enabled and the next. There
> may also be complex relationships between regulators and GPIOs, GPIOs,
> GPIOs that need to be low, or even GPIO "toggle sequences" (power on
> rail 1, wait 1 ms, assert reset, wait 10 ms, deassert reset, power on
> rail 2).
>
> IMO the only way to make this reliable is to have this stuff be much
> less automatic and much more driven by the board.
>
> I think that, in general, before the board prober checks i2c address
> then the prober should be in charge of setting up pinctrl and turning
> on regulators / GPIOs. Given that the same regulator(s) and GPIO(s)
> may be specified by different children, the prober will just have to
> pick one child to find those resources. It should have enough
> board-specific knowledge to make this choice. Then the prober should
> turn them on via a board-specific power-on sequence that's known to
> work for all the children. Then it should start probing.
>
> I think there can still be plenty of common helper functions that the
> board-specific prober can leverage, but overall I'd expect the actual
> power-on and power-off code to be board-specific.
>
> If many boards have in common that we need to turn on exactly one
> regulator + one GPIO, or just one regulator, or whatever then having a
> helper function that handles these cases is fine. ...but it should be
> one of many choices that a board proper could use and not the only
> one.

IIUC we could have the "options" data structure have much more board
specific information:

  - name of node to fetch resources (regulator supplies and GPIOs) from
  - names of the resources for the node given from the previous item
  - delay time after each resource is toggled
  - polarity in the case of GPIOs
  - prober callback to do power sequencing

The "resource collection" step would use the first two items to retrieve
the regulator supplies and GPIOS instead of the bulk APIs used right now.

The power sequencing callback would use the resources combined with the
given delays to enable the supplies and toggle the GPIOs.

For now I would probably only implement a generic one regulator supply
plus one GPIO helper. That is the common case for touchscreens and
trackpads connected over a ribbon cable.

Does that sound like what you have in mind?


This next item would be a later enhancement (which isn't implemented in
this series anyway):

  - optional prober callback that does actual probing

In our case it would only be used for cases where an HID-over-I2C
component shares the same address as a non-HID one, and some extra
work is needed to determine which type it is. I still need to think
about the structure of this.


Thanks
ChenYu

