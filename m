Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191F4C4829A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 20:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WT6OFz9QFZ9HuwZMisWPubDEGHnMtkMnwno7M7yj7jc=; b=kRmArW6quhfnlex0WaJcy0nl1o
	qyIE3Y0wRRkgjWmzPSJkkWQX73r5fpavkx86fflgVJKJRiH6dWmoTY5CbJr0uIH5D3vCNQTxbU8NC
	qFk17t1m10LNHtFOhmPgHq3FdxNQiTep471sXO2pJXra0NExKUxkL+Ja/7NglAubHTBS7FzuFRH0Z
	swH1tmBYCUvAsIn2CnguDL/rmNDNnLB9TuxW/fIAPG85iNPcWzIRGUYd2UjkzG/HXAFfwSnKOh9Op
	1+gjIMtM2UTbBpGEPYFoAq+X86AGMBIt6jASZmt6Ex03tICizD3Be7ISZrwtOg3ckl1J+uF1Y4Vhh
	8HKh4pAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZzN0-0000000Abtx-13hL;
	Tue, 13 Feb 2024 20:27:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZzMw-0000000AbtF-2luh;
	Tue, 13 Feb 2024 20:27:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C857616C3;
	Tue, 13 Feb 2024 20:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACEE0C433F1;
	Tue, 13 Feb 2024 20:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707856023;
	bh=wr2SPv5Ld/DSkoS5vcAzZJ9Df9CxqcjpNgsKUEXsmMg=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=lPFkxYPR0J3NXG1zdBfo423wECnKhWMgXPxCg52F3jS4QKKMEyqjBhXaUGKE3tgG6
	 37ZF1eFh/KlF2KXEvZh8+5akK0hqsrS1FZnabOENmkW6SqKVRepSFJf7g6xxh7ojEV
	 jnkdi6FQUiy1uKshzEZhLb5yve1bg3+EMiWyulcWid6e7LMamsxlhTvq2275lGDRVd
	 PYq1svZG2Lc2X9dtgFRoH1KjCqQDhIoYjVbGHKXP+VJjE7rPkT9HdKzpsCs5RzEGYP
	 ef1gd/J3wmRP/+qW2yBa+bsr9UVpRx1oatwybDxzT9Hk3Wx4NArI6+dQLf7ihqU6h7
	 NgaQAYTbgz0rQ==
Date: Tue, 13 Feb 2024 20:26:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: soc@kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tsahee Zidenberg <tsahee@annapurnalabs.com>,
	Antoine Tenart <atenart@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Stefan Agner <stefan@agner.ch>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>, Chanho Min <chanho.min@lge.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 0/6] dts: Fix dtc interrupt warnings
Message-ID: <20240213-wafer-garnish-88287bc5d4a5@spud>
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4XczAmSSxV0XIpGO"
Content-Disposition: inline
In-Reply-To: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_122706_809182_7A2DA1AB 
X-CRM114-Status: GOOD (  14.74  )
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


--4XczAmSSxV0XIpGO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 01:34:24PM -0600, Rob Herring wrote:
> I had a branch with most of these changes sitting in my tree for some=20
> time. Geert's asking about some errors not getting found prompted me to=
=20
> clean it up and send it out. This series fixes all* interrupt related=20
> warnings and enables the check by default.=20
>=20
> SoC maintainers, Can you please take this series directly.=20
>=20
> Rob
>=20
> *There's a few Renesas warnings still Geert said he would fix.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Rob Herring (6):
>       arm64: dts: freescale: Disable interrupt_map check
>       arm: dts: Fix dtc interrupt_provider warnings
>       arm64: dts: Fix dtc interrupt_provider warnings
>       arm: dts: Fix dtc interrupt_map warnings
>       arm64: dts: qcom: Fix interrupt-map cell sizes
>       dtc: Enable dtc interrupt_provider check

Only fixing it for arm, Sadge.

Co-incidentally I noticed there was one for riscv while looking at
Krzysztof's underscore in node name patch earlier, so I'd already
written a patch to fix it :)

--4XczAmSSxV0XIpGO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcvQiwAKCRB4tDGHoIJi
0iKoAP9EkRpfMdcQD2Rxy6EyQrFHOf9aK1XBqWvwsM+uYWZVZAD9El92XfSbd1tC
IcCJORhtpqwWl2bRDhMSRtSpWpqRygA=
=9Yjc
-----END PGP SIGNATURE-----

--4XczAmSSxV0XIpGO--

