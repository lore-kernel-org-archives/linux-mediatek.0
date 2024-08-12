Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A5FC3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 16:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frzS/aHm5VA9TIrOS8VWHyLLQx6PC/h1Pbt6Q1VlcEQ=; b=MS9XoR0viTvJMhaxW5zucQXeDL
	0yRwOw+ekzXuZQQ2IKgTPtGI0D8fim1RbnXNr5y86A7NEx/jB4Drg9NuYkFo9EyDoKFTzML8geg7g
	qK7RR4LEYrz2NgRd9U0KBchVi2xVAV4pjk7PIptnAS9pC1QHjrXuG/gvCHnPSaAsragwmoDj8+Dg4
	RHGBLocZBQncqEs4JRmtykWPySgr5rXm+DNMBH/B6mqV/s0KL5VXWRIQkGexJ3w2sGtwsj+ElHxSr
	rCHpPx61j8p9AFN+KZ5LgyZwZdLuHIXFbmhgJaplsKZhLTVuTfGopsLO4PUv3DeNlxxUK0fEXrhfd
	vpHSi5fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdXYw-00000000qPv-2Kec;
	Mon, 12 Aug 2024 16:06:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdXYJ-00000000qKd-3kQo;
	Mon, 12 Aug 2024 16:05:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 55D8C61351;
	Mon, 12 Aug 2024 16:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211C3C4AF0D;
	Mon, 12 Aug 2024 16:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723478747;
	bh=frzS/aHm5VA9TIrOS8VWHyLLQx6PC/h1Pbt6Q1VlcEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fCt89cgkcUtxbLSoQ0CdTdSdiR1I6LG08Ri65kjhxXhaLmiDckoTreTX17Q8NWM3S
	 DKFNgbRwQAvrJdPmzYzVXEFsmwNWBqpKpVNIKimbjl3HgXIpXHnmh2wHPJiT4EzMQj
	 GbuNr8nLCZ1/hNBAGf39TDY6FutgGVbKUl78QX7JpvzUZb/ex8zQ6NZsIWm8Xo+Nck
	 ywO4zkw9Gt65D6F1yT4fZ9x81FgCmkCr/VMMlu7Nf5LoccvEj3mRQlYBAnndXwWEOK
	 hG1DgomQT5RU+3hXHIStbHkOhb0IfBu1cqKoFfrix5pm/w6uFGTpkwltxzvCLufKt4
	 O9xwbbtTG5Elg==
Date: Mon, 12 Aug 2024 17:05:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Daniel Kaehn <kaehndan@gmail.com>,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/6] dt-bindings: add serial-peripheral-props.yaml
Message-ID: <20240812-borax-coming-c1d36272eab4@spud>
References: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t2c4tmW/pTswK+f0"
Content-Disposition: inline
In-Reply-To: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_090548_032425_67109C79 
X-CRM114-Status: GOOD (  12.92  )
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


--t2c4tmW/pTswK+f0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 08:17:03PM +0200, Krzysztof Kozlowski wrote:
> Hi,
>=20
> Add serial-peripheral-props.yaml for devices being connected over
> serial/UART.
>=20
> Maybe the schema should be rather called serial-common-props.yaml? Or
> serial-device-common-props.yaml?
>=20
> Dependencies/merging - Devicetree tree?
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Entire patchset should be taken via one tree, preferably Rob's
> Devicetree because of context/hunk dependencies and dependency on
> introduced serial-peripheral-props.yaml file.

The whole idea seems reasonable to me, but I question whether it is
worth tagging it if Rob's gonna be the one applying it.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--t2c4tmW/pTswK+f0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZroy0wAKCRB4tDGHoIJi
0gZwAPsHEotRe8E8aoh94BQjbYy7hCdbThvD/gmgsp1hB7+4XwD+IRh/n/brLbFT
vFkmgJw6itiKcyKJAzQ0mdJN5iux5QM=
=1pSD
-----END PGP SIGNATURE-----

--t2c4tmW/pTswK+f0--

