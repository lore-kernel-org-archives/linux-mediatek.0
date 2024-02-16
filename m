Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9BBC48260
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 18:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KyByO6SWWK7yAuVBO07DPneVHJqjrvp8F0clZj4L87w=; b=Nf3v+/Nx9YUxQTueX6l3P2n1Sp
	scHbSZ06intGRNeOAxTrWUswLYPkeIf7aLRFfQB0Jr3l+AB8Q1vR2CtxHXJRvsn/VL1Xhlt1j/LUt
	SY6O5FAn+hjlZQ/00D+mtd/5Jo+zyUK+wP2iBpwg26NyZ7pWHSA1LplqjLNUR0ibK9J0ExTghbb4X
	obS4FwPsY7A6MqVskpYFf3fhH580VnFrsSKU2M3Wn0h/I7kdn7QoTKzRM+dRzo6OGbU57DvF9v4IX
	RaQAiwDNrNBd7eT35ctOFHBpzA1n3wPFBJYvKt+pYbRaM6CrRyIpZVYsVuqjEsKbNsHniQ5CASb79
	Uu7KCv2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb2ZN-00000003H5O-3NOs;
	Fri, 16 Feb 2024 18:04:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb2ZK-00000003H47-2icm;
	Fri, 16 Feb 2024 18:04:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 62C4CCE2CAC;
	Fri, 16 Feb 2024 18:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69298C433F1;
	Fri, 16 Feb 2024 18:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708106651;
	bh=4zAkwFBwhltmz4rki5uzbVVp2kIHfC3lppNg/ef2oWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kvkKXLaspERoZLUmJ2GAqcBR63dKo2UQTuIIqNvBXjFHSMSZ7lF7RGFy5hsirkwOm
	 0/GrwZWwgrkNDIIjE+5lwxVCQ1epEohR1N+PCIGaMupLm++hKwRuSA5D1GmW4R3/w7
	 4DKCY4NIoRoIAOtjg12u/sDHyJ20lyFcq0Snwe/6sUYOdggh/KJDDe4MqhaUv8GiHG
	 nlbxLgUTtnA6+DAjrkoVMOKEJx1j1K9sCxp5n6ImHZDiABHqXzx76ohxEAfgCoQ5pP
	 RaVKxIO7N059zQSHEVe/mM00XqAWkB0uulSrjw1oQ1x0pTYfalg4reqJ39YGui342L
	 KjkbtGqDm+xoA==
Date: Fri, 16 Feb 2024 18:04:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm64: mediatek: add Kontron
 3.5"-SBC-i1200
Message-ID: <20240216-unsettled-polygraph-e55f7f2dba90@spud>
References: <20240216163406.1050929-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GfQPB3jyAyI//zwd"
Content-Disposition: inline
In-Reply-To: <20240216163406.1050929-1-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_100414_879638_98922A7F 
X-CRM114-Status: GOOD (  14.68  )
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


--GfQPB3jyAyI//zwd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 05:34:05PM +0100, Michael Walle wrote:
> Add the compatible string for the Kontron 3.5"-SBC-i1200 single board
> computer.
>=20
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 09f9ffd3ff7b..32896f91ea38 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -357,6 +357,12 @@ properties:
>                - radxa,nio-12l
>            - const: mediatek,mt8395
>            - const: mediatek,mt8195
> +      - description: Kontron 3.5"-SBC-i1200
> +        items:
> +          - enum:
> +              - kontron,3-5-sbc-i1200

This is a specific SBC, why the enum?

> +          - const: mediatek,mt8395
> +          - const: mediatek,mt8195
>        - items:
>            - enum:
>                - mediatek,mt8516-pumpkin
> --=20
> 2.39.2
>=20

--GfQPB3jyAyI//zwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZc+jlwAKCRB4tDGHoIJi
0v0vAQD7OvJN5P3h8A9HqT3/JRs2VwVOUaNZR+gQQJVOUQzUwwD9F/fbds1vFdQs
K+oS3OF8Gtsl66sx2RY48OfHJTuTawY=
=a4sf
-----END PGP SIGNATURE-----

--GfQPB3jyAyI//zwd--

