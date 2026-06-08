Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC18CD8C9F
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 09:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ber3utn/8EUmJVjFuWAwn9vEtzDxpWGplyIMDowu99g=; b=hph3WHkeQZnr0FqYco8UdA1vlq
	rmZyP5WVSvQD6VU8f+fybs6qrLfp/bOWHf7Db5Fon1Dz/npz1rNkxVPuNw5Thdx+XlSEY7oeUoEGw
	0i1Nn6pn75Xg8BAJx6rnv1XyMAOdsij7sQUYaQwfcng2+tzz4tnkiJYEZ5xoQ4x2eOJGBnb50K6uB
	Z4EwUpp0+kOhNtGv5+9ucIPzknzUeSX3kOS7OWpBKwSlzs2OY2xczqs/2XwcJ+GWAF0r4NlGhqki4
	oHP/hhw5/+RBAex/n/TzE0KtJ499jIyXqkdR4dximSO/X4k1Clpt/MMm8ag+7wOyrSoEwEveJa1K+
	bCFGAbyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWLL-00000003Bge-3vnI;
	Mon, 08 Jun 2026 09:32:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWLK-00000003Bfz-1g5E;
	Mon, 08 Jun 2026 09:32:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BC03E6001D;
	Mon,  8 Jun 2026 09:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C351F00893;
	Mon,  8 Jun 2026 09:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780911145;
	bh=ber3utn/8EUmJVjFuWAwn9vEtzDxpWGplyIMDowu99g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wx0nR9mok/6CM2+NSHU3FRGlv4mFmxhM9+nz/9D9zYxNnja3GH/7MC2DD90ujMk2i
	 gSBpBUixI1ubPXnguTHRsGKMQ6gP5MJFR14oM77wXK6EKUsiJIwOlvWxHvhWvGXtdX
	 6ttNKVy7kDYbCO4MKiyKGM2NTYDvXKB8d/KXMaNNZpZXAEFFTsA3gDcyhtc9uvhFDG
	 F7imx4OXYr+skEUgOfBGkSLZGC/nZKciFw28FDIjFgGk4fgo0pyVqUPDSzIa33FBrW
	 mLt8vQKwtKSNoFF8tcLbL4CqwWE8vPP2QZV6DYG61HzUFftORZiWuwhIjqriCPlCOh
	 aJ9JWlkShUhhg==
Date: Mon, 8 Jun 2026 11:32:23 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Madhur Agrawal <madhur.agrawal@airoha.com>
Subject: Re: [PATCH net-next v2] net: airoha: add ethtool priv_flags support
 for LAN/WAN and GDM2 loopback
Message-ID: <aiaMJ6i4o3olQtu9@lore-desk>
References: <20260607-airoha-ethtool-priv_flags-v2-1-742c7aa1e182@kernel.org>
 <33c3a87d-ad97-4f6a-8f76-ebab80c496ac@lunn.ch>
 <aiWzaV1f1Fpc2rhJ@lore-desk>
 <e8f3d24a-985b-4bde-9f51-2d5ae3d25b01@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="adOSsypNp6f03yZM"
Content-Disposition: inline
In-Reply-To: <e8f3d24a-985b-4bde-9f51-2d5ae3d25b01@lunn.ch>
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


--adOSsypNp6f03yZM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sun, Jun 07, 2026 at 08:07:37PM +0200, Lorenzo Bianconi wrote:
> > > > When a GDM3/GDM4 port is set to WAN mode, enable GDM2 loopback to
> > > > support hardware QoS. Conversely, when switching back to LAN mode,
> > > > disable the GDM2 loopback and restore the default forwarding
> > > > configuration.
> > >=20
> > > Why not just use the presence of an off loadable qdisc as the
> > > indicator to change mode?
> >=20
> > Hi Andrew,
> >=20
> > Interesting, can you please provide more details about you mean?
>=20
> You say you need it to be in loopback mode in order to support
> hardware QoS. You configure QoS by using a qdisc, and something like
> mqprio, tcf etc. So when the user configures QoS, you can see if the
> hardware supports the request QoS. If so, swap to loopback mode and
> offload the QoS function to the hardware. If the hardware does not
> support the requested QoS, leave it in software and keep with LAN
> mode.

ack thx, nice idea. I will rework this patch in order to rely on tc to
configure GDM3/GDM4 ports in LAN/WAN mode.

Regards,
Lorenzo

>=20
> 	Andrew

--adOSsypNp6f03yZM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaiaMJwAKCRA6cBh0uS2t
rK2bAPwIvDBSx3qJGo2xGvPkpy2z4KzEamk7juLxscsrz/+wtQEAl3TTMKLxFV09
y3YJwHEv243V0HLZH15bEMGGSDKoWws=
=rM/X
-----END PGP SIGNATURE-----

--adOSsypNp6f03yZM--

