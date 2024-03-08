Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17ABBC54E4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 10:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAw+Jiw7p+B61UXDy8G+fuIZSzLjdiTqt3xioTIben4=; b=g5Z9nfEiSFTaBUH9QwlT+9uir4
	IJJ5ZvhLjz/jb3OC6iNH/D0czbkURnDGZmpMDZaX16mvyov0jFHNNR3y0YAx4nbVkWzGdpb9a06Gh
	62iGvMZTah7V1+4znXgYsord929r7Kl9GJNBMfZ6EKx9jn3I+ZcsD4K+63tQKK/z1oS+4xRdUFxcP
	KMs7IJ+vbhNf1ew0O6YEPjSfv9/iEhQn0SxpwQCMGdydMYA6BFJZJt5roN7zMIg0za5bUuem5OuiR
	CAslmAYYuazM+fafp0s1gKV0g8C4ENclJrBtC5HS/3lDzqT2Juphdo4i3SoW89x58fUSIKe5Wy1/R
	cuBCIlkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riXuH-00000008rSL-1DRR;
	Fri, 08 Mar 2024 10:56:53 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riXuC-00000008rRP-3rvz;
	Fri, 08 Mar 2024 10:56:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56D8260007;
	Fri,  8 Mar 2024 10:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1709895406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FAw+Jiw7p+B61UXDy8G+fuIZSzLjdiTqt3xioTIben4=;
	b=ZKRh7LPs2bNtgyVYQTqeYkjYgvW7RBQ5+YMIvWLIvDz8aufrottZli9Ee2KqTBPg5+EtmB
	avSkIHL6LDhcQT+DlHLu94zY3CVZgDBM1aT4jEU9NfmKw6208gaTnadJoUBlT5k3khH5Lf
	PqeH4U/dEaVCVfFsZRAHuP3oxjsfnd0VA58m7y3OXLCFRohw98X1i338I/1u+Ry92C8kRW
	zvkATcllLMAKFQR5bbca/rJZumSkl5o7XPaEaUgqIVrhf/Vv2uch35TCSOG04KrO6yQ0m6
	tCLGnVmQXa6oVJa50i63+fIG0UtyK7BaXLIni8YwM/o7m4cAGTm6sIF9/pZVMA==
Message-ID: <0af41707-9d00-4eec-91b0-352f75a89360@arinc9.com>
Date: Fri, 8 Mar 2024 13:56:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] mips: dts: ralink: mt7621: add serial1 and serial2
 nodes
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Justin Swartz <justin.swartz@risingedge.co.za>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <CAMhs-H_eUKm7C40oCzuKwwEMZAcOJ-g4MghAfkGAmxRM0AXPUw@mail.gmail.com>
 <20240307190408.23443-1-justin.swartz@risingedge.co.za>
 <20240307190408.23443-3-justin.swartz@risingedge.co.za>
 <221bb898-a98f-4a2d-9301-84a3baefbbc7@collabora.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <221bb898-a98f-4a2d-9301-84a3baefbbc7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_025649_331320_B8AC468D 
X-CRM114-Status: GOOD (  12.20  )
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

On 8.03.2024 11:44, AngeloGioacchino Del Regno wrote:
> Il 07/03/24 20:04, Justin Swartz ha scritto:
>> Add serial1 and serial2 nodes to define the existence of
>> the MT7621's second and third UARTs.
>>
>> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
>> ---
>>   arch/mips/boot/dts/ralink/mt7621.dtsi | 28 +++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
>> index 3ad4e2343..5a89f0b8c 100644
>> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
>> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
>> @@ -124,6 +124,34 @@ serial0: serial@c00 {
>>               pinctrl-0 = <&uart1_pins>;
>>           };
>> +        serial1: serial@d00 {
>> +            compatible = "ns16550a";
>> +            reg = <0xd00 0x100>;
>> +            reg-io-width = <4>;
>> +            reg-shift = <2>;
>> +            clocks = <&sysc MT7621_CLK_UART2>;
>> +            interrupt-parent = <&gic>;
>> +            interrupts = <GIC_SHARED 27 IRQ_TYPE_LEVEL_HIGH>;
>> +            no-loopback-test;
>> +            pinctrl-names = "default";
>> +            pinctrl-0 = <&uart2_pins>;
> 
> As already commented on patch [1/3], pin muxing is board specific. Please remove.
> 
> Also, is there any reason why you can't simply use the `interrupts-extended`
> property instead of interrupt-parent and interrupts?

I'm looking at the documentation [1], it seems to be useful when multiple
interrupt parents need to be defined on a node. I'd continue using
interrupt-parent and interrupts in this case.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt

Arınç

