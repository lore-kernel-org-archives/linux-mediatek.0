Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F97C00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 15:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ClQ1DO3UiPrdKLxuJsTHgAG36WHRBvhmejTgGyCXtOU=; b=AitE1CdFUYgnx4mF/COr2BPz2u
	9sy+Fi4z3MGc8amYEK7To831RAIvgDDHWRcATFmGStAZMqxrLU8rC4gpm6grMsbU1Titt18RpyK3u
	Acd1QXoim6RUsFVIo+39hgdrnKsdbh2kAzDuggukzr+omwXAqXfKYdTU3KixYO/OIUUEwjOuT8SlY
	5tlL6cq2kp7L1d54nNCOUD1BGc5BdHui9aDRb6HV2rlFdVy6Pd6Z+jDLGaeIZyA5E/OFrR6haxJIb
	J+15ksHIT+bGoG7pFX7pvMG7Fzg8+sAHqHsXK1pyZA9aUU/SDm/MzMVAQwQ+7GYEC3rsFgVRBMb0q
	JcdvorYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJ6N-00ADz8-2H;
	Tue, 24 Oct 2023 15:13:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJ6K-00ADxP-1X;
	Tue, 24 Oct 2023 15:13:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 85C5DCE2D49;
	Tue, 24 Oct 2023 15:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A970C433C7;
	Tue, 24 Oct 2023 15:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698160425;
	bh=kz+EcQENOMM9JFxNzp/7U0xgoKM7XMrQN9wRluSh3nI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fgQwQxCpxGgu/+NEqBmzfVjiFRkfueXgyxvkR2B+iJe7BZ5X2cBCVjS6FL4ZY+eQH
	 4xXflAg4lZWHjtq2e3w3E5EK+lqlGD/NtU2+HU8CC0Lb6wmW6DwwdMgxEfyMxqu7gB
	 RICHchKMs5I2qyPPqp/H930fnNaknkhAQ0q2jTdckm/tFQRkjcLrR1/SC97LuUIwAa
	 4OYG4ZW0SVXhsuo1A6LB7wo6zG/ZkWivtobA5e9SC7TXWDMP8HbGSTK8lwsJo5zqCj
	 vCaRdWsSEhHc4xZSdMGAc7RNUmC90ti+IzB5NBAFsuUlIXhfdg920uZuObs6ZNvY2v
	 uMT7xk6rpU9Fg==
Date: Tue, 24 Oct 2023 16:13:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH 5/6] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-pico
Message-ID: <20231024-relearn-engraver-59da32127a9f@spud>
References: <20231024000724.57714-1-hsinyi@chromium.org>
 <20231024000724.57714-6-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6erb5bK3QgxEzTmd"
Content-Disposition: inline
In-Reply-To: <20231024000724.57714-6-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_081348_685134_199AA0A6 
X-CRM114-Status: GOOD (  14.41  )
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


--6erb5bK3QgxEzTmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 05:02:28PM -0700, Hsin-Yi Wang wrote:
> Add pico (sku1) and pico6 (sku2).
>=20
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index b131e0bdbf01..6bb1d80dd4eb 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -262,6 +262,13 @@ properties:
>            - const: google,makomo-rev5-sku1
>            - const: google,makomo
>            - const: mediatek,mt8183
> +      - description: Google Pico (Acer Chromebook Spin 311)
> +        items:
> +          - enum:
> +              - google,pico-sku1
> +              - google,pico-sku2
> +          - const: google,pico
> +          - const: mediatek,mt8183
>        - description: Google Willow (Acer Chromebook 311 C722/C722T)
>          items:
>            - enum:
> --=20
> 2.42.0.758.gaed0368e0e-goog
>=20
>=20

--6erb5bK3QgxEzTmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTffJAAKCRB4tDGHoIJi
0ptJAP938TCZbnBe2uIS4gmeLyq8QdFXbFTndMGiYpUQWmmqwAD+MkL42LN819op
G2JkDkUW5pEkttfORsYdu/+hHyZktA4=
=Heqq
-----END PGP SIGNATURE-----

--6erb5bK3QgxEzTmd--

