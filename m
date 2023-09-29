Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB5CE71D3D
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Sep 2023 13:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAuJIldlylLazF8i3TScbNcboOUKZBtuM6a9TiCJGNo=; b=ovjHWRYmoCaZ0dmAuJn//FZsxR
	lyRLuw5DPa3PXfu/YeOfRIYoXGHOuLAODQZDL7q7VaC2D2PVmJ/2qK4Hib0KAhTwDTVE1dMM835hN
	2eqAz7NlYmA4BFV6ejqWLJZxb1oa/uW+tK4dF3EZ1NkYNy3Uq32uvObUsLLqwwxRxWKSQQVGPvFWh
	kYjanA46DK2/7rvF8rJXK8hLuvlnGPNuVT0WbAe7GBxxmhsNHK+i0z4Ia/MuyIH3WGLHP+6SfP9lW
	TKjMhL8abDtTTn7MOH8iJ9rRoMZMG4KpqNXg2b/nUWtrXsHBlKmVdlFF8njAFQgwwz8vBbt4Tiw1o
	G3+k5L6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmE11-0080Yi-0b;
	Fri, 29 Sep 2023 13:58:47 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmE0w-0080Wq-13;
	Fri, 29 Sep 2023 13:58:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2F504CE246D;
	Fri, 29 Sep 2023 13:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0392C433C8;
	Fri, 29 Sep 2023 13:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695995917;
	bh=CHEXPlpFmHD8rVxXqeAQGRdFG1pNx0Kk9AeUvrx4txE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jICsUAQdJA2wHFVYpRu0kl90yxId8Gfhtvm1Jl/X6SJ+/DXMq/vjzap5vOuFTtwjh
	 +QzG99dKnAyH85c+D0/GnH0CxZ4mdGim0f+7MsehocvKAFmSRnkmao0TU1hnCm3td7
	 wnznvXqRkOfqKzo6wDlV+xrDRrjmKlBSQnVla0W6zbK3aQ+GLbiNaMsqnjUuK0dT2l
	 EsIcZ7mC4cEw6wRZ3y4PcPckx75TRQDVLRrcrkE691z6isF1B9xWAnYOIRU73y1954
	 TkddNsCTIAjNYTDQuzD0ZFVdRS3WWXA6EMUhRQ/Q2xanFqKF+ovZKvS4hubVD62yld
	 y+ZdJ/cft3Q9w==
Date: Fri, 29 Sep 2023 14:58:31 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Moudy Ho =?utf-8?B?KOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 12/16] dt-bindings: display: mediatek: color: add
 compatible for MT8195
Message-ID: <20230929-renewably-landing-3f5a1d2eb27c@spud>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-13-moudy.ho@mediatek.com>
 <20230922-zebra-modify-87ff23c70bb3@spud>
 <20230922-overhung-deception-e9b461ba0372@spud>
 <7c445195e17e15d5af5fcb30ae53f76c713e958b.camel@mediatek.com>
 <20230927-crunching-prancing-36fe3eb79607@wendy>
 <825ac03b692043d48563620ad9542a4ee43211e7.camel@mediatek.com>
 <20230928-keep-attractor-1e7cd0df03b2@spud>
 <7dbadd86-f408-bc94-92fc-22f460eebb43@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/VzKeb9rEqhIUOcg"
Content-Disposition: inline
In-Reply-To: <7dbadd86-f408-bc94-92fc-22f460eebb43@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_065842_714317_28E1D80C 
X-CRM114-Status: GOOD (  52.15  )
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


