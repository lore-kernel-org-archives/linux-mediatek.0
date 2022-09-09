Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26ACECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 08:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TdRv4Wvc6oHS0pvj1901N519UHi3MDu4bQAyIBeGC4=; b=gryXwLNxGibRIVdiYcznMFXWmq
	D951BYmtpIk6Upy+KtdtzV/dis7jD33kvT5LvMxP5GQKrKEJ9WkuwoucvggHiJ1cT8LunHfVNtLC/
	vo67NQDKfDtqV6xOa/rFWFE/N1uWISAXbdslrhL/vVNbgSpWFlpEVpv9RuqkOzxhijviNlPAKfsov
	vo5TY7M8PBj3vN/DKzo5EhOrLZNka3e5fMlwYrevyjx+UoWwlYuNNFpGGb5dEqgiXvdIR9laMo4V1
	nuXH0arRQ6dgzW7OSFVNSBiu0tnHrA6vs4dQSmjZHch1x5al5Wvi0FZgupvonL6545jph2SMd5tBL
	qjX7Hb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZMR-00EaLG-4m; Fri, 09 Sep 2022 08:27:39 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWZMO-00EaCR-3H
	for linux-mediatek@lists.infradead.org; Fri, 09 Sep 2022 08:27:37 +0000
Received: by mail-lf1-x131.google.com with SMTP id z25so1488234lfr.2
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Sep 2022 01:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=6TdRv4Wvc6oHS0pvj1901N519UHi3MDu4bQAyIBeGC4=;
        b=XMWDhxRGhVX65V7YDBmfIGll8waiB6X7dAYO0GQEbtawy4vMr0pP/2ToJ4xaL6caNZ
         EgS/j7dpEL6epLlR9tEvlSNGrgvFx5+tbUzhMBxfg/Cu0qzGI8D53lQtB00RC2DqGXIh
         MGs/XXpm2ZKCvHpuwGnijvqUQeC9pcR18TIsctBWfRxYc6n+QKMraYZq8vptK8fLLd+8
         ILGqjLgyc1d9YTYEap6KzBars/x00+uBYHKixpMkIuh8T5uPeN45cRc5lqyAxHXh2VIa
         S/8DKdOzyu3nIenhuEuTpNz+RzJZVEd7J2Wim191uJbaRWpMr79QvQYBV3U2OWEXSxXm
         tOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=6TdRv4Wvc6oHS0pvj1901N519UHi3MDu4bQAyIBeGC4=;
        b=i+3hn/dnn2QfBXTFIWz8MCejboqFIxK+qKrzMVVeH1ss7dyEPRIr1gesy7cBPXlY4x
         lZk5TNVt6pgeqWHd2JBsOdtp1z7WwvAKLft0WFvR7NIJm6jLKFXnWgzlh7B725gF8mto
         w8cSw++H9kbKP9PsDTNlWki//+g3MLNkOn64XoidOHWvJWsstXOVeAzmvAL17aqugNE+
         CJeia3ZrorP+xpRwIAeR8Ka7RgfTUDHYnNSefjZGnaLPeLr9+SstBKvBYf3tc9HDqkOB
         2zHQXdAqSQIX2n9hyrtRDbCeaxXL2pVZ90rVIqRO9vt532HpmPBcY4b3Nbj5kEORzJB0
         8obQ==
X-Gm-Message-State: ACgBeo2ZG2+jgVTkG/WT1xb53XNREBy0czPsDz1lUpuWUsuyMqy0yxni
	M++MeJqQaRpuPIA7orutc8qU94FSmJRqDQ==
X-Google-Smtp-Source: AA6agR4Q8p4cs8ovetX93/cNs0qN6NAUGYIxt6++wNgde0Cow1hefBPT+1Q2RP51wJGOSU0Bc6Qdfg==
X-Received: by 2002:ac2:5fad:0:b0:493:2ce:6938 with SMTP id s13-20020ac25fad000000b0049302ce6938mr3812004lfe.541.1662712052173;
        Fri, 09 Sep 2022 01:27:32 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o24-20020a056512053800b00494643db68fsm187355lfc.81.2022.09.09.01.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 01:27:31 -0700 (PDT)
