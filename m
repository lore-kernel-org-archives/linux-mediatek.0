Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D91F606A33D
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 18:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MZiBRCTf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cKqwZ9AI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IhKPOj7Hor5KmSjiCzxW9s+vgx6buagkucJfrANTbbM=; b=MZiBRCTfC0WoR+8QFAq+X3Wdlq
	InA9hA1ZchE8nnic/R1Jl8I10YFz0z5mtTwtxq61KM5UIx+L+x+4RD3b8rCs111JqIZDJlgbALi5M
	TL8jy/8evc35EB8tHo9bLHpuRQh3bHniu6pLDt/Xv2AnnJ6hgJ/Te9FzL8jmgC2YSy8q+oJOGLZ3w
	7lYXnhKAQQ7E+97ixBPrcDIl3rpWH/hvJr3qXTcMbu7gWJMXHAw7ofI1ojzjXePqIYDWqht1tzzZG
	7y21jDRewMkDLVB4yOXaepKB/BZEqowKfY8R7TG3o5Vbyeg8ZHwjNKT2v0VHASa+9x912GUE31Iv4
	nura3dNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNX8-00000006icN-45FJ;
	Tue, 17 Nov 2026 18:03:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNX7-00000006ic5-2SAj
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 18:03:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 074C3400E9;
	Tue, 17 Nov 2026 18:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E231F000C5;
	Tue, 17 Nov 2026 18:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794938632;
	bh=IhKPOj7Hor5KmSjiCzxW9s+vgx6buagkucJfrANTbbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cKqwZ9AIMIJWxujQ8XjH4udI9D9vAjOKNWATMZYLEBdrXO17pKIA8QO7EMiMftYW2
	 1zEdmsTstOQ2ZvvctwDEIwkHTWR7ed+XDCxWPC1NqAj/A/lQt0wB2KMDZlXtXkn4Ef
	 +c9IhEYakqLVuzuFPVsDfC3Ez/ezg/mCFEy82bTws6jKskf1Vj5fKpJqgLsyxALH0Y
	 0XLLt8Z5q1DNt63iguUD3P1Z5qdcJC2daECEzt34/M5Zk/6ioRF2eCVvPmKmUgrqAe
	 lgqhpDTBBuRh1+jk3DynAX3Nk5yxB7SGlAF0SIoIKG84rlVoohM+GjlJg0tiTiO1aV
	 2vcxfm/KxhsTg==
Date: Tue, 17 Nov 2026 18:03:46 +0000
From: Conor Dooley <conor@kernel.org>
To: John Crispin <john@phrozen.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org, lei.dong@airoha.com,
	Linqi.zhang@airoha.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH v2 5/7] dt-bindings: pinctrl: airoha: add AN7589
Message-ID: <20261117-illicitly-translate-2d16b1279df9@spud>
References: <20261112185941.1316112-1-john@phrozen.org>
 <20261112185941.1316112-6-john@phrozen.org>
 <20261113-fame-smock-6ea3b8fadcd0@spud>
 <b94ed5e4-cb80-4e05-9964-bb08a61aa1fd@phrozen.org>
 <20261116-resolved-riot-c6a310bb2d8c@spud>
 <e20f708f-ebfe-4dc0-a64c-1590fdf608f3@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8k1LZRwMDy0PRoKK"
Content-Disposition: inline
In-Reply-To: <e20f708f-ebfe-4dc0-a64c-1590fdf608f3@phrozen.org>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--8k1LZRwMDy0PRoKK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 08:39:21PM +0100, John Crispin wrote:
> Hi Conor,
=20
> On 16.11.26 19:15, Conor Dooley wrote:
> > On Mon, Nov 16, 2026 at 06:47:27PM +0100, John Crispin wrote:
> >> On Fri, Nov 13, 2026 at 05:40:42PM +0000, Conor Dooley wrote:
> >>> As Lee requested, please split this out. Two patches, maybe even thre=
e.
> >>
> >> Agreed. v3 splits it into three patches.
> >>
> >>> Do we even need a child node here? If all this node does is
> >>> gpio/pinctrl, why can the driver not bind directly to this node?
> >>>
> >>> What else does it do that warrants being a syscon?
> >>
> >> The block also holds the PWM controller. Its registers interleave with
> >> the GPIO ones. The PWM series adds it as a second child, as on the
> >> EN7581. That series has a depency on this one so I have not posted it =
yet.

