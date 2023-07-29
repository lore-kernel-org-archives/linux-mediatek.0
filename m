Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E809C0015E
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jul 2023 10:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzQEXfRpvFAotuqzKmscR6X+uFs6zMNV5A/qGbDlby8=; b=IEDC9hhbHz9f9ZzIWj7fYW+f83
	p/1hgD41gDcCWEW+5cD0JVI8/L6DpLgTj7zvvYJEmCWEdygpYNJuETtDfAHNmTS6FNN4ft6ppZfBj
	GDvmIix0f4UB5+NmSkSLhNPc2F63jP85M5B7G076r99eS/g+9AbqLtQJRqXXVQnxNPkgaqNFXpETM
	Nl0Iihg2gsKeyYdtHSPFnT9RVBil01akQxKllK3bNhNAmTk5GbWhAq79hfTO3VQThg8CDtV1owXpA
	pKhKPhmatWEGx80Y/outnpsZgCS56ADExIz9Um58VcL3SL0fLRUfQLR10VGzyEJlzhyDGg7vqhXGL
	SqlSKa9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPguW-00732c-0K;
	Sat, 29 Jul 2023 10:10:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPguS-007322-0f;
	Sat, 29 Jul 2023 10:10:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6C76F60A6F;
	Sat, 29 Jul 2023 10:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B231AC433C7;
	Sat, 29 Jul 2023 10:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690625450;
	bh=0mZQVW2vbt1ay2W0qJ+pcf3lu40KCDjItFHk8MIbO1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GFxOR42mKmw8/dz0qTeBEjZyEDoGmoHVyaVBqoCdYvsA0GhjakaME9lKMPHELRSVX
	 E50rWRHyEhCfwTmsdopACbX7x7kyYYDU9h0eA+rZRlk9yaZLn62/SPZ0GbUFgWTDZh
	 lul1D9qBYqREZMuzs3f3MJFpen3bNMAY8VYFcqlumy2hRHYqPLsQovy0ioOuUmzgLZ
	 sAVxbaS1cK+DtWb0GowYiPSdsfeIhwDU67nOKEcjkYnCz6OrYHteQe2kECgPqfMzGi
	 9Q4ha0aSN5KHwhXQlpNWY465kXPf1fUuskgvRFVhoC7ispok4497n0MzvA8B0ahPl9
	 N4itIPqXKigZg==
Date: Sat, 29 Jul 2023 11:10:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mt76: support setting per-band MAC
 address
Message-ID: <20230729-stingy-amiss-74bd459e2c59@spud>
References: <6e9cfac5758dd06429fadf6c1c70c569c86f3a95.1690512516.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OVpYLz7Xm1cZxqHs"
Content-Disposition: inline
In-Reply-To: <6e9cfac5758dd06429fadf6c1c70c569c86f3a95.1690512516.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230729_031052_353321_1EC87805 
X-CRM114-Status: GOOD (  17.53  )
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


--OVpYLz7Xm1cZxqHs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 03:50:47AM +0100, Daniel Golle wrote:
> Introduce support for setting individual per-band MAC addresses using
> NVMEM cells by adding a 'bands' object with enumerated child nodes
> representing the 2.4 GHz, 5 GHz and 6 GHz bands.
>=20
> In case it is defined, call of_get_mac_address for the per-band child
> node, otherwise try with of_get_mac_address on the main device node and
> fall back to a random address like it used to be.
>=20
> While at it, add MAC address related properties also for the main node
> and update example to use EEPROM via nvmem-cells instead of deprecated
> mediatek,mtd-eeprom property.

Could you mark that deprecated then please?

> +patternProperties:
> +  '^band@[0-2]+$':
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      address: true
> +      local-mac-address: true
> +      mac-address: true
> +
> +      nvmem-cells:
> +        description: NVMEM cell with the MAC address
> +
> +      nvmem-cell-names:
> +        items:
> +          - const: mac-address

You should not need the items list if you only have one item.

0

--OVpYLz7Xm1cZxqHs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMTlpAAKCRB4tDGHoIJi
0vHeAPsH03gK8BH5fVJvQhH6H6InP+CbgNqslVeXnNjQNdJRJAEA/wonPwNJqvjk
KOAfQUkd5f5Yn8fk376EPvQxAbRotgY=
=b6/F
-----END PGP SIGNATURE-----

--OVpYLz7Xm1cZxqHs--

