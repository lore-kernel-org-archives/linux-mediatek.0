Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88224C47E49
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 16:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnLSAx8iHqQmVY38WPaxSCi80CkhkomZKsuDZXu48po=; b=FFDyGsC6bUTyPrgW8TotC1bsPb
	cFQnoTBSUbiz2V/QTLLa7O7xJYrPjBx8HadR0GZcax8reenNpUDHXboxm1efBniSXoyoTmepv2oFM
	sgb12rcE4QtD5Z9fxsY4de+vIjA54XrIDmCQOQAn3Jk5Gt4Ddk0GbMFg/W3mdKoKVnpbdxyyGJ0WO
	MrBjqVEYrAceOJnsBuMgS2lJgRQRTVEhOmloiOjKVRKgB5v/KiRF81JyQjJKMUSbV1JYHc/UC0hM9
	pyxRkkw+yUW5Wjr/ICf2f7lGS7PWYQikxnnSJFd1qcKyhEP9J1YwK/emmWaeU2XfwJ4VgCR/pQn+T
	2IoiZD/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSfxa-0049xi-2K;
	Wed, 24 Jan 2024 16:18:42 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSfxV-0049ry-2h;
	Wed, 24 Jan 2024 16:18:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3D0D5CE09E4;
	Wed, 24 Jan 2024 16:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874CCC433F1;
	Wed, 24 Jan 2024 16:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706113110;
	bh=OnLSAx8iHqQmVY38WPaxSCi80CkhkomZKsuDZXu48po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AL3g9UVwKWkzvEy921hocGE4NdfXxpHlKC9KPV2EvNjP3wQ9qWOv593UM2GRC4KQh
	 rX5srmz6IKl2ktp7Bn/ZVrt3iT7XEBzP1wSwLU/6o1pUP4QqpcBy350EkACovOkod3
	 osvBi8TBzJi5MPHrHbt5aiLHL3Y06INKxt5dnP8yciT89zQY4rTq6tWsIOzeSERRzs
	 IlX4Q8X9svGLtsjAUNbbMew1ro02xI7jty6bkUXiHQTzYQRL8e/JRUNuKLr6D4Huni
	 OO7m8lrYUfAKnkM7cuJKZFrTUpCDgAHbq6/3VnO98DjHACKcZoiAbSGfKmi3FH4GXT
	 kRyLQ3UWUUu7w==
Date: Wed, 24 Jan 2024 16:18:25 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, linux@roeck-us.net,
	heikki.krogerus@linux.intel.com, cy_huang@richtek.com,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: mt6360-tcpc: Drop
 interrupt-names
Message-ID: <20240124-confining-monologue-22ed69313cef@spud>
References: <20240119094105.98312-1-angelogioacchino.delregno@collabora.com>
 <20240119-eldest-discharge-e2d3812be0a9@spud>
 <12b7b339-498b-45c1-bc5e-05e07660aefa@collabora.com>
 <20240123-procurer-jumbo-ebbec485505d@spud>
 <4fdbc3d8-3d44-4c2c-aae6-daa0b431e1c9@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4KxYMHS039FHiq27"
Content-Disposition: inline
In-Reply-To: <4fdbc3d8-3d44-4c2c-aae6-daa0b431e1c9@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_081838_242188_8561CE7F 
X-CRM114-Status: GOOD (  27.41  )
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


--4KxYMHS039FHiq27
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 09:48:23AM +0100, AngeloGioacchino Del Regno wrote:
> Il 23/01/24 18:14, Conor Dooley ha scritto:
> > On Mon, Jan 22, 2024 at 11:32:30AM +0100, AngeloGioacchino Del Regno wr=
ote:
> > > Il 19/01/24 17:32, Conor Dooley ha scritto:
> > > > On Fri, Jan 19, 2024 at 10:41:04AM +0100, AngeloGioacchino Del Regn=
o wrote:
> > > > > This IP has only one interrupt, hence interrupt-names is not nece=
ssary
> > > > > to have.
> > > > > Since there is no user yet, simply remove interrupt-names.
> > > >=20
> > > > I'm a bit confused chief. Patch 2 in this series removes a user of =
this
> > > > property from a driver, so can you explain how this statement is tr=
ue?
> > > >=20
> > > > Maybe I need to drink a few cans of Monster and revisit this patchs=
et?
> > > >=20
> > >=20
> > > What I mean with "there is no user" is that there's no device tree wi=
th any
> > > mt6360-tcpc node upstream yet, so there is no meaningful ABI breakage.
> > > Different story would be if there was a device tree using this alread=
y, in
> > > which case, you can make a required property optional but not remove =
it.
> >=20
> > Not every devicetree lives within the kernel.. If the driver is using
> > it, I'm not inclined to agree that it should be removed.
>=20
> I get the point, but as far as I remember, it's not the first time that t=
his
> kind of change is upstreamed.
>=20
> I'm fine with keeping things as they are but, since my intention is to ac=
tually
> introduce an actual user of this binding upstream, and that actually depe=
nds on
> if this change is accepted or not (as I have to know whether I can omit a=
dding
> the interrupt-names property or not)....
>=20
> ....may I ask for more feedback/opinions from Rob and/or Krzk?

Sure, I am happy to be overruled if they disagree.

--4KxYMHS039FHiq27
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbE4UQAKCRB4tDGHoIJi
0uPsAQCPgBalBEox9nudpYDysAzqxIikRApwxQAEtWdNrbyE+gEAqe4RKAkPBgg7
mDOgnpd8nPFf5HFkx98XwG427LjEKgU=
=cx/V
-----END PGP SIGNATURE-----

--4KxYMHS039FHiq27--

