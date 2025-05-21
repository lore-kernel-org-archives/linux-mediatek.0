Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9F6C2D0CD
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 May 2025 15:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRXCr3Uh0WGqe0ESiF0panNk2y+kY7VENjp5cg4gP4w=; b=n9+/eku4WWJgjI/W5LPwRvUnnG
	cb/N18xZcc0j8cXPZtMwg1TrbGDAH0oYagAq95pTfOC8AfJVc+sSqMRh2zBTq5O5DjFz4y8hbiyMb
	BXCC/hXOC3ERFcI4QBYae3fYZ0RYmsqedNHzKMRnaTtzNzkkJKbd2RmKIuPAgv+0pDoba6ukklNh2
	cqZ6Yxb29nlZByeF45LnglPNIMSC3nV3RCccpl4nMftp47AJPBKsE7Dekzblvmn3lgj9z7/+E5zob
	SSq+j0TagdXK3ea/1iJ/Tc2JdscJK4hOLwpyQ6gEksqGl+k0Q062l/VklHtK998I0Y5Y+T+qXVxXZ
	2YaXhUHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHllG-0000000GMpS-0p0p;
	Wed, 21 May 2025 15:53:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlit-0000000GMAk-2rmT;
	Wed, 21 May 2025 15:51:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66F455C5A92;
	Wed, 21 May 2025 15:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BEA8C4CEE4;
	Wed, 21 May 2025 15:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747842674;
	bh=CRXCr3Uh0WGqe0ESiF0panNk2y+kY7VENjp5cg4gP4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qwFl0xCRRLwp400F5dLYDjwJ+pqmtK7xX0OYpjGEmOGfMFjQpssfmAD1ZqG5KAnHk
	 x7M7uJxvrojw8em6NUUynuEM7zvFHbWDBqbhPEKG3B9SW4D5KlQuBxOzGvVQ+3ggpn
	 Fvq+44Jct/cBYWcGV9VogKMCVXvoClVDGK5rzZUY19zvuxPFoVgsZwVZBkODYoC8mp
	 K7AnU/6aYPxCHs5RsRogeDO2x/T7+aB2GYu1aAHm46Iv7zAZc634fwtAVaay+c5boN
	 IEudIM0MuEi/lZ/JXXxH8I6qHwJjs4eSxUA7sAqI1+rK8Xf81BS+LcCTOeTbCWRQpM
	 Ec/wr7XC8BBqg==
Date: Wed, 21 May 2025 16:51:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/4] dt-bindings: net: airoha: Add EN7581
 memory-region property
Message-ID: <20250521-tinwork-numeric-35f98627d3d2@spud>
References: <20250521-airopha-desc-sram-v3-0-a6e9b085b4f0@kernel.org>
 <20250521-airopha-desc-sram-v3-1-a6e9b085b4f0@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wjvgKzIIZLrkHJfJ"
Content-Disposition: inline
In-Reply-To: <20250521-airopha-desc-sram-v3-1-a6e9b085b4f0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_085115_764839_90F55FE5 
X-CRM114-Status: GOOD (  10.24  )
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


--wjvgKzIIZLrkHJfJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 09:16:36AM +0200, Lorenzo Bianconi wrote:
> Introduce memory-region and memory-region-names properties for the
> ethernet node available on EN7581 SoC in order to reserve system memory
> for hw forwarding buffers queue used by the QDMA modules.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--wjvgKzIIZLrkHJfJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaC32bQAKCRB4tDGHoIJi
0jfDAQDU0/mGf2mXREMZJiO9Z2iGK1V1+C+Zk9qaLvyd/7jKJAD/bl9C4D9zQtX4
K3gqNtnGI+N3oAYNQE/13WP9DV/89gM=
=3S3F
-----END PGP SIGNATURE-----

--wjvgKzIIZLrkHJfJ--

