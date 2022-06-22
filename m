Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F2EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 14:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUleCzU0ATDf0+p/HH1nF2nu10ebP7qKQKRtIfRnmbY=; b=xrtA7l8tXp/WoeytgoG8mN5I32
	to6fTGyf7vshsElb9QvWUkbLto9A8ELQzEVQegMzpth1Ad7RLjYLHfOyvjQf1saN5hOATAmOs4vTP
	qspTgoShOD/h910ydw9G3GfmpTzTuZYlN5ZbHvxdiYftboGbbEOp4zE+CSYVIHqpB4OnZSEip9NKu
	E0fPYLBPm0u262xE7P8HL73Jwxr8HzIi5umBgYAt0v52pX/8enIYUjiicJ02F+cPmTtTqdjKEY9dJ
	ItdbHSlnwCSpfUBKkIi0O5lZLsSE9dar+SamoNKM94KW8IY57UCUHPJ2CWNDmgolkOrFjvbINbxAB
	N4zBlY5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o413z-00Aoml-1c; Wed, 22 Jun 2022 14:10:35 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o413X-00AobO-20; Wed, 22 Jun 2022 14:10:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id i17-20020a7bc951000000b0039c4760ec3fso1061752wml.0;
        Wed, 22 Jun 2022 07:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IUleCzU0ATDf0+p/HH1nF2nu10ebP7qKQKRtIfRnmbY=;
        b=KSzdoo/36ZIvRIu6QQ/klecmGghfPbtDd0BgkYWOUelHQex0jNYUA7/brCB4t7Goa0
         wqZaR9dyx7ZrEaYLsamF+5HABOou1GXhsY6EqGEAiawpQSVq7F8hPWG24JxjKFmn1kkk
         oq8Xl5dGXPIjkB4dgmj1c9UaAARXM7u2RPzUSoii1caVxeSnNoI8IC1V/aAswsvcNvJF
         XVWzcSGINqPTG8W9JMYHTka77G1kl29PsxNV7A1TmXkPKWT/qIhR+3QPN+8rZoYY7SEx
         dYj8seOmtusTwH/0iHUUTxEi6p987CqzCQXu0IhsrN1o/9Arf55c37K9OXkOyiyE4Tb/
         lokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IUleCzU0ATDf0+p/HH1nF2nu10ebP7qKQKRtIfRnmbY=;
        b=QdERzwjBfkQ/TQhVxGfHwa7pVOluY8amtg6UsCtaqlXrpaw3wIToQ84PWaKvzt13Fp
         vbt3R1o7eJjvyQVZurcF+nVyajlUH7Snz4V+LGUebY01LFsj644Ij982OTYfkntNrn6t
         Wbchwil1JFLncAlK9dEW2A9XL8VbFMN0YnvPhgYJhXZQ1mR52SDOEmajYKknKoZarnUU
         TOBnSNeg9ZC01UUhbdSdJ/HdWPB6fwYrkizhBZ8YrIx9nvwsEBVDDabkkzp4gv21JaS7
         0aFNOG0SiE4odUfPXroWM09xbYjkaRK/Y3RNkPn33HovaBofzqDPQTkTtdH+1LS3xPl1
         gR8A==
X-Gm-Message-State: AJIora+IoYkAkmt0E2M+NvMGTp5QolG1LZCuaYLCf61hhtcYYZrOwZwA
	skiqCqT3rMhI7N+fc3hikLI=
X-Google-Smtp-Source: AGRyM1sMtk0NJfyawl0SBTLR/ENEJAyULujRd4IYFKCRrJUK56lDt+eTATyCgING1Ci7/CWWeEzNMg==
X-Received: by 2002:a05:600c:3543:b0:3a0:2a72:e4d2 with SMTP id i3-20020a05600c354300b003a02a72e4d2mr3559358wmq.58.1655907002466;
        Wed, 22 Jun 2022 07:10:02 -0700 (PDT)
