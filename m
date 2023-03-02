Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA49C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 08:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=binSKFTDATr+VUKohUw2T7hk+6PX9qDP2BHHB8PRuJo=; b=rInXKa1Nv33vN5
	mIP96ch6HuMrUKjelzJtbd7XuHJUUUAzskM6PojMpDRCfgfxa2om2+clNz0IsmNMsnZcB0+jO/Ft5
	zkp21NhMJrMUwBOhl96vuIrMTxJXVVoA/PcPP8F5+/BYwDvTtCgYIqp+dOBExiAiVqF3a83GcA58S
	jGeyl18ZSS7jenJGYJcH+iPEN5vwwz5J6174g4+IIqN/dLk88nDzG7FnxX83KOxe72ww0Hw3xtEu0
	E4pEJYSKjNZJFMRL03kKSyeqpKvuKvh+bE4/FG4xFfr4yy3JI1CzhKzHMZ5qFBpc/uIWq7MDS4fKW
	OljH3bkqKuHLIZj0N1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXeIh-001HA3-DW; Thu, 02 Mar 2023 08:28:31 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXeId-001H9Z-EK
	for linux-mediatek@lists.infradead.org; Thu, 02 Mar 2023 08:28:29 +0000
Received: by mail-ed1-x536.google.com with SMTP id g3so8934102eda.1
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Mar 2023 00:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677745705;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=binSKFTDATr+VUKohUw2T7hk+6PX9qDP2BHHB8PRuJo=;
        b=vaprO//rVPPS8AInkhN+nrEBCuqfVNws7vQ3mUHSuQNCEu7Z5a6GAO20G65gqlEPQS
         SwHqRqdItcbIe1gf5fQp9roEpYdWODBt+x0pK1is7wEacjcCrNLNRSWTBaGrzIP5DBWP
         Oito52Yw1fswhUyFRRJIzKctJhREeDaeVr8cGD8ujTExK+iph6kMDNn3DfzQNEiNnhw4
         NeDDxG4T2IkVTpnUrLyA3N+1VMtbd9aBKWix41DWNEcBspelgdcYVaUgsrsqAbXcNW6o
         Xh6VbTiBWVccDtsn4z6cgxc/ojsCItsRlJdrmsQAQb2rMHSgzdKNyJ6dHUoWzslot+Aw
         vupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677745705;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=binSKFTDATr+VUKohUw2T7hk+6PX9qDP2BHHB8PRuJo=;
        b=w795VYf+k8p3tLtQp0mAaEGxhoQVAy+Wr++E1BQ7Li9qPxhjeL68LA7Q2dXpPwJ1iK
         glHt2K37hMVE3gv9pd5WTS3KmZHftA83mPlaGIDfblEJ3UJSJa1G+TSnaGWcHadU8thJ
         QD5TOtjC/4FduBUTSe1THGWfGFm9pRFszw9os+1G6TE72de4ljdZ4GyWbb6LzlxVhjPv
         jmuMsJu58PRQEuIwJ57CCKVHQ4LbMBPBXZTgBozsNDbhKnP+b9KZ5BJgR0S31gQffJQ/
         u8EDP52ksXJuUCMT+bNtZ9MWkk7Qfm0sN2OXhb+A/2wH3NBR7ag1kqnH8ZzGYasRylTE
         3t5A==
X-Gm-Message-State: AO0yUKW1GbOMjJhQmc2lUhDOEMMdPVIkcQzvYanKkR1IHpP0hQkGbXnx
	E4yDIi9CeQqXfeK8GABdJ+HBBA==
X-Google-Smtp-Source: AK7set+sya+UufcyMJpds/o5eIN1syxY+wLyLZB9BFt9OhvL1PkZ9IK+iHqBR/gdWrOSJTSc4p7EVQ==
X-Received: by 2002:aa7:d856:0:b0:4af:6e95:861b with SMTP id f22-20020aa7d856000000b004af6e95861bmr1487899eds.2.1677745703475;
        Thu, 02 Mar 2023 00:28:23 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q21-20020a50cc95000000b004c0c5864cc5sm214800edi.25.2023.03.02.00.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 00:28:23 -0800 (PST)
