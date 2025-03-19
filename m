Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F68C35FFB
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Mar 2025 20:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvoI88amUV+xRQVe583X4SdWMaeA6WhkypywOswnqf4=; b=1E0qg5MdpvAtVRvJq6ONOBOdyd
	GBVschwXZ9/LhrgXk22H2/FCAaHfZWUQX0R4puSw6xwuU1S6f1Lh+VqyIzLFPAEyvoxYibitsmuW0
	Sc7LOw1mbCSjuTPeZRiZ/sMXyXJXiKfLeMPlk88xFBeWyN6rjsixjbKMJdGvwW2irjWazJTCAXzLI
	3GifX6qooz2m1iJCMCgBJNGmD8BGNaUR+5Dpdj5mBQIVKnt6slDB+poseS2D+xm8fVOsJ58EcCiOz
	gSYPYdcxwnBD2tfB2AQL2I2isLHrVU6AdLFin3ZHECtrt69f8E+c9MvX0tuE26MpFBw42KjYyqeR8
	/zc3Do8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuzcH-0000000A2Gg-3k1o;
	Wed, 19 Mar 2025 20:02:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuzaW-0000000A26j-0kH2;
	Wed, 19 Mar 2025 20:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 71436A49317;
	Wed, 19 Mar 2025 19:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A385C4CEE4;
	Wed, 19 Mar 2025 20:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742414425;
	bh=kvoI88amUV+xRQVe583X4SdWMaeA6WhkypywOswnqf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mxFh5poViDzonov3bqtwSZczfyVmPZc4ZtVjBkjdMg2kWZ2jhP/7DiDr9I74fsIqL
	 2vGOFc/yiYEP1vSib4nL/ZsSObNw6nnzlArcjwL+oavUbM4DDibdienY7IbY+MiKed
	 EP2HA9zalA5zNExD52ZqdrudbRRf9zSPlZxjYOWW/SHHnqhkjQBu3/gfJTH+cIsYF1
	 IJh2sZo6SM3UCUS+qvh5gyhBb5MXTpFqXi/kFbO4iQOlC5I4w8hL/Moq+LUNYpOhUC
	 EcQMMvjtic7T2IxiilyYJSXtBeagiSSxbuNRXDFZvHoS9qm9q/9MrmFl2Z3CKAAHTq
	 /jkKzOmFBoosg==
Date: Wed, 19 Mar 2025 20:00:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunny Shen =?utf-8?B?KOayiOWnjeWnjSk=?= <Sunny.Shen@mediatek.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: mediatek: mdp-rsz: Add rules
 for MT8196
Message-ID: <20250319-footnote-trusting-230e509bed07@spud>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
 <20250211025317.399534-2-sunny.shen@mediatek.com>
 <20250211-feed-shed-4b32f146cc54@spud>
 <029f9fd7ab898769a7ae627b160e1dce446ccc9e.camel@mediatek.com>
 <20250224-dreamland-tactile-bdb58daf6060@spud>
 <76a6fc25a09dfddb55fdaf0a9d7dcf9a6129b00f.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YDfFiUDQR01e6m8O"
Content-Disposition: inline
In-Reply-To: <76a6fc25a09dfddb55fdaf0a9d7dcf9a6129b00f.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_130028_353845_1895C51F 
X-CRM114-Status: GOOD (  20.35  )
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


--YDfFiUDQR01e6m8O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 03:14:07AM +0000, Sunny Shen (=E6=B2=88=E5=A7=8D=E5=
=A7=8D) wrote:
> On Mon, 2025-02-24 at 19:01 +0000, Conor Dooley wrote:
> > On Sun, Feb 23, 2025 at 05:49:45PM +0000, Sunny Shen (=E6=B2=88=E5=A7=
=8D=E5=A7=8D) wrote:
> > > On Tue, 2025-02-11 at 17:54 +0000, Conor Dooley wrote:
> > > > On Tue, Feb 11, 2025 at 10:52:50AM +0800, Sunny Shen wrote:
> > > > > Add MDP-RSZ hardware description for MediaTek MT8196 SoC
> >=20
> > > > > +examples:
> > > > > +=C2=A0 - |
> > > > > +=C2=A0=C2=A0=C2=A0 soc {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <2=
>;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <2>;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disp_mdp_rsz0: disp-m=
dp-rsz0@321a0000 {
> > > >=20
> > > > And "disp-mdp-rsz0" isn't anything close to a generic node name.
> > >=20
> > > Will modify "disp-mdp-rsz0@321a0000" to "mdp-rsz@321a0000"
> >=20
> > I don't think that's an improvement. Hint: full words would be a good
> > place to start
>=20
> =C2=A0
> Hi Conor,
>=20
> About full words,=C2=A0
> Do you mean words like this?=C2=A0
> multimedia-display-path-resizer?
> or mdp-resizer?

These are both improvements on what you've got right now.

> We found that "mdp-rsz" this kind of word is used at
> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/mediate=
k/mt8183.dtsi
>=20
> I'm not sure what will be better.
> Can you provide more detailed suggestion about this naming?

--YDfFiUDQR01e6m8O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ9siUwAKCRB4tDGHoIJi
0qM6AP9QHiOJ1JZ8DbtI6sWT9DS41P7u5He+sMBB04jH28AtPgD9E9HooK6Of1XJ
+RkppxwWFhpzQPVFfQGxAiZm0J9taQo=
=bzKn
-----END PGP SIGNATURE-----

--YDfFiUDQR01e6m8O--

