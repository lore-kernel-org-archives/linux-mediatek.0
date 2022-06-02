Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392BBC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 12:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dIxMd2z5JQlqE7qNnB1jkIsJu7ewPH9bBT8UVkU34gw=; b=V0Y4YKzEm+7ary
	0RuGtW4mdhu9y7/uulKL0UnIIWYZqogC7Jyjmjxd2hGzJr2lZk2dvFZJL/XA5sxsEgXVbjPOJU142
	dGr6+u8pNgmb4NQMi4fBgMqsIJbpLITIdHNLbBh9AxNiDnjXYcofSg2B+dAYVyA1Viw5QhTpHMQlZ
	sEo1TCKoMso/LqW5+DuBgAVRkd6qpNIDJG8ihP/RhvpR1EJRIiuSA8D/OupTa3l6BBJE0/HRbFfvs
	4PPvHeKVD07wLdQ3XMi4ti/nIQ/cTsyByHLLg/Jt+D8pukWiMNh75zyhq8b1d215k7Xg12mhN3Tw5
	BnUaApO8SY3qAjb3kkIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjuB-003ChB-Q7; Thu, 02 Jun 2022 12:26:23 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwju0-003CdD-5o
	for linux-mediatek@lists.infradead.org; Thu, 02 Jun 2022 12:26:15 +0000
Received: by mail-ej1-x631.google.com with SMTP id f9so9748975ejc.0
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Jun 2022 05:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=l0e+QqCCjFx8f2OLbKQ+40o0Vy08QxD2mn2l44RhFqk=;
        b=Nog3DQYN4J+cB/fbmluiaMsCH/GEsYKtdT45PVLBiw2jKYQkdhhVUysv0ef7qxi5IW
         aE8WpuDdI6v/NncvujJcJ4EYi8xwKg7+DxNzdA5fl9LrHbBpppRImfqFr8Jq8ZT48aTX
         PM/01Xa8gaQOW1DTj9IAkZWZNeJhBN3zuY9ralaG7fd3uNY4Q+0rRFiLcIlCZtvU9KOW
         b/q6MlU24eUHFojZjVgH24tBtY3Pm/BW7XnaFMNMoLOUSIYEvb46JFbJSFz+CLoqK77A
         OOnr4Kw9TL/sqpX2+7szIKKFHDvMHBcJyMeDrthV16bc99bfngWqbXiC522v8fdsJoYh
         jxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=l0e+QqCCjFx8f2OLbKQ+40o0Vy08QxD2mn2l44RhFqk=;
        b=qlrwpA3mXrGlMP9EbQu68GAN8JYfOLCGJ+xZRHLTTvHKHuYpdgHbpFPVuTSIlievOB
         xyEKFoycEzcQt6Y4xE/3Ags4z4DGxKykjCpP1QY1sb8qu/fw8/sjV1Ih3VJgvTG5XrXA
         pNAEJEnVT0G7Uj9lgWRpMmPjSwuF19YxUb0Eu8JavNaOv9KRfjSeJ+JDqq/GLGEOWBv0
         qjuEePIdeTIUAyPKFqmz/743O5tXrWFjCbmEyzELWZTIMsb20tuhQQuo0aRACLYi6B5E
         GujR2C0fOB3Dfwo0jC3vf0crk3ZgUTtU60GEhR6kOHDzRM9FCsKyI9mOChPjBV+0BMKb
         5vmw==
X-Gm-Message-State: AOAM531jVf0QWXLM2Nkh4HaoMJnAcKOenk6+wT9uz3jIwVZdBLKc7FYS
	rH0dR6Q4xS5y06D8ohMLOmNeVg==
X-Google-Smtp-Source: ABdhPJyJKtUxGXFMU3/LbZTcWeEqPqvfdbUMPT0Dy5tDfhr7+6snoslGd5TY/yGd2/qhA/NuG5+fVw==
X-Received: by 2002:a17:907:97c7:b0:6fe:f7eb:be67 with SMTP id js7-20020a17090797c700b006fef7ebbe67mr4169542ejc.559.1654172767738;
        Thu, 02 Jun 2022 05:26:07 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j10-20020a170906830a00b006f3ef214dc0sm1684967ejx.38.2022.06.02.05.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 05:26:07 -0700 (PDT)
