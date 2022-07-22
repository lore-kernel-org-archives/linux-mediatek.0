Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4745DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 18:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZ89NCSHpZWO6mCiLEkZnsSyxqredp26c+bp6T/IeXs=; b=eKhUtgLCDTo36Rrgii/oW76hdp
	vnlH/E1D5bjCd3Ewnj5Jv3Edb2eii+Os2OFifhm3yxrSdnOvkDLXWUd4M2MV1y2FZro6yrcXqDH37
	tIsEaRnP0wjQnlZJuuH0OdIC1+EeSweNjS7dI/CCQxK2pCTexmKaBFxhF/+Vcv7vy7pzfFvzO4faS
	xAM2H/sutXI3iBoOwtC0YAr3l20wxWvq92ztJxWFa1crfnN6Xv4fXxrQ0Nql4HEIOQxDH/DpSmi6F
	L+bsvKAFQJ91f09SUlskvGn0a5nlaPC+6qMqKRl5I57jE/vVOop+wlMI9/Dqy3/tAVGFoB+cwfi03
	MMBxKffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oExFQ-008qgH-9E; Fri, 22 Jul 2022 18:19:36 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oExFM-008qe6-R0
	for linux-mediatek@lists.infradead.org; Fri, 22 Jul 2022 18:19:34 +0000
Received: by mail-lj1-x229.google.com with SMTP id u14so6393664lju.0
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Jul 2022 11:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TZ89NCSHpZWO6mCiLEkZnsSyxqredp26c+bp6T/IeXs=;
        b=HV2GeR6BqM1M0qBzVbeUKHIw4fCOt3RQzgcGZy1wqC6IiFpuwgMNPkh0g8Y/uMaKAH
         OPH5AMoUcrCuZ6YLo/Ab1VxkoWQukq698ETcZCSPIdkWcbq7JYIwN09+aApa4lzffA9r
         Bw0mz0Yow33Ut9oatcpEWxyS+qJOZ72yMzlMiouUcy9oQKS1QsCrYtji9b/rl0THTVQT
         gbbAeLCjm0RHR6pxJwZ5uSbTWJuCDhIPDo94gY67qTUO6epy3MqdVwzFgzLqGdvyxe1v
         zHDpKFnIKu4CeGxT84s6GCq3UWLhF70ryWeBAW99BThs4Eg8r1rw/tlGkerAtRCAgo88
         k0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TZ89NCSHpZWO6mCiLEkZnsSyxqredp26c+bp6T/IeXs=;
        b=XLUscvGBSf//NDAJkHtdjWg60ZKNY2XipFu0Ied8YSsMBitdWjZftou0vg7Uyd2niQ
         k8IklF3H/zzVA5UFKhyE/vAXRugBUbquZ7yrnmFb5YAO8sHdvRPs/ikWujB0fPZmPrKR
         U5iwj2hr2egCL9HmODeegTCZ5ufB2zVgoVzRzoxOmPwWqKdE7AGkr750gtLWcg9ar935
         CaIMA8Eo9kowBL7n79TfkDcs4AvBKtulgUemMXsexPcHrlqIluqUfjgejpIcUQSNqq0c
         qhS4v5laJXhnXZdHDRpLhpl/Cd780A1arQX8hSX/KxBdmSp6Xmg1H59ryy5CXXcbG29D
         g4Xw==
X-Gm-Message-State: AJIora9Uvfkk+zzwkjcY/KDIXyZOdti201Kavp7Rkc6bobSzttf8DPly
	v8T7d7ZfHTPYcWqgJKst9A53gw==
X-Google-Smtp-Source: AGRyM1t9k6EuxFUL5jwICaF3I0/coOUkurh+jWMFDTooiNiiyxUpIROwoEbytIQYZDtIHnlMr6Elbg==
X-Received: by 2002:a2e:3209:0:b0:25d:644e:b9d4 with SMTP id y9-20020a2e3209000000b0025d644eb9d4mr401270ljy.13.1658513971230;
        Fri, 22 Jul 2022 11:19:31 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id k2-20020a2ea262000000b0025d75995a07sm1259660ljm.24.2022.07.22.11.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 11:19:30 -0700 (PDT)
Message-ID: <53d432e9-6715-05c4-d258-896ec38afa4f@linaro.org>
Date: Fri, 22 Jul 2022 20:19:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] dt-bindings: mediatek: add pinctrl definition for
 mt8188
Content-Language: en-US
To: "hui.liu" <hui.liu@mediatek.com>, linus.walleij@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: johnson.wang@mediatek.com, zhiyong.tao@mediatek.com,
 sean.wang@mediatek.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220718113813.23787-1-hui.liu@mediatek.com>
 <20220718113813.23787-2-hui.liu@mediatek.com>
 <b28dcbe5-d15f-1c4f-9b3d-650d5c39de6b@linaro.org>
 <08a7209fe198839093b3ef729fc97c1a950e1fbc.camel@mediatek.com>
 <35639a59-4a3d-5aa7-946c-22fbd2f25e89@linaro.org>
 <ea7755e599ad8c06bc04b6249c2a6d0ab3b920f3.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ea7755e599ad8c06bc04b6249c2a6d0ab3b920f3.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_111932_926883_7B845794 
X-CRM114-Status: GOOD (  12.84  )
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

On 22/07/2022 03:40, hui.liu wrote:
> Hi, Krzysztof
> 
> That's the comment about reg and reg-names description:
>>> +  reg:
>>> +    description: |
>>> +      Physical address base for gpio base registers. There are 8
>>> GPIO
>>> +      physical address base in mt8188.
>>
>> Redundant description, skip it. You should list the instead and
>> describe
>> each of it.
>>
>>> +    maxItems: 8
>>> +
>>> +  reg-names:
>>> +    description: |
>>> +      Gpio base register names.
>>
>> Redundant description, skip it.
>>
>>> +    maxItems: 8
>>
>> You need to list the items instead.
> 
> I plan to update reg and reg-names as the following:
>   reg:
>     description: |
>       Physical address base for gpio base registers. There are 6
> different GPIO physical address bases in mt8188.
>     minItems: 6
>     maxItems: 6

You should rather have here items with description:
items:
 - description: what is it
 - description: what is it
 ....

> 
>   reg-names:
>     items:
>       - const: iocfg0
>       - const: iocfg_rm
>       - const: iocfg_lt
>       - const: iocfg_lm
>       - const: iocfg_rt
>       - const: eint
> 
> Is it right?
> 
> Thanks.
> 


Best regards,
Krzysztof

