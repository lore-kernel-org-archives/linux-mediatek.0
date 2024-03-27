Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EEAC54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 10:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MoBrVSCCzORNlcYamECHwS9FzN3bIfKWERYKgpRsWGA=; b=QVM6VSC67PatTXm2/fFRf1mukc
	pQup06+L8pfBZkLvqZogoYTPMw/giA+iL8eNCj8MOXPY1hQ1/KfvCmE+b4wRKvdhF9IbGH3hPvofv
	3YiaFYHz2yCo1rHy17W9DjYStJFdGVhiKONvW0Nufubrq2S8GnNu3cSgHZKx2VkGvTpsOWD8KlRIt
	TbLIwCYWLCiWrNNAFbfkwOVckvGjE08e65np/S3N6dy6Pj573gZ7EK5neA0leGqtOPciWBjGYcc1g
	e9Rc5qhgFDkhK2PjGgL5Our2dl+UuuCpbsgntIR4XC8X4UHkOCWrawCFII29jFHd01whW06BueBf1
	jamExEog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQ5j-00000008KFH-0ks3;
	Wed, 27 Mar 2024 10:01:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQ5f-00000008KDB-34lP
	for linux-mediatek@bombadil.infradead.org;
	Wed, 27 Mar 2024 10:01:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MoBrVSCCzORNlcYamECHwS9FzN3bIfKWERYKgpRsWGA=; b=RZv+aZq5R+v/js475JG1w85uKx
	ziT2fGkJA16gyd81k/Ki9Jv2i1K5LXtZ3TfnE71ZrG3zBKjVDckrEQAbXgxasLjfuL4U9KqJgz3cT
	WlQoAulUQiW+BVmCu0wsShCFd+P5TOwzygOcKWQwTL0QyP61XuBQgoUE4xn7lP9oaH6809gadYi0N
	NcgIFT6cd3MlkQKd6ZCRT2Ypkmv7QMZevzJnyFTjzXmKqPZIdIhW/gyXuQFRoZvVP57a+aIPZ2bcs
	CkCc5a0G1XZh6UQxPQ3A7cfq6fgHR6jt/4VP+mk07tPN8M9U6olHe1DoMudVPDK/IdBfuXl2sKYxP
	Br9SSscQ==;
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQ4a-000000009PM-1EUi
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Mar 2024 10:00:21 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a4e0a65f37bso32970466b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Mar 2024 02:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711533593; x=1712138393; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MoBrVSCCzORNlcYamECHwS9FzN3bIfKWERYKgpRsWGA=;
        b=alvgVCCorBI3vpZ2RDkV8W5BC6zAJNkamAFpSH2XnhhqlFtBKQonsQvxIBrZyUnjVo
         gjv5RK5+wf5JdKyam2DJ4fxUlhKTBz/4GUCC2gg0Ad4wd5zN/i3fCrPyOCDDhrOHRJ8d
         VM3qT7WCSgoWka7+pewx6oTaLen/i4Nec6L18VVQPlwLrf3bViqAu6sYyAzixDo0ubz7
         KUzs9q+CJ8TW9O3WzRUqnnlVkDu0eDZl8rjyLiCfs9iNi5oWXncxhXgJ/e8tPZ8D+H2U
         Sv9dFUYc3CcC+iq8Wfr/lCHgQDNE5g8Xt71m1frOXgsVMaucsO+AC+u2MEkBMHApr8xW
         78Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711533593; x=1712138393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MoBrVSCCzORNlcYamECHwS9FzN3bIfKWERYKgpRsWGA=;
        b=mKjv0qeyt0SYh7ptmJAM55IJOJZjPri06niKgo9LCGVSYISXEBHsfaHy+r3U+6mqqh
         J66Y9L6CTruSSSFwv9hLMzhP2xlvlxtShTK1q2Red/zsZcF40p/N9sDEWvw5+x5lg0am
         zcY00uYsCs+m/AVOfyS7QBQ1apdC+akTMkx6RzU+/bRBYKX0/pU2bg/F0+mg8pXv20S+
         Nisre5qvhn+7h4iLqGAIq/WygTBxDIo4lwe+PkaiS1JNNYEJ6QRGnuYJh4d+2XhlRBeY
         eByXfmXvJyolGthHszsT88VUg7KO81HbC+i7faL40rUKVgelFj22mHw/+PIH6quOeNV1
         FPKg==