--/VzKeb9rEqhIUOcg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2023 at 10:42:58AM +0200, AngeloGioacchino Del Regno wrote:
> Il 28/09/23 18:49, Conor Dooley ha scritto:
> > On Thu, Sep 28, 2023 at 02:52:23AM +0000, Moudy Ho (=E4=BD=95=E5=AE=97=
=E5=8E=9F) wrote:
> > > On Wed, 2023-09-27 at 10:47 +0100, Conor Dooley wrote:
> > > > On Wed, Sep 27, 2023 at 07:19:28AM +0000, Moudy Ho (=E4=BD=95=E5=AE=
=97=E5=8E=9F) wrote:
> > > > > On Fri, 2023-09-22 at 16:51 +0100, Conor Dooley wrote:
> > > > > > On Fri, Sep 22, 2023 at 04:49:14PM +0100, Conor Dooley wrote:
> > > > > > > On Fri, Sep 22, 2023 at 03:21:12PM +0800, Moudy Ho wrote:
> > > > > > > > Add a compatible string for the COLOR block in MediaTek
> > > > > > > > MT8195
> > > > > > > > that
> > > > > > > > is controlled by MDP3.
> > > > > > > >=20
> > > > > > > > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > > > > > > > ---
> > > > > > > >   .../devicetree/bindings/display/mediatek/mediatek,color.y=
aml
> > > > > > > >   | 1 +
> > > > > > > >   1 file changed, 1 insertion(+)
> > > > > > > >=20
> > > > > > > > diff --git
> > > > > > > > a/Documentation/devicetree/bindings/display/mediatek/mediat=
ek
> > > > > > > > ,col
> > > > > > > > or.yaml
> > > > > > > > b/Documentation/devicetree/bindings/display/mediatek/mediat=
ek
> > > > > > > > ,col
> > > > > > > > or.yaml
> > > > > > > > index f21e44092043..b886ca0d89ea 100644
> > > > > > > > ---
> > > > > > > > a/Documentation/devicetree/bindings/display/mediatek/mediat=
ek
> > > > > > > > ,col
> > > > > > > > or.yaml
> > > > > > > > +++
> > > > > > > > b/Documentation/devicetree/bindings/display/mediatek/mediat=
ek
> > > > > > > > ,col
> > > > > > > > or.yaml
> > > > > > > > @@ -26,6 +26,7 @@ properties:
> > > > > > > >             - mediatek,mt2701-disp-color
> > > > > > > >             - mediatek,mt8167-disp-color
> > > > > > > >             - mediatek,mt8173-disp-color
> > > > > > > > +          - mediatek,mt8195-mdp3-color
> > > > > > >=20
> > > > > > > How come this one is a "mdp3" not a "disp"?
> > > > > >=20
> > > > > > I don't know what mdp3 means & googling gives me no answers.
> > > > > > What's
> > > > > > the
> > > > > > "disp" one controlled by, since it isn't controlled by mdp3?
> > > > > >=20
> >=20
> > > > > Mediatek's Media Data Path ver.3 (MDP3) is associated with MMSYS
> > > > > and
> > > > > acts as an independent driver that operates between VDEC and DISP.
> > > > > By controlling multiple components, it carries out tasks like
> > > > > converting color formats, resizing, and applying specific Picture
> > > > > Quality (PQ) effects.
> > > > > The driver can be found at "driver/media/platform/mediatek/mdp3".
> > > > > Since the same hardware components are configured in both MDP3 and
> > > > > DISP, considering previous discussions, I attemped to integrate
> > > > > into a
> > > > > single binding, named after the controlling user.
> > > >=20
> > > > I'm still kinda struggling to understand this. Do you mean that the
> > > > hardware can be controlled by either of the disp and mdp3 drivers,
> > > > and
> > > > a compatible containing "disp" would use one driver, and one
> > > > containing
> > > > "mdp3" would use another?
> > > >=20
> >=20
> > > Sorry for any confusion caused by the software information. In the
> > > video pipeline, after decoding, the data flows sequentially through t=
wo
> > > subsystems: MDP and DISP. Each subsystems has multiple IPs, with some
> > > serving the same functionality as COLOR mentioned here. However, these
> > > IPs cannot be controlled by different subsystems. Therefore, I includ=
ed
> > > the name of the subsystem after SoC to identify the configuration's
> > > location. Is this approach feasible?
> >=20
> > I'll have to leave things to the likes of Laurent to comment here I
> > think. I don't understand this hardware well enough to have a useful
> > opinion. It would seem like a different part of the datapath is a
> > different device that should be documented separately, but I don't know
> > enough to say for sure, sorry.
>=20
> Hardware speaking, it's not a different device: those all reside in the
> same block, except they are configured to route their I/O *either* to the
> display pipeline, *or* to the MDP3 pipeline.

Is it runtime configurable?

> I would agree though in that this could be more flexible, as in, not
> having a requirement to say "mdp3" or "disp", and managing the COLOR
> blocks generically and letting the drivers to choose the actual path
> transparently from what the devicetree compatible is, but there's no
> practical point in doing this in the end, because there is an enough
> number of (for example, COLOR) blocks such that one can be completely
> reserved to MDP3 and one completely reserved to DISP.
>=20
> So, we don't *need* this flexibility, but would be nice to have for
> different (unexistant, basically) usecases...
>=20
> The thing is, if we go for the maximum flexibility, the drawback is
> that we'd see a number of nodes like
>=20
> shared_block: something@somewhere {
> 	compatible =3D "mediatek,something";
> }
>=20
> mdp3: dma-controller@14001000 {
> 	......
> 	mediatek,color =3D <&color0>;
> 	mediatek,stitch =3D <&stitch0>;
> 	mediatek,hdr =3D <&hdr0>;
> 	mediatek,aal =3D <&aal0>;
> 	....
> 	long list of another 10 components
> }
>=20
> display: something@somewhere {
> 	......
> 	an even longer list than the MDP3 one
> }
>=20
> ...or perhaps even a graph, which is even longer in the end.
>=20
> I'm not against this kind of structure, but I wonder if it's worth it.

I have no idea, but it sounds like it isn't. Really what happened here,
is not me having a particular thing I want to see, is getting a response
that implied that there were two different compatibles for the same
hardware, controlled by different drivers.
It does seem to be that way at present, and this is not something I am
willing to ack etc. That's not to say that I am _nacking_ it, just that
I don't understand this enough to ack something that we usually tell
people not to do.

--/VzKeb9rEqhIUOcg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRbYBwAKCRB4tDGHoIJi
0gDgAQD4uuPf+CMkS9i8umAoxxX46tlaJiF0ICduWocAJ7z4JwEAmoWZAI0hf7If
KE6e8+SKB238W6F5JretaCDxsAbF5gU=
=6dAo
-----END PGP SIGNATURE-----

--/VzKeb9rEqhIUOcg--

