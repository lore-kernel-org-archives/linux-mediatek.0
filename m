Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AF8ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Sep 2022 11:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDe4HrG4uEg41My7bBkuCl5g5S/VZFrKNQ+TfpERTIw=; b=PyxAnZLMYZ/+wpAO8/Z+RX7DT9
	KVYC0tn3w+p4YMQjbTpS1ai0XH2nJa+xGXhB2wDFi2jgPoTFtlCmDU94Pv/h8+jPF7Tjg39lVFQ8o
	IaFURk/C+iUq193LvTEDxd32Oy3v/4eb1wSCgBJ0uGQYgehtFJ5f2FZWdQ7IZBSHotTSmCWy7Iup5
	95ZeAIof5bF/d+runZxC9Z4e5p+gccSohSsJ7cZNjCIBhbYP+7OoI8yKa+/vCas8W83lUWdSfopKu
	oDtfp6z9AURW/cKiVl4SGCXjASHu5eUq0+/lL6FezULGFAhTyMKtuX0ZCOvYPNiWiIN4VGqohCG9I
	l/YeXSBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVABy-001951-G6; Mon, 05 Sep 2022 11:23:03 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV8zK-00HK4l-17
	for linux-mediatek@lists.infradead.org; Mon, 05 Sep 2022 10:05:58 +0000
Received: by mail-lf1-x136.google.com with SMTP id z6so12373581lfu.9
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Sep 2022 03:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=mDe4HrG4uEg41My7bBkuCl5g5S/VZFrKNQ+TfpERTIw=;
        b=pL6KsdPpGN8vx+guoN/9sDI2fTIQYSRQ23XeO0oBUWNoMDlQ8GeQ1wymljXpoV6Kyk
         Vzq8VRGfRiAp79OtTlei++CwoC8o6Wgl4Icw6YfMqa16e4Gk9bT1qqp8564T169qoqSH
         Sqqe5Kktsi5SowVpwmZzCHoJSKq1U1YkqM0sxJS+yb8NPbHM0eNx/44ilva8DW+JcYFI
         IZA3qGFV6WhuIKZANEVLyTRIlJFpJcR6P8JMG0J4WuI++NHESawBZAYHxd9vm7muCZRN
         an6QxoREoWZaAS3+tZpYlk4VFOMHTKZAIz5CQfvh+SuDuaI14hlQYiy38rORIaEe2tdl
         1/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=mDe4HrG4uEg41My7bBkuCl5g5S/VZFrKNQ+TfpERTIw=;
        b=lXzEC8NfSpWC+wlHkvciro3vGYqM/05GBSznZ+cfsKbpZ0cFwUtcypR0+81o3ngdm4
         VNj0DS6mdLqeuEVHp+ghrRgWy6ur4CZWi4TSm5k2ak4lcBTiMk4n3wYRSbO26vpQ6AaZ
         Pn2I2YOsVZWfvDhWtFP73Nw1hRD7U23ikKynWviP8cCC6MXAhBP2r/OksBberhhycVLb
         JtAtQHxAAM5aadTb//GhdNE/RiI9gf/rJI3XoEvgo5hM5vg8+67rDxCbhQ6AHt/e4wmH
         xGmAH4BMstp1fWiPQRyYxR4i/d9B+VbHQBE7SC9HIcZFEUPxKDzGLX8rzKD7rGVuhz+F
         RC3A==
X-Gm-Message-State: ACgBeo1SmE5CtzZ1uk0lFA7n+bEgq6fZ1kKaVeZ3tHaz+kD8jVR3KxzX
	c26r7WCgq9GHihtwxpfJVmu+iQ==
X-Google-Smtp-Source: AA6agR65NVdbjPjaLtr2xdntMfgD7vsI/O+8yP6SsfEIl9dauBVNVcbWLhOuH+KrIP9k3b9ouwRtaA==
X-Received: by 2002:a05:6512:1329:b0:492:e050:b0dc with SMTP id x41-20020a056512132900b00492e050b0dcmr17408365lfu.136.1662372351009;
        Mon, 05 Sep 2022 03:05:51 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id e2-20020ac25462000000b004949f7cbb6esm1144703lfn.79.2022.09.05.03.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 03:05:50 -0700 (PDT)
Message-ID: <4e5d2fc2-5816-ba31-6a75-da669eddc5cf@linaro.org>
Date: Mon, 5 Sep 2022 12:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] dt-bindings: arm: mediatek: Add new bindings of
 MediaTek frequency hopping
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@collabora.com,
 sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Edward-JW Yang <edward-jw.yang@mediatek.com>
References: <20220831124850.7748-1-johnson.wang@mediatek.com>
 <20220831124850.7748-3-johnson.wang@mediatek.com>
 <b1296c37-5283-81f7-1939-7ea20e1f4d0d@linaro.org>
 <67237f85d1c4bc72906848d811988209d0112c06.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <67237f85d1c4bc72906848d811988209d0112c06.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_030554_246083_0ADAFE3E 
X-CRM114-Status: GOOD (  14.60  )
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

On 02/09/2022 08:39, Johnson Wang wrote:
> On Wed, 2022-08-31 at 16:19 +0300, Krzysztof Kozlowski wrote:
>> On 31/08/2022 15:48, Johnson Wang wrote:
>>> Add the new binding documentation for MediaTek frequency hopping
>>> and spread spectrum clocking control.
>>>
>>> Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
>>> Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
>>> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
>>> ---
>>>  .../bindings/arm/mediatek/mediatek,fhctl.yaml | 49
>>> +++++++++++++++++++
>>>  1 file changed, 49 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yam
>>> l
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yam
>>> l
>>> new file mode 100644
>>> index 000000000000..c5d76410538b
>>> --- /dev/null
>>> +++
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yam
>>> l
>>> @@ -0,0 +1,49 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: 
>>> https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,fhctl.yaml*__;Iw!!CTRNKA9wMg0ARbw!ysl-bMp7yP9Ym70o6EVB8A36MBxcXGap8doEKR_SbaAQSy8-_RU5jvrWTjzETut_6eXNGut4j-3dY0q7xJdpQbmaOw$
>>>  
>>> +$schema: 
>>> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!ysl-bMp7yP9Ym70o6EVB8A36MBxcXGap8doEKR_SbaAQSy8-_RU5jvrWTjzETut_6eXNGut4j-3dY0q7xJezt7_RBw$
>>>  
>>> +
>>> +title: MediaTek frequency hopping and spread spectrum clocking
>>> control
>>> +
>>> +maintainers:
>>> +  - Edward-JW Yang <edward-jw.yang@mediatek.com>
>>> +
>>> +description: |
>>> +  Frequency hopping control (FHCTL) is a piece of hardware that
>>> control
>>> +  some PLLs to adopt "hopping" mechanism to adjust their
>>> frequency.
>>> +  Spread spectrum clocking (SSC) is another function provided by
>>> this hardware.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: mediatek,fhctl
>>
>> You need SoC/device specific compatibles. Preferably only SoC
>> specific,
>> without generic fallback, unless you can guarantee (while
>> representing
>> MediaTek), that generic fallback will cover all of their SoCs?
>>
> 
> Hi Krzysztof,
> 
> At this moment, we plan to support FHCTL feature for MT8186 only.
> 
> If you prefer SoC-specific compatble, we will improve that in the next
> version.

Then make it only for mt8186.

Best regards,
Krzysztof

