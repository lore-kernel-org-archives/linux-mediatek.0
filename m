Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E7BC05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 20:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9JOc294Un2/0rB0FUKryYqic16naXseJPC92bOtRF0=; b=RrfYeceaU0Q6LSMyQUMZYeclYX
	e8w5RT/wvxr3MDK+eLce2T3q98jYYXN+2u94QldZE2c6Oba26/iyvhrR65udgflHlLBWKTEiYf3Pf
	frX9crZau2DgZpQShcM/nLA998lTUrcYxznvnbBvUeRtGxvdeXM8dwwCi3/u00lVAeUoRhUb7O50q
	3BhLaFqc2oUBRLKSUO755sS/VzVOQnmvS+dJEcQlmeORSk/WrJCgkFBn5DH2FKH/wJZ1N8biPxrEW
	GCai+yV/Kv3izfYWkR30EtJqE6Ig1+FbhkcQZZlOUHOYmFABqrCOpVUd8gxy2QZuXASioYd4pTLXB
	+QKo2f8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK3Ds-001Hk8-EB; Mon, 23 Jan 2023 20:15:20 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK3Dm-001Hi4-BL; Mon, 23 Jan 2023 20:15:15 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-15fe106c7c7so9212145fac.8;
        Mon, 23 Jan 2023 12:15:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9JOc294Un2/0rB0FUKryYqic16naXseJPC92bOtRF0=;
        b=g/+DDpT84iZfFj0fqmHtvSzVJl1CIwD3Ak9m+AGQULd0VMLg+dAZU3C8L93JlaIz8i
         HQtnYSVLTHYWAyPM5pw5GMnMoNZsQpKqCtGp1ndeZMXjJVVF3gVmCfdb8pN3wCY5QSqt
         Kzy1yhdGQFN4xhd/VwilchI+HXoWJzdibe7osVyf4wl16goi4ASQRUGLV4yx95modL1a
         ov4/M3XG9wX/Mh4hPQos7jxRFHdMeFL5i1EdsG9YU0KAMurmfV1fmSI/6pBCaVLCC4og
         VcCdYt5tWyrClb3uTcF3AJ7whHfyybqFwrCUfzQSAygoM0qlYrJJv0yiTko+Dq1pCYR7
         Qecg==
X-Gm-Message-State: AFqh2kpMgoHfY7P38xFATzAUch2LOUTcDjgjssSBBLbJXhFmT54rZiOF
	om8NQkq4QF62R4IhOnbyFAKTagK2BQ==
X-Google-Smtp-Source: AMrXdXv7/0UWYAVSm7F28zXqx2erH3WvlYts86KO/fBElTBfrToCx8V4nVQwijpoo96jnpY39d8zVA==
X-Received: by 2002:a05:6871:4506:b0:154:988a:d32d with SMTP id nj6-20020a056871450600b00154988ad32dmr14480326oab.27.1674504910165;
        Mon, 23 Jan 2023 12:15:10 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b10-20020a056870390a00b001435fe636f2sm25818920oap.53.2023.01.23.12.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 12:15:09 -0800 (PST)
Received: (nullmailer pid 2450508 invoked by uid 1000);
	Mon, 23 Jan 2023 20:15:07 -0000
