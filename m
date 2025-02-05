Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCA6C02196
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2025 20:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2E6EqCjJdTc9pXlLAPxEAvaCluiUsLvN+c2bM+BtDc=; b=BADaIePMMdFF6oz5YMOZY4a+44
	mQgTBhgKWUF7f8NgDNO/3gSwzL8eczcFnpPyZeRVdhkCi5nc6OR4pYCJYYL04pkan648NO1I7wvQD
	pwS+8PBN+YHDUSSW4kY3q6VrZ6UCl2ylagWDSVL10n1SPMAdBQK7wVT2PpMXDXtMOZ0NBjdVSYTx0
	PqEcjgDpkRv0KPpA5aQRpTWgw2kPWB2M27FazqDF5YGVmiA9sO6QmVsfQHRs+PECigDW17IK9fR0V
	+KRIM8H9517jMqCQT/w917xGP7qT2kEuBpgpAyKJ1JJ8TrTYByb/0kA9ZO6cosRkNRDgROBOWOYZG
	iJ8IDRuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfmR8-00000004awD-0437;
	Wed, 05 Feb 2025 20:55:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfmQ5-00000004aiP-23W3
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Feb 2025 20:54:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738788888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b2E6EqCjJdTc9pXlLAPxEAvaCluiUsLvN+c2bM+BtDc=;
	b=W/qPpydq4G6wkKcVdp9Szbm0PWP+pJ3ewA3QrHuV02wsHrog2/54PN2SVJoh3UDf8OINp/
	pM1zyfc60+dx2LhRxDPXfYjGNJSxhbCStbs1MyKvrSqzlHqZMsk8XjtJBqEdTozv1Vw/7g
	yrkUYSrc15ueYuNuFmgIIb6b87Fa378=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-J314pnftPTWwItiWnpU41g-1; Wed, 05 Feb 2025 15:54:46 -0500
X-MC-Unique: J314pnftPTWwItiWnpU41g-1
X-Mimecast-MFC-AGG-ID: J314pnftPTWwItiWnpU41g
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7bcf4d3c1c1so29483585a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Feb 2025 12:54:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738788886; x=1739393686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2E6EqCjJdTc9pXlLAPxEAvaCluiUsLvN+c2bM+BtDc=;
        b=v6N6LgXsIFbWsJkys0lLQEMAtTwIU5caHS1oFrNuTmtsPSoINuhs8xK3bBzEEqAbJU
         MSDd+ZwgtJWRb9KBkoo6fVoig1XJbgWDxUNT0nceptQohMiMPTqRjeuKqyuM+fkLPilL
         Piwpud1dlUhnbAn9hLELhKG48YZTz3hBEIC9sDHL6zOhu3lRTHqzsnCyTLWpDnHCe11S
         VsfhnN7zvrR00P5yGbhWWMLCXJSBJBfb1CY/rG6zn8M6I0IjRUtIgjPbzT+8Gz8FKwg8
         Ltpjeg2e3m5eyhjr7heohTj7MkVuTcKuONNkDxeBYCjZfKSHxWTz63tQ6ij8W4wWL8Pi
         +J6g==
X-Forwarded-Encrypted: i=1; AJvYcCXCD7B57IHETBx3ZpWwVoropG09laC1YwLxnzI2mSCY+NaEKCZJ6nNrvIVnSrP8NOSAfk2wMM6bUJetIIU0Iw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9lAU3bz5dGkQXg8lzeh9Mdj1SXL0Rh6tGkdoTjPjCSTnj3BZy
	Zt+azkzXXBU/rhzEX2jShqOzvxd1rUNMSVsK/DSM+xtM69phLd3SM8ITOHoFe7qUeScHWYh6gVF
	CMR9pzjYCBqBdyFTlbjy3JK7IULsTtSsqmR1P845eTxI38ktJL9VqFl22yt51DsWAJG3lWg==
X-Gm-Gg: ASbGnctHrNja2lvaCuuFabGNjp3dAd+v7nPCvszfrseCoh41/70imh0MdAS1qHZkymL
	6NOlY6HNfSeMBu+tQ6NZtwRJO6rJn0BpETXNu/hBAfS6+fbbN9b/zk+BeBPuvXUQS6pSSAbaSeD
	Txc67IOBQsy44KPn08h9c9RNi4dBssraKsfWE/i7iL6v3GPwSXDDleoC2oD1Z4wRpyhAMByq+Pz
	rbgB4x8E33mtcPQzChrRfyCBJzkydCSgnjrRGm6OW4uJJKMOh6fhZXoUltiEbpmgQa1KrOXB7W8
	wVVYiOXf7wY7Dr2X1OrLHL318PUiZrtiO/8VbSYLPjHn7N814U/L
X-Received: by 2002:a05:620a:480d:b0:7b6:ece3:827f with SMTP id af79cd13be357-7c039f98778mr611212085a.2.1738788885693;
        Wed, 05 Feb 2025 12:54:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqvgtKVpsc+rS7SVSnttPiL04IrBDNEZqrwmOlro+8yw3ItpHBVE54BhNmqAJuuXIVYJEoqg==
