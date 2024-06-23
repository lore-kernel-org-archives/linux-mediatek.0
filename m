Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE35C27C4F
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Jun 2024 09:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkArihAEJ4b4rR8xWKbFhl0UPZ8wwhhP00om3WZbZ0g=; b=OsuJmVGD86aEIU6c8dWlkZuyL3
	DzAupw+Wp44Nsl9i3GP3RgGZxaFbP5ZXRpMs6LuY+YE97+lUbHhVeD7dhtMQIkMlJOLx2/f3nq1b5
	Ur+A8I2ukRHAoFDjHK1m82V2F/3BPTiEPIZkKGsv2lX9CkYFaeXhHXllcDnpeYVgoyyIilatMQKSS
	nmC7mhKflSkinMjnS8kTXj9/nu4sW/AurgugCygG+U4olNWU/pKLrs73tpHmwn/FV01pCo+DcaNTA
	YFXthkXrHzmXSvm/Ds0Jj4AZNoMj7GmhYgvV9+t++qphWD0i8BOab34riCoaM8Z9m42PIkXd1RHNy
	7MwEz0Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLJZb-0000000DhoZ-1SXR;
	Sun, 23 Jun 2024 09:31:47 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLJZW-0000000DhmO-0Eo2;
	Sun, 23 Jun 2024 09:31:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4395ACE0025;
	Sun, 23 Jun 2024 09:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144BAC2BD10;
	Sun, 23 Jun 2024 09:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719135096;
	bh=mmkFqQCWNWhI9vMGLTThsVmNtKKLibTwrxANXk3fnLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gSk0Jcf0ZmSdEdzC9y2jzm4UfWnBwEVmUJA1s9qbCCGCpaHX62uNp9LcAN1Empo3w
	 2h3Zy6S1Fvv4OJftNEBmG7kvQb1OmcIiyJDNi874ISwu0rmLhtQnY3CzME0TY9ik8p
	 wMZpwejzkWvDCxsATVljcrKzaoyg44Z3cP67EV596U4en/Vxt/caop8qMiH4pwTPTx
	 XQ/1WJgzokRw0FnqecQwAutSwfmCNGSlz+cBq9pF82vNAEqBrokcwXG+tGRNGMSBLY
	 g54QTHtZf3xRBNT+o+cLOmUjbfRouMfu6bACDgTV5zV5BrVH/Jq1dxFj45pexVELJq
	 gN6DV0kxmP5jw==
Date: Sun, 23 Jun 2024 11:31:32 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH 1/4] dt-bindings: PCI: mediatek-gen3: add support for
 Airoha EN7581
Message-ID: <ZnfrdF8Q7kRUudq1@lore-desk>
References: <cover.1718980864.git.lorenzo@kernel.org>
 <a215d6d8a91fccdbd1a28dd3262a3e5db1b728fd.1718980864.git.lorenzo@kernel.org>
 <20240622-ripple-skylight-cdf172afde61@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="74VzLLej2lJJYR4f"
Content-Disposition: inline
In-Reply-To: <20240622-ripple-skylight-cdf172afde61@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_023142_482903_4C042C3F 
X-CRM114-Status: GOOD (  17.59  )
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


--74VzLLej2lJJYR4f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, Jun 21, 2024 at 04:48:47PM +0200, Lorenzo Bianconi wrote:
> > Introduce Airoha EN7581 entry in mediatek-gen3 PCIe controller binding
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  .../bindings/pci/mediatek-pcie-gen3.yaml      | 25 +++++++++++++++----
> >  1 file changed, 20 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.y=
aml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> > index 76d742051f73..0f35cf49de63 100644
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
>=20
> You've now relaxed the clock requirements for all devices,
> and permitted an extra reset on the existing platforms. You'll need to
> add some per-device min/maxItems constraints to solve that.

ack, I will fix it in v2.

Regards,
Lorenzo

>=20
> Thanks,
> Conor.
>=20
>=20
> >      maxItems: 6
> > =20
> >    assigned-clocks:
> > @@ -186,6 +187,20 @@ allOf:
> >              - const: tl_26m
> >              - const: peri_26m
> >              - const: top_133m
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: airoha,en7581-pcie
> > +    then:
> > +      properties:
> > +        clock-names:
> > +          items:
> > +            - const: sys_ck
> > +        reset-names:
> > +          items:
> > +            - const: phy-lane0
> > +            - const: phy-lane1
> > +            - const: phy-lane2
> > =20
> >  unevaluatedProperties: false
> > =20
> > --=20
> > 2.45.2
> >=20
> >=20



--74VzLLej2lJJYR4f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZnfrdAAKCRA6cBh0uS2t
rOkIAQCVSXTV3xENYTEyf+1j+ekpZaKsAp4R8xyTSgF2apueWAEA4MkUFvZFd35T
MsWFBfAu26UqJSHFbAHsudq/K+3O0gI=
=W1o1
-----END PGP SIGNATURE-----

--74VzLLej2lJJYR4f--