Message-ID: <11d3c806-04b6-da54-65f1-c0bd154affbc@linaro.org>
Date: Thu, 2 Mar 2023 09:28:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 07/16] dt-bindings: pinctrl: ralink: add new
 compatible strings
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Rob Herring <robh@kernel.org>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
 <20230222183932.33267-8-arinc.unal@arinc9.com>
 <20230227173333.GA496999-robh@kernel.org>
 <d7aea90f-d077-3a41-996c-804c95d72e24@arinc9.com>
 <20230301024431.GA251215-robh@kernel.org>
 <ae3346de-140f-f181-b6a3-ccaa694e1548@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ae3346de-140f-f181-b6a3-ccaa694e1548@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_002827_529547_643AA73F 
X-CRM114-Status: GOOD (  22.79  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-gpio@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 01/03/2023 09:15, Arınç ÜNAL wrote:
> On 1.03.2023 05:44, Rob Herring wrote:
>> On Tue, Feb 28, 2023 at 07:46:36PM +0300, Arınç ÜNAL wrote:
>>> On 27/02/2023 20:33, Rob Herring wrote:
>>>> On Wed, Feb 22, 2023 at 09:39:23PM +0300, arinc9.unal@gmail.com wrote:
>>>>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>>>
>>>>> Add the ralink,rt2880-pinmux compatible string. It had been removed from
>>>>> the driver which broke the ABI.
>>>>>
>>>>> Add the mediatek compatible strings. Change the compatible string on the
>>>>> examples with the mediatek compatible strings.
>>>>>
>>>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>>> ---
>>>>>    .../devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml | 7 +++++--
>>>>>    .../devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml | 7 +++++--
>>>>>    .../devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml | 7 +++++--
>>>>>    .../devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml | 7 +++++--
>>>>>    .../devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml | 7 +++++--
>>>>>    5 files changed, 25 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
>>>>> index 1e63ea34146a..531b5f616c3d 100644
>>>>> --- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
>>>>> +++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
>>>>> @@ -17,7 +17,10 @@ description:
>>>>>    properties:
>>>>>      compatible:
>>>>> -    const: ralink,mt7620-pinctrl
>>>>> +    enum:
>>>>> +      - mediatek,mt7620-pinctrl
>>>>> +      - ralink,mt7620-pinctrl
>>>>
>>>> We don't update compatible strings based on acquistions nor marketing
>>>> whims. If you want to use 'mediatek' for new things, then fine.
>>>
>>> Understood. Only the SoCs with rtXXXX were rebranded, the mtXXXX SoCs share
>>> the same architecture from Ralink, so they were incorrectly called Ralink
>>> SoCs.
>>>
>>> I can remove the new strings from Ralink SoCs and add them only for MediaTek
>>> SoCs. Or you could make an exception for this one, regarding the situation.
>>> Whatever you think is best.
>>
>> I'm not in a position to make an exception as I know little about this
>> platform. Carrying both strings is a NAK. Either you (and everyone using
>> these platforms) care about the ABI and are stuck with the "wrong"
>> string. In the end, they are just unique identifiers. Or you don't care
>> and break the ABI and rename everything. If you do that, do just that in
>> your patches and make it crystal clear in the commit msg that is your
>> intention and why that is okay.
> 
> Ralink had their MIPS SoCs pre-acquisition, RT2880, etc. MediaTek 
> introduced new SoCs post-acquisition, MT7620, MT7621, MT7628, and 
> MT7688, utilising the same platform from Ralink, sharing the same 
> architecture code, pinctrl core driver, etc.
> 
> I don't intend to break the ABI at all. On the contrary, I fix it where 
> possible.
> 
> If I understand correctly, from this conversation and what Krzysztof 
> said, all strings must be kept on the schemas so I can do what I said on 
> the composed mail. Only match the pin muxing information on the strings 
> that won't match multiple pin muxing information from other schemas.
> 
> This way we don't break the ABI, introduce new compatible strings while 
> keeping the remaining ones, and make schemas match correctly.
> 
> Let me know if this is acceptable to you.

If by "introduce new compatible strings" you mean duplicate compatibles
to fix the ralink->mediatek, then you ignored entire email from Rob -
this and previous. We don't do this. Leave them as is.

If you meant something else, explain more...

Best regards,
Krzysztof


