Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F78C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 10:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GiacOipE63LiBD/dhyfIsvhZPNpdO/fbia46q+TRNXs=; b=lCzb04UP24FxWx
	uVdf62sGPpvAaZRunqkA6p7rQlmRqtYFnoFoc5dC2RByb4QsRtHNzqEkyacZ2WgBDH1QEhxP4ScPQ
	oEgMDa717bG1mSQ8llLvaBvL2FhQhOX0dDh6o5EHD2xyzm4aeMn11/BSQmGAkg3wiunun0XJnLw98
	ARHZT12pcf19+dGEU9gjRCzO4N4wlmxCbp0uCusxYCLZqxAmKCv8sXXbGchA3yKKCpUVhlpVkOG2D
	nT6CSD6Osymmy/b2vlxJRo8nt+z+pC0cqb/HhiNlBHzc6pJdGJdj+wD/V1T/3UY0bsJaMBo/JTgIz
	zwUO/5ftrJypD+Ox/mCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXg5J-001f4G-22; Thu, 02 Mar 2023 10:22:49 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXg5F-001f2H-O0; Thu, 02 Mar 2023 10:22:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1677752547; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l6ee7lKmT/KWWtKguV3SPrNc7PjPPlEJmeaEXXgz6TX+xz1JjJhUxqgzNJsGy6jb49q6grnfws5F/D3Kda595NOSvaTEM/9tb3irjNLSWNFzGGkIeZMNeIWhfnK+FH3H8CK/hfFSV0kZkI0s0y7gi/R4ojziJeKGjStHOJRslK4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1677752547; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=GiacOipE63LiBD/dhyfIsvhZPNpdO/fbia46q+TRNXs=; 
	b=AkAQt/ZiWdgjuVVpDNnNSRh1BKhIPx0w6NdGXcsxDGJb7/ZTMSHycd+CFmUJryXlb2MmUi6V6SZpiHAIVHkVuyz6nyLzWslkVuDik9jD7N5mVKUnuX5zKlSrKcvcLiSPRTe19sa0dbX366uiRExvd2GMkbnZmRbc3NvGOaKBu1I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1677752547;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=GiacOipE63LiBD/dhyfIsvhZPNpdO/fbia46q+TRNXs=;
	b=JlmcxRCE7CBmL4wnK593ZonRmNnHCkmvyWnDC7Cflehc+7lWhbH0Pb1DMmMjz6LU
	Pv/yfQPGJSTI+IKo5rC9knrTiux3F1DiJQgTGx4L9SYg6MIbuYkdgEMOORNiiBnxZ5R
	+Dczh+lb4Z7V+lYGgHynFe8+OER1pp0beU9dvOag=
Received: from [10.10.10.3] (212.68.60.226 [212.68.60.226]) by mx.zohomail.com
	with SMTPS id 167775254620342.81356946477956; Thu, 2 Mar 2023 02:22:26 -0800 (PST)
Message-ID: <89588f69-9cf0-e7a4-b976-5ce87d42e296@arinc9.com>
Date: Thu, 2 Mar 2023 13:22:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 07/16] dt-bindings: pinctrl: ralink: add new
 compatible strings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
 <20230222183932.33267-8-arinc.unal@arinc9.com>
 <20230227173333.GA496999-robh@kernel.org>
 <d7aea90f-d077-3a41-996c-804c95d72e24@arinc9.com>
 <20230301024431.GA251215-robh@kernel.org>
 <ae3346de-140f-f181-b6a3-ccaa694e1548@arinc9.com>
 <11d3c806-04b6-da54-65f1-c0bd154affbc@linaro.org>
 <a9acd3b4-2b03-86c0-711c-a3840aeab574@arinc9.com>
 <1aae7ac9-c83d-71b4-4fce-325f02fcd722@linaro.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <1aae7ac9-c83d-71b4-4fce-325f02fcd722@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_022245_860841_DB2D5DEE 
X-CRM114-Status: GOOD (  26.03  )
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

