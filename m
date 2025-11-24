Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EFFCFA466
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Nov 2025 10:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j88+fhPIdW8gPTbw5PE9ZwFgfEd9SdIZY0QtY60xwMY=; b=yGG1B9gZ6ko/Rb63Xy+/lZeH2Z
	qnF0WYwMkxYs+wMUVk7E4X07Y2iotAdHyJG7PDm5ElOUVEZKzlV8DcUkWjeZOwf7rDDTCd7+s1NCx
	T3BHl6EZ/Dfh8VVTesYl3QTcFEFTBqaAQknJm6lmo8uXRF7MLhvodaIc3Rbz87S/sa6YMF5Z+IMEW
	U3hLZKznaso23g+UzyfXxHGx6XpEhz1clrtJC49OHIe9qnzfBmDo2JjeMFK1HGbCrOFFI+o40oovN
	1sLtY1T7YbwPb9TkEyt0JSkFvZsbXZf5kww/Rf6KTVRT9Fh5MQVEkZAnDuCMv0ZFmCe4nLjEwStFi
	zC3Weqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTbD-0000000BPL1-10JC;
	Mon, 24 Nov 2025 10:15:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTbA-0000000BPKa-3Ike;
	Mon, 24 Nov 2025 10:15:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 75F3E6015E;
	Mon, 24 Nov 2025 10:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02B6C4CEF1;
	Mon, 24 Nov 2025 10:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763979307;
	bh=g1TQ7XQeyLBDzYywTEPn9VRhpmBOP26943Ft+LrFK/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HB5Zq7JW2S0TfMR6GDL9y7IDj8+deKZELHKXeCfIUS212rSE2rluo8wGoHYm08aSm
	 WSGXttii+tApWtA05NuNkOyVRm7663jQ+m5zYtqfPSJjGQ+69J7fv2T14T1EbDZtp/
	 3hhBDojX5wbGPtvrDdFlDZio+EeyQd3utbr7xlpnTmhLdNAYEr5OKxXuoTg7q53Lsq
	 vcFxgcQTKFPCDkM21aY3ignoCPtrahq18wVqeGZWA5GKg8iqLYw+pwVZGATKXxkmcx
	 7XDwPDUT3rkdd+1lW5NFGajpEwyxPDJBliJOMdQ+UTmOeSQtzIl/0RPN9vZIIka+6D
	 N3+rAJn8zEiRQ==
Date: Mon, 24 Nov 2025 11:15:04 +0100
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
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 01/26] drm/bridge: add drm_of_find_bridge()
Message-ID: <pv56bl4p7lfflloocozxaeufd6udkk3jhehrtne65cidrvlfwn@wvrkw6mjmhwp>
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-1-0db98a7fe474@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="twk7wjh5xuvkmppn"
Content-Disposition: inline
In-Reply-To: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-1-0db98a7fe474@bootlin.com>
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


--twk7wjh5xuvkmppn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 01/26] drm/bridge: add drm_of_find_bridge()
MIME-Version: 1.0

Hi,

On Wed, Nov 19, 2025 at 02:05:32PM +0100, Luca Ceresoli wrote:
>  #ifdef CONFIG_OF
> +/**
> + * drm_of_find_bridge - find the bridge corresponding to the device node in
> + *			the global bridge list
> + * @np: device node
> + *
> + * The refcount of the returned bridge is incremented. Use drm_bridge_put()
> + * when done with it.
> + *
> + * RETURNS:
> + * drm_bridge control struct on success, NULL on failure
> + */
> +struct drm_bridge *drm_of_find_bridge(struct device_node *np)

So the convention we've mostly had was that the first argument would
define the prefix, ie. if we pass a drm_* pointer, the prefix is drm, if
we pass a device_node pointer, then the prefix is of.

Considering that convention, of_drm_find_bridge would be the ideal
candidate, but we can't use that obviously. What about
of_drm_find_and_get_bridge, or of_drm_get_bridge?

Maxime

--twk7wjh5xuvkmppn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaSQwIwAKCRAnX84Zoj2+
djjOAX4ybr+wl/+UOcOA2rBeNLXe/Z1dp5/tGgSDwtWjMs40Yd6/Hb5lNtxsjj1I
6JoUoYYBgOFk70NFGGvi/mntXPXv6z3+wX+3vJ0TwGXmq/4KlMMLzOWyZ4+KUGTS
PkzNnQ7Vlw==
=S5GV
-----END PGP SIGNATURE-----

--twk7wjh5xuvkmppn--

