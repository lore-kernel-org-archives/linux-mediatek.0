Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375F0C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 09:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djJyYhMtweSAWZJehV28U/bFM6BUId6M2WyOQj4IzjY=; b=zd22G8aklueBTMEnCKbfFQz/mZ
	XEK2xz8CGdfPOyPfo+h6R/Yz66/OL4N2TdHX9b0j0nXCaLCQm87sw0wlY3UnZ68RMDTFNX6RLdaap
	HezySdvvV8w4c6NiAoxdKXxXewdgtu5qtCcKwsdLqeMW2raWobmh/guUU7QY9GwP4rrnpL9Uzv2Hx
	Jbt6t3leWvQDpEbN4w7YYyEwY7OxaMUcSB4rcZSvxJm4QsuyR2TeQmoaAbEVHBKA6/96Hl8sHn9KX
	Fm0Q8UH8Qg9X+CY0urVcIwo+5pkVi9fd65L4b1xPic5J0rkqoroCeLMkYbrrOuOE3+G4FVtvW6HSs
	3EKmtucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZFC-002DEo-PD; Tue, 20 Sep 2022 09:08:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZ8j-00296j-Dj; Tue, 20 Sep 2022 09:02:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EFF556601F65;
	Tue, 20 Sep 2022 10:01:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663664519;
	bh=+3Eho6vznxN6lcZbJbVvkS5KJYsPvu5pctKzlZPKMUo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LJclHzWWXsCnozr4D6rWp6q57rPuakEPkNWPH4x5OppazabiA3wjTGmtPFWcgEgIj
	 GR4sP0iuussi0aap1SwEamN3AIHInnQt4Y1crvC44KcN+0rKVSTNkt68tCFtcAFgHP
	 HS3TRs3QGz4pde4u0r/jmuJIccKVgD1Y/4o3hls04T98y6fFdWjuThZAW7qN0rGcIc
	 OkU750ey5Tj9vwjKlDYO//swC6zIN/iq6EUNiD3n5mCmT6OWvc4/WLatlhkVtbeK+s
	 MqjnrDydHispgrfrj0N6PWPcfxJ5yGR6xzIIQIlFVoxfFGL1qS81oMdjy95Z24kSXU
	 xwFUg1uwDjb7w==
Message-ID: <3a0ac49f-2245-fb64-aa60-e3b1a1d4afcd@collabora.com>
Date: Tue, 20 Sep 2022 11:01:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 2/3] iommu/mediatek: Add enable IOMMU SMC command for
 INFRA master
Content-Language: en-US
To: "Chengci.Xu" <chengci.xu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220919082611.19824-1-chengci.xu@mediatek.com>
 <20220919082611.19824-3-chengci.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919082611.19824-3-chengci.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_020201_812958_CEB5F76F 
X-CRM114-Status: GOOD (  21.95  )
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

Il 19/09/22 10:26, Chengci.Xu ha scritto:
> The register which can enable IOMMU for INFRA master should be setted
> in secure world for security concerns. Therefore, we add a SMC command
> for INFRA master to enable/disable INFRA IOMMU in ATF. This function is
> prepared for MT8188.
> 
> Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c  | 21 +++++++++++++++++++--
>   include/soc/mediatek/smi.h |  1 +
>   2 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 552e4eb8c610..8b8a289bab2c 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -3,6 +3,7 @@
>    * Copyright (c) 2015-2016 MediaTek Inc.
>    * Author: Yong Wu <yong.wu@mediatek.com>
>    */
> +#include <linux/arm-smccc.h>
>   #include <linux/bitfield.h>
>   #include <linux/bug.h>
>   #include <linux/clk.h>
> @@ -28,6 +29,7 @@
>   #include <linux/slab.h>
>   #include <linux/spinlock.h>
>   #include <linux/soc/mediatek/infracfg.h>
> +#include <linux/soc/mediatek/mtk_sip_svc.h>
>   #include <asm/barrier.h>
>   #include <soc/mediatek/smi.h>
>   
> @@ -138,6 +140,7 @@
>   #define PM_CLK_AO			BIT(15)
>   #define IFA_IOMMU_PCIE_SUPPORT		BIT(16)
>   #define PGTABLE_PA_35_EN		BIT(17)
> +#define CFG_IFA_MASTER_IN_ATF		BIT(18)
>   
>   #define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
>   				((((pdata)->flags) & (mask)) == (_x))
> @@ -553,7 +556,20 @@ static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
>   				larb_mmu->mmu |= MTK_SMI_MMU_EN(portid);
>   			else
>   				larb_mmu->mmu &= ~MTK_SMI_MMU_EN(portid);
> -		} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA)) {
> +		} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA) &&
> +			   MTK_IOMMU_HAS_FLAG(data->plat_data, CFG_IFA_MASTER_IN_ATF)) {
> +			struct arm_smccc_res res;
> +
> +			arm_smccc_smc(MTK_SIP_KERNEL_IOMMU_CONTROL,
> +				      IOMMU_ATF_CMD_CONFIG_INFRA_IOMMU,
> +				      portid, enable, 0, 0, 0, 0, &res);
> +			if (res.a0 != 0) {
> +				dev_err(dev, "%s iommu(%s) inframaster %d fail(%ld).\n",
> +					enable ? "enable" : "disable",
> +					dev_name(data->dev), portid, res.a0);
> +				ret = -EINVAL;
> +			}
> +		} else {

This one is opening a big window for future mistakes.

I think that the only way that you have to do this is...

	} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA)) {
		if (MTK_IOMMU_HAS_FLAG(data->plat_data, CFG_IFA_MASTER_IN_ATF)) {
			arm_smcc_smc ....
		} else {
			peri_mmuen_msk ....
		}
	}

Otherwise, to reduce indentation, you'd have to do something like...

static int mtk_iommu_config_one(struct mtk_iommu_data *data, struct device *dev,
				bool enable, u32 regionid, u32 larbid, u32 portid)
{
	struct mtk_smi_larb_iommu *larb_mmu;
	............
}

static int mtk_iommu_config(struct .............)
{
	vars, etc....

	for (i = 0; i < fwspec->num_ids; ++i)
		mtk_iommu_config_one(data, dev, enable, regionid,
				     MTK_M4U_TO_LARB(...), MTK_M4U_TO_PORT(...));
}


or....

static int mtk_iommu_config_one_infra(struct ....)
{
	if (is atf) ....
	else ....
}

Your choice.

Regards,
Angelo



