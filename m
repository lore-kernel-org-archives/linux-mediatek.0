Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EF5C47DAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 18:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7EY0mPsSgC46RKzlxSqQVzOJIjHT6qi0o74Lmt7acU=; b=ZCh0VpQE6Z9DfE7CuhioqoAv09
	7bwAxugLxNF8sVC2mRSuZCJdAAMq/F5lsw7+TDrk8UXMSHPjvhbAO4de3LXA7W59SEhVrkI3fkkZH
	FgQq+VNmfjDPlJk7SXAypxHh8x4zvSEAykXtGXjNoaLhJdPt5Mp/KNnSh253IqE3eXpZyOdzbM4je
	UnDDEw1Izcn04HRd0uaMbnuTC7Vs7piJpHmcJEyOwWxTpiU+ofb1r19VZtZyN5TnWPim6n478c7V+
	euL/nK9p5yJWKYiOe4svaDMuNmuWIbQ8FbNpu2DknSiv0BDEgKIqF2juaS4wCk287hkTOkc1tY1vh
	2loDTkjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRygl-00DQ9F-04;
	Mon, 22 Jan 2024 18:06:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRygg-00DQ6W-3A;
	Mon, 22 Jan 2024 18:06:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 92871B81012;
	Mon, 22 Jan 2024 18:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8585BC43394;
	Mon, 22 Jan 2024 18:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705946781;
	bh=qrDyQthPZZTKjHUK3BaRkyooNaTHr0ABooQXcmIORQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P+44kknIgGDYv8m/O3mTLyLItJU55Rtb5gFxpjypN10+/ZEXGmmUxwRQjHAlIv/c8
	 pCx0E/U3QajTejHTcF2O5VxBnLVdEJk2prnWp/3xXGkmB7utitaBIFr5iO5jAsE/o3
	 OYyTteZjco9WgFPR7gamNwaqutu65BfUGewtFzsysjuGvFz5rfu8Oy7rGRn2Y8iY5s
	 AQomliXDiCxgKi/N0Q6nJgCeGbSdkfy8phy9qTsdPfsX+mzHX8EWdGhp2EB8PGQEYx
	 oMwD7KsIVosusXZljtvb6a+JtUyEJzDwUmhfaTbIMPnlDOqZxmTcVLEm/mXIypHtJx
	 miGEozKLymj3w==
Date: Mon, 22 Jan 2024 18:06:15 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com, matthias.bgg@gmail.com,
	dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
	andersson@kernel.org, nathan@kernel.org, luca.weiss@fairphone.com,
	tianping.fang@mediatek.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Introduce ITE IT5205 Alt. Mode
 Passive MUX
Message-ID: <20240122-delouse-popsicle-a6f94cce9fb4@spud>
References: <20240119125812.239197-1-angelogioacchino.delregno@collabora.com>
 <20240119125812.239197-2-angelogioacchino.delregno@collabora.com>
 <20240119-remedial-unripe-2a3a46b4f117@spud>
 <9605c20a-12ad-49ad-8114-d59f2f772514@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nmjJ86xFFhBOL+Dl"
Content-Disposition: inline
In-Reply-To: <9605c20a-12ad-49ad-8114-d59f2f772514@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_100623_304145_5B385A3D 
X-CRM114-Status: GOOD (  24.45  )
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


--nmjJ86xFFhBOL+Dl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 11:27:11AM +0100, AngeloGioacchino Del Regno wrote:
> Il 19/01/24 17:18, Conor Dooley ha scritto:
> > On Fri, Jan 19, 2024 at 01:58:11PM +0100, AngeloGioacchino Del Regno wr=
ote:
> > > Introduce a binding for the ITE IT5205 Alternate Mode Passive MUX,
> > > used for connecting, disconnecting and switching orientation and
> > > control the SBU signals for alternate modes on USB Type-C ports.
> > >=20
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> > > ---
> > >   .../devicetree/bindings/usb/ite,it5205.yaml   | 72 ++++++++++++++++=
+++
> > >   1 file changed, 72 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/usb/ite,it5205=
=2Eyaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/usb/ite,it5205.yaml b/=
Documentation/devicetree/bindings/usb/ite,it5205.yaml
> > > new file mode 100644
> > > index 000000000000..36ec4251b5f2
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/usb/ite,it5205.yaml
> > > @@ -0,0 +1,72 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/usb/ite,it5205.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: ITE IT5202 Type-C USB Alternate Mode Passive MUX
> > > +
> > > +maintainers:
> > > +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.=
com>
> > > +  - Tianping Fang <tianping.fang@mediatek.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: ite,it5205
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  vcc-supply:
> > > +    description: Power supply for VCC pin (3.3V)
> > > +
> > > +  mode-switch:
> > > +    description: Flag the port as possible handle of altmode switchi=
ng
> > > +    type: boolean
> > > +
> > > +  orientation-switch:
> > > +    description: Flag the port as possible handler of orientation sw=
itching
> > > +    type: boolean
> > > +
> > > +  ite,ovp-enable:
> > > +    description: Enable Over Voltage Protection functionality
> > > +    type: boolean
> >=20
> > Bitta devil's advocacy perhaps, but why is this DT property? Is it not
> > known whether or not this is supported based on the compatible, and
> > whether or not to enable it is a decision for the operating system to
> > make?
> >=20
> >=20
>=20
> AFAIK, not all board designs can use the OVP. On some, this may be unstab=
le - the
> use case where this can be safely enabled is when there's nothing in betw=
een the
> mux and the controller, and between the mux and the port.

Okay, if it varies based on the configuration that makes sense. Perhaps
in the future consider mentioning stuff like that in the commit message.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--nmjJ86xFFhBOL+Dl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa6ulwAKCRB4tDGHoIJi
0teFAQDYntozsnG0qrbeJtl0OkXFU7kXZH/5/2m68HTIZLIOKQEA0vZa72Ejv9TG
DZbeNEl/1O99qdsZnvfvk/zLcQdjyQ4=
=xdmh
-----END PGP SIGNATURE-----

--nmjJ86xFFhBOL+Dl--

