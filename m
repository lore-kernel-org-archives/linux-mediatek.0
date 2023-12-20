Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3D7C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 10:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSqdyRjAkrfBo87X06Kk3ecC/XqHnn4AJwDBCdh3Zyc=; b=geWKIw4Wl9iRK2VzX6syyHl0OZ
	QbTmLx6oX5nRuoAAntAfVFWHFhNnJRVLQp2adVK1o+76ksFDL7B6a+yN101JVRTRwfUqcnGJx0CYL
	5QKnhEvQ751CPmGLBrz+BuUZIK1EMDIRfUpBs3GMKNhuEJ8wgJEEon6NsRw587mXPKkXaF7z83/bR
	twUYCByP6ssrt5mkSjmMm/thn/lQ1wea/3BDI94o6blahnjmjaUhfu815vEh694wHIcTFWh2tE60D
	N6uUZf3UgbfOABQpUZI/49NdSNHSvgVWsrQq2SOLRjPEPcE4o03EbfqfGVjS75hhWtNnWG/Re8caE
	g3abXzug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFu0e-00Gxrg-19;
	Wed, 20 Dec 2023 10:41:04 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFu0a-00GxoC-0o;
	Wed, 20 Dec 2023 10:41:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703068855;
	bh=yxdr2wDLPdmFNUpT4t9Rg2dNzZa1R0tQMe3QdGqlyXg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nKc3wCmhLEun3qNedKeJslBGCJrJaaVylZOdZUcGG0amBvOOgmOF15atthRaWnJy0
	 Ycqx9UBr0bX4bIb9VwyLgheVyAhqpnxdhhlr2CW0hTdSCBz5GfiY7RHg4UZ29THzTx
	 Pi9KrzRqCZ13tap6puo3rJlBkwjXDk/f5jYo2tWLTeYKSR1RijWKKkl1eJ5sIRBZoS
	 dIbZ8tvM3Zm2/hBkwc3MDlwdkdGQZAibRXJAOfyI90yigEaY3ySicUSc81iW8HJAdj
	 DFvgDk2+HMxVJlqn+u5zWOoN9vHrtEWxcfhGXJ1lotRMGoaJtoYunpQdMwmH7YzOAp
	 VZGPKCauPkaJg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D903337810CD;
	Wed, 20 Dec 2023 10:40:54 +0000 (UTC)
Message-ID: <4117de24-75fd-4355-9ffb-7d1bc0167295@collabora.com>
Date: Wed, 20 Dec 2023 11:40:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: usb: mtk-xhci: add a property for
 Gen1 isoc-in transfer issue
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>
References: <20231220025842.7082-1-chunfeng.yun@mediatek.com>
 <c3d372f0-3d21-4500-96cd-9c88aaf5ce89@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <c3d372f0-3d21-4500-96cd-9c88aaf5ce89@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_024100_447696_DB05C457 
X-CRM114-Status: GOOD (  17.97  )
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

Il 20/12/23 08:38, Krzysztof Kozlowski ha scritto:
> On 20/12/2023 03:58, Chunfeng Yun wrote:
>> For Gen1 isoc-in endpoint on controller before about SSUSB IPM v1.6.0, it
>> still send out unexpected ACK after receiving a short packet in burst
>> transfer, this will cause an exception on connected device, specially for
>> a 4k camera.
>> Add a quirk property "rx-fifo-depth" to work around this hardware issue,
>> prefer to use 3k bytes;
>> The side-effect is that may cause performance drop about 10%, including
>> bulk transfer.
>>
>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>> ---
>> v3: add fifo depth unit, change the value range from 0-3 to 1-4
>> v2: change 'mediatek,rxfifo-depth' to 'rx-fifo-depth'
>> ---
>>   .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml   | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
>> index e9644e333d78..9478b7031796 100644
>> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
>> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
>> @@ -124,6 +124,18 @@ properties:
>>         defined in the xHCI spec on MTK's controller.
>>       default: 5000
>>   
>> +  rx-fifo-depth:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      It is a quirk used to work around Gen1 isoc-in endpoint transfer issue
>> +      that still send out unexpected ACK after device finish the burst transfer
>> +      with a short packet and cause an exception, specially on a 4K camera
>> +      device, it happens on controller before about IPM v1.6.0; the side-effect
>> +      is that may cause performance drop about 10%, include bulk transfer,
>> +      prefer to use 3 here. The unit is 1K bytes.
> 
> NAK. Read comments on previous submission.
> 
> Best regards,
> Krzysztof
> 

Chunfeng, I think the discussion was not clear for you, so I will try to give
you a different explanation: this should be expressed in bytes, so 1000, or 1024,
2048, 4096, etc, and not 1/2/3/4/5/n.

The driver shall then validate and map your bytes number to hardware register
value and subsequently write to the registers.

Cheers,
Angleo

