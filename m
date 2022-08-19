Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714F8C32771
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 12:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vu2lHdZxEJpxevVE8eil1qxgFt43nikAxZVf13/nJys=; b=c4m9nsLf27IwUGeLUt+u55wx5f
	kiOIjtImNkdBdkDuwxWeqa2zmiMJD1mFE0AdkARQ1bPGrkYVSdvwcIw6kTmyXABACc/mxCm6+ZK+W
	GewjV/z2bbd5kdKkzz9T0/P2D0p7ZkIJXiMP0HdSibav6Gj1FX0SNyq+gS5Phl5IgwTXgjkp4NJx5
	gBmckDyxp8xYgxuQe1IFWBuS391X5MZG28wnXEMExoDHQdX/twcyyihw+y9HISYK7B37siaCPAg5w
	y+5V4DmnhtE5tb187PN1QNdMyFnf5tJqAcnbZCPxdzlfVl8vOes887I2e4F6RWFQuNgyeEm+r/PQl
	InyE9HRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1J8-00877f-NM; Fri, 19 Aug 2022 12:41:02 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1J5-0086sm-83
	for linux-mediatek@lists.infradead.org; Fri, 19 Aug 2022 12:41:00 +0000
Received: by mail-lf1-x132.google.com with SMTP id e15so6017654lfs.0
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Aug 2022 05:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=vu2lHdZxEJpxevVE8eil1qxgFt43nikAxZVf13/nJys=;
        b=VDbRbwgBCqlvGplcG49N2W2pqBty1ZXmsqM9ti5lVULn8qCrNwpzo4W4gHp2usxMya
         oAsYzH5Vhwu7qq0lKCQdIujO24m/7EVtTOkK365b3AQtl3fYUBSvV75onErnYW1XMzNm
         U6KpBKZInfm1Hd8R4FTmo1Vq4lZuzkz5UTcjOAXN6xx6tVneuRGeBLIBEnuzRSKA3YXz
         Z3wOBk7yoLLZWrC8AvjYuBN8Cv6W9D9TpCakQwJKdoUlkqsPJJrKxKdmMYZ4IYJLwZeX
         r91KoUsH5bsl1e6OkR3y+iG7hnX5yUehzk4JBygP6g6p6yHVzxmIS3O6B1HmJWupv4H8
         tZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=vu2lHdZxEJpxevVE8eil1qxgFt43nikAxZVf13/nJys=;
        b=WIBd5dn9ZlzdBjajB+7dOqmL9HmURyEZB+aFNdEwdlwHYKbRBtRL5tz+9MYu76u7o8
         ZLiyjuEZUCdYdBSzW14YUlPoR9LEJ73A66UK20b63U0bf0wNgzBFlaJtNBLosu9WZFU9
         uLunktBQLsT+fEg3i1eIwqNIAG0IPXrMpYnFO5vS6IE4lKSRcPONnCJeFE/ocRMukwfH
         u1zWLBBVBXYCJZvj/5XnKSqHGflRfmLDC+LiD/1Dm/ZUfNGiW92BIMc8YCabcgSHcWFP
         mkj9X7bQioZH+HOPKHsRU4pB0nFI/VzBi9dNEvEz5BlHmcSj58fKTDp2eHxz5kMWbZKc
         znNw==
X-Gm-Message-State: ACgBeo0CDuIowUGVB93An0Wv1Gv7jjV3bEoZYl7fM9C0RZ3SZZc+jWZR
	g1I6BBU6SBjt+QVTbjJ3XplDzg==
X-Google-Smtp-Source: AA6agR4J0Ea6eFpB2FAYhtL/1C6G9QtgQ0s9SRqW88AqI0njZbR8KWIKtwNgd6F0NHKqPvcSU9d+Dw==
X-Received: by 2002:a05:6512:1091:b0:491:f135:4633 with SMTP id j17-20020a056512109100b00491f1354633mr2651400lfg.553.1660912857246;
        Fri, 19 Aug 2022 05:40:57 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id d4-20020ac25444000000b0048ad4c718f3sm628432lfn.30.2022.08.19.05.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 05:40:56 -0700 (PDT)
Message-ID: <cb605db2-62f2-b585-1978-ef0d675bcfb3@linaro.org>
Date: Fri, 19 Aug 2022 15:40:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/4] dt-bindings: net: dsa: mediatek,mt7530: update
 json-schema
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
References: <20220730142627.29028-1-arinc.unal@arinc9.com>
 <20220730142627.29028-5-arinc.unal@arinc9.com>
 <e5cf8a19-637c-95cf-1527-11980c73f6c0@linaro.org>
 <bb60608a-7902-99fa-72aa-5765adabd300@arinc9.com>
 <8a665b7a-bbd0-99ce-658e-bc78568bdca2@linaro.org>
 <40130c63-1e36-bb43-43b4-444a8f287226@linaro.org>
 <70e246af-c336-0896-95b5-9e42a17a239d@arinc9.com>
 <3731cd56-f7e8-6807-06b5-b8b176b078b6@linaro.org>
 <24e251d7-f5db-5715-463d-333f5dfbfceb@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <24e251d7-f5db-5715-463d-333f5dfbfceb@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_054059_383608_45291B54 
