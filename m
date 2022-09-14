Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6DBC6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 13:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IDIiUXkoYK6zOtpWLVJa1oiYLqpB2qfJBvU/rbxEAw=; b=MqWoRkDKEoHAdVGfkP9R9/TijQ
	hQ/Yl/xaYPi1qLNese7AwEW4iQ/wSOTwhEcd6BVXklxCXiQwnSK8FQWNF0g1HoXcR7N0OZGVYtQZn
	gywXpqAI3O1gdrM1r8/BJUqx7NNltoYTX4Wg6Up6yrPiNtqscdDWBTFGjKaSqkcuavjNVHf9AjII5
	CG8/SMwbXdXyru86s9MDj5hUZo+b1x1WNipEUENm3n6NRDmQMNjo4mBcjPIyhDC6vkPNkAqT44Epa
	HCwIMvjkMxXO4/KnmgkYssMnhJjPlmlTGycsKi871d6R7Zh9/EPDguSrG5pk56rKa7RhaIInRQco5
	GkluWekQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSjN-001Cxp-2P; Wed, 14 Sep 2022 13:47:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSj0-001CcC-AQ; Wed, 14 Sep 2022 13:46:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 05F6D6601F88;
	Wed, 14 Sep 2022 14:46:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663163204;
	bh=0e5JsYnyFEHqEe70UH7Ck+yOSRtWTcD8JNxi1AtWZcE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JQ00q7ZR/U7+dNuQmv5gJo6aaitTeYqkzYTCsRXrsi8LZamLZ2elKsQbDYm/+eRC0
	 c3Tare/R6nFXlVNCdN/l07OpRjx7+7gtWjh2LF8/Nxg6QqJ4HJHHpBVkSRwXNuE0Cl
	 ifSl57dpOMADZymwbKKwTCyqpjCcuduAdxs7sQ79SDPofDbOPvNxKUHnvladZxjJHT
	 JU9rgiorLB/OGuxAcec1Td81NuhKpwdfa0OsiZxMcZi88Go5FRp9cLENSkxmTYH3WK
	 DGHo+z/dqyhV3zVqWm35h1AiSvJwLUEr2LO2FiHAxLMkt5WEIF1Rp1HZSAXiAgDNNk
	 bSlp3RL/QYBOw==
Message-ID: <06eb15ea-56b3-4f18-be18-3fc710cef779@collabora.com>
Date: Wed, 14 Sep 2022 15:46:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: mediatek: Add new bindings of
 MediaTek frequency hopping
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Edward-JW Yang <edward-jw.yang@mediatek.com>
References: <20220914124552.16964-1-johnson.wang@mediatek.com>
 <20220914124552.16964-3-johnson.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220914124552.16964-3-johnson.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_064646_526849_561CAF25 
X-CRM114-Status: GOOD (  19.19  )
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

Il 14/09/22 14:45, Johnson Wang ha scritto:
> Add the new binding documentation for MediaTek frequency hopping
> and spread spectrum clocking control.
> 
> Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>   .../bindings/arm/mediatek/mediatek,fhctl.yaml | 47 +++++++++++++++++++
>   1 file changed, 47 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
> new file mode 100644
> index 000000000000..7b0fd0889bb6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,fhctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek frequency hopping and spread spectrum clocking control
> +
> +maintainers:
> +  - Edward-JW Yang <edward-jw.yang@mediatek.com>
> +
> +description: |
> +  Frequency hopping control (FHCTL) is a piece of hardware that control
> +  some PLLs to adopt "hopping" mechanism to adjust their frequency.
> +  Spread spectrum clocking (SSC) is another function provided by this hardware.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8186-fhctl
> +
> +  reg:
> +    maxItems: 1

There are still a few issues in this binding that I can immediately see...

> +
> +  clocks:
MT8195 has 23 PLLs, MT8186 has 14, but perhaps in the future we may see
something more than that on some newer SoC, so...

   clocks:
     maxItems: 30

> +    description: Phandles of the PLL with FHCTL hardware capability.
> +
> +  mediatek,hopping-ssc-percents:
> +    description: The percentage of spread spectrum clocking for one PLL.
> +    $ref: /schemas/types.yaml#/definitions/uint32

This is an array, so...
$ref: /schemas/types.yaml#/definitions/uint32-array

...also, maxItems?

and you should also specify:

default: 0   <- because, by default, SSC is disabled
minimum: 0   <- because this is the minimum accepted value


Regards,
Angelo

> +    maximum: 8
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8186-clk.h>
> +    fhctl: fhctl@1000ce00 {
> +        compatible = "mediatek,mt8186-fhctl";
> +        reg = <0x1000c000 0xe00>;
> +        clocks = <&apmixedsys CLK_APMIXED_MSDCPLL>;
> +        mediatek,hopping-ssc-percents = <3>;
> +    };


