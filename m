Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD2CC5321E
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 15:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtFjvgg+SrffOQ8cx3VsMVfhGFAWzrsVzMgAYKKw5zE=; b=s5gpXuCYtE/fO7xMFF2sVpEzwd
	SRYLiyVJ66MAbzNjbNuc4oEsErTC8nBVDnd0jFCsYHEhwqaRwNtJ/RD4tGMPVPRRlbm4oPvr+WbGw
	JalHpthYWLdVoGAYiJb3ZjjkDB3wWFo6YiCHz56lWwMXe1OODe2PezqUwP+cbOUl7L8nA0CAqrVD0
	YIq/Tm5ALomR0tplKOZ9rkVegUJfweCArHDht/p45TU1C7OcBgP/LBz/kj1aNxqUqOgIzt6jVUqLG
	uDR4qUrY1tnsxMz5ngR0aKEUDnDjaWRh9g+8Qn0JrMTYVY5KvbN5CSr8qIjNtzGhwqFq00ezJLRCD
	nOeIqJ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sic6r-00000007uXk-31vS;
	Mon, 26 Aug 2024 15:58:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sic62-00000007uNQ-2AfK;
	Mon, 26 Aug 2024 15:57:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 26098A41478;
	Mon, 26 Aug 2024 15:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF966C4FF57;
	Mon, 26 Aug 2024 15:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724687438;
	bh=ktxTLHI62m07O4aByHNtqdVU4NHYWDBoMv9Kczki3Rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r0de/vYF8OEWJOWzCY7dYubWPfWUHk5m6z1Z/5T2AqlxcRxn39H+cl2W+d9TSlRqT
	 V1Kt+welB3O3YMFUfE4Au9oon6Nlx40aZUi3skZF8XIZr/YiBRcq/Opoz0QM6xRk8h
	 N0HCiuhDBPzTWKadM/uUYZwV3SH3ejXLpKq7wFqqYfTxql28ALtynebpplP323aJkZ
	 znopSFVVGtjJgpO3q2VbkH0IXhY0v7jau3yv87nMGFZITaMC5LfEfheFQLS9y018aY
	 1w+VoxyjJDFtzMoK4qiFLIg81MmjB/ADouNjejhsAl0mY2Lt6oDafHRXr9IrBYQTCz
	 yo0yQ5W0PfH7A==
Date: Mon, 26 Aug 2024 16:50:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Sen Chu <sen.chu@mediatek.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH] dt-bindings: mfd: mediatek,mt6357: Fixup reference to
 pwrap node
Message-ID: <20240826-slurp-earphone-0d5173923ae8@spud>
References: <20240826065415.19641-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="50OsiPZgodBAcn76"
Content-Disposition: inline
In-Reply-To: <20240826065415.19641-1-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_085734_691608_F5F8E775 
X-CRM114-Status: GOOD (  23.29  )
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


--50OsiPZgodBAcn76
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 02:54:15PM +0800, Macpaul Lin wrote:
> The mt6357 is a subnode of pwrap node. Previously, the documentation
> only included a note in the description of mt6357. This change adds the
> appropriate $ref for pwrap to ensure clarity and correctness.

I think this change is wrong and the existing binding is fine.
Adding the ref overcomplicates the binding completely, and stating that
this is a child node of another device is sufficient.

Instead, if anything, the pwrap binding should have a ref to /this/
binding.

Thanks,
Conor.

