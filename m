Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BF0C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 13:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4h7ZiQXl6RCyjokpJIQcZhTaIjok855YoEQWGnJoYg=; b=RfXIp0HlIwhocDLU1uoFrHPkiK
	Tz69Xk7KvnXOFpAF86ds0fGdlMtyIxaNroR8zgPIe/MdnI8RakNFuJzrv9LRkNjC9snf3+nwvPmfZ
	85W9bwQKlNKrY7fcSp3QMNjozZG7b3MhSBH6zWDiCnI8LAFOvRHVFjDLFZQGOLAGhcYr+uurA6x4C
	SdS6nfQqInT3xXgwoaTeEwrOBwJHMHe96rRQLYV7rbCFd5usJjDgkG4Jz9iaiE3yofPbYT/pxNqJS
	5wwQl3irb595pr/eSnGI0pOrub1wgHZsXnAA7BP47BBPgVI38S1VNND7qFTSuZZlkvE0DWHExFY77
	m5TpDvmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riaDR-00000009Hcy-1HLw;
	Fri, 08 Mar 2024 13:24:49 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riaDK-00000009HZZ-46Ga;
	Fri, 08 Mar 2024 13:24:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F7811C0007;
	Fri,  8 Mar 2024 13:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1709904279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E4h7ZiQXl6RCyjokpJIQcZhTaIjok855YoEQWGnJoYg=;
	b=opr5oXJBfybVfKVKwrzmnp0nnEJpggoJJi0wgSdWcFgu5j+KPI3rcFVERj0wB3R1yN9tOZ
	+RZugGTlp4hQ3iPKqqnhSxm0LKsdxbJQuWWh4mHjcQ2iiyNE+4hoRylXbhuRyAg6OAzpBz
	V5pcc9lD/oXssVovG/oK/obsnqmEPmZ3NeJUK8sE0PSiowG/N2eLA3MAORqyEDXwkMMgfo
	3BECecOJbTi0jTWV7N8fiMnv2p61p9dApLlp8bWggpIicwOrWwdmVyFMHlANg2jCgCfTJ2
	ptCKtIOgWlpUFOTkNCbF1nv5NEKjkfRG1ZXVcaO3Yn37vVuJffpZ/uzdQ0/H/w==
Message-ID: <cbbbe5f8-6505-4f0f-80ce-77759e03235b@arinc9.com>
Date: Fri, 8 Mar 2024 16:24:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mips: dts: ralink: mt7621: associate uart1_pins
 with serial0
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <CAMhs-H_eUKm7C40oCzuKwwEMZAcOJ-g4MghAfkGAmxRM0AXPUw@mail.gmail.com>
 <20240307190408.23443-1-justin.swartz@risingedge.co.za>
 <ff708cd5-efe1-47e0-8112-ac7a2658cd8d@collabora.com>
 <9634b4fe726e711bd6bec7e487caab76@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <9634b4fe726e711bd6bec7e487caab76@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_052443_419829_D8FD0BA3 
X-CRM114-Status: GOOD (  24.91  )
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

On 8.03.2024 15:40, Justin Swartz wrote:
> Hi Angelo
> 
> On 2024-03-08 10:41, AngeloGioacchino Del Regno wrote:
>> Il 07/03/24 20:04, Justin Swartz ha scritto:
>>> Add missing pinctrl-name and pinctrl-0 properties to declare
>>> that the uart1_pins group is associated with serial0.
>>>
>>> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
>>> ---
>>>   arch/mips/boot/dts/ralink/mt7621.dtsi | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
>>> index 35a10258f..dca415fdd 100644
>>> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
>>> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
>>> @@ -123,6 +123,9 @@ serial0: serial@c00 {
>>>               reg-shift = <2>;
>>>               reg-io-width = <4>;
>>>               no-loopback-test;
>>> +
>>> +            pinctrl-names = "default";
>>> +            pinctrl-0 = <&uart1_pins>;
>>>           };
>>>             spi0: spi@b00 {
>>
>> The pins are muxed and can be either UART, or some other function that
>> is supported by the mux: this means that the pinctrl-xxx properties shall
>> *not* go into the SoC dtsi file, but in board dts files instead.
>>
>> Said differently: the usage of the UART pins is board-specific, not SoC-wide.
> 
> Thanks for the explanation. I agree that the pinctrl properties
> would make more sense in a serial node extension in a board's dts,
> but my reason for including them in the SoC's dtsi is due to the
> precedent set with these existing nodes:
> 
>    i2c
>    spi0
>    mmc
>    ethernet
>    pcie
> 
> There is also a default function declared for each of the pin
> groups defined under the pinctrl node. These functions co-incide
> with what is intended for each of those device nodes to function
> correctly, rather than in the alternative GPIO-mode.
> 
> So I thought that sticking with that existing pattern would get
> the least resistance from the community.
> 
> I can imagine how moving the pinctrl node to the board dts, and
> then moving all of the pinctrl properties associated with device
> nodes to their board dts references could be a better separation
> logically.
> 
> What do you recommend?

As a maintainer, this is the logic I follow on the MT7621 device tree
source files regarding the description of pin groups:

- Claim the relevant pin group with the default function (pinctrl-names &
   pinctrl-0) on the node that describes a component of the SoC.

- Keep the node disabled and leave it to the board DTS file to enable it.

I don't disable serial@c00 as we can expect every board to use it. Same
goes for ethernet@1e100000. Some boards use the pins on the rgmii2 pin
group as GPIO, so the pinctrl-0 property on ethernet@1e100000 is
overwritten on the board DTS file without rgmii2_pins listed.

So I'm fine with this patch as is.

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

