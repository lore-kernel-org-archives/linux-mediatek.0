Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05F9C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 11:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=itiw5UOLyp8x5GAZYaYv1Vs2aytftoTZFE/0BZf8oio=; b=LwDA2hjs4hj1Fm
	6knwZl2IOvF2iCe2s0ARUhZOBJg9xO8STCqcbO6cMessmvRAhMbrmZzt4c23jC6rptvZVWZ3K8LEZ
	q+oaqmrikoFJALGhO0PrAU15zkSjuKdbFWHWOf1aTMYhgYR5sEiovWtvaKpRKFMZC2VyjCill5lio
	VyIdOAPhF19C3UpEu2vK5ccOqKcScFBsXBr5xY5TBWKkcUGUAG93dUq3A5+2GlfHN9XkOEQy6tleu
	16OyL5Nf7tCFXrn95AAwq64FDg5kE/HqO9pEobXQ31Nrjfra0bmSYOPRAt+td7MqlAtbB1w+fCoMe
	526/6wqpskdmDhzX60xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXhEu-001xMc-9C; Thu, 02 Mar 2023 11:36:48 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXhEr-001xK8-CU
	for linux-mediatek@lists.infradead.org; Thu, 02 Mar 2023 11:36:46 +0000
Received: by mail-ed1-x52d.google.com with SMTP id d30so66376965eda.4
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Mar 2023 03:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677757001;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=itiw5UOLyp8x5GAZYaYv1Vs2aytftoTZFE/0BZf8oio=;
        b=kIXs0xzTihohuEbRt/RONHqrNwOkJLWyJD46Cg9nHpst/qa4/ITeiXi5lHVPCYKKF8
         68gVD6Y6EJKS+cefqndrjM6eOIX0qoS4q0aLBHAPHOu7boPglfE/2HZ6f2jWzFUnFT/6
         jduwQvKVXembm5kITS0Ycwl7VQKCra5YF2soFbTtCj9PMs1qqyp90JLvqFaKQjITG8YK
         0BiuwVdH1dm3noOQzIAyNjEZlebYUB+h37E5gGxjK9iVpil71Oyz1xUx3IOHjwe+ySlF
         8pAW/b1xn3j4SFZ/zcz7E+oTT4yiEJOUaiqe+XriuS8tn+J4vkyQpt2eWIKXjFXwwPMG
         yAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677757001;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=itiw5UOLyp8x5GAZYaYv1Vs2aytftoTZFE/0BZf8oio=;
        b=sxjHLFg5ezWsO4RNDm5szwWhYoP/+kLS0YxWailaV3DjG98DsXOIuVh+EYrVv3YYZX
         MIagHcN5Wa0sZVEGDjSvX+JVZbYSVPfZKdQBZLHxtO710r5X6/k4QetE9dpMeip0hciD
         2o3boQ4LLpnXfJGFpqvkf5krx1qZ/3fs6G3zVDaa1Fkhw+9y9kPmyM0Lmn+JVuRD33d9
         lvPMBui89RapNcSXctmT2adHOkAY3F9pUQBmUmAWxiilB1a89wndrm14GK5NYtQ1pFxO
         eNjwTsHXL/55jvgv0UkhoO1CEV6urrhqAycg4rjmi43AgNioHJ0BJ3crQHqTdElFfMEd
         2m+w==
X-Gm-Message-State: AO0yUKW+cBQ1/QXHqP+4kaXXPkSj4PfP1v29lwxZLEWHEA+sl2XafeJ4
	FjL/7p/k0RZYXAATm+tz5xW+fA==
X-Google-Smtp-Source: AK7set8UroysICtw/tuh/i+KbnuaphWGNNH6VTX/a+cbEyQ42b9nkdxhdV//zLythoyXJt6AwhrTtg==
X-Received: by 2002:a17:907:1006:b0:8b1:2e7c:df49 with SMTP id ox6-20020a170907100600b008b12e7cdf49mr11219032ejb.7.1677757001526;
        Thu, 02 Mar 2023 03:36:41 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m18-20020a1709061ed200b008d427df3245sm7007014ejj.58.2023.03.02.03.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 03:36:41 -0800 (PST)
Message-ID: <83a03258-9e52-3d09-67fe-12e9e5ed4b76@linaro.org>
Date: Thu, 2 Mar 2023 12:36:38 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b48e0a5e-dd45-8b8a-4ee3-357a0985ca9c@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_033645_471568_EEDE6F3F 
X-CRM114-Status: GOOD (  14.63  )
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

On 02/03/2023 11:47, Arınç ÜNAL wrote:
> On 2.03.2023 13:29, Krzysztof Kozlowski wrote:
>> On 02/03/2023 11:22, Arınç ÜNAL wrote:
>>>>>
>>>>> ## Incorrect naming
>>>>>
>>>>> MT7620, MT7621, MT7628, and MT7688 SoCs are incorrectly called Ralink,
>>>>> introduce new ralink->mediatek compatible strings to address it.
>>>>
>>>> So this part was addressed by Rob - we don't do it, because it does not
>>>> matter. Ralink is now Mediatek, thus there is no conflict and no issues
>>>> with different vendor used.
>>>
>>> I think Rob was rather addressing that updating compatible strings based
>>> on acquisition or marketing whims is not permitted. This condition does
>>> not apply here as these SoCs were never Ralink.
>>>
>>> I understand your point that Ralink is now MediaTek but still, calling
>>> these SoCs Ralink would be a bit misleading, don't you think?
>>
>> Misleading yes, but also does not matter. At least matter not enough to
>> justify ABI break, so you would need to deprecate old ones and keep
>> everything backwards compatible. You still would affect 3rd party users
>> of DTS, though...
> 
> I intend to do just that. Introduce new mediatek strings, keep the old 
> ones so it's backwards compatible, therefore don't break the ABI.
> 
> Instead of deprecating old strings, I intend to introduce the checks I 
> mentioned, on the schema, so the pin muxing bindings only apply if the 
> DT has got a string that won't match multiple schemas. This way it 
> shouldn't affect 3rd party DTs.

I meant, 3rd party users of DTS. You will replace the compatible in the
DTS, right? So the DTS exported and used in all other projects, OS,
firmwares, bootloaders, out of tree kernel forks will stop working.

Best regards,
Krzysztof


