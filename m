Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC46C433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Nov 2022 10:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6I/Z/D+bfI5rpoGK4pCb1Y+E9eMHCV51iKQUL8lPZc0=; b=RMotaWpirSkbUKqJ+eDRoSiL2G
	hzsLCnIkM9oyPgWk3woMvstni7yqhbGEzJzjcaqBoR3+iem2Stu8EgCeZ1ZJ4ByIl+UwU+JfEjriF
	4wxgIDtl2LssQoAv6Kq9xCv76Elb0yQV4pQqEdxZs1wF8lw8qr33YJcCSwZlS1q1tJwAw49ljfFbO
	WHdRTb0woS1BmJkZxaM2sIzehPMBWUkc34YCL0ke4v1kS+b0dFRiJ5vehNJljWcypbnBGIsuhF1Uj
	fHDPaKbNeuaWFVmh/WqASpISYpsZafiuy1ER+RATV1x0+0ZqdEYnBWtFHGbbRiwIpkNAolDeT1jF7
	386J5fQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owhkF-003gmM-OJ; Sun, 20 Nov 2022 10:40:15 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owhkA-003giU-8X
	for linux-mediatek@lists.infradead.org; Sun, 20 Nov 2022 10:40:11 +0000
Received: by mail-lf1-x129.google.com with SMTP id g12so14937337lfh.3
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Nov 2022 02:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6I/Z/D+bfI5rpoGK4pCb1Y+E9eMHCV51iKQUL8lPZc0=;
        b=bjf3d2XJA3mpzYV8yNz6tmkpXTOu9TbqM0pYlTCxxM4PDnrCnmbZGYEvbsd8SX9Lp+
         sy7gko4NuhDtFiWM6jDQKHMVnSf3Kh8dJOPwGlUy3R/v0js1OZYNfGAQeWR8Apk/D5gu
         PmdTqSZqPneghE6OF6e0lJaT+jCDUCex2TqrN+S+uGkMV8/Gcn5UPNIkFJOgoIWUP56N
         j0S2pTdxvg1fE6rKaYzwJDqNqIuPujONqSXQNLSSQxrBurfYdBsi9hff9ThJHznwWb0O
         XMsKuTp2B+OYnHyvT1M3JYyFeubXw9AB/Nc3M5FU/8naBaDF9FXJCB6gSvOFZ2FBmUFc
         AAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6I/Z/D+bfI5rpoGK4pCb1Y+E9eMHCV51iKQUL8lPZc0=;
        b=ctxRfr2y7TmdVZLoYQXVFoeogTMp6MiFNjjxYUtNQr9f/sc3tlYJdIWXooTw5uMHjG
         WAiL1NmfMALu0XuuzY4zz7dif32d0DLm9lMx1bCmiiV+6Q7J9hAAGE287L2hRX+cysks
         vAo6mB7hucFkMLdO7s3CjyEiyt26YEWPcFLK9KIiJE4ndRx0pmJGxZWRIIPBpkgD1gw0
         bIcag5As+3/ATRq4OTL/kflJhBblh6GcN69GWhW6SCYerwOb+pBvyWc5iE9sVTo5YEHK
         AmEdoNN3S8fAQkQtqsYcYFJOw9ykfJFFg9T4TniU4mWuRsuvWbuowjziJcRWavS+Oi5X
         hoDw==
X-Gm-Message-State: ANoB5plC2MqpXn2T8/Bdb13SvAz8HeIXzk9iXvNgt+Wutz7q+n4q7RQ1
	YAefrH7FQKyhPdxY2O23tlEafw==
X-Google-Smtp-Source: AA0mqf4GJTVZ6oOy/tG1Y2xUN3IM+SCcLz2+qe3xY1TglkFbGHfu9W873n2qi+HObj1karKVyGKUUQ==
X-Received: by 2002:ac2:43b0:0:b0:4a4:719a:19ed with SMTP id t16-20020ac243b0000000b004a4719a19edmr5135600lfl.356.1668940808593;
        Sun, 20 Nov 2022 02:40:08 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k21-20020a05651239d500b00494618889c0sm1488288lfu.42.2022.11.20.02.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 02:40:08 -0800 (PST)
Message-ID: <76cae9bf-c81a-684a-c22b-9548dd82c8d4@linaro.org>
Date: Sun, 20 Nov 2022 11:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 4/7] dt-bindings: pinctrl: add bindings for Mediatek
 MT8365 SoC
Content-Language: en-US
To: Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogiocchino.delregno@collabora.com
References: <20221117210356.3178578-1-bero@baylibre.com>
 <20221117210356.3178578-5-bero@baylibre.com>
 <06e916b7-f8f2-6de5-f86e-7b020c052451@linaro.org>
 <7ha64o9h1d.fsf@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7ha64o9h1d.fsf@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_024010_341271_64FC930F 
X-CRM114-Status: GOOD (  20.26  )
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

On 18/11/2022 20:52, Kevin Hilman wrote:
> Hi Krzysztof,
> 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:
> 
>> On 17/11/2022 22:03, Bernhard Rosenkränzer wrote:
>>> Add devicetree bindings for Mediatek MT8365 pinctrl driver.
>>>
>>> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
>>
>> Thank you for your patch. There is something to discuss/improve.
>>
>>> +
>>> +  pins-are-numbered:
>>> +    $ref: /schemas/types.yaml#/definitions/flag
>>> +    description: |
>>> +      Specify the subnodes are using numbered pinmux to specify pins.
>>
>> Why would you name pins differently per board? And why this different
>> naming of the same pins is a property of hardware?
>>
>> This looks like something to drop.
> 
> Yeah, having this as a flag kind of implies that this could be present
> for some boards but not others.  But in practice, the driver requires it
> to be present or just fails[1].  What's the right way to describe that?
> We're just trying to add a binding that reflects the existing driver.

Uh, what an interesting property. What's the point of it then? Why
failing to probe on a missing property which does nothing else?

The solution is also to drop that property from the driver.

> We also noticed that there's another documented binding with this
> same flag[2] where similiarily, the driver simply requires it to be
> present[2].
> 
> So is the way this flag is documented in the stm32 binding OK for the
> mediatek one also?  If not, what would you suggest?

I would like to understand why do we need this property and what is
described by it. Because if it's purpose is only to fail or not fail
driver probe, then we should just drop it everywhere.


> 

Best regards,
Krzysztof


