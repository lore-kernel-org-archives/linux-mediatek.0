Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CBDC25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 08:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmZOVj2C1Ffe1TNM3EeeAgzpm85PB2OnpVw2rWjFyvQ=; b=OpJQzb1jjGahzp6kFuGgg4UGS0
	NypHhx2fI+r3eIxPBStQAfNcDbz+laA3i/Vuut/sisr3kvwQSxaeiQShim1z6xyBoA9eipRUGy3Wh
	89KnnC/5zc6Uq9j6QcNc2qjVq6loRPxIIMfkf9P3HJG/L/95q+0kyTXytD4doOsFIIGiJDjugDmJ7
	O8n8/aN5s0+4cZ+iWGV0PJz+klzTVuZ5ywFLGPAO8pB5zavAkETfwtdiVF9KBpwXUfIFBcEaG/Eui
	QkTPJ0RlLEbMkPOLcD+4TXTOb9WoEwZA6oA9/oTPf5JzROfvRXZYXs8YWSRSDbghjkJWnpf+sc6+Y
	YWuSpfCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCETs-00000003KXX-0Lvf;
	Wed, 29 May 2024 08:16:20 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCETn-00000003KUz-2UcB;
	Wed, 29 May 2024 08:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716970574;
	bh=NossBFUePrMazFAKgjjMfOUHEJMJWXShxlLyz5wBKI0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=4RERYk7piKWvFu0rLdkPawUSh9EL+064G5LLBR/Bm3Ru0umirQVki1JwHoR0VDDc9
	 FJsU7WW+IqVqtd3aYz9AaQ6tKmyicatxe/LuHNTbh3XGoLAfdNFS0xkkro7xFJ9pP9
	 K+FScvAFSpPjWLCGGH5elG436C0vXHVNrIKIKqRkLwm2SdgkGy25K0yvVcokqzI73g
	 FVErGgj9p6nyN4murvDfMhPC64uYojGhOtYC7PhxrFD/bCLdzf0tiF0ufnzt/bwVdl
	 BcAsNDXe7BnMHuDKbwbm4+DXS1jGSYPzJ+oWATBUIkAXhRkAm1y8S2gTHKZbWSj+wC
	 bmhWSr5Gt5t2Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3D45E3780627;
	Wed, 29 May 2024 08:16:13 +0000 (UTC)
Message-ID: <fabdc840-ee5d-48b5-bb8a-f01d447604b9@collabora.com>
Date: Wed, 29 May 2024 10:16:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: mediatek: mt8188: Add support for Mali
 GPU on Panfrost
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 mandyjh.liu@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, jpanis@baylibre.com
References: <20240527093908.97574-1-angelogioacchino.delregno@collabora.com>
 <20240527093908.97574-6-angelogioacchino.delregno@collabora.com>
 <CAGXv+5EbYBLt84Gx0mhTt9SqH8iMW87Y=_q=R2sHmJ4fygUQnQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5EbYBLt84Gx0mhTt9SqH8iMW87Y=_q=R2sHmJ4fygUQnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_011615_835842_A6E10699 
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

