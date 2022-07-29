Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FD6C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 07:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSnMvUzN+i1VJ72D98lzdZNFb1y8yO3NGjGCwgiq020=; b=v0RWvzxpWKXx8xv2O/8Z40A0XX
	6/Pg6HyIUVxUIGK9I7oOGMt27gPQSZQn3s2dy+N+6gPeOd4z2oTnzEbbgzJLPV9MHVoDpbZ3HjJK0
	flZ/bUH8vRmZvuj5Ozkawfwh3VI3dN+iYojOz5hDJXZDlU31rmNZQw1SOcHXChsV3+SZRlX1TRylE
	/X3vDDyNejQFxHISwc0MAwW1bMeMKmINkXF0LTUtXsop4wQn80bJkqtVWp/u4B0RA6quBl0sSX63l
	MFbpzbCqa7gCzaRMaLBO1KB6kCXWrCWy98kmwjxnuP99Vt/If3VgfdiLiDJaeW8g0uvrYdbprtujx
	i5uP+Uxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHK9q-002PHR-4Q; Fri, 29 Jul 2022 07:11:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHK9M-002P0G-2j; Fri, 29 Jul 2022 07:11:09 +0000
X-UUID: b18a7ee739554000b24bc0012ab0387d-20220729
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:6019dfea-0c35-4721-9254-586559a5d466,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:9d9db424-a982-4824-82d2-9da3b6056c2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b18a7ee739554000b24bc0012ab0387d-20220729
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 84464993; Fri, 29 Jul 2022 00:11:01 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 29 Jul 2022 15:10:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Jul 2022 15:10:41 +0800
Message-ID: <98a70f5bf7a6a31ee8eb30ba8db6cf5d5d160db6.camel@mediatek.com>
Subject: Re: [PATCH v3 2/3] memory: mtk-smi: Add enable IOMMU SMC command
 for MM master
From: Chengci.Xu <chengci.xu@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <yi.kuo@mediatek.com>,
	<anthony.huang@mediatek.com>, <wendy-st.lin@mediatek.com>, Rob Herring
	<robh+dt@kernel.org>
Date: Fri, 29 Jul 2022 15:10:41 +0800
In-Reply-To: <3547dbe3cedfdd01dc751fc6be147d05119634ff.camel@mediatek.com>
References: <20220727104541.7309-1-chengci.xu@mediatek.com>
	 <20220727104541.7309-3-chengci.xu@mediatek.com>
	 <3547dbe3cedfdd01dc751fc6be147d05119634ff.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_001108_175959_8ED75CC2 
X-CRM114-Status: GOOD (  30.98  )
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

On Thu, 2022-07-28 at 14:58 +0800, Yong Wu wrote:
> On Wed, 2022-07-27 at 18:45 +0800, Chengci.Xu wrote:
> > For concerns about security, the register to enable/disable IOMMU
> > of
> > SMI LARB should only be configured in secure world. Thus, we add
> > some
> > SMC command for multimedia master to enable/disable MM IOMMU in ATF
> > by
> > setting the register of SMI LARB. This function is prepared for
> > MT8188.
> > 
> > Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
> > ---
> >  drivers/memory/mtk-smi.c                 | 11 +++++++++++
> >  include/linux/soc/mediatek/mtk_sip_svc.h |  3 +++
> >  include/soc/mediatek/smi.h               |  7 +++++++
> >  3 files changed, 21 insertions(+)
> > 
> > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> > index d7cb7ead2ac7..41ce66c39123 100644
> > --- a/drivers/memory/mtk-smi.c
> > +++ b/drivers/memory/mtk-smi.c
> > @@ -3,6 +3,7 @@
> >   * Copyright (c) 2015-2016 MediaTek Inc.
> >   * Author: Yong Wu <yong.wu@mediatek.com>
> >   */
> > +#include <linux/arm-smccc.h>
> >  #include <linux/clk.h>
> >  #include <linux/component.h>
> >  #include <linux/device.h>
> > @@ -14,6 +15,7 @@
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/soc/mediatek/mtk_sip_svc.h>
> >  #include <soc/mediatek/smi.h>
> >  #include <dt-bindings/memory/mt2701-larb-port.h>
> >  #include <dt-bindings/memory/mtk-memory-port.h>
> > @@ -89,6 +91,7 @@
> >  #define MTK_SMI_FLAG_THRT_UPDATE	BIT(0)
> >  #define MTK_SMI_FLAG_SW_FLAG		BIT(1)
> >  #define MTK_SMI_FLAG_SLEEP_CTL		BIT(2)
> > +#define MTK_SMI_FLAG_SEC_REG		BIT(3)
> 
> Rename more detailly. This is about the configuring port registers.
> 
> something like: MTK_SMI_FLAG_CFG_PORT_SEC_CTL

