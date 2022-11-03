Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8087C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 18:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DF0gYT6jJS2DoTjVBzKYDYrhEGRDI4zCqa9jCJ/7eQ=; b=zyP6FRxKO5zXshWpMTHVxfWCS6
	vsgIa+IZ/7QLg/VWeeJxRma7vGtxqu4duE4zD6DOA1od0Ql+Hsd1GZ3OF7fXC3WfSxGmiMYxSGgrd
	2qHCW8ZYD/HfzD27V1kGjyyyTHryM4osZ/XpTSP02nHfN15DhDodKDqN+sCrpFTy/Hl9MefMssBga
	QILPkrIiRG4uPnD/+Bwp8IRNiao1SdL4CLwt2O0s9hsIJa6MZhXZq4qHiBSgK14V86tWuhPEAoRi4
	XcenzQ5OlDGSHoanJWToDKnhj49nz8aAQsDkSDgvSqq2MJxhOw/rHI5q/vFrIB2ZFjJ4JicrXU2f5
	fXUFWtUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqeVr-001AHM-0N; Thu, 03 Nov 2022 18:00:23 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqeVm-001AE9-Re
	for linux-mediatek@lists.infradead.org; Thu, 03 Nov 2022 18:00:21 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id x13so1656675qvn.6
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Nov 2022 11:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/DF0gYT6jJS2DoTjVBzKYDYrhEGRDI4zCqa9jCJ/7eQ=;
        b=IhoLoP3mwLpRy4nrwoo81yGLrQRJTGKg3dBXLkslTUFxl5zsrT3uGwp2cobcU0it9Q
         C3CCSrpLcleEAPA53NNqVktWgnFqxuE/ajCRewU5x5+nGZE/C8iKwVY6zYzHFA/2z5jU
         GyP8HKtY/goEyNfAkHHTsixDotGlDrJg/MyHaBfF7LNHmSaywxQHf25guoNUpoVpLScx
         Y0Q9DurjY0uw/KiDW7iqruiVXrkGk0zmMr6BS1Jg6YhdPVQ1qyvZ8gBxPV+XaBQBr6kR
         h3+k/qNexXFkupp6TWgMyO5Y1ZCoRdbaWtb6DA29G41GrsYFtkCN6IvM+ULVEYgSrG3S
         tFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/DF0gYT6jJS2DoTjVBzKYDYrhEGRDI4zCqa9jCJ/7eQ=;
        b=BoTqjPZdGErU/FzyhqiD4UGpW1Ib7XG3KE2P8lY/diT98xKrkXsRAlS/y7s05knMED
         9YByRLe9cO2xvxOvkLh94lN37Ke/2EZhFs/fgYLpbiTH0WzvfGVcMMijEepaU61YcEov
         sOJ5dWIS/HRx1cm0nm4u0H54gosRF6OeZ9bVl/du0/45ZFkPGdgyfdNUegpbPsFo6LTX
         KGBw/+n2TNnM2SPKetOLqK+Ts44eQjaBVE6R9HwOR9y/r9n3xPBI6dMnqrdIx/tLQkFl
         GAW8w5VqZmlJ287CnfATI6dokHW5Qvv41i2mK8vzJ7SXkZhaGakd/vXB49he7n+7VJnO
         hdrw==
X-Gm-Message-State: ACrzQf2v2XZa0aLdxvRRflOzeyIhrrSGaaqeVQv35ozMbxotbnPe5YJ6
	KLQ3lbQF685GfWQSMxbFmURaiQ==
X-Google-Smtp-Source: AMsMyM7t/tYjxw7gvw0BE7+B84lBobFVhCq3i1RPX9g8PP5m1xNdfXgX20GAHj2NmVrvxhxQI2gcAQ==
X-Received: by 2002:a05:6214:76d:b0:4bb:e59a:17dc with SMTP id f13-20020a056214076d00b004bbe59a17dcmr23494431qvz.125.1667498411617;
        Thu, 03 Nov 2022 11:00:11 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb? ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
        by smtp.gmail.com with ESMTPSA id i18-20020a05620a405200b006fa8299b4d5sm720239qko.100.2022.11.03.11.00.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 11:00:10 -0700 (PDT)
Message-ID: <aa7e325f-2986-005a-3d0a-579ac46491f6@linaro.org>
Date: Thu, 3 Nov 2022 14:00:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 net-next 2/8] dt-bindings: net: mediatek: add WED RX
 binding for MT7986 eth driver
