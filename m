Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E71F8FA78
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2026 14:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Al3yrm/3hSvEPA958SWnVaUgmCGPZw8rcFuTzB+JYE=; b=TJGyX0itrM8LXaJoMfZg+WS2FQ
	a1wrqmSVTCs87ethbQC84hODb2vFL+erx7FPL77uss1nDK+arpbugNJVO/0sIIwzC0SO92b/g2tuf
	KrjZLpUxTw4Hoe/H+Fic78wEsNE2btOjpalS0BtrwG+6fDxUrBYpQiOYIeqgkLvMXCUl8pdgUekte
	UiNwi7hQDJbsnLB/mfdoVHTBTrXjJQP1qBLBHGcwsgsiyzZGEEpDGAccwULwgkmLqsx1OnzBBu8b8
	XWpdsrdrg43D+bswUpz25uvs5yCUDFdjkXFsPyDl2J5nqWxixffvVKMEcohGCzVhMERKDdCmj7/cM
	P6gl5Ubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFC5V-00000008jmu-3kdW;
	Tue, 21 Apr 2026 14:28:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFC5T-00000008jmH-0Q80
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Apr 2026 14:28:28 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48909558b3aso34152605e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Apr 2026 07:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776781705; x=1777386505; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Al3yrm/3hSvEPA958SWnVaUgmCGPZw8rcFuTzB+JYE=;
        b=tNgzzclKXapJ4ArzdujuJfAhYa1Vx3IiC+vEl4nUI9VfYmLnapgdPNaTR0oFvgXhkQ
         QoRnaBE+n8B0f5thDZ37zwpCzxryyJLVe2UgmNglQznfsSXZDyQTY1YSHdp2z/8kxJR1
         wSpKnqnxqMIP/X7llnCpd9tSyfEBUgZA7hm6lNX2cXgKlCcLsvaFrA4VUFMXtCCOOVBs
         +4vc6mLPE9k12jMHWjCK9O8FQ/DOhO3N8VUgT0P1Ff0KkbUoTKm/LRnrUHNgcMRmzN7Z
         JGsiU8y+n9Inh79fknZlA2SN1sH/lx6/t32Q/S/H1PndSjIzJc4Ar52wg7JtYqOuRwSz
         7Slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776781705; x=1777386505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Al3yrm/3hSvEPA958SWnVaUgmCGPZw8rcFuTzB+JYE=;
        b=le+jrLx+V5odq3YTo6XeEQksrlX/csHr/1lCsLUgEIs4SIV2tCBdcS6MtbPDJ5hwvk
         we1xeM5jcXPezVsR9gq9yxRHMDuze4xMUTvOYN6Lxn86l1NiNZzlDPscURLvAEaBvaey
         gQvlwKUANzpEwfNGFlTj4emJNg7fGmI01KD8ZjO5r9KUu/58HJyH1t4DZ1W9MukigP6r
         zokglATxA5TV7LnUJLF9X77Jz8pYcOMn4lxjZp9CJ/j4u5/kOquEe+hM+apWEna7gCVI
         a3LuFTziDBryuy4WRBTnALRcfaoZcnH3YIHBu9y4jJuMCYMFClb+DDfddsOFBP9bg7XG
         p0bQ==
X-Forwarded-Encrypted: i=1; AFNElJ+LkBFhoQ55X8DyuYV4gKq28RVOREAkYwKe0CDYrpDqSxUkM/OHfZeYe/86hxDzFSuRcyvBUsgJdpstpYo5LA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwObE0ewAR6ZAHPTA23a7BarRj0Y+lQZumz0b5z/oR1ccCB7kvh
	dQUZn0WZB6Zp7VJvar0NZsKN4q/r0V+o407WDZHAzqB01fjmOKVJjYyVaehTfEUucnM=
X-Gm-Gg: AeBDiesofRhpUdOw3slYXpk1hGlB4HhI/jmx5KaxwE0z7tXezeSZpxIcCBd0M4+AVM7
	jpPn2ZwkZ996kox6IiR/0aYQH+3ZESz5dvPWlxirhhG3WkS6xB9UtBEwEG6+5fehg/XIPksdexu
	vLQdWQIvGpHpHqxYNNhb5D+rqKygnhM8IEe20vKFg0hHRehapqztOvPQLhuZNCAA7Nz/lCMAGpo
	b4aqa+tVvXK1sykXD4IeOJfqDIrNiUgx23iev/F2fbQGfYbhzBSNF3c/SF2IGuGsGMCo2VmfDLQ
	ctWn3yIpTnVr4I85khGfOFEduczftSIAWgI0cWUrH/tEIhzT6hoeuIuk1zsUEeovJWhPJzbLQxi
	ekY0MgvUaWVuk/Vdc+ISG99MNBxuMt7QmLVfrnRgzuQ0zyRuDwhOuhnolvqEKJX1fRP14vL22Bf
	thXSFv6iiMv9Urezg/epJoAIL6i1IUIMHc8IuBdi8BuRBVw4mxJYWcVE245becmLEQ6MvOHA0PR
	m8YU3YpbVZYicdRn89TO7l0HQ==
