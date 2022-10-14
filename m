Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505CBC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 07:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DrAVPRaCZYN7wA/ac2XFncNahmKnS11SkzlOabg0lM=; b=DRkofjoMFN4Q/mXVj/RCyN24DH
	O3lKDxboxjSePTOKXnDWWiA7kwY7eDUNdLjUPmGAJtDTnK4YFsXOcY5jMEyaWS9zhy87JpHEMyEq7
	nRE6vyWZlbHGqN0TU6E6BR0HNHaA08brai40HIXlTh23eTvtIVfE82Xyc4cRU1GO3Bp57aQzyLOm0
	ldhvFrL1vJnYHeha9V9lqOvFoBGYfbBGlwdxC2PMoT5+tFWMl2W22cXpnZL94+GEt/Fgfxp1THgm2
	ek50hQ1KCZT4zQF6xI52kOeS4SOpqspHgpCrCxwb/PcUbeodV39ViSWZA8zzW7PZrCF4YRtYjA63n
	U5tcxdNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojFER-00Dtxh-O2; Fri, 14 Oct 2022 07:35:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojFEG-00Dtuc-HU; Fri, 14 Oct 2022 07:35:38 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 84E7B6602331;
	Fri, 14 Oct 2022 08:35:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665732932;
	bh=tSXD9lC4lmzBzTd508v0re7W/dlGI2rWfX0PdDrA9IQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UpiHRazV8w0iYoVneXWhaonVxxKK5QquHlp8rFS1PKQ8p2sejYC1S4/cs6DzyWXqg
	 LEL4nbzGj5mhRzN9snpvfZqOpDUNOv2hCLJK98MeqNj8EZJMHDechSiVKHlrj+5A7i
	 3J2D7gwfrSs6MwtQKsvHz4LXuV+f6KYrpDPhbBUnovqsQHkaAB0pX4HhE63w24xqes
	 AGqM37qQuoifrrTq5JcSvbxH1WEnTuawBtr9Yy29yZ43KloJ8bt0Pb8Wq1ySf5AYvm
	 6hFqfYI58WYMZeAW6s1kqZm9VPoHjevaBY9rO0r2KTiJd4j8L/X5zygqwHNVRpyi59
	 ITmXcLAcHX23g==
Message-ID: <96ab6836-4650-ee53-a0c9-54b8328b8667@collabora.com>
Date: Fri, 14 Oct 2022 09:35:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 6/8] arm64: dts: mt2712-evb: Fix usb vbus regulators unit
 names
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, matthias.bgg@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sam.shih@mediatek.com, hanks.chen@mediatek.com, weiyi.lu@mediatek.com,
 zhiyong.tao@mediatek.com, andrew-sh.cheng@mediatek.com,
 viresh.kumar@linaro.org, fparent@baylibre.com, mars.cheng@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221013152212.416661-1-angelogioacchino.delregno@collabora.com>
 <20221013152212.416661-7-angelogioacchino.delregno@collabora.com>
 <3b7fc7414f282ca044c24dae280f9bc9533a5b7b.camel@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <3b7fc7414f282ca044c24dae280f9bc9533a5b7b.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_003536_823613_340A8F11 
X-CRM114-Status: GOOD (  14.17  )
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

Il 14/10/22 04:43, Chunfeng Yun ha scritto:
> On Thu, 2022-10-13 at 17:22 +0200, AngeloGioacchino Del Regno wrote:
>> Update the names to regulator-usb-p{0-3}-vbus to fix
>> unit_address_vs_reg
>> warnings for those.
>>
>> Fixes: 1724f4cc5133 ("arm64: dts: Add USB3 related nodes for MT2712")
>> Signed-off-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt2712-evb.dts | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
>> b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
>> index 638908773706..d31a194124c9 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
>> @@ -50,7 +50,7 @@ extcon_usb1: extcon_iddig1 {
>>   		id-gpio = <&pio 14 GPIO_ACTIVE_HIGH>;
>>   	};
>>   
>> -	usb_p0_vbus: regulator@2 {
>> +	usb_p0_vbus: regulator-usb-p0-vbus {
> Can we modify dt-binding of fixed regulator instead of changing the
> node name,
> since all nodes using fixed regulator may need be changed.
> 

These regulators have no MMIO, nor need any index, so it would be simply
wrong to change the binding and leave them as they are here in the devicetree.

Regards,
Angelo

