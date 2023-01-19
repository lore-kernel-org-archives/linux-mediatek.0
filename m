Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3DBC00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 04:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:To:From
	:Date:References:In-Reply-To:Message-Id:Mime-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jp0nEIifZiHOJSvV20z7BP6fpn/Kau5COB1QREBO070=; b=Ypp0QXlmMaQ4hwosZLf80YNQXZ
	m3iNx4+T0T3ol2G7U5WgI6ADG9u50CwdFNitnOagqr110EkrBbHkL0O6brt7upVvnrA5r/6XZNWK2
	RLENt5t/1SSiijMBnE1E+HlHA63eT7M4pbswW7GF/QgwSsmBnWsLNbTTbdYy3AlxUVTENzPlC1sM3
	5rdDr3BcNuwg8dBLGVRb1jfLW0AQT+ZO0xdsI7qP7O8M1nYthHRiKvJtnhB0J5zYjPoelJvomG/r6
	Ry01xG8wH22Wnyn2DAPIIuv5FTLqkecUX3rCtBwcaQ7InBvLZeR72ZeL9Juc7fUZRE/sJmfmt/M6g
	8Ov338Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIMwR-003c5O-02; Thu, 19 Jan 2023 04:54:23 +0000
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIMwN-003c4X-3d; Thu, 19 Jan 2023 04:54:20 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id B19B52B067FE;
	Wed, 18 Jan 2023 23:54:14 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Wed, 18 Jan 2023 23:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674104054; x=1674111254; bh=Jp0nEIifZi
	HOJSvV20z7BP6fpn/Kau5COB1QREBO070=; b=vbzAmfBKcFB8AOPr4uXDMgqmk5
	clGM2aj6FMScjZ6BbYJ+vgybqjKJNAWyqXoaaHoUIt+fa6G2aKB5MYVrtEN6rPNw
	ekHMUtQGMwWAlmkeBiBXp+sCff3eggXGnpVQO/X1J5BPs5uX52TTL283/vOkPyB0
	I/5NwNQAp/4ee9SMINakabvXev/nvmqvQGDZknkUWk/5wDea0l3I8ahJM/vXvMrR
	/MSGxZXhPg44kssCVdmjkq+zTp77ktyOGZ7CI4ekq+w7V9XPJaUt1B/mKNP4C++u
	Ky4p8qnKmh7u0gQS3CuarZ2ZEAc2FeENsuwYbiZ2eM99ZWeA4BQCn5JykGnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674104054; x=1674111254; bh=Jp0nEIifZiHOJSvV20z7BP6fpn/K
	au5COB1QREBO070=; b=WojTXSbjvSW4xND20l+X/zxuGH6YT45jEqaQ0oGenJWw
	InBnhXltRrpW/0COYHV0q+an3JKo0Ygxh8kxhPLtEAvsUMBrLxLYXDExhBjaKsKh
	tMfMOp0ZZLTHDhRqiSOPay9lxwxvfH9VuUmgfc5+HHKpunCflf4bzlfHh5bBhC+B
	e8rX+CTJhOdml0OA3Nor48xWDOjbNBujibT6IPFYxdNcwabxjO8W+EcmnHpjZnTS
	wPiNVH6TwMz9ixSoIW3YlIa5kdMHz79GXvdTxHbblmWchX5DXXHEPbWxP0iVY7QT
	sQ1ySX252sjKsupF2G7Rbz+Ae5mUAZEjlOMqV1ZEnQ==
X-ME-Sender: <xms:9czIY-jK6uT2mGK9VS3uQSt4Q7_SJveCRpsc0tUzUozhdM4A82c-qg>
    <xme:9czIY_DwGvA-AABsTHUow97627iyXSzv22TgvGFxZCNPJnFvUIt3CRAK8F6rY-Plf
    1GaQa20QxsRzZbmNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtledgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:9czIY2GOkKSDtjERBbvMlDiUUBJpRcpwgD9Ej4fMTeVQgo1MR9VxSw>
    <xmx:9czIY3Qxx5VV69Q7BJz_MhYuM-s_mZfclV0sUMyArX03NZ3KkefvnQ>
    <xmx:9czIY7wKcicS7WqwRh0Y6RUlCWJJy8ib7wKcyw1F7dOTiL4BUFDknA>
    <xmx:9szIYzb4I3PhKAY6Khx0hZeAmEcdQDLkBodqImNTOqHAB7hqv4uPR0hlNfQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 183811700089; Wed, 18 Jan 2023 23:54:12 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <47290046-59a2-4bf0-8af0-3a7b4304deb3@app.fastmail.com>
In-Reply-To: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
Date: Thu, 19 Jan 2023 15:23:52 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Mark Brown" <broonie@kernel.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Chen-Yu Tsai" <wens@csie.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Jerome Brunet" <jbrunet@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
 "Chin-Ting Kuo" <chin-ting_kuo@aspeedtech.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Joel Stanley" <joel@jms.id.au>, "Kamal Dasu" <kdasu.kdev@gmail.com>,
 "Broadcom internal kernel review list"
 <bcm-kernel-feedback-list@broadcom.com>, "Han Xu" <han.xu@nxp.com>,
 "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "NXP Linux Team" <linux-imx@nxp.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Thierry Reding" <thierry.reding@gmail.com>,
 "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Andy Gross" <agross@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@linaro.org>,
 "Serge Semin" <fancer.lancer@gmail.com>,
 "Haibo Chen" <haibo.chen@nxp.com>,
 "Yogesh Gaur" <yogeshgaur.83@gmail.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Heiko Stuebner" <heiko@sntech.de>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Li-hao Kuo" <lhjeff911@gmail.com>,
 "Michal Simek" <michal.simek@xilinx.com>,
 "Orson Zhai" <orsonzhai@gmail.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Chunyan Zhang" <zhang.lyra@gmail.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 =?UTF-8?Q?=EF=BF=BDecki?= <rafal@milecki.pl>,
 "Vaishnav Achath" <vaishnav.a@ti.com>,
 "Parshuram Thombare" <pthombar@cadence.com>,
 "Leilk Liu" <leilk.liu@mediatek.com>, "Gabor Juhos" <juhosg@openwrt.org>,
 "Bert Vermeulen" <bert@biot.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Marek Vasut" <marex@denx.de>, "Birger Koblitz" <mail@birger-koblitz.de>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Anson Huang" <Anson.Huang@nxp.com>,
 "Chris Packham" <chris.packham@alliedtelesis.co.nz>,
 "Kuldeep Singh" <singh.kuldeep87k@gmail.com>,
 "Pragnesh Patel" <pragnesh.patel@sifive.com>,
 "Christophe Kerello" <christophe.kerello@foss.st.com>,
 "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Erwan Leray" <erwan.leray@foss.st.com>,
 "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/2] spi: dt-bindings: drop unneeded quotes
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_205419_206663_A6B2A78F 
X-CRM114-Status: UNSURE (   6.33  )
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



On Thu, 19 Jan 2023, at 04:09, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/spi/allwinner,sun4i-a10-spi.yaml  |  2 +-
>  .../bindings/spi/allwinner,sun6i-a31-spi.yaml  |  2 +-
>  .../bindings/spi/amlogic,meson-gx-spicc.yaml   |  6 +++---
>  .../bindings/spi/amlogic,meson6-spifc.yaml     |  6 +++---
>  .../bindings/spi/aspeed,ast2600-fmc.yaml       |  2 +-

For the Aspeed change:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

