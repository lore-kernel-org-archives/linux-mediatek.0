Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222E8C77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 09:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gmZaXoh5OynzC86VaTh4Y6BvZrzd/QsKcjbYpPnZc0=; b=k+YiFBSdbnCNeMZv7WyTg8wa0G
	kTjamm3PhCNSAKjAYI7kZM6ZzfpAZ0LG80zuMb0xsUqC7YHmxNw0DGWBVu3kh4z3li2/afGMv+gg+
	5GqynY+saNxTtsH+j/IbM8MyCQYTgaPGrQx/x6grucWdzg7E/V0HfTIVYp6QzUPsSH7bm9iGriAd8
	7VZ4fEyg5WE0ab6RWN04m2T1FMXrvRaBcR6R1t7fyC1eYRWa4ZN28cw6HVTkSkeXfNZnx1C0BOva1
	m+n4E1rKLsp/wJcSJBjyqLorU6ntlCZW4lUpWPuPxhtxuNkNFAUSTDU2DUCEpWVqm3/1zaxVAfF1Q
	ipyY+TBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pki4b-009bU3-1O;
	Fri, 07 Apr 2023 09:07:57 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pki4Y-009bQp-1m
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 09:07:56 +0000
Received: by mail-ej1-x62b.google.com with SMTP id jw24so7085795ejc.3
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 02:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680858469;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9gmZaXoh5OynzC86VaTh4Y6BvZrzd/QsKcjbYpPnZc0=;
        b=Xz8iLJoj3e6atCdL3Uvpx3dUFJKuQsv2GH4wcE8UI1rl0GJXVuGqUZSpj/tONGDCPj
         u8p85UbDTJ+HLqeJw/YnZ4faLPx8LKpc5WxqDRLvWk4Dm2L4FADqlBBqPrBu1wi3SYbE
         VWTQxTC/mD01K1EMTJjuUX+c+d9o3V18k4jh9u2v4RPghw4ULoS0s0mnPxMUe79FszTG
         i/V4jO5WXAVR45hsrXNpPVrlhEDYZgMlwW14UpvVRRneT11I4dIY0LQb5/6mivQg2wCs
         nSCdNOjcDV+yKsQl2QK9+Glg+KHIL5XRN0dDAlWrj9Arx16pzha2SfsFfWN15bz7gFC1
         mkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680858469;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9gmZaXoh5OynzC86VaTh4Y6BvZrzd/QsKcjbYpPnZc0=;
        b=yHO4cWDUwtwJKaGLRmvbIKsvfUeLMnoY5Mvk1Qy3gaYrRjHHYHCu/QSNXiRjtIZBRS
         dAz9v/dRYHqAvG243TNUChQKHBfxg13kSl8U9pJlx8SCw45vH3OrqNI9SyPgsLbrJkwU
         apbABovcXqlxM3/Sn0AmvfntTIecTW7Vz5nnr1Q59WuALc+nXDsFGRayPf6AWrczMCBv
         somuwYwf8KNxZgQ1e5NwY638+E58jZzT4RHv9+cGbdpiOaDQzaEApHMTV3LBNHTYWkDk
         OQD2l7tr/4PFS89LdAHQy3LvB/39PtQwdQoYFp2ICwVmcjyUEci+QnnfawcSCA/qWKnv
         CbKA==
X-Gm-Message-State: AAQBX9eiSdNrEuC4gB+fbgDBRSb0gaeUG4680Bo1b/GYYqzLpoWnZxMH
	Xgnh9UGgY5eOPna8Gf9ZOmcfKw==
X-Google-Smtp-Source: AKy350bMxNw13TzLGoIgRzK5ovfvLEWUmmgDUnmQBPIUls264bsoQ74I1vJcA7PJ/i7xcVI2UzdWtQ==
X-Received: by 2002:a17:906:39d3:b0:8de:502e:2061 with SMTP id i19-20020a17090639d300b008de502e2061mr1172023eje.3.1680858469115;
        Fri, 07 Apr 2023 02:07:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:14a3:366:3172:3c37? ([2a02:810d:15c0:828:14a3:366:3172:3c37])
        by smtp.gmail.com with ESMTPSA id lf24-20020a170906ae5800b00933d64cd447sm1826425ejb.121.2023.04.07.02.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 02:07:48 -0700 (PDT)
Message-ID: <e716d33d-bd39-3f84-3e2e-18cfaf0439cd@linaro.org>
Date: Fri, 7 Apr 2023 11:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 5/7] dt-bindings: net: dsa: mediatek,mt7530: disallow
 reset without mediatek,mcm
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 arinc9.unal@gmail.com, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230406080141.22924-1-arinc.unal@arinc9.com>
 <20230406080141.22924-5-arinc.unal@arinc9.com>
 <d5769d8f-29f3-063e-0562-487b1b509d3c@linaro.org>
 <194d3bad-c30a-df07-5fab-3264f739c599@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <194d3bad-c30a-df07-5fab-3264f739c599@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_020754_590147_E6591832 
X-CRM114-Status: GOOD (  13.23  )
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

On 06/04/2023 21:19, Arınç ÜNAL wrote:
> On 6.04.2023 22:08, Krzysztof Kozlowski wrote:
>> On 06/04/2023 10:01, arinc9.unal@gmail.com wrote:
>>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>
>>> The resets and reset-names properties are used only if mediatek,mcm is
>>> used. Set them to false if mediatek,mcm is not used.
>>>
>>> Remove now unnecessary 'reset-names: false' from MT7988.
>>>
>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>> ---
>>>   .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml         | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> index 9d99f7303453..3fd953b1453e 100644
>>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> @@ -282,6 +282,10 @@ allOf:
>>>         required:
>>>           - resets
>>>           - reset-names
>>> +    else:
>>> +      properties:
>>> +        resets: false
>>> +        reset-names: false
>>>   
>>>     - dependencies:
>>>         interrupt-controller: [ interrupts ]
>>> @@ -324,7 +328,6 @@ allOf:
>>>         properties:
>>>           gpio-controller: false
>>>           mediatek,mcm: false
>>> -        reset-names: false
>>
>> I don't see such hunk in linux-next.
> 
> This was added very recently so it's only on net-next at the moment.

OK, I was checking one few days old.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