X-Received: by 2002:a05:6000:25c6:b0:43d:7a08:a5f8 with SMTP id ffacd0b85a97d-43fe3e0ae91mr28509500f8f.35.1776781704476;
        Tue, 21 Apr 2026 07:28:24 -0700 (PDT)
Received: from localhost (p200300f65f114e0838b25d7f2f2f49cd.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:38b2:5d7f:2f2f:49cd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43fe4e3a18csm42923276f8f.20.2026.04.21.07.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 07:28:23 -0700 (PDT)
Date: Tue, 21 Apr 2026 16:28:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Johannes Berg <johannes@sipsolutions.net>, 
	Ulf Hansson <ulfh@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, linux-mmc@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-kernel@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
	linux-bluetooth@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, 
	Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Brian Norris <briannorris@chromium.org>, Francesco Dolcini <francesco@dolcini.it>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/6] sdio: Add syntactic sugar to store a pointer in
 sdio_driver_id
Message-ID: <aeeFun4zdz360GCb@monoceros>
References: <cover.1776429984.git.u.kleine-koenig@baylibre.com>
 <c830049dcfcd99f005e2ff6742aace9341c61f13.1776429984.git.u.kleine-koenig@baylibre.com>
 <aeaMkfk_1t98e7SU@monoceros>
 <CABBYNZJzbEmYzTk2m+Y8SoHVouTMA6Gje_55iJsQ6cYtDLftbQ@mail.gmail.com>
 <aecu1ixyHP2hQvgE@monoceros>
 <2d6e902083d693cdbb15fc62c6bf92db34fc734a.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wkasyawrdb76jdw2"
Content-Disposition: inline
In-Reply-To: <2d6e902083d693cdbb15fc62c6bf92db34fc734a.camel@sipsolutions.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_072827_189354_F879DF78 
X-CRM114-Status: GOOD (  28.62  )
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


--wkasyawrdb76jdw2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/6] sdio: Add syntactic sugar to store a pointer in
 sdio_driver_id
MIME-Version: 1.0

Hello Johannes,

On Tue, Apr 21, 2026 at 10:59:04AM +0200, Johannes Berg wrote:
> On Tue, 2026-04-21 at 10:12 +0200, Uwe Kleine-K=F6nig (The Capable Hub)
> wrote:
> > >=20
> > > We only received 1-3 of the 6:
> > >=20
> > > https://patchwork.kernel.org/project/bluetooth/list/?series=3D1082520
> > >=20
> > > Or is this on purpose, and we should consider the set complete?
> >=20
> > The remaining patches are for wifi. My expectation was that they go in
> > via wifi+netdev once the first patch is in their base. But of course I'm
> > open for maintainer coordination to let the series go in in less steps
> > than I expected. If that helps I can also create an immutable branch,
> > but I have no urge here, so if only the first patch goes in during the
> > next merge window, I won't have problems to keep track of the remaining
> > bits.
>=20
> It's probably better for everything all around, including the various
> automations that test patch series, if you just flip a coin, send these
> to either BT or WiFi, and then resend the others later :)

The first patch of this series adapting sdio_device_id is technically
mmc material. However to demonstrate the upside of this patch you also
have to look at at least one of bluetooth and wifi. So even if I drop
one of those there are still two subsystems involved. And then in my
subjective view it doesn't matter much if I involve two or three
subsystems. Regarding test automations I would assume that if the
bluetooth bot sees patches #1-#4 of this series it can do something
already (involving either testing the series only partially or finding
all 6 patches on lore). And then this isn't worse than just sending the
first four patches of the series and delaying wifi until later.

But I agree that's a trade-off.

Having said that, I'm happy if the first patch is merged and patches #2
to #6 are discarded by the bluetooth and wifi people. I'll come back to
them once the first patch is in a release.

> All assuming we get an ACK from whoever is responsible for patch 1 to
> merge it through some other tree :)

To make this more explicit: That would be Ulf as MMC maintainer.

Best regards
Uwe

--wkasyawrdb76jdw2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnniYQACgkQj4D7WH0S
/k4HiwgApSzuIJ1URhsrlSvh9N8JDusJG3q51TwVELmNJHyiGiApzvIMI2hf1LpH
E1+5egvSwoK33C+ReJRedPagWp0Ll3IFfj2s0y3HvwrI5a76Tdf4sHvj5NHPiRIH
y9KHO4wXogmzK8jd1kjTZQfVblWyXiIkrLiylpMbymhBKeStWp7DRQSV/94dIdZe
Ig/lLo4/6IjeuI3hqDpPqnRIscxMXd5YdujPggb4cJWAEy0Xeh0UelFMr/++spDD
07BXWuy0sJyPh7Q0c6YyhUYR2JQTbfRGhdia/V1lPmvtICvopICdSWsFPvGyqVwX
F0yDYOI9syIZGhmxoclUWCaZGbh0IA==
=qXiL
-----END PGP SIGNATURE-----

--wkasyawrdb76jdw2--

