Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B561BCCFA03
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 08:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YiVe8+DZyNnQGIgd/hOnfeLOTbD3P2I+OquzuRl7QwQ=; b=Fb/vZv4VIGTX9bZ9B0XgwYMR7s
	vx+bp1Ba5+9c+Y9WgWJLCBzgnHXRCWuncpV2PjWgLACzgEUYTvCuK0GWQRknDiDvyXMa0KLuzoke9
	S8MU2686m/XBw6RSxlnfMlLJv9mm/kqCQk/8m6nnur7ASv1WLDmUZ0cuTp3ifkG6bjlrrgc3SZ2CJ
	s0D/fZGhnadclSA6eFpLk4wc1lbhBIRQJ8qiiDX/6p2gPR794S2ZHmkjUKcd0sx1wG2+3YNyPKacv
	G4E+Q/JN86fgE9VcGyctgp5U/MkupmPk8WyB0heLECPOnW2s8hgdRXQPO0yZFoTgpH1nwZfMXWihu
	/GtC620Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvLd-0000000F46M-1rlB;
	Thu, 06 Nov 2025 08:28:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvLa-0000000F45U-3zCY;
	Thu, 06 Nov 2025 08:28:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1202C40379;
	Thu,  6 Nov 2025 08:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96500C4CEF7;
	Thu,  6 Nov 2025 08:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762417677;
	bh=YiVe8+DZyNnQGIgd/hOnfeLOTbD3P2I+OquzuRl7QwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oLSPPLdA9asjEPTe1fwBXXZGKkox3d84kem5UMcG234XR8UI4bVi108mUOHkZL4aS
	 41VIDDUiQtfg4HnCJig3ZTWg/VbJeuXc1qFBaqY/Vavti9xqWQC6k4/VdSm31TRRC4
	 pCl2S0+3G0Ol/Ig1Gt+YiHJcN68m6YPnarXA8m5KI2o6oMhmN6ukBSja8mY9dOXAbH
	 9dSlYmF1irKNyRbDUECnTydeTlPcv45zA4HMjpDxyNTZOicglS4joC0alP2J0MJZB2
	 Bt5EXMvFALKkOC7IA39mT2zrQiG7EbG3SP+zxxqdj+JyEyzJTbsyMBoBDzSgS4CM9J
	 PYigpjEx5B6mA==
Date: Thu, 6 Nov 2025 09:27:55 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: airoha: Reorganize airoha_queue struct
Message-ID: <aQxcC7-F6aaFgkxS@lore-desk>
References: <20251103-airoha-tx-linked-list-v1-0-baa07982cc30@kernel.org>
 <20251103-airoha-tx-linked-list-v1-2-baa07982cc30@kernel.org>
 <20251104183200.41b4b853@kernel.org>
 <aQsCYoS-cvkUjrMv@lore-desk>
 <20251105162846.53acd791@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1BeUY8BOGFuhrgeF"
Content-Disposition: inline
In-Reply-To: <20251105162846.53acd791@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_002759_009281_95469B9B 
X-CRM114-Status: GOOD (  18.22  )
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


--1BeUY8BOGFuhrgeF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, 5 Nov 2025 08:53:06 +0100 Lorenzo Bianconi wrote:
> > > On Mon, 03 Nov 2025 11:27:56 +0100 Lorenzo Bianconi wrote: =20
> > > > Do not allocate memory for rx-only fields for hw tx queues and for =
tx-only
> > > > fields for hw rx queues. =20
> > >=20
> > > Could you share more details (pahole)
> > > Given that napi_struct is in the same struct, 20B is probably not goi=
ng
> > > to make much difference? =20
> >=20
> > I agree the difference is not huge, I added this patch mainly for code
> > readability. If you prefer I can drop the patch, I do not have a strong
> > opinion about it. What do you think?
>=20
> I would not do it but your call.. Perhaps staring at data structures
> in crash dumps w/ drgn made me overly cautions of unnecessary overlap.

ack, fine. I will drop the patch in the next revision.

Regards,
Lorenzo

--1BeUY8BOGFuhrgeF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaQxcCwAKCRA6cBh0uS2t
rGr3AQCAdQ7oErdqyjTiSzfI46laBhyyW1FvstOzD4ZU6iWQUQD+ICRVZnM+6FsC
H3cVqWZOZ9iiLGrnByrS9ye/RUcqUgw=
=5zhL
-----END PGP SIGNATURE-----

--1BeUY8BOGFuhrgeF--

