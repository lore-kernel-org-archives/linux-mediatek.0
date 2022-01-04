Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110A8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 16:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uf9nyro5aiHsFOt+viTvH/9Qr7aHRMAd/IzI9Pc0sWQ=; b=BiZkOtiUS648Qg/I6jq30OTlDe
	emjf1CKQQpwlNWuOtgiBn1O439a2xr71yN8FyHvP6EjPCqxpHzb10WVhXvnwspkx8gPwfCgBECeqk
	wcUK1XJa5hLBmwGo2aRMJ0i9U1QdDeBLVVX3Hz9tfB/1U0BYm9TgU1dnTscVjJqfANOVmLd2dt2z+
	Kh/BoWFSKzu3haDFiuYHm55xQks69xSEi/U6ii28gxKuKzkQDsCViEsVnSzmZ5SHi6b0fTWoRxwOa
	aqTB6GyM4BSgnVPnyZ56kOQn+L26Bb2EnrgLaE+j9I4ghlZhpTu4LLuDigkWHehaYfufz0anjnjpv
	GjpEH2yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mG9-00C8SF-6Z; Tue, 04 Jan 2022 16:02:01 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m9O-00C4aK-BD; Tue, 04 Jan 2022 15:55:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F26C61F43596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311701;
 bh=fPBIfJjVcoXofCD1fNUii7LIvv42S5BZmY9Gwg/vvxs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GuT8uwRR0r1DXel74kTa76Ic4uUp1nwzwOBXQqig/2HM6O2Azi93HPr6wVR2VLSM+
 2j91N+G5h5h7Tm/IBemQKdb30xRh1YbQEZsNj6S0VObC2t1X629kYS1bi363Cuz6dw
 eUigh5eCsjcQXVDAl18GGmtTa3LwmvfivTIQDMf02R5VUuuoZiTGYKtpwxfud/uBpM
 oIermrwBW+PMu8PYScVRRuv16vjYdcwrx2I+BW+JjLFsLUWmMwwCNTfC77BffrXyXG
 F3885a8L67q05vcM0qFKUXYbxaPixhLaPT/HtRIk1vh9az2AADZfsNOYkPQVh9ctsL
 TqlfPq61mLleg==
Subject: Re: [PATCH v3 22/33] iommu/mediatek: Add PCIe support
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, chao.hao@mediatek.com,
 yen-chang.chen@mediatek.com
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-23-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <3b5e7072-0935-4383-27a1-dd8d623cc608@collabora.com>
Date: Tue, 4 Jan 2022 16:54:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-23-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075502_764891_7E20BB0A 
X-CRM114-Status: GOOD (  29.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/09/21 13:58, Yong Wu ha scritto:
> Currently the code for of_iommu_configure_dev_id is like this:
> 
> static int of_iommu_configure_dev_id(struct device_node *master_np,
>                                       struct device *dev,
>                                       const u32 *id)
> {
>         struct of_phandle_args iommu_spec = { .args_count = 1 };
> 
>         err = of_map_id(master_np, *id, "iommu-map",
>                         "iommu-map-mask", &iommu_spec.np,
>                         iommu_spec.args);
> ...
> }
> 
> It supports only one id output. BUT our PCIe HW has two ID(one is for
> writing, the other is for reading). I'm not sure if we should change
> of_map_id to support output MAX_PHANDLE_ARGS.
> 
> Here add the solution in ourselve drivers. If it's pcie case, enable one
> more bit.
> 
> Not all infra iommu support PCIe, thus add a PCIe support flag here.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 37d6dfb4feab..3f1fd8036345 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -20,6 +20,7 @@
>   #include <linux/of_address.h>
>   #include <linux/of_irq.h>
>   #include <linux/of_platform.h>
> +#include <linux/pci.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/regmap.h>
> @@ -132,6 +133,7 @@
>   #define MTK_IOMMU_TYPE_MM		(0x0 << 13)
>   #define MTK_IOMMU_TYPE_INFRA		(0x1 << 13)
>   #define MTK_IOMMU_TYPE_MASK		(0x3 << 13)
> +#define IFA_IOMMU_PCIe_SUPPORT		BIT(15)

This definition looks like "breaking" the naming convention that's used in this
driver... what about MTK_INFRA_IOMMU_PCIE_SUPPORT?

>   
>   #define MTK_IOMMU_HAS_FLAG(pdata, _x)	(!!(((pdata)->flags) & (_x)))
>   
> @@ -401,8 +403,11 @@ static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
>   				larb_mmu->mmu &= ~MTK_SMI_MMU_EN(portid);
>   		} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA)) {
>   			peri_mmuen_msk = BIT(portid);
> -			peri_mmuen = enable ? peri_mmuen_msk : 0;
> +			/* PCIdev has only one output id, enable the next writing bit for PCIe */
> +			if (dev_is_pci(dev))
> +				peri_mmuen_msk |= BIT(portid + 1);
>   
> +			peri_mmuen = enable ? peri_mmuen_msk : 0;
>   			ret = regmap_update_bits(data->pericfg, PERICFG_IOMMU_1,
>   						 peri_mmuen_msk, peri_mmuen);
>   			if (ret)
> @@ -977,6 +982,15 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   		ret = component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
>   		if (ret)
>   			goto out_bus_set_null;
> +	} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA) &&
> +		   MTK_IOMMU_HAS_FLAG(data->plat_data, IFA_IOMMU_PCIe_SUPPORT)) {
> +		#ifdef CONFIG_PCI

Please fix the indentation of this ifdef (do not indent).

> +		if (!iommu_present(&pci_bus_type)) {
> +			ret = bus_set_iommu(&pci_bus_type, &mtk_iommu_ops);
> +			if (ret) /* PCIe fail don't affect platform_bus. */
> +				goto out_list_del;
> +		}
> +		#endif
>   	}
>   	return ret;
>   
> @@ -1007,6 +1021,11 @@ static int mtk_iommu_remove(struct platform_device *pdev)
>   	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
>   		device_link_remove(data->smicomm_dev, &pdev->dev);
>   		component_master_del(&pdev->dev, &mtk_iommu_com_ops);
> +	} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA) &&
> +		   MTK_IOMMU_HAS_FLAG(data->plat_data, IFA_IOMMU_PCIe_SUPPORT)) {
> +		#ifdef CONFIG_PCI

ditto.

> +		bus_set_iommu(&pci_bus_type, NULL);
> +		#endif
>   	}
>   	pm_runtime_disable(&pdev->dev);
>   	devm_free_irq(&pdev->dev, data->irq, data);
> 



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
