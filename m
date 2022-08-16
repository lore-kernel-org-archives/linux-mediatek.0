Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E166C2BB41
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 12:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u6vsO210HbSOzl+ApBtKdfKeKIVufqnfwmwO0kmWyvI=; b=h4mAYpQZZA9iCr
	YBhELiZM+HhR13xYX1WjAmoMprXSKT1802ezEA8ZUZpD1qOVsaTsXy4r0FdymjJtnt1MEiJ0MZsfD
	obX1cxta+KjEADubRpi12FJfgqmmFl8GJW6Aol6RMh1XB/IMkQYzkfC08kQk7c53JjeLBXnXGBEeC
	2ar9ujC3yDau8GbvrHnUOL51ecwR/YGJGwhmJOmSH00D2ip2z+TukpEFBmktKEe9K9aALjRhiXPXe
	Li4Sv4byKHXHOM5Niro6d7o2o5KgChXXSiZFNWRClxEAh0sKGjOLmetNQ8NqtrpeNNfQdAtYkl5t+
	QqzHfqb7XaVqxZY63jSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNw9Q-002YZ9-D2; Tue, 16 Aug 2022 12:58:32 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNw84-002Xbm-VQ
	for linux-mediatek@lists.infradead.org; Tue, 16 Aug 2022 12:57:10 +0000
Received: by mail-lf1-x134.google.com with SMTP id u3so14788827lfk.8
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Aug 2022 05:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=u6vsO210HbSOzl+ApBtKdfKeKIVufqnfwmwO0kmWyvI=;
        b=ryshPL7gSJngeT8mVWdgphUp3NPNc5/8T07ioXmLOYFE+RM9kMFox6j/QSmMx+MRjW
         IF5Tvsu+eUNa/PURaluKXcxsPoKwTU0v6obcpVNF6S4E2WUJQwfcMoAedizNNTEJVzIN
         qApkaeQsH9W4FBpYE2y4cHYlnaFnoj9yBLWWtHAiDyYD2WSMopnYkuWFR3AZvGXe9orE
         W7mL52SexG3h2NyytiRZEwQPnlFxYDDwyJbFKcIuCS7pw5DDoUXAJcdrv+Qc4tTN48CC
         ofihlq8KHD75r9tNZ+KV2KtQWXkZp55mGCW7DPJAuyRkCANnLDWg9JgV8nXF25DqpsEo
         /E1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=u6vsO210HbSOzl+ApBtKdfKeKIVufqnfwmwO0kmWyvI=;
        b=YQwbMlgfJ6ab1bjcqj08zg8Hv6fDLP7t0/FVPcv+oC8L7/+h18stJRMla0P3PA5bpz
         rvNKX0AlRW4zX12eRXE/GJTMBB75aLAPIIrzfx4mOLDQimQr3rzr61djeLVYL4OOkkfN
         UPxTlTQ33l3OCjw3bYxjuQaaibnKhKyex9WiCbjY24T2gVvjhZzJ2n+ixkEOLOXXTtkf
         +dRCBgelQITTFg0SdQ/1f0xbs/7exafs4scM6oVybRuZOepWm72UykdotiWAh3PkbnOF
         66/+1QG6ZuAHcjNwiF8BsbVvivu7usKkRWo3sKG4GbfMzS7tBa+s/FFfLXK2IpdtU396
         dPSQ==
X-Gm-Message-State: ACgBeo35VVgE01UIgZHNDWISF2ziyU3+6qoXu/w8Ah70sYCWS8I6++eZ
	snc+PuhD3Vp5gZsPqb1QjPZA8w==
X-Google-Smtp-Source: AA6agR60sMxOHtIXk2hcNdYq73fYG6QiAiIF8W4tR5L6Ra08qXNqi9BEiQFyK2ct4uvflrrmAZRnVQ==
X-Received: by 2002:a05:6512:b03:b0:492:88d3:8369 with SMTP id w3-20020a0565120b0300b0049288d38369mr3820559lfu.552.1660654625046;
        Tue, 16 Aug 2022 05:57:05 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id b26-20020ac2411a000000b0048af9d2d119sm1379707lfi.130.2022.08.16.05.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 05:57:04 -0700 (PDT)
