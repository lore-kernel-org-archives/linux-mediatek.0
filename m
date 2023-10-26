Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABEAC25B67
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 14:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLr/7QctoCV9/TcoBr8A4nLcSVgyecyYACgt5mDQff0=; b=ChYHBIkmoZ3fUaAcIThF8XWzg4
	7FPBT3RDHzpToec45f6ej0uJ0QgIWShDCp+rcimEBWsUXpIrkIavHmUd8lAKyQigOcDd13Ou3nomq
	8mlQwDm1jMJ5JAS8pq0HM9w4+Tw1FylMt4YRHffRW9Cl4CVEoBE3X8XEneg5Kznt/5EYs8onrONoK
	PC8IKbviIyB/auJBimS1S3Uc1dNgS8FJYGoqJB3R0e18CFU2j0GCL4fHBb5JP/MIj4Ryd3JKtzor3
	uxzJB6McpPJutO/eSlXctCgxAKvrJdiP4NiEW8quWMZ3yna0WwthYcvBt1hlfVpzlyFGfGTPTKu48
	RnNG0CjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1Pn-00Eh9t-2X;
	Thu, 26 Oct 2023 14:32:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1Pg-00Eh6D-2d;
	Thu, 26 Oct 2023 14:32:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E1D7CCE3E11;
	Thu, 26 Oct 2023 14:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 639AAC433C8;
	Thu, 26 Oct 2023 14:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698330762;
	bh=la2sdiSTispFY+4HPux+4oDSduULbv+AF7/FuOI7xbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EY04TEBYA8PRSw4Eamm0phM3Jxw8mDC1ZlanMbqJlsEkV0Q6w2aVv0cXbs9/km+4Z
	 +HGo9KaK9Mbv0sIERcukmDadDda8I1lMxycQgRXDzpkRGJJjOCC/8XJc0MJQpycpHD
	 xLL80r0pLeqmQu89w/ScIsaVF6jVZifmEAyHxnqCVY9HvVpJBle4P8MotkRZkh7YnN
	 Fv9JNdA6MLWveMS6xOpCO/KCaj8FGIsNLDgDev13j4hHaL7ThPkYuuJ3lgJ4LtWbD5
	 rV2p/+fnmlxdniJ1dEgKjSubCqcHUMPZpGGBicODDn6f5A8epRV3W2rCnxVR0HBWLx
	 oitHzxRd0JX/g==
Date: Thu, 26 Oct 2023 15:32:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/7] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-katsu
Message-ID: <20231026-afford-suitor-18b4f0eea371@spud>
References: <20231025215517.1388735-1-hsinyi@chromium.org>
 <20231025215517.1388735-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xhWZzE7Zdu2mfZah"
Content-Disposition: inline
In-Reply-To: <20231025215517.1388735-3-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_073245_023629_CFF0B99A 
X-CRM114-Status: GOOD (  15.23  )
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


--xhWZzE7Zdu2mfZah
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

For your subject, drop the "dts: ", that as this is a patch for a
dt-binding, not a devicetree source file.

On Wed, Oct 25, 2023 at 02:48:44PM -0700, Hsin-Yi Wang wrote:
> Add katsu sku32 and sku38 which uses different audio codec.
>=20
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index a5999b3afc35..4fe58cfe6f1b 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -235,6 +235,13 @@ properties:
>          items:
>            - const: google,kappa
>            - const: mediatek,mt8183
> +      - description: Google Katsu (ASUS Chromebook Detachable CZ1)
> +        items:
> +          - enum:
> +              - google,katsu-sku32
> +              - google,katsu-sku38
> +          - const: google,katsu
> +          - const: mediatek,mt8183

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>        - description: Google Kodama (Lenovo 10e Chromebook Tablet)
>          items:
>            - enum:
> --=20
> 2.42.0.758.gaed0368e0e-goog
>=20

--xhWZzE7Zdu2mfZah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTp4hAAKCRB4tDGHoIJi
0gCAAQDE1tc7reAgagQx6S0aLYjNsM/zxnvnjgoqFHY1D/3mVwD+NU8+R7xn8F0V
7bAmx7CUZpdLqiUJ8RpMAUiU5+uPswE=
=tke3
-----END PGP SIGNATURE-----

--xhWZzE7Zdu2mfZah--

