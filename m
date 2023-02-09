Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06C2C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 09:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jahLSYb7uL7C3ZQqlz6cL3MOpsegHmOaVCtApttlBTo=; b=K1Zd6PU0g24fg5aa3Gk7IvcJP1
	OInodwDEWu+Ao38SaA8L705rSrq/usnmn4hrLxN7IKrYWzL07vLovYFLIxHJe5VyNJWy3fpd6Frs4
	Lza5FjFQtqkXC0W7R8PYycWafByFpsLjrO5xVRgD9jt7k1orOTKghIbjj5qwG+w1NOD+fe/LGocbv
	+yGFeIy7MuC8+yBhIOMNCUhpZHgiTNDmDoELX5PDyT1EENY5H1KdjfZgOlJJnEUk/wR+3c3ChhBKu
	Yky966dBth1FsF/zeBrim9wSAjP4PFB7Q27L8RVq0dP+xjz8bYEHNdhe+4mWz5mDg7vbV1PLqtsoM
	bJ5+VGDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ321-000iPr-UI; Thu, 09 Feb 2023 09:15:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ31m-000iJ4-Gz; Thu, 09 Feb 2023 09:15:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9E48966020B9;
	Thu,  9 Feb 2023 09:15:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675934137;
	bh=8edIGnmtJ1NrcW68pSHJQfhqO7Od8cz1RPWn+l0cH7g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e/Ni+IP7bUf1+wNovwd5vyh4UKNhtU+KHCLfOlNd4MqQoE7qe1vzU3cT6UBUHklbK
	 0Wgwaea/4bQV139qiPB4PxTFgoEf8PVHzpNJkKztb5sdcSAOTmxs5kturOk/S211Uc
	 4DImxXdQqRJbFFc4vfuBd8R88sTPfi9XvNOxKrSZQDjGAMV6WwoaFAJFC2eILgj+0Z
	 aiQk/SHHPVqqd2C4c1hVyMZ2xS1d1u8JB2MZHe3nbHG5Nf7UywFprjykJ/tt1n3FHJ
	 A10ciIkixCQKUYrGnylx90tXmvZVh431qQEuDciYH2s1g4tZBykE6KClzguv8fUAiG
	 DLMJNWWa01NzQ==
Message-ID: <0faf89cb-4709-17c9-0d67-da7ef2ddb7e6@collabora.com>
Date: Thu, 9 Feb 2023 10:15:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/9] dt-bindings: gpu: mali-bifrost: Don't allow
 sram-supply by default
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: airlied@gmail.com, tomeu.vizoso@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
 <20230208103709.116896-2-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Gm=Onu2RK+skLgN4Kzo9yP1n5Zb48oQNkQ019838QeEQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Gm=Onu2RK+skLgN4Kzo9yP1n5Zb48oQNkQ019838QeEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_011538_721294_19D7D0BE 
X-CRM114-Status: GOOD (  26.69  )
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

Il 09/02/23 03:50, Chen-Yu Tsai ha scritto:
> On Wed, Feb 8, 2023 at 6:37 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> The sram-supply is MediaTek-specific, it is and will ever be used
>> only for the mediatek,mt8183-mali compatible due to the addition of
>> the mediatek-regulator-coupler driver: change the binding to add
>> this supply when mediatek,mt8183-mali is present as a compatible
>> instead of disabling it when not present.
>>
>> This is done in preparation for adding new bindings for other
>> MediaTek SoCs, such as MT8192 and others.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> index 78964c140b46..69212f3b1328 100644
>> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> @@ -57,8 +57,6 @@ properties:
>>
>>     mali-supply: true
>>
>> -  sram-supply: true
>> -
> 
> Have you tried actually validating the device trees against this?
> Based on my previous tests this gives out errors.

I did... and I didn't get any complaint... but perhaps something went wrong
on my side?

I mean, I can retry just to be sure.

> 
> The reason is that each conditional is a separate sub-schema, and the
> validator is run against each schema and sub-schema separately, instead
> of collapsing matching schemas and sub-schemas together and validating
> once. So we'll get a validation error on sram-supply not being a valid
> property when validating current mt8183 against the base schema.
> 
> We have a similar issue with power-domain-names, for which I'll send
> a patch to fix. See the following for the fix:
> 
>      http://git.kernel.org/wens/c/d1adb38ab2ad0442755607c2bcc726cc17cce2c7
> 
> and the following for what I did for MT8192 on top of the previous patch:
> 
>      http://git.kernel.org/wens/c/049bd164884398d7e5f72c710da6aaa9a95bc10a
> 

Thanks for the pointer, btw

Cheers,
Angelo

> 
> Regards
> ChenYu
> 
>>     operating-points-v2: true
>>
>>     power-domains:
>> @@ -157,6 +155,7 @@ allOf:
>>               - const: core0
>>               - const: core1
>>               - const: core2
>> +        sram-supply: true
>>
>>         required:
>>           - sram-supply
>> @@ -166,7 +165,6 @@ allOf:
>>         properties:
>>           power-domains:
>>             maxItems: 1
>> -        sram-supply: false
>>     - if:
>>         properties:
>>           compatible:
>> --
>> 2.39.1
>>




