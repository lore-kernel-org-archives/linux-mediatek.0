Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DE9C48BEB
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 19:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjyaAdr0RWDRi17pb5az9zJvvQa3IZRo8sIgePHLAAg=; b=u0yiEBxiNOC6GkVfKQ23pRRIl7
	c4rAIzgu9KjxFA9OyKXMNBs3YVTzQf08pPPPsNoLmXjSshun72lyDIHN/b50oh0GG/Wv2wdzRCMlZ
	bzpADqpckaJW9DC6+cBy2t8B5r3kOGhSIgb1IOynLGL/I8lXDVtM91PQmAaZMUplKa5E4RglNszRs
	y9RFYwoxhzyIf7ffD1Bvg1Qa9bdWTDb7htwARFalPI/tbLagBOnqlfIP91kgpQw+ixNTOLSog1Y2H
	ICgMtVcY2EW3Xcp69c0I1UpzrgTygG72BjMTQBtQB2lhuyLzgsbZ8xIwAgIsxmjJPdShyMb0UxJax
	IoVWJ1aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcrsQ-00000002D3p-0MtB;
	Wed, 21 Feb 2024 19:03:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcrrw-00000002CyW-1n56;
	Wed, 21 Feb 2024 19:03:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 14006CE1F7A;
	Wed, 21 Feb 2024 19:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD80AC433C7;
	Wed, 21 Feb 2024 19:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708542164;
	bh=Kq56kAG03QGNn+CX3JoT3D4J50nG3wBXsto8joaj6nA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W0GKN4uzj/+puIOtsCFZuLrHJTzQ0jyTBfwk23twnDP9l6LLMEt0g1HJpcz5Ai13s
	 t383J/cZ8fQM4ntz6Paz/Y4EnD4j6RbyqnBi4/jPnaH6Be6iBJjFW+kf5sDZxNVADn
	 7GUyC44M1Bl6GDGo2v2DVoAtmZAU9BdV9kg76H92SrbM2UPqIto0x6H3WWFU5NvA4h
	 fpY5G95mIX/QimLAWQsW9N8Mg+Cjb2vJV2S1kPMT69H++A4UofxxstphFuUdF6zrL7
	 H2ibVLF8FqygO9iv3+9rHdmGhdyAO59ZTdXuTmhNj2/ihmv44lWrzbX9tG0TzLdccq
	 a77NM5l6jjb/Q==
Date: Wed, 21 Feb 2024 19:02:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm64: mediatek: add Kontron
 3.5"-SBC-i1200
Message-ID: <20240221-trance-handheld-59c5066aeca6@spud>
References: <20240221155905.1217340-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vjJZp3HexdVYJTnL"
Content-Disposition: inline
In-Reply-To: <20240221155905.1217340-1-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_110300_813238_4BE1612F 
X-CRM114-Status: GOOD (  16.30  )
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


--vjJZp3HexdVYJTnL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 04:59:04PM +0100, Michael Walle wrote:
> Add the compatible string for the Kontron 3.5"-SBC-i1200 single board
> computer.
>=20
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
> v3:
>  - drop description and add to mt8395 existing entry
>=20
> v2:
>  - convert enum to const as there is only one specific board
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 09f9ffd3ff7b..29ebe1f9c1d2 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -353,6 +353,7 @@ properties:
>            - const: mediatek,mt8365
>        - items:
>            - enum:
> +              - kontron,3-5-sbc-i1200
>                - mediatek,mt8395-evk
>                - radxa,nio-12l
>            - const: mediatek,mt8395
> --=20
> 2.39.2
>=20

--vjJZp3HexdVYJTnL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdZIzgAKCRB4tDGHoIJi
0hdYAPsEFG/2oLEhg2asBC0ZJ9IOZ+gngGyXIlvYt2JvKSi4xgEA+D+t9lQSCW7p
Fgg/S4QdArJbqce3ktlR/KlQUrx6SAw=
=8mZJ
-----END PGP SIGNATURE-----

--vjJZp3HexdVYJTnL--

