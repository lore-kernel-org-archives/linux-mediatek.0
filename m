Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C92C25B50
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 20:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EY7We4I2hSyd2pZ0VulkHT4dyOP0LEqk/GnlS4AQK4k=; b=pyl0LLLkvrl8UWw0D3XBagt3u9
	iIthXPExEQYEhTod1Iv9zv24tPQoNluwNFN6Gys5sDRMHz775kI9UFhaxYISzr3o0v1XjlaNyTmQj
	sBKZF2LcMia6cT+BOk7aIVm0en2lhmJcvKfLPlchVH62Uxj14ZHH6mgUQwfn6cjyh4tL7M0RmTEol
	T7RMrkXFPqS/LVt3Q/T5BNErjhOaZs8o1q0XPH298Qlk5WkUSTFhQeH1cPvH3a1/181bk7IZz0N8+
	zrU7dx4BNWQXKLP0caIvf6j6IY5eozDY5KFT53ZLmM2E5MD0ucWGITNGO1E3omY4odiovWOFuV850
	8h90QLtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK3GW-001I65-HV; Mon, 23 Jan 2023 20:18:04 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK3GQ-001I47-QQ; Mon, 23 Jan 2023 20:18:02 +0000
Received: by mail-oi1-f182.google.com with SMTP id s66so11422828oib.7;
        Mon, 23 Jan 2023 12:17:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EY7We4I2hSyd2pZ0VulkHT4dyOP0LEqk/GnlS4AQK4k=;
        b=W7UOJ7ZUtwEzzdtiLHWQNkZCAz6zJkPBhDKLQNPIS59r6x7bEhnBSj0vMdWYxgQ1He
         W+F6jkSWRhOJfiF+to0nPvziurj1MqHjsKQhwx4AoXIeUDSy2p/FfThl1kdpUx/ovKGm
         vmjZICOkySg+NGw6ii0uOhtI8ac3fL+sosnkCEFDXcvA02FQMVFBUuW950DxrQZcQAIt
         Wp0x8AdhZydrKhni6+uFPo855DY6mC6DQfGNrFbs/s9R8Y9gmKrVeZOA4QJreKlwZdqP
         f83sBmY/B/3kfs948co/wJ/eQCW1MV5VOvQ80PwOHJHWRnppHg9Kot53k/SMRGqPWq6t
         t6hw==
X-Gm-Message-State: AFqh2kpa9rV+YyvT+0XH03WPMRx1HuADQVe7/t66pbaFTCKNea5OFH8a
	u9I0z0y6/52/8igi1HBEnA==
X-Google-Smtp-Source: AMrXdXuvPUKWyC8RGNKpvhdFpfXGmbs7xnQ1zVyMxDHfPRH77j6ghKDaBa0O8cM4huncdcgY7ZWv7g==
X-Received: by 2002:a05:6808:f14:b0:364:e9f4:9dd with SMTP id m20-20020a0568080f1400b00364e9f409ddmr15059505oiw.47.1674505074502;
        Mon, 23 Jan 2023 12:17:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i11-20020aca2b0b000000b00369a721732asm124660oik.41.2023.01.23.12.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 12:17:54 -0800 (PST)
Received: (nullmailer pid 2454148 invoked by uid 1000);
	Mon, 23 Jan 2023 20:17:51 -0000
Date: Mon, 23 Jan 2023 14:17:51 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Serge Semin <fancer.lancer@gmail.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Li-hao Kuo <lhjeff911@gmail.com>, Michal Simek <michal.simek@xilinx.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, 
	Vaishnav Achath <vaishnav.a@ti.com>, Parshuram Thombare <pthombar@cadence.com>, 
	Leilk Liu <leilk.liu@mediatek.com>, Gabor Juhos <juhosg@openwrt.org>, 
	Bert Vermeulen <bert@biot.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Marek Vasut <marex@denx.de>, 
	Birger Koblitz <mail@birger-koblitz.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Anson Huang <Anson.Huang@nxp.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Kuldeep Singh <singh.kuldeep87k@gmail.com>, Pragnesh Patel <pragnesh.patel@sifive.com>, 
	Christophe Kerello <christophe.kerello@foss.st.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Erwan Leray <erwan.leray@foss.st.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/2] spi: dt-bindings: cleanup examples - indentation,
 lowercase hex
Message-ID: <20230123201751.GA2450665-robh@kernel.org>
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
 <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_121800_769419_00999FE8 
X-CRM114-Status: GOOD (  16.13  )
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

On Wed, Jan 18, 2023 at 06:39:32PM +0100, Krzysztof Kozlowski wrote:
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
>  .../bindings/spi/brcm,spi-bcm-qspi.yaml       | 156 +++++++++---------
>  .../bindings/spi/cdns,qspi-nor.yaml           |   4 +-
>  .../bindings/spi/nvidia,tegra210-quad.yaml    |  42 ++---
>  .../bindings/spi/qcom,spi-qcom-qspi.yaml      |   1 -
>  .../devicetree/bindings/spi/renesas,rspi.yaml |  22 +--
>  .../bindings/spi/spi-sunplus-sp7021.yaml      |   4 +-
>  .../devicetree/bindings/spi/st,stm32-spi.yaml |   1 -
>  10 files changed, 150 insertions(+), 152 deletions(-)

[...]

> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> index d35c6f7e2dd5..18afdaab946d 100644
> --- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
> @@ -95,7 +95,6 @@ examples:
>               <&dmamux1 1 40 0x400 0x05>;
>        dma-names = "rx", "tx";
>        cs-gpios = <&gpioa 11 0>;

Looks like the indentation needs adjusting here.

> -
>      };
>  
>  ...
> -- 
> 2.34.1
> 

