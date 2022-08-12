Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DADC00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Aug 2022 06:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrfRi2+lHDlBxwVVMHzDrJHx7Q3p2G+5d8uDewrRAEw=; b=fg9u8AGnMLhP3+FABaRL46eYzP
	5JZ71XCVp/5M8YgDGjneQjgzyMD3qiYQ0eivb4lgrQfVlgC7ztDPOpMG4kd40isp9q3sbvBsQYh+P
	PThmylJafn+0adBximzJCtjthP34gjZscd/pCCbAa5e6zhEOS1dCmcH4Xx6/5XQDKxpNA9xICa6Tr
	vcP8QrnofTxNIuAvlwML8pHvof9m2l+AJWwATvnsZwzDCuLcpF51gLHFBCTAex2AwBFWHpWUfryvl
	oO5gcFKnc1Tg9W1oUOLVCbdcxz8j83Tt2GUtp4ZIVC4SjripyYSQUWD4e9CUHDRy/2ZlNhlVcZeec
	Rdrk+lFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMObv-000Han-IC; Fri, 12 Aug 2022 06:57:35 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMObk-000GKa-7W
	for linux-mediatek@lists.infradead.org; Fri, 12 Aug 2022 06:57:25 +0000
Received: by mail-lf1-x12d.google.com with SMTP id v2so147704lfi.6
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Aug 2022 23:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=FrfRi2+lHDlBxwVVMHzDrJHx7Q3p2G+5d8uDewrRAEw=;
        b=sv21mxYeoodQClvyUh7rxGuN1p6MH+kcL/yXUdot4DG3rVyYkWJmX2BjDNru9Y7F8C
         uGX7LfFwRVLlzPO9kL6GayHvRTvYULX2sNmDJvSKpKQ6mW2Cl0xC8qvBoWP3sAIfMTEH
         RDWbpGlytbQaMqhsE/QjhqKAK/lf5SJCWcy+m+qjEa/lr1j9HnyXS7mEseGk0Nn5YMLK
         /F6kfzhoAsF6mdjN1x5Zzxs6Q8YlQs0QQyC38mwJXEAg7O2liFQJWO/tLPLMM4NSHONP
         OfsTvhfZhqAIGu0vJUm/wj3ZNinVfv3y166ukJl5qN+A0acnLYI9soA+02cR8Yu8NFBS
         WxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=FrfRi2+lHDlBxwVVMHzDrJHx7Q3p2G+5d8uDewrRAEw=;
        b=UaPbBN4rdrhn3keVqcUnLPR7NdbyhH7RZgOFuQctsMKhJwmAn54ndS85SnOv06j7bA
         vsPmMwloTmNryBVH5Wr7Eif7C2kAmQTsh/F8XRP72SGQUGucJGbolu7wEvasdCaUW7vj
         VbEeooXQWk5GX6kY6ABaelj0gc1OB06TKu6CGRTwlTiFAu45KQKoIR45JqmUB9l+S5aV
         6LSuJrGRUu0zKNn5PfMHAMb5YcrQ22zuWOCEyPaZGH9NP8lcT05sGNBnQD01tINtA5BX
         fnhJU8TcNuJ8wcANt0ne2VQnzXAGzvnsh8RRa8tUYNfl6GzE9aoGWBIq9i1C3uweZRuF
         5Jgg==
X-Gm-Message-State: ACgBeo2EkiGubWoD6JFHQmDyQ58eZIJ4Kqhp6JCvWS1QtKAoav3Fa3+N
	D1zL1kgp71jKbtDtK0LI9etEcw==
X-Google-Smtp-Source: AA6agR7M20SFyNF/dOFK27C0pl8a1ofriwmlGVRzgSCjE4kMy8Af4Pq+4LTBh+RSlfRCn9zUfdDZfg==
X-Received: by 2002:a19:740c:0:b0:48b:374:987a with SMTP id v12-20020a19740c000000b0048b0374987amr874185lfe.690.1660287440281;
        Thu, 11 Aug 2022 23:57:20 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id o17-20020ac25e31000000b0048ceb3836d4sm114182lfg.6.2022.08.11.23.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 23:57:19 -0700 (PDT)
Message-ID: <8a665b7a-bbd0-99ce-658e-bc78568bdca2@linaro.org>
Date: Fri, 12 Aug 2022 09:57:14 +0300
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <bb60608a-7902-99fa-72aa-5765adabd300@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_235724_279484_06579078 
X-CRM114-Status: GOOD (  14.29  )
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

On 12/08/2022 01:09, Arınç ÜNAL wrote:
>>> -patternProperties:
>>> -  "^(ethernet-)?ports$":
>>> -    type: object
>>
>> Actually four patches...
>>
>> I don't find this change explained in commit msg. What is more, it looks
>> incorrect. All properties and patternProperties should be explained in
>> top-level part.
>>
>> Defining such properties (with big piece of YAML) in each if:then: is no
>> readable.
> 
> I can't figure out another way. I need to require certain properties for 
> a compatible string AND certain enum/const for certain properties which 
> are inside patternProperties for "^(ethernet-)?port@[0-9]+$" by reading 
> the compatible string.

requiring properties is not equal to defining them and nothing stops you
from defining all properties top-level and requiring them in
allOf:if:then:patternProperties.


> If I put allOf:if:then under patternProperties, I can't do the latter.

You can.

> 
> Other than readability to human eyes, binding check works as intended, 
> in case there's no other way to do it.

I don't see the problem in doing it and readability is one of main
factors of code admission to Linux kernel.

Best regards,
Krzysztof

