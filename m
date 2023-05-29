Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02B6C77B7E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 14:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10o9jmZWeP457p2kLERKO+3a4U7ZX8eeTkQQ7+6/jtg=; b=LWuvzJe6iCSjyQJusJ0wgmdRdY
	0yG987RlMUfjFCzFChNHPcwfqq4ICKUhk7o+D7y4MIb0J9Fp/0xfvL1xeBWRjFf9co0BMsugM7JoD
	mP2EQ801AQ+enM8nspKyMQ3A1vQjP2Vhvsy+bXKu9r5fmch8IAePtpmvlrwVq2xofE9DuQwfLcDQC
	Q2mAXJaxXsV81kK/CykylRBzsZknAr7xlPn0nJrUjtU2CGIznMfgpMxjeNp0SxOqJj+82Ky+9trWY
	G37IRVvgnf/xIPUdW/gW2sth5/OTq2y0gyZN9Ttu9PDt+II4TVXlWKBWJPTjpH2740gFFj+5uvmA3
	srlw0PnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3daJ-00AjKZ-0X;
	Mon, 29 May 2023 14:10:55 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3daF-00AjJX-2e;
	Mon, 29 May 2023 14:10:53 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-30ae5f2ac94so1648326f8f.1;
        Mon, 29 May 2023 07:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685369450; x=1687961450;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=10o9jmZWeP457p2kLERKO+3a4U7ZX8eeTkQQ7+6/jtg=;
        b=R/rqDkNlnRgXOH1pDR5R2SSc30hzPgW0hPNMtwNUrgpO8HXY3pY3T2BoA4vrSxPgOD
         uXUIldAd/8jFOYIQyC153wIBVX/AJ3MjygoVgbWscuZo7HwahFejjaBDGl8bRLDFU88U
         ZinOpb71aOiSoFvt8gODU5oDbNiuDTPsb1lV3BPARvLCJkxDfAnwAj5FWAtSa8311wO1
         5DMOC4jWMkWct6/V3mTiY1omJIM1cCpeKzovWPXNM3Y4LSm1CCgQg0unu5FRiELGea//
         voB22/S3nulIGlPNptxRVXWbm5PVMiHqaQYRx4Ch0LJzaNqZvA923HAC8OKOleLQwOaY
         3/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685369450; x=1687961450;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10o9jmZWeP457p2kLERKO+3a4U7ZX8eeTkQQ7+6/jtg=;
        b=HDv1sybq9/pf6res5Y6zrLpIouow8vrpOuOantHxCpsXqyV8K2HiiASnATPbxGtmE2
         SC/hUS97BdsnUAL+Ov98oh/HlBQEO7Vrg4p8+w7Z4sal9zXuEPa3KtT90G2Yxl4yotbG
         b2wtPWuEUUmtstF+vhAxCkzYwXR5AnoIjgC66r0sR5g0MI+km6nToDtTzINSk9wqax4N
         bSQUiwwnbMO/ovTD1IaP+XhIKz9j+KDOSVyU98ZruEPe0/SCaAxwgTe4RdVF/c2hmQs+
         JPqBNP19Pyq3bK1gRQyIK6M68T/1FbB9XPfeFYK3wxf177+PRq1acwBWd4DGuZojY3t5
         ZTQg==
X-Gm-Message-State: AC+VfDwSi9DAb1LYM12ZeWaoOJJkMafHHqZgzmfYe05pLMVoTCaIjGzu
	A/wrXKBRIfAf7q33XI/Jh5M=
X-Google-Smtp-Source: ACHHUZ6A74E+BgfNtlIZYglrKBVuUz4y94mfpo3xLAeito8AShd1iQMhnZMhDZbfgGvwCnI7VQYABw==
X-Received: by 2002:a5d:618d:0:b0:30a:ddb3:93b with SMTP id j13-20020a5d618d000000b0030addb3093bmr8244185wru.63.1685369449882;
        Mon, 29 May 2023 07:10:49 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n7-20020adfe347000000b00309382eb047sm39744wrj.112.2023.05.29.07.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 07:10:48 -0700 (PDT)
Message-ID: <e744408d-2bc7-886e-2f32-0a05a1dd570a@gmail.com>
Date: Mon, 29 May 2023 16:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v12 03/11] dt-bindings: remoteproc: mediatek: Support
 MT8195 dual-core SCP
Content-Language: en-US, ca-ES, es-ES
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230517043449.26352-1-tinghan.shen@mediatek.com>
 <20230517043449.26352-4-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230517043449.26352-4-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_071051_860928_6F0C4E33 
X-CRM114-Status: GOOD (  25.54  )
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



