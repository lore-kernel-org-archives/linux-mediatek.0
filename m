Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45732C54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 09:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=me1jYPFdBY24xlXbWTB3vvDDrEcHcZyvdZP+4RKUj/Y=; b=Ucjoyr2NH3wJlylwhTFG/OU1sp
	xlgaIDnXQR3WKW5kw8FVyXKoe5rpvxfYbyXsY+gt5fZaS/BllNF5/qfzVscTzrF2sDuAQ8TOBp3Gp
	eBnIzfc9i+VZqtuUsLxlyLM7PbTbyJVa4J3fl7Vx1TB3umrAsu11JirP5Jty9LNgyWbxCBgcausvr
	LpmnXCKlenP8/3rVCtKtX9PgnL5xUO8Mru9O475j8xc23d9Av4JNcnXRzcGIKztZpShfv9c8dDzBD
	9JM6aN8gLu7NoQnA97hlbqVeY9/upuGyAqG0NlQH5Kw2cxTomkehEqCfpvKZYOxK8G4OLZ8tio1On
	8vQmETVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2Xy-002Eb1-DC; Fri, 02 Sep 2022 09:01:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2Xj-002ERb-7d; Fri, 02 Sep 2022 09:00:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BB0196601F04;
	Fri,  2 Sep 2022 10:00:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662109249;
	bh=7sU033mGQqMgLZYu1qj1vLeGlrTQhMdIgyO5Z9XmQvc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=btPA8d5oKPh+N3MfwdysLrom3fdzX4u65X9qfnk3UySmC4Rr6X36Ear26Wj7FapZi
	 6u4cDtF0aNsgZWz6UU74e71kArJilGw1D4Tw4M8yPX6bDbQgU12EUjYA8Cl3oHgLCJ
	 xF9xlD6AJ4y7aEX8OjRESLxjvhlAaVO4kC0XgW4cCVXb10lTkwJrgPTH2KosJMrzJA
	 LwDKRV7AkWBwbvG/BD4JdtegLUe8Vy9K3eZ91qGsCBWOkPqbzsSPCFQsXHl2o0twv8
	 3cjsb/g6tSFI2QYWhY6WRSByJm7lunT4Ix7ENhfLbGuWg5DIBTo8dli9LdQR7VOz3s
	 W59oVfW64KNvg==
Message-ID: <8e398e71-1283-b5d7-2b17-958a25563c25@collabora.com>
Date: Fri, 2 Sep 2022 11:00:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 2/3] iommu/mediatek: Add enable IOMMU SMC command for
 INFRA master
To: "Chengci.Xu" <chengci.xu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220831125502.7818-1-chengci.xu@mediatek.com>
 <20220831125502.7818-3-chengci.xu@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220831125502.7818-3-chengci.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_020051_467848_9A01F30C 
X-CRM114-Status: GOOD (  21.92  )
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

Il 31/08/22 14:55, Chengci.Xu ha scritto:
> The register which can enable IOMMU for INFRA master should be setted
> in secure world for security concerns. Therefore, we add a SMC command
> for INFRA master to enable/disable INFRA IOMMU in ATF. This function is
> prepared for MT8188.
> 
> Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c  | 34 ++++++++++++++++++++++++++--------
>   include/soc/mediatek/smi.h |  1 +
>   2 files changed, 27 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 7e363b1f24df..6fe780783ec8 100644
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
> @@ -554,14 +557,29 @@ static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
>   			else
>   				larb_mmu->mmu &= ~MTK_SMI_MMU_EN(portid);
>   		} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA)) {
> -			peri_mmuen_msk = BIT(portid);
> -			/* PCI dev has only one output id, enable the next writing bit for PCIe */
> -			if (dev_is_pci(dev))
> -				peri_mmuen_msk |= BIT(portid + 1);
> -
> -			peri_mmuen = enable ? peri_mmuen_msk : 0;
> -			ret = regmap_update_bits(data->pericfg, PERICFG_IOMMU_1,
> -						 peri_mmuen_msk, peri_mmuen);
> +			if (MTK_IOMMU_HAS_FLAG(data->plat_data, CFG_IFA_MASTER_IN_ATF)) {
> +				struct arm_smccc_res res;
> +
> +				portid = MTK_M4U_TO_PORT(fwspec->ids[i]);

This assignment is redundant, as portid is initialized to the same value
just a few lines before. Please drop it.

Everything else looks good.

Regards,
Angelo

> +				arm_smccc_smc(MTK_SIP_KERNEL_IOMMU_CONTROL,
> +					      IOMMU_ATF_CMD_CONFIG_INFRA_IOMMU,
> +					      portid, enable, 0, 0, 0, 0, &res);
> +				ret = (int)res.a0;


