Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB10C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 08:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTNkzd98m8basWiaAvcRIDnLNzTPaozHFodvd+MEWy0=; b=5FXvorhWyvfE8BuKMhwxLMfX3m
	4ZTWMJ7UQvRXwKTiYxJkHjw8VVadDtKFATQGRJ9F/TLsrYl8yMjLDde/IH26KSOQGhQpwjZZ7ODpg
	F/lHbHS5lr6TtlFrScCj35sgLEGwsv+YmyohdTMqYgRDVdGo0S77RD3KaSxbNThaGxFL5sv9a/4Fg
	eUstKfqi3CkjOAAycs5zqHmyw05JJE6VuUVyCqtEkAzrSIzNiRNKAFyiR5SYmo2Uydp2AW5UYyqrq
	KdMVXGdwWaA1O3Xxmb3Hfsy+BBtH6br6snz0eFVCqW4YLn5WBUW8XPWamRc9ZbYRqOQ7uYseLAsMX
	NOBqfrfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Hsu-006CtD-Sn; Mon, 04 Jul 2022 08:56:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Hsj-006Clq-38; Mon, 04 Jul 2022 08:56:38 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 130D966015BA;
	Mon,  4 Jul 2022 09:56:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656924993;
	bh=h88dIXJoIJXAQxMuEMOCRNyb0NRHhhEuFsKWrKzCZ3k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ddINcCtt3FLR1cEjg2qYn/7puGj6dmBsZ8y9bjU2xY9P2Y7mN6NRJDgC3SINCsBKK
	 svw7V5vK7wmw6+aiYfNm/vnz3GAYvOKwImKXVTKAbPFbqJEChqA4Kol+l3aMcn16O2
	 5aGBYhqIenzshT1ysarDFRpioFSWuSONc0jDJuSaLMfaFMTKalbgKSDsNGzgmAmtAg
	 25iv2hyM0PcfC9twPBz2AjHG5bpAYZO+06lvNA3rqK0YcGlmAQmCfjAVf1cRUkkRig
	 YxxvZl1IAbLVf1BEZlSM6NeP0N+iaZ+0FW/NcmodvQeVjEfXTjbb+C/mH1H9J7OhFN
	 VbD3TYvj1BlVg==
Message-ID: <e846676e-11d7-1bdc-93e6-8999bb66b2a5@collabora.com>
Date: Mon, 4 Jul 2022 10:56:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 01/11] dt-bindings: arm: mediatek: Add MT8195 Cherry
 Tomato Chromebooks
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, hsinyi@chromium.org, allen-kh.cheng@mediatek.com,
 gtk3@inbox.ru, luca@z3ntu.xyz, sam.shih@mediatek.com,
 sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
 <20220630153316.308767-2-angelogioacchino.delregno@collabora.com>
 <20220701220402.v4g6u75mzptb2fly@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220701220402.v4g6u75mzptb2fly@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_015637_312585_156D5BAE 
X-CRM114-Status: GOOD (  19.38  )
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

Il 02/07/22 00:04, Nícolas F. R. A. Prado ha scritto:
> On Thu, Jun 30, 2022 at 05:33:06PM +0200, AngeloGioacchino Del Regno wrote:
>> Document board compatibles for the MT8195 Cherry platform's
>> Tomato Chromebooks, at the time of writing composed of four
>> revisions (r0, r1, r2, r3-r4).
> 
> Though r0 is not added in this series?
> 
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
>> index dd6c6e8011f9..3e0afa17ed2e 100644
>> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
>> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
>> @@ -144,6 +144,19 @@ properties:
>>             - const: google,spherion-rev0
>>             - const: google,spherion
>>             - const: mediatek,mt8192
> 
> Angelo, this patch is depending on the patch from the asurada-spherion series
> [1] to apply. Since this isn't the case for patch 2 as well, I assume this was
> a mistake. And it does seem better to keep them independent.

Yes, thanks for pointing that out - I forgot to advertise the dependency in the
cover letter.

Though, making this one independent from yours isn't really possible, as doing
that would ruin the ordering in mediatek.yaml.

I will advertise the dependency in v2.

Cheers,
Angelo

> 
> [1] https://lore.kernel.org/all/20220629155956.1138955-2-nfraprado@collabora.com/
> 
> Thanks,
> Nícolas
> 
>> +      - description: Google Tomato (Acer Chromebook Spin 513)
>> +        items:
>> +          - enum:
>> +              - google,tomato-rev2
>> +              - google,tomato-rev1
>> +          - const: google,tomato
>> +          - const: mediatek,mt8195
>> +      - description: Google Tomato (rev3 - 4)
>> +        items:
>> +          - const: google,tomato-rev4
>> +          - const: google,tomato-rev3
>> +          - const: google,tomato
>> +          - const: mediatek,mt8195
>>         - items:
>>             - enum:
>>                 - mediatek,mt8186-evb
>> -- 
>> 2.35.1
>>




