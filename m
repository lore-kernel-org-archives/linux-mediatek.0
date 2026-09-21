Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2DBC982E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 15:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ev9JnqYn8mQmOCRku707kjkP1oz2wBTVDOe4Yv6Gfno=; b=nIMe+Zosy2pgVI7oZk7CBTEnB6
	yb8d00hKFfKqyEipkXtm86KFcVmxnYRKHUH9K3H+X1mYQWS9jVG49jWt3zRMoUeCyI6s728uxoGEi
	OYKR4DvZZNmqRB0dGrebAx/ZhZ0LyVfRsG6F5XneSzvKQJRWibqEO0iIwllcmZQcC+LTj0qIVw/x7
	qcHyuiEkubiPDJvSnWw6Es1mGSqTP/XuQZo9Y1lqlgvgQL/P8QgvKecEDRgr6AxptClNyNnO7yLIi
	PBOwjDgmPEZNWKOPHPBSOeJQL/BA+Zzl8BE4ohrh52gS+KhImjGTPf/EMqrPFYAaHrrP0J8O2IBhD
	gYEekcaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fY0-00000002XBh-2Zkb;
	Mon, 21 Sep 2026 15:03:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fXw-00000002X9I-0JPT;
	Mon, 21 Sep 2026 15:03:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CA41417F9;
	Mon, 21 Sep 2026 15:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137C01F000FF;
	Mon, 21 Sep 2026 15:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790002987;
	bh=ev9JnqYn8mQmOCRku707kjkP1oz2wBTVDOe4Yv6Gfno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n9HQdLe31TtwecPF6AJ5SjUg6DGRjA+JJ/rh8Fvb8J5TD/fbYzOcfr1XR0yzxWW5C
	 p8kZxYMkGcECWBdR0heb1a+WGiVmw9CkPkCvXVB/Gyq3jcPFhKQjnCbpIJZhGqI8xx
	 kOZrVHVMh705FILqAl7rQDG41W97PAJRrBiH8bON3XmyWxsUE/0MoZYCCLLTL9FCbp
	 YqEfm39wrWWt+I3mEztHl+qtQtqkbOzuuu6Aa1P9L3xuYLf1v9Lbfo7TU+Uz/u2/aJ
	 pR5jNOydJwr0r7qfWZVBWKoiinEwYei3/WEsD0W7xJYD3OrOaFKWpt/30BCJG8FA4K
	 wF29OnFNpM3OQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 07E7F1AC56A7; Mon, 21 Sep 2026 16:03:04 +0100 (BST)
Date: Mon, 21 Sep 2026 17:03:03 +0200
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Amit Kucheria <amit.kucheria@linaro.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
	linux-mediatek@lists.infradead.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 05/28] alsa: pcm: Remove the qos request only if active
Message-ID: <arFHJ44K0Obi97uD@sirena.co.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-5-741cc20a74e5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GTYDC3kvYvkjH6S7"
Content-Disposition: inline
In-Reply-To: <20260920-macaudio-v1-5-741cc20a74e5@gmail.com>
X-Cookie: Too clever is dumb.
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


--GTYDC3kvYvkjH6S7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 02:53:44PM +1000, James Calligeros wrote:
> From: Hector Martin <marcan@marcan.st>
>=20
> Fixes warning:

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--GTYDC3kvYvkjH6S7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxRycACgkQJNaLcl1U
h9ABPQf/bkaR3SLlw7Iix+Fi/ktcWjdvjZKNoq/KPUuFQz6wTPJ2LQ/x+HAyuGfV
qLj88DOA4jrs8z22KqbX7t17fadvBRLqVpWlGfCsBIQyF2pAzhdqF5zAMlGJIMFp
gYLGzFKXCg3K4ebDdpJvRhwtm6pzbV9yQ3QXI91fMB5aeB0TdBMdT7JEeO+HolXH
7s3qTenDOVZHgMKcmwBquc98Fwj2X/Hs7MzIPTBjWoaZ9sPwWFIZqMRBvlRxb9Vx
RZo3j4hW5lJvL/bqpLJjeKZA67Tx6RLGUrAYt8Who7ruwqj8dtcG1L9WOO/NSd0Y
oso1OQUMbRZAy/skLqsVe7ocnexJ8A==
=60k5
-----END PGP SIGNATURE-----

--GTYDC3kvYvkjH6S7--

