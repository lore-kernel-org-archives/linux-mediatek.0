Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DA5606A329
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 18:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eV0s3U+S;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V5ovi0ah
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Pv6Z2msONZOMn5X5XcAinXRtg1l0bwQ6c+ZoL0wLzd8=; b=eV0s3U+SNa68FUMfdcF6UWFik+
	fej+t2vPkkIQXWIKAVCvTbzY06o2fs5+Yl+mUPdekW+AVKBj8XozS8AR6cUa1U3SBEyJBXiM3G/qL
	llHZ59kri5BhvjadhjlhT4yAJD/O4QXotyvQe4q2liYUwuWv16ZC4w6tNQmtjRxukVy5TnZeWrq3M
	baQ8TNV6fX3OsBQ8gmp7XZThnEk4/yWKGDHjG5mAjbiiIG+1BDcD77XBGGFu1NEtvVsHiprX74H3c
	s5xAxWM7//H8xXPPmqkLstNzk7rsjDQfmsVvE14V9suBL3T8FEPGLjRVyfEHMAXvNtx2LBM4+dQOa
	TaGBSbTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1FQ-00000003Vmo-2Wb7;
	Mon, 16 Nov 2026 18:16:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1FP-00000003Vlv-09dW
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 18:16:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CBE46129F;
	Mon, 16 Nov 2026 18:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CA01F000C4;
	Mon, 16 Nov 2026 18:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852965;
	bh=Pv6Z2msONZOMn5X5XcAinXRtg1l0bwQ6c+ZoL0wLzd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V5ovi0ahBoGhG3oLNCEMv0ZweRhbmg263fiz5Z3OEaOEe1EmkWwElr4NjaV0pBusZ
	 U+67Z1pdlYuquNsjEp0NPddWduHHqKo+LKkPrpsT2q7gHKgpvpIvuEkDDf1/Qay2RB
	 AI8/0Kj6NWQ08mCT8nfZX/qhbwcvRwIaVQWavWv4KxVlOo28ErPhEbHkzh/Z9b6jJi
	 KD7qK09dM/wMxPYpOkFlNsSfsr6eq07XSEHf7AhNj3J6NX4eMhDoGASxEqAt2Q/PCH
	 ECfBizh/XSlQuSbazX7YpvTKulAspE/JWhpc8rQiYbtQ1XCzQLvrhl6hTvTdLdKLjg
	 tSR2LkGrA3UsQ==
Date: Mon, 16 Nov 2026 18:15:59 +0000
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
Message-ID: <20261116-resolved-riot-c6a310bb2d8c@spud>
References: <20261112185941.1316112-1-john@phrozen.org>
 <20261112185941.1316112-6-john@phrozen.org>
 <20261113-fame-smock-6ea3b8fadcd0@spud>
 <b94ed5e4-cb80-4e05-9964-bb08a61aa1fd@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1NzTVWXoeJIha+mg"
Content-Disposition: inline
In-Reply-To: <b94ed5e4-cb80-4e05-9964-bb08a61aa1fd@phrozen.org>
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

--1NzTVWXoeJIha+mg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 06:47:27PM +0100, John Crispin wrote:
> On Fri, Nov 13, 2026 at 05:40:42PM +0000, Conor Dooley wrote:
> > As Lee requested, please split this out. Two patches, maybe even three.
>=20
> Agreed. v3 splits it into three patches.
>=20
> > Do we even need a child node here? If all this node does is
> > gpio/pinctrl, why can the driver not bind directly to this node?
> >
> > What else does it do that warrants being a syscon?
>=20
> The block also holds the PWM controller. Its registers interleave with
> the GPIO ones. The PWM series adds it as a second child, as on the
> EN7581. That series has a depency on this one so I have not posted it yet.
>=20
> > Otherwise, there should only be one. uart1 and uart2 should have
> > different nodes.
>=20
> Agreed. v3 sets maxItems to 1. Only pcm_spi and pcie keep more, as
> their groups carry different signals of one device.
>=20
> > So here, maxItems should be 1 for similar reasons.
>=20
> Agreed, v3 does this for i2c too.
>=20
> > I'm also curious about why this goes up to 74. None of the functions
> > have 74 pins, surely?
>=20
> A conf node can set the same config on any set of pins. 74 is all the
> pins. The EN7581 binding does the same with 58.

A difference in philosophy I guess - I would be grouping the pins in the
config node by user. So that there would be something like

spi1-stuff {
	spi1-function {
		function =3D spi
		group =3D spi1
	}

	spi1-config1 {
		pins =3D 1, 2
		config1
		config2
	}

	spi2-config2 {
		pins =3D 3
		config1
	}
}

spi {
	pinctrl-0 =3D spi1-function, spi-config1, spi-config2
}

or

spi {
	pinctrl-0 =3D spi1-stuff
}

IMO, having config nodes covering more than one "feature" doesn't really
make sense, as you'd end up with something like:

spi1-function {
	function =3D spi
	group =3D spi1
}

all-config1-config2 {
	pins =3D 1, 2, 4, 5
	config1
	config2
}

all-config1 {
	pins =3D 3
	config1
}

which kinda falls apart I think when a node can request a setting for
pins that are not part of it (in this case, that's pins 4 and 5)

spi {
	pinctrl-0 =3D spi1-function, all-config1, all-config1-config2
}

So my opinion is that the max number of items should be the size of the
largest peripheral.

What's the largest actual user on the 7581?
	=09
>=20
> v3 will follow shortly.
>=20
>         John
>=20
>=20

--1NzTVWXoeJIha+mg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavtIXwAKCRB4tDGHoIJi
0oxXAP9igIK0RsOLK/pxL71ixgfrLAYNjRe+ecNILh7URWV9CwEAvJFQWB0vwtGw
/lVvbbCWDcLaRjkTti8imdts7RQIMA8=
=DA3U
-----END PGP SIGNATURE-----

--1NzTVWXoeJIha+mg--

