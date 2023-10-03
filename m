Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB74E7542D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 07:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wvbK6s7OvtDcWmvoxppQzOHIcOTeHzaR32GGWBnZZE=; b=xa9dnYNrhcDd6DCyF3uoETKrXJ
	jblloKJDdhAAmYEN/cljx5EkgNmOuKW1EgBjrtANiTYu0dzfFFbX6XpkycmqMgMYQeQwBzrGiSFwU
	z55XGjnPfQ+Lju8eqR7jzLkTvdapZ176yJQB+NLgPSyeCnWqfqApMmhsLPHsWC1CvtxpKZr3OxWBu
	jlZwQ3ThTRM6+OCXMwN5lNI+TyICUSwOsJaPLmYZlBGwh2+XlDmyloBeRdlH3G0udDrbMNAeNMXIN
	j2eXbA8ilZ6ZycphpqzBH6ow7oX4GZrHnkGq0jNZGw/vhNiCoMWTpQ/o8OPF+KzTzDmZUH9hJvtUq
	kn1LCDWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qna12-00E0c8-2m;
	Tue, 03 Oct 2023 07:40:24 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qna0w-00E0YM-0J
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Oct 2023 07:40:22 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3231d6504e1so605449f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Oct 2023 00:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696318814; x=1696923614; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wvbK6s7OvtDcWmvoxppQzOHIcOTeHzaR32GGWBnZZE=;
        b=c1eRYqTS6gPUrTSkvQu8LV6E3nPh0bSYl+tizjQZdGqmEfVWvNrvqsSzcHHD7LM1DV
         duD6OA8eZyuxNY4BJ4JvXIne82tKCxNwKQPbDHP5IgSPhyk5kc59vCS2rLA9nmQyIpfA
         kpVZEEl080ZBeU64gzMc2H7HeloD9jzLnrzfC9QtwOUBm6+nUl8JYo6tdXYmceqqM5l+
         mf6WvsT5UsQ/Mz0s+pl5AsdWNnujZRiSI3/I3fMhUCB/y8qBEotEWlWZHwuWrRg7mH9c
         9BZHQsYIwsptLQQ5JKdEqt2cI3ZxlkyWP6Sp2oDH1h16aLmYAeIpZvFQ3KnBS+dMvAMB
         AkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696318814; x=1696923614;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2wvbK6s7OvtDcWmvoxppQzOHIcOTeHzaR32GGWBnZZE=;
        b=MDJRLclYCupeW38Llc3POPc3I9aXdQEDFOgFFG2Em/kx5o0/jjHPqmRgjXd+9uFx/o
         AZeHPZG6gerqSLzwU8cBmGEV0WvGgHNssMo4Xso6LW9JIEUGDZWfQ7LlgrMBA6wWMxUx
         V4zWGXa62xDLbe7Tyws7mXWwAhpxvtp2s6+bbRXGRqTA2ALOdcfmOJOIr9kABCJzZLi4
         PectDbXsRi19rinrNX1Mf4Ltg4v2WwGKUN9Z1CL+TuGVmaE8z3fUh8iXPgk9K6M9EJ6v
         y6LxWpiFv079O4qc6PEdOSEisBA3agP3E3uvCxYT7Sx0ouAe6bFhIvxRFUFgztabL+R/
         HocQ==
X-Gm-Message-State: AOJu0YxihnEAx/A6CTaanl83jiJ3VbqPe/nSG0b6chfwwIO+ql+Jagkm
	aR3stFncayIj+J8eFPe9cfZOvQ==
X-Google-Smtp-Source: AGHT+IEpIvjpG2kKdpSMfKhuVOJyQlosAaPrtTQ17ctuZLYtHvqlbO1nckJJyR4yES1hfLCC0GkUOQ==
X-Received: by 2002:a05:6000:1005:b0:319:7b66:7800 with SMTP id a5-20020a056000100500b003197b667800mr10795957wrx.55.1696318814255;
        Tue, 03 Oct 2023 00:40:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e31a:fe1c:e925:9858? ([2a01:e0a:982:cbb0:e31a:fe1c:e925:9858])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600012c700b0031c52e81490sm884647wrx.72.2023.10.03.00.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 00:40:13 -0700 (PDT)
Message-ID: <7c18a0f6-48a9-4ec9-90d0-3fe7268e93ad@linaro.org>
Date: Tue, 3 Oct 2023 09:40:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH V2] dt-bindings: nvmem: move deprecated cells binding to
 its own file
