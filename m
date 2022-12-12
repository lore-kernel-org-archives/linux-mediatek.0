Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0014BC4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Dec 2022 08:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+6fEYSz7m/CPUV4/+SEcQDFawyZfISqhe/v9Owp5pU=; b=YeMpqmEd477R0o52W3dW5elfoo
	V0DVIhR9h7JwY5e6Ua/V/Gxg62flHS2Pi9akB69H812/ymzvUC4aRBNA5+jm1X/6vARbPiVCLNnxq
	LAUZC1I7puWBj3uf574BamJGNZOkNmxPDR4L1EZVQ80efak/4eHe5EucCg7oBw3Ug9iDDm3iQYGxn
	FzmhYYSprZong0WZe0c+8k4wmX4RXQB5vplDqDQ8w0N5En8GvhyuYgQ5nYgXzlIDKNDW/lfON/Fuf
	BABv62K7M4QoxtAKr0XLt/PYXSA4CWMA45nHQVW71WqlbI1pEXrf+FrZBEKsR52P+GEYCMKsi+nfI
	exL9yGig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4eN1-00APi5-Bb; Mon, 12 Dec 2022 08:41:07 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4eMl-00APM4-5d
	for linux-mediatek@lists.infradead.org; Mon, 12 Dec 2022 08:40:53 +0000
Received: by mail-lj1-x22a.google.com with SMTP id g14so7761214ljh.10
        for <linux-mediatek@lists.infradead.org>; Mon, 12 Dec 2022 00:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K+6fEYSz7m/CPUV4/+SEcQDFawyZfISqhe/v9Owp5pU=;
        b=H1Jk1RLOPg9VYMLvqyNaJw3wTLfyV51sNzM1xYb7d+lzkrEB6mVox9o567x5glUjH6
         fJ/lRVNJHtjhU2peVl8ruNNeZv94g+K5g4gMw5qQAXps/5ykovYIfR7SLwO/jU5ISYyR
         w6mIEpSlc3AK8WJR0/AVHxDt4WXy6vxLIBvvDuPaCLlT0CT4IzU+yn0Zi+idc1uSsfjQ
         sm2eMXJ9KSyEKlUpbbi0s7jZK8pNORQjbU3jP5MnoxY4rgpwUy9GMDzymnne27k02M4k
         qwGCTdIPoInshL+nQplRmu5UIdJ5Ijz54cXFCwG0Z+D1XFpFFeYZ84APYHHFfKRWLGqV
         XP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K+6fEYSz7m/CPUV4/+SEcQDFawyZfISqhe/v9Owp5pU=;
        b=o7aRITrdtnf+IJjWTdrdnJeBOMnAhv0/UNGwIqDCFbv/4eWZJnCo2Y0Mb+wtjDM7Bh
         QpvmEEMTdrvZU/eduP8sPRWV75LlnTNvfe1X9lTrP/j4aKecy4O5bAAQNPxInywNEbJE
         HclVQKJviq8GbpFPC0BRn4K+lfJd11jiCoMicX3rS7uDsrxF7bF0HhYVkWDi2c8mfBEZ
         /32KyOca11z2TrOhTaW9wbtnuXOgwm0QPfVMaA2oUnWoGanUZRYo+IsJeC9e/+S71aL0
         YH/xFgfvBXUi49gnGxhjtqkNFbYtcUchscOZR4mSWV8Fc8sZwWtOUgkM6+j/bkfe3GyW
         L10w==
X-Gm-Message-State: ANoB5pk1SNYqmbdUmEde3Ks+Jvw6euob5nmPwjSlmv9KaYNm/A/7Fkzv
	Waa7l3M69gUEjuq6bC4lROCjSw==
X-Google-Smtp-Source: AA0mqf5SXiv1Zkg7HMMVCWRXZmcBBmj3rggFfCSnSxwz4n0RrQilNwopPTQTwh39iLbyyURas6wTZQ==
X-Received: by 2002:a05:651c:905:b0:277:155c:f4a3 with SMTP id e5-20020a05651c090500b00277155cf4a3mr3625178ljq.38.1670834448153;
        Mon, 12 Dec 2022 00:40:48 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p9-20020a2eb989000000b0027a197d8247sm1153836ljp.16.2022.12.12.00.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 00:40:47 -0800 (PST)
Message-ID: <e20884d2-5d30-9519-d070-8e2ac07f2171@linaro.org>
Date: Mon, 12 Dec 2022 09:40:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 10/12] dt-bindings: mediatek: mt8188: add audio afe
 document
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
 <20221208033148.21866-11-trevor.wu@mediatek.com>
 <d7d9f3c7-b3e3-1e13-a80f-c7bf7b38a5b1@linaro.org>
 <45b4b287dfd57b99e0ba5675bf99194f6d84d9da.camel@mediatek.com>
 <fb34e446-2904-a357-e54b-3e82a2b0745c@linaro.org>
 <e08fab2a694313abc12e0f8303de3e2e704b388c.camel@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e08fab2a694313abc12e0f8303de3e2e704b388c.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_004051_252356_F9DF6E33 
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

On 12/12/2022 03:43, Trevor Wu (吳文良) wrote:
>>>
>>>>> +    uniqueItems: true
>>>>> +    items:
>>>>> +      minimum: 0
>>>>> +      maximum: 15
>>>>> +
>>>>> +  "^mediatek,etdm-in[1-2]-mclk-always-on-rate-hz$":
>>>>> +    description: Specify etdm in mclk output rate for always
>>>>> on
>>>>> case.
>>>>
>>>> How is it different than assigned-clock-rates?
>>>>
>>>
>>> This includes clock enabling at init stage.
>>
>> assigned-clock-rates are also at init stage. I asked what is
>> different.
>>
> 
> If the property is used, there are three parts included in dai driver
> probe function.
> 
> 1. set clock parent (which APLL)
> 2. set clock rate (MCLK rate)
> 3. enable clock (MCLK On)
> 
> The first two parts can be done by existing dts clock properties, but
> the last one can't.
> When MCLK should be enabled at boot time and kept on, this property is used. That's why I say the property is designed for always-on case.

Heh, so the "always on case" means this property enables clock? How is
this even DT property? That's not how clocks should be kept enabled. You
need proper clock provider and consumer.


Best regards,
Krzysztof


