Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64876CDB47E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Oct 2023 15:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGn3EdAmkk/eJLD0T01DAReNyRIW3mgYLaps7MvCEU8=; b=MyafeNyI5y5wocKU0q3hlQsY8P
	+cxDnGf+La+nV4RponMBgiQYsS2NHxOKAcHT8/yVjmdNQGQ49SVUzqgsEDZrUSmEPmiSt/fWxGeG0
	GQND9rnBJaDwRiYsV02qsu0JB2N+jKIWV3RBxjXUmHNGZN9oOM/gICuDMVpd87vimO2mPlAxCYY+e
	gnqcpybp6qLCQ+WFBkRiibTk6kHHLDA1KqR2VE6OtCbANbed0a+GYYMrTm0PKMEMmyEC9/uxflw12
	y0H1vWC4GXPyUdfTue+NVpjwJKKtP+PWYWYmdeOfwGlqbEgna+Sb8SS+odo0fw1cvz0EwAPQE1IV/
	dptY3B1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrJpy-003ecA-0X;
	Fri, 13 Oct 2023 15:12:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrJpu-003eau-2L;
	Fri, 13 Oct 2023 15:12:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 094AF6215E;
	Fri, 13 Oct 2023 15:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A706CC433C8;
	Fri, 13 Oct 2023 15:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697209941;
	bh=4E09wJEx+hUjRW7ZMgCIOg2Gy6RCgWzCpZcW8uW0hV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cEw1/nod0VWsOUN96f/HB/xl14XHvv7bs8HaaT9VgRUOIoCZr4Oa8kO+poHc9DIv1
	 /jto6hgFaVnMLq5MlmrXPgdoL9rahdni23v4TZElMiKN+RkaJaVtqclD0v9SfILjM+
	 bMlJtFdwtTOBZrUxWNkPsbSt64bj1Sv/8AuCsCX1wEI0AYD66b23bisvUxoJ2uP6S1
	 OOB5KT1DZ7koGouBAB8r0hvq0IOAawxcFxE1raczRRrel472KVzLjuw90HdRGA3eXr
	 eF1flLrayL6Mrw9vHsyw7N/Lp3KGwM3zOjSGZ4oXGoReV7SzCuZT5QOpgbHBvISlv5
	 hvpIyTL8eqDSA==
Date: Fri, 13 Oct 2023 16:12:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] dt-bindings: arm: mediatek: Add MT8186 Steelix
 Chromebook
Message-ID: <20231013-playoff-unsmooth-2d3c8b30790e@spud>
References: <20231012230237.2676469-1-wenst@chromium.org>
 <20231012230237.2676469-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HPmS7nFTK45JskTw"
Content-Disposition: inline
In-Reply-To: <20231012230237.2676469-4-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_081222_808897_1912434D 
X-CRM114-Status: GOOD (  15.07  )
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


--HPmS7nFTK45JskTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 07:02:29AM +0800, Chen-Yu Tsai wrote:
> Add an entry for the MT8186 based Steelix Chromebook, also known as the
> Lenovo 300e Yoga Chromebook Gen 4.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index aa7e6734b336..fafd5e18f640 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -206,6 +206,13 @@ properties:
>            - enum:
>                - mediatek,mt8183-pumpkin
>            - const: mediatek,mt8183
> +      - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
> +        items:
> +          - enum:
> +              - google,steelix-sku131072
> +              - google,steelix-sku131073

This one makes sense though, because both of the SKUs are in an enum.

> +          - const: google,steelix
> +          - const: mediatek,mt8186
>        - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM1402=
F)
>          items:
>            - const: google,tentacruel-sku262144
> --=20
> 2.42.0.655.g421f12c284-goog
>=20

--HPmS7nFTK45JskTw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSleUQAKCRB4tDGHoIJi
0v6CAQCmJE4kCmgE2JDh5U5bt3i9neQPQ4ZHWoVy6VSjohWS5AD/QfDDtg1Oc4Ft
FZpadGnpde7ftxx7TPCKzl7RQjgdOQw=
=ZIPt
-----END PGP SIGNATURE-----

--HPmS7nFTK45JskTw--