>=20
>   $ref: /schemas/soc/mediatek/mediatek,pwrap.yaml
>=20
> Additionally, the indentation for the pmic section has been adjusted
> to match the corresponding structure.
>=20
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../bindings/mfd/mediatek,mt6357.yaml         | 124 +++++++++---------
>  1 file changed, 65 insertions(+), 59 deletions(-)
>=20
> Changes for v1:
>  - This patch has been made based on linux-next/master branch.
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b=
/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
> index b67fbe0..5f4f540 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
> @@ -22,69 +22,75 @@ description: |
> =20
>    It is interfaced to host controller using SPI interface by a proprieta=
ry hardware
>    called PMIC wrapper or pwrap. This MFD is a child device of pwrap.
> -  See the following for pwrap node definitions:
> -  Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> =20
>  properties:
> -  compatible:
> -    const: mediatek,mt6357
> -
> -  interrupts:
> -    maxItems: 1
> -
> -  interrupt-controller: true
> -
> -  "#interrupt-cells":
> -    const: 2
> -
> -  mediatek,hp-pull-down:
> -    description:
> -      Earphone driver positive output stage short to
> -      the audio reference ground.
> -    type: boolean
> -
> -  mediatek,micbias0-microvolt:
> -    description: Selects MIC Bias 0 output voltage.
> -    enum: [1700000, 1800000, 1900000, 2000000,
> -           2100000, 2500000, 2600000, 2700000]
> -    default: 1700000
> -
> -  mediatek,micbias1-microvolt:
> -    description: Selects MIC Bias 1 output voltage.
> -    enum: [1700000, 1800000, 1900000, 2000000,
> -           2100000, 2500000, 2600000, 2700000]
> -    default: 1700000
> -
> -  regulators:
> -    type: object
> -    $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml
> -    unevaluatedProperties: false
> -    description:
> -      List of MT6357 BUCKs and LDOs regulators.
> -
> -  rtc:
> +  pwrap:
>      type: object
> -    $ref: /schemas/rtc/rtc.yaml#
> -    unevaluatedProperties: false
> -    description:
> -      MT6357 Real Time Clock.
> +    $ref: /schemas/soc/mediatek/mediatek,pwrap.yaml
>      properties:
> -      compatible:
> -        const: mediatek,mt6357-rtc
> -      start-year: true
> -    required:
> -      - compatible
> -
> -  keys:
> -    type: object
> -    $ref: /schemas/input/mediatek,pmic-keys.yaml
> -    unevaluatedProperties: false
> -    description:
> -      MT6357 power and home keys.
> -
> -required:
> -  - compatible
> -  - regulators
> +      pmic:
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          compatible:
> +            const: mediatek,mt6357
> +
> +          interrupts:
> +            maxItems: 1
> +
> +          interrupt-controller: true
> +
> +          "#interrupt-cells":
> +            const: 2
> +
> +          mediatek,hp-pull-down:
> +            description:
> +              Earphone driver positive output stage short to
> +              the audio reference ground.
> +            type: boolean
> +
> +          mediatek,micbias0-microvolt:
> +            description: Selects MIC Bias 0 output voltage.
> +            enum: [1700000, 1800000, 1900000, 2000000,
> +                   2100000, 2500000, 2600000, 2700000]
> +            default: 1700000
> +
> +          mediatek,micbias1-microvolt:
> +            description: Selects MIC Bias 1 output voltage.
> +            enum: [1700000, 1800000, 1900000, 2000000,
> +                   2100000, 2500000, 2600000, 2700000]
> +            default: 1700000
> +
> +          regulators:
> +            type: object
> +            $ref: /schemas/regulator/mediatek,mt6357-regulator.yaml
> +            unevaluatedProperties: false
> +            description:
> +              List of MT6357 BUCKs and LDOs regulators.
> +
> +          rtc:
> +            type: object
> +            $ref: /schemas/rtc/rtc.yaml#
> +            unevaluatedProperties: false
> +            description:
> +              MT6357 Real Time Clock.
> +            properties:
> +              compatible:
> +                const: mediatek,mt6357-rtc
> +              start-year: true
> +            required:
> +              - compatible
> +
> +          keys:
> +            type: object
> +            $ref: /schemas/input/mediatek,pmic-keys.yaml
> +            unevaluatedProperties: false
> +            description:
> +              MT6357 power and home keys.
> +
> +        required:
> +          - compatible
> +          - regulators
> =20
>  additionalProperties: false
> =20
> --=20
> 2.45.2
>=20
>=20

--50OsiPZgodBAcn76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsykSAAKCRB4tDGHoIJi
0gYAAQCGfMBFaDP6ivfMJJBwfUboQER1rC8YTMNL4nNMsiTnyQD/baclX5aCHVJi
8ubJmmeyqBJRPWK/Nw5vmepd5ePRKwg=
=JZUq
-----END PGP SIGNATURE-----

--50OsiPZgodBAcn76--

