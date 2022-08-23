Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD0DC32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 10:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4iCZIPBqKk4aWYa7eJT+SaYkcQXkWhohlhOpL9YUDVU=; b=bfFc4G2yUD08hz2IfcMQmusFOQ
	mFeFVErpKgX+3hxiMBXZV7QHgp7ag2Y4MEe14PxRdg3DQu6AT4c4y0Pu+ZKVojEdy/aaz4RymCe5V
	GCh03Od6r/aJqwQqntHqJsNQRpOlMoeQG7dtg+6Ql5rpbsKxpF7Kp5MNCg8sZulKH9NDE/gGu0ZaP
	xwHzOv6pdrYYSavSVxcJL9j9kclvonapsY4/IZ76Qb7sbo58FHX+qkcGwBLLcVzF50eyAoyvgwAWv
	tAKSJPSRam4QMnPmnSEMgCxNfBYOLB0lkUZSKidNlh+NCw8mANxrTdszfr4BegLeac4wqyyExXjQN
	NkLdHzpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQRSy-00568y-Pm; Tue, 23 Aug 2022 10:49:04 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQRSa-0055tQ-M9
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 10:48:44 +0000
Received: by mail-lj1-x22e.google.com with SMTP id bn9so5572279ljb.6
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 03:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=4iCZIPBqKk4aWYa7eJT+SaYkcQXkWhohlhOpL9YUDVU=;
        b=E/VbHdOW7s+2eeUSVsRs5XJAI+yAma5X7QmOdeUSyI23lBuncOs23O+KSvjE/CB8/x
         vQ0yLqWOc8zCsUK3qE6LHVCT5n6wWkx1uUoexhfa/Ef7uH8kWkUNTyouNAkO1GsSvs52
         2c5Io2guzADNJZOb5ZLlwLwyjSpbmzXGRT22xT4ArShG24fQJiRcCB7hnBvwROwTKEwA
         O10oUQmtEZqIJJypRhKbT1R6+l93NSoAC3YtGXFDFkP0+HzvK6nbxPTK3kLElZh+fWxL
         0YglQdYiqnYRKbYZP258n9+0y9FxZaOQk/YTqTzUUxofQdoiGFeMqFhZ6bmIPPrgIzYS
         8kIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=4iCZIPBqKk4aWYa7eJT+SaYkcQXkWhohlhOpL9YUDVU=;
        b=mxQqjU7FZ9pm/FTcJFpu9ByqC7U+94cKZFKmUtZJd47vzvS4Q8bpdfotCDkQlz8ZHD
         LNHUiI9ikaLYsTZajyMWcFKxklTGSnLxjkIv9ss3Ca4+xFRm1Dsfij7lTfvAHZNTra/f
         U20syCn6V8Os0aeoVP37FqTSYq7E2hEJl6i9YDyfe7ChIz+7j7J2Cs64DgiCvxg4KKHr
         9vvoZgP4d4Du5Cisd3gr1Vi/k8JtfXUdKmu3xJftMmiaeC29T3K+6R+oR9Cev8IjKd91
         Y8nHOgLOmL5uIdddqKfmvOrvtw4ZD0gvh6BXaVQ+ZBXE6N8EPabMnKW451wXwg8CkU0u
         n0aA==
X-Gm-Message-State: ACgBeo3gPCRsYR35ltZmKDFJcwGweCBlmAnb3bkyoOexx6DnlwgmZBEX
	gM1hwlzNl87J1lmT5tfTsZktNw==
X-Google-Smtp-Source: AA6agR4WBOwY8UcpEmJ1aepVJpP/ZPvtXXCBnO8R0qkAsHVgv+/VM/SWcR0hP2kXefVSXz44zxUwPg==
X-Received: by 2002:a2e:92c8:0:b0:25d:6ddf:e71d with SMTP id k8-20020a2e92c8000000b0025d6ddfe71dmr6570635ljh.170.1661251716963;
        Tue, 23 Aug 2022 03:48:36 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id u7-20020a05651220c700b0048b003c4bf7sm1535952lfr.169.2022.08.23.03.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 03:48:36 -0700 (PDT)
Message-ID: <50eaf3b1-0681-a0a9-b120-4ade4e91e83a@linaro.org>
Date: Tue, 23 Aug 2022 13:48:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 4/7] dt-bindings: net: dsa: mediatek,mt7530: define
 port binding per compatible
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
References: <20220813154415.349091-1-arinc.unal@arinc9.com>
 <20220813154415.349091-5-arinc.unal@arinc9.com>
 <d2279a7d-bbc3-c772-1f30-251f056341bb@linaro.org>
 <0bf02926-753e-e8d5-1d87-f286ed743fb2@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0bf02926-753e-e8d5-1d87-f286ed743fb2@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_034842_788458_70847616 
X-CRM114-Status: GOOD (  16.84  )
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

On 20/08/2022 10:34, Arınç ÜNAL wrote:
> On 19.08.2022 15:43, Krzysztof Kozlowski wrote:
>> On 13/08/2022 18:44, Arınç ÜNAL wrote:
>>> Define DSA port binding under each compatible device as each device
>>> requires different values for certain properties.
>>>
>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>> ---
>>>   .../bindings/net/dsa/mediatek,mt7530.yaml     | 116 +++++++++++++-----
>>>   1 file changed, 87 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> index cc87f48d4d07..ff51a2f6875f 100644
>>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> @@ -130,35 +130,6 @@ properties:
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
>>> -
>>
>> my comments from v1 apply here
>>
>> None of the reasons you said force you to define properties in some
>> allOf:if:then subblock. These force you to constrain the properties in
>> allOf:if:then, but not define.
>>
>>
>>> I can split patternProperties to two sections, but I can't directly
>>> define the reg property like you put above.
>>
>> Of course you can and original bindings were doing it.
>>
>> Let me ask specific questions (yes, no):
>> 1. Are ethernet-ports and ethernet-port present in each variant?
>> 2. Is dsa-port.yaml applicable to each variant? (looks like that - three
>> compatibles, three all:if:then)
>> 3. If reg appearing in each variant?
>> 4. If above is true, if reg is maximum one item in each variant?
> 
> All yes.
> 
>>
>> Looking at your patch, I think answer is 4x yes, which means you can
>> define them in one place and constrain in allOf:if:then, just like all
>> other schemas, because this one is not different.
> 
> If I understand correctly, I do this already with v3. Properties are 
> defined under the constructed node. Accepted values for properties are 
> constrained under if:then.

v4 doesn't do it. You removed there patternProperties - again.


Best regards,
Krzysztof

