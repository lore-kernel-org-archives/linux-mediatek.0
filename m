Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A3BC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 15:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PngETkAThC6ND/4r6BZ66+N0dqCyyHogUD7zS5SWgo=; b=zAojwyPKHEdt2OWQfWRRYjUA6F
	m1eQjSU1b7v44gMXwlQFjDcCjSj/VTNOeHFxr6Ag9m05A0Lv66h7y+55C8mpFmLPgHIEmUe2WXuwt
	jRq1327HnA5YzGj6MPDMGyjCMkuvFZTfd9aHR4akWMzy+VDhgAzOn9ItB8ImVNhznEGzA5C7bEmN+
	3+g7uVVP/fDN9wZ5IqoCrS8HwV6DPEzcpiy/HSV6xpXv2OLsCpCIymDoDp6AlQdWXylIFTWTZs3gN
	geMP73Bc67LjCqKpmb5qiEmVWgGskpyL3LRWwrMgk2eyBQpot/FjF/Ny++Tv6WqrxivUi7nq3ssJe
	IMFHy+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwH9-0000000Cig4-0lgj;
	Thu, 11 Apr 2024 15:23:43 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwH5-0000000CifD-0hdY;
	Thu, 11 Apr 2024 15:23:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712849017;
	bh=Izm5X0JHoxEV2++y1yn48NkTsf5UKs+w87DaG8fikmY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ori8kAhpjW95rzthQLl+EWqvlslOBuNBZGGCvI7aPQKBOndnzaByi/IbYumY+3GLz
	 d1QVR7lOi09WnHCCCF9r6ECF8dr/7rki3kJAocAoFWvgtIi5jpJNPdu79SkNJesgBn
	 qFMH4tMot6p2c4RdTeCEfMBjuLH5Pv1FdXiP37O5fu0JuL4FyaBfUMMgm+ziGllV8U
	 FXuxPlw3Wm3OBgG38+uNLpwc+p8UX62DpRU8QJ/HFBX5okjxbfx0JNjfpTK1Cj0QpE
	 BmWuh8yiSXLfkVNYncoChY3yKop9z3Dc2qRg1I5fRZzD58VuprZFWiO9r/3NHJ63xV
	 wGYku57T8cSCw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 46D783780C13;
	Thu, 11 Apr 2024 15:23:36 +0000 (UTC)
Message-ID: <229eeabc-7e70-4b09-997f-356e85e748dc@collabora.com>
Date: Thu, 11 Apr 2024 17:23:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] dt-bindings: ufs: mediatek,ufs: Document
 additional clocks
To: Conor Dooley <conor@kernel.org>
Cc: linux-scsi@vger.kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
 bvanassche@acm.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, peter.wang@mediatek.com, chu.stanley@gmail.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, lgirdwood@gmail.com,
 broonie@kernel.org, matthias.bgg@gmail.com, stanley.chu@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20240411114300.169055-1-angelogioacchino.delregno@collabora.com>
 <20240411114300.169055-8-angelogioacchino.delregno@collabora.com>
 <20240411-filth-trekker-8a8c185d589b@spud>
 <f7fcbae7-fd54-4ad5-8dc6-4deb80088b79@collabora.com>
 <20240411-curvy-satirical-8c50cf79d703@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240411-curvy-satirical-8c50cf79d703@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_082339_383436_9BE5A603 
X-CRM114-Status: GOOD (  18.00  )
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

Il 11/04/24 17:18, Conor Dooley ha scritto:
> On Thu, Apr 11, 2024 at 05:14:34PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 11/04/24 17:10, Conor Dooley ha scritto:
>>> On Thu, Apr 11, 2024 at 01:42:59PM +0200, AngeloGioacchino Del Regno wrote:
>>>> Add additional clocks, used on all MediaTek SoCs' UFSHCI controllers:
>>>
>>> I appreciate being told they're on all, rather than it being unsaid and
>>> having to ask.
>>>
>>
>> You're welcome :-)
>>
>>>> some of these clocks are optional and used only for scaling purposes
>>>> to save power, or to improve performance in the case of the crypt
>>>> clocks.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    .../devicetree/bindings/ufs/mediatek,ufs.yaml      | 14 +++++++++++++-
>>>>    1 file changed, 13 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
>>>> index e2c276da3f2c..21b038db100c 100644
>>>> --- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
>>>> +++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
>>>> @@ -26,11 +26,23 @@ properties:
>>>>              - const: mediatek,mt8183-ufshci
>>>>      clocks:
>>>> -    maxItems: 1
>>>> +    minItems: 1
>>>
>>> Could you add an itemised list to the clocks property please?
>>>
>>
>> Not really... Honestly, I'm not confident that the description will be 100%
>> correct for all of them... can we do that at a later time, when I will be
>> really that much confident in writing down a proper description for each
>> of them?
>>
>> The only thing that I'm really sure of is exactly what I wrote in this commit,
>> nothing less, nothing more... for now :')
> 
> fwiw, my motivation here was a better explanation for what "ufs" means
> as a clock. When the block has some "ufs" clock and a "axi" clock it's
> kinda clear what they do, but with 7 ufs clocks now, it's not really
> clear what the bare "ufs" one actually does.
> 
> If you can't provide an itemised list, please set maxitems.
>   

Not exactly right now, as I said. I will set maxItems instead.

By the way, "ufs" == "core", I didn't want to rename that one to avoid
breaking changes, of course.


>>>>      clock-names:
>>>> +    minItems: 1
>>>>        items:
>>>>          - const: ufs
>>>> +      - const: ufs-aes
>>>
>>>
>>>> +      - const: ufs-tick
>>>> +      - const: unipro-sys
>>>> +      - const: unipro-tick
>>>> +      - const: ufs-sap
>>>> +      - const: ufs-tx-symbol
>>>> +      - const: ufs-rx-symbol
>>>> +      - const: ufs-mem
>>>> +      - const: crypt-mux
>>>> +      - const: crypt-lp
>>>> +      - const: crypt-perf
>>>>      phys:
>>>>        maxItems: 1
>>>> -- 
>>>> 2.44.0
>>>>
>>



