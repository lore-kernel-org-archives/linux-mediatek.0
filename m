Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF197C47258
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 17:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GX3RUS2CtN/HWMrPf2RyagoHHbVWTxXEs9A540DL8FA=; b=EgKpKpfnSihitaHDym/V5qEXpU
	ZLR3PZqUuh5NsAFrUQVXTznmMTfpAnj9bj49w2tt3+RURE0uSLhyZRBvQzdbWxPmtC5+qaiCk370T
	02hHWsIKFVB9QYZpvSdMCVXT8tiXua9jUPtAWLtTCzc9f+p3k7i2D6oVzANGnlWXUiACPibAuhqkD
	EG6bSabOxwaBl+EPxOwK5I342UKiGHcAGTr1C2jr8r75/8YP7v6MRTzBDyQtHUV3i/zwdFmQpsamY
	YtGnqI6BP/gLIMIQggFN52rD33p3mx6D5G213XwzPfyXgje3zoc4LOiukIyIABBOe3XQdMl+yeie9
	5vuq37uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOKzN-003Ouq-17;
	Fri, 12 Jan 2024 17:06:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOKzJ-003Oqv-05;
	Fri, 12 Jan 2024 17:06:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 13D8FCE2439;
	Fri, 12 Jan 2024 17:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634CBC433F1;
	Fri, 12 Jan 2024 17:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705079190;
	bh=wZDnbh7n64HZXBziqJnarpVCrDn44XHiaryQeXzT4Jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O3lS3yPQkwbyA3T/nJ4LwyRW+9PissQShMQh5QL5f7Bmho0kWq2fc8EVIb/s7a0Ex
	 f8rQ7wGaVWQVZ429XPgXv2+6eH92Krk3nyrexdA2hE5qUmi3yJBj0vkSX2kAJu3zN5
	 eiRWTF7dz3mfOUIBAfUDNa1FzCy5xD40Y2tBFmKr91My270qB6kIFxv7gcjwsf++bS
	 l83+elWFcsEgiDwapOb4z15ZJDiEzlv4pgq2C4Az4DJ6DMV8EwKTzhjMgKL5M2Q1/m
	 2aon5a9GvA/fcN0f4uPmkNq2Io/7xwbtDpmKFCyIcO4XwZTBMnDBh06KGKyN9tcNt9
	 1pxMwcGs/NSSw==
Date: Fri, 12 Jan 2024 17:06:25 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, wenst@chromium.org, hsinyi@chromium.org,
	nfraprado@collabora.com, macpaul.lin@mediatek.com,
	sean.wang@mediatek.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH 01/15] dt-bindings: arm64: mediatek: Add MT8395 Radxa NIO
 12L board compatible
Message-ID: <20240112-scanning-contour-019b286021e6@spud>
References: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
 <20240112094632.66310-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="govvU38t0WtaM7t9"
Content-Disposition: inline
In-Reply-To: <20240112094632.66310-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_090633_240512_5F84153A 
X-CRM114-Status: GOOD (  13.36  )
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


--govvU38t0WtaM7t9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 10:46:18AM +0100, AngeloGioacchino Del Regno wrote:
> Add a board compatible for the Radxa NIO 12L, based on the MediaTek
> MT8395 SoC.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 5d49c7af50e5..cc37c88d8d4a 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -345,6 +345,7 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt8395-evk
> +              - radxa,nio-12l
>            - const: mediatek,mt8395
>            - const: mediatek,mt8195
>        - items:
> --=20
> 2.43.0
>=20

--govvU38t0WtaM7t9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaFxkQAKCRB4tDGHoIJi
0u2ZAQCrxxq3yuqhnnom8wr4ZvEFVZTjfwbrnntQ/oN+LUXvxQD9EornS9s9da5q
6K6qX/043jYEYDy4qbt94rd6ApvhXgA=
=yQm+
-----END PGP SIGNATURE-----

--govvU38t0WtaM7t9--

