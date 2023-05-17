Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77E3C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 17:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ho43mx6uCPAKmoMaHBaNU3hiVpzwjAnFavdhz/cZUxg=; b=LU4SYLpcD7LWcb1S1uQlq6aj4g
	z5GpB8BPxOc6HKKWRWGN5TPNNXAjMpGuwzH3a4utmLYT5fm8yFCg5oSKjLozFtho4qRmZogUu35jr
	XmrBAgdf5YjS/5+8y7rPOKAPLTtn4kv+rfokX1QYtAVmW6gSaIiNgJrB/FRI/QKLQyCh4rY9Obw/f
	Dxy6nMyMA6Y1WWrcoWK1kO2eVfsqRna2S+ShW/cd92vFmibmFGLJTUBMAGQPYAIYfTQVWXo7TcRzb
	sdJHaNMWpepk0Bh3bgGPf66eAI2hSlWGbYABepx6WrGqPGdxxcbmxg3a1zIx8KxhqGtk2Mqe50zGX
	mR773tCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzKxD-00AasI-2W;
	Wed, 17 May 2023 17:28:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzKxA-00AarK-3C;
	Wed, 17 May 2023 17:28:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D88DB6347B;
	Wed, 17 May 2023 17:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3619C4339B;
	Wed, 17 May 2023 17:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684344523;
	bh=C3rhU6ql3cfx2nqHQAamUs5eDbPSPa+ws3rxF+aWa1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RD5m7lY8p7R/XOcqyBVFFZfqAIWQot+4Wz9y1pVEPguZz2/zJZLnuJutREWwZWyNY
	 8dvbV1paGoF2P0cxi6Uhrp5PFkO1JcmumAbu0u+pR+SmGiC96WQYfYVph3FNqAyNJO
	 g8+KA1tA0og4KZkEz20nLQ6lUA4RKKJ6JKWYCuSSoKkLOb7jU/skUjv2Sq9R7JC12Y
	 k6wrrngs03G61v7aIAMQsOHNgQxLFr/Av1eu2qQt6F99nsjB89kk8KazKnTkI3+bzA
	 0ttHn01LOdkGQ/rvn9VobAo0bcVV9/GLcaQWQ0AhBh8CG/27P16Ji+ywYPDyAASVPX
	 W5hLvuK5Yeb2w==
Date: Wed, 17 May 2023 18:28:36 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alexandre Bailon <abailon@baylibre.com>, airlied@gmail.com,
	daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, sumit.semwal@linaro.org,
	christian.koenig@amd.com, jstephan@baylibre.com,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, khilman@baylibre.com,
	nbelin@baylibre.com, bero@baylibre.com
Subject: Re: [PATCH 7/7] dt-bindings: Add bidings for mtk,apu-drm
Message-ID: <20230517-deceptive-filtrate-9acd07071371@spud>
References: <20230517145237.295461-1-abailon@baylibre.com>
 <20230517145237.295461-8-abailon@baylibre.com>
 <c32f0c3f-b43a-7045-38cc-2c11c7bb571e@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DPep3TX9ZmccIKnm"
Content-Disposition: inline
In-Reply-To: <c32f0c3f-b43a-7045-38cc-2c11c7bb571e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_102845_137915_644EB286 
X-CRM114-Status: GOOD (  22.15  )
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


--DPep3TX9ZmccIKnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2023 at 05:04:00PM +0200, AngeloGioacchino Del Regno wrote:
> Il 17/05/23 16:52, Alexandre Bailon ha scritto:
> > This adds the device tree bindings for the APU DRM driver.
> >=20
> > Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> > Reviewed-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >   .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
>=20
> mediatek,mt(model)-apu.yaml
>=20
> >   1 file changed, 38 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.=
yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml b/D=
ocumentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> > new file mode 100644
> > index 000000000000..6f432d3ea478
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> > @@ -0,0 +1,38 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpu/mediatek,apu-drm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: AI Processor Unit DRM
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,apu-drm
>=20
> const: mediatek,mt8195-apu (or whatever else).

Aye, and drop the references to DRM in the title field too (and add the
vendor name?).

>=20
> ...besides, I don't think that this patch even belongs to this series? :-)
> Spoiler alert! :-)

Well, I do not know what this means - but if it is being respun as part
of some other work, a description field should be added to the binding.

Cheers,
Conor.


--DPep3TX9ZmccIKnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGUOxAAKCRB4tDGHoIJi
0tq/AQCEx0ykFfDTB4Fn6jIhxnkBk2YlIWinWZykIWz+PlyIaQD7B+GkFiVdN1GH
F6vvIFXtMcll02nyunl0Xx5gYXvbzAQ=
=+2H9
-----END PGP SIGNATURE-----

--DPep3TX9ZmccIKnm--

