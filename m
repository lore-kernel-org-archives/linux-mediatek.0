Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0867C021A4
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Feb 2025 19:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tn7rMLzZMtYRYg7sNSmwLOytEKHtBv8WoWbob9xBWAM=; b=dYNuaqylUh5MX1HTnpFrudbDq+
	6AhUb0m8vcni2znhGhisWDMQipCEy7nLSG0W0QBSLukQgVnY01mI3gMN91obsYwsypcSBu5IFooEU
	HKa4gHDz54OUlvjhbKOOkj2z4KcW7yQHGQNj8aPsF47bfTKTNM+hXBlIuITxO4vLldGgZUgM0li3n
	npkxOpQ+rrVcZIPWyihC0MnWkCojj++i9won5ixSsTTsRs+/+jv3cae5c8lgLXCXR7jzemdKfncA5
	9zXpfx0XKKP7AXOmR5JLnfbEuvZf6tnfrwa08rJJ4Jh/qip4DwWB8pTCXcgWddkj7FugPo2DrGeQb
	QdiqQ+WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdj6-0000000EuiF-27cH;
	Mon, 24 Feb 2025 19:02:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmdhb-0000000EuRd-1vCS;
	Mon, 24 Feb 2025 19:01:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E58DB5C54C3;
	Mon, 24 Feb 2025 19:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB93C4CED6;
	Mon, 24 Feb 2025 19:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740423674;
	bh=tn7rMLzZMtYRYg7sNSmwLOytEKHtBv8WoWbob9xBWAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VORHk7Wqt7FpXC7lv2ML0sepJs4sW6mDdIpTFKoV7wPrw0aR0r5iCxp8oLZLtoV0Y
	 540ePSSJ0hU/aKR0bzvf8f/bPJf5wVzaDukJaEB5j0TRYA+99jJRCQ4S1tclH1EsVk
	 395bkLFZhWxRREnrZo82NjoVBq+EYH9knwECJQhCvGguyL2NryDJ6Iztn0zVp1KOB1
	 okSrPhygsQc3THoomI+G3QF/b3gCLzBmk+ew1EnHT5kwVUAZduTsUgpLNmkPfeGf/b
	 GELUYLGonFzMCDJZMLWQ6selS3CyorJXMcDE/aAp0mj0qIeTCDm1eNFicwNARHIuja
	 BTIyXR32KjUFA==
Date: Mon, 24 Feb 2025 19:01:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunny Shen =?utf-8?B?KOayiOWnjeWnjSk=?= <Sunny.Shen@mediatek.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: mediatek: mdp-rsz: Add rules
 for MT8196
Message-ID: <20250224-dreamland-tactile-bdb58daf6060@spud>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
 <20250211025317.399534-2-sunny.shen@mediatek.com>
 <20250211-feed-shed-4b32f146cc54@spud>
 <029f9fd7ab898769a7ae627b160e1dce446ccc9e.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Kj7+TgqWhvqCa97w"
Content-Disposition: inline
In-Reply-To: <029f9fd7ab898769a7ae627b160e1dce446ccc9e.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_110115_548267_B56E7022 
X-CRM114-Status: GOOD (  12.08  )
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>, Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>, Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "treapking@chromium.org" <treapking@chromium.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--Kj7+TgqWhvqCa97w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 05:49:45PM +0000, Sunny Shen (=E6=B2=88=E5=A7=8D=E5=
=A7=8D) wrote:
> On Tue, 2025-02-11 at 17:54 +0000, Conor Dooley wrote:
> > On Tue, Feb 11, 2025 at 10:52:50AM +0800, Sunny Shen wrote:
> > > Add MDP-RSZ hardware description for MediaTek MT8196 SoC

> > > +examples:
> > > +=C2=A0 - |
> > > +=C2=A0=C2=A0=C2=A0 soc {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <2>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <2>;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disp_mdp_rsz0: disp-mdp-r=
sz0@321a0000 {
> >=20
> > And "disp-mdp-rsz0" isn't anything close to a generic node name.
>=20
> Will modify "disp-mdp-rsz0@321a0000" to "mdp-rsz@321a0000"

I don't think that's an improvement. Hint: full words would be a good
place to start

--Kj7+TgqWhvqCa97w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ7zB9AAKCRB4tDGHoIJi
0movAP0T4ZSKqBTGVXYcSVdKvK8Atq3J5/N6tEb8HcMi9xx9UQEAkfBR5ULg8Sm6
kSeROWLffX6nrBC9VVNWJbYYIa/a0AI=
=v5zV
-----END PGP SIGNATURE-----

--Kj7+TgqWhvqCa97w--

