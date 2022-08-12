Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F2DC00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Aug 2022 13:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C60Y/Psn2DfbYSl6cZKqaTCQ7Sgqzh8lKtssMlfhgdo=; b=Rxz9I0MwDn5/TOUqezQeZXmbbK
	vwY3ojjvpyxMaZDq0xO3wGua/22Mts0sg3zVUqZ8cE263X8Qaved0yqNf1sM8/bAgnMUBYbg17Cgc
	3KgnQtcPsaS/f2BNHcoYs6Gb166DCwM5ATHYQfIlOwBEmMxTQHhg6mDVUcrlg9096FpKfmgopZKbc
	dewKTcYywPEEAdY2sl3dqzvqApe6Y3DHDQ00s2CJ1TIW/Cj+d5vRr/ysYnl6VobTPL/7wCF2PhkuA
	I+UGjdU5SbRuAtdJpOwYtqugWeEX76lAdmkn+RRuwhZV8Tvq0dUzireU3meJ3uOZYfoXajFhH4BXC
	PL7djQnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMV2H-008Gz7-W9; Fri, 12 Aug 2022 13:49:14 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMV21-008GoI-Oq
	for linux-mediatek@lists.infradead.org; Fri, 12 Aug 2022 13:49:04 +0000
Received: by mail-lf1-x12e.google.com with SMTP id w5so1432433lfq.5
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Aug 2022 06:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=C60Y/Psn2DfbYSl6cZKqaTCQ7Sgqzh8lKtssMlfhgdo=;
        b=pWbMOWv12SncgQnIuIVOZIuOGhZs9m4NIgAH4gt6ZLQlOYjrJkkrpfmGlGCsIisBzI
         x/v8DlJwMigklZslZraUmAV3o3EudTu6miObF37SapiaOyQ7qROqopSG36e739kWIR7w
         JJD6EAb9D0Wzj4lYQx6qyLJVCE8AOvJfpDEYCmPZeUn+tmgP3zoa9TCJ3qI4TQidCQzh
         A3WWOzYXKKX64DYzpcg9y635CEsUDPsNh/89xvbckuKi0dbRGta8wpqRK3MSOwQcj2ka
         jioKGTP+gwvfVng2HwS+LbU1WM/BicwUT0gtxiXvDGzrnx51rOIp5qDvT7EuLpFj65Eq
         45Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=C60Y/Psn2DfbYSl6cZKqaTCQ7Sgqzh8lKtssMlfhgdo=;
        b=Uges/CeA5lgivq+a2C4cMtp25NeE7+uPbQA+h8eaA/WlNdMSGw/TS4fbqA8/aT6NPD
         PxBAPYLqQwhy03csoCl4tGmxGRJEqvV3fWFAF1HJrK1Iaq/01h3vsu4ElSBt2JNlFRnA
         GTaPeiwL+mCxZsE2IIfwj+co7luKv3OFv1kls9LuRNBy05EED6b4yLT3CG/2YS9WzSu4
         xs5EW+oo3p3+y/xdDC2qqFH4IXsBPtkyfXBaN+HM6hHZi8bYpg77WZCsVxmaIHiQzxcz
         H/eFcyOqeZs81qnl5GVU1rCTTqK/ijm3HyhkbeXwZIngBV+GijwrcrnQL0m/TUFBeDHk
         wJvQ==
X-Gm-Message-State: ACgBeo04YeP6jTH1zigslucwzReb5/nT8UBcnqt3t960hnqCzQJTZyHC
	2v0dfNdgM1MgWB+hHBsGvQZ5eA==
X-Google-Smtp-Source: AA6agR64G+c5wbFPsOJpNw8i8kydU4HW7gKVfY0L7wZs/5J9GKNtG7Gd/wPYjnf5eFU18oI1+UgbUQ==
X-Received: by 2002:a05:6512:1155:b0:48a:fb9a:32d8 with SMTP id m21-20020a056512115500b0048afb9a32d8mr1340962lfg.672.1660312133710;
        Fri, 12 Aug 2022 06:48:53 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id b19-20020ac24113000000b0048b03d1ca4asm221323lfi.161.2022.08.12.06.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 06:48:53 -0700 (PDT)
Message-ID: <3731cd56-f7e8-6807-06b5-b8b176b078b6@linaro.org>
Date: Fri, 12 Aug 2022 16:48:43 +0300
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <70e246af-c336-0896-95b5-9e42a17a239d@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_064857_856410_68CC1803 
X-CRM114-Status: GOOD (  14.96  )
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

On 12/08/2022 16:41, Arınç ÜNAL wrote:
> On 12.08.2022 10:01, Krzysztof Kozlowski wrote:
>> On 12/08/2022 09:57, Krzysztof Kozlowski wrote:
>>> On 12/08/2022 01:09, Arınç ÜNAL wrote:
>>>>>> -patternProperties:
>>>>>> -  "^(ethernet-)?ports$":
>>>>>> -    type: object
>>>>>
>>>>> Actually four patches...
>>>>>
>>>>> I don't find this change explained in commit msg. What is more, it looks
>>>>> incorrect. All properties and patternProperties should be explained in
>>>>> top-level part.
>>>>>
>>>>> Defining such properties (with big piece of YAML) in each if:then: is no
>>>>> readable.
>>>>
>>>> I can't figure out another way. I need to require certain properties for
>>>> a compatible string AND certain enum/const for certain properties which
>>>> are inside patternProperties for "^(ethernet-)?port@[0-9]+$" by reading
>>>> the compatible string.
>>>
>>> requiring properties is not equal to defining them and nothing stops you
>>> from defining all properties top-level and requiring them in
>>> allOf:if:then:patternProperties.
>>>
>>>
>>>> If I put allOf:if:then under patternProperties, I can't do the latter.
>>>
>>> You can.
> 
> Am I supposed to do something like this:
> 
> patternProperties:
>    "^(ethernet-)?ports$":
>      type: object
> 
>      patternProperties:
>        "^(ethernet-)?port@[0-9]+$":
>          type: object
>          description: Ethernet switch ports
> 
>          unevaluatedProperties: false
> 
>          properties:
>            reg:
>              description:
>                Port address described must be 5 or 6 for CPU port and
>                from 0 to 5 for user ports.
> 
>          allOf:
>            - $ref: dsa-port.yaml#
>            - if:
>                properties:
>                  label:
>                    items:
>                      - const: cpu
>              then:
>                allOf:
>                  - if:
>                      properties:

Not really, this is absolutely unreadable.

Usually the way it is handled is:

patternProperties:
   "^(ethernet-)?ports$":
     type: object

     patternProperties:
       "^(ethernet-)?port@[0-9]+$":
         type: object
         description: Ethernet switch ports
         unevaluatedProperties: false
         ... regular stuff follows

allOf:
 - if:
     properties:
       compatible:
         .....
   then:
     patternProperties:
       "^(ethernet-)?ports$":
         patternProperties:
           "^(ethernet-)?port@[0-9]+$":
             properties:
               reg:
                 const: 5


I admit that it is still difficult to parse, which could justify
splitting to separate schema. Anyway the point of my comment was to
define all properties in top level, not in allOf.

allOf should be used to constrain these properties.

Best regards,
Krzysztof

