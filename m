Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48ED8C54E76
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Nov 2023 13:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+24PDbQyReJox3hVnhzE8nhwGTA9mitLw0TMJ4Oh6w=; b=4bztnNSxC3az4iJGuMwbDyoQFc
	aGvm13lKtgJVP/8FS+qieexaP6Gqx2mEVr4xzA+ZKgmyvi3453UmckUuRqk2Pgo7L0u4iffX18QKe
	6XnxhYUu/GEzDHr8XECgrwjbSYtnAWffGZNAZg+wCqj/SJNihCkesVXqvcMVxsvuJgcgHDrcOhQaD
	WTPrfcxM+xmpJ5VG0kmZWvP4q1miU8g5ErBtpS5oqwAxPEYmX2+QKhAHW4HrEqy1UZgKsXTCB3BxT
	VVleBiZXhV/+9WUKx0wT9H8FX7ND4pgQCWp1yXZ2VAKH3FQAd4JznqBelPgp8bqz5ijInfc8UPBlp
	hoEJyGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4i4y-00AFCU-31;
	Sun, 19 Nov 2023 13:43:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4i4u-00AFBQ-2U;
	Sun, 19 Nov 2023 13:43:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A5D460C40;
	Sun, 19 Nov 2023 13:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC65C433C7;
	Sun, 19 Nov 2023 13:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700401391;
	bh=h+24PDbQyReJox3hVnhzE8nhwGTA9mitLw0TMJ4Oh6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GaqhXZw+P8LWgmTqe49Eiwzlh98f9wG2kDTTfJ9BDrJxTUvNnsFeMvz8Kgt0UqgNq
	 tye/7MbEQZAJtH6of0u/ktXRa1P23fvSQW3oqHeZkOC0S+JDXENK79OabujEvAAsBO
	 inx+d5Dav4RYGuN9Rf1g1WMLchmncO4uSZk5SpM1LVX8gKgH13UrTiVl0wa34NXd2T
	 VhWntESyWUIDP65gO+PQmyU54Xy/P7V4odUhSl4a7uA1e8ffSWu7mFfwYAEbgPN7I1
	 Fog2Ymj5uFN+AwYW/CDjYZZejWSjbZDF+bt6h7AXAyfG05eZI0+RqpxULh4RTn9G0l
	 b9Gk7MfK2L/+w==
Date: Sun, 19 Nov 2023 13:43:05 +0000
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add acelink
Message-ID: <20231119-xbox-bankroll-8a5a4df56c22@spud>
References: <20231117104101.9374-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M8VGEtr73EdlGVwV"
Content-Disposition: inline
In-Reply-To: <20231117104101.9374-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_054312_980749_25481A83 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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


--M8VGEtr73EdlGVwV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 11:40:59AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Acelink is a Taiwan company providing network products (routers, access
> points, switches, cameras and more).
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--M8VGEtr73EdlGVwV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVoQ6QAKCRB4tDGHoIJi
0rWeAP0RMPHCOlPpt7wS1EalDQ8VSG9hV58amZaR2BBv52NTngEAvnoFHviuWvKs
gnEInIscA65H/dYxOg5a2GFmJYo32Qk=
=ohoI
-----END PGP SIGNATURE-----

--M8VGEtr73EdlGVwV--

