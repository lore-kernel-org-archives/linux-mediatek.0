Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B47EC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 11:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WDOHiFCoRCTBj0mCv5UMdjgUeKiWVa+i+zjwtTk5fU=; b=j2bt2YhrsS0mKOQ7A6fR0lmvCW
	kiFdix8DrG6a/Zi7xvXl9i9a7JkfEtezErRG3whAac6EFQjj0HgDIwaxfPsh3lU927iEW1JQ335AZ
	IpP0IHN6p6SQAWHWq4D8g7CM3DWNXFuA6SBVRxAas6h7e2DUyQ4fPqWiaN3bn2eNbrA6Vai7zYVj+
	Gx2VQqtseEcBCW4a/pqbKdqsbaeFeNWEtnCYVSEExtDCHRPT/tEvux2uLEsMm2+qUxcZZ9Q9o5ZJj
	fCP4ijQ4NXuLsqv5jOejzMzy0eXJWvQXHahMvbBOzs5TL7HrZss+Vg+Gwi5ca4zsftzr/v9ZZfgOR
	2CSM8OHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0hDe-003jeU-2r;
	Wed, 08 Nov 2023 11:59:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0hDZ-003jae-2L
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Nov 2023 11:59:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3DEAACE1082;
	Wed,  8 Nov 2023 11:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB844C433C7;
	Wed,  8 Nov 2023 11:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699444770;
	bh=Jzja2Mof+0lWXfDb3XZKXq4BgHFCEL/naHNS+9btNP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qN5lN1xKgL4IpT2EWusIzs8ZoTg1UcYPMiF+sRcSwvPSaqyeaUbC82Km/Ivo+Ns6B
	 SxNhhVj0mQCznMaxhqw2P8E8iDBqLNE1+kJcKww9ZhEPrTYUGmOwLleaczTAAyRS8d
	 26uVaoBaCu7Of66Il5I9EUsJgiDk0JTzCfiUdMjpgezJqBoz/UWyHq432xYzZaNmNv
	 kItVqnUd+iZMv9f1tK1y1c8295/Ej0IugQK4s7WI0Cu6hU2Oz+VGMXvDi5txNNpQWh
	 M7MtuY2fDW6dhOeWtmXXevTzpldTIsJEBmnaPPhww88aYNnTfJmJzxowRFFONAJ4vC
	 tFIm2O0NRGZSA==
Date: Wed, 8 Nov 2023 11:59:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com, perex@perex.cz,
	allen-kh.cheng@mediatek.com, kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/3] ASoC: dt-bindings: mt8188-mt6359: add es8326
 support
Message-ID: <20231108-handmade-cadmium-97ff07964b02@spud>
References: <20231108063804.592982-1-zhourui@huaqin.corp-partner.google.com>
 <20231108063804.592982-2-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ejeS/PQkh0Imy/GQ"
Content-Disposition: inline
In-Reply-To: <20231108063804.592982-2-zhourui@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_035933_959694_FD97344C 
X-CRM114-Status: GOOD (  13.06  )
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


--ejeS/PQkh0Imy/GQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2023 at 02:38:02PM +0800, Rui Zhou wrote:
> Add compatible string "mediatek,mt8188-es8326" to support new board
> with es8326 codec.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt63=
59.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.ya=
ml
> index 4c8c95057ef7..f94ad0715e32 100644
> --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> @@ -15,6 +15,7 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - mediatek,mt8188-es8326
>        - mediatek,mt8188-mt6359-evb
>        - mediatek,mt8188-nau8825
>        - mediatek,mt8188-rt5682s
> --=20
> 2.25.1
>=20

--ejeS/PQkh0Imy/GQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUt4HQAKCRB4tDGHoIJi
0tMzAPsHYjHmomKvHzqtYD1sWEE03FkRfLcrqfov3QX91OzexgEA3EVHfj94YdjM
3HOe9QqxmDEmXT0StDd11t60U+8yXQM=
=IDsU
-----END PGP SIGNATURE-----

--ejeS/PQkh0Imy/GQ--

