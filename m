Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3B9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 12:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oltRSjMR69f9fywDG2E1kt5e9MYb40PdNZXvCD+bupY=; b=gX5UvfXpfeh+yVl+C+vBVc49WB
	PojCK+uF4tj8/jWOWELKrr65Y0VSPo7BQ59K5kueDAztWYb2BzxOuYGTf37tUTywd0A0j1y/krVBu
	x+Qwm0dsN6f5Rj6nZvpkVMg20MpYHBD2zYD7gGwH6ZI2ad8P7b4lxJio+ln0xjLwqnkGVhoLrRuO9
	dTb3cacPbAJnQnHoJnuQHuQS2HxSFGc/YM8nZMzv6rMhj5kORnxiypPyqn6g4rUeDVqWtjK47L95G
	9s66h9UeBWsYulK34y831djofpZw/5Gnd2Krzbavq9QXJiS8DCzvk+ySKsQm7C+0WoFU/oUXFaBVB
	vpFGfiOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1S8Y-00ESof-Rn; Wed, 15 Jun 2022 12:28:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1S8N-00ESkp-39; Wed, 15 Jun 2022 12:28:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C559266016CB;
	Wed, 15 Jun 2022 13:28:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655296105;
	bh=4nU9NX8b9cZ1xmaDRmhjERV+Ti0iFHjk5ZJ4I5OHFKg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e5N5JyBggQ4zs0Fz6xkG5P2lTO0eO/wPkxz+z/OFofBarb38HNedfhq9yqtAGVf9l
	 0PUw9XO54LL0vF86XTinY+iAdtn0vk4Cog3WIh1GyrpJhL0kBf4f/JrH+vE8vJMuri
	 pL/55G3lZaHGC1ajx5gZtMmsLmHpwR2on5Znu0b6mjMQfw8tJamf5lPTj/n2ixxjGk
	 hVpxxfdyYxchxSCViNHYe/Kqhx1sSLwsAkfZyrJXGAGPpd5IG6TM/0O7yeZPiVNgvA
	 ms0JorOxWEy7yJA9A1FBIPkfTl/hfpPIPWev17eGOBt0zC3COek5AMRUVVVWrKGXb3
	 W0fO4VBtVmmyA==
Message-ID: <e4a2c56e-8e38-b44c-04b4-fd792fbf2f74@collabora.com>
Date: Wed, 15 Jun 2022 14:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 6/6] iommu: mtk_iommu: Lookup phandle to retrieve
 syscon to pericfg
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>, yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski@linaro.org
References: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com>
 <20220609100802.54513-7-angelogioacchino.delregno@collabora.com>
 <8b31b1d2-4ed7-11a1-2124-4641c8f3abcd@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <8b31b1d2-4ed7-11a1-2124-4641c8f3abcd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_052831_523649_E10939DA 
X-CRM114-Status: GOOD (  32.94  )
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

Il 15/06/22 14:09, Matthias Brugger ha scritto:
> 
> 
> On 09/06/2022 12:08, AngeloGioacchino Del Regno wrote:
>> On some SoCs (of which only MT8195 is supported at the time of writing),
>> the "R" and "W" (I/O) enable bits for the IOMMUs are in the pericfg_ao
>> register space and not in the IOMMU space: as it happened already with
>> infracfg, it is expected that this list will grow.
>>
>> Instead of specifying pericfg compatibles on a per-SoC basis, following
>> what was done with infracfg, let's lookup the syscon by phandle instead.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/iommu/mtk_iommu.c | 23 +++++++++++++----------
>>   1 file changed, 13 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
>> index 90685946fcbe..0ea0848581e9 100644
>> --- a/drivers/iommu/mtk_iommu.c
>> +++ b/drivers/iommu/mtk_iommu.c
>> @@ -138,6 +138,8 @@
>>   /* PM and clock always on. e.g. infra iommu */
>>   #define PM_CLK_AO            BIT(15)
>>   #define IFA_IOMMU_PCIE_SUPPORT        BIT(16)
>> +/* IOMMU I/O (r/w) is enabled using PERICFG_IOMMU_1 register */
>> +#define HAS_PERI_IOMMU1_REG        BIT(17)
> 
>  From what I can see MTK_IOMMU_TYPE_INFRA is only set in MT8195 which uses pericfg. 
> So we don't need a new flag here. For me the flag name MTK_IOMMU_TYPE_INFRA was 
> confusing as it has nothing to do with the use of infracfg. I'll hijack this patch 
> to provide some feedback on the actual code, please see below.
> 
>>   #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)    \
>>                   ((((pdata)->flags) & (mask)) == (_x))
>> @@ -187,7 +189,6 @@ struct mtk_iommu_plat_data {
>>       u32            flags;
>>       u32            inv_sel_reg;
>> -    char            *pericfg_comp_str;
>>       struct list_head    *hw_list;
>>       unsigned int        iova_region_nr;
>>       const struct mtk_iommu_iova_region    *iova_region;
>> @@ -1218,14 +1219,16 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>>               goto out_runtime_disable;
>>           }
>>       } else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA) &&
>> -           data->plat_data->pericfg_comp_str) {
> 
> Check for pericfg_comp_str is not needed, we only have one platform that uses 
> MTK_IOMMU_TYPE_INFRA.
> 

Fair enough. I agree.

>> -        infracfg = 
>> syscon_regmap_lookup_by_compatible(data->plat_data->pericfg_comp_str);
> 
> We can do something like this to make the code clearer:
> data->pericfg = syscon_regmap_lookup_by_compatible(data->plat_data->pericfg_comp_str);
>          if (IS_ERR(data->pericfg)) {
> 
> Using infracfg variable here is confusing as it has nothing to do with infracfg 
> used with HAS_4GB_MODE flag.

Yes Matthias, using the infracfg variable is confusing - that's why I changed that
already....

> 
> Regards,
> Matthias
> 
>> -        if (IS_ERR(infracfg)) {
>> -            ret = PTR_ERR(infracfg);
>> -            goto out_runtime_disable;
>> +           MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_PERI_IOMMU1_REG)) {



>> +        data->pericfg = syscon_regmap_lookup_by_phandle(dev->of_node, 
>> "mediatek,pericfg");

....Here, where I'm assigning directly to data->pericfg :-P

By the way, since it was only about one platform, my intention was to remove the
pericfg_comp_str from struct iommu_plat_data (as you can see), but then, with the
current code, I had to assign .....


>> +        if (IS_ERR(data->pericfg)) {
>> +            p = "mediatek,mt8195-pericfg_ao";

...the string to 'p', because otherwise it would go over 100 columns.

In any case, I just checked and, apparently, MT8195 is really the one and only SoC
that needs this pericfg register to be managed by Linux... even the latest and
greatest smartphone chip (Dimensity 9000, MT6983) doesn't need this (at least,
from what I can read on a downstream kernel).

On an afterthought, perhaps the best idea is to just leave this as it is and, as
you proposed, avoid using that confusing infracfg variable, without adding the
pericfg handle at all.

After all, it's just one single SoC.

I'll send a new version soon!

Cheers,
Angelo


