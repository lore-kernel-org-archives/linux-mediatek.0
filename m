Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E9EC7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 16:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjsnIpfOQB8bXiCEyrFPNZ7eINu8y00FwWxIEZFO2H8=; b=wIslriv303ToYpzUbLAHZM/d1c
	AeUq6q8/LX0ducnVQ4LRUpKKyP3S7Ck3ajcppBFT8wFYxJLo8HzreZtZYb6+KsdsHyp8//fT4UbsL
	dQBSQkuE0FH/332qtKECXJI8MqM3gmTV0Wul1kZrcG9G6smGHMy/EpuSJI/ch8ALszbI+wqblB1VO
	CJig3RlLeqjl/oQCpyXJnEXwm8Co5ZGenpQDwwC/cfCdZE/P4noBOUdGwbSRFIa2hVx3wNBKQK1Bb
	x/u/cGuX2Ge0G2j1rQaQoOCX94ubL4RAG3YfxiWudu9KYJd+C53y0bVKUfkkrOHmjPP0JOKWoTy/V
	75ZlSz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmdVS-003pzQ-2i;
	Wed, 12 Apr 2023 16:39:38 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmdVQ-003py7-1L
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Apr 2023 16:39:37 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50506ac462bso429151a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Apr 2023 09:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681317573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wjsnIpfOQB8bXiCEyrFPNZ7eINu8y00FwWxIEZFO2H8=;
        b=Svb4qAOBP+hW/lCQsPo+DQoVQzZnNdUGZUthwNi58ITBxz8whyBqb0ZnH+ImgAFGRc
         p44f2selI+AQD100B9gCrOL6dfxkuKO8G84ICcoj9ugmWQo1EVuBciFpHTfP3MyGImEv
         oo00lqssDo8U18xmtpxVrjAoM7dojbhS8EA8Xx7Og3BcgpvQDykAv0ZaQg3a+FaAHwFj
         17l4KA5IADwEPyuy5ldHi+3zNK7mmfrXwu+ofdfF+LpIYFqOLbCzJX8tsuxpFWtzPFJd
         hX04/hRUBBwnAwVqES8lkohsYw+rIPeaWTlwCCoEj+MYiv7x53CKrb2pUXsiqMWHQVbn
         M4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681317573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wjsnIpfOQB8bXiCEyrFPNZ7eINu8y00FwWxIEZFO2H8=;
        b=HFsBD/D7mIOpKXYHFOe6eCaLZujl601mtfTdzpTnqmdkDgYc2uRbTpMBSCkgeDV9RF
         hbExiaz6t4rd1JHCM7WngKRFsDnHBf00teBMV/DQjE3rdeKFJfeeFN5MD3ATk+iQWh7B
         yF96QnJlXWXkwmq7ny07uflLkhSNmBgsdZcuq/HX4CuhlPnD5YCSnWnJgQ8UPsZG0rO8
         jip/7swNVhP8pXOpIrDrdot3oy9w4SDZRi30qUAk0G+FkQL0GrG2v4F/3znivmcvvAfA
         vVXrNDXlqe+FgnY3N32iM8oxYpvN7e8F190oWwFF/gGBvM2abQ26D3xbwu+yKrNIpUI1
         6KsA==
X-Gm-Message-State: AAQBX9edp6fencomUGogVPzVFwkMHAQX6DefjVoFurDWZ2DnFI/G1PI5
	DIuIKgLlDSxK9Uou9LPiAfxu20HpssaJVdhutro=
X-Google-Smtp-Source: AKy350aL10p8ZvO/uuBSLAFaGHPL+GVZnp473n+I6x+oIN043R05Kjx5EBQEvM6M53B/enOB1WnRKQ==
X-Received: by 2002:aa7:d58c:0:b0:504:b60a:e7e8 with SMTP id r12-20020aa7d58c000000b00504b60ae7e8mr3197279edq.20.1681317573432;
        Wed, 12 Apr 2023 09:39:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:938a:b3db:7c59:795e? ([2a02:810d:15c0:828:938a:b3db:7c59:795e])
        by smtp.gmail.com with ESMTPSA id c31-20020a509fa2000000b005049c1f1c60sm3535728edf.65.2023.04.12.09.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 09:39:33 -0700 (PDT)