X-Received: by 2002:a05:620a:480d:b0:7b6:ece3:827f with SMTP id af79cd13be357-7c039f98778mr611209185a.2.1738788885351;
        Wed, 05 Feb 2025 12:54:45 -0800 (PST)
Received: from localhost (net-93-146-37-148.cust.vodafonedsl.it. [93.146.37.148])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90cbe0sm789268385a.102.2025.02.05.12.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:54:44 -0800 (PST)
Date: Wed, 5 Feb 2025 21:54:43 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next 09/13] dt-bindings: net: airoha: Add airoha,npu
 phandle property
Message-ID: <Z6PQEzvvCdDKQSnl@lore-desk>
References: <20250205-airoha-en7581-flowtable-offload-v1-0-d362cfa97b01@kernel.org>
 <20250205-airoha-en7581-flowtable-offload-v1-9-d362cfa97b01@kernel.org>
 <20250205-cleaver-evaluator-648c8f0b99bb@spud>
 <Z6O8-dUrLNmvnW1u@lore-desk>
 <20250205-disagree-motive-517efca2b90c@spud>
 <20250205-patronage-finisher-bbfbdb5b7dbc@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nVc7ncatnUQ3E5G5"
Content-Disposition: inline
In-Reply-To: <20250205-patronage-finisher-bbfbdb5b7dbc@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_125449_602046_0A018333 
X-CRM114-Status: GOOD (  34.50  )
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


--nVc7ncatnUQ3E5G5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, Feb 05, 2025 at 08:01:26PM +0000, Conor Dooley wrote:
> > On Wed, Feb 05, 2025 at 08:33:13PM +0100, Lorenzo Bianconi wrote:
> > > > On Wed, Feb 05, 2025 at 07:21:28PM +0100, Lorenzo Bianconi wrote:
> > > > > Introduce the airoha,npu property for the npu syscon node availab=
le on
> > > > > EN7581 SoC. The airoha Network Processor Unit (NPU) is used to of=
fload
> > > > > network traffic forwarded between Packet Switch Engine (PSE) port=
s.
> > > > >=20
> > > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml | 8=
 ++++++++
> > > > >  1 file changed, 8 insertions(+)
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-=
eth.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > > > > index c578637c5826db4bf470a4d01ac6f3133976ae1a..6388afff64e990a20=
230b0c4e58534aa61f984da 100644
> > > > > --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > > > > +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > > > > @@ -63,6 +63,12 @@ properties:
> > > > >    "#size-cells":
> > > > >      const: 0
> > > > > =20
> > > > > +  airoha,npu:
> > > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > > +    description:
> > > > > +      Phandle to the syscon node used to configure the NPU module
> > > > > +      used for traffic offloading.
> > > >=20
> > > > Why do you need a phandle for this, instead of a lookup by compatib=
le?
> > > > Do you have multiple instances of this ethernet controller on the
> > > > device, that each need to look up a different npu?
> > >=20
> > > actually not, but looking up via the compatible string has been naked=
 by
> > > Krzysztof on a different series [0].
> >=20
> > Hmm, I disagree with adding phandles that are not needed. I don't agree
> > that there's no reuse, if you can treat the phandle identically on a new
> > device, in all likelihood, that node should have a fallback to the
> > existing one.
>=20
> Also, where is the binding for this npu? It looks like a brand-new
> module that you're adding a driver for in this series and a phandle to
> the node for here but I see no binding for it.

The driver loads the NPU node just as syscon so I have not added the binding
for it to the series. I will add it in v2.

Regards,
Lorenzo

>=20
> >=20
> > That said, the bigger problem in what you link is the ABI break caused =
by
> > requiring the presence of a new node. I'd NAK that patch too.
> >=20
> > >=20
> > > Regards,
> > > Lorenzo
> > >=20
> > > [0] https://patchwork.kernel.org/project/linux-pci/patch/20250115-en7=
581-pcie-pbus-csr-v1-2-40d8fcb9360f@kernel.org/
> > >=20
> > > >=20
> > > > > +
> > > > >  patternProperties:
> > > > >    "^ethernet@[1-4]$":
> > > > >      type: object
> > > > > @@ -132,6 +138,8 @@ examples:
> > > > >                       <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
> > > > >                       <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> > > > > =20
> > > > > +        airoha,npu =3D <&npu>;
> > > > > +
> > > > >          #address-cells =3D <1>;
> > > > >          #size-cells =3D <0>;
> > > > > =20
> > > > >=20
> > > > > --=20
> > > > > 2.48.1
> > > > >=20
> > >=20
> > >=20
> >=20
> >=20
>=20
>=20



--nVc7ncatnUQ3E5G5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ6PQEwAKCRA6cBh0uS2t
rIFNAQDYK7XMZyacl2c7uItRM6rmAPpzk3U9AIBiEJn5pKJd0AEAl5e/LTt29oKb
lI44AdZkjYncKBrhc7jzCjrBpodudwo=
=GbHn
-----END PGP SIGNATURE-----

--nVc7ncatnUQ3E5G5--


