Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3B9C7618E
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 05:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVwWFYNOUpttDslpgP4cG/h6dgZtNdHraplIo7YV21s=; b=fHaQrrwLUFnIY8KWQyd1LKQ6rU
	iAbqLhSrVpCffivZHzIrosATNwN7a2HEOiAV73jfbmoxCCZTRl12in+5i5mCgi3JN7+wJn65HE8oU
	jt0b/r3Nwjox630DyNzkeJybXNNUASYp4xkHtN7nsH1wwVxRAHVf1CxOA8pIlvuo1xf9TVFINBoAJ
	04ln22z2pSkI5mqPljAlBnWPfAwZ6JOsLioAhnvgegRHpF9h4BedzdVYO5tFQDuy0YrXSQEqbrq9D
	d7uf9l3b3h5sVy4TTQXzwRK65jS8DO1Kd/xD1IL3h4fVp6ZhnEEKpY2dUVjVervND3EajoMl9Qa9c
	OIsB2Vkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdlq6-0062D2-0q;
	Sun, 19 Mar 2023 05:44:18 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdlq1-0062Bw-1K;
	Sun, 19 Mar 2023 05:44:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 1208A4290B;
	Sun, 19 Mar 2023 05:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1679204651; bh=nmQYCH8MESnpDqmsBeC0nb09vJeuV+/eGjlJtgetivU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=e5a28q3gvJAr1MM54YJhJQ5V4B48+W2oERepRtJDpICJDsFAaAj9jprfh7Stw6sNH
	 5jMblYon1oMC7DdGCHhUEePKX6BpAeD4xwamrmgOEDJYUDqx3Ro8/FxUgMnRNEJMA1
	 Al1vExaxN2FWjk9wxn1+3xhn9ITxkC/2q3+Eoga6C7wtPjl71VOrqvp9Vu4vRzqLno
	 BTC2FzyQf2De/IXeSnHE1jtQqOB/FXNbz4a2vy7DyyTkhAR5OF316A/mbWIa8ZnqGn
	 zFNsmg9I/FpA14ify7luT4zb/v/4XvdiKHPVTY40/nkdd9tn9jFVAsBIUMWdZbp7A4
	 w5OThYFf0fqhA==
Message-ID: <9e400998-b0a6-9208-53d1-371bade2f50b@marcan.st>
Date: Sun, 19 Mar 2023 14:44:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dt-bindings: nvmem: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vincent Shih <vincent.sunplus@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mediatek@lists.infradead.org
References: <20230317233640.3968821-1-robh@kernel.org>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20230317233640.3968821-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_224413_629641_2334C406 
X-CRM114-Status: GOOD (  13.90  )
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

On 18/03/2023 08.36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml      | 2 +-
>  Documentation/devicetree/bindings/nvmem/apple,efuses.yaml       | 2 +-
>  Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml         | 2 +-
>  Documentation/devicetree/bindings/nvmem/fsl,layerscape-sfp.yaml | 2 +-
>  Documentation/devicetree/bindings/nvmem/imx-iim.yaml            | 2 +-
>  Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml          | 2 +-
>  .../devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml         | 2 +-
>  Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml     | 2 +-
>  .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml       | 2 +-
>  Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml          | 2 +-
>  Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml       | 2 +-
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml        | 2 +-
>  Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml     | 2 +-
>  Documentation/devicetree/bindings/nvmem/rmem.yaml               | 2 +-
>  Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml     | 2 +-
>  .../devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml     | 2 +-
>  Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml     | 2 +-
>  .../devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml         | 2 +-
>  18 files changed, 18 insertions(+), 18 deletions(-)
> 

For apple:
Acked-by: Hector Martin <marcan@marcan.st>

> diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> index 14c170c6a86e..296001e7f498 100644
> --- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
> @@ -11,7 +11,7 @@ maintainers:
>    - Maxime Ripard <mripard@kernel.org>
>  
>  allOf:
> -  - $ref: "nvmem.yaml#"
> +  - $ref: nvmem.yaml#
>  
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml b/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
> index 5ec8f2bdb3a5..e0860b6b85f3 100644
> --- a/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
> @@ -15,7 +15,7 @@ maintainers:
>    - Sven Peter <sven@svenpeter.dev>
>  
>  allOf:
> -  - $ref: "nvmem.yaml#"
> +  - $ref: nvmem.yaml#
>  
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml b/Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml
> index 25033de3ef6b..36def7128fca 100644
> --- a/Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml
> @@ -20,7 +20,7 @@ maintainers:
>    - Rafał Miłecki <rafal@milecki.pl>
>  
>  allOf:
> -  - $ref: "nvmem.yaml#"
> +  - $ref: nvmem.yaml#
>  
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/fsl,layerscape-sfp.yaml b/Documentation/devicetree/bindings/nvmem/fsl,layerscape-sfp.yaml
> index 3b4e6e94cb81..70fb2ad25103 100644
> --- a/Documentation/devicetree/bindings/nvmem/fsl,layerscape-sfp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/fsl,layerscape-sfp.yaml
> @@ -14,7 +14,7 @@ description: |
>    unique identifier per part.
>  
>  allOf:
> -  - $ref: "nvmem.yaml#"
> +  - $ref: nvmem.yaml#
>  
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/imx-iim.yaml b/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
> index 7aac1995cfaf..e9d9d8df4811 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/imx-iim.yaml
> @@ -14,7 +14,7 @@ description: |
>    i.MX25, i.MX27, i.MX31, i.MX35, i.MX51 and i.MX53 SoCs.
>  
>  allOf:
> -  - $ref: "nvmem.yaml#"
> +  - $ref: nvmem.yaml#
>  
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> index d0a239d7e199..9876243ff1e8 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> @@ -15,7 +15,7 @@ description: |
>    i.MX7D/S, i.MX7ULP, i.MX8MQ, i.MX8MM, i.MX8MN and i.MX8MP SoCs.
>  
>  allOf:
> -  - $ref: "nvmem.yaml#"
> +  - $ref: nvmem.yaml#
>  
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
> index fe2cd7f1afba..e89fd879c968 100644
> --- a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>  
>  allOf:
> -  - $ref: "nvmem.yaml#"
> +  - $ref: nvmem.yaml#
>  
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> index 75e0a516e59a..d16d42fb98b6 100644
> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -15,7 +15,7 @@ maintainers:
>    - Lala Lin <lala.lin@mediatek.com>
>  
>  allOf:
> -  - $ref: "nvmem.yaml#"
> +  - $ref: nvmem.yaml#
>  
>  properties:
>    $nodename:
> diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> index c3c96fd0baac..a296d348adb4 100644
> --- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> @@ -15,7 +15,7 @@ description: |
>    settings, chip identifiers) or user specific data could be stored.
>  
>  allOf:
> -  - $ref: "nvmem.yaml#"
> +  - $ref: nvmem.yaml#
>  
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
> index ff317fd7c15b..8938eec22b52 100644
> --- a/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Anson Huang <Anson.Huang@nxp.com>
>  
>  allOf:
> -  - $ref: "nvmem.yaml#"
> +  - $ref: nvmem.yaml#
>  
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml b/Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml
> index f93bc50c40d7..6c26800f8b79 100644
> --- a/Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml
> @@ -17,7 +17,7 @@ maintainers:
>    - Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
>  
>  allOf:
> -  - $ref: "nvmem.yaml#"
> +  - $ref: nvmem.yaml#
>  
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index 2173fe82317d..e952907ad1d5 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>  
>  allOf:
> -  - $ref: "nvmem.yaml#"
> +  - $ref: nvmem.yaml#
>  
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml b/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
> index e08504ef3b6e..34818683f80c 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
> @@ -15,7 +15,7 @@ description: |
>    to/from the PBUS.
>  
>  allOf:
> -  - $ref: "nvmem.yaml#"
> +  - $ref: nvmem.yaml#
>  
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/rmem.yaml b/Documentation/devicetree/bindings/nvmem/rmem.yaml
> index a4a755dcfc43..38a39c9b8c1c 100644
> --- a/Documentation/devicetree/bindings/nvmem/rmem.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/rmem.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>  
>  allOf:
> -  - $ref: "nvmem.yaml#"
> +  - $ref: nvmem.yaml#
>  
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> index febee8129aa9..c5403e149080 100644
> --- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Heiko Stuebner <heiko@sntech.de>
>  
>  allOf:
> -  - $ref: "nvmem.yaml#"
> +  - $ref: nvmem.yaml#
>  
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
> index dc790d2cd9f0..b8bca0599c45 100644
> --- a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
> @@ -11,7 +11,7 @@ maintainers:
>    - Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
>  
>  allOf:
> -  - $ref: "nvmem.yaml#"
> +  - $ref: nvmem.yaml#
>  
>  properties:
>    "#address-cells": true
> diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
> index 172597cc5c63..a69de3e92282 100644
> --- a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
> @@ -16,7 +16,7 @@ maintainers:
>    - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>  
>  allOf:
> -  - $ref: "nvmem.yaml#"
> +  - $ref: nvmem.yaml#
>  
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml
> index a7644ebbc2ca..8877c2283e9e 100644
> --- a/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml
> @@ -11,7 +11,7 @@ maintainers:
>    - Vincent Shih <vincent.sunplus@gmail.com>
>  
>  allOf:
> -  - $ref: "nvmem.yaml#"
> +  - $ref: nvmem.yaml#
>  
>  properties:
>    compatible:


- Hector

