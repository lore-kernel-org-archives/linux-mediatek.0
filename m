Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E777BC38142
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 04:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:To:From
	:Date:References:In-Reply-To:Message-Id:Mime-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RA62djbRjHAtR5eYDGCg3s9PgydQzyaEPXFw3P5ADCE=; b=1wVytqmR4vxbPPPxXmLuw/U1uH
	G7xTY8eWe1bbHNOFvfvRyRZcXkodkxJ+4KVNFCSFn54y/2RemY1wBXHeSN9oNb6MuI6dXbCiho/c+
	JiUM5vPGXm9f4YElfhSqSj7N3EWeSNa1SmtFYJ2rG+EW8zakybn21cmRrIwjh9JL5K7Ceiv80szW9
	Ip2aezpRHQi8t+xu2c9yei2E+nRjZxooEW06rmm0H05zoxLg3OF6RfoyG7IjYS119/lAeJWPWnUn3
	GIR/kV9Pv8xFM0rKO9XqsO3cMP515Ple1ZBHEZ3/5B4VrBwRH4gH4k5MKeWfbNLjEYyB0mexSok7i
	1kAccijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIMna-003bWj-Iq; Thu, 19 Jan 2023 04:45:14 +0000
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIMnV-003bV3-Bg; Thu, 19 Jan 2023 04:45:11 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 6BA982B067C3;
	Wed, 18 Jan 2023 23:44:59 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Wed, 18 Jan 2023 23:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674103499; x=1674110699; bh=RA62djbRjH
	AtR5eYDGCg3s9PgydQzyaEPXFw3P5ADCE=; b=IpsjyOTlH5j8QOByEhfxxZUtbb
	xqJnmFVSTytXcx6+tFAO3hWlFS49HpirZWOhOk39sVNksgD8Wm6hZyp2+LY/ozDJ
	nddtGSxVtD1rdIyA84vx/4Xt2hiZO7fWNvHBA6DKXOG7MXRFyyeZVhASiGL8HLac
	A0t1NiaaMb87bwccNz8KL+E9QiYVq19xG4mDRXgK6VvhAZ1Y+OBbVRkqyMkSRf7b
	xKemIdRdemThaumc9Vs279Bb41I1dL0iSNSwesVcSAxTCCq6VkpOwps9qrSbnDZr
	ftWte7zHHNTOdwMJRZTkdgr6KHk2iDMWRon8PBm+H93LmvjNCyxWOW6Tm2qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674103499; x=1674110699; bh=RA62djbRjHAtR5eYDGCg3s9PgydQ
	zyaEPXFw3P5ADCE=; b=FdpetIHX8CEoHNlkaO1BpYfDpEIGIgh42HuArpleoZGH
	n/nTrqA1ZGkEXV8YRYx7IkNBTA0Wd6oCif2OnCKlmGcKXI2+dGsJ+AG5vs2yaOTd
	5LbB72NwDjBNo2JsPs52Z56hfDFZ6eXA9pUQEgw9zYodf3OfLNvNX/RzfDbwlrVZ
	YEVSG4fmJXghz+Y2qoZm5BcJGZf+IOlG2Fu5Sesv0ZSbGbDnH8a6TSsT3ywZuQej
	5S/FRmiOgdtHTCL7cs9cuyVIrFdbJLAHy+NIm33+MuH+QERmydfahOp3nzLDoUqf
	4QUpN1aaUfPtSKQFojX4Q+L74Y9iXsglLup0b0UKaQ==
X-ME-Sender: <xms:yMrIY8RhERCQ4jB3QGK1K7UB0n9GpfcRnvNefwkC33VfPIV7pUdCrA>
    <xme:yMrIY5zU4tWYLIxcSqUPg_NHC_xOsPf4-M8m1QeE2sk8kBkD_7bIiL_vH9iWx-mYZ
    gGn5bcarqRVa8XF8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtledgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:yMrIY50GyRtBh5E_brbTljefw1vdppNYkTGvGkY3zezjVB3g-jRvjA>
    <xmx:yMrIYwBLKPTI0OVY5nFE6pZBqFHxtXkoVOfg6nrTFT9nmbqEyeTRCw>
    <xmx:yMrIY1izzYjA3B4bulCei4RJiIVzlnLZWMnGqOIKjRhfCpp2_HZOxQ>
    <xmx:y8rIY2JOabJhXFpgnz1s382LAPbnMA2dBpcKwQYf2OOENVfZZlpPAJ-prvQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A40C61700089; Wed, 18 Jan 2023 23:44:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <9a82d30a-c8ca-47fb-a976-f7f4d99cefec@app.fastmail.com>
In-Reply-To: <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
 <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
Date: Thu, 19 Jan 2023 15:14:36 +1030
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
Subject: Re: [PATCH 2/2] spi: dt-bindings: cleanup examples - indentation, lowercase
 hex
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_204510_020689_106A36BE 
X-CRM114-Status: UNSURE (   6.14  )
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
> Cleanup examples:
>  - use 4-space indentation (for cases when it is neither 4 not 2 space),
>  - drop redundant blank lines,
>  - use lowercase hex.
>
> No functional impact except adjusting to preferred coding style.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/spi/amlogic,meson-gx-spicc.yaml  |  26 +--
>  .../bindings/spi/amlogic,meson6-spifc.yaml    |  22 +--
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      |  24 +--

For the Aspeed change:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

