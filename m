Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30856EFCE4B
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2026 21:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzpEAndabLXdFU83lYguNUY29Q1wC4ZmNMkxm9NkFgM=; b=40sPoTUnnR/0J/VEQGnpazBcAj
	YVkTppBLix9fFlJxg+5guKfMojIu+cwhr6nF5PI3tiU5WUkRBLaMDc/J7EjI7JD1tx5fCOcDa0Jvd
	N4/08G3HxJkhb7o/qFj/OyafFjnbD/4qijc7mmRA9fRCd3E+ZnJor5/x3GifXSJLuIfAMzhC0nB87
	O8RYKzk8qtDPLQ0ADUzXANL7hJ6lTMcfzOtekZsBADeqc7ruXapeoHnwT8S/CcnOjX+CI7GbEWNAW
	hnAXvmEHna4s4Qc5JMXjTclhFJIxtxuJqIFpk13LEM0Xbcy0woY2+e4KZNsC3bKokT+YeZmrkcwhu
	e+txq2yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxu3N-00000000Xf1-1PDY;
	Wed, 04 Mar 2026 21:46:49 +0000
Received: from mx3.wp.pl ([212.77.101.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxu3L-00000000XeL-15pq
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Mar 2026 21:46:48 +0000
Received: (wp-smtpd smtp.wp.pl 398 invoked from network); 4 Mar 2026 22:46:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1772660802; bh=NzpEAndabLXdFU83lYguNUY29Q1wC4ZmNMkxm9NkFgM=;
          h=Subject:To:Cc:From;
          b=kXijcwDr5eR+9K1AwEREg5sp8eO2Ui5fNQ/FNdpdD4KuEECE7vZahMbWoLbr221VF
           YDdZcQW2bq/cH4l4B9dnHaSQIOlXrJX6lmG86qAKolf84vsSUInILkDJiH35VvpCLC
           7Lt/fLQ7rjqjdVkIjGGYT/vj5iJODYPGx7rN82nglesI7ilXYsoPz16kYO/jdLJN8l
           l5Resb1XzI48I8Whs3PHD7z3LKLXAZZA8GLYpCrCpUEqwcehFiHjcL0Y3OnQhEFoGd
           qfFgyF47S1t4dK+qTNRhKK9z4bWOyKJRcVO8WrhYn5c0uSUqbCVDVsne9U1yV0dQRy
           pEqTVWAKGk8MA==
Received: from 83.24.116.171.ipv4.supernova.orange.pl (HELO [192.168.3.246]) (olek2@wp.pl@[83.24.116.171])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <conor@kernel.org>; 4 Mar 2026 22:46:42 +0100
Message-ID: <f9b266d7-f545-4088-b6c5-a0cc8676d60c@wp.pl>
Date: Wed, 4 Mar 2026 22:46:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: crypto: eip93: add clock gate and reset
 line
To: Conor Dooley <conor@kernel.org>
Cc: ansuelsmth@gmail.com, herbert@gondor.apana.org.au, davem@davemloft.net,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 lorenzo@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260303193923.85242-1-olek2@wp.pl>
 <20260304-hardship-abreast-7a2d58cbe446@spud>
Content-Language: en-US
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <20260304-hardship-abreast-7a2d58cbe446@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-WP-MailID: 99f604febecd4a2e8ba3ea7d20496df9
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [oTqX]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_134647_497927_9716F799 
X-CRM114-Status: GOOD (  10.52  )
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

Hi Conor,

On 3/4/26 20:08, Conor Dooley wrote:
> On Tue, Mar 03, 2026 at 08:39:17PM +0100, Aleksander Jan Bajkowski wrote:
>> Add the clock gate and reset line, both of which are available
>> on the Airoha AN7581. Both properties are optional.
> Why are they optional?

No reason. In theory, a hardware designer could connect the reset
to a fixed input signal. In practice, all SoCs on the market have
a built-in reset and clock controller. I can mark them as required
in the next revision.

>> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
>> ---
>>   .../crypto/inside-secure,safexcel-eip93.yaml         | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
>> index 997bf9717f9e..058454b679b4 100644
>> --- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
>> +++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
>> @@ -48,6 +48,12 @@ properties:
>>     interrupts:
>>       maxItems: 1
>>   
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -57,11 +63,17 @@ additionalProperties: false
>>   
>>   examples:
>>     - |
>> +    #include <dt-bindings/clock/en7523-clk.h>
>>       #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/reset/airoha,en7581-reset.h>
>>   
>>       crypto@1e004000 {
>>         compatible = "airoha,en7581-eip93", "inside-secure,safexcel-eip93ies";
>>         reg = <0x1fb70000 0x1000>;
>>   
>> +      clocks = <&scuclk EN7523_CLK_CRYPTO>;
>> +
>>         interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +      resets = <&scuclk EN7581_CRYPTO_RST>;
>>       };
>> -- 
>> 2.47.3
>>
Best regards,
Aleksander



