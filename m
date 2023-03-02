Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62CDC6FA8E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 09:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=quQsZmkiKaETnYTMJly9CAnrwXfTyfISOr41GqRBHEQ=; b=wvkg6AkPrTwszD
	ymBOmZciwcfTI4e1cRhTthSRXIs34A6bpiGGiCXN1gcZMsvo2wkkacZMruA6ED2S3eOcEyarSbACC
	QuhhVIYghLP2ZDI7S7e4VnAfWiDeXtg6CU9jlCCP6eeXm7nmQn0113lv54Ygn5DDIG4l9vNMiQIt4
	mmu2C5zb4v2DBAQHa6IZdAxiVwCMAp67BC10/nSDP0oxz9n07Cp9HgNBfsrfJC8Gf4q4gvzcJB9Xm
	wBWLNgwKmFCzOGxBR0xZGRQg47t9VfvXo0EuPuUMb/i9naID3UP5sUy+BwLTdMgAo5n/MU2MHZDKD
	WKcYFEPVBNdMoNrUz+rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfhV-001Z7A-Ri; Thu, 02 Mar 2023 09:58:13 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfhS-001Z4t-QS
	for linux-mediatek@lists.infradead.org; Thu, 02 Mar 2023 09:58:12 +0000
Received: by mail-ed1-x52d.google.com with SMTP id g3so9811878eda.1
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Mar 2023 01:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677751089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=quQsZmkiKaETnYTMJly9CAnrwXfTyfISOr41GqRBHEQ=;
        b=EquMUUnvVYKbhMQ8FO3/GqZAqUdsqFcAHF2Od/g2fwxJrzGIcnUXUguaQjkE210wYQ
         JTRHE/CL4DRh63ooBFLsL4VF3wxWvUT2m2/AbAOlbgWRaBbUau0Gfwfta6TaVjWcQckD
         +acdhoOnX9sSQoVs3a2vipKxW2kFD4EEEmM0TG3FW8Wnx1pffFUMV5DzL4SubvC5cI1R
         LmxzySDELNeUx0jsrq+zGmqaCezKsWOSuitbBU784p6DqpfC7vjLGOqtms8+3eQjFhkX
         6bs+8ygvoNXRPdnxBiJVyENjZ/1RoiwlFPvpMxy3kHLRiXdpjjZdjk6APmc7MBY51oir
         eImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677751089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=quQsZmkiKaETnYTMJly9CAnrwXfTyfISOr41GqRBHEQ=;
        b=8P3zb3R6PiVpbNKUORjG4pUDIXawc8yc0kCZjgvKkWbCzdnO5/Ws82CeAaZ3pIgq+d
         JW8st6o1GEgmd0B49/qFjtRTWJd+VbaCWrZniAJGV4yqjWV4qRcPuR++ZLcBrmMbMQ4w
         em15AYhUnCRvixJZZCBDCbdeFzag3gA4H87hIOTUL3VLdtBJnona4Nnf8JUOCo5gaHUX
         bx7DNTZMXLJ+U70rbC/hiMXfMw+hVfC6brJJxcACFNkSASXsIpLczPw0K/1lMZVzPoAh
         W+ZaCot5FDVFyDrRYaEQY/iaoxouoMd8/yQvjdN/0ayHcQyOWmp4UrI2IGGZC31rEWUD
         VsgA==
X-Gm-Message-State: AO0yUKVK5bqJsS+HJyWcEUaBfGgIQLdo6f9dJgaHwbJ1V89OH9PQRb5N
	TC+rvCE7Wc7tOxDnfOuQ7m+gUA==
X-Google-Smtp-Source: AK7set9OnArQH/PxHu599zgwQafDCjw20cNu6UwnMirkt5rBsGrvK3lhjvbsD0K6SyI6ANwQJ1e26g==
X-Received: by 2002:a17:906:1907:b0:8b1:304e:58a3 with SMTP id a7-20020a170906190700b008b1304e58a3mr9990669eje.52.1677751089159;
        Thu, 02 Mar 2023 01:58:09 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h12-20020a170906530c00b008d71e08c78dsm6852623ejo.81.2023.03.02.01.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 01:58:08 -0800 (PST)
Message-ID: <1aae7ac9-c83d-71b4-4fce-325f02fcd722@linaro.org>
Date: Thu, 2 Mar 2023 10:58:06 +0100
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
 <11d3c806-04b6-da54-65f1-c0bd154affbc@linaro.org>
 <a9acd3b4-2b03-86c0-711c-a3840aeab574@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a9acd3b4-2b03-86c0-711c-a3840aeab574@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_015810_915858_ECFED687 
X-CRM114-Status: GOOD (  27.24  )
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

