Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD683C19F2D
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Aug 2022 06:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3qpylbjugZvitSIRPjTfp50QTQhrWiTGChXjZPN8vw=; b=qmOLygn8GF5RSucoi+kYd27nik
	soVDvLgwR0IEyjbJEuAO39Q+dyprDgiwYJo0ZWqFVslA7Avj7Z3/wA+YAWqNRVJq6AT/S7v67bu1/
	k1xeGcczyyaadylrncs1m4L5eu9SYjITKFKKMaHVRhQZunNik0owSv7FCK+9Pjn2Gl8Kt1u0xztws
	PyBJuR+jVNybadkaaHXL+B5okPWgLcokSmmY3BRAJKkMa7msHNSNoKXzZIRykEAFEUFwxcKqWDJ5A
	BzhVlU9jk0dX2LQL5XPXXQIkPvSc9Ex6gISM89TzIxcSkGs8lFFt/1wi7zSeK00f2iRxHa65oWYZ6
	iLaKF87A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLJDO-002Ame-8s; Tue, 09 Aug 2022 06:59:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLJCm-002AX5-S0; Tue, 09 Aug 2022 06:59:12 +0000
X-UUID: 0b2b53ac983c481e83362c59b98e8973-20220808
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:b893b92b-16d3-45f6-94e4-9d7a791e708d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:db69cbfc-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0b2b53ac983c481e83362c59b98e8973-20220808
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 390764489; Mon, 08 Aug 2022 23:59:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 9 Aug 2022 13:58:25 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 9 Aug 2022 13:58:24 +0800
Message-ID: <7ab5a37101be00f1c0438fb61e1b125db5cf6480.camel@mediatek.com>
Subject: Re: [PATCH v4 3/4] memory: mtk-smi: Add enable IOMMU SMC command
 for MM master
From: Yong Wu <yong.wu@mediatek.com>
To: Chengci.Xu <chengci.xu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <yi.kuo@mediatek.com>,
	<anthony.huang@mediatek.com>, <wendy-st.lin@mediatek.com>, Rob Herring
	<robh+dt@kernel.org>
Date: Tue, 9 Aug 2022 13:58:24 +0800
In-Reply-To: <20220801021851.7169-4-chengci.xu@mediatek.com>
References: <20220801021851.7169-1-chengci.xu@mediatek.com>
	 <20220801021851.7169-4-chengci.xu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_235908_987550_FB7AF72D 
X-CRM114-Status: GOOD (  27.19  )
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