Message-ID: <2c610d82-65bf-60c8-05f3-434eaa1cfc8b@linaro.org>
Date: Thu, 2 Jun 2022 14:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1] dt-bindings: dsp: mediatek: add mt8186 dsp document
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422071534.15653-1-tinghan.shen@mediatek.com>
 <c0a188e5-8a8c-d4a3-5a3d-9b9dd85d8f44@linaro.org>
 <eb4deff1a01c09783518bbaff8fe4e4c4ca6fa5b.camel@mediatek.com>
 <591767ee-e349-7a17-a9e9-b95d0500c7c1@linaro.org>
 <774c075ca4ad815c88be755cfb51889a171e835d.camel@mediatek.com>
 <9e3f5586-59fa-42cc-770c-b8694b4f2bf3@linaro.org>
 <a1140bd47cbd68436d0b9e147c2d6d6327ac092e.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a1140bd47cbd68436d0b9e147c2d6d6327ac092e.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_052612_364522_4B19310C 
X-CRM114-Status: GOOD (  23.29  )
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

On 02/06/2022 13:53, Tinghan Shen wrote:
> Hi Krzysztof,
> 
> On Thu, 2022-06-02 at 12:45 +0200, Krzysztof Kozlowski wrote:
>> On 02/06/2022 12:19, Tinghan Shen wrote:
>>> Hi Krzysztof,
>>>
>>> On Thu, 2022-06-02 at 09:40 +0200, Krzysztof Kozlowski wrote:
>>>> On 02/06/2022 08:44, Tinghan Shen wrote:
>>>>>>> +  mbox-names:
>>>>>>> +    items:
>>>>>>> +      - const: mbox0
>>>>>>> +      - const: mbox1
>>>>>>
>>>>>> These should be rather some meaningful names, e.g. "rx" and "tx".
>>>>>
>>>>> The mbox name has to align with the adsp ipc driver.
>>>>> The adsp ipc driver is using 'mbox%d' for mailbox channels.
>>>>>
>>>>>
>>>>>
>>>
>>>
> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=9db69df4bdd37eb1f65b6931ee067fb15b9a4d5c__;!!CTRNKA9wMg0ARbw!1TmempNkQhC5QuLBhyfWo_AC97MoLuWipsGV-LPaW9RKNPheU7Bgc-eboNi1JA1nC5I$
>>>>>  
>>>>>
>>>>> 	chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
>>>>>
>>>>> 	/* ...snip... */
>>>>>
>>>>> 	adsp_chan->ch = mbox_request_channel_byname(cl, chan_name);
>>>>>
>>>>> Is it ok to continue using these names?
>>>>
>>>> It is a bit confusing... how did that driver got merged recently without
>>>> bindings? Why bindings are separate?
>>>>
>>>> The bindings always come together in one patchset with the driver
>>>> implementing them. Bindings are though a separate patch, yet still
>>>> followed by the driver which uses them.
>>>>
>>>> I do not see any compatibles in that driver, which suggests there is no
>>>> other binding using it. If that's correct, then you need to change the
>>>> driver.
>>>>
>>>
>>> The mtk-adsp-ipc driver's sole function is to encapsulate the operations 
>>> of mailbox framework from adsp ipc users. The mtk-adsp-ipc is not defined 
>>> in the dts file and we don't need it to be defined. The creation of mtk-adsp-ipc 
>>> device is requested by adsp ipc users via the use of 'platform_device_register_data'[1].
>>>
>>> the driver implemented the mailbox framework is 'mtk-adsp-mailbox'[2]. it has 
>>> corresponding hardwares and a yaml file[3] to describe it.
>>
>> I don't understand how is this related. We talk here about the
>> mbox-names for this bindings file. You replied, that these bindings are
>> already used by something, but now you say that they are not? So why do
>> you need to change anything in any driver?
>>
>> Simple question - do the bindings here "add mt8186 dsp document" are
>> used by any specific Linux driver already?
> 
> This bindings, 'add mt8186 dsp document', are used by the SOF sound driver of MT8186[1]. 
> 
> I'm sorry for miss leading you in previous reply. I was thought that you're 
> asking why the mtk-adsp-ipc driver got merged without bindings. So, I tried 
> to explain why mtk-adsp-ipc doesn't have bindings.

Then my question is kind of still valid:
How did "mt8186 SOF" driver got merged recently without bindings? Why
bindings are separate?

You cannot just sneak in usage of bindings in a driver, then submit
bindings and say "we already have an user!". No, the bindings come with
the driver. Always.

Linked patch [1] brings undocumented compatible mediatek,mt8186-dsp, so
you should see big fat warning when running checkpatch. So this points
that you did not run checkpatch which is another not acceptable
submission. :(

[1]
https://lore.kernel.org/all/20220422055659.8738-2-tinghan.shen@mediatek.com/


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
