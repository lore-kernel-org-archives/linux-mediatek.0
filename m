Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90E3C4725D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 16:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pp+Jb1fP38NYQtT00NVwKynJsliIjnE48NTbOrHAsg4=; b=fAeiOZMq0ywonmUXArsTLd2xBC
	CBaja+OVznjllDxGpAXdLcMgjhabTurbbNkDXF+uBpFIxS9iiJbTKw4RPn6Wwp2HW6HhvdMACa1x4
	jTs/4dvMdUgsudDPSe1iag7d20P94Pi5S308EzhDn/Pm/f1OGVAWp9w5n6nfpKJ3Cj0aJL8PlrMg6
	f0VKA7X9qyjzKFaSqZIfWFwSM1boWy/IidN2Fh2KcavRxekLfPrVn7lKxjmuMQNi49dU5aqExhTxm
	pMFruNiqy9UeKa3qW9jyNJBvlLbQI8EWoJzMVYNimj43cZ/C5afzZMZ2SIaSdiQObefA+ffWQFI4X
	CrIzo4iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQrnU-0067x9-2q;
	Fri, 19 Jan 2024 16:32:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQrnR-0067wM-1q;
	Fri, 19 Jan 2024 16:32:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id EA1ABB803F2;
	Fri, 19 Jan 2024 16:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47119C433C7;
	Fri, 19 Jan 2024 16:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705681963;
	bh=Uyi+TQxKZEL1bmpstEqg5Fp2tSvzVnztn39cu+KNpTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gwNaC6E6Cwo4i9yG9KcL+67C4UHTf8i7iJ8C0KnIHDMYWmRhaRc8kGrPgwnoHaQ3m
	 qoMU8FXzdXnmyVpEs9vIPr1bTtk/NXSzoZvPB06jMm0dBJ7UJ58Hc3eZbmNJ7jCu/P
	 vRo+l6JjPbmG3JEwYHfEH+nV35saGfHcllxorLDiuCoBoWP4lZ+otMvV8OGYXZ8mu4
	 VDpTK2ccBqS27gqC4hZUAOWhH988jlQnWbVirQQBj7+lKfNEdtxiGU4r2EmMgAMU4H
	 CrsmCk6rMRfPr5XVSqMZf1+66Gd4gP7Oz+bVU5qEZX4XVGdQy9qT+ysr1yLS2y3FQ+
	 xOp3qXwSYiidQ==
Date: Fri, 19 Jan 2024 16:32:37 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, linux@roeck-us.net,
	heikki.krogerus@linux.intel.com, cy_huang@richtek.com,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: mt6360-tcpc: Drop
 interrupt-names
Message-ID: <20240119-eldest-discharge-e2d3812be0a9@spud>
References: <20240119094105.98312-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ToI4F3JwM2kTOdm/"
Content-Disposition: inline
In-Reply-To: <20240119094105.98312-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_083245_764892_1C311F6B 
X-CRM114-Status: GOOD (  16.43  )
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


--ToI4F3JwM2kTOdm/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 10:41:04AM +0100, AngeloGioacchino Del Regno wrote:
> This IP has only one interrupt, hence interrupt-names is not necessary
> to have.
> Since there is no user yet, simply remove interrupt-names.

I'm a bit confused chief. Patch 2 in this series removes a user of this
property from a driver, so can you explain how this statement is true?

Maybe I need to drink a few cans of Monster and revisit this patchset?

Thanks,
Conor.

> ---
>  .../devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml        | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.y=
aml b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
> index 053264e60583..339bc9c00ac0 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
> @@ -22,10 +22,6 @@ properties:
>    interrupts:
>      maxItems: 1
> =20
> -  interrupt-names:
> -    items:
> -      - const: PD_IRQB
> -
>    connector:
>      type: object
>      $ref: ../connector/usb-connector.yaml#
> @@ -58,7 +54,6 @@ examples:
>          tcpc {
>            compatible =3D "mediatek,mt6360-tcpc";
>            interrupts-extended =3D <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
> -          interrupt-names =3D "PD_IRQB";
> =20
>            connector {
>              compatible =3D "usb-c-connector";
> --=20
> 2.43.0
>=20

--ToI4F3JwM2kTOdm/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaqkJQAKCRB4tDGHoIJi
0re0AP9LNbikp4X8ttFLgxTITUwV8RZsxGtpIStRXArzEiJQtwD+JNTZjIHT5i09
CSekQiT3QUgqZzXuCTtm+oiY2IL76Ak=
=mjGn
-----END PGP SIGNATURE-----

--ToI4F3JwM2kTOdm/--

