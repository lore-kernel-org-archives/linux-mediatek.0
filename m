Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F559C3DA59
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 09:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKe8vs0sSE7I1XYwH13hJ92Casj6y0v1MtE8TO6otA0=; b=TwBX9a/FaoBYvvqhvczIMU0OBq
	mHUqdnDSrPrAT3ZgsTQEjoteA3GybTSmq3qBC5s6kePaqc+LVUqdRS+Y8L4A5EiuXvOt3AXtd9nxh
	Osks19jBxnPr9Ac41YmhNxpk9Pe5npygfSRD/NfQkmsP5dVOMM6Ru+8kt1NlIItan8FYBZi8V+S/M
	aATWNKY+u9zLahVyOL5eRUGGCYR1ptE2EHqGIvCpty4hdXyEBfOH/FV67Xd3PlEpW9S6nJi9Zg1K4
	GeYDukbInLtxrByadjF2QryKDCHwLOGnhhWK1PtIQymIUE4P7VYj2jz3o8UeAmcsD5bu7CGPdkmAy
	C0BwzoIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVp4d-00000008zcs-22sE;
	Mon, 22 Jul 2024 09:11:15 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVp3z-00000008zPh-1PEv;
	Mon, 22 Jul 2024 09:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721639432;
	bh=0y+SSd3HzuVB5A6DL6ENAzZ5/ElbVtDZp3b9VkjVamI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=2VGLy/jK8YVxqbFJktL3gY9D52LdEm31BRANHinVSGUKuJNyWn5MFnI57uXDPK4ML
	 i8xFgjrLxYfKcEKOm0Y3+BSgbvhvrT2w2hQbZGMV10FtS+3PXEvVyn8ELtzQ3AVknF
	 TAZ3DiXaVYdoDpMiIRPWN3Z7EXL+mrrCyAJosPNBrTWnqvDIS9OBBjxmlV6a2GnWQy
	 dsBlDwlIvONpdj0C8LMokb2LxFBTrPq0kwJ3xaDCwGeoRJ+BhAOwm9Q+3Rtu35eXP9
	 mqurhhY8ZpB983rjUR1WE27dH2gDOPxte2afuhHR9jm0RB8fBCeuIaSIjQbNgQn24c
	 P4BxqVotUui/g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6FF0237800DE;
	Mon, 22 Jul 2024 09:10:31 +0000 (UTC)
Message-ID: <d39045cf-bcf5-4d9a-8347-752ff09ccc24@collabora.com>
Date: Mon, 22 Jul 2024 11:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186-corsola: Update ADSP
 reserved memory region
To: Fei Shao <fshao@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240719045823.3264974-1-fshao@chromium.org>
 <7edb3361-9e53-44ad-82ec-b2c81834b2ea@collabora.com>
 <CAC=S1nh0c4HL2uUcz_zMmtuJvk7+3iWT5mEtmtpDrp1+nWp2cQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAC=S1nh0c4HL2uUcz_zMmtuJvk7+3iWT5mEtmtpDrp1+nWp2cQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_021035_706962_86747393 
X-CRM114-Status: GOOD (  15.63  )
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

Il 22/07/24 05:37, Fei Shao ha scritto:
> On Fri, Jul 19, 2024 at 5:22 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 19/07/24 06:58, Fei Shao ha scritto:
>>> Corsola firmware reserves the memory region of [0x60000000, 0x61100000)
>>
>> Sorry but if the region is supposed to be 0x1100000 long....
>>
>>> exclusively for ADSP usage.
>>> But in fact, a 6 MB "hole" of [0x60A00000, 0x61000000) didn't get
>>> assigned to the ADSP node in the Corsola device tree, meaning no audio
>>> tasks can access and utilize that memory section.
>>>
>>> Update the reserved ADSP memory region to fill the gap.
>>>
>>> Fixes: 8855d01fb81f ("arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel / Tentacool")
>>> Signed-off-by: Fei Shao <fshao@chromium.org>
>>> ---
>>>
>>>    arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
>>> index afdab5724eaa..0c4a26117428 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
>>> @@ -169,7 +169,7 @@ adsp_dma_mem: memory@61000000 {
>>>
>>>                adsp_mem: memory@60000000 {
>>>                        compatible = "shared-dma-pool";
>>> -                     reg = <0 0x60000000 0 0xA00000>;
>>> +                     reg = <0 0x60000000 0 0x1000000>;
>>
>> ...why are you making it 0x1000000 long?
> 
> Because 0x61000000-0x61100000 belongs to another existing region,
> `adsp_dma_mem`.
> It's slightly confusing because the diff doesn't show that directly...
> here's its snippet for ref:
> 

Oh, sorry about that, that's right.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> adsp_dma_mem: memory@61000000 {
>          compatible = "shared-dma-pool";
>          reg = <0 0x61000000 0 0x100000>;
>          no-map;
> };
> 
> Regards,
> Fei
>>
>> Cheers,
>> Angelo
>>
>>>                        no-map;
>>>                };
>>>
>>
>>