Received: from [192.168.0.16] ([37.223.148.38])
        by smtp.gmail.com with ESMTPSA id l9-20020a05600c4f0900b0039db500714fsm23452759wmq.6.2022.06.22.07.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 07:10:01 -0700 (PDT)
Message-ID: <56b940e7-849a-6d90-52cd-b8db90e5ed62@gmail.com>
Date: Wed, 22 Jun 2022 16:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 1/4] dt-bindings: nvmem: convert mtk-efuse.txt to YAML
 schema
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
References: <20220617093132.22578-1-chunfeng.yun@mediatek.com>
 <46ec62eb-00da-defb-219f-92121fd35d7e@linaro.org>
 <0050627cdd64c02bb84f4694fc8994a5cb27d0f2.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <0050627cdd64c02bb84f4694fc8994a5cb27d0f2.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_071007_193342_3E269E9D 
X-CRM114-Status: GOOD (  18.29  )
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



On 20/06/2022 09:11, Chunfeng Yun wrote:
> Hi Matthias,
> 
> On Fri, 2022-06-17 at 12:41 -0700, Srinivas Kandagatla wrote:
>>
>> On 17/06/2022 02:31, Chunfeng Yun wrote:
>>> Convert mtk-efuse.txt to YAML schema mediatek,efuse.yaml
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>> ---
>>
>> Applied 1/4 and 2/4, dts patches need to go via SoC maintainer.
> Could you please help to pick up 3/4, 4/4?

Applied, thanks!

