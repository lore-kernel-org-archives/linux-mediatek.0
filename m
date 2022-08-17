Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97871C25B08
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Aug 2022 12:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tgKy4x8+asiDhS0xkZI24d19RhiRQbW1lkvOv6I8hI=; b=mEeQ00Zr5NgEqZNMXxsRMlMld4
	TCI5DsUWR/1FY/IK2doX4pTXADkTqZNisO02Iv9NUKAM9B294XtYMcYOMo1/XorrZkZbvk4Se861j
	saLXpZSvol5qMcDd59flaoml7KdpwuutNpYp9qjjsbWHT2vOXYizqzLRujFWpfCoK/V7vQdwKEhZT
	gH3NSIz4UxwMjpJR/EOnFHsijw2ZCfwyr9DiG13YMhv/o4IqzCL8OcQGp8oL66rJhEr9kZcTpaSD2
	O+lJ34C9cVe/DV6pZQcFhYDB5p63Zwo6oYs2BYpemO/FZn2duzEhN8cA51evHLhqE6ztv75gC4ZO1
	V/qni2bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOIZ4-0024up-FR; Wed, 17 Aug 2022 12:54:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOIYt-0024jx-Vf; Wed, 17 Aug 2022 12:54:21 +0000
X-UUID: aad0e7acf3074efbabb43f701e266b22-20220817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=9tgKy4x8+asiDhS0xkZI24d19RhiRQbW1lkvOv6I8hI=;
	b=B/PFVrliz2evxpFYkpPl+VH06rtOxXMhePAW1HnXQdkyNfGd4lxl2+PouzFwnChtAHC1o2PmCjhZ7vULkVpQ6ycSf22mmRUkbEjxo6jYJ2IYX2y0+kM+iDrUKQvsj8p2dD604WkLCa0oYsLF9xlfuuX7Ld125LAO8aEfQjYCFyg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:e0939295-baac-435f-95e9-7eb675f1e95b,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:93d2f19c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: aad0e7acf3074efbabb43f701e266b22-20220817
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 932206643; Wed, 17 Aug 2022 05:54:14 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 17 Aug 2022 20:43:36 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 17 Aug 2022 20:43:35 +0800
Message-ID: <9291fe610313640532ac62a8457dc5d2ac4bab4a.camel@mediatek.com>
Subject: Re: [PATCH v4 3/4] memory: mtk-smi: Add enable IOMMU SMC command
 for MM master
From: Chengci.Xu <chengci.xu@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <yi.kuo@mediatek.com>,
	<anthony.huang@mediatek.com>, <wendy-st.lin@mediatek.com>, Rob Herring
	<robh+dt@kernel.org>
Date: Wed, 17 Aug 2022 20:43:33 +0800
In-Reply-To: <7ab5a37101be00f1c0438fb61e1b125db5cf6480.camel@mediatek.com>
References: <20220801021851.7169-1-chengci.xu@mediatek.com>
	 <20220801021851.7169-4-chengci.xu@mediatek.com>
	 <7ab5a37101be00f1c0438fb61e1b125db5cf6480.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_055420_084019_C4A5C636 
X-CRM114-Status: GOOD (  35.95  )
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

On Tue, 2022-08-09 at 13:58 +0800, Yong Wu wrote:
> On Mon, 2022-08-01 at 10:18 +0800, Chengci.Xu wrote:
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
> >  drivers/memory/mtk-smi.c                 | 19 +++++++++++++++++++
> >  include/linux/soc/mediatek/mtk_sip_svc.h |  3 +++
> >  include/soc/mediatek/smi.h               |  5 +++++
> >  3 files changed, 27 insertions(+)
> > 
> > diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> > index 08c1668d47bf..28e1123f9d76 100644
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
> > +#define MTK_SMI_FLAG_CFG_PORT_SEC_CTL	BIT(3)
> >  #define MTK_SMI_CAPS(flags, _x)		(!!((flags) & (_x)))
> >  
> >  struct mtk_smi_reg_pair {
> > @@ -238,6 +241,7 @@ static int
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
> > @@ -262,6 +266,21 @@ static int
> > mtk_smi_larb_config_port_gen2_general(struct device *dev)
> >  		reg |= BANK_SEL(larb->bank[i]);
> >  		writel(reg, larb->base + SMI_LARB_NONSEC_CON(i));
> >  	}
> > +
> > +	/*
> > +	 * We still need to write above NONSEC_CON register for bank
> > selection
> > +	 * even if enabling IOMMU is failed by SMC call. Otherwise, all
> > master
> > +	 * will be configured to bank 0 with a state of IOMMU enable
> > due to the
> > +	 * HW default value of register.
> 
> I don't understand this. Does bankX(X!=0) make sense if SMC fail? 
> 
> I guess the below segment should be before SMI_LARB_NONSEC_CON. It
> means we shouldn't touch bank_sel while SMC fail.

If SMC call failed, we do have no need to configure bank_sel. All we
can do is stop following step and report an error. So it is a good
choice to put the code about MTK_SMI_FLAG_CFG_PORT_SEC_CTL in front of
SMI_LARB_NONSEC_CON. I will do it in next version.

> 
> Just add a comment like:
> /* When mmu_en bits are in security world, the bank_sel still is in
> the
> LARB_NONSEC_CON below. and the mmu_en of LARB_NONSEC_CON have no
> effect
> in this case. */

OK, got it, thanks.

> 
> > +	 */
> > +	if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_CFG_PORT_SEC_CTL))
> > {
> > +		arm_smccc_smc(MTK_SIP_KERNEL_IOMMU_CONTROL,
> > IOMMU_ATF_CMD_CONFIG_SMI_LARB,
> > +			      larb->larbid, (u32)(*larb->mmu), 0, 0, 0,
> 
> The type of mmu is "u32", no need the "(u32)".
> 
> > 0, &res);
> > +		if (res.a0 != 0) {
> > +			dev_err(dev, "Enable iommu fail, ret %ld\n",
> > res.a0);
> > +			return -EINVAL;
> > +		}
> > +	}
> >  	return 0;
> >  }
> >  
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
> > index 11f7d6b59642..dfd8efca5e60 100644
> > --- a/include/soc/mediatek/smi.h
> > +++ b/include/soc/mediatek/smi.h
> > @@ -11,6 +11,11 @@
> >  
> >  #if IS_ENABLED(CONFIG_MTK_SMI)
> >  
> > +enum iommu_atf_cmd {
> > +	IOMMU_ATF_CMD_CONFIG_SMI_LARB,		/* For mm master to
> > en/disable iommu */
> > +	IOMMU_ATF_CMD_MAX,
> > +};
> > +
> >  #define MTK_SMI_MMU_EN(port)	BIT(port)
> >  
> >  struct mtk_smi_larb_iommu {
> 
> 


