Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18034C25B67
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 14:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gesrP9LwaidB2bjVMJfdM6t7II1ZO/OrJEnx782Lhkc=; b=H/NwPA1VxqE6LGOEDr3eGREK4U
	TyM/38ZMI2UA+lOuG+VioUKChLNl0sWjBDAb2iHMNgfsoYv5LZQTAHkGDu2IBfwuPk149FqJYm2zq
	+FTbnYSxZfQvR1VkWBHGuasRqTHAvpqX3MBuSjwzYCuQQ4yiW5it82RHS4YQLnFCGXG92v83+ecgW
	k6Keh3fKA25ub/iWzIQxTD1WfIUEeQBPg5W5dX48zF1xJaxnGwf0iT4H05GdtaPwrTEdA2dNr76JV
	hd+jtzJ4DwLuZ+V5rLPaWRsahPe1mT0B+hJFnGuP4vlswej1qErfTOCvPX7cKS51j96BFJ9yvdCTI
	V+ru/Qjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1T7-00Ei8H-37;
	Thu, 26 Oct 2023 14:36:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1T5-00Ei6n-0O;
	Thu, 26 Oct 2023 14:36:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4D0B2CE4103;
	Thu, 26 Oct 2023 14:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B05C433C7;
	Thu, 26 Oct 2023 14:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698330971;
	bh=89LzKN6Bnc17ff5e7nVLwTuE1e8rmadHQKzhHCLg/LM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r6dAbNaZSa2xQ89swGgAbwC0Fv8jdHt3WGjPFr6K/sIsY6Afd1wqRN7qOPWl/7zE/
	 ikwc2eHG8J/wB3aAM9sR1iz7W4LqSGEAKlJKvMxBtcgZHtHGxFnn2bczpTUrkLVYwC
	 y+FiWNr3jhPCGANWS2MCg0o26pwF2YblHFREKw1uy5ubSgmF4Mx92byY/3c5pig6C0
	 09hw4oPMW7fouOIXJPxXlKJQ/zZzQ2YLFhLSG3bsDDBZCmAAp+GI2RZvOY6K9mnYPA
	 g78jWAM1oJBONrMI8o8NvFL9FX9vCHCaL9dAYJOneIl83eDemXSfugXCm1PCCP6IXC
	 zfhwGFxeM6qFg==
Date: Thu, 26 Oct 2023 15:36:05 +0100
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
Subject: Re: [PATCH v3 4/7] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-makomo
Message-ID: <20231026-probiotic-navigate-2d6701939741@spud>
References: <20231025215517.1388735-1-hsinyi@chromium.org>
 <20231025215517.1388735-5-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IgU6HCI/57T5ZEmJ"
Content-Disposition: inline
In-Reply-To: <20231025215517.1388735-5-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_073615_337440_D9ECC9D6 
X-CRM114-Status: GOOD (  15.68  )
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


--IgU6HCI/57T5ZEmJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 02:48:46PM -0700, Hsin-Yi Wang wrote:
> Add makomo sku0 and sku1 which uses different audio codec.
>=20
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v2->v3: remove rev since match on sku is sufficient.
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 4fe58cfe6f1b..54141b9bb714 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -251,6 +251,13 @@ properties:
>                - google,kodama-sku32
>            - const: google,kodama
>            - const: mediatek,mt8183
> +      - description: Google Makomo (Lenovo 100e Chromebook 2nd Gen MTK 2)
> +        items:
> +          - enum:

> +              - const: google,makomo-sku0
> +              - const: google,makomo-sku1

s/const: // to fix the error reported by the bot.
With that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +          - const: google,makomo
> +          - const: mediatek,mt8183
>        - description: Google Willow (Acer Chromebook 311 C722/C722T)
>          items:
>            - enum:
> --=20
> 2.42.0.758.gaed0368e0e-goog
>=20

--IgU6HCI/57T5ZEmJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTp5VQAKCRB4tDGHoIJi
0vy0AP9MouDUMj2v8vsHucyElvjB8nY6QMM7f8ytkg41iCUwlwEAnMriierZSMC5
TvFhNyExBXPu+Q+FfKi8WdlBZ5+D6QA=
=/KSD
-----END PGP SIGNATURE-----

--IgU6HCI/57T5ZEmJ--

