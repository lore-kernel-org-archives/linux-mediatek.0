Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE7BC02196
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2025 20:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTbIzhwV3ZjAl5OwLbJohLrJDizqbdTCfNzNYP89Ar4=; b=3N1la9gW7MGL5uIT6b56noA1Dz
	xKku0zxaJFXVrWB4tC3gGnWpReJo9AK2msJgZjMDKYl1TZRiToDDyqbRWsIbIPRNQjSNZkKYj050V
	61EVuFo8O9mCFtz6gCH//Fp5fD6L77YUk1P41DniAmb9rN1/DgJNf23hb5A7VXK+Yr8jX8z3jIU13
	pUg2OO348LAXDEqX8YlG0xsTojRVrQK3GvgXh2PT06xpEiebcyeqTHuhbTKSZeVcZp0Wq/jAEZLSu
	jCx1JCNoYgNvTtZmoeh9mqln+fknYmtFE+zJUcyxRT4vLbri3aSaXcKG0VSoG/FGpc0M8+cRPaYmO
	0JBsO9Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfmPd-00000004aaO-0LNA;
	Wed, 05 Feb 2025 20:54:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfmPZ-00000004aa2-3xEJ
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Feb 2025 20:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738788856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XTbIzhwV3ZjAl5OwLbJohLrJDizqbdTCfNzNYP89Ar4=;
	b=fHmNQM1oyFFSySK2+/DYfXGugYKHEpzgMOuMdljQyM8hEY9ghzmzmS1qHWzeR10ON9nZVJ
	3BKfEZfqfIT7WIaVikz68ULhAucnV9QTnk5ASMVD4MwaDYXnBZgh+vohnAZIUsG5jWC6f0
	B3u8WzgSncn9GJJY4r21Xo8f22JN5fo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-TSgUgUyGMWiP-2geTtSCHA-1; Wed, 05 Feb 2025 15:52:17 -0500
X-MC-Unique: TSgUgUyGMWiP-2geTtSCHA-1
X-Mimecast-MFC-AGG-ID: TSgUgUyGMWiP-2geTtSCHA
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38639b4f19cso97345f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Feb 2025 12:52:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738788736; x=1739393536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTbIzhwV3ZjAl5OwLbJohLrJDizqbdTCfNzNYP89Ar4=;
        b=tN2ht1xjdVemSWII5stXBmcCjAyGVep8q3IhwkWoPMUWkh0XGOS/9D7l5iLLz3bhWq
         2W9HBmQkDFOvCIJ0/RH0hFq4QvfMDH6exyLTO18H84DgTn/kZKFpFmSCmhEZxslf0aAK
         xZDUYH2eWu3wjTZL+AHyqP3deO9/bGa6dNY4VdNlYejFoBFGUGSuBXwEftpRkHrf7o7b
         rmnThu/BvTwx/+1z8ustigg+GccBd5C5sbhfK71NTBxM2m9V8B5f+xUsqZ+q6zZlPcRU
         Au0G18JH4IHbDpIVqZ/75Xndzy3XsD0TUQu3GG1DuvYfVuQIGFlGypiYAWWO0l2KlX64
         f7Wg==
X-Forwarded-Encrypted: i=1; AJvYcCX/k6F8IoUfI7NMdMy0rQsNMXFbn8/E6alhinvkHDriGIItZItrcAgOXHeMG4YfhNW/sd/Dq3EsNr5BFJsnog==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrEbpsRP4p8R2swe1Earb+PjJ43r71kS+dQ4SN0hIWpaJRkMmK
	beGwEH7ks4NzGUXzrDLQnnUEay62RdxmuuoxaZa26JiH7NSAF4RffGjb5zZF3JduqmMqGNLIxuK
	qwaG5rKnIS2HH1SVP2voKJ+DkXyWZIW/ZCupr1p6q7S8iuBfks/4HaIBh6HKtoMEAHo0RgQ==
X-Gm-Gg: ASbGncsjXurStA5so7zDbtx8YC0VmoXZ9PtSmaYG+PgQE97rKjbsMD0b9QdGXyreFdh
	q8YyRNYv7ry+xZOq92Nav7mN9VgwgJ8ae+YqIOTPx+51dtJZdNBD8MG05MpO4MVmUJJxEHbO+vL
	aPtFUQM6EnFNF57JdpuKNmE1nTTrC0Xokmj23uS9fuBfr8xNR1ozJJw7YyjCUR8MPoOQmUd5BMC
	8Q5xpV7V3jNGDtipk6Tjbshzq4g9arbDvnqTHOZd28cyUy4R9NsVDyLJ7KRzlzB/w4KVDHcWRcz
	chukQke9TFFYNPzj9R8G3zAmKITihl0apihxX8BkXXPmlfWQuVnw