Message-ID: <8090e2e1-afce-9341-2ae7-3f4e094409b6@linaro.org>
Date: Fri, 9 Sep 2022 10:27:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/7] dt-bindings: phy: mediatek,tphy: add property to set
 pre-emphasis
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>
References: <20220819091344.2274-1-chunfeng.yun@mediatek.com>
 <20220819091344.2274-2-chunfeng.yun@mediatek.com>
 <438da392-f419-ad76-7e91-aa4aab36e12c@linaro.org>
 <816ecf6287533137b750c8bde9de5830e4229c56.camel@mediatek.com>
 <bee8abe5-0299-d05e-643c-4810aa33f978@linaro.org>
 <1a16cce9fe164bafc06ae193310be71c6f645d75.camel@mediatek.com>
 <000babd8-5980-3d77-f156-324b3442cbe7@linaro.org>
 <114c357f8d7f049d21ede789a292a8e2d45f4c61.camel@mediatek.com>
 <0a82842d-283c-e266-84f4-6306f29b61da@linaro.org>
 <8dcb4de53a52ab44d40f490099b6ed13e5ef7fe0.camel@mediatek.com>
 <3c180570-ecf9-3db4-c698-39c1b4679c6e@linaro.org>
 <3b18a9c687af38f7299261c9a589ef3dfc5a1aa7.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3b18a9c687af38f7299261c9a589ef3dfc5a1aa7.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_012736_147107_1A7C8A22 
X-CRM114-Status: GOOD (  26.06  )
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

