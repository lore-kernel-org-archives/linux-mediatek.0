Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE57AC27C5E
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 08:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7sOaOcLfwTXry5kN9eWXyqvbgt7HqMGLZVaHMxo0Fk=; b=kClm+X0NWzg9uoQ3mBjMGpDgfh
	3L2GCtdbaHSmPdIM2rrMkw/TzV0QazC5cBD/G7LSoUVtNaaQJ0aEI3GctC6Y0zcIFRPyozGLrhjZ6
	ejTGCXC3N3StNloWXdEjQtRiNZiwCEg/FJLjLOtpGO+ovZPXn7maE7wyppP/8kkTHBzfa5ZlgNWDu
	fVqJkuAB7Vw8jcKM5maZww8XKAqxQ0jbNm4L5Xr45B1UHo3e/Y+3cbtGABHfh5SKZu0u3ZO2LA3FE
	ipi91oWgkeabChC5p0MgbsUY5yXDGuo2SuOfVTQ5NAwlo78yKGPL0KxdewmPdibB+sYk5TPdBW9b0
	pJWDn/sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGZxs-000000049Zf-11yC;
	Mon, 10 Jun 2024 08:01:16 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGZxl-000000049V3-1kBe;
	Mon, 10 Jun 2024 08:01:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718006457;
	bh=1qc8sEPJXgX5QVHao+W1jv64OvLM7kYZ9yU+Gf0Z1dI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E0dNFPWFdu9QwVQ4mckqkzCeoKk+njabiRFivBjbv15atGBo7I9qaQPBmaW7/n6Uc
	 3X3nXznhVVgzRjDCKXiBHSrwf8uH9+5XcjX7PneBkrSZonZZ0bholbelAR5GMynrKP
	 M1zLUkSI4x65uIz3V3SlFVXoGCfXab9tc3iZbFaIfwtSEhOCfsRL8D6EvAIiw577VJ
	 NJsd6JIp7RTwYZNluGNt+1Z9n+ex0jMkaE7lYtqDIPp0/jlF1Qu1eEJTyPR6vM3MLs
	 04o9wsTQ2sRbMYpQFf0QjwrMnspMkN2pVwlhjDRiofbx3NigwoeW9PLdWONe53j33Q
	 Z8ATGX7jzsuIw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E996B3780575;
	Mon, 10 Jun 2024 08:00:55 +0000 (UTC)
Message-ID: <e71a38a9-7a92-4156-a7f0-52f71d461d61@collabora.com>
Date: Mon, 10 Jun 2024 10:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: iio: adc: Add MediaTek MT6359 PMIC
 AUXADC
To: Rob Herring <robh@kernel.org>
Cc: jic23@kernel.org, lars@metafoo.de, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, lee@kernel.org,
 andy@kernel.org, nuno.sa@analog.com, bigunclemax@gmail.com,
 dlechner@baylibre.com, marius.cristea@microchip.com,
 marcelo.schmitt@analog.com, fr0st61te@gmail.com, mitrutzceclan@gmail.com,
 mike.looijmans@topic.nl, marcus.folkesson@gmail.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, andy.shevchenko@gmail.com,
 kernel@collabora.com
References: <20240604123008.327424-1-angelogioacchino.delregno@collabora.com>
 <20240604123008.327424-2-angelogioacchino.delregno@collabora.com>
 <20240605235239.GA3455504-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240605235239.GA3455504-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_010109_812510_3638A094 
X-CRM114-Status: GOOD (  16.18  )
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

Il 06/06/24 01:52, Rob Herring ha scritto:
> On Tue, Jun 04, 2024 at 02:30:04PM +0200, AngeloGioacchino Del Regno wrote:
>> Add a new binding for the MT6350 Series (MT6357/8/9) PMIC AUXADC,
>> providing various ADC channels for both internal temperatures and
>> voltages, audio accessory detection (hp/mic/hp+mic and buttons,
>> usually on a 3.5mm jack) other than some basic battery statistics
>> on boards where the battery is managed by this PMIC.
>>
>> Also add the necessary dt-binding headers for devicetree consumers.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../iio/adc/mediatek,mt6359-auxadc.yaml       | 33 +++++++++++++++++++
>>   .../iio/adc/mediatek,mt6357-auxadc.h          | 21 ++++++++++++
>>   .../iio/adc/mediatek,mt6358-auxadc.h          | 22 +++++++++++++
>>   .../iio/adc/mediatek,mt6359-auxadc.h          | 22 +++++++++++++
>>   4 files changed, 98 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
>>   create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6357-auxadc.h
>>   create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6358-auxadc.h
>>   create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6359-auxadc.h
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
>> new file mode 100644
>> index 000000000000..6497c416094d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
>> @@ -0,0 +1,33 @@
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
> 
> Why do you need a node here? Just add #io-channel-cells to the parent
> node.
> 

Because some boards will want to avoid probing the related driver, as that will
trigger a reset and this may not play well with ECs (namely, some Chromebooks),
which are reading the same AUXADC block.

If I avoid using a new node, instead of just using `status`, I'll have to add a
"mediatek,disable-auxadc" property to the parent node, which isn't pretty...

Cheers,
Angelo

>> +
>> +required:
>> +  - compatible
>> +  - "#io-channel-cells"
>> +
>> +additionalProperties: false



