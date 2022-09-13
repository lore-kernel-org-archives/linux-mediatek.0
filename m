Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83598C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 12:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNjKGYRXxnN5wf91lOjLeTn55t+AvBNEHQlmAA2ILh8=; b=SnLZW1GDZHX+ZC9nPCiZPU+pZw
	mb7oX8d2BK6j9a05G3stAMKM8Z+8NjxmpMO0VYYJ32IwzhR4FdVAnCRwffOxiafmMsX8srQAGInL0
	UxaxRcswlOy9fc6elo2qUnrWDcEipmqsJV0PKc1sYqPjgGuTu+UxHd9hXkcV78e4p6WYXn2+/HdzJ
	atorNSWBnSbT68gTvlsPtFRBWeunaah6Xzd8FlU4VVNua3eKeLI7rfA8xj0Ou7F8NyUKMICEmw84h
	8TCnNkCiNk2rqG5ynlF92VPeF0oZkvZg0LgGbnA4XSlL0cUOcg6NzwDddVa0PMq+z5EEIyhTxaCot
	OWuMApFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY59o-00A4ey-0r; Tue, 13 Sep 2022 12:36:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY58U-00A3ij-Am
	for linux-mediatek@lists.infradead.org; Tue, 13 Sep 2022 12:35:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5603761471;
	Tue, 13 Sep 2022 12:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73CCC433D7;
	Tue, 13 Sep 2022 12:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663072528;
	bh=uHIBPhso38HQKEjnPuE3Q0bWh5FsM+Uxinj0JhYllyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nB7wHUPdjoC1IC5X4AqEub0UfBrlv+rwv+kvtlii6wiH4LJdtiC1ObJojV1NNqcHr
	 rzgfkRNxpR2angv+u6PykUQQhGk+GzxfwICyHUz5s6XSzPzmByMh8Rl/CodnEn76d2
	 VlB1ekO71fwdrGCxOw19Hu4w61wvvXQLNpOsGzvR3yWFGPjVKUZvYRToCd25PVev8a
	 MQUBzfrAT181SCeTP+6jSk1/Zz5vgod4FCjX8NuvlNH4VytQ3KVl0eiWaFD2Ky9OXU
	 Jncdl5d2xDOvtM+hGDNbB9lFdV60qDfx4RHuFzzBrtjBVXp/B9757huE80mQ3smcZ9
	 g9kMvHUYjZpqA==
Date: Tue, 13 Sep 2022 14:35:24 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com, evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 02/12] dt-bindings: net: mediatek: add WED
 binding for MT7986 eth driver
Message-ID: <YyB5DNIihzwdpfnP@lore-desk>
References: <cover.1662661555.git.lorenzo@kernel.org>
 <e8e2e1134fde632b7f6aaf9d96feab471385f84c.1662661555.git.lorenzo@kernel.org>
 <20220913121149.GB3397630-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="glOFOUKnXXIJKcRM"
Content-Disposition: inline
In-Reply-To: <20220913121149.GB3397630-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_053530_453692_0BC54242 
X-CRM114-Status: GOOD (  18.61  )
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


--glOFOUKnXXIJKcRM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Sep 08, 2022 at 09:33:36PM +0200, Lorenzo Bianconi wrote:
> > Document the binding for the Wireless Ethernet Dispatch core on the
> > MT7986 ethernet driver
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/net/mediatek,net.yaml | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/=
Documentation/devicetree/bindings/net/mediatek,net.yaml
> > index f5564ecddb62..0116f100ef19 100644
> > --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> > +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> > @@ -238,6 +238,15 @@ allOf:
> >            minItems: 2
> >            maxItems: 2
> > =20
> > +        mediatek,wed:
> > +          $ref: /schemas/types.yaml#/definitions/phandle-array
> > +          minItems: 2
> > +          maxItems: 2
> > +          items:
> > +            maxItems: 1
> > +          description:
> > +            List of phandles to wireless ethernet dispatch nodes.
>=20
> There's already a definition of this in the binding. Move it to the main=
=20
> section and put 'mediatek,wed: false' in if/then schemas for variants=20
> that don't have it.

ack, I will fix it in v2.

Regards,
Lorenzo

>=20
> Rob

--glOFOUKnXXIJKcRM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYyB5DAAKCRA6cBh0uS2t
rH5VAP9r5wu/WxhYFf8dIOlicHQDZN6wIFzX8X/7pBVxvvcwBQD+M8TRrQPqazjQ
ldlFUEfUuFbhyHyCrpeXw08o+DqluwA=
=Ef0Z
-----END PGP SIGNATURE-----

--glOFOUKnXXIJKcRM--

