Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E96C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 12:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pj9cP3NpgvUWuF50cw3EKdAEtmy3S7Yk4hSUuL2CjLA=; b=ngVFf5oVuH9cq3HP5aLFffTATO
	B0Vea6U3VHCHd1pQIThs0kNu4PTziRDzN7RnzUnfAgNFyxlN/NNcumSYAqGxxD/VrSmg4R2aX5y1Q
	0J3q9mF+qEvXi6RZl3589ECpVB6dR5AD53OAUcWVCyfQyGc50AJ7OhtMtl29CX2V4IHO7EV/Hy1Nj
	ZK6iWwTzAGM2UGTF5jai889arScWgAOQylIe6UD+87NmrOdWvmW6QjcU/XXNuLXz5AztlbkCM/SEq
	+wKxokT/3O+++NKYWBYo7jggu5LtLfkWoCnG5TrW5TDSR3ox0H9V5ejQkxYu5/0hxa2hw1ams31Zk
	4R+imBJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIU2F-004oxC-AW; Thu, 19 Jan 2023 12:28:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIU27-004ovX-Mc; Thu, 19 Jan 2023 12:28:45 +0000
Received: from wf0783.dip.tu-dresden.de ([141.76.183.15] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pIU0w-0002qB-4T; Thu, 19 Jan 2023 13:27:30 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Han Xu <han.xu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Li-hao Kuo <lhjeff911@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?utf-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>,
 Vaishnav Achath <vaishnav.a@ti.com>,
 Parshuram Thombare <pthombar@cadence.com>,
 Leilk Liu <leilk.liu@mediatek.com>, Gabor Juhos <juhosg@openwrt.org>,
 Bert Vermeulen <bert@biot.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Marek Vasut <marex@denx.de>, Birger Koblitz <mail@birger-koblitz.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Anson Huang <Anson.Huang@nxp.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Kuldeep Singh <singh.kuldeep87k@gmail.com>,
 Pragnesh Patel <pragnesh.patel@sifive.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Erwan Leray <erwan.leray@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] spi: dt-bindings: drop unneeded quotes
Date: Thu, 19 Jan 2023 13:27:26 +0100
Message-ID: <4772603.GXAFRqVoOG@phil>
In-Reply-To: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_042843_772580_E38E9473 
X-CRM114-Status: GOOD (  13.69  )
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

Am Mittwoch, 18. Januar 2023, 18:39:31 CET schrieb Krzysztof Kozlowski:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[...]

> diff --git a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
> index 66e49947b703..e4941e9212d1 100644
> --- a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
> @@ -11,7 +11,7 @@ description:
>    as flash and display controllers using the SPI communication interface.
>  
>  allOf:
> -  - $ref: "spi-controller.yaml#"
> +  - $ref: spi-controller.yaml#
>  
>  maintainers:
>    - Heiko Stuebner <heiko@sntech.de>

For Rockchip:
Reviewed-by: Heiko Stuebner <heiko@sntech.de>



