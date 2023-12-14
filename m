Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9587C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Dec 2023 10:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4dfAw7rocDw5DM5kaVAxAIqErCTl60iolnNM1WzMyw=; b=bZYbzU8W6wiylWbbJgmQarDgyS
	mVV8YBLrJfjqZA4kuaItwt0dAwFqqRrORUBUnjQvhessKJo6tfn4WmDLQV+YVgSqG46ukPcGYRxuP
	D8HXQ35Qw/zPn6TavHvf6U/meaXCjWewxVDvOhbTTR+4jtqyKf9YX72DOl6Qa/GBilhywwiH+SstE
	xclPIyXy60oGN7KGzhdevAecrefG5dlybZs9dDrZXb72mMupt9HALgSJ/BlBuXSpoL6casrK445SR
	uZIN++I7ru0sl+elfvRBRNTVy7aBGaiZ3sLJ3MnzVrerHAcFrMi7Y7P7edUk00X8aF8qeJRT8PUMa
	Y4HDZoVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDjKp-00HXTw-2k;
	Thu, 14 Dec 2023 10:52:55 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDjKm-00HXRo-0O;
	Thu, 14 Dec 2023 10:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702551170;
	bh=KdM45sfm+eGY9YVK/KcmBv13GTLPFxIxJQNtxyNWCQ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CRok9X898ifzj+gS0bQ0BbUWwVEM5h5smxro6yD4A9MBfRJO0u+hm5g44nXn1yV52
	 pvz2s3a7y/KyrRD6krcJlI+4XY4I0XMfqk62PnnQdOuSAIdpJ8YjHHD3nOAncDL6NA
	 FXnFJenJotgMWZhRp/KS9AXwov4hIrubEYZeyj6Zh4OVsCCLSU1+JTDUYlz9kHp0rQ
	 ZeWu9/Ul2TEB/Iv1fbyWfxBWOVEvFVZqhpMlkcoHy7m4fLmc4D0yavH9bHkmbvE0no
	 y12xcxWxrpP+G9VOb6FZX2UvISjRqbGfYqKyfSnLAbDrizKXmoobSmNcCNih9H3seh
	 t22nvFFr3rD+g==
Received: from [100.90.194.27] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 25516378000B;
	Thu, 14 Dec 2023 10:52:49 +0000 (UTC)
Message-ID: <952a01c3-1ca0-42f8-bdbe-ab8857e27dc4@collabora.com>
Date: Thu, 14 Dec 2023 12:52:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: mediatek: mt8186: Add venc node
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 matthias.bgg@gmail.com, Kyrie Wu <kyrie.wu@mediatek.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20231213122017.102100-1-eugen.hristev@collabora.com>
 <20231213122017.102100-4-eugen.hristev@collabora.com>
 <d20c35e2-cc40-436d-90ca-4cab555874ca@collabora.com>
 <ff4f8365-d329-422c-ae04-d39a26f27552@collabora.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <ff4f8365-d329-422c-ae04-d39a26f27552@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_025252_297642_53E70CFA 
X-CRM114-Status: GOOD (  16.35  )
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

On 12/14/23 12:50, AngeloGioacchino Del Regno wrote:
> Il 14/12/23 11:44, AngeloGioacchino Del Regno ha scritto:
>> Il 13/12/23 13:20, Eugen Hristev ha scritto:
>>> From: Kyrie Wu <kyrie.wu@mediatek.com>
>>>
>>> Add video encoder node.
>>>
>>> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
>>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
>>> [eugen.hristev@collabora.com: minor cleanup]
>>> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
>>> ---
>>>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 24 ++++++++++++++++++++++++
>>>   1 file changed, 24 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi 
>>> b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
>>> index 66ead3f23336..8535ff2b44e9 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
>>> @@ -1993,6 +1993,30 @@ larb7: smi@17010000 {
>>>               power-domains = <&spm MT8186_POWER_DOMAIN_VENC>;
>>>           };
>>> +        venc: venc@17020000 {
>>> +            compatible = "mediatek,mt8183-vcodec-enc";
> 
> Sorry for the double email;
> 
> I've just noticed: where's mediatek,mt8186-vcodec-enc? :-)

Hi,

There is none.
This just works exactly as mt8183, thus reusing the same compatible.

Do you want a new dedicated mt8186 compatible as well for the situation *just in
case* some specific difference showing up later ?

Eugen

> 
>>> +            #address-cells = <2>;
>>> +            #size-cells = <2>;
>>> +            reg = <0 0x17020000 0 0x2000>;
>>> +            interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH 0>;
>>> +            iommus = <&iommu_mm IOMMU_PORT_L7_VENC_RCPU>,
>>> +                 <&iommu_mm IOMMU_PORT_L7_VENC_REC>,
>>> +                 <&iommu_mm IOMMU_PORT_L7_VENC_BSDMA>,
>>> +                 <&iommu_mm IOMMU_PORT_L7_VENC_SV_COMV>,
>>> +                 <&iommu_mm IOMMU_PORT_L7_VENC_RD_COMV>,
>>> +                 <&iommu_mm IOMMU_PORT_L7_VENC_CUR_LUMA>,
>>> +                 <&iommu_mm IOMMU_PORT_L7_VENC_CUR_CHROMA>,
>>> +                 <&iommu_mm IOMMU_PORT_L7_VENC_REF_LUMA>,
>>> +                 <&iommu_mm IOMMU_PORT_L7_VENC_REF_CHROMA>;
>>> +            dma-ranges = <0x1 0x0 0x1 0x0 0x1 0x0>;
>>> +            mediatek,scp = <&scp>;
>>> +            clocks = <&vencsys CLK_VENC_CKE1_VENC>;
>>> +            clock-names = "MT_CG_VENC";
>>
>> clock-names = "venc"; (please no underscores and please lower case)
>>
>>> +            assigned-clocks = <&topckgen CLK_TOP_VENC>;
>>> +            assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D3>;
>>> +            power-domains = <&spm MT8186_POWER_DOMAIN_VENC>;
>>> +        };
>>
>>
>> ....also:
>>
>> The following order of properties in device nodes is preferred:
>>
>> 1. "compatible"
>> 2. "reg"
>> 3. "ranges"
>> 4. Standard/common properties (defined by common bindings, e.g. without
>>     vendor-prefixes)
>> 5. Vendor-specific properties
>> 6. "status" (if applicable)
>> 7. Child nodes, where each node is preceded with a blank line
>>
>> Documentation/devicetree/bindings/dts-coding-style.rst
>>
>> Please reorder as per the DTS coding style document, and also please rename the
>> venc node to use a generic name, such as "video-encoder@xxxx"
>>
>> Cheers,
>> Angelo
> 
> 
> _______________________________________________
> Kernel mailing list -- kernel@mailman.collabora.com
> To unsubscribe send an email to kernel-leave@mailman.collabora.com


