Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96835E6FE59
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 15:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gShbIwDi47csuk2aPH61NZxR0Zp7x9854TUpDPptWBI=; b=WQRwF2dd9TQmwyJDxs3cYmOwWJ
	PUfwYelNZvNPGlH+UpIeDc1hliGGHvUo/7WopD5qyQE4Z3hBhWYwMHnQ/YHjeVaQU52ZrBh0qfksl
	HMBL9CTSGaouozBx0wK21B06V7fqTnrY63EMT6Eum5j9/Bkn/3lVlxb4Wj1VFys6+JUTuTDu0t50G
	VFb2gzXbNZXm2XJwzkOQwiS3RHu43pXxcfYl2dX+Lz9YCM2BCuuzMp0bVmO003wLf7AhebO4St75J
	sPv4CnRqFKfDLkjdW+w7RI6fNo+wt0FEBsX5DJCmuVvZ5xwmuobytKE1XdjsLOQ4Tjr3ToL9YwEOL
	Ti2zUVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjiR2-009Lnk-13;
	Fri, 22 Sep 2023 15:51:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjiQx-009LjS-2x;
	Fri, 22 Sep 2023 15:51:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E3217CE23C2;
	Fri, 22 Sep 2023 15:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DFEC433C8;
	Fri, 22 Sep 2023 15:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695397868;
	bh=3b+hYQ2/a1Tm4DZtb0TZrPYMb1hWdBmLeqVPuYi1b8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qJkSamFKo5k3W7L6WowyYvGfhzsmI4tGVDDkVNqAok8EbAX0I93fKZjvYvlyIg+I6
	 OcICjT7jOhmFm0LWxOUKDB/3mrrbFi18jJc1NPiF40QjakUUe01rRZIVjQ3WGvcZL+
	 ngsEEEuryZqYi/rM0VbWmjY9nxkQFTIjw3ruszj2HjdvEciGVJtTedybe0bMO+C2Ce
	 OikvuY6ojAcSyz8f4vT5AlUaZXWSH/0mx5lBNljVOZMekaYwtxdc8Gx/TKPhzHh/j5
	 Ggvv0od3iGXviCLxNERVQEZvmbLMomI7KMUrXaTOC9yaWzAaucl/xyC9oxEVilQctz
	 Qwpdpz7Eg2hFg==
Date: Fri, 22 Sep 2023 16:51:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 12/16] dt-bindings: display: mediatek: color: add
 compatible for MT8195
Message-ID: <20230922-overhung-deception-e9b461ba0372@spud>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-13-moudy.ho@mediatek.com>
 <20230922-zebra-modify-87ff23c70bb3@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="69Rgp8WDZjRLhaqe"
Content-Disposition: inline
In-Reply-To: <20230922-zebra-modify-87ff23c70bb3@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_085112_161532_5E3BE1BF 
X-CRM114-Status: GOOD (  18.62  )
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


--69Rgp8WDZjRLhaqe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 04:49:14PM +0100, Conor Dooley wrote:
> On Fri, Sep 22, 2023 at 03:21:12PM +0800, Moudy Ho wrote:
> > Add a compatible string for the COLOR block in MediaTek MT8195 that
> > is controlled by MDP3.
> >=20
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,color.yaml     | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediate=
k,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,=
color.yaml
> > index f21e44092043..b886ca0d89ea 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color=
=2Eyaml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color=
=2Eyaml
> > @@ -26,6 +26,7 @@ properties:
> >            - mediatek,mt2701-disp-color
> >            - mediatek,mt8167-disp-color
> >            - mediatek,mt8173-disp-color
> > +          - mediatek,mt8195-mdp3-color
>=20
> How come this one is a "mdp3" not a "disp"?

I don't know what mdp3 means & googling gives me no answers. What's the
"disp" one controlled by, since it isn't controlled by mdp3?

>=20
> >        - items:
> >            - enum:
> >                - mediatek,mt7623-disp-color
> > --=20
> > 2.18.0
> >=20



--69Rgp8WDZjRLhaqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ235gAKCRB4tDGHoIJi
0lr8AP4pX5+R5I8aDBRKOjqDyPh+najy713mmV8eYHNfQMiT8wEAjkYfap6BkRMI
5Jt5G7JZd61u4Y6qeP5GiKajIyK6kw4=
=yqe5
-----END PGP SIGNATURE-----

--69Rgp8WDZjRLhaqe--

