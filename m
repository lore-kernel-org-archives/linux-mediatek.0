Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7551C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 07:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hyO83Agm9J1LkrNZzgMmPOSi1e0C8pD1X+9+f3Pu8E=; b=1Sc7fWCqFWTojo
	aX16E+2UiWWVntGl7/ZE6NVOsgkVZNh3ezy8wMKa7a25WWCQ7wGMLVeimsfVcxbfwJD7I4DpXvyRr
	olMle1G06BT3nXowYt7O+xzS0KXuKVbM2lcN2/ivjP2Sj9e9B6OTVP9RDd2cqepjXgYWeMPuAuzFw
	k2Uy567PxZ2LxuVkJyULVhBQvnyrdpVrXOcHm9I14CB1soWeVM3ER9nCq7PZN5+nUn+7pN+BkxnOv
	pbZsdsoQpwuS3Qk5J71JWaRTuJPSQKhpAnIEsK1MZ7QKQp6HYFYVJMpAHoWf452yMa0i8OxNzm6N8
	JtWP/jA5q0vBrSUWET4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXzUM-005BPy-Tj; Fri, 03 Mar 2023 07:05:58 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXzUB-005BJI-MU
	for linux-mediatek@lists.infradead.org; Fri, 03 Mar 2023 07:05:50 +0000
Received: by mail-ed1-x52e.google.com with SMTP id f13so6543905edz.6
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Mar 2023 23:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677827144;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7hyO83Agm9J1LkrNZzgMmPOSi1e0C8pD1X+9+f3Pu8E=;
        b=DTsZvcGSh0JqYAWl73FtkLBOgToNuhgRMthIP75ZhbLj4hvKzx8xLSWmq6ZecBm+fc
         WnGaFSR/szAif5FxMioBLi8lXOMjwyl9YYBRW1qvfrNJQ7y6enmqBFXC6knizv5FRC7w
         gLcW7RZF7IeggDaKwtL/qn/wbEyuyR91AVlWq5dAw46hbqc6EYma+NwexHXqBlDdZGaB
         0Kw0lNAnA0Yk98iEdnIWnFQ2Wi5nbeYto+qJucXYry5HG84g0JbO9dCjhmRWcEXGLp9r
         AnMwj+SQ1t8ltYXBcQvr/J9V6aYgCkp+SkBohiYeeoKguZDW2uGNeBFyo3FRxcIff5gD
         KvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677827144;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hyO83Agm9J1LkrNZzgMmPOSi1e0C8pD1X+9+f3Pu8E=;
        b=Xa6aVbFDDzNfSn2yRcT5a/i+9p0uDu12Q9GNIWUF9jyBFn1YF0ubQfMLXiZIPQiFm9
         Ao2JKXyCFpB1ZBM5XC27xg9E7iQd8PRMcglb1eHolH1as0tEos1FaelEOvs31bJX88LL
         SbR+GDU4iphOhCJc8tYxewQ9nvrg+tTm322iRuMCwk5LtKV/+n73I6GM6QQY7GCDFSog
         gGYkuJ6qvp7Qy8QwHV0XuBJDwL571zcd2/Xq2v5TxtcZoMYRXDmVN9XhxQTM3NdZrgK+
         rRaw3d3XHLC+j+1Kxw9WyiMmvbEvMpJyEkKTkUmcgmc+lPhbmNvEJLPdL7wZiLrXcLsw
         w8lQ==
X-Gm-Message-State: AO0yUKWp6Vwqbsc9SANXohSye7vwQGDmWxMFGTV+9UFxVFLN4hH26+zl
	k/IsUp0A/x65ZmoYc4uZvjrI5Q==
X-Google-Smtp-Source: AK7set872PawA8YLwYxckp8bhyhvu6/0N24CzD55UJ1kPz74D0pEza8jIQRyk/4Shrewd1pziePgRg==
X-Received: by 2002:a05:6402:1347:b0:4ab:1c69:5c4 with SMTP id y7-20020a056402134700b004ab1c6905c4mr884592edw.26.1677827143862;
        Thu, 02 Mar 2023 23:05:43 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k12-20020a50ce4c000000b004c0459c20f9sm772279edj.66.2023.03.02.23.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 23:05:43 -0800 (PST)
