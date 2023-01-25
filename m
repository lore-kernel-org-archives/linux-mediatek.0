Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4473CC54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 20:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kqCnvG5HfBYMdFzmIrllsGYjZVwDWefqF05Cmky4HA=; b=cxroTvAmdQMB8SYV6iD4KNfo1o
	rmVdUIuqQhm4cAM6uQxhhV+kWXVTUFD6/XzQVK8eXH0D3exPRaFrO1RvNPxnIHbNXn7Becr2NMHTs
	tO9bXJMRvMy9bzyWhABwk/J4cIqiWEjIvne5UyTPhsuTjOa5EfTmOgVWl5yb1vdWhpfw5DScfIueD
	Sov0+2DraKo4xKfqZ3LfHw9PlhIbgbz5z7OmeOxiZ6o16ol2zwnPH86jXGWrurXdyKyPn02fcCKSt
	VxSrQmVanfo3UUNX+8bql1dx6P2uju68SiwrKbpwpbkuHLsjmNQPdVY/3Qv7tLQe93F42bifg7f4Q
	mX4dMzCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKm59-008aPW-Jb; Wed, 25 Jan 2023 20:09:19 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKm1g-008YrJ-Lt; Wed, 25 Jan 2023 20:05:46 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-16332831ed0so3121567fac.10;
        Wed, 25 Jan 2023 12:05:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kqCnvG5HfBYMdFzmIrllsGYjZVwDWefqF05Cmky4HA=;
        b=lLN+jQRntNFZo/uR+GKt5yunH0FQKe7Wl6ejhVITuSKSfkqRsBj6hWkglvDFuqOaaO
         lyVeYpK2gTTxOtcXi6stg0ltGBwSyvGeY/QNGjMFYitMA1vBYTkjkOrEcNQhbRbIvpN+
         KtZBlN4PQSNsXwAXc1k7o4oph6hONtwU6PHkDWWBSYjDShtrYzZfS7k1zNpiMGxSqzpF
         qqloLAuQmDMqxIlS3yIyHl4sOA946Ervkbknj0aFJknjdhUeBrt7RFjfowAaOBkHidsI
         Pev5+eX7dp+AdVPmj3XLqguRlbHjBTFEUja78sN4V6Tr5EptNLWi0kl/eYnuDEihfzOi
         QaPg==
X-Gm-Message-State: AO0yUKUN1Qp3aIdpdcy9L90m2FKHnrBhZK4I0EV1fY0Z27fkfQjVHBmR
	DDcPZVf0GRSi7AU4tFF1bw==
X-Google-Smtp-Source: AK7set+KlYA9hOhKxY3yXbw1+jJFui+axb/K8qUGpNYSrXD6fL93Qjufe/ZRHNh9bIxZbHxYbUPr4A==
X-Received: by 2002:a05:6870:14d5:b0:163:45a2:e276 with SMTP id l21-20020a05687014d500b0016345a2e276mr684576oab.9.1674677142691;
        Wed, 25 Jan 2023 12:05:42 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n20-20020a056870559400b0010d7242b623sm2325869oao.21.2023.01.25.12.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 12:05:42 -0800 (PST)
Received: (nullmailer pid 2768672 invoked by uid 1000);
	Wed, 25 Jan 2023 20:05:39 -0000
Date: Wed, 25 Jan 2023 14:05:39 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sunxi@lists.linux.dev, openbmc@lists.ozlabs.org, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Michal Simek <michal.simek@xilinx.com>, 
	Li-hao Kuo <lhjeff911@gmail.com>, Han Xu <han.xu@nxp.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Yogesh Gaur <yogeshgaur.83@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Birger Koblitz <mail@birger-koblitz.de>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	", Bert Vermeulen" <bert@biot.com>, Marek Vasut <marex@denx.de>, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Palmer Dabbelt <palmer@dabbelt.com>, 
	", Christophe Kerello" <christophe.kerello@foss.st.com>, linux-arm-kernel@lists.infradead.org, 
	Haibo Chen <haibo.chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Kamal Dasu <kdasu.kdev@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-arm-msm@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Vaishnav Achath <vaishnav.a@ti.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	", Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andy Gross <agross@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Andrew Jeffery <andrew@aj.id.au>, linux-spi@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Pragnesh Patel <pragnesh.patel@sifive.com>, 
	linux-riscv@lists.infradead.org, Leilk Liu <leilk.liu@mediatek.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, 
	Joel Stanley <joel@jms.id.au>, Shawn Guo <shawnguo@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, 
	Serge Semin <fancer.lancer@gmail.com>, linux-aspeed@lists.ozlabs.org, 
	Gabor Juhos <juhosg@openwrt.org>, Anson Huang <Anson.Huang@nxp.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Erwan Leray <erwan.leray@foss.st.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Kuldeep Singh <singh.kuldeep87k@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Maxime Ripard <mripard@kernel.org>, Parshuram Thombare <pthombar@cadence.com>, 
	", Fabio Estevam" <festevam@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 2/2] spi: dt-bindings: cleanup examples - indentation,
 lowercase hex
Message-ID: <167467713905.2768614.7865748447151198568.robh@kernel.org>
References: <20230124083342.34869-1-krzysztof.kozlowski@linaro.org>
 <20230124083342.34869-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124083342.34869-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_120544_760910_16A33F1D 
X-CRM114-Status: GOOD (  13.58  )
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


On Tue, 24 Jan 2023 09:33:42 +0100, Krzysztof Kozlowski wrote:
> Cleanup examples:
>  - use 4-space indentation (for cases when it is neither 4 not 2 space),
>  - drop redundant blank lines,
>  - use lowercase hex.
> 
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au> # aspeed
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org> # meson
> 
> ---
> 
> Changes since v1:
> 1. Adjust indentation in two more examples (cdns,qspi-nor, st,stm32-spi)
> 2. Add tags
> ---
>  .../bindings/spi/amlogic,meson-gx-spicc.yaml  |  26 +--
>  .../bindings/spi/amlogic,meson6-spifc.yaml    |  22 +--
>  .../bindings/spi/aspeed,ast2600-fmc.yaml      |  24 +--
>  .../bindings/spi/brcm,spi-bcm-qspi.yaml       | 156 +++++++++---------
>  .../bindings/spi/cdns,qspi-nor.yaml           |  34 ++--
>  .../bindings/spi/nvidia,tegra210-quad.yaml    |  42 ++---
>  .../bindings/spi/qcom,spi-qcom-qspi.yaml      |   1 -
>  .../devicetree/bindings/spi/renesas,rspi.yaml |  22 +--
>  .../bindings/spi/spi-sunplus-sp7021.yaml      |   4 +-
>  .../devicetree/bindings/spi/st,stm32-spi.yaml |  23 ++-
>  10 files changed, 176 insertions(+), 178 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