Date: Mon, 23 Jan 2023 14:15:07 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Yogesh Gaur <yogeshgaur.83@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Leilk Liu <leilk.liu@mediatek.com>, Bert Vermeulen <bert@biot.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-arm-kernel@lists.infradead.org, 
	Jerome Brunet <jbrunet@baylibre.com>, =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, 
	Samuel Holland <samuel@sholland.org>, linux-rockchip@lists.infradead.org, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
	Kamal Dasu <kdasu.kdev@gmail.com>, linux-sunxi@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Han Xu <han.xu@nxp.com>, 
	Birger Koblitz <mail@birger-koblitz.de>, Andy Gross <agross@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-riscv@lists.infradead.org, 
	Kevin Hilman <khilman@baylibre.com>, Joel Stanley <joel@jms.id.au>, 
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, openbmc@lists.ozlabs.org, 
	linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org, 
	Andrew Jeffery <andrew@aj.id.au>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Fabio Estevam <festevam@gmail.com>, 
	Li-hao Kuo <lhjeff911@gmail.com>, Michal Simek <michal.simek@xilinx.com>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, Erwan Leray <erwan.leray@foss.st.com>, 
	Marek Vasut <marex@denx.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-aspeed@lists.ozlabs.org, 
	Parshuram Thombare <pthombar@cadence.com>, linux-amlogic@lists.infradead.org, 
	Serge Semin <fancer.lancer@gmail.com>, linux-tegra@vger.kernel.org, 
	Haibo Chen <haibo.chen@nxp.com>, Gabor Juhos <juhosg@openwrt.org>, 
	Christophe Kerello <christophe.kerello@foss.st.com>, Maxime Ripard <mripard@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Pragnesh Patel <pragnesh.patel@sifive.com>, 
	Kuldeep Singh <singh.kuldeep87k@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Vaishnav Achath <vaishnav.a@ti.com>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-arm-msm@vger.kernel.org, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 1/2] spi: dt-bindings: drop unneeded quotes
Message-ID: <167450490674.2450465.12158974323906034097.robh@kernel.org>
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_121514_413970_1244798D 
X-CRM114-Status: GOOD (  12.00  )
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


On Wed, 18 Jan 2023 18:39:31 +0100, Krzysztof Kozlowski wrote:
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
>  .../devicetree/bindings/spi/cdns,qspi-nor.yaml |  2 +-
>  .../devicetree/bindings/spi/cdns,xspi.yaml     |  6 +++---
>  .../bindings/spi/fsl,spi-fsl-qspi.yaml         |  2 +-
>  .../devicetree/bindings/spi/fsl-imx-cspi.yaml  |  2 +-
>  .../bindings/spi/mediatek,spi-mt65xx.yaml      |  2 +-
>  .../spi/mediatek,spi-slave-mt27xx.yaml         |  2 +-
>  .../bindings/spi/mikrotik,rb4xx-spi.yaml       |  2 +-
>  .../bindings/spi/mxicy,mx25f0a-spi.yaml        |  2 +-
>  .../devicetree/bindings/spi/mxs-spi.yaml       |  2 +-
>  .../bindings/spi/nvidia,tegra210-quad.yaml     |  2 +-
>  .../bindings/spi/qcom,spi-qcom-qspi.yaml       |  5 ++---
>  .../bindings/spi/realtek,rtl-spi.yaml          |  2 +-
>  .../bindings/spi/snps,dw-apb-ssi.yaml          |  2 +-
>  .../devicetree/bindings/spi/spi-cadence.yaml   |  2 +-
>  .../devicetree/bindings/spi/spi-fsl-lpspi.yaml |  2 +-
>  .../devicetree/bindings/spi/spi-gpio.yaml      |  4 ++--
>  .../devicetree/bindings/spi/spi-mux.yaml       |  4 ++--
>  .../devicetree/bindings/spi/spi-nxp-fspi.yaml  |  2 +-
>  .../devicetree/bindings/spi/spi-pl022.yaml     | 18 +++++++++---------
>  .../devicetree/bindings/spi/spi-rockchip.yaml  |  2 +-
>  .../devicetree/bindings/spi/spi-sifive.yaml    |  6 +++---
>  .../bindings/spi/spi-sunplus-sp7021.yaml       |  2 +-
>  .../devicetree/bindings/spi/spi-xilinx.yaml    |  2 +-
>  .../bindings/spi/spi-zynqmp-qspi.yaml          |  2 +-
>  .../devicetree/bindings/spi/sprd,spi-adi.yaml  |  5 ++---
>  .../devicetree/bindings/spi/st,stm32-qspi.yaml |  2 +-
>  .../devicetree/bindings/spi/st,stm32-spi.yaml  |  2 +-
>  .../bindings/spi/xlnx,zynq-qspi.yaml           |  2 +-
>  33 files changed, 53 insertions(+), 55 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

