Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F89C27C53
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jun 2024 12:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itYwXYuVpHu2JNdh8uWwif0TF6uwrSLkXnKRfxugyA0=; b=KameJHM0dPfrXSzGnRjssQVh9T
	ydEoRKh62fKiESQ8b4XikhEU9HifHAhLutsMhTOQKyKdJ6EsdkDb1X2+GH+kgjWUeGjzQ1eFya9Ru
	66YofXwiKf/3pYS/OJaDdBcLsvXQ3zE1dSujxiCLn8Y1NOZWuheDn41y07zjWK1eI3ClJg0Mhuz98
	yPinOZtcHk0T6GnNdkYugoLv72u2ZXOysOfSXvVrfGojkpHYIl5eX8rPlE0yKlSXPXGihabYxFBc7
	kbz/i69Q+0O2czXcxrQlGgWf2veZqmSoXjc/4kHMVdR/GLIgkxzaLRl/1PT7KCxYkwLGklJUFD+en
	RoI+u3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKzTZ-0000000C1dT-3s1F;
	Sat, 22 Jun 2024 12:04:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKzTU-0000000C1c8-3wXd;
	Sat, 22 Jun 2024 12:04:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E5FA260EF0;
	Sat, 22 Jun 2024 12:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D07C3277B;
	Sat, 22 Jun 2024 12:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719057847;
	bh=bndS5pMZkKTWWaUQd6hAfpSl8eZxrw6wZkum0MTaeg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hv6Wv2fUNb+mRwD586K29L49SfMozAN6jcGPY6fNbnvf9KrpTngTUeN91fgMaY8ee
	 jaQmxUmXf+pubmlllsiTdLw/bb5FgnFoIVkyVKKBI4MyBzVkbFam36FXzI8/fuAJWI
	 cYaS8L+Ag4EH1SQPvechTcU3X86sMS+jP57JdsWEfUI4MWDUdRb5u1uhGDcHOjOH4B
	 2c+rWITIwwEiBgZScvqpsUTZEMCR5BtKsCysSPAmaDx+1oc8G/R3Aw+vv7cs+h1VRi
	 AfQNsrNjIy+Rbvj7SFVLuXqi5e/fzDVSLAV6dHxGpp5pZzm89hn+GlO1zjlUEGOYcg
	 ElQ8tUbLklWbg==
Date: Sat, 22 Jun 2024 13:04:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH 1/4] dt-bindings: PCI: mediatek-gen3: add support for
 Airoha EN7581
Message-ID: <20240622-ripple-skylight-cdf172afde61@spud>
References: <cover.1718980864.git.lorenzo@kernel.org>
 <a215d6d8a91fccdbd1a28dd3262a3e5db1b728fd.1718980864.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Lh9pV1WQQOrM5d3z"
Content-Disposition: inline
In-Reply-To: <a215d6d8a91fccdbd1a28dd3262a3e5db1b728fd.1718980864.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_050409_088990_171C9FBF 
X-CRM114-Status: GOOD (  14.71  )
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


--Lh9pV1WQQOrM5d3z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 04:48:47PM +0200, Lorenzo Bianconi wrote:
> Introduce Airoha EN7581 entry in mediatek-gen3 PCIe controller binding
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 25 +++++++++++++++----
>  1 file changed, 20 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yam=
l b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 76d742051f73..0f35cf49de63 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -53,6 +53,7 @@ properties:
>                - mediatek,mt8195-pcie
>            - const: mediatek,mt8192-pcie
>        - const: mediatek,mt8192-pcie
> +      - const: airoha,en7581-pcie
> =20
>    reg:
>      maxItems: 1
> @@ -76,20 +77,20 @@ properties:
> =20
>    resets:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
> =20
>    reset-names:
>      minItems: 1
> -    maxItems: 2
> +    maxItems: 3
>      items:
> -      enum: [ phy, mac ]
> +      enum: [ phy, mac, phy-lane0, phy-lane1, phy-lane2 ]
> =20
>    clocks:
> -    minItems: 4
> +    minItems: 1
>      maxItems: 6
> =20
>    clock-names:
> -    minItems: 4
> +    minItems: 1

You've now relaxed the clock requirements for all devices,
and permitted an extra reset on the existing platforms. You'll need to
add some per-device min/maxItems constraints to solve that.

Thanks,
Conor.


>      maxItems: 6
> =20
>    assigned-clocks:
> @@ -186,6 +187,20 @@ allOf:
>              - const: tl_26m
>              - const: peri_26m
>              - const: top_133m
> +  - if:
> +      properties:
> +        compatible:
> +          const: airoha,en7581-pcie
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: sys_ck
> +        reset-names:
> +          items:
> +            - const: phy-lane0
> +            - const: phy-lane1
> +            - const: phy-lane2
> =20
>  unevaluatedProperties: false
> =20
> --=20
> 2.45.2
>=20
>=20

--Lh9pV1WQQOrM5d3z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZna9sgAKCRB4tDGHoIJi
0m+4AP49uMd4z2YZFaIFWw40rA8bLfRzXXAW/AIcPSJya74d4gD9FHj4ehDkPlBP
oVkG3h1+IyeeqLBBlKcv/0pR147NXwk=
=Uy7o
-----END PGP SIGNATURE-----

--Lh9pV1WQQOrM5d3z--

