Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D45FCD98CF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 09:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FW1d3+ywfL/u89Y0GaANXP2o6Did6zok4uhLhWb9zSM=; b=XlHcaqX2RL2HO4GBJTAYNbuWex
	GKu0WtqU/o8oduUBfkUQtUGijyPuzKMABohrm5ih51u0isDGudmYZdwGZ+yfHNFO/qndIh15oO9MW
	n2jLx8YUxc52dm0IoetV0RVLgRE2lFARpQA3xgZTLhp6meTwDJ3EbYmowqM+62ByIPjjzLmP6exu/
	FR1WrSqo/iRuazRmBH+1wpknO7yDJh0Q2XqiZiWvHwyPda0E2vASLBwJzebhuYZiRQK+a8Lxv98Xi
	ZRGvhGJpgsFX+ZJgn4wSg4SpryOtmxvRA6jBGqcdXLqd++dJ0tWYyB+Dx5Fqsj5xxRaoVsJQjFExi
	RyLhI1ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZPqp-0000000FVRp-3BZe;
	Tue, 16 Jun 2026 09:12:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZPqo-0000000FVRX-0h1d;
	Tue, 16 Jun 2026 09:12:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3060841E4C;
	Tue, 16 Jun 2026 09:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB3E1F000E9;
	Tue, 16 Jun 2026 09:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781601173;
	bh=FW1d3+ywfL/u89Y0GaANXP2o6Did6zok4uhLhWb9zSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XxWGbp6geRDNQzfxDhSwRIUZBmg3xTl0P94mNm/l6/oZFK0Hu0sZjXjX2wtaIekTW
	 knC5/NwA80iuU0sE8HEUoabMVZi8wONVDqoa/E6K9ithuGPv/XIDfwJgM4c3A2zmRS
	 7lyHeYFjMGiFz7HvwgN0fWiWh/ClKVOCccvfBMOmsqTZh1GIlqGn2IByfMw09oA5R7
	 Mh2KW5sN2aN8Jjkqz5gGN/HZQzIROUm7jbY8R+W3so4kEqrHf7lQ9n5MGa35GPMscf
	 bEtrOHAWWdG7tRP5kZMzj/0cz4YnH6X20DeSAuMXqxZTptHnzrdNYieR2E/ZVC7vtH
	 ESYqMRO6pCkLA==
Date: Tue, 16 Jun 2026 11:12:50 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Madhur Agrawal <madhur.agrawal@airoha.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: Re: [PATCH net-next v5 0/3] airoha: add the capability to configure
 GDM3/GDM4 as WAN/LAN on demand
Message-ID: <ajETkkD9DlBtYHLu@lore-desk>
References: <20260611-airoha-ethtool-priv_flags-v5-0-c11de08486d1@kernel.org>
 <20260615163713.665271a2@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="veXpHt1QEexMKAbu"
Content-Disposition: inline
In-Reply-To: <20260615163713.665271a2@kernel.org>
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


--veXpHt1QEexMKAbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, 11 Jun 2026 23:55:50 +0200 Lorenzo Bianconi wrote:
> >       net: airoha: use int instead of atomic_t for qdma users counter
> >       net: airoha: refactor QDMA start/stop into reusable helpers
> >       net: airoha: defer GDM3/GDM4 WAN mode and GDM2 loopback to QoS of=
fload
>=20
> only the first patch applies cleanly right now

ack, I will repost missing ones as soon as net-next is open again.

Regards,
Lorenzo

--veXpHt1QEexMKAbu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCajETkgAKCRA6cBh0uS2t
rOReAPsEmnYAMhDF28XS2vXZY1/UTQg2145bDKxI02AfrrbHKAD/RlrEtKZzVD+t
rV+CYqb0oXC+8tSoTWXY/uU+fRE88wk=
=SZVh
-----END PGP SIGNATURE-----

--veXpHt1QEexMKAbu--

