Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5DFEE0206
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 17:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZR6q4Qbqk372oJ6nMaU/EQNS9r/Oia8WsY6gNN3LSE=; b=4Fc4VCuHRlCWqtv0J086R6J6Qz
	CPUEfagWQ60RCbn2eqcJOkhvv5PeDyHjMlCqzrGFae30M7mPEuYXsLBh6HvpU5wEARFbIHaJZu6S+
	guuq9CioqX9mr8lTQ4IH9lVXbY+tvZ17PDVS1P9hbw/DCTUEaxm8ZeMFpBTlU5mZznEGoEbd3RbzM
	oLMcKONhXl2XMjVfP8K+PKQRLeDxhtMhIXf3OQuyGFYdP7egABPhTuYEtWLvbUSDh0fIVWFO9H7OW
	nivDoA/T01uA++7K0Yv4WRgz9+04DWJT3zyAKzEW3BwzpoVVnQXHqLymcKGBPnqmH3rBHLCqje/SW
	btAH2cXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soRVq-0000000AZ49-0zbb;
	Wed, 11 Sep 2024 17:52:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soRUl-0000000AYt1-1NZj;
	Wed, 11 Sep 2024 17:51:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2D68CA41D49;
	Wed, 11 Sep 2024 17:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD0DC4CEC0;
	Wed, 11 Sep 2024 17:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726077069;
	bh=jxwQBUysz9Q7EEFtsFJfF5a7IMsu+1/MGz8NQqPXSOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XUHz9zY+4qPgtzUUz0U7VgO0sisWqpCSEAahkonml7txztZbBzy8VlwBsQLyE448J
	 yIjerS+zg94wxVCftG8fLu2EqbJ/8zrKzfT1CLR4hRGx5v9Mt4sq2PqjFG0ga0cEQK
	 wRbDa12yfcmlLvDNdrtzroOZxXX/1WxnuEZqe10WLNo5I3dKSa/HObbmVkOF7tARxz
	 Hk7/B1RoOmIlRRUM5TkZuDzLW9/hdY6mnzjSxH9UsKlpx8YPqoKu62dM2QFHV50bPz
	 n4P+9dJZeh7rkSOq6i4vlVKw32z88C73jZ0I8OvA6rOeYMlncdJbkiTzwlMrFcfLRi
	 povx8ZQXMe9rQ==
Date: Wed, 11 Sep 2024 18:51:04 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] dt-bindings: mailbox: mediatek,gce-mailbox: Stop
 requiring clock-names
Message-ID: <20240911-unhappy-wifi-b0a851e261bb@spud>
References: <20240911104327.123602-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CQ/b7f5ZIzQi4s9H"
Content-Disposition: inline
In-Reply-To: <20240911104327.123602-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_105111_459421_8D2D32BD 
X-CRM114-Status: GOOD (  14.26  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, linux-kernel@vger.kernel.org, houlong.wei@mediatek.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, krzk+dt@kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--CQ/b7f5ZIzQi4s9H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 12:43:27PM +0200, AngeloGioacchino Del Regno wrote:
> There is no reason to make specifying the clock-names property
> mandatory, as the Global Command Engine HW needs only one clock.

Have you checked to make sure that there are no users that do the lookup
by name?

>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../bindings/mailbox/mediatek,gce-mailbox.yaml        | 11 -----------
>  1 file changed, 11 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailb=
ox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.ya=
ml
> index cef9d7601398..ff5d010fbcf0 100644
> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> @@ -56,17 +56,6 @@ required:
>    - interrupts
>    - clocks
> =20
> -allOf:
> -  - if:
> -      not:
> -        properties:
> -          compatible:
> -            contains:
> -              const: mediatek,mt8195-gce
> -    then:
> -      required:
> -        - clock-names
> -
>  additionalProperties: false
> =20
>  examples:
> --=20
> 2.46.0
>=20

--CQ/b7f5ZIzQi4s9H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuHYiAAKCRB4tDGHoIJi
0o+EAQCcEWUQzcLMz35NefAQk+aaUMBucsLaFZzMYFLYJnfNaQD/fVKxxCnZ0KKi
9m9LyaCWre8Vms/jz6ku4DYaJ9vRYA4=
=8WFK
-----END PGP SIGNATURE-----

--CQ/b7f5ZIzQi4s9H--

