Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387BFD116F1
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Dec 2025 16:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTyRVrjCO18+JC/Ns4l4toxpEDcXJdW5c8NRSKdgVYk=; b=iLuoQmA9GdRCCxWrGYYyEuAjVa
	yVthWMtBgedxJowf3xbzXlVOHOlXga1dnDjohXtOWNMVyRa9wO8OnxMXVoQbNOuA3G7lZerLFO16a
	mXeSTTfexl/OI0oMr+cIHyv80REBbv5GzxhfV5hEt0TNBvoEogOt57JyAe5LPlNFdyc4ajj8eHLqK
	kJBHIm4Lwf04CIAer7YskSovoAmxkHbGi085ges/BU7Hu/41+kCQYVPZYb57Z3ojvTwraaeierzu6
	FdupVs3cCVgE0btk7WP8RXjzGBxpdSUpjGb4/4LM0NXmiFL1I+fQXbpgL89aunK9TRpgoebVLOCKM
	6v4pPjBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6r7-00000004HQh-3AN6;
	Mon, 01 Dec 2025 16:34:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6r2-00000004HOm-0rbb;
	Mon, 01 Dec 2025 16:34:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 091B2417C2;
	Mon,  1 Dec 2025 16:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF55C4CEF1;
	Mon,  1 Dec 2025 16:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764606862;
	bh=lsmLY1XTcuPKQRRkGCYjv9HRpUaDcOWLeOiCZSJxheA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2SyEzCM2mxsu1vg5rhPTvf/Hpw7DWUhSm6p/6xVmmmeWRqRaZzUqaNhu3/NoPJ0+
	 cd7mkTvyfNCOMBkTxnsnywfQoqkzx8FT16FOqZ+YQSUN1wwLqymWtbsYnzSdmc7Io4
	 RPnXi0h34jYa7DLZxaAQv9ZIfS+5HA+LUGu2MxlkXFLW8V9sbh7bM3ipWdhRYbgwaX
	 IT5J0z74lhDlydIWIBo2cjTYX6yovJZdQ19wG2APRQkv7gZE1rM0bZSwpH2WCtN/js
	 EagJfnzrHo8xEQl/dIeqyg42hhlq1QMh9GPUlIJ19VVhp4hcLrN+vb0jvRFeQn44Yz
	 hfaSSJ6Flhuug==
Date: Mon, 1 Dec 2025 17:34:20 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Edmund Dea <edmund.j.dea@intel.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Anusha Srivatsa <asrivats@redhat.com>
Subject: Re: [PATCH 04/26] drm/bridge: make of_drm_find_bridge() a wrapper of
 drm_of_find_bridge()
Message-ID: <20251201-fragrant-kingfisher-of-expertise-e43bff@houat>
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-4-0db98a7fe474@bootlin.com>
 <wxxjp7fmsnh2k4huvg2thmfi6kcszdphrag3zosrnykn7abeua@cdlywqj32jd7>
 <DEH2R1Q0XJJG.1NMESYMX9GMFL@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ydcn74sicqovkiyx"
Content-Disposition: inline
In-Reply-To: <DEH2R1Q0XJJG.1NMESYMX9GMFL@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_083424_282429_01D82083 
X-CRM114-Status: GOOD (  36.65  )
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


--ydcn74sicqovkiyx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 04/26] drm/bridge: make of_drm_find_bridge() a wrapper of
 drm_of_find_bridge()
MIME-Version: 1.0

On Mon, Nov 24, 2025 at 05:44:09PM +0100, Luca Ceresoli wrote:
> On Mon Nov 24, 2025 at 11:22 AM CET, Maxime Ripard wrote:
> > Hi,
> >
> > On Wed, Nov 19, 2025 at 02:05:35PM +0100, Luca Ceresoli wrote:
> >> of_drm_find_bridge() is identical to drm_of_find_bridge() except it do=
es
> >> not increment the refcount. Rewrite it as a wrapper and put the bridge
> >> being returned so the behaviour is still the same.
> >>
> >> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >
> > Kind of the same comment than on the TODO. Is it worth doing that patch
> > when we could just remove it at the end of the series?
>=20
> This series is not converting all users I'm afraid.
>=20
> There are still some drivers to convert, but not a big deal.

Oh, ok, my bad then :)

> The main user to be converted is drm_of_find_panel_or_bridge(), which is
> very tricky, and in turn it is used by devm_drm_of_get_bridge(). We
> discussed this in the past and the conclusion was a rework of the drm_pan=
el
> lifetime was needed to be able to properly replace
> drm_of_find_panel_or_bridge().

Yeah. I wonder, now that we have a proper allocation scheme for panels
too, if we shouldn't just create a panel_bridge for every panel we
allocate.

> A drm_panel rework had started very well with devm_drm_panel_alloc() that
> got upstreamed by Anusha, but I'm not sure if it has made further progress
> after that. So AFAICT the plan is still "People will gradually switch to
> the new API over time", and the deprecated of_drm_find_bridge() will be
> removed after that.
>=20
> Does it still make sense to you?

Yep.

> Maxime, Anusha, are you aware of any steps forward about dynamic panel
> lifetime, after devm_drm_panel_alloc()?

AFAIK, Anusha stopped working on it. I'm fairly busy at the moment, but
early next year I'll try to revive that effort.

> >> @@ -1460,19 +1460,11 @@ EXPORT_SYMBOL(drm_of_find_bridge);
> >>   */
> >>  struct drm_bridge *of_drm_find_bridge(struct device_node *np)
> >>  {
> >> -	struct drm_bridge *bridge;
> >> -
> >> -	mutex_lock(&bridge_lock);
> >> +	struct drm_bridge *bridge =3D drm_of_find_bridge(np);
> >>
> >> -	list_for_each_entry(bridge, &bridge_list, list) {
> >> -		if (bridge->of_node =3D=3D np) {
> >> -			mutex_unlock(&bridge_lock);
> >> -			return bridge;
> >> -		}
> >> -	}
> >> +	drm_bridge_put(bridge);
> >
> > And if it does make sense to keep that patch, we should add a comment
> > here to document why we are doing this.
>=20
> OK, what about:
>=20
> /**
>  * We need to emulate the original semantice of of_drm_find_bridge(), whi=
ch
>  * was not getting any bridge reference. Being now based on
>  * drm_of_find_bridge() which gets a reference, put it before returning.
>  */

Yep, sounds good

Maxime

--ydcn74sicqovkiyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaS3DhwAKCRAnX84Zoj2+
dqBiAX4n1aG/P0RpeXc7a/Rs4Rb8xFcT1HhmKQntsyu2SIRXr/ZeXFhZhH8VqLQy
ZlBxtjcBgJ4j+tB8bDB66d6pCcBSXvEokhNx/ai3PzKnu+UZN/iYnCLaI+6sPz/N
WZOoPjZd4g==
=7WeW
-----END PGP SIGNATURE-----

--ydcn74sicqovkiyx--

