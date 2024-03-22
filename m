Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52257C54E71
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 17:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JczrCAwbLygIMWDobmQs9N93obIQnDWbtl9B4OzYeCM=; b=OVvR4RT8W0N6flbZ0Y0wFS0+Hn
	WYY+fiI5Xan/QT5m7+6KvnQW9rnY1AnTqVrcH4HBOXncdOhAR05+sa9bVBBL65hUUJiFyWI3OEH4c
	94XfnP5mhnBD/kMWdX0Klmfwykr87eqFM/ZseFXHznQBwcccWK6P3mZXt4cnh+sH81AZ6F33yLggX
	4h0VouqNA9korbKYuc9PPZrPLpmADI2Tdu3XubwSmODZyk0ctsLy3J8aWrkI95cYNe4//5D0sDL16
	+ckngIV1iyeXQC5IC0QsEiOBXg+gafNG1IVth9ADe0k8FD3QrTnDxBwUX+U5oAWKk2Vu1u3LLZM6S
	6IwhlhGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rniub-00000008Cdm-44kg;
	Fri, 22 Mar 2024 17:42:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rniuZ-00000008Ccj-0O6L;
	Fri, 22 Mar 2024 17:42:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B54C6135B;
	Fri, 22 Mar 2024 17:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D76C433C7;
	Fri, 22 Mar 2024 17:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711129353;
	bh=3kctBgA6lO8k+iTgwdlRZdF4LsZ7E3FLLcIygOl/PhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ej6Aeh3CoH8kLnzYgrIrHa5ws9MHyb+JqLdpLA+ALsczv8CRg8/W1qneRl9NPhV4G
	 Sb2kDLEfDcMLXH7JCyGchJOLx8n4d4TTwDAKVFZHhnsMglnxNPbOtWWgdUm031o4+k
	 8GEA50RUjoTQzt7mBz7lj47lE29RMH4TTimr1KYfjuB2SMSKMn8/vbFz0Vs0/9hPbE
	 EesxTpYwPk3Z8PdOezw5pySCQrINyRMTaFai4XymGi/99vf3AHBB7+N5Iqf7LmFQNC
	 gbwZ3YE3PI08ccSeltFvAEF8eGqIS6yyPKRNd+JkkhA/jGwyIYvGD6mE6R1NHkq3fy
	 mf0YaS+HrXt0Q==
Date: Fri, 22 Mar 2024 17:42:27 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, amergnat@baylibre.com,
	moudy.ho@mediatek.com, hverkuil-cisco@xs4all.nl,
	sebastian.fricke@collabora.com, u.kleine-koenig@pengutronix.de,
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 1/4] dt-bindings: soc: mediatek: Add support for MT8188
 VPPSYS
Message-ID: <20240322-lugged-tabloid-3d5a85dc58d0@spud>
References: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com>
 <20240322092845.381313-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RnulqveRO5MGLP2A"
Content-Disposition: inline
In-Reply-To: <20240322092845.381313-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_104235_199808_482A934C 
X-CRM114-Status: GOOD (  12.99  )
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


--RnulqveRO5MGLP2A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 10:28:42AM +0100, AngeloGioacchino Del Regno wrote:
> Add compatible for MT8188 VPP mutex.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

You should at least mention the difference between this any anything
else.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml         | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mute=
x.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> index ba2014a8725c..a10326a9683d 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> @@ -33,6 +33,7 @@ properties:
>        - mediatek,mt8186-disp-mutex
>        - mediatek,mt8186-mdp3-mutex
>        - mediatek,mt8188-disp-mutex
> +      - mediatek,mt8188-vpp-mutex
>        - mediatek,mt8192-disp-mutex
>        - mediatek,mt8195-disp-mutex
>        - mediatek,mt8195-vpp-mutex
> --=20
> 2.44.0
>=20

--RnulqveRO5MGLP2A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZf3DAwAKCRB4tDGHoIJi
0h/UAQCmi1zJDBqq/ELBeN+fgFnCvi/ZrBGGgS+TL6o5qCdBGgD/RNFzAN9Zq2LO
sIgPEEJHFQ88CwRPTus+5+JuaPXzLgQ=
=m4WI
-----END PGP SIGNATURE-----

--RnulqveRO5MGLP2A--

