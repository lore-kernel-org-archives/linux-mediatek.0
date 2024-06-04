Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D5EC25B7E
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 08:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPxkTvIY1OnnUnt3jnm7L07WS4Ys0chBiBAUBcfGarY=; b=Ntl8Lx7Hv+2aVMrCuTlKg5FoZc
	/ckcaRdlk3p4G9OwnBtlMuWHUXP7doNE6lGHOUJ9OEx6UPzs2MYQ2mYrKtFY3t0lISS6dyvh873EL
	UPw9TXxba3x9Jw744U0QYxEkRZP96lqBI7mZ1NGIUBu0qJ0CL1lfpLDZfyEG7gkkoTAjA0T5gKH4g
	ax81eNrSp/ost1Lwqi3IhHnnW2P/RxybHtxq0zrAUTfKncHtZNiEBZWpNqEZCBbxXak+h03xYOpxp
	l8xXxGlZvO4AXwKYDqCqTS/MKNBOCTd7cECgkIfyICPaDD68jOAWuk8wW2cz2uKBF2aFqhQUvULWl
	XaA3wvaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPxh-00000001lE1-3aHr;
	Tue, 04 Jun 2024 08:56:09 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPxa-00000001lD0-33qg;
	Tue, 04 Jun 2024 08:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717491357;
	bh=r2ck1rsuVVphLHKbN3/pA2NZ4RAXxpCpbkmrsFDVE5g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P6ElIW8WPmTOX0jW3jw2xp/rjwSPQt4ZKDODVDJxlOKrsa4qdnBeSkQ2YUJJUJc4Q
	 JOvi6t5r10Qk7hXsnAJ1mDPbLEmcaURAqo3UZtkbjyh+e15CMYEBwnbGBeP0aUV6on
	 Fd1uYD0AqcgMEFnIiF+N/iJ0ImD9NUBavw7BlmwETppxrBgJV6bS4k6WgIXWwhQ8Dv
	 EpZxNOEYZ/1ieAe5X6W+UUt6Oi5cogBZ0lzLfnhuQKjxt//IJ+UIIQWNwZfyVa6Xs5
	 S8GuDrSqNIj3LG0bTJczaRuL+mma50nfQ/hyannt2+xuOuTdLr1BXVhN+qCrBroLv7
	 ynLjRJ8EjbugQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6DAB737820A7;
	Tue,  4 Jun 2024 08:55:56 +0000 (UTC)
Message-ID: <dc46258b-caf9-46a7-84b4-2f229d48b8f7@collabora.com>
Date: Tue, 4 Jun 2024 10:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] dt-bindings: iio: adc: Add MediaTek MT6359 PMIC
 AUXADC
To: Krzysztof Kozlowski <krzk@kernel.org>, jic23@kernel.org
Cc: lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, lee@kernel.org,
 andy@kernel.org, nuno.sa@analog.com, bigunclemax@gmail.com,
 dlechner@baylibre.com, marius.cristea@microchip.com,
 marcelo.schmitt@analog.com, fr0st61te@gmail.com, mitrutzceclan@gmail.com,
 mike.looijmans@topic.nl, marcus.folkesson@gmail.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20240530093410.112716-1-angelogioacchino.delregno@collabora.com>
 <20240530093410.112716-2-angelogioacchino.delregno@collabora.com>
 <c2b97c8e-177e-4169-b001-ab0e3303734f@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <c2b97c8e-177e-4169-b001-ab0e3303734f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_015602_966241_C364CA8D 
X-CRM114-Status: GOOD (  21.74  )
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

Il 01/06/24 17:32, Krzysztof Kozlowski ha scritto:
> On 30/05/2024 11:34, AngeloGioacchino Del Regno wrote:
>> Add a new binding for the MT6350 Series (MT6357/8/9) PMIC AUXADC,
>> providing various ADC channels for both internal temperatures and
>> voltages, audio accessory detection (hp/mic/hp+mic and buttons,
>> usually on a 3.5mm jack) other than some basic battery statistics
>> on boards where the battery is managed by this PMIC.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../iio/adc/mediatek,mt6359-auxadc.yaml       | 43 +++++++++++++++++++
>>   .../iio/adc/mediatek,mt6357-auxadc.h          | 21 +++++++++
>>   .../iio/adc/mediatek,mt6358-auxadc.h          | 22 ++++++++++
>>   .../iio/adc/mediatek,mt6359-auxadc.h          | 22 ++++++++++
>>   4 files changed, 108 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
>>   create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6357-auxadc.h
>>   create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6358-auxadc.h
>>   create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6359-auxadc.h
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
>> new file mode 100644
>> index 000000000000..dd6c331905cf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
>> @@ -0,0 +1,43 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek MT6350 series PMIC AUXADC
>> +
>> +maintainers:
>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> +
>> +description:
>> +  The Auxiliary Analog/Digital Converter (AUXADC) is an ADC found
>> +  in some MediaTek PMICs, performing various PMIC related measurements
>> +  such as battery and PMIC internal voltage regulators temperatures,
>> +  accessory detection resistance (usually, for a 3.5mm audio jack)
>> +  other than voltages for various PMIC internal components.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - mediatek,mt6357-auxadc
>> +      - mediatek,mt6358-auxadc
>> +      - mediatek,mt6359-auxadc
>> +
>> +  "#io-channel-cells":
>> +    const: 1
>> +
>> +additionalProperties: false
> 
> If there is going to be a re-spin, please move this below required: block.
> 

Yep, will do. Fixed up for v2.

>> +
>> +required:
>> +  - compatible
>> +  - "#io-channel-cells"
>> +
>> +examples:
>> +  - |
>> +    pmic {
>> +        pmic_adc: adc {
>> +            compatible = "mediatek,mt6359-auxadc";
>> +            #io-channel-cells = <1>;
>> +        };
> 
> This suggests that you should grow (make complete) the parent PMIC example.

Uhm, should I instead add that to bindings/mfd/mediatek,mt6357.yaml and avoid
growing the parent example?

   adc:
     type: object
     $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml
     unevaluatedProperties: false

> 
> Actually having this as a separate node is not really needed. Why it
> cannot be just part of the MFD/parent node?
> 

(glossary: PWRAP = PMIC [SPI] WRAPper)

The top node is the PWRAP, an IP that is (mostly) used to dispatch commands to
the PMIC, but the AUXADC is not integrated into the PWRAP, but into the PMIC.

Declaring the AUXADC as a PWRAP child would therefore be an incorrect description
of the hardware.

P.S.: not necessary, but to "complete the circle" ... note that the PWRAP can be
       skipped on some SoCs/firmwares/configurations, even though afaik that's only
       mostly for debugging purposes, it's not granted that you have pwrap between
       SoC and PMIC on all SoCs/fws/confs, even though, all of the boards that are
       supported upstream do have it and do require it.

Cheers,
Angelo

> 
> Best regards,
> Krzysztof
> 