On 09/09/2022 05:03, Chunfeng Yun wrote:
> On Wed, 2022-08-31 at 09:03 +0300, Krzysztof Kozlowski wrote:
>> On 31/08/2022 06:00, Chunfeng Yun wrote:
>>> On Tue, 2022-08-30 at 13:08 +0300, Krzysztof Kozlowski wrote:
>>>> On 29/08/2022 05:37, Chunfeng Yun wrote:
>>>>> On Fri, 2022-08-26 at 09:36 +0300, Krzysztof Kozlowski wrote:
>>>>>> On 26/08/2022 08:36, Chunfeng Yun wrote:
>>>>>>> On Tue, 2022-08-23 at 13:24 +0300, Krzysztof Kozlowski
>>>>>>> wrote:
>>>>>>>> On 22/08/2022 10:07, Chunfeng Yun wrote:
>>>>>>>>> On Fri, 2022-08-19 at 15:15 +0300, Krzysztof Kozlowski
>>>>>>>>> wrote:
>>>>>>>>>> On 19/08/2022 12:13, Chunfeng Yun wrote:
>>>>>>>>>>> Add a property to set usb2 phy's pre-emphasis.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Chunfeng Yun <
>>>>>>>>>>> chunfeng.yun@mediatek.com>
>>>>>>>>>>> ---
>>>>>>>>>>>  Documentation/devicetree/bindings/phy/mediatek,tph
>>>>>>>>>>> y.ya
>>>>>>>>>>> ml |
>>>>>>>>>>> 7
>>>>>>>>>>> +++++++
>>>>>>>>>>>  1 file changed, 7 insertions(+)
>>>>>>>>>>>
>>>>>>>>>>> diff --git
>>>>>>>>>>> a/Documentation/devicetree/bindings/phy/mediatek,tp
>>>>>>>>>>> hy.y
>>>>>>>>>>> aml
>>>>>>>>>>> b/Documentation/devicetree/bindings/phy/mediatek,tp
>>>>>>>>>>> hy.y
>>>>>>>>>>> aml
>>>>>>>>>>> index 848edfb1f677..aee2f3027371 100644
>>>>>>>>>>> ---
>>>>>>>>>>> a/Documentation/devicetree/bindings/phy/mediatek,tp
>>>>>>>>>>> hy.y
>>>>>>>>>>> aml
>>>>>>>>>>> +++
>>>>>>>>>>> b/Documentation/devicetree/bindings/phy/mediatek,tp
>>>>>>>>>>> hy.y
>>>>>>>>>>> aml
>>>>>>>>>>> @@ -219,6 +219,13 @@ patternProperties:
>>>>>>>>>>>          minimum: 1
>>>>>>>>>>>          maximum: 15
>>>>>>>>>>>  
>>>>>>>>>>> +      mediatek,pre-emphasis:
>>>>>>>>>>> +        description:
>>>>>>>>>>> +          The selection of pre-emphasis (U2 phy)
>>>>>>>>>>> +        $ref:
>>>>>>>>>>> /schemas/types.yaml#/definitions/uint32
>>>>>>>>>>> +        minimum: 1
>>>>>>>>>>> +        maximum: 3
>>>>>>>>>>
>>>>>>>>>> Instead of hard-coding register values in bindings,
>>>>>>>>>> you
>>>>>>>>>> should
>>>>>>>>>> rather
>>>>>>>>>> describe here feature/effect. If it is in units, use
>>>>>>>>>> unit
>>>>>>>>>> suffixes.
>>>>>>>>>> If
>>>>>>>>>> it is some choice, usually string enum is
>>>>>>>>>> appropriate.
>>>>>>>>>
>>>>>>>>> How about changing description as bellow:
>>>>>>>>>
>>>>>>>>> "The level of pre-emphasis, increases one level, boosts
>>>>>>>>> the
>>>>>>>>> relative
>>>>>>>>> amplitudes of signal's higher frequencies components
>>>>>>>>> about
>>>>>>>>> 4.16%
>>>>>>>>> (U2
>>>>>>>>> phy)"
>>>>>>>>>
>>>>>>>>
>>>>>>>> Still the question is what is the unit. 4.16%?
>>>>>>>
>>>>>>> No unit, it's a level value, like an index of array.
>>>>>>>
>>>>>>
>>>>>> So a value from register/device programming? 
>>>>>
>>>>> Yes
>>>>>> Rather a regular units
>>>>>> should be used if that's possible. If not, this should be
>>>>>> clearly
>>>>>> described here, not some magical number which you encode into
>>>>>> DTS...
>>>>>
>>>>> Ok, I'll add more descriptions.
>>>>
>>>> Better use logical value, e.g.
>>>>
>>>
>>>
> https://urldefense.com/v3/__https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml*L38__;Iw!!CTRNKA9wMg0ARbw!1e-h0R_uwcaHKfKC9qYfaRWYeuWRq1sLCGy3yupNmkFyuW5s1nmRotL7Y0vFG9ETLLTA$
>>>>  
>>>
>>> Optional unit may be -percent or -bp, but the value 4.16% * X
>>> (X=1,2,3...)is not an exact value, they are variable in a range and
>>> dependent more factors.
>>> So I think use level value is simple enough.
>>
>> Then again explain exactly what are the levels. How you wrote it last
>> time, -bp would do the trick.
> 
> There are many different methods of measuring pre-emphasis.
> The way used in MediaTek USB2 PHY as below:
> 
> pre-emphasis level equation = Vpp/Vs -1;
> Vpp: peak-peak voltage of differential signal;
> Vs : static voltage of differential signal, normal voltage, e.g. 400mV
> for u2 phy;
> 
> The pre-emphasis circuitry within t-phy can be dynamically programmed
> to three different levels of pre-emphasis. The exact value of
> pre-emphasis cannot be predetermined, because each device requires
> a percentage of pre-emphasis that is dependent on the output signal
> strength and transmission path characteristics.
> 
> Below shows three programmable pre-emphasis levels for a differential
> drive signal of 400 mV. The amount of pre-emphasis changes according
> to the transmission path parameters.
> 
> programmable level   typical pre-emphasis level
> 1                    4.16%
> 2                    8.30%
> 3                    12.40%
> 
> The reasons that why prefer to use programmable level in dt-binding as
> following:
> 1. as you said, -bp may do the trick, but the main problem is that
>    pre-emphasis level is variable on different SoC, and is also
>    variable even on different pcb for the same SoC. e.g. for the
>    programmable level 1, pre-emphasis level may be 6% on a platform,
>    but for the programmable level 2, pre-emphasis level may be also
>    6% on another platform;
>    I think use pre-emphasis level in property, e.g. 4.16%, the
>    deviation may be bigger than 40%, may cause confusion for users,
>    due to we can't promise that the actual measurement is about 4.16%,
>    it may be 2%, or 5% when measured;
> 2. the programmable / logical level is flexible when we support more
>    and pre-emphasis level, ans it is easy for us to tune the level
>    due to it's continuous value.
> 3. all other vendor properties that can't provide exact measurable
>    value in this dt-binding make use of logic level, I want to
>    keep them align;

Hm, that's clarifies a lot. Thanks for explanation. It's ok for me.


Best regards,
Krzysztof