Message-ID: <a696bea5-3ba6-3b71-10ad-a04a7412c178@linaro.org>
Date: Fri, 3 Mar 2023 08:05:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 07/16] dt-bindings: pinctrl: ralink: add new
 compatible strings
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Rob Herring <robh@kernel.org>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
 <20230222183932.33267-8-arinc.unal@arinc9.com>
 <20230227173333.GA496999-robh@kernel.org>
 <d7aea90f-d077-3a41-996c-804c95d72e24@arinc9.com>
 <20230301024431.GA251215-robh@kernel.org>
 <ae3346de-140f-f181-b6a3-ccaa694e1548@arinc9.com>
 <11d3c806-04b6-da54-65f1-c0bd154affbc@linaro.org>
 <a9acd3b4-2b03-86c0-711c-a3840aeab574@arinc9.com>
 <1aae7ac9-c83d-71b4-4fce-325f02fcd722@linaro.org>
 <89588f69-9cf0-e7a4-b976-5ce87d42e296@arinc9.com>
 <2ccb573d-39f4-cb80-7a3e-63a60c2bc0a8@linaro.org>
 <b48e0a5e-dd45-8b8a-4ee3-357a0985ca9c@arinc9.com>
 <83a03258-9e52-3d09-67fe-12e9e5ed4b76@linaro.org>
 <11d10e4e-65ec-3bec-3e0c-7e57feb03506@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <11d10e4e-65ec-3bec-3e0c-7e57feb03506@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_230547_802314_BD866694 
X-CRM114-Status: GOOD (  16.41  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-gpio@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 02/03/2023 12:50, Arınç ÜNAL wrote:
> On 2.03.2023 14:36, Krzysztof Kozlowski wrote:
>> On 02/03/2023 11:47, Arınç ÜNAL wrote:
>>> On 2.03.2023 13:29, Krzysztof Kozlowski wrote:
>>>> On 02/03/2023 11:22, Arınç ÜNAL wrote:
>>>>>>>
>>>>>>> ## Incorrect naming
>>>>>>>
>>>>>>> MT7620, MT7621, MT7628, and MT7688 SoCs are incorrectly called Ralink,
>>>>>>> introduce new ralink->mediatek compatible strings to address it.
>>>>>>
>>>>>> So this part was addressed by Rob - we don't do it, because it does not
>>>>>> matter. Ralink is now Mediatek, thus there is no conflict and no issues
>>>>>> with different vendor used.
>>>>>
>>>>> I think Rob was rather addressing that updating compatible strings based
>>>>> on acquisition or marketing whims is not permitted. This condition does
>>>>> not apply here as these SoCs were never Ralink.
>>>>>
>>>>> I understand your point that Ralink is now MediaTek but still, calling
>>>>> these SoCs Ralink would be a bit misleading, don't you think?
>>>>
>>>> Misleading yes, but also does not matter. At least matter not enough to
>>>> justify ABI break, so you would need to deprecate old ones and keep
>>>> everything backwards compatible. You still would affect 3rd party users
>>>> of DTS, though...
>>>
>>> I intend to do just that. Introduce new mediatek strings, keep the old
>>> ones so it's backwards compatible, therefore don't break the ABI.
>>>
>>> Instead of deprecating old strings, I intend to introduce the checks I
>>> mentioned, on the schema, so the pin muxing bindings only apply if the
>>> DT has got a string that won't match multiple schemas. This way it
>>> shouldn't affect 3rd party DTs.
>>
>> I meant, 3rd party users of DTS. You will replace the compatible in the
>> DTS, right? So the DTS exported and used in all other projects, OS,
>> firmwares, bootloaders, out of tree kernel forks will stop working.
> 
> I plan to change it on the DTs for MediaTek SoCs, yes. Is this a 
> problem? From what I can tell, what must be ensured is that old DTs must 
> work with newer kernels, not new DTs on older kernels.

Can I be clearer than this?

" So the DTS exported and used in all other projects, OS,
firmwares, bootloaders, out of tree kernel forks will stop working."

Yes, this is a problem - they will stop working.

Best regards,
Krzysztof


