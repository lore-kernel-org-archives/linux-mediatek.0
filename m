Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB911C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 05:43:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C2CB61CB6
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 05:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C2CB61CB6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90QILhY2zNM5bWIDPnJiE/YsgUDBurAyWSuV58zcAMc=; b=IIWjMp23T+4FlN
	OgLBufuQK7qzysc/Ehk02CxsPlj5/KWh+eJpC8ZJlry8uSGcAZB+EXqnuivV0dCWLXYv50AN6yYgd
	xURVfiWRjPZ8YeM1UyfpiEPDC8HMYDpgAmza/6FaAqSKOtCtbd+REchZkO5uyjbheiPshjmcKedSY
	CIUds8LLucHV12DeyfPmuvZKrV2s2U8BVwo6rwjGlBOt3J5d5sD8AMgxX5xQX0xZBEcw6CITCtU0L
	xoy8yqCyGUrG2srN1HJq0w1m+Li44KYcA7G97PONtECxzxdqtja5hTjVRa7pH/Ci3AJ2R/qlnIbGf
	fP3ay9Kzv1KHlZQpCzOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m10LW-00DYGG-TX; Wed, 07 Jul 2021 05:43:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m10LU-00DYFO-H4; Wed, 07 Jul 2021 05:43:42 +0000
X-UUID: c227da25343f43c0bf21b42a0bd65836-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=37WKElknKGv98TUnnit4gK0gpKWZG02FiCIzMUczM4w=; 
 b=RS9k4i69MRcXVaD/plFBC9PkXw4WddBGcdfAcczFHU57Uz2nJoSwSagAABm/kfFQWlNOMMaaeuTYbEVx0Azr5yHSLSY4ba/9ToxBPH+nG44azkIXNCbgeA40Al2uD4GhVM2vii4vg8x834kVKJxnIq/CDH2sGViesgePgatnYjY=;
X-UUID: c227da25343f43c0bf21b42a0bd65836-20210706
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 725965682; Tue, 06 Jul 2021 22:43:37 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 22:43:35 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 13:43:34 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 13:43:33 +0800
Message-ID: <1625636614.7824.19.camel@mtksdaap41>
Subject: Re: [PATCH v1 09/17] drm/mediatek: add OVL support multi-layer
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Wed, 7 Jul 2021 13:43:34 +0800
In-Reply-To: <20210707041249.29816-10-jason-jh.lin@mediatek.com>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
 <20210707041249.29816-10-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_224340_620790_15BED1DC 
X-CRM114-Status: GOOD (  14.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Jason:

On Wed, 2021-07-07 at 12:12 +0800, jason-jh.lin wrote:
> Add datapath_con settings to support multi-layer output.


What is multi-layer output? Why we need this?

> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 7504e86b167a..95fd5e00eb91 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -18,14 +18,17 @@
>  #include "mtk_drm_ddp_comp.h"
>  
>  #define DISP_REG_OVL_INTEN			0x0004
> -#define OVL_FME_CPL_INT					BIT(1)
> +#define OVL_FME_CPL_INT				BIT(1)
>  #define DISP_REG_OVL_INTSTA			0x0008
>  #define DISP_REG_OVL_EN				0x000c
>  #define DISP_REG_OVL_RST			0x0014
>  #define DISP_REG_OVL_ROI_SIZE			0x0020
>  #define DISP_REG_OVL_DATAPATH_CON		0x0024
> -#define OVL_LAYER_SMI_ID_EN				BIT(0)
> -#define OVL_BGCLR_SEL_IN				BIT(2)
> +#define OVL_LAYER_SMI_ID_EN			BIT(0)
> +#define OVL_BGCLR_SEL_IN			BIT(2)
> +#define OVL_GCLAST_EN				BIT(24)
> +#define OVL_HDR_GCLAST_EN			BIT(25)
> +#define OVL_OUTPUT_CLAMP			BIT(26)
>  #define DISP_REG_OVL_ROI_BGCLR			0x0028
>  #define DISP_REG_OVL_SRC_CON			0x002c
>  #define DISP_REG_OVL_CON(n)			(0x0030 + 0x20 * (n))
> @@ -222,6 +225,7 @@ void mtk_ovl_layer_on(struct device *dev, unsigned int idx,
>  	unsigned int gmc_thrshd_l;
>  	unsigned int gmc_thrshd_h;
>  	unsigned int gmc_value;
> +	unsigned int datapatch_con;
>  	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
>  
>  	mtk_ddp_write(cmdq_pkt, 0x1, &ovl->cmdq_reg, ovl->regs,
> @@ -237,6 +241,11 @@ void mtk_ovl_layer_on(struct device *dev, unsigned int idx,
>  			    gmc_thrshd_h << 16 | gmc_thrshd_h << 24;
>  	mtk_ddp_write(cmdq_pkt, gmc_value,
>  		      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_RDMA_GMC(idx));
> +
> +	datapatch_con = OVL_GCLAST_EN | OVL_HDR_GCLAST_EN | OVL_OUTPUT_CLAMP;
> +	mtk_ddp_write_mask(cmdq_pkt, datapatch_con, &ovl->cmdq_reg, ovl->regs,
> +				 DISP_REG_OVL_DATAPATH_CON, datapatch_con);

For mt8173 or other SoC, this does not turn on. Now you turn on this,
would this influence other SoC?

Regards,
CK

> +
>  	mtk_ddp_write_mask(cmdq_pkt, BIT(idx), &ovl->cmdq_reg, ovl->regs,
>  			   DISP_REG_OVL_SRC_CON, BIT(idx));
>  }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
