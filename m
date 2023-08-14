Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3BBC04A94
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 16:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WL867TiNwmaHajVcZevdw0B+eUm54URIg62rJoIjf+8=; b=S7f1yOcyjDak4GX2ZSsJPtmf2U
	9H2O+gGcWe8ISJLqgdg2DGtLJgOkTvvI4jtODhqrVZj5ApzMx+rSgQvOnG6o5Cm0oqWuCk2uw/GFO
	0feNrxbhzzMj0RuEzLhVZshvKOuBEbXTlFE/7ajTnrEC+0ozPAWmOaZebiMc/P7zaD0yLRdsawwtf
	HjtIIkuBIQsLfVoTR/cxVHZBxdbVtDy3oyw7fnrEc+EedEZoEhdK14nYqJZ1UEp8Ph+2VtbTdyosd
	QzBqLkO4Eee/C95lHw5oAOQY0e87hPWWvCw/HKzHrPnaPEtIMEtKE/puPpvCND/GCfdUN4A1+UF/Z
	UZL5DTog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVaHg-00HXji-0e;
	Mon, 14 Aug 2023 16:19:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVaHc-00HXix-30;
	Mon, 14 Aug 2023 16:19:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6AE846406B;
	Mon, 14 Aug 2023 16:19:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6FFC433C7;
	Mon, 14 Aug 2023 16:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692029947;
	bh=1HXaR1YqLupXBHwp85bkyMqldMzywffwekLUEAu17lQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQpOKl/8SHJMA4ovCGZI5y3v9Q2m5JuInPWTmDYCAFpKJo66441o5sowDMYYJV23v
	 PurzGhRTt6wWzVnit+s4Q7vQ6Sm/flka8NxVydQo+Bxi1E0/WcKEmbKxuubgQpP1HF
	 7pMboXgBFOPLezf+don9/x/Gt863YXBzOg79jbJzZXhXhd8btAf62gQBVDbJR4YojW
	 xCBdXZIFJaeG1etr3MgbT4zHjxhv1EMeUVp5nhnOATFf7fTh/mpyaLEaGbnvMNbYmZ
	 lYtGLoXh4N+taPt424ET5oKphQfFdG93LBakDyyDUBan3LsAZqhmGPQfr08iC/geQ2
	 kMiJJodjH+M7Q==
Date: Mon, 14 Aug 2023 17:19:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: mediatek,tphy: allow simple
 nodename pattern
Message-ID: <20230814-isolating-faceless-72835873207e@spud>
References: <20230814093931.9298-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g/mf8JY5atzBFUNd"
Content-Disposition: inline
In-Reply-To: <20230814093931.9298-1-eugen.hristev@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_091909_058830_AE0DD1CB 
X-CRM114-Status: GOOD (  21.30  )
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
Cc: kishon@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, kernel@collabora.com, sam.shih@mediatek.com, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, matthias.bgg@gmail.com, vkoul@kernel.org, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chris.obbard@collabora.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--g/mf8JY5atzBFUNd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 12:39:30PM +0300, Eugen Hristev wrote:
> The pattern for the nodename only allows t-phy@... , however, for the case
> when the t-phy has no `reg` and only `ranges` (basically when the t-phy
> is just a parent node), dtc will throw this warning:
>=20
> Warning (unit_address_vs_reg): /t-phy@1a243000: node has a unit name, but=
 no reg or ranges property
>=20
> For a node like this:
>=20
> 	sata_phy: t-phy@1a243000 {
> 		ranges;
>=20
> 		sata_port: sata-phy@1a243000 {
> 			reg =3D <0 0x1a243000 0 0x0100>;
> 		};
> 	};
>=20
> it is normal that the parent node 't-phy' would be without any address, a=
s in:
>=20
> 	sata_phy: t-phy {
> 		ranges;
>=20
> 		sata_port: sata-phy@1a243000 {
> 			reg =3D <0 0x1a243000 0 0x0100>;
> 		};
> 	};
>=20
> because being just a holder it does not have its own reg.
>=20
> However the binding does not allow such a name for the t-phy, so with this
> patch, making the `@[0-9a-f]+` part optional, such node is possible.
>=20
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>

This seems reasonable to me, perhaps the lads will scream.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
> Changes in v2:
> - none
>  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/D=
ocumentation/devicetree/bindings/phy/mediatek,tphy.yaml
> index 230a17f24966..2bb91542e984 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> @@ -64,7 +64,7 @@ description: |
> =20
>  properties:
>    $nodename:
> -    pattern: "^t-phy@[0-9a-f]+$"
> +    pattern: "^t-phy(@[0-9a-f]+)?$"
> =20
>    compatible:
>      oneOf:
> --=20
> 2.34.1
>=20

--g/mf8JY5atzBFUNd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNpT9QAKCRB4tDGHoIJi
0jU2AP9qah5UHtzzFaDMKPLx4YhxWLbBsHowrT9XMVj560Z2twD9FGmBUyZvKKW2
UNhseLnLrkSED1LMAEZNSFekdLZpGgk=
=dvtZ
-----END PGP SIGNATURE-----

--g/mf8JY5atzBFUNd--

