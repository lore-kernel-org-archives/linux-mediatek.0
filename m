Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BA7C00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 15:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWuMi9uaraW19oTw8SYEtM1Zmrk36lvXg75o9bIvnjQ=; b=ShYISmpjh6m3Id47fS19J3yqxO
	jLSEin7fuVbwtLfnEM5WzSJeU94ewcSZbfBR3oGAmdhuAhIVesWhY95s5kDo2vso1qyUvd/mH4ggg
	zQUpFRgRVj4qDndYGKsXCqwsOmf4YAwBf8Y/rHU8J7iOPKmAhLmTQQ67ZsoFexu5vdKHj/w9o5k9M
	oCV5GG+rZReM9E8id1ph9ZRcP3AlrB0LX4GApeI5RbMZ5BYeJ5Ak7ZmxUyIf5pPBMwi5pkPIl9k7T
	MYrhx9VAAMtvGteDVi7pBb1k8dTH4e1HnoxZOqkYsTdhYHeRvHM+LLYUb7gq4mQZrviXM+rri67zN
	PlHlgJEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJ7w-00AETi-2p;
	Tue, 24 Oct 2023 15:15:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJ7s-00AEOm-2q;
	Tue, 24 Oct 2023 15:15:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DEF36CE1A9D;
	Tue, 24 Oct 2023 15:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34918C433C8;
	Tue, 24 Oct 2023 15:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698160522;
	bh=u5iInjVkFqq6twQIGSCee/Oz/tW7nBGer/lK20D31Xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XftoKzKT+DVIsn5Nm/xOuJzt8/Qkfa9WmbjGoB5V/+5y1TdPa7yfNXrrrUrW5eURv
	 wQ+OhD2YnANDzgsnjDbGI/99Gw11uoXTQrMeXAQqg6ryM6YAlUYnlPSt/ouxJoUaJj
	 YtRNyNlcoQGvTmPJwFRgThCZW6vB0Pp+aQ4C2Bn1oP7Qg132F4b8Xr96dfCtW2vQQc
	 4BNAYIWJUgq8LeBqzfnjztGsvHS6fAnZnYbz81dxPiTXC6dYRf1SpcFOfqERyb/WBa
	 bXYYS0pwFfYlMbgl/mkCN34aShWq1YQvJcsRNj7Jt9a1TgwB4+Mhdp0WDrLe5KtAZR
	 xKV2kU/+G8Khw==
Date: Tue, 24 Oct 2023 16:15:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH 1/6] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-katsu
Message-ID: <20231024-reenact-wildfowl-de6575bbe6f6@spud>
References: <20231024000724.57714-1-hsinyi@chromium.org>
 <20231024000724.57714-2-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IXfQT/WBQHW6S1aX"
Content-Disposition: inline
In-Reply-To: <20231024000724.57714-2-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_081525_095262_953F9A7D 
X-CRM114-Status: GOOD (  15.78  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>, =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--IXfQT/WBQHW6S1aX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 05:02:24PM -0700, Hsin-Yi Wang wrote:
> Add katsu and katsu sku38 which uses different audio codec.
>=20
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index a5999b3afc35..fe8c488a3207 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -235,6 +235,12 @@ properties:
>          items:
>            - const: google,kappa
>            - const: mediatek,mt8183
> +      - description: Google Katsu (ASUS Chromebook Detachable CZ1)
> +        items:
> +          - enum:
> +              - google,katsu
> +              - google,katsu-sku38

This seems a little odd - does the non sku38 not have an sku of its own?

> +          - const: mediatek,mt8183
>        - description: Google Kodama (Lenovo 10e Chromebook Tablet)
>          items:
>            - enum:
> --=20
> 2.42.0.758.gaed0368e0e-goog
>=20

--IXfQT/WBQHW6S1aX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTffhAAKCRB4tDGHoIJi
0iYxAQCeo78+GzbLQpTjP3HNRYuhl6l/m0VHJ1VoN5LPcGxlrgEAtbghA9EB30g5
XFskjU5z+WJ6EBfh7yse/wqNH8YRPgk=
=0wSh
-----END PGP SIGNATURE-----

--IXfQT/WBQHW6S1aX--