On 17/05/2023 06:34, Tinghan Shen wrote:
> Extend the SCP binding to describe the MT8195 dual-core SCP.
> 
> Under different applications, the MT8195 SCP can be used as single-core
> or dual-core. This change keeps the single-core definitions and
> adds new definitions for the dual-core use case.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../bindings/remoteproc/mtk,scp.yaml          | 145 +++++++++++++++++-
>   1 file changed, 141 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index 271081df0e46..09102dda4942 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -21,6 +21,7 @@ properties:
>         - mediatek,mt8188-scp
>         - mediatek,mt8192-scp
>         - mediatek,mt8195-scp
> +      - mediatek,mt8195-scp-dual
>   
>     reg:
>       description:
> @@ -31,10 +32,7 @@ properties:
>   
>     reg-names:
>       minItems: 2
> -    items:
> -      - const: sram
> -      - const: cfg
> -      - const: l1tcm
> +    maxItems: 3
>   
>     clocks:
>       description:
> @@ -70,6 +68,81 @@ properties:
>   
>       unevaluatedProperties: false
>   
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +  ranges:
> +    description:
> +      Standard ranges definition providing address translations for
> +      local SCP SRAM address spaces to bus addresses.
> +
> +patternProperties:
> +  "^scp@[a-f0-9]+$":
> +    type: object
> +    description:
> +      The MediaTek SCP integrated to SoC might be a multi-core version.
> +      The other cores are represented as child nodes of the boot core.
> +      There are some integration differences for the IP like the usage of
> +      address translator for translating SoC bus addresses into address space
> +      for the processor.
> +
> +      Each SCP core has own cache memory. The SRAM and L1TCM are shared by
> +      cores. The power of cache, SRAM and L1TCM power should be enabled
> +      before booting SCP cores. The size of cache, SRAM, and L1TCM are varied
> +      on differnt SoCs.
> +
> +      The SCP cores do not use an MMU, but has a set of registers to
> +      control the translations between 32-bit CPU addresses into system bus
> +      addresses. Cache and memory access settings are provided through a
> +      Memory Protection Unit (MPU), programmable only from the SCP.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - mediatek,scp-core
> +
> +      reg:
> +        description: The base address and size of SRAM.
> +        maxItems: 1
> +
> +      reg-names:
> +        const: sram
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      firmware-name:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        description:
> +          If present, name (or relative path) of the file within the
> +          firmware search path containing the firmware image used when
> +          initializing sub cores of multi-core SCP.
> +
> +      memory-region:
> +        maxItems: 1
> +
> +      cros-ec-rpmsg:
> +        $ref: /schemas/mfd/google,cros-ec.yaml
> +        description:
> +          This subnode represents the rpmsg device. The properties
> +          of this node are defined by the individual bindings for
> +          the rpmsg devices.
> +
> +        required:
> +          - mediatek,rpmsg-name
> +
> +        unevaluatedProperties: false
> +
> +    required:
> +      - compatible
> +      - reg
> +      - reg-names
> +
> +    additionalProperties: false
> +
>   required:
>     - compatible
>     - reg
> @@ -99,7 +172,37 @@ allOf:
>           reg:
>             maxItems: 2
>           reg-names:
> +          items:
> +            - const: sram
> +            - const: cfg
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8192-scp
> +            - mediatek,mt8195-scp
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 3
> +        reg-names:
> +          items:
> +            - const: sram
> +            - const: cfg
> +            - const: l1tcm
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8195-scp-dual
> +    then:
> +      properties:
> +        reg:
>             maxItems: 2
> +        reg-names:
> +          items:
> +            - const: cfg
> +            - const: l1tcm
>   
>   additionalProperties: false
>   
> @@ -121,3 +224,37 @@ examples:
>               mediatek,rpmsg-name = "cros-ec-rpmsg";
>           };
>       };
> +
> +  - |
> +    scp@10500000 {
> +        compatible = "mediatek,mt8195-scp-dual";
> +        reg = <0x10720000 0xe0000>,
> +              <0x10700000 0x8000>;
> +        reg-names = "cfg", "l1tcm";
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0 0x10500000 0x100000>;
> +
> +        scp@0 {
> +            compatible = "mediatek,scp-core";
> +            reg = <0x0 0xa0000>;
> +            reg-names = "sram";
> +
> +            cros-ec-rpmsg {
> +                compatible = "google,cros-ec-rpmsg";
> +                mediatek,rpmsg-name = "cros-ec-rpmsg";
> +            };
> +        };
> +
> +        scp@a0000 {
> +            compatible = "mediatek,scp-core";
> +            reg = <0xa0000 0x20000>;
> +            reg-names = "sram";
> +
> +            cros-ec-rpmsg {
> +                compatible = "google,cros-ec-rpmsg";
> +                mediatek,rpmsg-name = "cros-ec-rpmsg";
> +            };
> +        };
> +    };

