Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DF8C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 13:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59iU0P1f3ab6WLKiO0UF7eRA1PQgts1QskhL9VDL5XA=; b=wHq5knZJtofSU/CIGqvc9BV/yL
	jaxU5cMIyiqEDPQFnaq1qTfDjjuzAU4snCSMeJWmhT7U/96DXBxqtkbE3PaHnDd1YHK8kqmjMPfky
	HY6EIMY++3i7fS/t/l9JknIbx2VqpEz/k2OlJ5K0cjmteH/kOlJTDOPS9RqQ/YZVEFFYUeI4lEz2P
	Qseyj2iryQ1v9pOGWtX40MCcxj4MejWCzCS04bKazJUGN4HcggoaLgCuB9H86x9JWOAuvwl3PKswa
	cHDrC22DDFuamD764RDGCRV6GeMhY3FJSYx3YwpzTcpDa85mirlQvSglxJkC+WnGxtyhfia6bjavK
	N80Eon7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5RcD-00Gdka-0Q; Wed, 14 Dec 2022 13:16:05 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5RPo-00GXOK-DX; Wed, 14 Dec 2022 13:03:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1671022986; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UPY7i5SMkaWrKMVho/QYOQp0auQDrPT8dPO2l6K2foMyJvPZ8woJfjTPOwbVcwviT1KJgEjObe++Aj6yHYSHEFx2iDhYymbPdTknj39WyYQOY1O3J2N8CBZYXBh4I8iXaeL/yMl7hvn9o35WLK2xEEhRYl2zwjs4RrMKqD08KOM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1671022986; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=59iU0P1f3ab6WLKiO0UF7eRA1PQgts1QskhL9VDL5XA=; 
	b=F7wxJUlZ7S353Io7/FyOqNEEr3c2tmNKmNwts6m9Ixq0KA5u5ZpZURNdOVN2BhW2bGuirz2faM5Bj92xNiD1ARN9188hgC0TGznT7BCuByKvJacRZusOjZlA5aU7/w+qoPPK0F5xuI9hlH1TbapupA3umXd/YjiZyfTP5cmfpUM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671022986;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=59iU0P1f3ab6WLKiO0UF7eRA1PQgts1QskhL9VDL5XA=;
	b=NSuQkHVHGa+Sip6dofYz/aQLvD564zlFEhlUybh4SbnKYGY3TxmRjhMIZYpENZYY
	5Nr4rMhdpF3SyySfl/sVWkx3u65QD6dr6dnQpusrPrCGPsks8AjQ9euCnUSQ3rJxG0n
	3RZRtt7/b05X8q0DE4LKvTZ+Y7xL59iI3sM/Y4kY=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1671022984989152.47326119284412; Wed, 14 Dec 2022 05:03:04 -0800 (PST)
Message-ID: <e4b6b334-44c3-9e73-adaa-9972ff9e6fd5@arinc9.com>
Date: Wed, 14 Dec 2022 16:03:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/6] dt-bindings: pinctrl: mt7620: add proper function
 muxing binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20221213130430.172876-1-arinc.unal@arinc9.com>
 <20221213130430.172876-3-arinc.unal@arinc9.com>
 <4ffd94b2-e72c-a081-4326-5bc254603ddf@linaro.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <4ffd94b2-e72c-a081-4326-5bc254603ddf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_050316_625418_96F0242B 
X-CRM114-Status: GOOD (  15.26  )
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

