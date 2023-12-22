Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41996C41535
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Dec 2023 15:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKsD7/3iN4ODvvjNv947DB6L9uQaJjdBT/a4noYL/b0=; b=AIrQpm1YiL94QzMLU7nKlKmdLV
	9OP+4+P978Z0DUP+B2aj/tZiNk7k/W644Woskm9rKND6TU6RAAUq9G63aTuv4ZNEDJPyXpKXqTVri
	8xDPrhHYe/dZ6LOiUIf4GP4OvfjQIWgDRoY7P+/UwfPf8ar/yheZkb2qAvX+wQJLBeIJduaVLlFGt
	OkKuC5xv5y1E4cw88NVSmE0R/y05Egjx3ryHmk/aZJHTFcJbzLJnNkjeLH/sGxbJCt/dIWTIQi43j
	yppcZgnIWCqniIX868agAB/9usQf6k0Dy+AoN9g5epHI83cBbBvr/c5dch2IIdtGPPa1JsqLgmjhD
	t4BTlUig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGh7X-006BAs-0R;
	Fri, 22 Dec 2023 15:07:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGh7T-006B9K-0p;
	Fri, 22 Dec 2023 15:07:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0DC73B822F3;
	Fri, 22 Dec 2023 15:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A24D4C433C8;
	Fri, 22 Dec 2023 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703257640;
	bh=lz9jX9ZQQWUL3HJ4uKy+xNfuOW6S4uTXYnJqWi7HVSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pj1auZeMLIYM9vAfcdZWY598ztp4RYNvw2gVvnfZEUqC2f0V9DwMDu1JcGNXtZEm8
	 hsh+iRj3mrJBwcsO1dd7tlT6ot97BI0mX7a8vplphRtjiIl6dajoZat4fdHziamV0S
	 g2mF3M7avj6MYEDrO8SMBKir2RNttPymcl8KMAQKaCkHCsCKZ2oap6l4e+tz+gtfXc
	 bdXiTBJGz/6Suxl4oeJx43BTzHUhXliL3KdLo2NMisZVecGuUxMJvhvKtEwPDUdDNk
	 GolJj07/sQ1UxmE6PTS25TYKhcc/plpi68fEFB0lP5H5oK1z7LqLxLykVNzEZfTet1
	 rZChU9wO9lZPA==
Date: Fri, 22 Dec 2023 15:07:14 +0000
From: Conor Dooley <conor@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jason-ch Chen <jason-ch.chen@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 2/9] dt-bindings: mailbox: Add mboxes property for
 CMDQ secure driver
Message-ID: <20231222-unpicked-jaundice-837baa3092ed@spud>
References: <20231222045228.27826-1-jason-jh.lin@mediatek.com>
 <20231222045228.27826-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5C0G5NxMMW7lzTZE"
Content-Disposition: inline
In-Reply-To: <20231222045228.27826-3-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_070723_600218_2F3D5EF1 
X-CRM114-Status: GOOD (  17.74  )
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


--5C0G5NxMMW7lzTZE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 12:52:21PM +0800, Jason-JH.Lin wrote:
> Add mboxes to define a GCE loopping thread as a secure irq handler.

> This property is only required if CMDQ secure driver is supported.

What do drivers have to do with this? Either the mailbox channel exists
or it does not. That said, I am not sure why this should be in DT in the
first place, can't the driver for the mailbox controller reserve a
channel for its own use?

Thanks,
Conor.

>=20
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml      | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailb=
ox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.ya=
ml
> index e4da0a58c943..0c17e1be99c2 100644
> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> @@ -56,6 +56,9 @@ properties:
>        include/dt-bindings/gce/<chip>-gce.h of each chips.
>      $ref: /schemas/types.yaml#/definitions/uint32-array
> =20
> +  mboxes:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - "#mbox-cells"
> --=20
> 2.18.0
>=20

--5C0G5NxMMW7lzTZE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYWmIgAKCRB4tDGHoIJi
0v7KAP9rXDTXnNEgdhcvQJISjTma+ULoi7AVf044gvTAiu+I4wEAhI0/WGXRcWI2
sMsJ6dV7i7ItV4+IYNJ+EBRIZruR5Qw=
=gZJH
-----END PGP SIGNATURE-----

--5C0G5NxMMW7lzTZE--

