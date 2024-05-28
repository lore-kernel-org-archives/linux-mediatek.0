Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B15C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 May 2024 10:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvCgPB2zM3TKOoYYGvVx3ZCoxZo2i5o2g3NV+tdRFks=; b=ErSOA0ap81exnT43y4es68XkCB
	F92g83PUDxTnAfQuLSh/jiySArdBaAWAN1/zTb5iHHqE/nN1Tkxs5ENZ58BosAH3kusXsuHGeinEA
	oesVOxrVzRzFwrzbLpDRFV4T8o6by48x7hW0HNypSyPe7VHsHHZ5VaZG9N28Gt7cNEGrAJVPnBc0Z
	kRYUB9S4ubj7/utb54izOMGpJDby9ye/xbnkENWnbbMTB3I8na5SjLs27ctNnQw4tJ6KCp1lT8Hsq
	ZgG2jQEfgrq9B7XCLVuNqYr7BGXJJH+Zrbawaif5E3azbS/5UpksTAdVe+8p4VQchZFrqSWzkYEBU
	ws0/pTuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBuBu-00000000F8u-2524;
	Tue, 28 May 2024 10:36:26 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBuBq-00000000F6p-2h3n;
	Tue, 28 May 2024 10:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716892581;
	bh=b3vuLqhp0ef7XqKQvTQFMeMDrvPq6HyeO8+lLKTbJSY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LXFy8R1p8kuFePDa1i1nalhPAAsmqdiOx83mTVivtvHTODCspq5MRcKMfAOJHe0JH
	 /q52FTKniqX1aStX8z41RvLYwHIYSAcd5BWdp67QZ9TUpvjSMuppjeKG2oasRG0wS0
	 mcsIThu5QV71DxY3WLxzq4jtEU1Ic7DVAzrnEMNhscG2AcGGLRa5bCxriAp7wyQHB/
	 /ulZioTQ7rA4BDVec9qmHnYfkSJdKJVIKlfut4gHnDbGHSvMVCkPQL+sPs3lABckJ4
	 18NHPQmHSRqwipg/xsvqor+USo01QgaOJ9DZm5duWxbk/8TUCGIuFp6DGMBcP6Fr7W
	 6OLuvV386PnTw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 752583782113;
	Tue, 28 May 2024 10:36:20 +0000 (UTC)
Message-ID: <4715d477-5f66-47db-973f-af64a3009113@collabora.com>
Date: Tue, 28 May 2024 12:36:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: mediatek: mt8188: Add support for Mali
 GPU on Panfrost
To: Julien Panis <jpanis@baylibre.com>, linux-mediatek@lists.infradead.org
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, mandyjh.liu@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20240527093908.97574-1-angelogioacchino.delregno@collabora.com>
 <20240527093908.97574-6-angelogioacchino.delregno@collabora.com>
 <f553b3f2-d895-446a-a741-7a151ebeb3ed@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <f553b3f2-d895-446a-a741-7a151ebeb3ed@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_033622_837393_1AD67578 
X-CRM114-Status: GOOD (  15.06  )
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

Il 27/05/24 16:53, Julien Panis ha scritto:
> On 5/27/24 11:39, AngeloGioacchino Del Regno wrote:
>> Add the necessary OPP table for the GPU and also add a GPU node
>> to enable support for the Valhall-JM G57 MC3 found on this SoC,
>> using the Panfrost driver.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
> 
> [...]
> 
>> +        gpu: gpu@13000000 {
>> +            compatible = "mediatek,mt8188-mali", "arm,mali-valhall-jm";
>> +            reg = <0 0x13000000 0 0x4000>;
>> +
>> +            clocks = <&mfgcfg CLK_MFGCFG_BG3D>;
>> +            interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>;
>> +            interrupt-names = "job", "mmu", "gpu";
>> +            operating-points-v2 = <&gpu_opp_table>;
>> +            power-domains = <&spm MT8188_POWER_DOMAIN_MFG2>,
>> +                    <&spm MT8188_POWER_DOMAIN_MFG3>,
>> +                    <&spm MT8188_POWER_DOMAIN_MFG4>;
>> +            power-domain-names = "core0", "core1", "core2";
> 
> Hi Angelo,
> 
> I think you should add something like that here:
> #cooling-cells = <2>;
> (the warning is raised when I run 'make dtbs_check')
> 
> Julien
> 

I can either add it to a v2 of this series, or you can add it in your patch where
you're actually adding the thermal support.

I have no preferences about who adds it, and I agree that cooling-cells should
eventually get there, so I'll leave the choice to you :-)

Cheers,
Angelo

