Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7B9C531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 07:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUU5RcEXjAmJ2/SyjDJhoIwk9S9Pp0S6+hdCM7CDcsQ=; b=Sj4N+bXJspcRxfx4wt6q70nPVt
	/rkIYbhAX72rGDRcyjfBdiCjBagTPuZN1EPD/9d0xX+0bsrj9jcBEAd4layi2TfZo6y+5T/Fr6Y5r
	KH7peax7mJb1Oq1SRwxsKWsLECC6Fa2/GHLoKEWgbEgV1TiOKz5cQjz+fJ5NMP0xDWoSl5+2X0iGz
	yrQnWOpTKT35EGsAxZyVCq31blCupa9UK0XOSQm6aww/89zryTEEgwONJ7YCwPw0u4dWxCGFGvaoH
	z0nmxftWi5F49pBJi/Y7TJWpByW0qkd4UUvGsuuTQexLIUBNNMcT3/NTtd5TzS5SnZ8Qtw/AAmDwL
	EXZefIww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woG2u-00000002BCO-2j6I;
	Mon, 27 Jul 2026 07:46:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woG2u-00000002BCG-0k8n
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 07:46:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 37DEF601ED;
	Mon, 27 Jul 2026 07:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A551F00ACA;
	Mon, 27 Jul 2026 07:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785138402;
	bh=nUU5RcEXjAmJ2/SyjDJhoIwk9S9Pp0S6+hdCM7CDcsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bia0mR1itz5OxQYNG/0tIN1+vnJ8dT5R1XybBLEohUY4mySxZBaOQuXbuFcbX7n0H
	 8Uxw3+F3ucdsa4KIfWrPI0bSgN1e41jkJAQoNJitdl7ckfNutncydKX+iniNG8mqW0
	 N90Jbsd2hV7m0NS9OmxJniK7/zgRLm83icok2U9Bcfsv6UOJSY9p9PQ+5pd6J23N/F
	 KavmAMMXfjcYQcBt/9hDYgcSm9xV5Gxca9lHk1YlCNV7+dAc4YzWCDmuw2VKKUl5CM
	 Gb9zFAOxxKt4G70C23wrlkOv/siAs5XehfFWfZSUTiLPICbJyS//QaxD+LNl2DlnA5
	 0OrnT+hmleGHw==
Date: Mon, 27 Jul 2026 09:46:40 +0200
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
Subject: Re: [PATCH v7 01/34] dt-bindings: pinctrl: airoha: en7581: fix
 misprint in i2s function name
Message-ID: <amcM4L8LMu0UID_g@lore-desk>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-2-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="29sDINoIy+yZrchw"
Content-Disposition: inline
In-Reply-To: <20260727074234.3761170-2-mikhail.kshevetskiy@iopsys.eu>
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

--29sDINoIy+yZrchw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> i2s pin-function is missed, instead i2c pin-function defined twice. The
> second of them operates with i2s pin-group.
>=20
> The patch fixes the misprint. It also match actual pinctrl driver.

I guess you shold add a Fixes tag here.

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
> index 21fd4f1ba78b0..0c5a7eb6d563e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
> @@ -166,7 +166,7 @@ patternProperties:
>            - if:
>                properties:
>                  function:
> -                  const: i2c
> +                  const: i2s
>              then:
>                properties:
>                  groups:
> --=20
> 2.53.0
>=20

--29sDINoIy+yZrchw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCamcM4AAKCRA6cBh0uS2t
rAfwAQC73qPOnX7i6PBGFXOyWks8gimPvWJJzpH3mzTDrU9SxgD+LnV3B4lgdjRj
PzTRLyyWvRM69ourXgmlWbSawvX1Dgo=
=r+k4
-----END PGP SIGNATURE-----

--29sDINoIy+yZrchw--

