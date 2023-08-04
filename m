Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BD2C001DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 10:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVkevjgLKJdX0VCRq6KpM2D2Qs2qGi/DEgJ4jhB/jHk=; b=LG5Bjj0AQwowgUxuAd6ThkO4OA
	Ul9YhOwq7fv7WaNuur/hSf0N+jB+dO0oaS2FWzncxX2n3Np7vUXscBIhmCAZM5V2WHwj7/wjcN08Q
	Vv0u/tGoIFEw2LZIn/IMz4wOzTutEqJUxZLB22VxV13sBzlghA8qL0im3D95lEbhca6cpoqA26U97
	FiEXmEg1rjLKRtGg7vKb9LiMZW83NUoPAZtRMpZTGRwXuxN60jb+XIGBG5pxKNFwHBW5hi1DRgB5q
	nBuCpShFgd3MYu5jVqKf8Rp/7rZx6yWu0rUbY6Z27ZYE/c2lfXXwY7MFF+FdGWwKyWW5BQafqAawQ
	Y7vZpVWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRros-00C6aL-0t;
	Fri, 04 Aug 2023 10:14:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRron-00C6X7-01;
	Fri, 04 Aug 2023 10:14:02 +0000
Received: from [172.20.10.2] (unknown [109.166.130.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F81466071B8;
	Fri,  4 Aug 2023 11:13:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691144036;
	bh=hS7YWcnN92FYtXKyQ1RLO7jd9siNhDVNuDoRtYpZ74E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RN/exLXaE1Jni0wv6/3rss5LlCLM1O4KjWR49EZ92Y3moIFbc18EOeMjuTZnAZIFI
	 NTBteC3IfJfzOsF3rkTgAaEMZrg5vuiI+1wFxqkMafv2IbJPe5HkTtNlDuZwW+Z75q
	 vbvJwif8j+VMyisMYnkb38C8v7t97MU5umsXrYO6mtWDw63fbGNrFgb+292aOVH6Xc
	 ygDFbjZWMu9QxIJvmN5BbtzO43iL8xKDZBWzRDtpZxVqeAo0RjD9TH8etfI6JOqRBd
	 hWLpc465ALMfYjt4R72V7PAItv0aUd4SELcHrCI9JGHP8u3MJi83+eTMdnLK/6SW3F
	 cJL3HZVlVn5gw==
Message-ID: <05133411-8486-a514-1e61-ab6aadd0f932@collabora.com>
Date: Fri, 4 Aug 2023 13:13:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 5/9] regulator: mt6358: fix and drop type prefix in MT6366
 regulator node names
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230803074249.3065586-1-wenst@chromium.org>
 <20230803074249.3065586-6-wenst@chromium.org>
 <06473794-8c9f-5c55-b14a-db326d4ab5e9@collabora.com>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <06473794-8c9f-5c55-b14a-db326d4ab5e9@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_031401_322420_93E8D36E 
X-CRM114-Status: GOOD (  17.88  )
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

Hi Chen-Yu,

On 8/3/23 12:01, AngeloGioacchino Del Regno wrote:
> Il 03/08/23 09:42, Chen-Yu Tsai ha scritto:
>> The new MT6366 binding does away with the type prefix ("buck_", "ldo_")
>> in the regulator node names. This better matches the PMIC pin names.
>> Remaining underscores in names are also replaced with hyphens.
>>
>> Drop the type prefixes and replace remaining underscores to match the
>> MT6366 binding.
>>
>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> There is *no upstream devicetree* using any of those names, as the first 
> devices
> that will use the MT6366 will be MT8186 Corsola, which are not 
> upstreamed yet.
> 
> This means that this commit does not break ABI, so, I agree - which 
> implies....
> 
> Reviewed-by: AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@collabora.com>
> 
> Cheers,
> Angelo
> 
>> ---
>>   drivers/regulator/mt6358-regulator.c | 70 ++++++++++++++--------------
>>   1 file changed, 35 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/regulator/mt6358-regulator.c 
>> b/drivers/regulator/mt6358-regulator.c
>> index 3cb2e6768e25..5a43a84c7a3e 100644
>> --- a/drivers/regulator/mt6358-regulator.c
>> +++ b/drivers/regulator/mt6358-regulator.c
>> @@ -536,68 +536,68 @@ static const struct mt6358_regulator_info 
>> mt6358_regulators[] = {
>>   /* The array is indexed by id(MT6366_ID_XXX) */
>>   static const struct mt6358_regulator_info mt6366_regulators[] = {
>> -    MT6366_BUCK("buck_vdram1", VDRAM1, 500000, 2087500, 12500,
>> +    MT6366_BUCK("vdram1", VDRAM1, 500000, 2087500, 12500,
>>               0x7f, MT6358_BUCK_VDRAM1_DBG0, 0x7f, 
>> MT6358_VDRAM1_ANA_CON0, 8),
>> -    MT6366_BUCK("buck_vcore", VCORE, 500000, 1293750, 6250,
>> +    MT6366_BUCK("vcore", VCORE, 500000, 1293750, 6250,
>>               0x7f, MT6358_BUCK_VCORE_DBG0, 0x7f, 
>> MT6358_VCORE_VGPU_ANA_CON0, 1),
>> -    MT6366_BUCK("buck_vpa", VPA, 500000, 3650000, 50000,
>> +    MT6366_BUCK("vpa", VPA, 500000, 3650000, 50000,
>>               0x3f, MT6358_BUCK_VPA_DBG0, 0x3f, MT6358_VPA_ANA_CON0, 3),
>> -    MT6366_BUCK("buck_vproc11", VPROC11, 500000, 1293750, 6250,
>> +    MT6366_BUCK("vproc11", VPROC11, 500000, 1293750, 6250,
>>               0x7f, MT6358_BUCK_VPROC11_DBG0, 0x7f, 
>> MT6358_VPROC_ANA_CON0, 1),
>> -    MT6366_BUCK("buck_vproc12", VPROC12, 500000, 1293750, 6250,
>> +    MT6366_BUCK("vproc12", VPROC12, 500000, 1293750, 6250,
>>               0x7f, MT6358_BUCK_VPROC12_DBG0, 0x7f, 
>> MT6358_VPROC_ANA_CON0, 2),
>> -    MT6366_BUCK("buck_vgpu", VGPU, 500000, 1293750, 6250,
>> +    MT6366_BUCK("vgpu", VGPU, 500000, 1293750, 6250,
>>               0x7f, MT6358_BUCK_VGPU_ELR0, 0x7f, 
>> MT6358_VCORE_VGPU_ANA_CON0, 2),
>> -    MT6366_BUCK("buck_vs2", VS2, 500000, 2087500, 12500,
>> +    MT6366_BUCK("vs2", VS2, 500000, 2087500, 12500,
>>               0x7f, MT6358_BUCK_VS2_DBG0, 0x7f, MT6358_VS2_ANA_CON0, 8),
>> -    MT6366_BUCK("buck_vmodem", VMODEM, 500000, 1293750, 6250,
>> +    MT6366_BUCK("vmodem", VMODEM, 500000, 1293750, 6250,
>>               0x7f, MT6358_BUCK_VMODEM_DBG0, 0x7f, 
>> MT6358_VMODEM_ANA_CON0, 8),
>> -    MT6366_BUCK("buck_vs1", VS1, 1000000, 2587500, 12500,
>> +    MT6366_BUCK("vs1", VS1, 1000000, 2587500, 12500,
>>               0x7f, MT6358_BUCK_VS1_DBG0, 0x7f, MT6358_VS1_ANA_CON0, 8),
>> -    MT6366_REG_FIXED("ldo_vrf12", VRF12,
>> +    MT6366_REG_FIXED("vrf12", VRF12,
>>                MT6358_LDO_VRF12_CON0, 0, 1200000),
>> -    MT6366_REG_FIXED("ldo_vio18", VIO18,
>> +    MT6366_REG_FIXED("vio18", VIO18,
>>                MT6358_LDO_VIO18_CON0, 0, 1800000),
>> -    MT6366_REG_FIXED("ldo_vcn18", VCN18, MT6358_LDO_VCN18_CON0, 0, 
>> 1800000),
>> -    MT6366_REG_FIXED("ldo_vfe28", VFE28, MT6358_LDO_VFE28_CON0, 0, 
>> 2800000),
>> -    MT6366_REG_FIXED("ldo_vcn28", VCN28, MT6358_LDO_VCN28_CON0, 0, 
>> 2800000),
>> -    MT6366_REG_FIXED("ldo_vxo22", VXO22, MT6358_LDO_VXO22_CON0, 0, 
>> 2200000),
>> -    MT6366_REG_FIXED("ldo_vaux18", VAUX18,
>> +    MT6366_REG_FIXED("vcn18", VCN18, MT6358_LDO_VCN18_CON0, 0, 1800000),
>> +    MT6366_REG_FIXED("vfe28", VFE28, MT6358_LDO_VFE28_CON0, 0, 2800000),
>> +    MT6366_REG_FIXED("vcn28", VCN28, MT6358_LDO_VCN28_CON0, 0, 2800000),
>> +    MT6366_REG_FIXED("vxo22", VXO22, MT6358_LDO_VXO22_CON0, 0, 2200000),
>> +    MT6366_REG_FIXED("vaux18", VAUX18,
>>                MT6358_LDO_VAUX18_CON0, 0, 1800000),

The line being shorter, can't you compact them on a single line now ?
Here, and on other occasions in the changes you made.

Regards,

>> -    MT6366_REG_FIXED("ldo_vbif28", VBIF28,
>> +    MT6366_REG_FIXED("vbif28", VBIF28,
>>                MT6358_LDO_VBIF28_CON0, 0, 2800000),
>> -    MT6366_REG_FIXED("ldo_vio28", VIO28, MT6358_LDO_VIO28_CON0, 0, 
>> 2800000),
>> -    MT6366_REG_FIXED("ldo_va12", VA12, MT6358_LDO_VA12_CON0, 0, 
>> 1200000),
>> -    MT6366_REG_FIXED("ldo_vrf18", VRF18, MT6358_LDO_VRF18_CON0, 0, 
>> 1800000),
>> -    MT6366_REG_FIXED("ldo_vaud28", VAUD28,
>> +    MT6366_REG_FIXED("vio28", VIO28, MT6358_LDO_VIO28_CON0, 0, 2800000),
>> +    MT6366_REG_FIXED("va12", VA12, MT6358_LDO_VA12_CON0, 0, 1200000),
>> +    MT6366_REG_FIXED("vrf18", VRF18, MT6358_LDO_VRF18_CON0, 0, 1800000),
>> +    MT6366_REG_FIXED("vaud28", VAUD28,
>>                MT6358_LDO_VAUD28_CON0, 0, 2800000),
>> -    MT6366_LDO("ldo_vdram2", VDRAM2, vdram2,
>> +    MT6366_LDO("vdram2", VDRAM2, vdram2,
>>              MT6358_LDO_VDRAM2_CON0, 0, MT6358_LDO_VDRAM2_ELR0, 0x10),
>> -    MT6366_LDO("ldo_vsim1", VSIM1, vsim,
>> +    MT6366_LDO("vsim1", VSIM1, vsim,
>>              MT6358_LDO_VSIM1_CON0, 0, MT6358_VSIM1_ANA_CON0, 0xf00),
>> -    MT6366_LDO("ldo_vibr", VIBR, vibr,
>> +    MT6366_LDO("vibr", VIBR, vibr,
>>              MT6358_LDO_VIBR_CON0, 0, MT6358_VIBR_ANA_CON0, 0xf00),
>> -    MT6366_LDO("ldo_vusb", VUSB, vusb,
>> +    MT6366_LDO("vusb", VUSB, vusb,
>>              MT6358_LDO_VUSB_CON0_0, 0, MT6358_VUSB_ANA_CON0, 0x700),
>> -    MT6366_LDO("ldo_vefuse", VEFUSE, vefuse,
>> +    MT6366_LDO("vefuse", VEFUSE, vefuse,
>>              MT6358_LDO_VEFUSE_CON0, 0, MT6358_VEFUSE_ANA_CON0, 0xf00),
>> -    MT6366_LDO("ldo_vmch", VMCH, vmch_vemc,
>> +    MT6366_LDO("vmch", VMCH, vmch_vemc,
>>              MT6358_LDO_VMCH_CON0, 0, MT6358_VMCH_ANA_CON0, 0x700),
>> -    MT6366_LDO("ldo_vemc", VEMC, vmch_vemc,
>> +    MT6366_LDO("vemc", VEMC, vmch_vemc,
>>              MT6358_LDO_VEMC_CON0, 0, MT6358_VEMC_ANA_CON0, 0x700),
>> -    MT6366_LDO("ldo_vcn33", VCN33, vcn33,
>> +    MT6366_LDO("vcn33", VCN33, vcn33,
>>              MT6358_LDO_VCN33_CON0_0, 0, MT6358_VCN33_ANA_CON0, 0x300),
>> -    MT6366_LDO("ldo_vmc", VMC, vmc,
>> +    MT6366_LDO("vmc", VMC, vmc,
>>              MT6358_LDO_VMC_CON0, 0, MT6358_VMC_ANA_CON0, 0xf00),
>> -    MT6366_LDO("ldo_vsim2", VSIM2, vsim,
>> +    MT6366_LDO("vsim2", VSIM2, vsim,
>>              MT6358_LDO_VSIM2_CON0, 0, MT6358_VSIM2_ANA_CON0, 0xf00),
>> -    MT6366_LDO1("ldo_vsram_proc11", VSRAM_PROC11, 500000, 1293750, 6250,
>> +    MT6366_LDO1("vsram-proc11", VSRAM_PROC11, 500000, 1293750, 6250,
>>               MT6358_LDO_VSRAM_PROC11_DBG0, 0x7f00, 
>> MT6358_LDO_VSRAM_CON0, 0x7f),
>> -    MT6366_LDO1("ldo_vsram_others", VSRAM_OTHERS, 500000, 1293750, 6250,
>> +    MT6366_LDO1("vsram-others", VSRAM_OTHERS, 500000, 1293750, 6250,
>>               MT6358_LDO_VSRAM_OTHERS_DBG0, 0x7f00, 
>> MT6358_LDO_VSRAM_CON2, 0x7f),
>> -    MT6366_LDO1("ldo_vsram_gpu", VSRAM_GPU, 500000, 1293750, 6250,
>> +    MT6366_LDO1("vsram-gpu", VSRAM_GPU, 500000, 1293750, 6250,
>>               MT6358_LDO_VSRAM_GPU_DBG0, 0x7f00, 
>> MT6358_LDO_VSRAM_CON3, 0x7f),
>> -    MT6366_LDO1("ldo_vsram_proc12", VSRAM_PROC12, 500000, 1293750, 6250,
>> +    MT6366_LDO1("vsram-proc12", VSRAM_PROC12, 500000, 1293750, 6250,
>>               MT6358_LDO_VSRAM_PROC12_DBG0, 0x7f00, 
>> MT6358_LDO_VSRAM_CON1, 0x7f),
>>   };
> 
> 
> 


