Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90933C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 08:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtPvUhcKt38IEwJhnL5ko32Kjhs/HoglrRIMkXvAOas=; b=Ov7r5VzKe5HwD/7+OtmftNYq41
	+APHNzysqNLgp9YOrRhylSQbC6rlRWgcJtXO2uvaR5BtUGQ4hxntRFZIygM4/kurjxwDi6psblzhw
	mNil0Xl3uElHUXMmJ4O+TjqQiuS7z0HVV/tGno0PAa8xHrzMBcqOg4gt3eFQpuFm6uWfdjyZQh0cF
	p/iQ5rY5su3aUMSKD7MuL5Kos+myKFbbU+YrQuKUNIH7f0XQphCwhJL/yg7F6+EUukalvonKQFLJL
	JupUxxuCXH/6+1GpBLZiBNs5dCChdilwNG+fa44jON4Yxfcs3Mb3zdXo7BmKaARwIDBF8kKo6bUUL
	LcvcKbsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ50U-00000000NJn-2WMG;
	Wed, 31 Jul 2024 08:48:26 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ501-00000000NDR-1j0h;
	Wed, 31 Jul 2024 08:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722415676;
	bh=J1sOSME0u6roc/a+qPwtB9E24QMzJiJjbIjiPdJuLEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eHF1CUo9Tpz2SIqoHSYcs7456H81OBUsVZLx6BNkBU5BriLDzbv62GM84XOQ1dzGl
	 Y30xAP/z+AyVTY4DWsdsWAIGJy9OlnfBQU2O303CXN3N4GynXCTPoaeuwTjGRF4i9T
	 kZ/LgLmap5rPeNHh6WESYaaAKkEzujwmVF22odyF7324oQ30NS4XpXGkVkIGAFv5eM
	 5uJvvujNubK9V/svOMfHnt3ZAfkLba3xI3kuihe+4f1Cq5hgQqSDqcGRfyThYtUgtC
	 bmCnmoj29+HsxDRfZ+hnYk3Mx8yAQLMP/zGV6WqYt7W4AEk/BH/llZw3hxI/wypzNL
	 r+Jr1JNEIiDrg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6E9F8378000B;
	Wed, 31 Jul 2024 08:47:55 +0000 (UTC)
Message-ID: <909d4058-e3e9-4b59-b476-8f78e668c73b@collabora.com>
Date: Wed, 31 Jul 2024 10:47:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: arm64: mediatek: Add
 kukui-jacuzzi-cerise board
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240731-jacuzzi_dt-v2-0-4995335daa30@chromium.org>
 <20240731-jacuzzi_dt-v2-2-4995335daa30@chromium.org>
 <bb696e60-642f-43f1-9ccf-972e1d839bcd@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <bb696e60-642f-43f1-9ccf-972e1d839bcd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_014757_619757_F37F4F83 
X-CRM114-Status: GOOD (  16.68  )
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

Il 31/07/24 10:16, Krzysztof Kozlowski ha scritto:
> On 31/07/2024 08:26, Hsin-Te Yuan wrote:
>> Cerise is known as ASUS Chromebook CZ1.
>> Stern is known as ASUS Chromebook Flip CZ1.
>>
>> They are almost identical. The only difference is that Cerise is a
>> clamshell device without touchscreen and Stern is a convertible device.
>>
>> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
>> ---
>>   Documentation/devicetree/bindings/arm/mediatek.yaml | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
>> index 1d4bb50fcd8d..087773a43673 100644
>> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
>> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
>> @@ -146,6 +146,20 @@ properties:
>>           items:
>>             - const: google,burnet
>>             - const: mediatek,mt8183
>> +      - description: Google Cerise (ASUS Chromebook CZ1)
>> +        items:
>> +          - enum:
>> +              - google,cerise-sku0
>> +              - google,cerise-rev3-sku0
>> +          - const: google,cerise
>> +          - const: mediatek,mt8183
>> +      - description: Google Stern (ASUS Chromebook Flip CZ1)
>> +        items:
>> +          - enum:
>> +              - google,cerise-sku1
>> +              - google,cerise-rev3-sku1
>> +          - const: google,cerise
> 
> Why not google,stern? If this is not compatible with cerise and has
> different name, I think logical would be to have different compatible -
> either here or the first one.
> 

They're both compatible, but the commercial names are different because one
is convertible, one is not... and the bootloader still checks for cerise
even on stern - that's how I read it, and it's not the first time...

...but it doesn't hurt to have a "google,stern" compatible added to the mix,
it's just one more const to add... and I don't have any strong opinion about
that, so, Hsin-Te, it's your call. :-)

Cheers,
Angelo



