Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5893CF0449
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 10:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjAAwWTaX0P3nLCK47taHkppYN1/aukhgFiFLehsP50=; b=g3YHpeZHB3nDB94CX03Im31XPf
	vz1UhnNl2arTOucQMslpBw5Xw/+nJeD1Tbn6BBgln+yEnwtXn8kJO5UY03AgUz0ssExpO34kDY7Ed
	Z/An3v0zkrLylE//pg5RE1ZPGnY5W3TF+QwnkF6FmpY07ao6SrJUA8AL3p+2IHu4GOY4Vj9+7vKki
	RMiBl/dESYm9W0TkKUoA3wC1B+HXZqPUSgJE77Vg/7882fyDrDO8S50ML3IMhjLjPtNLwiTM6/6Au
	ngh/0BNZGdVOhxcuaKZg9hd21Br25aR/x1sE4T2d7hMuhw/lOHTaaxp71w190mI8Ng7aT7+K2+UBQ
	r13df6Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syTsR-00000008s9e-2UIN;
	Wed, 09 Oct 2024 10:25:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syTl2-00000008qbO-1zOB;
	Wed, 09 Oct 2024 10:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728469046;
	bh=bbq465Lr8bF4LJTB3VozOip+eGyEl98TmJOQiFaPP9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dMiGuOrCnWmurk2EXJ/dsGkp9OQaPgev161HD/VwTgyh3LqXmxCBXoLgBsxmNoCer
	 NLXOwzpixc8s4AotoOk8DEtIocIfDl4wCF9wMR04IUWUTAlFion9CMBhDHZBPmzou6
	 0TRH6/TOJZTB+rzemzj6ZFdKzabX286TSluSnGrZNsGuDaKrswP2BmTT1DiruMoZfH
	 KZHGJ6CfSRkrYH7Evu6NuoK7TctMqXp7BTGFG56dWnQ5UKbcxc9Cl4GSCmJ6tMj/dq
	 4tpUNm2WFXfML3n6JXtK4X/+7hgcJyBMqMtbBiKlpl8S9hlPJxzFadbGunXvAZy3pj
	 lf0Oeu2axsC2A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E59417E1034;
	Wed,  9 Oct 2024 12:17:26 +0200 (CEST)
Message-ID: <e0de3810-38b0-40a3-872d-678e9d4f72e5@collabora.com>
Date: Wed, 9 Oct 2024 12:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: mfd: mediatek: mt6397: Add start-year
 property to RTC
To: Lee Jones <lee@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, eddie.huang@mediatek.com, sean.wang@mediatek.com,
 alexandre.belloni@bootlin.com, sen.chu@mediatek.com,
 macpaul.lin@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
 kernel@collabora.com
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
 <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
 <20241009101549.GB276481@google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241009101549.GB276481@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_031728_699248_4F1A1C62 
X-CRM114-Status: GOOD (  11.85  )
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

Il 09/10/24 12:15, Lee Jones ha scritto:
> On Mon, 23 Sep 2024, AngeloGioacchino Del Regno wrote:
> 
>> Enable evaluating the start-year property to allow shifting the
>> RTC's HW range.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 2 ++
> 
> No such file.
> 

In the cover letter, I wrote:


For the bindings commit, this series goes on top of the MT6397 schema
conversion from Macpaul Lin [1].

This series was tested on a MT8195 Cherry Tomato Chromebook.

[1]: https://lore.kernel.org/all/20240918064955.6518-1-macpaul.lin@mediatek.com/


So, that's why. :-)

Cheers,
Angelo

>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
>> index 953358bc997a..a83cc35f51f1 100644
>> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
>> @@ -71,6 +71,8 @@ properties:
>>                     - mediatek,mt6366-rtc
>>                 - const: mediatek,mt6358-rtc
>>   
>> +      start-year: true
>> +
>>       required:
>>         - compatible
>>   
>> -- 
>> 2.46.0
>>
> 