Content-Language: en-US
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y2P/jq34IjyM2iXu@lore-desk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_110019_076620_4BB24557 
X-CRM114-Status: GOOD (  19.15  )
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

On 03/11/2022 13:51, Lorenzo Bianconi wrote:
>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
>>> new file mode 100644
>>> index 000000000000..6c3c514c48ef
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-boot.yaml
>>
>> arm is only for top-level stuff. Choose appropriate subsystem, soc as
>> last resort.
> 
> these chips are used only for networking so is net folder fine?

So this is some MMIO and no actual device? Then rather soc.

> 
>>
>>> @@ -0,0 +1,47 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-boot.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title:
>>> +  MediaTek Wireless Ethernet Dispatch WO boot controller interface for MT7986
>>> +
>>> +maintainers:
>>> +  - Lorenzo Bianconi <lorenzo@kernel.org>
>>> +  - Felix Fietkau <nbd@nbd.name>
>>> +
>>> +description:
>>> +  The mediatek wo-boot provides a configuration interface for WED WO
>>> +  boot controller on MT7986 soc.
>>
>> And what is "WED WO boot controller?
> 
> WED WO is a chip used for networking packet processing offloaded to the Soc
> (e.g. packet reordering). WED WO boot is the memory used to store start address
> of wo firmware. Anyway I will let Sujuan comment on this.

A bit more should be in description.

> 
>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - mediatek,mt7986-wo-boot
>>> +      - const: syscon
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    soc {
>>> +      #address-cells = <2>;
>>> +      #size-cells = <2>;
>>> +
>>> +      wo_boot: syscon@15194000 {
>>> +        compatible = "mediatek,mt7986-wo-boot", "syscon";
>>> +        reg = <0 0x15194000 0 0x1000>;
>>> +      };
>>> +    };
>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
>>> new file mode 100644
>>> index 000000000000..6357a206587a
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-ccif.yaml
>>> @@ -0,0 +1,50 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-ccif.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek Wireless Ethernet Dispatch WO controller interface for MT7986
>>> +
>>> +maintainers:
>>> +  - Lorenzo Bianconi <lorenzo@kernel.org>
>>> +  - Felix Fietkau <nbd@nbd.name>
>>> +
>>> +description:
>>> +  The mediatek wo-ccif provides a configuration interface for WED WO
>>> +  controller on MT7986 soc.
>>
>> All previous comments apply.
>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - mediatek,mt7986-wo-ccif
>>> +      - const: syscon
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +    soc {
>>> +      #address-cells = <2>;
>>> +      #size-cells = <2>;
>>> +
>>> +      wo_ccif0: syscon@151a5000 {
>>> +        compatible = "mediatek,mt7986-wo-ccif", "syscon";
>>> +        reg = <0 0x151a5000 0 0x1000>;
>>> +        interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
>>> +      };
>>> +    };
>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
>>> new file mode 100644
>>> index 000000000000..a499956d9e07
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wo-dlm.yaml
>>> @@ -0,0 +1,50 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7986-wo-dlm.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek Wireless Ethernet Dispatch WO hw rx ring interface for MT7986
>>> +
>>> +maintainers:
>>> +  - Lorenzo Bianconi <lorenzo@kernel.org>
>>> +  - Felix Fietkau <nbd@nbd.name>
>>> +
>>> +description:
>>> +  The mediatek wo-dlm provides a configuration interface for WED WO
>>> +  rx ring on MT7986 soc.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: mediatek,mt7986-wo-dlm
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  resets:
>>> +    maxItems: 1
>>> +
>>> +  reset-names:
>>> +    maxItems: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - resets
>>> +  - reset-names
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    soc {
>>> +      #address-cells = <2>;
>>> +      #size-cells = <2>;
>>> +
>>> +      wo_dlm0: wo-dlm@151e8000 {
>>
>> Node names should be generic.
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> DLM is a chip used to store the data rx ring of wo firmware. I do not have a
> better node name (naming is always hard). Can you please suggest a better name?

The problem is that you added three new devices which seem to be for the
same device - WED. It looks like some hacky way of avoid proper hardware
description - let's model everything as MMIO and syscons...

For such model - register addresses exposed as separate devices - I do
not have appropriate name, but the real problem is not in the name. It's
in the hardware description.


Best regards,
Krzysztof