OK, rename thie item to MTK_SMI_FLAG_CFG_PORT_SEC_CTL.

> 
> >  #define MTK_SMI_CAPS(flags, _x)		(!!((flags) & (_x)))
> >  
> >  struct mtk_smi_reg_pair {
> > @@ -235,6 +238,7 @@ static void
> > mtk_smi_larb_config_port_gen2_general(struct device *dev)
> >  	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
> >  	u32 reg, flags_general = larb->larb_gen->flags_general;
> >  	const u8 *larbostd = larb->larb_gen->ostd ? larb->larb_gen-
> > > ostd[larb->larbid] : NULL;
> > 
> > +	struct arm_smccc_res res;
> >  	int i;
> >  
> >  	if (BIT(larb->larbid) & larb->larb_gen-
> > > larb_direct_to_common_mask)
> > 
> > @@ -259,6 +263,13 @@ static void
> > mtk_smi_larb_config_port_gen2_general(struct device *dev)
> >  		reg |= BANK_SEL(larb->bank[i]);
> >  		writel(reg, larb->base + SMI_LARB_NONSEC_CON(i));
> >  	}
> > +
> > +	if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_SEC_REG)) {
> > +		arm_smccc_smc(MTK_SIP_KERNEL_IOMMU_CONTROL,
> > IOMMU_ATF_CMD_CONFIG_SMI_LARB,
> > +			      larb->larbid, (u32)(*larb->mmu), 0, 0, 0,
> > 0, &res);
> > +		if (res.a0 != 0)
> > +			dev_err(dev, "Enable iommu fail, ret %ld\n",
> > res.a0);
> > +	}
> 
> In this case, Do we still need write SMI_LARB_NONSEC_CON above? If
> no,
>   
>       if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_SEC_REG)) {
>           xx
>           return;
>       }
>       and put this before updating SMI_LARB_NONSEC_CON.
> 
> If yes. we should add some comment.

If we send an invalid parameter or something unpredictable happened,
such as ATF does not have related code, this SMC call will returns an
error, which means SMI-larb's register may in a HW default state.

In MT8188 we still need write SMI_LARB_NONSEC_CON for the HW default
value will enable IOMMU when SMC call failed. If we not write this
register, bank select function will lost. Thus, all the master that
with IOMMU default enable will lost the high bit[33:32], and send an
IOVA of 0~4G to IOMMU. That is abnormal. 

So I think it's better to add some comment.

> 
> And, Could we ignore the fail result? 
> 

This failure should not be ignored. If some masters want to disable
IOMMU and use PA to access DRAM for special case, this failure will
left IOMMU in enable state and lead to translation fault.

So I will add a return value for this function.

> >  }
> >  
> >  static const u8 mtk_smi_larb_mt8195_ostd[][SMI_LARB_PORT_NR_MAX] =
> > {
> > diff --git a/include/linux/soc/mediatek/mtk_sip_svc.h
> > b/include/linux/soc/mediatek/mtk_sip_svc.h
> > index 082398e0cfb1..0761128b4354 100644
> > --- a/include/linux/soc/mediatek/mtk_sip_svc.h
> > +++ b/include/linux/soc/mediatek/mtk_sip_svc.h
> > @@ -22,4 +22,7 @@
> >  	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENTION,
> > \
> >  			   ARM_SMCCC_OWNER_SIP, fn_id)
> >  
> > +/* IOMMU related SMC call */
> > +#define MTK_SIP_KERNEL_IOMMU_CONTROL	MTK_SIP_SMC_CMD(0x514)
> > +
> >  #endif
> > diff --git a/include/soc/mediatek/smi.h
> > b/include/soc/mediatek/smi.h
> > index 11f7d6b59642..8c781b7bd88d 100644
> > --- a/include/soc/mediatek/smi.h
> > +++ b/include/soc/mediatek/smi.h
> > @@ -9,6 +9,13 @@
> >  #include <linux/bitops.h>
> >  #include <linux/device.h>
> >  
> > +/* IOMMU & SMI ATF CMD */
> > +
> > +enum IOMMU_ATF_CMD {
> > +	IOMMU_ATF_CMD_CONFIG_SMI_LARB,		/* For mm master to
> > en/disable iommu */
> > +	IOMMU_ATF_CMD_COUNT,
> 
> IOMMU_ATF_CMD_MAX?
> > +};
> > +
> 
> This enum only is used in IOMMU and SMI. Put it below inside the
> macro
> CONFIG_MTK_SMI.
> 

OK, got it.

> 
> >  #if IS_ENABLED(CONFIG_MTK_SMI)
> >  
> >  #define MTK_SMI_MMU_EN(port)	BIT(port)
> 
> 


