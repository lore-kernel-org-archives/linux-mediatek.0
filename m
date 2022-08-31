Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09876ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 06:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/DTnj+8yFQi9/Rn5TezlbUC9O7HSjU1iv93PbNHvKg=; b=R4Xo9M8Xos3PZ6Nfr7CCYvoK+D
	nxjVb3ejIhrevB5DWMb/l5EWvsLVKRPBNdc5lDE8eUfiYzstaZ2bKJ9Ke6pfsPN30kp2mcVHEEXTI
	fYSNH45S9xnQvZtLUtrPMGVCXE5GP9uXzxIJDGVNPhxkH7PP7VDQi2sNSDpfXEznXajVzjWdo7AQj
	fJfe15fd07SoADrATnGB461enGtos6H4Nj7AvWXey0uDY9YhxtAKBiKij8/lCJFH7+Y168RCR6uSu
	BXfyBZjyzl1oPq4Zb5vP7Hc058+h/L41hXC07qDlYf/H+nImqMdh0SFlDxEdKD3FEmpAUaMfMLV/W
	b76u5Xqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTGpZ-004Ago-CP; Wed, 31 Aug 2022 06:04:05 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTGpM-004AZy-UL
	for linux-mediatek@lists.infradead.org; Wed, 31 Aug 2022 06:03:54 +0000
Received: by mail-lf1-x130.google.com with SMTP id v26so8254254lfd.10
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Aug 2022 23:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=v/DTnj+8yFQi9/Rn5TezlbUC9O7HSjU1iv93PbNHvKg=;
        b=TZQkiAhdIvkrwUd5YRkCHq8M4z4KGbvFf8+pevd00ismwc4DxhN38eTt5lq93mAhhd
         57HufA+90zQRmAeoJl/RZxGxtPLtbIa0P6ujbtx02NQbxqfOWMptFMo2bqqP2i3Kse3a
         qb7t/vtk0QDvSon1p1RZiVjuCmVmoRyamMiXAca5AbiRvDXWuMqM4ceD4Peas+SCSzyv
         ZgQg/SRJap5JJVrYH63ouAc9eSvLjI3txacZY5wXTIfhopN0PeCjLP5PXt/G9DDGzdfv
         9fhUZDAe2HHNyMVt9w5JfTZ3f4VllC6FO3Kv8aueEwBDb7MS9Od+RdGzqFiOEvlXYhMD
         Mujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=v/DTnj+8yFQi9/Rn5TezlbUC9O7HSjU1iv93PbNHvKg=;
        b=XlPKVVCHtqeUvNTGvnlncXd5ho1DuhmkzdMhIycEvGSdZciDprCOGs3HTJPWgvRfZo
         0B4HDzlSgLCinxKr6/GDd5Lz0GNhFZkiSfuKQ2GemEDy/zsJyEnmA54cnZsDDIdECdnu
         foJjypz9Fl8CiPfRjE8NmVZjxqyCig4MRq/Gqv5UC3/Tg19PcYbtM7Y9mSSti4T1ldPC
         rrYD4rujpG1HvcuayeO77zid8l5wHaZWYknCsGSVPzC802q8mejhlfiNmJJirYyAA3Kt
         ou/cDWTN4a2bCzECdL3Wo4vimEPctEgS4F71WbHEScS7BHWmtTPiMzGIhUsCyVnNp4Pi
         wJBg==
X-Gm-Message-State: ACgBeo22zvZZZfOKXzvLEMw4gOzj3K6NRjxx3+eHh4sPrrMshUWNRGMG
	CqfEVy/vPdOH+2fUkQkfbWI//g==
X-Google-Smtp-Source: AA6agR7Hj/GIsaqWfAOZaw+hKtYPz6ByfyjvLmH/q4AN4TswN04OUf1ZllBb39yob+Hep525/u8/1w==
X-Received: by 2002:a05:6512:e97:b0:492:c677:f867 with SMTP id bi23-20020a0565120e9700b00492c677f867mr9110673lfb.190.1661925827465;
        Tue, 30 Aug 2022 23:03:47 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id y9-20020a196409000000b0048af749c060sm1863927lfb.157.2022.08.30.23.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 23:03:46 -0700 (PDT)