X-Received: by 2002:a5d:47cb:0:b0:38d:adcd:a083 with SMTP id ffacd0b85a97d-38db49004bamr3522253f8f.42.1738788736430;
        Wed, 05 Feb 2025 12:52:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFM8eo/awV4xrN7DNOWWlAj/RbtCWXcBZTqZRKq5/GMKRr+GILL69JKkMFHkF5J39xi9HCwvA==
X-Received: by 2002:a5d:47cb:0:b0:38d:adcd:a083 with SMTP id ffacd0b85a97d-38db49004bamr3522229f8f.42.1738788735924;
        Wed, 05 Feb 2025 12:52:15 -0800 (PST)
Received: from localhost (net-93-146-37-148.cust.vodafonedsl.it. [93.146.37.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102f7dsm20073668f8f.30.2025.02.05.12.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:52:15 -0800 (PST)
Date: Wed, 5 Feb 2025 21:52:14 +0100
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
Message-ID: <Z6PPfnYV57NmWV6N@lore-desk>
References: <20250205-airoha-en7581-flowtable-offload-v1-0-d362cfa97b01@kernel.org>
 <20250205-airoha-en7581-flowtable-offload-v1-9-d362cfa97b01@kernel.org>
 <20250205-cleaver-evaluator-648c8f0b99bb@spud>
 <Z6O8-dUrLNmvnW1u@lore-desk>
 <20250205-disagree-motive-517efca2b90c@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TdZwv0UXFrq47/Kl"
Content-Disposition: inline
In-Reply-To: <20250205-disagree-motive-517efca2b90c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_125418_104286_79CD5811 
X-CRM114-Status: GOOD (  28.49  )
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


--TdZwv0UXFrq47/Kl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, Feb 05, 2025 at 08:33:13PM +0100, Lorenzo Bianconi wrote:
> > > On Wed, Feb 05, 2025 at 07:21:28PM +0100, Lorenzo Bianconi wrote:
> > > > Introduce the airoha,npu property for the npu syscon node available=
 on
> > > > EN7581 SoC. The airoha Network Processor Unit (NPU) is used to offl=
oad
> > > > network traffic forwarded between Packet Switch Engine (PSE) ports.
> > > >=20
> > > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml | 8 +=
+++++++
> > > >  1 file changed, 8 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-et=
h.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > > > index c578637c5826db4bf470a4d01ac6f3133976ae1a..6388afff64e990a2023=
0b0c4e58534aa61f984da 100644
> > > > --- a/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > > > +++ b/Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
> > > > @@ -63,6 +63,12 @@ properties:
> > > >    "#size-cells":
> > > >      const: 0
> > > > =20
> > > > +  airoha,npu:
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > +    description:
> > > > +      Phandle to the syscon node used to configure the NPU module
> > > > +      used for traffic offloading.
> > >=20
> > > Why do you need a phandle for this, instead of a lookup by compatible?
> > > Do you have multiple instances of this ethernet controller on the
> > > device, that each need to look up a different npu?
> >=20
> > actually not, but looking up via the compatible string has been naked by
> > Krzysztof on a different series [0].
>=20
> Hmm, I disagree with adding phandles that are not needed. I don't agree
> that there's no reuse, if you can treat the phandle identically on a new
> device, in all likelihood, that node should have a fallback to the
> existing one.

honestly I do not have a strong opinion about it, I am fine both ways.

>=20
> That said, the bigger problem in what you link is the ABI break caused by
> requiring the presence of a new node. I'd NAK that patch too.

there is no PCIe support in dts for this device upstream yet, so I guess th=
ere
is no ABI break, right?

Regards,
Lorenzo

>=20
> >=20
> > Regards,
> > Lorenzo
> >=20
> > [0] https://patchwork.kernel.org/project/linux-pci/patch/20250115-en758=
1-pcie-pbus-csr-v1-2-40d8fcb9360f@kernel.org/
> >=20
> > >=20
> > > > +
> > > >  patternProperties:
> > > >    "^ethernet@[1-4]$":
> > > >      type: object
> > > > @@ -132,6 +138,8 @@ examples:
> > > >                       <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
> > > >                       <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> > > > =20
> > > > +        airoha,npu =3D <&npu>;
> > > > +
> > > >          #address-cells =3D <1>;
> > > >          #size-cells =3D <0>;
> > > > =20
> > > >=20
> > > > --=20
> > > > 2.48.1
> > > >=20
> >=20
> >=20
>=20
>=20



--TdZwv0UXFrq47/Kl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ6PPfgAKCRA6cBh0uS2t
rK1jAQCoE/zFHyySfuiJYIFTCuCPIfmrdKBiqfqc+4K/Y8PULQD/Wjs5AX8by6zR
MX1/3RRgW7eVpvl15xDcvLxNAoGm9w0=
=dcMi
-----END PGP SIGNATURE-----

--TdZwv0UXFrq47/Kl--


