Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002E0C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 08:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzOMw7DCRjyHlr193oZekmqfRjIyFGacbxaFl9FSfzI=; b=A+6rITD2whK0nugokisMwbi9fK
	sIdb8Z8557VsVWJNMypKSRv4+ZeMaC6iXKMe67D4szz9xlT9vU2YMFRDoG2n821SWmCqM7IsqlaZt
	3k814SMkmqdXEQqF20cZLxSIHpUKtPLtMfkbKwFWniIWcAACpQRN4PyOCmxuve/6lXcCO9w6v4jbh
	II/dnbq6DqF1hlQlbcAyKBPbhpdGAGJaSb+mu/BEclQwrDG7vsrPtWDPeQuAcnyI18V/RGB249RpA
	xHMGBSpyE+5Tj/XN7OVAJKnIPXSpoKG5aW1W5HlTmk9XJYDSvibLpY29hP36ESv4/fMKlXZ5yfItW
	AKcoM31Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1kzY-001Ozs-97; Thu, 16 Jun 2022 08:36:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1kzN-001OxU-Rg; Thu, 16 Jun 2022 08:36:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 892186601742;
	Thu, 16 Jun 2022 09:36:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655368587;
	bh=sZsgXd3fsTLEaC/Xa6ctCUmW5czgXrHSQtatfJPolH8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oh5qpCD3V6oh6r/2TKz+Q+MKTyKQMmqKGCm2+QOTXj5M81oeyTNgA0Q1B/KKFLGPK
	 dQpX2zFOgEvgdWqHug3QdgxOX5ap4oD3scMMuqy9oweuaAzyfrEekgowFefU4mAwev
	 cTrnfntaRAxUQ/vnhYAzVxnT1qbxNlUnmz066On3+ld+sUHbgvJAzJcFvleKDS1yMb
	 FCe08b/71GIYKrpYSgM46vowqUISG8Vr3KWISTMzo+qWMZgPAG5SDVAi4hAdIjYEHN
	 At0MtK8VkEACsAnFQD90Lfw4h4HqE+k9p+Tdm0Zmj0Wi714a0mb96vNMRSn4IlE8IC
	 D64EfVolwbN0w==
Message-ID: <2859add6-74c3-5a4e-d3fa-68b311418459@collabora.com>
Date: Thu, 16 Jun 2022 10:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: mfd: mt6397: Add compatibles for MT6331
 RTC and keys
Content-Language: en-US
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, johnson.wang@mediatek.com,
 hsin-hsiung.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220520124617.228808-1-angelogioacchino.delregno@collabora.com>
 <20220520124617.228808-2-angelogioacchino.delregno@collabora.com>
 <YqpTrwlXmXMYuDd0@google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YqpTrwlXmXMYuDd0@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_013630_155761_7BD40272 
X-CRM114-Status: GOOD (  15.24  )
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

Il 15/06/22 23:48, Lee Jones ha scritto:
> On Fri, 20 May 2022, AngeloGioacchino Del Regno wrote:
> 
>> MT6331 is a multifunction device, providing RTC, keys and more: add
> 
> No such thing as an MFD.  What does the data-sheet call it?

Datasheets for this chip, or the other (6332) are not public ... and I have no
access to any: whatever you see here is done with an accurate reading of downstream
drivers and a lot of debugging and research.

Anyway, MT6331 is a PMIC, MT6332 is also a PMIC (in this case, a companion pmic).

> 
> What "more"?
> 

More is voltage regulators, display backlight PWM, LED PWM, some GPIOs, battery
charging, fuel gauge... and I think nothing else.

Anyway, okay I will list things out in the commit description.

>> the necessary compatibles to start implementing the basics.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   Documentation/devicetree/bindings/mfd/mt6397.txt | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
>> index d59063503b0d..2a9533c47365 100644
>> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
>> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
>> @@ -30,6 +30,7 @@ Optional subnodes:
>>   - rtc
>>   	Required properties: Should be one of follows
>>   		- compatible: "mediatek,mt6323-rtc"
>> +		- compatible: "mediatek,mt6331-rtc"
>>   		- compatible: "mediatek,mt6358-rtc"
>>   		- compatible: "mediatek,mt6397-rtc"
>>   	For details, see ../rtc/rtc-mt6397.txt
>> @@ -55,6 +56,7 @@ Optional subnodes:
>>   - keys
>>   	Required properties:
>>   		- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
>> +			      or "mediatek,mt6331-keys"
> 
> Please place these in a vertical list.

Will do!

Regards,
Angelo