Content-Language: en-US, fr
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Vincent Shih <vincent.sunplus@gmail.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Christian Marangi <ansuelsmth@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>, Komal Bajaj <quic_kbajaj@quicinc.com>,
 Kumar Thella <sthella@codeaurora.org>,
 Keiji Hayashibara <hayashibara.keiji@socionext.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20231003064018.7502-1-zajec5@gmail.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20231003064018.7502-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_004018_173400_544C5393 
X-CRM114-Status: GOOD (  19.91  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 03/10/2023 08:40, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Support for old NVMEM fixed cells was deprecated in favour of
> "fixed-layout". It's still part of the nvmem.yaml though and may be
> unknowingly used by new bindings added without much of analyze.
> 
> To make it more difficult to accidentally support old syntax move its
> binding to separated file with "deprecated" in its name.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Fix path to nvmem-deprecated-cells.yaml in amlogic,meson6-rtc.yaml
> 
>   .../devicetree/bindings/mtd/mtd.yaml          |  7 ++++-
>   .../bindings/mtd/partitions/nvmem-cells.yaml  |  1 +
>   .../nvmem/amlogic,meson-gxbb-efuse.yaml       |  1 +
>   .../bindings/nvmem/amlogic,meson6-efuse.yaml  |  1 +

For Amlogic/Meson bindings:
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

>   .../bindings/nvmem/apple,efuses.yaml          |  1 +
>   .../devicetree/bindings/nvmem/imx-ocotp.yaml  |  1 +
>   .../bindings/nvmem/mediatek,efuse.yaml        |  1 +
>   .../nvmem/microchip,sama7g5-otpc.yaml         |  1 +
>   .../devicetree/bindings/nvmem/mxs-ocotp.yaml  |  1 +
>   .../nvmem/nvmem-deprecated-cells.yaml         | 28 +++++++++++++++++++
>   .../devicetree/bindings/nvmem/nvmem.yaml      |  9 ------
>   .../bindings/nvmem/qcom,qfprom.yaml           |  1 +
>   .../bindings/nvmem/qcom,sec-qfprom.yaml       |  1 +
>   .../bindings/nvmem/qcom,spmi-sdam.yaml        |  1 +
>   .../bindings/nvmem/rockchip,otp.yaml          |  1 +
>   .../bindings/nvmem/rockchip-efuse.yaml        |  1 +
>   .../nvmem/socionext,uniphier-efuse.yaml       |  1 +
>   .../bindings/nvmem/sunplus,sp7021-ocotp.yaml  |  1 +
>   .../bindings/rtc/amlogic,meson6-rtc.yaml      |  1 +
>   19 files changed, 50 insertions(+), 10 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/nvmem/nvmem-deprecated-cells.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
> index b82ca03e969c..f322290ee516 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
> @@ -43,7 +43,12 @@ patternProperties:
>       deprecated: true
>   
>     "^otp(-[0-9]+)?$":
> -    $ref: ../nvmem/nvmem.yaml#
> +    type: object
> +
> +    allOf:
> +      - $ref: ../nvmem/nvmem.yaml#
> +      - $ref: ../nvmem/nvmem-deprecated-cells.yaml#
> +
>       unevaluatedProperties: false
>   
>       description: |
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
> index 5474d63268dc..9518281007af 100644
> --- a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
> +++ b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
> @@ -19,6 +19,7 @@ maintainers:
>   allOf:
>     - $ref: /schemas/mtd/partitions/partition.yaml#
>     - $ref: /schemas/nvmem/nvmem.yaml#
> +  - $ref: /schemas/nvmem/nvmem-deprecated-cells.yaml#
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml b/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml
> index e49c2754ff55..9801fe6f91b5 100644
> --- a/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml
> @@ -11,6 +11,7 @@ maintainers:
>   
>   allOf:
>     - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml#
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/amlogic,meson6-efuse.yaml b/Documentation/devicetree/bindings/nvmem/amlogic,meson6-efuse.yaml
> index 84b3dfd21e09..b5cf740f96fa 100644
> --- a/Documentation/devicetree/bindings/nvmem/amlogic,meson6-efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/amlogic,meson6-efuse.yaml
> @@ -12,6 +12,7 @@ maintainers:
>   
>   allOf:
>     - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml#
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml b/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
> index e0860b6b85f3..d3abdafdbca0 100644
> --- a/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
> @@ -16,6 +16,7 @@ maintainers:
>   
>   allOf:
>     - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml#
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> index 99e60d713dac..be1314454bec 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
> @@ -16,6 +16,7 @@ description: |
>   
>   allOf:
>     - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml#
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> index 7ec2988b597e..cf5f9e22bb7e 100644
> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -16,6 +16,7 @@ maintainers:
>   
>   allOf:
>     - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml#
>   
>   properties:
>     $nodename:
> diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> index a296d348adb4..cc25f2927682 100644
> --- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> @@ -16,6 +16,7 @@ description: |
>   
>   allOf:
>     - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml#
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
> index a9b822aeaa7e..f43186f98607 100644
> --- a/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml
> @@ -11,6 +11,7 @@ maintainers:
>   
>   allOf:
>     - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml#
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/nvmem-deprecated-cells.yaml b/Documentation/devicetree/bindings/nvmem/nvmem-deprecated-cells.yaml
> new file mode 100644
> index 000000000000..951af28bbfb3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/nvmem-deprecated-cells.yaml
> @@ -0,0 +1,28 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/nvmem-deprecated-cells.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVMEM old syntax for fixed cells
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |
> +  Before introducing NVMEM layouts all NVMEM (fixed) cells were defined
> +  as direct device subnodes. That syntax was replaced by "fixed-layout"
> +  and is deprecated now. No new bindings should use it.
> +
> +patternProperties:
> +  "@[0-9a-f]+(,[0-7])?$":
> +    type: object
> +    allOf:
> +      - $ref: layouts/fixed-cell.yaml
> +      - properties:
> +          compatible: false
> +    deprecated: true
> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/nvmem/nvmem.yaml b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
> index 9f921d940142..4fd015d402ce 100644
> --- a/Documentation/devicetree/bindings/nvmem/nvmem.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
> @@ -46,15 +46,6 @@ properties:
>         container may reference more advanced (dynamic) layout
>         parsers.
>   
> -patternProperties:
> -  "@[0-9a-f]+(,[0-7])?$":
> -    type: object
> -    allOf:
> -      - $ref: layouts/fixed-cell.yaml
> -      - properties:
> -          compatible: false
> -    deprecated: true
> -
>   additionalProperties: true
>   
>   examples:
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index 8740938c32eb..8c8f05d9eaf1 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -11,6 +11,7 @@ maintainers:
>   
>   allOf:
>     - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml#
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,sec-qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,sec-qfprom.yaml
> index 9b133f783d29..2ada2099946d 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,sec-qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,sec-qfprom.yaml
> @@ -16,6 +16,7 @@ description:
>   
>   allOf:
>     - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml#
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml b/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
> index cd980def97b8..068bedf5dbc9 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml
> @@ -16,6 +16,7 @@ description: |
>   
>   allOf:
>     - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml#
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
> index 9c6eff788928..a44d44b32809 100644
> --- a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
> @@ -49,6 +49,7 @@ required:
>   
>   allOf:
>     - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml#
>   
>     - if:
>         properties:
> diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> index c5403e149080..b80fd8d1ae5b 100644
> --- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
> @@ -11,6 +11,7 @@ maintainers:
>   
>   allOf:
>     - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml#
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
> index efccc5aacbe0..e27cbae2d63a 100644
> --- a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
> @@ -12,6 +12,7 @@ maintainers:
>   
>   allOf:
>     - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml#
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml
> index da3f1de7d281..af97eeb8316c 100644
> --- a/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml
> @@ -12,6 +12,7 @@ maintainers:
>   
>   allOf:
>     - $ref: nvmem.yaml#
> +  - $ref: nvmem-deprecated-cells.yaml#
>   
>   properties:
>     compatible:
> diff --git a/Documentation/devicetree/bindings/rtc/amlogic,meson6-rtc.yaml b/Documentation/devicetree/bindings/rtc/amlogic,meson6-rtc.yaml
> index 8bf7d3a9be98..3a4551253e3e 100644
> --- a/Documentation/devicetree/bindings/rtc/amlogic,meson6-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/amlogic,meson6-rtc.yaml
> @@ -13,6 +13,7 @@ maintainers:
>   allOf:
>     - $ref: rtc.yaml#
>     - $ref: /schemas/nvmem/nvmem.yaml#
> +  - $ref: /schemas/nvmem/nvmem-deprecated-cells.yaml#
>   
>   properties:
>     compatible:


