Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FC3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 12:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20hOXgHS4fSMKzf2+VEVhuMt/xTY7rwW+BkuR688jQI=; b=Flz0CpLvfozNHBngUCNMxXt1e6
	u+X0kBbHQPjhxJTgXXiuH+7u65NlnkNiMn+1oSrXdPrOxOoDjzTQXkaiba52DNXq6SOB94hgTws16
	pIu0sJJUawGoI9kF8pNQ+1vWsFB8KQC8HuHAs1R5mzSxsM5z58RlzupdlSmexxhXx8fSJBx2PdnCq
	kr0DGfPGCWx7LO3/D4UngI/EprINV5nAzI4+tP1Iuvy5VNk3QrDp85GO5eDYtoWFHAbgQJ5h70ecx
	+jjnf3hhqfBI/nh/uDI0yjwvF6yyxOrskQdj/JEXA5w6DLChXqYI3uz+h/EPCGm8hWxBb8CvDZU7M
	LL61G58A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3cbs-005DCG-E4; Tue, 21 Jun 2022 12:03:56 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3cbg-005D74-Cr
	for linux-mediatek@lists.infradead.org; Tue, 21 Jun 2022 12:03:46 +0000
Received: by mail-ed1-x52d.google.com with SMTP id o10so19052059edi.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jun 2022 05:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=20hOXgHS4fSMKzf2+VEVhuMt/xTY7rwW+BkuR688jQI=;
        b=G0fDoM6iYkilX2J2us0oDAnu2OXLTFoGwQGcIQ61gW+KroUP3F34RD4BJ1IlsFeOKi
         8f8+8bvCxI+BjoQhqGDC8Bmih/uM2UMNh0HfP5LHcTP5thFbXw57Wl/JjRk3EIaphPgC
         /r9iH8r0MZLQ/ZiseG3jh/J+adm1eZ8inUGHNLerNsDK1bRyGyI9t7y5tTAvDDVdeB1B
         xwLgffZMmNEJhBSsXCtiJaQ53o6MWqYnFwBx1ozBtod/JlyyMz+pR8DZEdtPNbe/8IO5
         pZskEbg504lpOOtekPsnMcsUaoBfJ2WNfNfE5rDxevNShYsJWXp++OGVY0izxGKuJIRl
         k4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=20hOXgHS4fSMKzf2+VEVhuMt/xTY7rwW+BkuR688jQI=;
        b=yz3vx3fDLXR+9EDsFjFMP+6JOdZMFAjNi2HuPEu/PS451KTkYvzKbDIFGMiLJlaHtj
         ZTqxgJEuLeAHvtpJ1tyVtpD0EPBFKQw91508oX8djDZh6i3aVfy0k+zMcrbP3z1hAGeL
         v1NE1J2Fo3VewP6BF+BCbrS8kjCCVDLPAEekJ2MAY4NygXOovR+HObTTmMY+0CacH8cl
         WUq2QW1z71wgqjBXsaE2i2SO1gVpot3DFYT4HtC1vmEAAC0uR889BFsVIBLLVsQJtlBT
         S1tlGYCa0CPVntGDAhgug02oAp5Ya/5Pbx+5jqQltBIgNjPU0yNZaKUmoo2MAf4Jctqu
         zxOQ==
X-Gm-Message-State: AJIora+DWVMJ1bhqv2htQAKubKJhJsOsmeQon4x9gBiUpHW74VSYFSpu
	L1EQOGN68cb2P9o4tYVa3+YI02nPV85sQA==
X-Google-Smtp-Source: AGRyM1vuqpi73lfGfP1AhQV/V6GZDUbkiFuWxRqJMB+M0pVkbVaH3yMP1muhb8X6319Kpo4FNFG3DQ==
X-Received: by 2002:a05:6402:3689:b0:435:95b0:edf2 with SMTP id ej9-20020a056402368900b0043595b0edf2mr3480378edb.279.1655813021696;
        Tue, 21 Jun 2022 05:03:41 -0700 (PDT)
Received: from [192.168.0.220] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id n12-20020a170906840c00b00706c50870a0sm7470520ejx.194.2022.06.21.05.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 05:03:41 -0700 (PDT)
Message-ID: <3e02909d-131a-7899-f02b-fa0afcbef1d9@linaro.org>
Date: Tue, 21 Jun 2022 14:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 03/15] dt-bindings: leds: mt6370: Add Mediatek mt6370
 current sink type LED indicator
Content-Language: en-US
To: szuni chen <szunichen@gmail.com>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-iio <linux-iio@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Linux PM
 <linux-pm@vger.kernel.org>, USB <linux-usb@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 ChiYuan Huang <cy_huang@richtek.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-4-peterwu.pub@gmail.com>
 <91e9e3af-8208-7535-1864-08744f934593@linaro.org>
 <CA+hk2fZbh0=8gurGS95XpXrYyF3NbwFbFMcygcrW_q10m0zinA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CA+hk2fZbh0=8gurGS95XpXrYyF3NbwFbFMcygcrW_q10m0zinA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_050344_500270_E47E114F 
X-CRM114-Status: GOOD (  15.54  )
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

On 20/06/2022 05:07, szuni chen wrote:
> Dear Krzysztof,
> 
> Thank you for the valuable command.
> 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> 於 2022年6月17日 週五 清晨5:09寫道：
>>
>> On 13/06/2022 04:11, ChiaEn Wu wrote:
>>> From: ChiYuan Huang <cy_huang@richtek.com>
>>>
>>> Add Mediatek mt6370 current sink type LED indicator binding documentation.
>>>
>>> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
>>> ---
>>>  .../leds/mediatek,mt6370-indicator.yaml       | 48 +++++++++++++++++++
>>>  1 file changed, 48 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
>>> new file mode 100644
>>> index 000000000000..42b96c8047a3
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
>>> @@ -0,0 +1,48 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/leds/mediatek,mt6370-indicator.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: LED driver for MT6370 PMIC from MediaTek Integrated.
>>> +
>>> +maintainers:
>>> +  - Alice Chen <alice_chen@richtek.com>
>>> +
>>> +description: |
>>> +  This module is part of the MT6370 MFD device.
>>> +  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: mediatek,mt6370-indicator
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 0
>>> +
>>> +patternProperties:
>>> +  "^(multi-)?led@[0-3]$":
>>
>> If this is multi-led, then you should reference
>> /schemas/leds/leds-pwm-multicolor.yaml
>>
>> See other examples using it.
> 
> In my opinion, leds-pwm-multicolor.yaml is used for external pwm
> signals, and needs to assign an external pwm property.
> But our pwm leds use an internal clock to generate the pwm signal. Is
> leds-class-multicolor.yaml more appropriate?

Yeah, I meant the latter but pasted wrong file.
/schemas/leds/leds-class-multicolor.yaml#

Best regards,
Krzysztof