X-Forwarded-Encrypted: i=1; AJvYcCU2+YWu+d/+VzpLe5Lkxo3099ZtVMGww+AYmkeKSpuVnGgMvqoZn4XckU0tt9BllMYHmhWWJKwY6s//m1UIV1aghq4SipZp/kXh/Adwb1sqUAnX
X-Gm-Message-State: AOJu0YzQDYSEB6Ldnk0y3r7kDVZdIj1h/vC+qL7blwr7pdlUTkA3HM8W
	QuPHGauvOSdUTjPzMdxf+RIFO9bmvqtrTBPR6CVAYihgcCW9pKTA76rNZ3dNMoJNiY3MVq7SmYG
	6
X-Google-Smtp-Source: AGHT+IEpM9PCqxjLPjbnPvWf3Ts2ketrFkxlxb+ARXR6yW95bO/z8rMtYX0H5uVjUV/pilelZPvwJA==
X-Received: by 2002:a17:906:798:b0:a4a:3441:2e2a with SMTP id l24-20020a170906079800b00a4a34412e2amr582078ejc.55.1711533593476;
        Wed, 27 Mar 2024 02:59:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id du1-20020a17090772c100b00a4da28f42f1sm2371128ejc.177.2024.03.27.02.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 02:59:52 -0700 (PDT)
Message-ID: <7ff9c4c7-3b56-4a5b-95b7-c37cbf8bcd6d@linaro.org>
Date: Wed, 27 Mar 2024 10:59:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: power: Add mediatek larb definition
To: =?UTF-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?= <Yu-chang.Lee@mediatek.com>,
 =?UTF-8?B?TWFuZHlKSCBMaXUgKOWKieS6uuWDlik=?= <MandyJH.Liu@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?WGl1ZmVuZyBMaSAo5p2O56eA5bOwKQ==?= <Xiufeng.Li@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, =?UTF-8?B?RmFuIENoZW4gKOmZs+WHoSk=?=
 <fan.chen@mediatek.com>
References: <20240327055732.28198-1-yu-chang.lee@mediatek.com>
 <20240327055732.28198-3-yu-chang.lee@mediatek.com>
 <6dd9959e-f741-47af-b10a-1894f72ae78f@linaro.org>
 <c3ca3d90-898e-44b0-ad0f-dd78c09c5fcd@linaro.org>
 <f3eedfb3495bb9c28b5cbf466387c24822c5b6f6.camel@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <f3eedfb3495bb9c28b5cbf466387c24822c5b6f6.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_100010_996231_3BEC0EF4 
X-CRM114-Status: GOOD (  14.34  )
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

On 27/03/2024 10:34, Yu-chang Lee (李禹璋) wrote:
> On Wed, 2024-03-27 at 10:23 +0100, Krzysztof Kozlowski wrote:
>>  	 
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>  On 27/03/2024 09:39, Krzysztof Kozlowski wrote:
>>> On 27/03/2024 06:57, yu-chang.lee wrote:
>>>> Add Smart Multimedia Interface Local Arbiter to mediatek
>>>> power domain.
>>>>
>>>> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>
>>>> ---
>>>>  .../devicetree/bindings/power/mediatek,power-controller.yaml  | 4
>> ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git
>> a/Documentation/devicetree/bindings/power/mediatek,power-
>> controller.yaml
>> b/Documentation/devicetree/bindings/power/mediatek,power-
>> controller.yaml
>>>> index 8985e2df8a56..228c0dec5253 100644
>>>> --- a/Documentation/devicetree/bindings/power/mediatek,power-
>> controller.yaml
>>>> +++ b/Documentation/devicetree/bindings/power/mediatek,power-
>> controller.yaml
>>>> @@ -125,6 +125,10 @@ $defs:
>>>>          $ref: /schemas/types.yaml#/definitions/phandle
>>>>          description: phandle to the device containing the SMI
>> register range.
>>>>  
>>>> +     mediatek,larb:
>>>> +        $ref: /schemas/types.yaml#/definitions/phandle
>>>> +        description: phandle to the device containing the LARB
>> register range.
>>>
>>> Why do you need it?
>>>
>>> Plus I also see mediatek,larbs and mediatek,larb-id... so now we
>> have
>>> third one similar.
>>
>> ... and not even tested!
>>
>> Best regards,
>> Krzysztof
>>
> Hi,
> 
> I will double check the format of yaml for the next version, sorry for
> inconvenience. But I did test it on mt8188 chromebook, the reason why

How do you test a binding on chromebook?

> power domain need larb node is that when mtcmos power on, signal glitch
> may produce. Power domain driver must reset larb when this happen to 
> prevent dummy transaction on bus. That why I need larb node in dts.

No one talks here about larb node...

Best regards,
Krzysztof


