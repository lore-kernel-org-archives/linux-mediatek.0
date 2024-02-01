Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1888C48286
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 18:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPlLDcArSF1cBikO4rFTlnRitwqEi0aGbatvchQYh/M=; b=oyx4Yo91Cu8HW62ZjBuvaWMi4b
	OdHFn3JUXV2IaYoByhpCsPPjY2J3tq69VhNl1XISmEykr0FKGnBzfkUi5GmRiCqXut2btG3gJY/0p
	IkgNcb91Idjjc0LX/QVbgIH0zopoXcb02f4DBXKCVb0KpPlQkPMeDixhwCFMxbGkSqCpLiZ7lBI8A
	1/6QFsJlqLdrjSccRersxZpRQbqIWcA+C5aI/19lV5PqKAit9UlaIl94168AGHHnuDd57nVP6f1va
	bqziSrBZqV8tp4Ma2XeKRvtOhV1a06ThXNPd3KbNIXfJ72R3XjCdXUybJ6Z/GiDI5gDGZlqvjSIfz
	aQkWf6+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbfm-00000008zOh-1is6;
	Thu, 01 Feb 2024 18:20:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbfi-00000008zNs-2Ocs;
	Thu, 01 Feb 2024 18:20:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9BA30CE2777;
	Thu,  1 Feb 2024 18:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75700C433F1;
	Thu,  1 Feb 2024 18:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706811619;
	bh=hPlLDcArSF1cBikO4rFTlnRitwqEi0aGbatvchQYh/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R3VdfipOeSEOruQUNgkJ5igtoy9AihiH0Mmm8DX8nTYaEmEEAWEuJcAxlzC42rjxx
	 hDU5Oanbc112HkwOM7gmMxyEsVNZS14RtqJ8LWx+ezMoSZT61ESQHfDoOwuSuC8pzn
	 NKyJ8HCEBRpk8uijKMuApf7/Z6Lum3LE4eEcgpVj8Gpw/lPHn+eBO/qf5b68lPdTOF
	 EHE0RalG/5HjrfQS0bH4gWJCUE++eg9T0hYYHFDCrKGH/bBfafXShd9YVjKgp0cwgA
	 kKsNg0QK4updSpPjtzmGxj5jgBc8+QOCuzp68E06AXd3rhLobvNkxNK/p7KLlUQQcy
	 CY1KJgASLARTw==
Date: Thu, 1 Feb 2024 18:20:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <linux@fw-web.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: Aw: Re:  Re: [PATCH v3 1/2] dt-bindings: reset: mediatek: add
 MT7988 reset IDs
Message-ID: <20240201-gutless-rising-692b7fa45f65@spud>
References: <20240117184111.62371-1-linux@fw-web.de>
 <20240117184111.62371-2-linux@fw-web.de>
 <20240118-calcium-krypton-3c787b8d1912@spud>
 <trinity-afc4f48e-65e1-46ee-a78b-1d670cc0f310-1705615200900@3c-app-gmx-bap21>
 <43f946cc-07e1-48c5-9b31-40fc9bc93037@collabora.com>
 <20240119-dupe-obligate-707b3a01b356@spud>
 <0EA6A126-DDC0-4E9F-BEBC-FD018B08CA84@public-files.de>
 <20240201-goes-passable-0ba841d36bc3@wendy>
 <trinity-2aef55db-42e0-4f58-9c43-696311a96eb8-1706797383340@3c-app-gmx-bap28>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W2Ee5I31/3TVyJ4S"
Content-Disposition: inline
In-Reply-To: <trinity-2aef55db-42e0-4f58-9c43-696311a96eb8-1706797383340@3c-app-gmx-bap28>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_102022_807175_AA3DD8EA 
X-CRM114-Status: GOOD (  11.90  )
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


--W2Ee5I31/3TVyJ4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 03:23:03PM +0100, Frank Wunderlich wrote:
> > Gesendet: Donnerstag, 01. Februar 2024 um 14:11 Uhr
> > Von: "Conor Dooley" <conor.dooley@microchip.com>
> > I suspect I was asking for a commit message that explains why these
> > numbers don't continue in sequence. With that,
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Cheers,
> > Conor.
>=20
> OK, i would add this to commit message:
>=20
> "Value is starting again from 0 because resets are used in another driver
> than existing constants."

s/driver/device/ and sure.

--W2Ee5I31/3TVyJ4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbvg3gAKCRB4tDGHoIJi
0neOAP41G78/o62ed4G9kWo32xu5055qvUh0jEZVW3ivqp4iXwD/dXNffyuUL2Et
q3Abdf9njDBMF+vEwjQbZoOQo11BgAs=
=3tdX
-----END PGP SIGNATURE-----

--W2Ee5I31/3TVyJ4S--

