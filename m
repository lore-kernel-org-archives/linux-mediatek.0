Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1997C28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 06:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjb0wRVho1IbfKOm+QRWs6abzY2pnVDemjVYoIt+vcs=; b=Su/pzLvlzGxbNWl5fxFbL9k06a
	rQNiHXfTD6YjJje1Q5U3G8B3/Sy8IlsJ26Kz9b8rYVdWnwN+AlkiZ/NGreSiqJW3cowYipGlY1cYH
	/bOZAy27Tka0LGzyrmgd6zhx6y4S7PG9MZtC5Wpr1OurEYx3mZuqEXJ9o4IX/WdHAyAZChkfKQZpN
	NB2mxu7rr5oeP0Kignv1TlvMyb+ziGyndhormcrW+pCn8Mi4tMM1ZeB4xtm/w47aaijSJENVuRTeO
	4BrXrT/M/mFFCZiFxogeNZ1UR87718wNMX/F7LemCFJ2yxUEC8lRIzMNKQFHYupU9rWuTAQ7nmtCX
	pZMasAuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR6Qh-007uvc-Gp; Thu, 25 Aug 2022 06:33:27 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR6QM-007uXF-Tf
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 06:33:08 +0000
Received: by mail-lf1-x12b.google.com with SMTP id s6so15708437lfo.11
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Aug 2022 23:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=jjb0wRVho1IbfKOm+QRWs6abzY2pnVDemjVYoIt+vcs=;
        b=t5qX2ZwFRSwBn7O7CkXQqXzasT+loOrUHXDGUumDRuWD+3IBYgV+YraXQu9RHfxdCy
         Zh71qivAjZLQwCvqAQ57NAwBop9P2lQ4skoEKRYsQH07N7UKLkiQTqbJchgvg9DNy/QA
         1SOsoER0W3I4lj8yr6EhuArJ/mDiYDrKnrFstWDZgsCmxfHL/8TMNx4Li0bcsmuvLQKD
         COKYjAyxuz7HUZcoBcpYMlFRHz85vO1R6mwp61pSuew8T7gC5b6pLaQC8nHpSZO9UK1R
         jvs+xtGh6XfgFyGT9G4ulVnizIxD6h6HJrlZ/nYKvRhM4A2khL9rW3TWKpE3uVmiO44+
         4qQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=jjb0wRVho1IbfKOm+QRWs6abzY2pnVDemjVYoIt+vcs=;
        b=LWT276DWnV0IxtABmHslWlHFU5801vTDbh8irLi1MShgLN2DwFbPFGUAcKtJf0mAIX
         MnC1sVXvZWunF8JekrLBCD3M3Du9CJambOsWVq1ChCyyTF+sfg5KWSWbwp+76xBQQWfe
         GUIYcqEyguf2X/2162bb5MNwLdcNdPqCYDadPuKHlRgIXAmapEPXK3Xpzl3MwvBh3EgX
         87+dQ2SsIzzU42FNzxQXJCHYhPax9K8BcOQEP/HiTPWM1GtmFVRjK46arp1lKMkjSi5N
         xAhdPk9MIHAQieoUmlxPMjKi2wZDUBA8GXDYi1BawASRtraW1frA3vw3Mygv9fK/bMNw
         xsXw==
X-Gm-Message-State: ACgBeo3ZVOpAws5WlwURWTrNJWsZG5/OESl/PpbVk97GACmMnlR04JRZ
	2Rz1E/RYXQJUilcL719FYsvw8A==
X-Google-Smtp-Source: AA6agR4I4yjF/QiNBfJc1j5Y8lITB8zsTBX7CYP2sWhLpA2MPjNjOSJwTPxzRKG69SqnrxcemVRG7A==
X-Received: by 2002:a05:6512:159a:b0:492:8c61:1991 with SMTP id bp26-20020a056512159a00b004928c611991mr620418lfb.245.1661409181980;
        Wed, 24 Aug 2022 23:33:01 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id h27-20020a19ca5b000000b0048af397c827sm316655lfj.218.2022.08.24.23.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 23:33:01 -0700 (PDT)
Message-ID: <7248cbce-29b9-aad6-c970-8e150bc23df8@linaro.org>
Date: Thu, 25 Aug 2022 09:33:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 4/6] dt-bindings: net: dsa: mediatek,mt7530: define
 port binding per switch
Content-Language: en-US
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
References: <20220820080758.9829-1-arinc.unal@arinc9.com>
 <20220820080758.9829-5-arinc.unal@arinc9.com>
 <c24da513-e015-8bc6-8874-ba63c22be5d6@linaro.org>
 <ea3ceeab-d92b-6ce5-8ea9-aebb3eaa0a91@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ea3ceeab-d92b-6ce5-8ea9-aebb3eaa0a91@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_233307_036269_B1F21524 
X-CRM114-Status: GOOD (  17.47  )
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

On 23/08/2022 15:29, Arınç ÜNAL wrote:
> 
> 
> On 23.08.2022 13:47, Krzysztof Kozlowski wrote:
>> On 20/08/2022 11:07, Arınç ÜNAL wrote:
>>> Define DSA port binding per switch model as each switch model requires
>>> different values for certain properties.
>>>
>>> Define reg property on $defs as it's the same for all switch models.
>>>
>>> Remove unnecessary lines as they are already included from the referred
>>> dsa.yaml.
>>>
>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>> ---
>>>   .../bindings/net/dsa/mediatek,mt7530.yaml     | 56 +++++++++++--------
>>>   1 file changed, 34 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> index 657e162a1c01..7c4374e16f96 100644
>>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> @@ -130,38 +130,47 @@ properties:
>>>         ethsys.
>>>       maxItems: 1
>>>   
>>> -patternProperties:
>>> -  "^(ethernet-)?ports$":
>>> -    type: object
>>> -
>>> -    patternProperties:
>>> -      "^(ethernet-)?port@[0-9]+$":
>>> -        type: object
>>> -        description: Ethernet switch ports
>>
>> Again, I don't understand why do you remove definitions of these nodes
>> from top-level properties. I explained what I expect in previous
>> discussion and I am confused to hear "this cannot be done".
> 
> I agree it can be done, but the binding is done with less lines the 
> current way.
> 
> I would need to add more lines than just for creating the node structure 
> since dsa.yaml is not referred.
> 
> Then, I would have to create the node structure again for the dsa-port 
> checks.

I understand you can create binding more concise, but not necessarily
more readable. The easiest to grasp is to define all the nodes in
top-level and customize them in allOf:if:then. This was actually also
needed for earlier dtschema with additionalProperties:false. You keep
defining properties in allOf:if:then, even though they are all
applicable to all variants. That's unusual and even if it reduces the
lines does not make it easier to grasp.


Best regards,
Krzysztof