On 2.03.2023 12:58, Krzysztof Kozlowski wrote:
> On 02/03/2023 10:17, Arınç ÜNAL wrote:
>> On 2.03.2023 11:28, Krzysztof Kozlowski wrote:
>>> On 01/03/2023 09:15, Arınç ÜNAL wrote:
>>>> On 1.03.2023 05:44, Rob Herring wrote:
>>>>> On Tue, Feb 28, 2023 at 07:46:36PM +0300, Arınç ÜNAL wrote:
>>>>>> On 27/02/2023 20:33, Rob Herring wrote:
>>>>>>> On Wed, Feb 22, 2023 at 09:39:23PM +0300, arinc9.unal@gmail.com wrote:
>>>>>>>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>>>>>>
>>>>>>>> Add the ralink,rt2880-pinmux compatible string. It had been removed from
>>>>>>>> the driver which broke the ABI.
>>>>>>>>
>>>>>>>> Add the mediatek compatible strings. Change the compatible string on the
>>>>>>>> examples with the mediatek compatible strings.
>>>>>>>>
>>>>>>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>>>>>> ---
>>>>>>>>      .../devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml | 7 +++++--
>>>>>>>>      .../devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml | 7 +++++--
>>>>>>>>      .../devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml | 7 +++++--
>>>>>>>>      .../devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml | 7 +++++--
>>>>>>>>      .../devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml | 7 +++++--
>>>>>>>>      5 files changed, 25 insertions(+), 10 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
>>>>>>>> index 1e63ea34146a..531b5f616c3d 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
>>>>>>>> @@ -17,7 +17,10 @@ description:
>>>>>>>>      properties:
>>>>>>>>        compatible:
>>>>>>>> -    const: ralink,mt7620-pinctrl
>>>>>>>> +    enum:
>>>>>>>> +      - mediatek,mt7620-pinctrl
>>>>>>>> +      - ralink,mt7620-pinctrl
>>>>>>>
>>>>>>> We don't update compatible strings based on acquistions nor marketing
>>>>>>> whims. If you want to use 'mediatek' for new things, then fine.
>>>>>>
>>>>>> Understood. Only the SoCs with rtXXXX were rebranded, the mtXXXX SoCs share
>>>>>> the same architecture from Ralink, so they were incorrectly called Ralink
>>>>>> SoCs.
>>>>>>
>>>>>> I can remove the new strings from Ralink SoCs and add them only for MediaTek
>>>>>> SoCs. Or you could make an exception for this one, regarding the situation.
>>>>>> Whatever you think is best.
>>>>>
>>>>> I'm not in a position to make an exception as I know little about this
>>>>> platform. Carrying both strings is a NAK. Either you (and everyone using
>>>>> these platforms) care about the ABI and are stuck with the "wrong"
>>>>> string. In the end, they are just unique identifiers. Or you don't care
>>>>> and break the ABI and rename everything. If you do that, do just that in
>>>>> your patches and make it crystal clear in the commit msg that is your
>>>>> intention and why that is okay.
>>>>
>>>> Ralink had their MIPS SoCs pre-acquisition, RT2880, etc. MediaTek
>>>> introduced new SoCs post-acquisition, MT7620, MT7621, MT7628, and
>>>> MT7688, utilising the same platform from Ralink, sharing the same
>>>> architecture code, pinctrl core driver, etc.
>>>>
>>>> I don't intend to break the ABI at all. On the contrary, I fix it where
>>>> possible.
>>>>
>>>> If I understand correctly, from this conversation and what Krzysztof
>>>> said, all strings must be kept on the schemas so I can do what I said on
>>>> the composed mail. Only match the pin muxing information on the strings
>>>> that won't match multiple pin muxing information from other schemas.
>>>>
>>>> This way we don't break the ABI, introduce new compatible strings while
>>>> keeping the remaining ones, and make schemas match correctly.
>>>>
>>>> Let me know if this is acceptable to you.
>>>
>>> If by "introduce new compatible strings" you mean duplicate compatibles
>>> to fix the ralink->mediatek, then you ignored entire email from Rob -
>>> this and previous. We don't do this. Leave them as is.
>>>
>>> If you meant something else, explain more...
>>
>> Let me put them in a group to better explain.
>>
>> ## Fix ABI
>>
>> ralink,rt2880-pinmux was there before, it was removed which broke the
>> ABI. I'm reintroducing it to fix it.
>>
>> ## New strings to be able to split bindings
>>
>> New strings are needed for MT7628/MT7688 and some RT SoCs to be able to
>> properly document the pin muxing information.
> 
> Then ok.
> 
>>
>> ## Incorrect naming
>>
>> MT7620, MT7621, MT7628, and MT7688 SoCs are incorrectly called Ralink,
>> introduce new ralink->mediatek compatible strings to address it.
> 
> So this part was addressed by Rob - we don't do it, because it does not
> matter. Ralink is now Mediatek, thus there is no conflict and no issues
> with different vendor used.

I think Rob was rather addressing that updating compatible strings based 
on acquisition or marketing whims is not permitted. This condition does 
not apply here as these SoCs were never Ralink.

I understand your point that Ralink is now MediaTek but still, calling 
these SoCs Ralink would be a bit misleading, don't you think?

> 
>>
>> ## Exception for RT SoCs to be called MediaTek
>>
>> This is where I was asking an exception to be made. Rob told us here
>> they know little about the platform so I explained it.
>>
>> MediaTek acquired Ralink and then introduced new MediaTek SoCs utilising
>> the same platform from Ralink.
>>
>> Anyway, now that I look at this again, it makes sense to me as well not
>> to rename the Ralink SoCs. I'll call the RT SoCs Ralink on the kconfig,
>> pinctrl driver,
> 
> These are separate. We did not comment on how you call Linux drivers.
> The mail thread was only about:
> 
>> and dt-binding schemas on my next version.

Understood, thanks.

Arınç

