Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BDAC2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 15:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPQRjytNBBwYGBjeWmOSFG2bAgUSNU/9ToSP8K2Foa8=; b=dYXRk5xRN+rCHJxkeXTQlggiRE
	QWKZbF8wqj2RHoVVA3tphLmJgRedCRmojYs+dZBqPGueSCYE3+4Vw9KLxZU+iCTX26GKqVJEPuXqh
	QlOLo+jKg1iPCwCzpxAFJyJfwGF/yArQGaul8v3UBaOpeIqv7VKlFPUNotABO7oh/wZBudEnwMOuX
	wkkn/LI+cQo/PMSlyT4250Q1Y9rHcttnIk/m/JgAZtdx3ubuy80H5ebonKqgOHFvpD/vipLhWQ0bw
	RibjqHM3Jl9mpb2FSBYfIgkaIrnVK6f8lgS+GR04kvgC3/gaqJE70A3gmR76N7o1uU9ZrYfRxA6em
	YGpCc+jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqxt-0000000AqnX-3gOb;
	Thu, 27 Jun 2024 15:23:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqxk-0000000AqkL-2fsC;
	Thu, 27 Jun 2024 15:23:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E4D91CE2FA9;
	Thu, 27 Jun 2024 15:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B128DC2BBFC;
	Thu, 27 Jun 2024 15:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719501782;
	bh=IMOuy42GDAFC2FD3yx7fGuAt6p6IPLwFyJf9jzkK88Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IM5S1reW0TiFzFDXONX/TmwOg4ODUf5HwPEUPmFoO1+CkUyq+nC8Mt2YGXbxBVpXK
	 2qWnLTo4MQKQPm0NEn8T4WIOtBB44c8xoyz9drfDflv3gqc7gZx3W5rhnZD8AOo1tU
	 2P5X9RnJTZeUllTa/jMHP0SO0hM5bX4HOo44JIL2S1Pim1zsxMjhQaYYCvJLSbtHCk
	 sZtKIgt2oHx6PVFrt6n69DbyVytRMhUGaiesUw9+pQQ4dR9TWO/BQIcYfetzvWER91
	 yK+x6vzBqxk+ECL6xOJD6slpY8t9OXbuDErUgWyaTqXlY6g4Wp6Hw9q/S9iE8naCrE
	 cp6GdX1GJuq7Q==
Date: Thu, 27 Jun 2024 16:22:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
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
Message-ID: <20240627-evergreen-oppressor-21deb5c83412@spud>
References: <cover.1719475568.git.lorenzo@kernel.org>
 <c11a40dbe3e1d1e4847ceee8715c1f670fd1887b.1719475568.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bIMezDrpTcKbQIo4"
Content-Disposition: inline
In-Reply-To: <c11a40dbe3e1d1e4847ceee8715c1f670fd1887b.1719475568.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_082305_125315_CC0CFC86 
X-CRM114-Status: GOOD (  14.67  )
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


--bIMezDrpTcKbQIo4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 10:12:11AM +0200, Lorenzo Bianconi wrote:
> Introduce Airoha EN7581 entry in mediatek-gen3 PCIe controller binding
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 68 +++++++++++++++++--
>  1 file changed, 63 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yam=
l b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 76d742051f73..59112adc9ba1 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -53,6 +53,7 @@ properties:
>                - mediatek,mt8195-pcie
>            - const: mediatek,mt8192-pcie
>        - const: mediatek,mt8192-pcie
> +      - const: airoha,en7581-pcie
> =20
>    reg:
>      maxItems: 1
> @@ -76,20 +77,20 @@ properties:
> =20
>    resets:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
> =20
>    reset-names:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
>      items:
> -      enum: [ phy, mac ]
> +      enum: [ phy, mac, phy-lane0, phy-lane1, phy-lane2 ]
> =20
>    clocks:
> -    minItems: 4
> +    minItems: 1
>      maxItems: 6
> =20
>    clock-names:
> -    minItems: 4
> +    minItems: 1
>      maxItems: 6
> =20
>    assigned-clocks:
> @@ -147,6 +148,9 @@ allOf:
>            const: mediatek,mt8192-pcie
>      then:
>        properties:
> +        clocks:
> +          maxItems: 6
> +
>          clock-names:
>            items:
>              - const: pl_250m
> @@ -155,6 +159,15 @@ allOf:
>              - const: tl_32k
>              - const: peri_26m
>              - const: top_133m
> +
> +        resets:
> +          minItems: 1
> +          maxItems: 2
> +
> +        reset-names:
> +          minItems: 1
> +          maxItems: 2
> +
>    - if:
>        properties:
>          compatible:
> @@ -164,6 +177,9 @@ allOf:
>                - mediatek,mt8195-pcie
>      then:
>        properties:
> +        clocks:
> +          maxItems: 6

How come this is maxItems and not minItems? The max is always 6, before
and after your patch.

Cheers,
Conor.

--bIMezDrpTcKbQIo4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn2D0AAKCRB4tDGHoIJi
0oPFAP9SiYTTYpY6A5LoY15O+RsQ0xC2rbZfeH+2l8EZPQptfwEAwy1aHN1FUMTj
Yzkp8qaOA+8BKhOvmX4DGsHmGPLurgo=
=wYS7
-----END PGP SIGNATURE-----

--bIMezDrpTcKbQIo4--