On 02/03/2023 10:17, Arınç ÜNAL wrote:
> On 2.03.2023 11:28, Krzysztof Kozlowski wrote:
>> On 01/03/2023 09:15, Arınç ÜNAL wrote:
>>> On 1.03.2023 05:44, Rob Herring wrote:
>>>> On Tue, Feb 28, 2023 at 07:46:36PM +0300, Arınç ÜNAL wrote:
>>>>> On 27/02/2023 20:33, Rob Herring wrote:
>>>>>> On Wed, Feb 22, 2023 at 09:39:23PM +0300, arinc9.unal@gmail.com wrote:
>>>>>>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>>>>>
>>>>>>> Add the ralink,rt2880-pinmux compatible string. It had been removed from
>>>>>>> the driver which broke the ABI.
>>>>>>>
>>>>>>> Add the mediatek compatible strings. Change the compatible string on the
>>>>>>> examples with the mediatek compatible strings.
>>>>>>>
>>>>>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>>>>> ---
>>>>>>>     .../devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml | 7 +++++--
>>>>>>>     .../devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml | 7 +++++--
>>>>>>>     .../devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml | 7 +++++--
>>>>>>>     .../devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml | 7 +++++--
>>>>>>>     .../devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml | 7 +++++--
>>>>>>>     5 files changed, 25 insertions(+), 10 deletions(-)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
>>>>>>> index 1e63ea34146a..531b5f616c3d 100644
>>>>>>> --- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
>>>>>>> @@ -17,7 +17,10 @@ description:
>>>>>>>     properties:
>>>>>>>       compatible:
>>>>>>> -    const: ralink,mt7620-pinctrl
>>>>>>> +    enum:
>>>>>>> +      - mediatek,mt7620-pinctrl
>>>>>>> +      - ralink,mt7620-pinctrl
>>>>>>
>>>>>> We don't update compatible strings based on acquistions nor marketing
>>>>>> whims. If you want to use 'mediatek' for new things, then fine.
>>>>>
>>>>> Understood. Only the SoCs with rtXXXX were rebranded, the mtXXXX SoCs share
>>>>> the same architecture from Ralink, so they were incorrectly called Ralink
>>>>> SoCs.
>>>>>
>>>>> I can remove the new strings from Ralink SoCs and add them only for MediaTek
>>>>> SoCs. Or you could make an exception for this one, regarding the situation.
>>>>> Whatever you think is best.
>>>>
>>>> I'm not in a position to make an exception as I know little about this
>>>> platform. Carrying both strings is a NAK. Either you (and everyone using
>>>> these platforms) care about the ABI and are stuck with the "wrong"
>>>> string. In the end, they are just unique identifiers. Or you don't care
>>>> and break the ABI and rename everything. If you do that, do just that in
>>>> your patches and make it crystal clear in the commit msg that is your
>>>> intention and why that is okay.
>>>
>>> Ralink had their MIPS SoCs pre-acquisition, RT2880, etc. MediaTek
>>> introduced new SoCs post-acquisition, MT7620, MT7621, MT7628, and
>>> MT7688, utilising the same platform from Ralink, sharing the same
>>> architecture code, pinctrl core driver, etc.
>>>
>>> I don't intend to break the ABI at all. On the contrary, I fix it where
>>> possible.
>>>
>>> If I understand correctly, from this conversation and what Krzysztof
>>> said, all strings must be kept on the schemas so I can do what I said on
>>> the composed mail. Only match the pin muxing information on the strings
>>> that won't match multiple pin muxing information from other schemas.
>>>
>>> This way we don't break the ABI, introduce new compatible strings while
>>> keeping the remaining ones, and make schemas match correctly.
>>>
>>> Let me know if this is acceptable to you.
>>
>> If by "introduce new compatible strings" you mean duplicate compatibles
>> to fix the ralink->mediatek, then you ignored entire email from Rob -
>> this and previous. We don't do this. Leave them as is.
>>
>> If you meant something else, explain more...
> 
> Let me put them in a group to better explain.
> 
> ## Fix ABI
> 
> ralink,rt2880-pinmux was there before, it was removed which broke the 
> ABI. I'm reintroducing it to fix it.
> 
> ## New strings to be able to split bindings
> 
> New strings are needed for MT7628/MT7688 and some RT SoCs to be able to 
> properly document the pin muxing information.

Then ok.

> 
> ## Incorrect naming
> 
> MT7620, MT7621, MT7628, and MT7688 SoCs are incorrectly called Ralink, 
> introduce new ralink->mediatek compatible strings to address it.

So this part was addressed by Rob - we don't do it, because it does not
matter. Ralink is now Mediatek, thus there is no conflict and no issues
with different vendor used.

> 
> ## Exception for RT SoCs to be called MediaTek
> 
> This is where I was asking an exception to be made. Rob told us here 
> they know little about the platform so I explained it.
> 
> MediaTek acquired Ralink and then introduced new MediaTek SoCs utilising 
> the same platform from Ralink.
> 
> Anyway, now that I look at this again, it makes sense to me as well not 
> to rename the Ralink SoCs. I'll call the RT SoCs Ralink on the kconfig, 
> pinctrl driver,

These are separate. We did not comment on how you call Linux drivers.
The mail thread was only about:

> and dt-binding schemas on my next version.

Best regards,
Krzysztof


