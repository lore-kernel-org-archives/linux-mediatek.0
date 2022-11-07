Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BD9C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 10:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9fjwR+g/1tOV7uDc/1srnMSULJO6K7l4hslDa6wddM=; b=xg0e9xNjTXMgI7q4fqa5OpMHa6
	++VIZ625cT94pnuVSbUdrL0om8qo23q/AkHqvtB/Yt93G9+b+huqY/utBmcvaBl+yqbrmGKZBNuQO
	VVSlCd/H02NQSE5XPvXFdwVtugXDRHheWlA7enKOCmGolmLH5+9XAWjwLJkFSqgCoFL+e1mICqvt9
	vcZoGMBN+BAksq7jZayhAWQWd8lV9mofL3pka85f/3YYTcqEKzgq6X36A3ouMFJU0k8O1koWCBPZC
	oLYH5Y3V9cyNUktQWyxRmcZcCk40myFpzrMziep1tMjrOI5ShgC4kfkfXU2AqgbjnCgMHDCxJCKHC
	pIisyySw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oryzR-00DchK-G7; Mon, 07 Nov 2022 10:04:25 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oryzO-00DcJa-39
	for linux-mediatek@lists.infradead.org; Mon, 07 Nov 2022 10:04:24 +0000
Received: by mail-lf1-x12e.google.com with SMTP id j4so16097985lfk.0
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Nov 2022 02:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o9fjwR+g/1tOV7uDc/1srnMSULJO6K7l4hslDa6wddM=;
        b=FWyxMkqVRspwRk/LjUFmuIksyoWQt6NGzi17Q+5U4aRBHA7hSFvA9hLDCBrLTQrJ73
         FO2R1TZhfWueKIHDnKVxgboYw1yT4sGVZsUhf6HY9j5aPI39RlG5HWMOfZaSmXnMd+cp
         XKaDZYPE7+AQzS+Q/8fZBWdEnAFh919/e5o+jrKRL0qL7yjZiGGyQ/JVWzQjKzaZk/PJ
         QGi7mnoyif1TqvfROeHRj6DSTU0IroNnMYLvdtI9jA0CBQjXjGx06+KqxmYWog5NY1VW
         Cw4qSP0TS75gCEbOu4Reezydqoxi3E8xtImCcCqK9p3gyaJRdoIQSmBv6gcQ/aTFi0Xy
         rJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o9fjwR+g/1tOV7uDc/1srnMSULJO6K7l4hslDa6wddM=;
        b=yUVGfxFLc2yoaG3+DuUCQvfAT0Wl+AFxPEVWJR+4lK2lCwrMhxSm+HtCkLLMGzkMRD
         XQ24bF1CCG6l48CIxzpotZ6P7bJ/UVm1FAZR19B1ObcUx8UY/RyQ6pRL4SEJYH+ZotGm
         YdZBeB1dXg1jsamgmtlpHSLIU9Tj/jxm0cHR2c3rM4KDyrAZzP3lr/5ZkvAVheD/tS4T
         3Jb6sT0+AyeiC7J52enOteejmM3QSP0YLvb8gt6vsIKNvNOiMPtnVI/RYfXWHqoL6ZLJ
         GBZ9QK0a8Ymef034wBY0UktuKasMphSK18XEcSAVAqFGzOO0OsRQ/Y0vCw9H0VkCOP5K
         Dnfg==
X-Gm-Message-State: ACrzQf0wgV+4kRQwNQu2VrmKWztsspJp9QdoG33WYZI/aOWO3at0pqu2
	XtLNgPm2wg25g3vUHglZH+smNQ==
X-Google-Smtp-Source: AMsMyM6JoY1oMfvSqE/V0QXzq0+sxYu3DKopYnj97qhsccmrc8GW1EC6ovuy9ad9AfcYpZzm1Hjvdw==
X-Received: by 2002:ac2:4468:0:b0:4a7:8eae:b342 with SMTP id y8-20020ac24468000000b004a78eaeb342mr19226510lfl.310.1667815458327;
        Mon, 07 Nov 2022 02:04:18 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id g19-20020a2ea4b3000000b0026de1bf528esm1149964ljm.119.2022.11.07.02.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 02:04:17 -0800 (PST)
Message-ID: <62fcc16e-51cb-fee4-ca8d-3ff546552595@linaro.org>
Date: Mon, 7 Nov 2022 11:04:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 net-next 2/8] dt-bindings: net: mediatek: add WED RX
 binding for MT7986 eth driver
Content-Language: en-US
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, netdev@vger.kernel.org,
 nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, Bo.Jiao@mediatek.com,
 sujuan.chen@mediatek.com, ryder.Lee@mediatek.com, evelyn.tsai@mediatek.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, daniel@makrotopia.org,
 krzysztof.kozlowski+dt@linaro.org
References: <cover.1667466887.git.lorenzo@kernel.org>
 <2d92c3e282c6a788e54370604f966fc7a5b479bf.1667466887.git.lorenzo@kernel.org>
 <6d1bd86e-29f0-a3b2-700b-978d64990d56@linaro.org>
 <Y2P/jq34IjyM2iXu@lore-desk>
 <aa7e325f-2986-005a-3d0a-579ac46491f6@linaro.org>
 <Y2QImkLcWIcwiTjW@lore-desk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y2QImkLcWIcwiTjW@lore-desk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_020422_185016_0C2ED2AD 
