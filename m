Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF59EECAAD2
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Aug 2022 06:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAX1Plu+eXlOZCcV0dheQHJM314EyoqCLQ+tuSBSA+c=; b=eq02mIVX3eK6tyrANrr8XbKD8+
	eMDzlW97E5qdl+I1hZw273VIh62lgrtbR4HpMyvFdSNqPwDKFG1h3VjTrVBWv+7DAsU0Ba2JcACr+
	A9GwH+yjVwoprfHRUfrigH9VrcBViPE+97MOAZaoQKkkLBqq1Y7Zeta65A7kGN6ohDU5M8F1KDIRx
	Z/3U8k9uIZgKK67XGjqC6ols8VD3dvU2MtEqhhXxmHotJM689SFXQVNxEICaLBBCkyXxXD37iSmb9
	Aby8/C4tyve90gY0JQkE6AjaLtIKnqnznazI2fGgBqdjgZtnZaQAHyIrONtq57stA2FFyPflc0JlT
	q/w1m8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRSxv-00EkZP-C9; Fri, 26 Aug 2022 06:37:15 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRSxi-00EkIa-DE
	for linux-mediatek@lists.infradead.org; Fri, 26 Aug 2022 06:37:05 +0000
Received: by mail-lf1-x12c.google.com with SMTP id bq23so774254lfb.7
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Aug 2022 23:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=QAX1Plu+eXlOZCcV0dheQHJM314EyoqCLQ+tuSBSA+c=;
        b=f2f+68BXq0Gr6vOQ54HOvpIHVEwfm/lw1PPIdnzcW3YuRvpawn0tR5O0ZLtYd9XHbr
         zW4sTu8j9uqTFmyieo0baRdk7Vexx7AKqiInoLzSXG+WmFdu9aFOFvyOr+RaUWsaAZJ+
         RTqKuu2bwnKlCgR9+h/AdfcyPipUO/fFgxvZFTID19J3+yfuNGTlFdXwkMmyLoX4IHgq
         Hwcrmi2ui/D+/p7WzlRpp0kFm/t/CMA7wKQaG9F2ZFVdHSIsVmVipZq+C5x6VMhjhRH1
         BOt0xCsHXpWy7cEOWfqFB9JZ39NALmwzb5LWjgYZRHI3qxOiaGPaq/ePP0RK6x0G19LS
         zXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=QAX1Plu+eXlOZCcV0dheQHJM314EyoqCLQ+tuSBSA+c=;
        b=QWJSGaArUiwG+9OeKWZ3JcYaN2pbsl83un8OSdMOnjGKe3PGbDUDDXWt3D1aWB/7v9
         1e6Ul4xG3SvzGKjhvku3zcYtHVSzeRvLEiaes3+i7zKKFcQQcd64N2+G3vR9k1IpGrSG
         S8H0IIXPAcroWEd8ap0iCAhDYtQXK0SU49/m97UchfxMBIEis6Oy4otzoocp6lnGqxVm
         ka3YJt7m3zILQIIzETTd7eSPhoI4QK8wEX334ZBuHTAwUxhIEAhdSFxwzWtRU4AhU4bY
         Y4J5k0eF8kNde28JGhGmhRMr9FbP21oAVk/5VZ2ehlLmEjkBycd97R2AQsPEfXrzokBT
         oU/g==
X-Gm-Message-State: ACgBeo1TZHsu1oVI9xMI9OzQQ2BanL6T4l7v/vB5vkuY6q6W16DkQdx5
	iKsFtewXVwN2fd4vVhkr+4pwgIgq5dCOSUfY
X-Google-Smtp-Source: AA6agR4/bfI8tZVB387LlEzAXYTw1Qp2U7iaA4G1tOeXj1Eyy7DeWyKpBFjDmrpzK6EB3X5U1lCMEA==
X-Received: by 2002:a05:6512:4004:b0:492:c4f2:9451 with SMTP id br4-20020a056512400400b00492c4f29451mr1949002lfb.666.1661495819119;
        Thu, 25 Aug 2022 23:36:59 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id p16-20020ac24ed0000000b00492b1ee7489sm246608lfr.300.2022.08.25.23.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 23:36:58 -0700 (PDT)
Message-ID: <000babd8-5980-3d77-f156-324b3442cbe7@linaro.org>
Date: Fri, 26 Aug 2022 09:36:57 +0300
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1a16cce9fe164bafc06ae193310be71c6f645d75.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_233702_559310_96AF942D 
X-CRM114-Status: GOOD (  11.84  )
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

On 26/08/2022 08:36, Chunfeng Yun wrote:
> On Tue, 2022-08-23 at 13:24 +0300, Krzysztof Kozlowski wrote:
>> On 22/08/2022 10:07, Chunfeng Yun wrote:
>>> On Fri, 2022-08-19 at 15:15 +0300, Krzysztof Kozlowski wrote:
>>>> On 19/08/2022 12:13, Chunfeng Yun wrote:
>>>>> Add a property to set usb2 phy's pre-emphasis.
>>>>>
>>>>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 7
>>>>> +++++++
>>>>>  1 file changed, 7 insertions(+)
>>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>>>> b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>>>> index 848edfb1f677..aee2f3027371 100644
>>>>> --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>>>> +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>>>>> @@ -219,6 +219,13 @@ patternProperties:
>>>>>          minimum: 1
>>>>>          maximum: 15
>>>>>  
>>>>> +      mediatek,pre-emphasis:
>>>>> +        description:
>>>>> +          The selection of pre-emphasis (U2 phy)
>>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +        minimum: 1
>>>>> +        maximum: 3
>>>>
>>>> Instead of hard-coding register values in bindings, you should
>>>> rather
>>>> describe here feature/effect. If it is in units, use unit
>>>> suffixes.
>>>> If
>>>> it is some choice, usually string enum is appropriate.
>>>
>>> How about changing description as bellow:
>>>
>>> "The level of pre-emphasis, increases one level, boosts the
>>> relative
>>> amplitudes of signal's higher frequencies components about 4.16%
>>> (U2
>>> phy)"
>>>
>>
>> Still the question is what is the unit. 4.16%?
> No unit, it's a level value, like an index of array.
> 

So a value from register/device programming? Rather a regular units
should be used if that's possible. If not, this should be clearly
described here, not some magical number which you encode into DTS...

Best regards,
Krzysztof

