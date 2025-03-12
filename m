Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3861C28B28
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Mar 2025 08:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjiAms4tJEmTpdhww6LzcgeS5u//vEM4UfBWeG44v48=; b=WFYzg2h/8EFGQg1O6fnrWW2ATY
	0sxObLpZGlRFEqPtoOShoPLEyqWDk8KBxhy6zslXMPfvG/NV7ldachEDLLY1FRdUElRoAJS6YDIJl
	as7+RWbVz0Iw12mVLufiFCcEv5izCMG6PZWOThjDeniL11wo70Aq9RpM0rLrqFpGmJlg+SDoIlmJ3
	bVM2Xu1y5W3C09e+/TSewi+jkTSKz72eH5MYjjcMG2Es6f+Bj7zKB/OCflRFwDLQUBFtllVofWlPI
	hL0TyDAxQnkBMVpTa60j2uuRNEvxptW7lk7pnfxLlxxMYEKn9lr5MYSF6RLnIqvCGcgHaBInnKHFL
	ugOaag/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsHTk-00000007pql-45HG;
	Wed, 12 Mar 2025 08:30:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsHSJ-00000007ph1-1YFD
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Mar 2025 08:28:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA6F55C48FF;
	Wed, 12 Mar 2025 08:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07F6C4CEE3;
	Wed, 12 Mar 2025 08:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741768126;
	bh=/V6VN9hiNJE0Pb3fRkMlElXGmJOzB9q4YyeZw9aMy6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f42uPoTwlrz8LTab9lmksBP8A/im1Tzh77vlcDn2na4re4i1CkmuI+IBZcf19xjf+
	 WQBYqH+SXZPzeoKa690YPVlFbErul6HMbiA8rqEBDfZb2XqBOx0mqJZZ8B3yJeBX2u
	 5YEGGH3+3brpfHeiRA6loef1fw62jPGCTHPCUVHNz206hXFD+x5dkJaXghet12SoEz
	 U1nsCfmIYZTk8N2EI5UQEKqUkQH/ZaxiqKbfJZPS5Vg9YgLh1IFw5tE2ccPlvjLAIq
	 7GKO1MSBiLcuiEBfU/tAe9fcxRUv8sItbenaVuXmEh53tfc4yNDzlp04qv+BBtuTGO
	 f+lRSHCACTvEg==
Date: Wed, 12 Mar 2025 09:28:43 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: soc: airoha: Add the pbus-csr node for
 EN7581 SoC
Message-ID: <Z9FFu9DlAdonbOeC@lore-desk>
References: <20250311-en7581-pbus_csr-binding-v2-1-1fc5b5e482e3@kernel.org>
 <20250312081117.GJ8350@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KCPVwl5RS58A8bfe"
Content-Disposition: inline
In-Reply-To: <20250312081117.GJ8350@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_012847_492484_F299306D 
X-CRM114-Status: GOOD (  16.27  )
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


--KCPVwl5RS58A8bfe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> dt-bindings: mfd: syscon: Add the pbus-csr node for Airoha EN7581 SoC

ack, this is a leftover from v1. I will fix it in v3.

Regards,
Lorenzo

>=20
> > Introduce pbus-csr document bindings in syscon.yaml for EN7581 SoC.
> > The airoha pbus-csr block provides a configuration interface for the PB=
US
> > controller used to detect if a given address is accessible on PCIe
> > controller.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> > Changes in v2:
> > - Move EN7581 pbus-csr binding in syscon.yaml
> > - Link to v1: https://lore.kernel.org/r/20250308-en7581-pbus_csr-bindin=
g-v1-1-999bdc0e0e74@kernel.org
> > ---
> >  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Docume=
ntation/devicetree/bindings/mfd/syscon.yaml
> > index 4d67ff26d445050cab2ca2fd8b49f734a93b8766..7639350e7ede40c8934f41f=
854ff219354fb3e5b 100644
> > --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> > @@ -27,6 +27,7 @@ select:
> >      compatible:
> >        contains:
> >          enum:
> > +          - airoha,en7581-pbus-csr
> >            - al,alpine-sysfabric-service
> >            - allwinner,sun8i-a83t-system-controller
> >            - allwinner,sun8i-h3-system-controller
> > @@ -126,6 +127,7 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > +          - airoha,en7581-pbus-csr
> >            - al,alpine-sysfabric-service
> >            - allwinner,sun8i-a83t-system-controller
> >            - allwinner,sun8i-h3-system-controller
> >=20
> > ---
> > base-commit: d71fc910c58ed85a2ad5143502030bff73fc2088
> > change-id: 20250308-en7581-pbus_csr-binding-974e1b40fb36
> >=20
> > Best regards,
> > --=20
> > Lorenzo Bianconi <lorenzo@kernel.org>
> >=20
>=20
> --=20
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

--KCPVwl5RS58A8bfe
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ9FFuwAKCRA6cBh0uS2t
rNLjAP9kWmIslDzWiifcSRt/tCjw8MyHIlsBk7LZcPCPHhA8zQD9G9Tj0lZtTehd
7rMBOTrvKOq6sLriO3Bmeq7M9CoTrAg=
=e28a
-----END PGP SIGNATURE-----

--KCPVwl5RS58A8bfe--

