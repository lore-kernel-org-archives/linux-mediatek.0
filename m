Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B38CEF148
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 10:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaGOmBsR6B2WGKwY4HwP8yh0qPlSUdTBH2tELdDJsnQ=; b=dQ6kwRBMNGXnOkuEmJ9Pp5M7Q2
	2OkTXTWN1aCJ8r6FpMc9awWxI8yMopQW5DO7Xb0xd2gDVwdt/1rKNXZfzl+NGLgYb9nomPMlaabcA
	+KKS8vsu0rQRLRmW2xDq5WvS01bbBJoEDLzDP0zWjD5DT5lVblRCEAzVBaik3uHAoZccWaa9eRshi
	GvxnFzgU/oV2wiDBNSgEWoXnvD3pxhu4R9bf1KIwaIiTCEEEY6AQ23ttRhXL6IvsylVrZsfwFLfMf
	+cJgIC+EiELb/yinJkUEIc88gdpQIFKAE4Da9OiVH3GvsdW3xOVKW4RsGzBueOHM2MEPf7jJ4ado2
	Fve6WQqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy74f-00000005P7e-2u9P;
	Tue, 08 Oct 2024 10:04:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy73J-00000005Osv-40Do;
	Tue, 08 Oct 2024 10:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728381768;
	bh=mFzh90SvcG8Ef2Scd/kQ8LXuzUilRDcyltT4lCKZCe4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qWRxUFS4rlIdDKCarS6kBJSS8FHFkXeHw65towKaXVvCyLI9068O0sLjoxvH7thaw
	 AwXUFBWLV/v1A3h3yFgbJJrqc3Q+r1/kYwy1ZCF47Mk3KGtzFfCk7LOC1GaDmfJvT2
	 228rk8da0lCunBj/E/PsG4xZafcHCHZZl/DMh5p/DIwBs62SUNIKXEsQYV41LbEZvU
	 ji3ffcxblZ72F9+Nwda4om0APxf62j67GA9ZDkbN7UM5IQ3KawIAZn8hm1Sa7UMsVi
	 mjj1vvBTfHLMWHvw9NgJwwWq1veUxsy5eUYNF5hiF2XT2gzl6A5pOXRxefm69SakwL
	 fV06P+lhC15kw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E78F517E11FA;
	Tue,  8 Oct 2024 12:02:47 +0200 (CEST)
Message-ID: <c23b195b-6dc5-4087-bc7b-1d3f9cbdb700@collabora.com>
Date: Tue, 8 Oct 2024 12:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: mediatek: mt7623: fix efuse fallback
 compatible
To: Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240617094634.23173-1-zajec5@gmail.com>
 <20240617094634.23173-2-zajec5@gmail.com>
 <d9565233-090b-4931-9e9f-89725db605e3@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <d9565233-090b-4931-9e9f-89725db605e3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_030250_630930_B496CDEE 
X-CRM114-Status: GOOD (  15.07  )
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

Il 07/10/24 16:06, Matthias Brugger ha scritto:
> 
> 
> On 17/06/2024 11:46, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> Fix following validation error:
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: efuse@10206000: compatible: 
>> 'oneOf' conditional failed, one must be fixed:
>>          ['mediatek,mt7623-efuse', 'mediatek,mt8173-efuse'] is too long
>>          'mediatek,mt8173-efuse' was expected
>>          'mediatek,efuse' was expected
>>          from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: efuse@10206000: Unevaluated 
>> properties are not allowed ('compatible' was unexpected)
>>          from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>>
>> Fixes: 43c7a91b4b3a ("arm: dts: mt7623: add efuse nodes to the mt7623.dtsi file")
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>   arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi 
>> b/arch/arm/boot/dts/mediatek/mt7623.dtsi
>> index 9c5a52ce9351..748f9b366897 100644
>> --- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
>> +++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
>> @@ -328,7 +328,7 @@ sysirq: interrupt-controller@10200100 {
>>       efuse: efuse@10206000 {
>>           compatible = "mediatek,mt7623-efuse",
>> -                 "mediatek,mt8173-efuse";
>> +                 "mediatek,efuse";
> 
> Angelo stated that we should move away from generic fallbacks.

That's right.

> Although the binding 
> states explicitly to use "mediatek,efuse" and deprecates the standalone 
> "mediate,mt8173-efuse", which could the default fallback. Angelo, what do you 
> think, take it or re-doing the binding first?
> 

No, this is an old SoC, and we want the DTs to be backward compatible as they
should.

Deprecating the generic "mediatek,efuse" fallback is something that we must
enforce only on new SoCs (so, new compatible strings), not on older ones.

So, my call is to take it.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!
Angelo

> Regards,
> Matthias
> 
>>           reg = <0 0x10206000 0 0x1000>;
>>           #address-cells = <1>;
>>           #size-cells = <1>;