On Mon, 2022-08-01 at 10:18 +0800, Chengci.Xu wrote:
> For concerns about security, the register to enable/disable IOMMU of
> SMI LARB should only be configured in secure world. Thus, we add some
> SMC command for multimedia master to enable/disable MM IOMMU in ATF
> by
> setting the register of SMI LARB. This function is prepared for
> MT8188.
> 
> Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c                 | 19 +++++++++++++++++++
>  include/linux/soc/mediatek/mtk_sip_svc.h |  3 +++
>  include/soc/mediatek/smi.h               |  5 +++++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index 08c1668d47bf..28e1123f9d76 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2015-2016 MediaTek Inc.
>   * Author: Yong Wu <yong.wu@mediatek.com>
>   */
> +#include <linux/arm-smccc.h>
>  #include <linux/clk.h>
>  #include <linux/component.h>
>  #include <linux/device.h>
> @@ -14,6 +15,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/soc/mediatek/mtk_sip_svc.h>
>  #include <soc/mediatek/smi.h>
>  #include <dt-bindings/memory/mt2701-larb-port.h>
>  #include <dt-bindings/memory/mtk-memory-port.h>
> @@ -89,6 +91,7 @@
>  #define MTK_SMI_FLAG_THRT_UPDATE	BIT(0)
>  #define MTK_SMI_FLAG_SW_FLAG		BIT(1)
>  #define MTK_SMI_FLAG_SLEEP_CTL		BIT(2)
> +#define MTK_SMI_FLAG_CFG_PORT_SEC_CTL	BIT(3)
>  #define MTK_SMI_CAPS(flags, _x)		(!!((flags) & (_x)))
>  
>  struct mtk_smi_reg_pair {
> @@ -238,6 +241,7 @@ static int
> mtk_smi_larb_config_port_gen2_general(struct device *dev)
>  	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
>  	u32 reg, flags_general = larb->larb_gen->flags_general;
>  	const u8 *larbostd = larb->larb_gen->ostd ? larb->larb_gen-
> >ostd[larb->larbid] : NULL;
> +	struct arm_smccc_res res;
>  	int i;
>  
>  	if (BIT(larb->larbid) & larb->larb_gen-
> >larb_direct_to_common_mask)
> @@ -262,6 +266,21 @@ static int
> mtk_smi_larb_config_port_gen2_general(struct device *dev)
>  		reg |= BANK_SEL(larb->bank[i]);
>  		writel(reg, larb->base + SMI_LARB_NONSEC_CON(i));
>  	}
> +
> +	/*
> +	 * We still need to write above NONSEC_CON register for bank
> selection
> +	 * even if enabling IOMMU is failed by SMC call. Otherwise, all
> master
> +	 * will be configured to bank 0 with a state of IOMMU enable
> due to the
> +	 * HW default value of register.

I don't understand this. Does bankX(X!=0) make sense if SMC fail? 

I guess the below segment should be before SMI_LARB_NONSEC_CON. It
means we shouldn't touch bank_sel while SMC fail.

Just add a comment like:
/* When mmu_en bits are in security world, the bank_sel still is in the
LARB_NONSEC_CON below. and the mmu_en of LARB_NONSEC_CON have no effect
in this case. */

> +	 */
> +	if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_CFG_PORT_SEC_CTL))
> {
> +		arm_smccc_smc(MTK_SIP_KERNEL_IOMMU_CONTROL,
> IOMMU_ATF_CMD_CONFIG_SMI_LARB,
> +			      larb->larbid, (u32)(*larb->mmu), 0, 0, 0,

The type of mmu is "u32", no need the "(u32)".

> 0, &res);
> +		if (res.a0 != 0) {
> +			dev_err(dev, "Enable iommu fail, ret %ld\n",
> res.a0);
> +			return -EINVAL;
> +		}
> +	}
>  	return 0;
>  }
>  
> diff --git a/include/linux/soc/mediatek/mtk_sip_svc.h
> b/include/linux/soc/mediatek/mtk_sip_svc.h
> index 082398e0cfb1..0761128b4354 100644
> --- a/include/linux/soc/mediatek/mtk_sip_svc.h
> +++ b/include/linux/soc/mediatek/mtk_sip_svc.h
> @@ -22,4 +22,7 @@
>  	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENTION,
> \
>  			   ARM_SMCCC_OWNER_SIP, fn_id)
>  
> +/* IOMMU related SMC call */
> +#define MTK_SIP_KERNEL_IOMMU_CONTROL	MTK_SIP_SMC_CMD(0x514)
> +
>  #endif
> diff --git a/include/soc/mediatek/smi.h b/include/soc/mediatek/smi.h
> index 11f7d6b59642..dfd8efca5e60 100644
> --- a/include/soc/mediatek/smi.h
> +++ b/include/soc/mediatek/smi.h
> @@ -11,6 +11,11 @@
>  
>  #if IS_ENABLED(CONFIG_MTK_SMI)
>  
> +enum iommu_atf_cmd {
> +	IOMMU_ATF_CMD_CONFIG_SMI_LARB,		/* For mm master to
> en/disable iommu */
> +	IOMMU_ATF_CMD_MAX,
> +};
> +
>  #define MTK_SMI_MMU_EN(port)	BIT(port)
>  
>  struct mtk_smi_larb_iommu {


