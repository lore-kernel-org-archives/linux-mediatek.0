Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A441DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 09:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xOwvY8z7z7A9VTKu9voj22+BaDBStRsLJ/FebZHnxzk=; b=f3MuTry4dAUg2W
	3FS/Nd4kDuFcMwAsRIefC3MUXwe+47ckpPsHs24y+ETGGfPGwyeoCKhlxeW/uvERdRPJM8fhwAFAw
	xjsIwMnryHyFXhzxYaOddXyZ30EU14YZlxn4nIeB25AqRhiZR3NZiii9CXgjmbSSlwRiEvI+1yc8d
	A9sRM4mJtMTrSUDAI+59U4sp6o2+2hOQgn2oPLemcjSfZ65ORuLcEn9K9/8+R9ANGGHJCoJ/g+/H9
	q1O+g1xAUrfE2owph/5Nn+/sBAktPPkrAvU7p5AWk6cHUO1XO4jUh8WPWC+tBpijDV7P5bBAOZj96
	fg2a9BOD6XrvmrmpvRXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nje9l-000nys-27; Wed, 27 Apr 2022 09:40:21 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nje9D-000niN-J2
 for linux-mediatek@lists.infradead.org; Wed, 27 Apr 2022 09:39:49 +0000
Received: by mail-ed1-x531.google.com with SMTP id y21so1272367edo.2
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Apr 2022 02:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+uQXRxF8+iECYsyuX3FAGjlPg6lPCQesnoPfKb3uAD0=;
 b=kXbjCRl/9jCP6u+NnPcF+Y+vLZZ93vjJjPpewfEem9AN45JCCBgFIYmupbdh+RCrDn
 DfFERC8GbtZ7/LuJ3cwY+2TQ3N/16e3duX+/vbSsSZZfSEKEsClf93+aAu13KB5ccIVo
 K0Nk1jsbzBUv8hgDNnQGwDyIVtNqazsdhYBhfXcpsrZThCGdxtNa6My9UJie4OOCr85T
 7h/tLCHC3svkj6kedl/5rD8vmKNyBVKrhg+TOFtKiaU2G0j5J5SH7BvGpjNCjntKaMdN
 9T8DoOGrmKRBiBISkgr/2kahjg8prXsa5Mmh/UDQWyncfeXG4lRvGE7YABwkArrdn3ql
 0UWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+uQXRxF8+iECYsyuX3FAGjlPg6lPCQesnoPfKb3uAD0=;
 b=ev0lZL4JsvOk4Fpb2UjbL5BobVGXrhE7ehArwPtfghlL5sj32lx9BTpRIUVvbVrVYX
 hY9ObClT4BRT1B4Fj0QOr2h/BYHjr1uDwzN0NbWmD2GkeDq/mEX1qkv+39RjGvK5bi7g
 u9O7rufuFz6SHonthL4la+KzvZxYd9YG7wdHCCeY5D3FJ6h6bmoTHxQvP8OmX9uYifnR
 GlF4o6G3NrHIjyENmM9ibBNxq8NrAc3LLzkgOkQqO6+gYRgIzwoREVysMXHZJEGgg4/f
 lXai+KZ8g/blVe8degq0HgYIZDWuQHMBMNOCWnTodeE1YuYj85yWqkmbhRCuJxnoLeMJ
 8hxw==
X-Gm-Message-State: AOAM5314zqtY3LuRkK86FSYtky2fEw21JCANplQ0xyk2rr/SvQiOXVjn
 O4j3f0X4AAWF+7ItPM0FYNGLMw==
X-Google-Smtp-Source: ABdhPJwH2qoOAKjvHzPASguxWPUSxx7wD6r6JTmOguOcxLLGBTjoSo5P0ASVcbtW8KFZbarsO1KlnQ==
X-Received: by 2002:aa7:d916:0:b0:425:d75f:ae68 with SMTP id
 a22-20020aa7d916000000b00425d75fae68mr20198174edr.270.1651052384008; 
 Wed, 27 Apr 2022 02:39:44 -0700 (PDT)
Received: from [192.168.0.253] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 p27-20020a50cd9b000000b00425d5219372sm6378024edi.50.2022.04.27.02.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 02:39:43 -0700 (PDT)
Message-ID: <0c63c24a-8014-2491-095c-77893d2141d9@linaro.org>
Date: Wed, 27 Apr 2022 11:39:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/1] dt-bindings: nvmem: mediatek: Convert mtk-efuse
 binding to YAML
