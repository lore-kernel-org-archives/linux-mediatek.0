Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5690EC88E72
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 18:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfV2+3ufoodcnS2hr2MvymVG9xMpLrrAfO1Pi9klSVg=; b=I3Wy0XnYt3DlhjnMbz8xhcM+4T
	EgAw9rFvelFy9UhTiKL+OrpSrRUg7FIZV0w3sGBrSAlAbBU5oadFsVQMhibOHY7iNrweizym8WDI4
	UWZC6amXyR5UTJPPR2okDPVnt2ZO5zpkFBwbkzSWYUoEom24M+Z409aFwIqSJbg3HgBLPdx3WzPtH
	etbyTtRfhJRXBVfaNCQgV3gMe5v/HpYOSdA0xJrasyZykr0C6IRd4S10SSGwFJ93hxH8sYeYOvN+l
	bck9VLD0trvrMYkIY7cME7TGjqAm16gytBBtRazF1T9VYz3Afd3wvP1EFGeKeNZkLkTRX8I3un2n7
	e5O4SwCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6BFt-00000004R93-45AG;
	Mon, 14 Sep 2026 18:18:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6BFs-00000004R8t-2HmF;
	Mon, 14 Sep 2026 18:18:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 82A7660142;
	Mon, 14 Sep 2026 18:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE94A1F00893;
	Mon, 14 Sep 2026 18:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789409891;
	bh=UfV2+3ufoodcnS2hr2MvymVG9xMpLrrAfO1Pi9klSVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nDpojIh2i5FVIFYzzVAshOI8GnTHsdKHqfOhmt4+rDQ8byU+w+2gVVVqlik8hIy6K
	 35AwBNdW/FhoJf2pIszi34Jfkr97mkz6sVSNjxocSuqf2u0gzNR97iy/oZv3X50Foc
	 cxpJLldl6TiTpdS1N28tSkzl1MV/WAVkffi4mT71XLg8N8kyUPwRF0iUrSR3re5v7b
	 6J3flpuzkP0Yx1DQVaYJ6zfCPjy1HNwJekjW66mO46h5p3UJPZCfZfQ6fCvkWNbwq+
	 6+yj5QSrhJ5MZjydlDKliQLVCmZgQIvdefuUXRWsJsx+NFqIRhtZu/2w5X7Qz8ZF7W
	 nGs0jHncwc+iQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id EAE67FDACBA; Mon, 14 Sep 2026 19:17:57 +0100 (BST)
Date: Mon, 14 Sep 2026 19:17:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Khanh Le <khanh.le.xr@renesas.com>,
	Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	David Rau <David.Rau.opensource@dm.renesas.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Yingkun Meng <mengyingkun@loongson.cn>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Julien Massot <jmassot@collabora.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Shane Chien <shane.chien@mediatek.com>,
	Daniel Beer <daniel.beer@igorinstitute.com>,
	Sebastian Reichel <sre@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: Use consistent indentation in the
 example
Message-ID: <aqg6VUKriyVANv6u@sirena.org.uk>
References: <20260914093657.61218-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lBcZ00JTkHLtIO8U"
Content-Disposition: inline
In-Reply-To: <20260914093657.61218-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Cookie: Orders subject to approval.
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


--lBcZ00JTkHLtIO8U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 11:36:58AM +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
>=20
> While changing the lines, correct also node name to be generic in
> cirrus,cs35l45.yaml, cirrus,cs42l42.yaml and dialog,da7219.yaml.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Can you rebase this against current for-7.4 please?

--lBcZ00JTkHLtIO8U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqoOlUACgkQJNaLcl1U
h9CLWQf/VFTw/qe/g+8peqE05M8nHdQKkYqM+VK25BVf7NMl4rlEDI4nR8k4bWEW
17u4cI3rTrRngHBJYjWjjUC0UiYUR7325nlIvtC30fNLDIctjAGClIGzHVQK2hPB
XJ7EI7rdJhwcimKRi1SfB7zbKG4fCKI8LWaAQ/mGdleTtwEsCOT44F6Kyx5fVfkX
0RtEzTl7X6PnR1BwjiB4jGSUObEPfPTr5144+S7TCCfzAzAQClmOtcIwyGqZekNu
ByUbfJcB5JGDnHnLkn9NL/QU3J4jNOAwEs54z3SUk1hQoQro8UQc6Jh2KUeNGIHG
CdWnP+p/QA1EiUgQEJpb6pMeRUj3AA==
=TYrF
-----END PGP SIGNATURE-----

--lBcZ00JTkHLtIO8U--

