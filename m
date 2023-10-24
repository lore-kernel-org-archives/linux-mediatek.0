Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF32DC25B6C
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 15:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XN7yhYh8ziGkO6jzF/M6xStgOISLvb93ESpJmYsTRPU=; b=YEL23DP66PWDGtcn0BJBR/HUAx
	nJu0goDBCZl8u0DQGH13/rpPGlzQezke4M7CyXnReX/hcttencmU1JhxwZG5UmvrWwsMDZhL/gr03
	QfXoMNhvyTBSdrzmLXGWisbfi9kHJTtYTaldA0+HvJpfAKLSZ8fI/nYPqRL+xlt5QYxjRln7FWe+t
	lTZnqtHDsd4lcl0DuyFSL496OpoUNzMiMf2cj5TCxuEfwp+MFZcRECrEmWLR1uJvuQPZknLdqz2gM
	Lv1wr2H3LoqNtjxhmW+feOHPfZzmEyXI3deoNNzc2ciBzciucxDLzxhmushbtW7f5N01BMG5vFb58
	J2C8XmZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJAR-00AFtu-2z;
	Tue, 24 Oct 2023 15:18:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJ9n-00AFGG-1K;
	Tue, 24 Oct 2023 15:17:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D2AE9B826A4;
	Tue, 24 Oct 2023 15:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F636C433B7;
	Tue, 24 Oct 2023 15:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698160641;
	bh=iUIoeX8BN34NwWD9hBWLO7g5NpDyH+v6HeWwgzPOy1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=byMvMN9h5ae0wl3zjeJQma1pcFbfadVQvDGAkqoUOPfHHvmG4EL3v8oWEFwTPrtu6
	 +AiSAPhNwqFVuxcudaq65lC5m+kBTLfhYVVRMFT1EgjKkpI27KImRl9dvHcaMQ72TI
	 fiUN6V3RuxvVnpGFkL90fIYO+qplqiQPcNDi5U5r/04EmKypC/Z+pyYOYmqBJiRq4r
	 t4DWTSmLBVZOUB/uG4PVfT7kgLUu49q/khKuE9nJHLd7xxvDOKyce1WCcQoGjMrFa/
	 E3LYkFbzSbg+lol0f252T8LQACPfLnR12gkuy9Dyk1LuN3K1yWe+RA9/W/koStD9cN
	 9gjdGoMXQANcw==
Date: Tue, 24 Oct 2023 16:17:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH 3/6] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-makomo
Message-ID: <20231024-bobbed-although-06f341259ebb@spud>
References: <20231024000724.57714-1-hsinyi@chromium.org>
 <20231024000724.57714-4-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kghOtZTw0vsKrKkb"
Content-Disposition: inline
In-Reply-To: <20231024000724.57714-4-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_081723_811491_7F79DB51 
X-CRM114-Status: GOOD (  13.75  )
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


--kghOtZTw0vsKrKkb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 05:02:26PM -0700, Hsin-Yi Wang wrote:
> Add makomo sku0 and sku1 which uses different audio codec.
>=20
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index fe8c488a3207..b131e0bdbf01 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -250,6 +250,18 @@ properties:
>                - google,kodama-sku32
>            - const: google,kodama
>            - const: mediatek,mt8183
> +      - description: Google Makomo (Lenovo 100e Chromebook 2nd Gen MTK 2)
> +        items:
> +          - const: google,makomo-rev4-sku0
> +          - const: google,makomo-rev5-sku0

With these bindings, how does one describe a makomo-rev5-sku0?
What you have here is only suitable for describing the makomo-rev4-sku0.

Cheers,
Conor.

> +          - const: google,makomo
> +          - const: mediatek,mt8183
> +      - description: Google Makomo (Lenovo 100e Chromebook 2nd Gen MTK 2)
> +        items:
> +          - const: google,makomo-rev4-sku1
> +          - const: google,makomo-rev5-sku1
> +          - const: google,makomo
> +          - const: mediatek,mt8183
>        - description: Google Willow (Acer Chromebook 311 C722/C722T)
>          items:
>            - enum:
> --=20
> 2.42.0.758.gaed0368e0e-goog
>=20

--kghOtZTw0vsKrKkb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTff/AAKCRB4tDGHoIJi
0vryAP0SoSHM6UtxRF69U0/a77j0hR/fdNme03q3wM+4GTwriQEAq+HB9Lceez7W
imKIWRG7GVNAo27CEJYOSyZEkYP9egQ=
=fwLS
-----END PGP SIGNATURE-----

--kghOtZTw0vsKrKkb--