X-CRM114-Status: GOOD (  22.23  )
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

On 12/08/2022 17:06, Arınç ÜNAL wrote:
> 
> 
> On 12.08.2022 16:48, Krzysztof Kozlowski wrote:
>> On 12/08/2022 16:41, Arınç ÜNAL wrote:
>>> On 12.08.2022 10:01, Krzysztof Kozlowski wrote:
>>>> On 12/08/2022 09:57, Krzysztof Kozlowski wrote:
>>>>> On 12/08/2022 01:09, Arınç ÜNAL wrote:
>>>>>>>> -patternProperties:
>>>>>>>> -  "^(ethernet-)?ports$":
>>>>>>>> -    type: object
>>>>>>>
>>>>>>> Actually four patches...
>>>>>>>
>>>>>>> I don't find this change explained in commit msg. What is more, it looks
>>>>>>> incorrect. All properties and patternProperties should be explained in
>>>>>>> top-level part.
>>>>>>>
>>>>>>> Defining such properties (with big piece of YAML) in each if:then: is no
>>>>>>> readable.
>>>>>>
>>>>>> I can't figure out another way. I need to require certain properties for
>>>>>> a compatible string AND certain enum/const for certain properties which
>>>>>> are inside patternProperties for "^(ethernet-)?port@[0-9]+$" by reading
>>>>>> the compatible string.
>>>>>
>>>>> requiring properties is not equal to defining them and nothing stops you
>>>>> from defining all properties top-level and requiring them in
>>>>> allOf:if:then:patternProperties.
>>>>>
>>>>>
>>>>>> If I put allOf:if:then under patternProperties, I can't do the latter.
>>>>>
>>>>> You can.
>>>
>>> Am I supposed to do something like this:
>>>
>>> patternProperties:
>>>     "^(ethernet-)?ports$":
>>>       type: object
>>>
>>>       patternProperties:
>>>         "^(ethernet-)?port@[0-9]+$":
>>>           type: object
>>>           description: Ethernet switch ports
>>>
>>>           unevaluatedProperties: false
>>>
>>>           properties:
>>>             reg:
>>>               description:
>>>                 Port address described must be 5 or 6 for CPU port and
>>>                 from 0 to 5 for user ports.
>>>
>>>           allOf:
>>>             - $ref: dsa-port.yaml#
>>>             - if:
>>>                 properties:
>>>                   label:
>>>                     items:
>>>                       - const: cpu
>>>               then:
>>>                 allOf:
>>>                   - if:
>>>                       properties:
>>
>> Not really, this is absolutely unreadable.
>>
>> Usually the way it is handled is:
>>
>> patternProperties:
>>     "^(ethernet-)?ports$":
>>       type: object
>>
>>       patternProperties:
>>         "^(ethernet-)?port@[0-9]+$":
>>           type: object
>>           description: Ethernet switch ports
>>           unevaluatedProperties: false
>>           ... regular stuff follows
>>
>> allOf:
>>   - if:
>>       properties:
>>         compatible:
>>           .....
>>     then:
>>       patternProperties:
>>         "^(ethernet-)?ports$":
>>           patternProperties:
>>             "^(ethernet-)?port@[0-9]+$":
>>               properties:
>>                 reg:
>>                   const: 5
>>
>>
>> I admit that it is still difficult to parse, which could justify
>> splitting to separate schema. Anyway the point of my comment was to
>> define all properties in top level, not in allOf.
>>
>> allOf should be used to constrain these properties.
> 
> The problem is:
> - only specific values of reg are allowed if label is cpu.
> - only specific values of phy-mode are allowed if reg is 5 or 6.
> 
> This forces me to define properties under allOf:if:then. 

None of the reasons above force you to define properties in some
allOf:if:then subblock. These force you to constrain the properties in
allOf:if:then, but not define.

> Splitting to 
> separate schema (per compatible string?) wouldn't help in this case.

True.

> 
> I can split patternProperties to two sections, but I can't directly 
> define the reg property like you put above.

Of course you can and original bindings were doing it.

Let me ask specific questions (yes, no):
1. Are ethernet-ports and ethernet-port present in each variant?

2. Is dsa-port.yaml applicable to each variant? (looks like that - three
compatibles, three all:if:then)
3. If reg appearing in each variant?
4. If above is true, if reg is maximum one item in each variant?

Looking at your patch, I think answer is 4x yes, which means you can
define them in one place and constrain in allOf:if:then, just like all
other schemas, because this one is not different.

Best regards,
Krzysztof

