Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D139BC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 09:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xGuJPx1uoGLuQZAqwN8Nb6aczdriwTde5wtLI3AIWE=; b=Ki4R4tD7jZ/DjNxjT8/D/+AHi4
	b1jKUMUP7M58ZjLj3Syh4mZZ8YTwdZBNC+R+TXjovpU6z0/GSIpKbAf4s4XWIfE6t2AUs79GSAlEr
	FP53L8MHwrXynbLIjlPGYCNGHfGsWFBym/iNRGc0Phgprhh5s1Tr603T4ebE1e4DeQr649orP7cIb
	KDCn9yD+H/RZ2Kk/NU6FRPdrcGp3vlSyb7OrzZrkKui3GWSIyoVSPk+BD3wXnUgexASa8Xtywx3hR
	Y3XhlQeU8X4ki2gg4uscDmEkyT5dien8LAXhQXwm+EnB91qm4Erb0FhQs542ZgRzbAkVuvLbkSNBW
	8VGpzqKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGH8X-00BomH-7r; Tue, 26 Jul 2022 09:45:57 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGH86-00BoO3-3P
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 09:45:31 +0000
Received: by mail-lf1-x12d.google.com with SMTP id bf9so21757068lfb.13
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 02:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8xGuJPx1uoGLuQZAqwN8Nb6aczdriwTde5wtLI3AIWE=;
        b=iP1Vns9Rdr71xlSUgaLQB+Wgf9z1k13x+LivKmvxKlNz+ByC5eqZwxFYyan8XhRbcL
         lCNWrmrCN3/XlHcjE78JOZNLgkoqUmtDtSkNWUdFNX9p8FsWz14radPXjxIgppAuJ1sD
         iqRUmk2YX64tegZqFHAwUbSnq/RvYltVNFg3IVvUAhV2I1PuFarK8zt18Iwo4ZF2Od0C
         HvkELwgTEURbNBoAs2cBX9/fc0tFJzY/kVhjpqnhcKHPDi84iagYK/uSO5YXV/jbbYdn
         1BWK8jtJfxarKnVSJeAVS4ZNGIyKqIGajY9oBogUEXNGpOS7iUb0MHOH9eCmsEijuvog
         0eSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8xGuJPx1uoGLuQZAqwN8Nb6aczdriwTde5wtLI3AIWE=;
        b=Y0H2yQ40GRF8xKQbOEuT2bv0dugA+zCRJgG4n2YP6O+uMkgMYMBJdIaSuTEAOy9Djr
         DovEnFimSdjJYOxfZQwR+oMMPCXTD7ACFCZsiW81Tbh/XkZADdnmKiQEOZcHNROMWx5b
         1K/Lc4wCBVUpu64gQi2Wv2KFRSYeEaWeVRrnHuDp/X3H4rBH6CLBSeev2ju/ceTq35pn
         ogCiGh6HZa2oFhp5/lVSeAPX5Q8yKMmParEMVNVq2O4Y7VU4Hxk0mwcewKAUe5SUQF41
         t8yW5LFGmYt+nk/LAlECOoboKyl3pASbAQAHW3z/JmsHTzdaXxYvDkOYeLkGNUtJ1Iw3
         cyNQ==
X-Gm-Message-State: AJIora/P/rdRNPhvSfydoEhoh4MTbQ0NuPbTq/OJEC9WcDa9g9WvcYQr
	x3SdMhnPK4Gs+KceJJnaVnJLVw==
X-Google-Smtp-Source: AGRyM1talH+BemWNWyeJS55FRhEcJ00+9GMnyvbyiYEwIj1ILXShUt2a2mtFcJ3AXT7yWfAz4VP8eg==
X-Received: by 2002:a05:6512:acd:b0:48a:7c05:71db with SMTP id n13-20020a0565120acd00b0048a7c0571dbmr6482630lfu.433.1658828727805;
        Tue, 26 Jul 2022 02:45:27 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id y19-20020a05651c107300b0025d72c1f646sm3206657ljm.58.2022.07.26.02.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 02:45:27 -0700 (PDT)
Message-ID: <5cd79059-e858-3c6d-8ef2-6d8b12367830@linaro.org>
Date: Tue, 26 Jul 2022 11:45:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
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
 <53d432e9-6715-05c4-d258-896ec38afa4f@linaro.org>
 <9dbcee74667cdc77ad80c043bb7725c63ff1cbd2.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9dbcee74667cdc77ad80c043bb7725c63ff1cbd2.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_024530_168587_54D47698 
X-CRM114-Status: GOOD (  14.17  )
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

On 25/07/2022 12:10, hui.liu wrote:
> On Fri, 2022-07-22 at 20:19 +0200, Krzysztof Kozlowski wrote:
>> On 22/07/2022 03:40, hui.liu wrote:
>>> Hi, Krzysztof
>>>
>>> That's the comment about reg and reg-names description:
>>>>> +  reg:
>>>>> +    description: |
>>>>> +      Physical address base for gpio base registers. There are
>>>>> 8
>>>>> GPIO
>>>>> +      physical address base in mt8188.
>>>>
>>>> Redundant description, skip it. You should list the instead and
>>>> describe
>>>> each of it.
>>>>
>>>>> +    maxItems: 8
>>>>> +
>>>>> +  reg-names:
>>>>> +    description: |
>>>>> +      Gpio base register names.
>>>>
>>>> Redundant description, skip it.
>>>>
>>>>> +    maxItems: 8
>>>>
>>>> You need to list the items instead.
>>>
>>> I plan to update reg and reg-names as the following:
>>>   reg:
>>>     description: |
>>>       Physical address base for gpio base registers. There are 6
>>> different GPIO physical address bases in mt8188.
>>>     minItems: 6
>>>     maxItems: 6
>>
>> You should rather have here items with description:
>> items:
>>  - description: what is it
>>  - description: what is it
>>  ....
>>
> 
> Hi Krzysztof,
> 
> I will list each items with description as follows, is it right?
>   reg:
>     description: |
>       Physical address base for pinctrl base registers. There are 6
> different physical address bases in mt8188.
>       iocfg0 is gpio base address;
>       iocfg_rm is io configuration
> address for rm group;
>       iocfg_lt is io configuration address for lt group;
>       iocfg_lm
> is io configuration address for mm group;
>       iocfg_rt is io
> configuration address for rt group;
>       eint is eint base address.
>     minItems: 6
>     maxItems: 6

No, because it is not schema and you still keep here min/maxItems which
are pointless in that case. Just read example-schema.

https://elixir.bootlin.com/linux/v5.19-rc8/source/Documentation/devicetree/bindings/example-schema.yaml#L63


Best regards,
Krzysztof