Hmm, or just add #pwm-cells to the syscon node itself? There's no need
for a child node just to put #pwm-cells and a compatible in it. The pwm
driver can be probed via mfd using mfd_add_devices().

> >>
> >>> Otherwise, there should only be one. uart1 and uart2 should have
> >>> different nodes.
> >>
> >> Agreed. v3 sets maxItems to 1. Only pcm_spi and pcie keep more, as
> >> their groups carry different signals of one device.
> >>
> >>> So here, maxItems should be 1 for similar reasons.
> >>
> >> Agreed, v3 does this for i2c too.
> >>
> >>> I'm also curious about why this goes up to 74. None of the functions
> >>> have 74 pins, surely?
> >>
> >> A conf node can set the same config on any set of pins. 74 is all the
> >> pins. The EN7581 binding does the same with 58.
> >=20
> > A difference in philosophy I guess - I would be grouping the pins in the
> > config node by user. So that there would be something like
> >=20
> > spi1-stuff {
> > 	spi1-function {
> > 		function =3D spi
> > 		group =3D spi1
> > 	}
> >=20
> > 	spi1-config1 {
> > 		pins =3D 1, 2
> > 		config1
> > 		config2
> > 	}
> >=20
> > 	spi2-config2 {
> > 		pins =3D 3
> > 		config1
> > 	}
> > }
> >=20
> > spi {
> > 	pinctrl-0 =3D spi1-function, spi-config1, spi-config2
> > }
> >=20
> > or
> >=20
> > spi {
> > 	pinctrl-0 =3D spi1-stuff
> > }
> >=20
> > IMO, having config nodes covering more than one "feature" doesn't really
> > make sense, as you'd end up with something like:
> >=20
> > spi1-function {
> > 	function =3D spi
> > 	group =3D spi1
> > }
> >=20
> > all-config1-config2 {
> > 	pins =3D 1, 2, 4, 5
> > 	config1
> > 	config2
> > }
> >=20
> > all-config1 {
> > 	pins =3D 3
> > 	config1
> > }
> >=20
> > which kinda falls apart I think when a node can request a setting for
> > pins that are not part of it (in this case, that's pins 4 and 5)
> >=20
> > spi {
> > 	pinctrl-0 =3D spi1-function, all-config1, all-config1-config2
> > }
> >=20
> > So my opinion is that the max number of items should be the size of the
> > largest peripheral.
> >=20
> > What's the largest actual user on the 7581?

>=20
> The largest users are EN7523 pcm_spi 14, AN7563 pnand 17, AN7583
> pnand 17, EN7528 pnand 17, EN7581 pnand 17 and AN7589 emmc 12 (these
> numbers are based on a hackish "grep foo | bar", so they might be
> slightly off).
>=20
> I copied and modified what the other AN/EN bindings do. These set the
> limit to the pin count of the SoC: EN7523 38, AN7563 38, AN7583 53,
> EN7528 50, EN7581 58. Your call really, I do not mind either way. I can
> send a v4 and then a follow up series cleaning up the existing bindings
> as well.

btw, please do not top post.

I'd much rather not let this permit doing things that do not make any
sense.

--8k1LZRwMDy0PRoKK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavyXAgAKCRB4tDGHoIJi
0kYvAPi/HmH3Vy8OOZFdQP22lPQI2A+1zxWZ5QRthgGK9h06AP9Ck9DBOrdwBmuf
j1r5gIqXcDkItxjnbOdp4z1RBb6vCw==
=sWmb
-----END PGP SIGNATURE-----

--8k1LZRwMDy0PRoKK--

