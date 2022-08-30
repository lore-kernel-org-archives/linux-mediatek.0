Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473B3ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 10:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N19Eu9EqzaEkmTOBC0jt5FngYVfZh2rgh5ndZ/dTCTc=; b=DuaUqlLKUENIxoCU/96Ke1gac2
	E1r/Gub66/I83SNCc88F7eixfa/yFVU5jwE8SIYll9sG3YRMlDRzoNq8jTrJveRhu4gwik7Z/+Vok
	8MBSHIvs7bM/8/Xl93C6EF3SFf004/WJQ9DeBHyUXP4+YtQ4MocNpmS8EkrilfJN2gaS4CrLhg3+/
	RrD6yPZhXyOaHnsEcJD6BiRGtSxayvMiHvlFdSX3op0p6KiSyxNC5do5dMQ5U9HKDFd/EZLyxn+uz
	qGA2BmtKC9vOy70HJx6SYTKcme4+Q3tLDgCg2ARjgitoC9QmXzjl6lRPADlKv25eQCAtQcAee4onu
	MRkTZufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSyJf-00G5r8-He; Tue, 30 Aug 2022 10:17:55 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSyAn-00G2NX-LX
	for linux-mediatek@lists.infradead.org; Tue, 30 Aug 2022 10:08:48 +0000
Received: by mail-lj1-x234.google.com with SMTP id bn9so10797546ljb.6
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Aug 2022 03:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=N19Eu9EqzaEkmTOBC0jt5FngYVfZh2rgh5ndZ/dTCTc=;
        b=fxY1lsTV62zsGEKiAo+a4wIiGAnUlTtBgxmUiOIuraruijHHX7JxfwK8AruouU3V5z
         yNpy8yVxgX3UDYVfwzyZj20vPm5C7xx4nPAfFuRt43/IOWKZGZdVUv71gtAdIbzzUZBZ
         VCcrn2jz89xJ08pbAyuP8RA4dnznTXQZOnfYeGtwyAuXEhdEwebJBgb+EqIYAcYBpCuI
         /lQVHLNw7lohBvkP4omqr7WVq2uvD9ZwzsD/VoENpxWfP30ewIFUplgygxOOYamixiVl
         nRB0ruMGSAxpswVujcDIhQNNjlCc6JAoG95gt/1cD+8mWNbKMnIxx3tHBeu9ezRh4OXZ
         qAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=N19Eu9EqzaEkmTOBC0jt5FngYVfZh2rgh5ndZ/dTCTc=;
        b=zEv35vHtNF1Avlc8+G/9yrfkuLbAH/RBc6i+6TVFuBQ9OI1fH8YKMMTuGABbbsOvEQ
         qiQHOmB8E1LZQ4fCBUgcKyoKv1UiBT6UHna9IpwillxoZlAP+xo4NVZkVI677p2KM4r2
         9gRZN3NsVx921yNwypsMOCCK+EYg872fHDzUAC8SKMXG9GgHic5EuF2PVxGK91qdvpCw
         EAa8NGg/uvKZxu1dSodBopU54IpM17u4lAJQ93cFDQPvmKLPrvQH923g3vJ1GfKax9P/
         2hNIFMpQZll2Ql98HziOAGzLWgdcmZuwLaHjGGa+Z1RAXwmUBuv7HMpzlpmU0smElsTN
         pLHw==
X-Gm-Message-State: ACgBeo297q5jHNjglj2Fi+Z2mw+mddeErDywBD81V0BGO1QWv+59uKGd
	ACDn3jpF37xxyg0xdmsrJidQeA==
X-Google-Smtp-Source: AA6agR62Niuw49b9olkAq7JO7drsxcXqoumzcv5joCz4jLIeKX8wzpv7EC+9+YmDlwyXzeP004eSEw==
X-Received: by 2002:a2e:93d0:0:b0:266:9e7b:9748 with SMTP id p16-20020a2e93d0000000b002669e7b9748mr1517754ljh.441.1661854122525;
        Tue, 30 Aug 2022 03:08:42 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id z24-20020a2eb538000000b00261b58cbf03sm947843ljm.87.2022.08.30.03.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 03:08:42 -0700 (PDT)
Message-ID: <0a82842d-283c-e266-84f4-6306f29b61da@linaro.org>
Date: Tue, 30 Aug 2022 13:08:40 +0300
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <114c357f8d7f049d21ede789a292a8e2d45f4c61.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_030845_756056_A218C676 
X-CRM114-Status: GOOD (  11.78  )
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

On 29/08/2022 05:37, Chunfeng Yun wrote:
> On Fri, 2022-08-26 at 09:36 +0300, Krzysztof Kozlowski wrote:
>> On 26/08/2022 08:36, Chunfeng Yun wrote:
>>> On Tue, 2022-08-23 at 13:24 +0300, Krzysztof Kozlowski wrote:
>>>> On 22/08/2022 10:07, Chunfeng Yun wrote:
>>>>> On Fri, 2022-08-19 at 15:15 +0300, Krzysztof Kozlowski wrote:
>>>>>> On 19/08/2022 12:13, Chunfeng Yun wrote:
>>>>>>> Add a property to set usb2 phy's pre-emphasis.
>>>>>>>
>>>>>>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>>>>>> ---
>>>>>>>  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml |
>>>>>>> 7
>>>>>>> +++++++
>>>>>>>  1 file changed, 7 insertions(+)
>>>>>>>
>>>>>>> diff --git
>>>>>>> a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>>>>>> b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>>>>>> index 848edfb1f677..aee2f3027371 100644
>>>>>>> ---
>>>>>>> a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>>>>>> +++
>>>>>>> b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>>>>>> @@ -219,6 +219,13 @@ patternProperties:
>>>>>>>          minimum: 1
>>>>>>>          maximum: 15
>>>>>>>  
>>>>>>> +      mediatek,pre-emphasis:
>>>>>>> +        description:
>>>>>>> +          The selection of pre-emphasis (U2 phy)
>>>>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>>>>> +        minimum: 1
>>>>>>> +        maximum: 3
>>>>>>
>>>>>> Instead of hard-coding register values in bindings, you
>>>>>> should
>>>>>> rather
>>>>>> describe here feature/effect. If it is in units, use unit
>>>>>> suffixes.
>>>>>> If
>>>>>> it is some choice, usually string enum is appropriate.
>>>>>
>>>>> How about changing description as bellow:
>>>>>
>>>>> "The level of pre-emphasis, increases one level, boosts the
>>>>> relative
>>>>> amplitudes of signal's higher frequencies components about
>>>>> 4.16%
>>>>> (U2
>>>>> phy)"
>>>>>
>>>>
>>>> Still the question is what is the unit. 4.16%?
>>>
>>> No unit, it's a level value, like an index of array.
>>>
>>
>> So a value from register/device programming? 
> Yes
>> Rather a regular units
>> should be used if that's possible. If not, this should be clearly
>> described here, not some magical number which you encode into DTS...
> Ok, I'll add more descriptions.

Better use logical value, e.g.
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml#L38

Best regards,
Krzysztof

