Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984C0D5B16E
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Dec 2025 14:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIlQ7Jpm1J4ASKEQEKqjtVdyfOiI54c8CBKZNP/oWHI=; b=Au7N4HFvSBBPa6W8oLb1jJCN12
	c4U9ztOYRs99+XVMMN8u+TMQFpD7HCrdo1QrQ8x1cmrBNW3Trk4rDPyTIyZYDonjm6/6l/lvYAaMY
	3i0Xnc4UMkU3/jNTey6lj2Swz1+Bpv6XqUxWbeSePsJlkwseyYydhJqck+FkJaKBTqAXnpy6XASnK
	x5mLmyr9voGq8tUJAg+HI0evWLprL4iDJGzfcwC878htQw/3et0PLaz5cToTcqpTO3IwbqQDCHerZ
	WrKrE+LF7Bi5D4wKdTe7blAZUuHTCIRWJJkbNtBobHHdhQPyvhc+FFEtGhVkgv5t6zOr0s05rab7C
	sFfy7OAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9a8-00000003naP-3NRv;
	Mon, 15 Dec 2025 14:29:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9a5-00000003nZh-1Xp5;
	Mon, 15 Dec 2025 14:29:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F8B9407C7;
	Mon, 15 Dec 2025 14:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3651BC4CEF5;
	Mon, 15 Dec 2025 14:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765808984;
	bh=IIlQ7Jpm1J4ASKEQEKqjtVdyfOiI54c8CBKZNP/oWHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l4fdbQXGhu7aq4nVKW70uSZJdrfxRTKK/HurNg+8xQSMyqVXOMNaFdPMDj6p/0wge
	 dL6Ylsn+hI1nsQ68Uykk/a3pTnGt56VVC7H9u7B+i/mqcRjnAYeNFBciU3k70OFeJV
	 OztDw9Nnk0xFBd4DmlvtKwPSRmWl9W9HmdOOi8ywbkvkdw1DqTHb2VnQSXSW6DhSPT
	 hE6dFUHqW+D55qc2j1QUG+oa9fz2HT71pIPf1H+gwq8hZMdvRlpig01sGEK39GaPvn
	 MhoyfgniD3WE3qWWeZq2NsxbzLU26davCCtL+Xtoe9bMfXL4Kr21kcIiur8TbNAQbO
	 rK0ErGqxpRGzw==
Date: Mon, 15 Dec 2025 15:29:40 +0100
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
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Louis Chauvet <louis.chauvet@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 01/26] drm/bridge: add of_drm_get_bridge()
Message-ID: <20251215-quirky-encouraging-waxbill-5b04e6@penduick>
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
 <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-1-88f8a107eca2@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="jpxp2yuvxjnvtegw"
Content-Disposition: inline
In-Reply-To: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-1-88f8a107eca2@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_062945_470941_4542D6AF 
X-CRM114-Status: GOOD (  13.94  )
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


--jpxp2yuvxjnvtegw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 01/26] drm/bridge: add of_drm_get_bridge()
MIME-Version: 1.0

Hi,

On Fri, Nov 28, 2025 at 05:50:11PM +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() does not increment the refcount for the returned
> bridge, but that is required now. However converting it and all its users
> is not realistically doable at once given the large amount of (direct and
> indirect) callers and the complexity of some.
>=20
> Solve this issue by creating a new of_drm_get_bridge() function that is
> identical to of_drm_find_bridge() except it takes a reference. Then
> of_drm_find_bridge() will be deprecated to be eventually removed.
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a=
18ad@houat/
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I don't think it's a good name still. It's way too close to
drm_bridge_get it gets confusing. I still believe that
of_drm_find_and_get_bridge() is a better name. If you disagree, please
explain why.

Maxime

--jpxp2yuvxjnvtegw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaUAbUwAKCRAnX84Zoj2+
djcYAX0XDI3qHEaKNThqzvK+xH7wgFSb4PSqArOG86oyKIGMi8pT7b5csS5bOuV5
2ctCO38BgN8OxOo0ee8AltSidRvxpQt71QwlpeJAk75pjrFZxR3ZmGp82TJ8I9q7
RSr1bb4kZw==
=txhL
-----END PGP SIGNATURE-----

--jpxp2yuvxjnvtegw--

