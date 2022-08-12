Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14B0C00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Aug 2022 07:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIkBdKPO0ia6WryWVkSmCCsuoT+XbQoa2jB/wItvraw=; b=ZvqznePsrNyJUqqFrgy2GkD4uO
	gV55MR+OoLXsvTbbAk2tSC+r5O+HToXaDNmonRVBNbU5vLCUq4pZ3/+GynllL8I4Fb30BP5++LSih
	XHKSR2vFrPgl/ALtVwkBkfKA5DPYKcJJcmiETbAFRAlgAGzilCoLtki3WQH6UJss6NeZgUPCRxgVy
	78F7celgS7UEb7ET+DmREMndwL9SWd8Q3UP7oGQeaT7Yo8bGc5HxfEafYcZGnSKJK7ZuK8ZptxzGz
	9yrbLBdGrgMS6UkuNMWwHisfecUwleuznZIRDFPupihMAdvNDBcfWUbptEuPXZjE8PtCRP32+yqkt
	TYAwo28A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMOfi-000UfB-86; Fri, 12 Aug 2022 07:01:30 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMOff-000U9U-5m
	for linux-mediatek@lists.infradead.org; Fri, 12 Aug 2022 07:01:28 +0000
Received: by mail-lf1-x133.google.com with SMTP id z6so145574lfu.9
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Aug 2022 00:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=SIkBdKPO0ia6WryWVkSmCCsuoT+XbQoa2jB/wItvraw=;
        b=QcVSBUIiPoJBTP/i7J05TmQcLDmF+7re5RaUW7Yue5QCHt7PFToz9xeuYL+4EJnuDs
         PFMzc0bg7G7TBDlF3Cngr/XnD+myenUSl3WYUmUL+hKlvo5AWe2kdbHCGU5MgkXMujCr
         9W7P70YJqRFOr8+//4z1CYL7szZB6+BkBjvGQOnv71VP+Ku3Jo0ZUpGp6593ciRFCBag
         vm6RZNbiSm3spWzlFQsdbYZokeZEGRvHID10EruE8e4ru/khzXsnWFMT72bojLKxZnZ0
         80VDCyatjKWKuRqlrkGfH1+rQxzg/CR67vgqR/UmTVlXB7hhLDkIusXtyEWo0J2dQeQf
         wMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=SIkBdKPO0ia6WryWVkSmCCsuoT+XbQoa2jB/wItvraw=;
        b=IIStYY1anJ8GG69Zsa6ChB2NXZ2J7z6U7iOLhHUUWjC2guIWk5db0XQ71VJCxkG01A
         vjmnDe8RK6C4pEUwOywR2FJj0mTlBdEdvMggHwnvAb8deLCixBHICVOMzC+yIblMvr+D
         Do0K1Zm56NFUtnnhBe99YibDhfeI5JpgI3b8r4nImXs6JYww2q+sRnYkyuKf8M4copoy
         i5zVjnAurpG6gEGD4hmHwZF6qfESksQzDiNJLbzHJ9FJxRlUDPb2EymE6pt1jM3tBsOG
         HHuBIPZVLWSKLQbc2MvdI4QqSg23gEmI2MghE31yN2JFA7KHZeE71BrmCJ6wVfZGRS0S
         3X6g==
X-Gm-Message-State: ACgBeo2t/HJeo3sFx7a1H8dvdxg3mWBxuEq2Vd2KbCMEYf5yvF38XPHm
	YHQithY+Wrnr6tSHJgNlATbu2g==
X-Google-Smtp-Source: AA6agR4dr9OpzaVrayVua9XEETsz6x4gzfPaVp1rLoMSliu+ypKx2TsqnT6xOOIjwQQiKfzvXErzDQ==
X-Received: by 2002:a05:6512:3501:b0:48b:205f:91a2 with SMTP id h1-20020a056512350100b0048b205f91a2mr834830lfs.83.1660287682735;
        Fri, 12 Aug 2022 00:01:22 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id x2-20020ac24882000000b0047f6b4f82d1sm105601lfc.250.2022.08.12.00.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 00:01:22 -0700 (PDT)
Message-ID: <40130c63-1e36-bb43-43b4-444a8f287226@linaro.org>
Date: Fri, 12 Aug 2022 10:01:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/4] dt-bindings: net: dsa: mediatek,mt7530: update
 json-schema
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Frank Wunderlich
 <frank-w@public-files.de>, Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Sander Vanheule <sander@svanheule.net>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 Daniel Golle <daniel@makrotopia.org>, erkin.bozoglu@xeront.com,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220730142627.29028-1-arinc.unal@arinc9.com>
 <20220730142627.29028-5-arinc.unal@arinc9.com>
 <e5cf8a19-637c-95cf-1527-11980c73f6c0@linaro.org>
 <bb60608a-7902-99fa-72aa-5765adabd300@arinc9.com>
 <8a665b7a-bbd0-99ce-658e-bc78568bdca2@linaro.org>
In-Reply-To: <8a665b7a-bbd0-99ce-658e-bc78568bdca2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_000127_256852_FCA47D5A 
X-CRM114-Status: GOOD (  17.20  )
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

On 12/08/2022 09:57, Krzysztof Kozlowski wrote:
> On 12/08/2022 01:09, Arınç ÜNAL wrote:
>>>> -patternProperties:
>>>> -  "^(ethernet-)?ports$":
>>>> -    type: object
>>>
>>> Actually four patches...
>>>
>>> I don't find this change explained in commit msg. What is more, it looks
>>> incorrect. All properties and patternProperties should be explained in
>>> top-level part.
>>>
>>> Defining such properties (with big piece of YAML) in each if:then: is no
>>> readable.
>>
>> I can't figure out another way. I need to require certain properties for 
>> a compatible string AND certain enum/const for certain properties which 
>> are inside patternProperties for "^(ethernet-)?port@[0-9]+$" by reading 
>> the compatible string.
> 
> requiring properties is not equal to defining them and nothing stops you
> from defining all properties top-level and requiring them in
> allOf:if:then:patternProperties.
> 
> 
>> If I put allOf:if:then under patternProperties, I can't do the latter.
> 
> You can.
> 
>>
>> Other than readability to human eyes, binding check works as intended, 
>> in case there's no other way to do it.
> 
> I don't see the problem in doing it and readability is one of main
> factors of code admission to Linux kernel.

One more thought - if your schema around allOf:if:then grows too much,
it is actually a sign that it might benefit from splitting. Either into
two separate schemas or into common+two separate.

Best regards,
Krzysztof