X-CRM114-Status: GOOD (  21.68  )
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

On 03/11/2022 19:29, Lorenzo Bianconi wrote:
>> On 03/11/2022 13:51, Lorenzo Bianconi wrote:
>>>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..6c3c514c48ef
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
> 
> Regarding "mediatek,mt7986-wed" compatible string it has been added to
> mt7986a.dtsi in the commit below:
> 
> commit 00b9903996b3e1e287c748928606d738944e45de
> Author: Lorenzo Bianconi <lorenzo@kernel.org>
> Date:   Tue Sep 20 12:11:13 2022 +0200
> 
> arm64: dts: mediatek: mt7986: add support for Wireless Ethernet Dispatch
> 
>>>>
>>>> arm is only for top-level stuff. Choose appropriate subsystem, soc as
>>>> last resort.
>>>
>>> these chips are used only for networking so is net folder fine?
>>
>> So this is some MMIO and no actual device? Then rather soc.
> 
> ack, I will move them there
> 
>>
>>>
>>>>
>>>>> @@ -0,0 +1,47 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-boot.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title:
>>>>> +  MediaTek Wireless Ethernet Dispatch WO boot controller interface for MT7986
>>>>> +
>>>>> +maintainers:
>>>>> +  - Lorenzo Bianconi <lorenzo@kernel.org>
>>>>> +  - Felix Fietkau <nbd@nbd.name>
>>>>> +
>>>>> +description:
>>>>> +  The mediatek wo-boot provides a configuration interface for WED WO
>>>>> +  boot controller on MT7986 soc.
>>>>
>>>> And what is "WED WO boot controller?
>>>
>>> WED WO is a chip used for networking packet processing offloaded to the Soc
>>> (e.g. packet reordering). WED WO boot is the memory used to store start address
>>> of wo firmware. Anyway I will let Sujuan comment on this.
>>
>> A bit more should be in description.
> 
> I will let Sujuan adding more details (since I do not have them :))
> 
>>
>>>
>>>>
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    items:
>>>>> +      - enum:
>>>>> +          - mediatek,mt7986-wo-boot
>>>>> +      - const: syscon
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    soc {
>>>>> +      #address-cells = <2>;
>>>>> +      #size-cells = <2>;
>>>>> +
>>>>> +      wo_boot: syscon@15194000 {
>>>>> +        compatible = "mediatek,mt7986-wo-boot", "syscon";
>>>>> +        reg = <0 0x15194000 0 0x1000>;
>>>>> +      };
>>>>> +    };
>>>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..6357a206587a
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
>>>>> @@ -0,0 +1,50 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-ccif.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: MediaTek Wireless Ethernet Dispatch WO controller interface for MT7986
>>>>> +
>>>>> +maintainers:
>>>>> +  - Lorenzo Bianconi <lorenzo@kernel.org>
>>>>> +  - Felix Fietkau <nbd@nbd.name>
>>>>> +
>>>>> +description:
>>>>> +  The mediatek wo-ccif provides a configuration interface for WED WO
>>>>> +  controller on MT7986 soc.
>>>>
>>>> All previous comments apply.
>>>>
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    items:
>>>>> +      - enum:
>>>>> +          - mediatek,mt7986-wo-ccif
>>>>> +      - const: syscon
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +  - interrupts
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>>> +    soc {
>>>>> +      #address-cells = <2>;
>>>>> +      #size-cells = <2>;
>>>>> +
>>>>> +      wo_ccif0: syscon@151a5000 {
>>>>> +        compatible = "mediatek,mt7986-wo-ccif", "syscon";
>>>>> +        reg = <0 0x151a5000 0 0x1000>;
>>>>> +        interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
>>>>> +      };
>>>>> +    };
>>>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..a499956d9e07
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
>>>>> @@ -0,0 +1,50 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-dlm.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: MediaTek Wireless Ethernet Dispatch WO hw rx ring interface for MT7986
>>>>> +
>>>>> +maintainers:
>>>>> +  - Lorenzo Bianconi <lorenzo@kernel.org>
>>>>> +  - Felix Fietkau <nbd@nbd.name>
>>>>> +
>>>>> +description:
>>>>> +  The mediatek wo-dlm provides a configuration interface for WED WO
>>>>> +  rx ring on MT7986 soc.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: mediatek,mt7986-wo-dlm
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  resets:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  reset-names:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +  - resets
>>>>> +  - reset-names
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    soc {
>>>>> +      #address-cells = <2>;
>>>>> +      #size-cells = <2>;
>>>>> +
>>>>> +      wo_dlm0: wo-dlm@151e8000 {
>>>>
>>>> Node names should be generic.
>>>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>>>
>>> DLM is a chip used to store the data rx ring of wo firmware. I do not have a
>>> better node name (naming is always hard). Can you please suggest a better name?
>>
>> The problem is that you added three new devices which seem to be for the
>> same device - WED. It looks like some hacky way of avoid proper hardware
>> description - let's model everything as MMIO and syscons...
> 
> is it fine to use syscon as node name even if we do not declare it in compatible
> string for dlm?
> 

No, rather not. It's a shortcut and if used without actual syscon it
would be confusing. You could still call it system-controller, though.

Best regards,
Krzysztof