Il 29/05/24 08:34, Chen-Yu Tsai ha scritto:
> On Mon, May 27, 2024 at 5:40 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Add the necessary OPP table for the GPU and also add a GPU node
>> to enable support for the Valhall-JM G57 MC3 found on this SoC,
>> using the Panfrost driver.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8188.dtsi | 123 +++++++++++++++++++++++
>>   1 file changed, 123 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
>> index 0bca6c9f15fe..29d012d28edb 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
>> @@ -294,6 +294,112 @@ clk32k: oscillator-32k {
>>                  clock-output-names = "clk32k";
>>          };
>>
>> +       gpu_opp_table: opp-table-gpu {
>> +               compatible = "operating-points-v2";
>> +               opp-shared;
>> +
>> +               opp-390000000 {
>> +                       opp-hz = /bits/ 64 <390000000>;
>> +                       opp-microvolt = <575000>;
>> +                       opp-supported-hw = <0xff>;
>> +               };
>> +               opp-431000000 {
>> +                       opp-hz = /bits/ 64 <431000000>;
>> +                       opp-microvolt = <587500>;
>> +                       opp-supported-hw = <0xff>;
>> +               };
>> +               opp-473000000 {
>> +                       opp-hz = /bits/ 64 <473000000>;
>> +                       opp-microvolt = <600000>;
>> +                       opp-supported-hw = <0xff>;
>> +               };
>> +               opp-515000000 {
>> +                       opp-hz = /bits/ 64 <515000000>;
>> +                       opp-microvolt = <612500>;
>> +                       opp-supported-hw = <0xff>;
>> +               };
>> +               opp-556000000 {
>> +                       opp-hz = /bits/ 64 <556000000>;
>> +                       opp-microvolt = <625000>;
>> +                       opp-supported-hw = <0xff>;
>> +               };
>> +               opp-598000000 {
>> +                       opp-hz = /bits/ 64 <598000000>;
>> +                       opp-microvolt = <637500>;
>> +                       opp-supported-hw = <0xff>;
>> +               };
>> +               opp-640000000 {
>> +                       opp-hz = /bits/ 64 <640000000>;
>> +                       opp-microvolt = <650000>;
>> +                       opp-supported-hw = <0xff>;
>> +               };
>> +               opp-670000000 {
>> +                       opp-hz = /bits/ 64 <670000000>;
>> +                       opp-microvolt = <662500>;
>> +                       opp-supported-hw = <0xff>;
>> +               };
>> +               opp-700000000 {
>> +                       opp-hz = /bits/ 64 <700000000>;
>> +                       opp-microvolt = <675000>;
>> +                       opp-supported-hw = <0xff>;
>> +               };
>> +               opp-730000000 {
>> +                       opp-hz = /bits/ 64 <730000000>;
>> +                       opp-microvolt = <687500>;
>> +                       opp-supported-hw = <0xff>;
>> +               };
>> +               opp-760000000 {
>> +                       opp-hz = /bits/ 64 <760000000>;
>> +                       opp-microvolt = <700000>;
>> +                       opp-supported-hw = <0xff>;
>> +               };
>> +               opp-790000000 {
>> +                       opp-hz = /bits/ 64 <790000000>;
>> +                       opp-microvolt = <712500>;
>> +                       opp-supported-hw = <0xff>;
>> +               };
>> +               opp-835000000 {
>> +                       opp-hz = /bits/ 64 <835000000>;
>> +                       opp-microvolt = <731250>;
>> +                       opp-supported-hw = <0xff>;
>> +               };
>> +               opp-880000000 {
>> +                       opp-hz = /bits/ 64 <880000000>;
>> +                       opp-microvolt = <750000>;
>> +                       opp-supported-hw = <0xff>;
>> +               };
>> +               opp-915000000 {
>> +                       opp-hz = /bits/ 64 <915000000>;
>> +                       opp-microvolt = <775000>;
>> +                       opp-supported-hw = <0x8f>;
>> +               };
>> +               opp-915000000-5 {
>> +                       opp-hz = /bits/ 64 <915000000>;
>> +                       opp-microvolt = <762500>;
>> +                       opp-supported-hw = <0x30>;
>> +               };
>> +               opp-915000000-6 {
>> +                       opp-hz = /bits/ 64 <915000000>;
>> +                       opp-microvolt = <750000>;
>> +                       opp-supported-hw = <0x70>;
>> +               };
>> +               opp-950000000 {
>> +                       opp-hz = /bits/ 64 <950000000>;
>> +                       opp-microvolt = <800000>;
>> +                       opp-supported-hw = <0x8f>;
>> +               };
>> +               opp-950000000-5 {
>> +                       opp-hz = /bits/ 64 <950000000>;
>> +                       opp-microvolt = <775000>;
>> +                       opp-supported-hw = <0x30>;
>> +               };
>> +               opp-950000000-6 {
>> +                       opp-hz = /bits/ 64 <950000000>;
>> +                       opp-microvolt = <750000>;
>> +                       opp-supported-hw = <0x70>;
>> +               };
>> +       };
>> +
>>          pmu-a55 {
>>                  compatible = "arm,cortex-a55-pmu";
>>                  interrupt-parent = <&gic>;
>> @@ -1167,6 +1273,23 @@ imp_iic_wrap_en: clock-controller@11ec2000 {
>>                          #clock-cells = <1>;
>>                  };
>>
>> +               gpu: gpu@13000000 {
>> +                       compatible = "mediatek,mt8188-mali", "arm,mali-valhall-jm";
>> +                       reg = <0 0x13000000 0 0x4000>;
>> +
>> +                       clocks = <&mfgcfg CLK_MFGCFG_BG3D>;
>> +                       interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                                    <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                                    <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                       interrupt-names = "job", "mmu", "gpu";
>> +                       operating-points-v2 = <&gpu_opp_table>;
>> +                       power-domains = <&spm MT8188_POWER_DOMAIN_MFG2>,
>> +                                       <&spm MT8188_POWER_DOMAIN_MFG3>,
>> +                                       <&spm MT8188_POWER_DOMAIN_MFG4>;
>> +                       power-domain-names = "core0", "core1", "core2";
>> +                       status = "disabled";
>> +               };
>> +
> 
> This block no longer applies cleanly on the MTK tree because of
> "arm64: dts: mediatek: mt8188: add lvts definitions" being applied.
> 

Thanks for checking - it's okay, it's about reordering the two series anyway.
This was sent to unblock Julien's work with LVTS sensors, and I was expecting
a new version of the patch that you just mentioned anyway.

So, the patch that is in the MediaTek trees will be replaced by his new ones ASAP
and merge issues will fly away, since Julien rebased his series on top of this.

Cheers!
Angelo

> ChenYu
> 
>>                  mfgcfg: clock-controller@13fbf000 {
>>                          compatible = "mediatek,mt8188-mfgcfg";
>>                          reg = <0 0x13fbf000 0 0x1000>;
>> --
>> 2.45.1
>>
>>