Message-ID: <1349b271-796b-c9d2-a568-f9be84926ed4@linaro.org>
Date: Tue, 16 Aug 2022 15:57:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/1] regulator: dt-bindings: mediatek: add mt6366
Content-Language: en-US
To: "zhiyong.tao" <zhiyong.tao@mediatek.com>
References: <20220812092901.6429-1-zhiyong.tao@mediatek.com>
 <20220812092901.6429-2-zhiyong.tao@mediatek.com>
 <cbe761af-5011-83a2-0509-2b3c4fe0a79c@linaro.org>
 <4a49b619deb5453749a47874377cad6a36a9a054.camel@mediatek.com>
 <CAGE=qrohYZ6f9bbEuYfF=2Rz21nbW_8ho3rBQmHt1D+kQG2-jA@mail.gmail.com>
 <9bc148119fc36c34f404091ca0f5a2e37727c285.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9bc148119fc36c34f404091ca0f5a2e37727c285.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_055709_185883_85D4917D 
X-CRM114-Status: GOOD (  16.51  )
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
Cc: alexandre.belloni@bootlin.com, allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org, macpaul.lin@mediatek.com, lee.jones@linaro.org, hsin-hsiung.wang@mediatek.com, linux-rtc@vger.kernel.org, wen.su@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, sean.wang@mediatek.com, hui.liu@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, a.zummo@towertech.it, sen.chu@mediatek.com, lgirdwood@gmail.com, broonie@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 16/08/2022 15:54, zhiyong.tao wrote:
> On Fri, 2022-08-12 at 15:55 +0300, Krzysztof Kozlowski wrote:
>> On Fri, 12 Aug 2022 at 15:52, zhiyong.tao <zhiyong.tao@mediatek.com>
>> wrote:
>>>
>>> On Fri, 2022-08-12 at 13:55 +0300, Krzysztof Kozlowski wrote:
>>>> On 12/08/2022 12:29, Zhiyong Tao wrote:
>>>>> Add mt6366 regulator document
>>>>>
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: mediatek,mt6366-regulator
>>>>> +
>>>>> +  regulators:
>>>>> +    type: object
>>>>> +    description: List of regulators and its properties
>>>>> +
>>>>> +    patternProperties:
>>>>> +      "^buck-
>>>>> v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$":
>>>>> +        type: object
>>>>> +        $ref: regulator.yaml#
>>>>> +        unevaluatedProperties: false
>>>>> +
>>>>> +      "^ldo-v(dram2|sim1|ibr|rf12|usb|camio|camd|cn18|fe28)$":
>>>>> +        type: object
>>>>> +        $ref: regulator.yaml#
>>>>
>>>> You miss unevaluatedProperties in most of the places.
>>>
>>> Hi Krzysztof,
>>>    Thanks for your suggestion,
>>>    Do you mean that all places should have the
>>> unevaluatedProperties
>>> Properties ?
>>
>> Yes. You put it in some of the places which does not really make
>> sense...
> 
> Hi Krzysztof,
>    Thanks for your suggestion,
>    We find that if there is a properties "compatible = "regulator-
> fixed";" in ldo-vrf12, we should set unevaluatedProperties as true.
> or it will check yaml warning "Unevaluated Properties are not
> allowed('compatible' was unexpected)". is it right?
>    There is a properties "compatible = "regulator-fixed";"in ldo-vrf12.
> It will cause the checking yaml error "ldo-vrf12: 'regulator-name' is a
> required property". Can you help to give a suggestion to fix the
> warning? Add regulator-name for ldo-vrf12 or other suggestion?
> 

And how this regulator is supposed to work? Are you populating DT
children in your driver?

Best regards,
Krzysztof