Content-Language: en-US
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Lala Lin <lala.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
References: <20220425084800.2021-1-allen-kh.cheng@mediatek.com>
 <20220425084800.2021-2-allen-kh.cheng@mediatek.com>
 <e64bdca8-7b18-b450-830c-ca07946a73fb@linaro.org>
 <9d65b713e3ffdd34dcca532c4c97fa98b124bde4.camel@mediatek.com>
 <0169c4ac-fdce-29b7-553a-14dc7df532d1@linaro.org>
 <a8e212a0e0449e015a33e76b320266376d4b9be6.camel@mediatek.com>
 <89609af9-5feb-0553-5e39-c97c4750b5a1@linaro.org>
 <33c754a7b6e4cd631bb2aeef002d34a6c25d6689.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <33c754a7b6e4cd631bb2aeef002d34a6c25d6689.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_023947_689435_C93F7016 
X-CRM114-Status: GOOD (  18.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 27/04/2022 11:28, allen-kh.cheng wrote:
> Hi Krzysztof,
> 
> On Tue, 2022-04-26 at 12:14 +0200, Krzysztof Kozlowski wrote:
>> On 26/04/2022 12:02, allen-kh.cheng wrote:
>>> Hi Krzysztof,
>>>
>>> On Tue, 2022-04-26 at 08:31 +0200, Krzysztof Kozlowski wrote:
>>>> On 26/04/2022 08:23, allen-kh.cheng wrote:
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    oneOf:
>>>>>>> +      - enum:
>>>>>>> +          - mediatek,mt8173-efuse
>>>>>>> +          - mediatek,efuse
>>>>>>
>>>>>> Still no changes...
>>>>>>
>>>>>
>>>>> I just want to confirm again.
>>>>>
>>>>> "Generic compatibles should not be used standalone"
>>>>>
>>>>> It seems we should remove mediatek,efuse and keep
>>>>> "mediatek,mt8173-
>>>>> efuse"in binding. have I got that right?
>>>>
>>>> You should comment for which chipsets this compatible is and add
>>>> a
>>>> deprecated:true. In such case it cannot be part of enum but
>>>> separate
>>>> item in this oneOf.
>>>>
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>> Thanks for your suggestions, I would plan to send PATCHs as below,
>>>
>>> We have a PATCH 01 for current accepted dts
>>>
>>> properties:
>>>   compatible:
>>>     oneOf:
>>>       - enum:
>>>         - mediatek,efuse
>>>
>>>         - mediatek,mt8173-efuse
>>>         description: Only mt8173-efuse
>>> with generic fallback should be used
>>>       - items:
>>>           - enum:
>>>     
>>> - mediatek,mt7622-efuse
>>> 			  ...
>>>           - const: mediatek,efuse
>>>
>>> Then add PATCH 02 to deprecate it
>>>
>>> properties:
>>>   compatible:
>>>     oneOf:
>>>       - enum:
>>>         - mediatek,efuse
>>>         - mediatek,mt8173-efuse
>>>         deprecated: true
>>>         description: The mediatek,efuse is a generic fallback for
>>> other
>>> Chipset. Do not use the single compatible such as mediatek,efuse
>>> or mediatek,mt8173-efuse. It is deprecated.
>>>       - items:
>>>           - enum:
>>>               - mediatek,mt7622-efuse
>>>               ...
>>>           - const: mediatek,efuse
>>>
>>>
>>> PATCH 03 for 8173
>>>
>>> update mt8173.dtsi 
>>>
>>> change compatible from "mediatek,mt8173-efuse" to "mediatek,mt8173-
>>> efuse", "mediatek,efuse";
>>>
>>>
>>> Do you think it'd be okay ?
>>
>> The idea is correct, but as I said it cannot be part of enum, but
>> separate item in oneOf. You should see an error when testing your
>> patch.
>>
>>
>> Best regards,
>> Krzysztof
> 
> I have tested 
> make DT_CHECKER_FLAGS=-m dt_binding_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml
> 
> make ARCH=arm64 dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml
> 
> Is the following correct as final version ?

Almost :)

> 
> properties:
>   compatible:
>     oneOf:
>       - const: mediatek,mt8173-efuse
> #Don't use this in new dts files

This compatible above is correct for mt8173, isn't it?

>         deprecated: true
>       - const:
> mediatek,efuse
>         deprecated: true
>         description:
>          
> Please use mediatek,efuse as fallback.

Description does not match. This should be something like:
"MediaTek efuse for MT8173. Deprecated, use mediatek,mt8173-efuse instead"



Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
