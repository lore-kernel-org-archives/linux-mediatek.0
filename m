Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33218C54FD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 14:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWWS0Tt0CqDuAycilbDzCsznyX6QyIJantfjqvxLy80=; b=WhFJUZ/+vXh8QRH1beBXFRfl39
	8c6SX/z5EyWi176DtB9Aam962P0YE3ntZxIChohTQNKW9+Rxc1aI6FCqn2CjgIwKiJ9GRKscT4SlW
	wFmyj1Irtgr205eGZMlNOeiSKNrgvgzywfuqxmQZdFQ6i3te3wGGyyIwPXIpfLnUR3gsO8+tghoup
	ODIfoFbZW9BRACtlrYZfpJws7Xn6jeGICCxdK8QQuSu4ZKIKmSMYF8OS8Sbt6567C08fKjOXvm/H3
	ozuZLCuErRQXEJVanEslfgIlSRYzqL1fu11XTmREK+t/LbRoTeYoa/id8rw+RbPXy+JDWJMf5s3cU
	xiQYrAqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3H64-0013OY-1V;
	Wed, 15 Nov 2023 14:42:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3H62-0013NH-1f
	for linux-mediatek@bombadil.infradead.org;
	Wed, 15 Nov 2023 14:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fWWS0Tt0CqDuAycilbDzCsznyX6QyIJantfjqvxLy80=; b=FpqUgGYjigONftI7QzMlIJuWPw
	36a6kop8MRRfuuT2iR58l5npPDFPfBPvj9yDISbXet8Oqn6aB/Ce5uC9ZEsEtrNH/yvVzO5rnysnT
	AZWAZLtPvW5LiJB6Us/HvkULRm2ksEUNAkc6qgeYJvvCSChNn7unAt9MgFqdb+08JrFlcADBeZ3/b
	Ifm8ZNR8Nip8aQ7EhXGDpJ9BfmpzHWfhhKTahdnnj1OO3d/2ofDytsEizZVQjRQyqnPssJ3JVg2fg
	DwuxdMaMPW96adb2b7v4ktK53oWTok+B73dlH97U26YMsQVCfxO3dqhqHuyU0Ph4iEFhtbYfoERSn
	bvuFg9mQ==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3H5y-0045He-1w
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 14:42:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9E9A5CE1DC0;
	Wed, 15 Nov 2023 14:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C35C433C9;
	Wed, 15 Nov 2023 14:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700059335;
	bh=/VnhW6XNAlYbmraAXUOBLMr1ny5iRNfsObxNKJlK2PM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cfnklic2zj6BLXDMDv5AHq11ZtFjt6/Y4W3IXz3fhfAyvXj/Cyr6LQ7XKQ6BqhV42
	 QnbLjD4Fo+QNU3qurTgV/2JhzKISXC/eaUZb3ZameW1sC+VgCweeXblVr4KZO9WzPq
	 nh8z2U5b6W2a8zCYCMVK3iYdqV813Du8dgC35b/AoPtLxFuAzUAA2fxER3Q/VDg0o4
	 C3IBNvhYj3JZwnsEtuU8jVF+MaJzw3a+CRi+VhcaT2jBYKl/emWQZNtjm9ncFR8wb1
	 bCCfDXmQK0vZFd6BW3YFXoU9oZgLvwK6Yo6Fbx+OH1FGAM/VxskLK93lpZAlQ8rdrF
	 7Rp6YLtlk7pfQ==
Date: Wed, 15 Nov 2023 14:42:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com, perex@perex.cz,
	allen-kh.cheng@mediatek.com, kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 1/3] ASoC: dt-bindings: mt8188-mt6359: add es8326
 support
Message-ID: <20231115-amount-unashamed-ba70aa85b6a9@squawk>
References: <20231115090903.578438-1-zhourui@huaqin.corp-partner.google.com>
 <20231115090903.578438-2-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q1LKci4Ma36W9hfw"
Content-Disposition: inline
In-Reply-To: <20231115090903.578438-2-zhourui@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_144222_954489_D8241856 
X-CRM114-Status: GOOD (  13.03  )
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


--q1LKci4Ma36W9hfw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 05:09:01PM +0800, Rui Zhou wrote:
> Add compatible string "mediatek,mt8188-es8326" to support new board
> with es8326 codec.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Please pick up =E3=81=B1cks from previous submissions:
https://lore.kernel.org/all/20231108-handmade-cadmium-97ff07964b02@spud/

Cheers,
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

--q1LKci4Ma36W9hfw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVTYvwAKCRB4tDGHoIJi
0utUAP9yU8NM6xdQfcRRp17w+Sf3IPjMeqQeliXk2oT/VoqF9gD8CrphaoCuTs39
/rOAA0Rl1hqA1krQauB6VANmeuAEgQo=
=FyXQ
-----END PGP SIGNATURE-----

--q1LKci4Ma36W9hfw--

