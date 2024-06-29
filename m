Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BB4C27C4F
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jun 2024 11:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEHhQG4CZ7kGvtT4MNJ8Y5bMvLuehhjza07LeVLqolY=; b=lO6gb+PWm7EC04LUK7R8VgGS5B
	yB/QjeguHZPPr47Vw24rnmH4yCt4liU2ju22ouwDE+hUhbGKf+JtD8+LNcTLH9z3+m8P2DtP/6GQj
	7dhoBJjjnQ4U1sv59TqYKj8d8ZZF4hZAWO2q6DjcacurGfwbRCCeKdOX3H6yIyDVsr9BdfQICqC2i
	cFxwCOtl4SggX7GsSW2VrNrHHwsDFTRYO1X1CXK2LaC2MOVqlLdsZpDUX3vSak0R7O1vYp5cAEmT/
	MYwS41Bxd2LVl/4RBScXI8DO3o1Ctj5l+EPvrv7TyDRgj1avlHuzdQHEM7JJ40ryKmu21NfuW7hWg
	qLJB+1Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNW4f-0000000GJHE-106h;
	Sat, 29 Jun 2024 11:16:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNW4T-0000000GJEr-0b5f;
	Sat, 29 Jun 2024 11:16:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 710E760203;
	Sat, 29 Jun 2024 11:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5014C2BBFC;
	Sat, 29 Jun 2024 11:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719659803;
	bh=IUthPw6q8Xxh7m+uFZiIAUjqhMqeAyzsdGSzigmphv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tq9RP4v3wOheZaeTkMoREvNu74nxkxyN2vHE1lEVOpqP5CAzyYguiOXp9hFL3AmLy
	 eVFZTVEfhULQydrQ1CAxQOd3S51HwZY7FmDWpZy7EGea4s8EEtg8mFAZWNCsDIAkd/
	 l6t4YxeJQkx9+B2R1Z8TtlbsBv3QikJmATPdBl7/vJPsFXNi95ZoGMS8ucc2f6BhYP
	 FVhDNA1UeiXsNJYoi4OAgIM4Kk+RvxMo/a/0eNdNJtxT9e4VnF4q3lMGvzMCGIjmKb
	 32OOyKjubihQksVJW8rvmQpcp/+rVGtkrB/zyR2NY1/FgiJNDH71t/wDrhN9PKBJ0y
	 gS0SyFCAqeTzw==
Date: Sat, 29 Jun 2024 13:16:39 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v2 1/4] dt-bindings: PCI: mediatek-gen3: add support for
 Airoha EN7581
Message-ID: <Zn_tF4xNADB1Z2bE@lore-desk>
References: <cover.1719475568.git.lorenzo@kernel.org>
 <c11a40dbe3e1d1e4847ceee8715c1f670fd1887b.1719475568.git.lorenzo@kernel.org>
 <20240627-evergreen-oppressor-21deb5c83412@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yc80wPPNW1Sai7R4"
Content-Disposition: inline
In-Reply-To: <20240627-evergreen-oppressor-21deb5c83412@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_041646_580909_6052802F 
X-CRM114-Status: GOOD (  16.48  )
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


--Yc80wPPNW1Sai7R4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, Jun 27, 2024 at 10:12:11AM +0200, Lorenzo Bianconi wrote:
> > Introduce Airoha EN7581 entry in mediatek-gen3 PCIe controller binding
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  .../bindings/pci/mediatek-pcie-gen3.yaml      | 68 +++++++++++++++++--
> >  1 file changed, 63 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.y=
aml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > index 76d742051f73..59112adc9ba1 100644
> > --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > @@ -53,6 +53,7 @@ properties:
> >                - mediatek,mt8195-pcie
> >            - const: mediatek,mt8192-pcie
> >        - const: mediatek,mt8192-pcie
> > +      - const: airoha,en7581-pcie
> > =20
> >    reg:
> >      maxItems: 1
> > @@ -76,20 +77,20 @@ properties:
> > =20
> >    resets:
> >      minItems: 1
> > -    maxItems: 2
> > +    maxItems: 3
> > =20
> >    reset-names:
> >      minItems: 1
> > -    maxItems: 2
> > +    maxItems: 3
> >      items:
> > -      enum: [ phy, mac ]
> > +      enum: [ phy, mac, phy-lane0, phy-lane1, phy-lane2 ]
> > =20
> >    clocks:
> > -    minItems: 4
> > +    minItems: 1
> >      maxItems: 6
> > =20
> >    clock-names:
> > -    minItems: 4
> > +    minItems: 1
> >      maxItems: 6
> > =20
> >    assigned-clocks:
> > @@ -147,6 +148,9 @@ allOf:
> >            const: mediatek,mt8192-pcie
> >      then:
> >        properties:
> > +        clocks:
> > +          maxItems: 6
> > +
> >          clock-names:
> >            items:
> >              - const: pl_250m
> > @@ -155,6 +159,15 @@ allOf:
> >              - const: tl_32k
> >              - const: peri_26m
> >              - const: top_133m
> > +
> > +        resets:
> > +          minItems: 1
> > +          maxItems: 2
> > +
> > +        reset-names:
> > +          minItems: 1
> > +          maxItems: 2
> > +
> >    - if:
> >        properties:
> >          compatible:
> > @@ -164,6 +177,9 @@ allOf:
> >                - mediatek,mt8195-pcie
> >      then:
> >        properties:
> > +        clocks:
> > +          maxItems: 6
>=20
> How come this is maxItems and not minItems? The max is always 6, before
> and after your patch.

ack, I will fix in v3

Regards,
Lorenzo

>=20
> Cheers,
> Conor.



--Yc80wPPNW1Sai7R4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZn/tFwAKCRA6cBh0uS2t
rPBkAPkByGAHSc9sSo+LyYsfPbigChxVRx3RRo8JU9/v060TNwD/UdFWihrwMXYc
d/pzY8RPKCX5ZnsPem0Fwg0h4BBQwwk=
=kx87
-----END PGP SIGNATURE-----

--Yc80wPPNW1Sai7R4--