> 
> thanks
> 
>>
>>
>> thanks,
>> -srini
>>
>>
>>> v6: no changes, based on kernel 5.19-rc1
>>>
>>> v5:
>>> sync with the series:
>>>
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=640196
>>>      1. change title suggested by Krzysztof;
>>>      2. No need drop 'reviewed-by Rob' suggested by Krzysztof
>>>      3. add maintainer Lala who maintain efuse driver now;
>>>
>>> v4: fix duplicated unit-address in example;
>>>       drop reviewed-by Rob, due to changes;
>>>
>>> v3: add reviewed-by Rob
>>>
>>> v2:
>>>      1. remove description of subnodes which is covered by
>>> nvmem.yaml
>>> suggested by Rob
>>>      2. change the example which is commoner than mt8173's
>>> ---
>>>    .../bindings/nvmem/mediatek,efuse.yaml        | 87
>>> +++++++++++++++++++
>>>    .../devicetree/bindings/nvmem/mtk-efuse.txt   | 43 ---------
>>>    2 files changed, 87 insertions(+), 43 deletions(-)
>>>    create mode 100644
>>> Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>>>    delete mode 100644 Documentation/devicetree/bindings/nvmem/mtk-
>>> efuse.txt
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>>> b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>>> new file mode 100644
>>> index 000000000000..f6e01ddb7499
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>>> @@ -0,0 +1,87 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek efuse
>>> +
>>> +description: |
>>> +  MediaTek's efuse is used for storing calibration data, it can be
>>> accessed
>>> +  on ARM devices usiong I/O mapped memory.
>>> +
>>> +maintainers:
>>> +  - Andrew-CT Chen <andrew-ct.chen@mediatek.com>
>>> +  - Lala Lin <lala.lin@mediatek.com>
>>> +
>>> +allOf:
>>> +  - $ref: "nvmem.yaml#"
>>> +
>>> +properties:
>>> +  $nodename:
>>> +    pattern: "^efuse@[0-9a-f]+$"
>>> +
>>> +  compatible:
>>> +    oneOf:
>>> +      - items:
>>> +          - enum:
>>> +              - mediatek,mt7622-efuse
>>> +              - mediatek,mt7623-efuse
>>> +              - mediatek,mt8173-efuse
>>> +              - mediatek,mt8192-efuse
>>> +              - mediatek,mt8195-efuse
>>> +              - mediatek,mt8516-efuse
>>> +          - const: mediatek,efuse
>>> +      - const: mediatek,mt8173-efuse
>>> +        deprecated: true
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    efuse@11c10000 {
>>> +        compatible = "mediatek,mt8195-efuse", "mediatek,efuse";
>>> +        reg = <0x11c10000 0x1000>;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +
>>> +        u3_tx_imp_p0: usb3-tx-imp@184,1 {
>>> +            reg = <0x184 0x1>;
>>> +            bits = <0 5>;
>>> +        };
>>> +        u3_rx_imp_p0: usb3-rx-imp@184,2 {
>>> +            reg = <0x184 0x2>;
>>> +            bits = <5 5>;
>>> +        };
>>> +        u3_intr_p0: usb3-intr@185 {
>>> +            reg = <0x185 0x1>;
>>> +            bits = <2 6>;
>>> +        };
>>> +        comb_tx_imp_p1: usb3-tx-imp@186,1 {
>>> +            reg = <0x186 0x1>;
>>> +            bits = <0 5>;
>>> +        };
>>> +        comb_rx_imp_p1: usb3-rx-imp@186,2 {
>>> +            reg = <0x186 0x2>;
>>> +            bits = <5 5>;
>>> +        };
>>> +        comb_intr_p1: usb3-intr@187 {
>>> +            reg = <0x187 0x1>;
>>> +            bits = <2 6>;
>>> +        };
>>> +        u2_intr_p0: usb2-intr-p0@188,1 {
>>> +            reg = <0x188 0x1>;
>>> +            bits = <0 5>;
>>> +        };
>>> +        u2_intr_p1: usb2-intr-p1@188,2 {
>>> +            reg = <0x188 0x2>;
>>> +            bits = <5 5>;
>>> +        };
>>> +    };
>>> diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
>>> b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
>>> deleted file mode 100644
>>> index 39d529599444..000000000000
>>> --- a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
>>> +++ /dev/null
>>> @@ -1,43 +0,0 @@
>>> -= Mediatek MTK-EFUSE device tree bindings =
>>> -
>>> -This binding is intended to represent MTK-EFUSE which is found in
>>> most Mediatek SOCs.
>>> -
>>> -Required properties:
>>> -- compatible: should be
>>> -	      "mediatek,mt7622-efuse", "mediatek,efuse": for MT7622
>>> -	      "mediatek,mt7623-efuse", "mediatek,efuse": for MT7623
>>> -	      "mediatek,mt8173-efuse" or "mediatek,efuse": for MT8173
>>> -	      "mediatek,mt8192-efuse", "mediatek,efuse": for MT8192
>>> -	      "mediatek,mt8195-efuse", "mediatek,efuse": for MT8195
>>> -	      "mediatek,mt8516-efuse", "mediatek,efuse": for MT8516
>>> -- reg: Should contain registers location and length
>>> -- bits: contain the bits range by offset and size
>>> -
>>> -= Data cells =
>>> -Are child nodes of MTK-EFUSE, bindings of which as described in
>>> -bindings/nvmem/nvmem.txt
>>> -
>>> -Example:
>>> -
>>> -	efuse: efuse@10206000 {
>>> -		compatible = "mediatek,mt8173-efuse";
>>> -		reg	   = <0 0x10206000 0 0x1000>;
>>> -		#address-cells = <1>;
>>> -		#size-cells = <1>;
>>> -
>>> -		/* Data cells */
>>> -		thermal_calibration: calib@528 {
>>> -			reg = <0x528 0xc>;
>>> -		};
>>> -	};
>>> -
>>> -= Data consumers =
>>> -Are device nodes which consume nvmem data cells.
>>> -
>>> -For example:
>>> -
>>> -	thermal {
>>> -		...
>>> -		nvmem-cells = <&thermal_calibration>;
>>> -		nvmem-cell-names = "calibration";
>>> -	};
> 