On 14.12.2022 14:55, Krzysztof Kozlowski wrote:
> On 13/12/2022 14:04, Arınç ÜNAL wrote:
>> Not every function can be muxed to a group. Add proper binding which
>> documents which function can be muxed to a group or set of groups.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   .../pinctrl/ralink,mt7620-pinctrl.yaml        | 632 +++++++++++++++++-
>>   1 file changed, 596 insertions(+), 36 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
>> index 6f17f3991640..06880c80ba80 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
>> @@ -29,47 +29,608 @@ patternProperties:
>>           $ref: pinmux-node.yaml#
>>   
>>           properties:
>> -          groups:
>> -            description: The pin group to select.
>> -            enum: [
>> -              # common
>> -              i2c, spi, wdt,
>> -
>> -              # For MT7620 SoC
>> -              ephy, mdio, nd_sd, pa, pcie, rgmii1, rgmii2, spi refclk,
>> -              uartf, uartlite, wled,
>> -
>> -              # For MT7628 and MT7688 SoCs
>> -              gpio, i2s, p0led_an, p0led_kn, p1led_an, p1led_kn, p2led_an,
>> -              p2led_kn, p3led_an, p3led_kn, p4led_an, p4led_kn, perst, pwm0,
>> -              pwm1, refclk, sdmode, spi cs1, spis, uart0, uart1, uart2,
>> -              wled_an, wled_kn,
>> -            ]
>> -
>>             function:
>> -            description: The mux function to select.
>> -            enum: [
>> -              # common
>> -              gpio, i2c, refclk, spi,
>> -
>> -              # For MT7620 SoC
>> -              ephy, gpio i2s, gpio uartf, i2s uartf, mdio, nand, pa,
>> -              pcie refclk, pcie rst, pcm gpio, pcm i2s, pcm uartf,
>> -              rgmii1, rgmii2, sd, spi refclk, uartf, uartlite, wdt refclk,
>> -              wdt rst, wled,
>> -
>> -              # For MT7628 and MT7688 SoCs
>> -              antenna, debug, i2s, jtag, p0led_an, p0led_kn,
>> -              p1led_an, p1led_kn, p2led_an, p2led_kn, p3led_an, p3led_kn,
>> -              p4led_an, p4led_kn, pcie, pcm, perst, pwm, pwm0, pwm1, pwm_uart2,
>> -              rsvd, sdxc, sdxc d5 d4, sdxc d6, sdxc d7, spi cs1,
>> -              spis, sw_r, uart0, uart1, uart2, utif, wdt, wled_an, wled_kn, -,
>> -            ]
>> +            description:
>> +              A string containing the name of the function to mux to the group.
>> +            anyOf:
>> +              - description: For MT7620 SoC
>> +                enum: [ephy, gpio, gpio i2s, gpio uartf, i2c, i2s uartf, mdio, nand, pa,
>> +                       pcie refclk, pcie rst, pcm gpio, pcm i2s, pcm uartf, refclk,
>> +                       rgmii1, rgmii2, sd, spi, spi refclk, uartf, uartlite, wdt refclk,
>> +                       wdt rst, wled]
>> +
>> +              - description: For MT7628 and MT7688 SoCs
>> +                enum: [antenna, debug, gpio, i2c, i2s, jtag, p0led_an, p0led_kn,
>> +                       p1led_an, p1led_kn, p2led_an, p2led_kn, p3led_an, p3led_kn,
>> +                       p4led_an, p4led_kn, pcie, pcm, perst, pwm, pwm0, pwm1, pwm_uart2,
>> +                       refclk, rsvd, sdxc, sdxc d5 d4, sdxc d6, sdxc d7, spi, spi cs1,
>> +                       spis, sw_r, uart0, uart1, uart2, utif, wdt, wled_an, wled_kn, -]
>> +
>> +          groups:
>> +            description:
>> +              An array of strings. Each string contains the name of a group.
>>   
>>           required:
>>             - groups
>>             - function
>>   
>> +        allOf:
>> +          - if:
>> +              properties:
>> +                function:
>> +                  const: antenna
>> +            then:
>> +              properties:
>> +                groups:
>> +                  enum: [i2s]
> 
> I have doubts such setup is maintainable and readable. I would suggest
> to leave just few - maybe for gpio, jtag, refclk, utif.

These bindings are not going to change once all properly defined and I'm 
here as a maintainer so I don't see an issue with maintaining the binding.

It's the whole pin configuration of an SoC squashed under a single 
document. I guess this is the fate of the pinctrl bindings. The bindings 
for mt7622 is not so different:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pinctrl/mediatek%2Cmt7622-pinctrl.yaml#n63

It's still much better than reading the code:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pinctrl/ralink/pinctrl-mt7620.c

Arınç