Message-ID: <3c180570-ecf9-3db4-c698-39c1b4679c6e@linaro.org>
Date: Wed, 31 Aug 2022 09:03:45 +0300
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8dcb4de53a52ab44d40f490099b6ed13e5ef7fe0.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_230353_014519_29504CEB 
X-CRM114-Status: GOOD (  12.74  )
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

On 31/08/2022 06:00, Chunfeng Yun wrote:
> On Tue, 2022-08-30 at 13:08 +0300, Krzysztof Kozlowski wrote:
>> On 29/08/2022 05:37, Chunfeng Yun wrote:
>>> On Fri, 2022-08-26 at 09:36 +0300, Krzysztof Kozlowski wrote:
>>>> On 26/08/2022 08:36, Chunfeng Yun wrote:
>>>>> On Tue, 2022-08-23 at 13:24 +0300, Krzysztof Kozlowski wrote:
>>>>>> On 22/08/2022 10:07, Chunfeng Yun wrote:
>>>>>>> On Fri, 2022-08-19 at 15:15 +0300, Krzysztof Kozlowski
>>>>>>> wrote:
>>>>>>>> On 19/08/2022 12:13, Chunfeng Yun wrote:
>>>>>>>>> Add a property to set usb2 phy's pre-emphasis.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>>>>>>>> ---
>>>>>>>>>  Documentation/devicetree/bindings/phy/mediatek,tphy.ya
>>>>>>>>> ml |
>>>>>>>>> 7
>>>>>>>>> +++++++
>>>>>>>>>  1 file changed, 7 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git
>>>>>>>>> a/Documentation/devicetree/bindings/phy/mediatek,tphy.y
>>>>>>>>> aml
>>>>>>>>> b/Documentation/devicetree/bindings/phy/mediatek,tphy.y
>>>>>>>>> aml
>>>>>>>>> index 848edfb1f677..aee2f3027371 100644
>>>>>>>>> ---
>>>>>>>>> a/Documentation/devicetree/bindings/phy/mediatek,tphy.y
>>>>>>>>> aml
>>>>>>>>> +++
>>>>>>>>> b/Documentation/devicetree/bindings/phy/mediatek,tphy.y
>>>>>>>>> aml
>>>>>>>>> @@ -219,6 +219,13 @@ patternProperties:
>>>>>>>>>          minimum: 1
>>>>>>>>>          maximum: 15
>>>>>>>>>  
>>>>>>>>> +      mediatek,pre-emphasis:
>>>>>>>>> +        description:
>>>>>>>>> +          The selection of pre-emphasis (U2 phy)
>>>>>>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>>>>>>> +        minimum: 1
>>>>>>>>> +        maximum: 3
>>>>>>>>
>>>>>>>> Instead of hard-coding register values in bindings, you
>>>>>>>> should
>>>>>>>> rather
>>>>>>>> describe here feature/effect. If it is in units, use unit
>>>>>>>> suffixes.
>>>>>>>> If
>>>>>>>> it is some choice, usually string enum is appropriate.
>>>>>>>
>>>>>>> How about changing description as bellow:
>>>>>>>
>>>>>>> "The level of pre-emphasis, increases one level, boosts the
>>>>>>> relative
>>>>>>> amplitudes of signal's higher frequencies components about
>>>>>>> 4.16%
>>>>>>> (U2
>>>>>>> phy)"
>>>>>>>
>>>>>>
>>>>>> Still the question is what is the unit. 4.16%?
>>>>>
>>>>> No unit, it's a level value, like an index of array.
>>>>>
>>>>
>>>> So a value from register/device programming? 
>>>
>>> Yes
>>>> Rather a regular units
>>>> should be used if that's possible. If not, this should be clearly
>>>> described here, not some magical number which you encode into
>>>> DTS...
>>>
>>> Ok, I'll add more descriptions.
>>
>> Better use logical value, e.g.
>>
> https://urldefense.com/v3/__https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml*L38__;Iw!!CTRNKA9wMg0ARbw!1e-h0R_uwcaHKfKC9qYfaRWYeuWRq1sLCGy3yupNmkFyuW5s1nmRotL7Y0vFG9ETLLTA$
>>  
> Optional unit may be -percent or -bp, but the value 4.16% * X
> (X=1,2,3...)is not an exact value, they are variable in a range and
> dependent more factors.
> So I think use level value is simple enough.

Then again explain exactly what are the levels. How you wrote it last
time, -bp would do the trick.

Best regards,
Krzysztof

