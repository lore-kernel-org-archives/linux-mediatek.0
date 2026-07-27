Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC15EC53219
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 07:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPyKb7BFsQjo4SS+XShKcyqwwsD2KQ/27NhoHTUy7eA=; b=0Wpcfz4pZ3r8fhxzv+r/HQh/Ju
	sQJoMcNRjNcDU85P1xhOTBS6vxoOr7kcuWWc9yyLd+YeDHPSRMr6d902lx1Nk92ILdF9OkdClisvS
	FqJJs6DJ4XV/ilwa8IGn9ytOukV7Grdl0+s7xRGOtqa0zOSLrYzOMJH7lzcUYJJqHlfgcW4jgCc0m
	b+UOMYHTo303SrQRZnRnTVSRFQEG5ZfR1M9TfOEM4FVaFHlpSYxR60fiUQuO3mHVlD8MxGdBhU0vV
	kNNtr3qgTBDbPS8H2n9DzoKptrFGnXhzyTzueNHNDOwvU/6+JwxHlkcpSB1/DitBTIGRpbswUOxot
	L4Be+LYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woG3O-00000002BF2-32Pp;
	Mon, 27 Jul 2026 07:47:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woG3N-00000002BEt-1G0J
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 07:47:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B703641645;
	Mon, 27 Jul 2026 07:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CCED1F000E9;
	Mon, 27 Jul 2026 07:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785138432;
	bh=yPyKb7BFsQjo4SS+XShKcyqwwsD2KQ/27NhoHTUy7eA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MdwsFLT76HRon/wjSmQ9VlobV2YPXn86eDHf62h4wOlwTM0y9/1DGS7yZTMYJgC6k
	 CphyOlFHYW96+uRBLRgHaDfSx9+ouwWyGTVQe/vPo7BUR2hU4UUj8W4tDUTv51bykl
	 HSk6NnusiT4BvKxYOZkdc1QiArAQbPhlIO+4pC869USL0ciMo6UVJqFSASHNpzL3O8
	 ipsLNLh/xFUKGlZ9Qf7qPoHWzXEJfPyycX64sFIQSLS2jDhGPvYbKKVmr9Pgg0nMAA
	 ++3/We6U0EfPQe6GM9mDN34RJ6OTjEbcSuZ/6YfF8MxgK08fwEUd1i0QEHN+FX9DFg
	 l3OQxhV6d1czA==
Date: Mon, 27 Jul 2026 09:47:10 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v7 02/34] dt-bindings: pinctrl: airoha: en7581: fix pwm
 pin-groups
Message-ID: <amcM_m1-6Yryrlaw@lore-desk>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-3-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="68hmevubpc3NW3MB"
Content-Disposition: inline
In-Reply-To: <20260727074234.3761170-3-mikhail.kshevetskiy@iopsys.eu>
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

--68hmevubpc3NW3MB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> According to commit 08a5af468e613b ("pinctrl: airoha: fix pwm pin function
> for an7581 and an7583") there is no gpio47 pin-group, so device schema mu=
st
> be fixed.

same here, missing Fixes tag.

Regards,
Lorenzo

>=20
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.=
yaml
> index 0c5a7eb6d563e..12dd85b5b4105 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> @@ -208,7 +208,7 @@ patternProperties:
>                           gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
>                           gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
>                           gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
> -                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
> +                         gpio42, gpio43, gpio44, gpio45, gpio46]
>            - if:
>                properties:
>                  function:
> --=20
> 2.53.0
>=20

--68hmevubpc3NW3MB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamcM/gAKCRA6cBh0uS2t
rMYMAP9NbE0w4c3+D9LiCgsQAAjHepf9yd7vRp0bp/VwFb9DRQEAvS9IpGp7y6bB
tThVcEzcwcLpe8zNBsnv6g32z7Cv5g0=
=HFbe
-----END PGP SIGNATURE-----

--68hmevubpc3NW3MB--