Message-ID: <153a5ed0-5f4f-4879-2677-e5bce5453634@linaro.org>
Date: Wed, 12 Apr 2023 18:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/7] dt-bindings: net: dsa: mediatek,mt7530: add port
 bindings for MT7988
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
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
 <20230406080141.22924-3-arinc.unal@arinc9.com>
 <23c8c4b5-baaa-b72b-4103-b415d970acf2@linaro.org>
 <5b3a10ff-e960-1c6e-3482-cb25200c83c6@arinc9.com>
 <951841d3-59a4-fa86-5b45-46afdb2942dd@linaro.org>
 <5a92419c-4d2c-a169-687b-026dc6094cd8@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5a92419c-4d2c-a169-687b-026dc6094cd8@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_093936_464192_0121340D 
X-CRM114-Status: GOOD (  21.84  )
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

On 07/04/2023 11:46, Arınç ÜNAL wrote:
> On 7.04.2023 12:07, Krzysztof Kozlowski wrote:
>> On 06/04/2023 21:18, Arınç ÜNAL wrote:
>>> On 6.04.2023 22:07, Krzysztof Kozlowski wrote:
>>>> On 06/04/2023 10:01, arinc9.unal@gmail.com wrote:
>>>>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>>>
>>>>> The switch on MT7988 has got only port 6 as a CPU port. The only phy-mode
>>>>> to be used is internal. Add this.
>>>>>
>>>>> Some bindings are incorrect for this switch now, so move them to more
>>>>> specific places.
>>>>>
>>>>> Address the incorrect information of which ports can be used as a user
>>>>> port. Any port can be used as a user port.
>>>>>
>>>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>>> ---
>>>>>    .../bindings/net/dsa/mediatek,mt7530.yaml     | 63 ++++++++++++++-----
>>>>>    1 file changed, 46 insertions(+), 17 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>>>> index 7045a98d9593..605888ce2bc6 100644
>>>>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>>>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>>>> @@ -160,22 +160,6 @@ patternProperties:
>>>>>          "^(ethernet-)?port@[0-9]+$":
>>>>>            type: object
>>>>>    
>>>>> -        properties:
>>>>> -          reg:
>>>>> -            description:
>>>>> -              Port address described must be 5 or 6 for CPU port and from 0 to 5
>>>>> -              for user ports.
>>>>> -
>>>>> -        allOf:
>>>>> -          - if:
>>>>> -              required: [ ethernet ]
>>>>> -            then:
>>>>> -              properties:
>>>>> -                reg:
>>>>> -                  enum:
>>>>> -                    - 5
>>>>> -                    - 6
>>>>> -
>>>>
>>>> I have doubts that the binding is still maintainable/reviewable. First,
>>>> why do you need all above patterns after removal of entire contents?
>>>
>>> The 'type: object' item is still globally used. I'd have to define that
>>> on each definitions, I suppose?
>>
>> Doesn't it come from dsa.yaml/dsa-port.yaml schema?
> 
> It comes from dsa.yaml#/$defs/ethernet-ports which this schema already 
> refers to. I'll remove the patterns above.
> 
> Though 'type: object' is not there for "^(ethernet-)?port@[0-9]+$". I 
> think I should add it there as the dsa-port.yaml schema defines the 
> properties of the DSA switch port object. 

It has ref, which is enough.

> So the value matching the 
> "^(ethernet-)?port@[0-9]+$" regular expression is expected to be an 
> object conforming to the structure defined in dsa-port.yaml.
> 
> Does that make sense?

Hm, no, sorry, I still do not see what exactly is missing from
dsa.yaml/port that you need to define here.


Best regards,
Krzysztof


