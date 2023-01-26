Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0917C54E94
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 00:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jJVbzqfpd/u3pdgtYSrMBE/uEVAbiFch2tCk7ZiZZU=; b=1bVWbyvwy6eGJd9OaaG+r+yWqc
	JWOf8VTiuL574q5gwK63+FaGi3elqnutDwT4UouGzEbZ2zeFvKxwSiIzmwyZWH2vpY50Mc8lgwiLY
	BdfIrNVoTteQSZAGOxH95nntD6Qe2C43+8dKuYt0CByV89tlynzIaCY2cEWClqGI8qxaBGdjtRx0T
	ViPRBtjZqNlnAPOXS5YL7atvac/muBTBv09658boV+648LXyOH7uig6m6laabuQebT4SYRgUaeHww
	ePGQsK5/UPrMvp2RHep531pERO8R1rxm2qkTmWsbkibvwvE7+ZPOCqflyACJ8MlDw0sBA4e06iBkC
	N85iqRGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKq5G-009BBk-KX; Thu, 26 Jan 2023 00:25:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKq5D-009B9z-7h; Thu, 26 Jan 2023 00:25:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B913DB81C04;
	Thu, 26 Jan 2023 00:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A33C433D2;
	Thu, 26 Jan 2023 00:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674692736;
	bh=rcUgsNadKKTYCHHFUAWb2M6WYShRxFqUqgbGPO0Ctyo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=USfPHSeVEkf75rA9BZhlvuBgt3C7xXOJz8CoJRO6VnKLCjKvOAvSuVOAAHVjwSZuH
	 JX2uNAzawrEKpN+IqKJBN8lZGMGtxJCIlcga2OR/Jokxood0zP+0bznprQUUG8DKwD
	 QQ4K8QcBAABfVqaYdZkX1GDNvLDUpOqo8lT76FcMgCjtCOTzSgIuGkJP+fXUzUf6dD
	 100h5T1y3ypmPfXHYY5ic0/FD44fBeYBRbgvrs6b+RGsQdN+Y9IGXhlnFK4zWS8fRh
	 7XQZeHxve4rzsEvNEN1VoemmfZArPIZ/VVHfPgRMbQaX3uomO1YRRPxzlGNr8JKnr3
	 01bMP8uE6lW7Q==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
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
 Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Li-hao Kuo <lhjeff911@gmail.com>, 
 Michal Simek <michal.simek@xilinx.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?=EF=BF=BDecki?= <rafal@milecki.pl>, 
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
Cc: Rob Herring <robh@kernel.org>
In-Reply-To: <20230124083342.34869-1-krzysztof.kozlowski@linaro.org>
References: <20230124083342.34869-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/2] spi: dt-bindings: drop unneeded quotes
Message-Id: <167469271489.2661317.15374060752399847689.b4-ty@kernel.org>
Date: Thu, 26 Jan 2023 00:25:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_162539_589485_2F34E554 
X-CRM114-Status: GOOD (  14.15  )
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

On Tue, 24 Jan 2023 09:33:41 +0100, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> 

Applied to

   broonie/spi.git for-next

Thanks!

[1/2] spi: dt-bindings: drop unneeded quotes
      commit: 99a7fa0e75a3a595a577fb5efa4b84a491f664a2
[2/2] spi: dt-bindings: cleanup examples - indentation, lowercase hex
      commit: ee8d422c91d87ebe230769b2cb89f087e56b560a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


