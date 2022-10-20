Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C10FC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 09:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42X3hRvH7Qpi+JuM2QnO/7VSSVmzJ58+7zknq3PnIAA=; b=30r+qhUKlnEnG+QyIDeUm4ygJn
	NbdjY8TGbx0JgRMV71vrbG+QRsmsTpc8uZDmVRwTphTqh7e01PnhcDgSmKvO2lELyFEvQhxKnw7VY
	O8rVhANic5Y4hQpQ+mq1k/EdRGdLdCQNR54pLHJqCta7qzQMiqiOLzkeqzwNAg3yh2m3Cmlg59MRi
	rZQI1PXT/M8O0WxyO/a1K4IOtPCBmMRB/RmgKA5kvUwVUGZ1vREY32bFEs1870VbhRB6ayjhQMxaW
	77tFeRI3fo1v1a9lOgwEtOLq1M109zQQcr8/5uDPw4Dmh2gwFpZaHZakeXP8o5+npEhkNB4yvPxRR
	hNsaZlBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olRTp-00CfvZ-MA; Thu, 20 Oct 2022 09:04:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olRTe-00CfpK-AK; Thu, 20 Oct 2022 09:04:35 +0000
X-UUID: f01bfaab0f374fb9b5c5cc58e2ddb732-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=42X3hRvH7Qpi+JuM2QnO/7VSSVmzJ58+7zknq3PnIAA=;
	b=EsBiBsw/4hjaPbIC5k9kKB4DXE7eJt3ERc7psHMoXIkz7QbSAqheUBon/Sn/v9rrdRiEz1iFkro9rSDG+1cdPZcm0cQCvIcMxZ3awEON7kQtYuBBS6zE0TpNjjoPczbF6xW7+MbYtNewpp6w8xrOTDwhjSS7HBmE17nurAPk06c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:4a41ae3e-4077-40c8-acc1-eeea90a8b46c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:28,RULE:Release_Ham,ACTIO
	N:release,TS:79
X-CID-INFO: VERSION:1.1.12,REQID:4a41ae3e-4077-40c8-acc1-eeea90a8b46c,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,BULK:28,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:79
X-CID-META: VersionHash:62cd327,CLOUDID:f66268a3-73e4-48dd-a911-57b5d5484f14,B
	ulkID:2210201633588XNG999P,BulkQuantity:20,Recheck:0,SF:38|28|17|19|48|102
	,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40|20,QS:nil,BEC:nil,C
	OL:0
X-UUID: f01bfaab0f374fb9b5c5cc58e2ddb732-20221020
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1600755009; Thu, 20 Oct 2022 02:04:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 20 Oct 2022 17:03:57 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 20 Oct 2022 17:03:56 +0800
Message-ID: <64250c71cee76f4cf35e4dccdb5d2089a2dc5793.camel@mediatek.com>
Subject: Re: [PATCH,2/2] drm: mediatek: Add mt8188 dpi compatibles and
 platform data
From: xinlei.lee <xinlei.lee@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <ck.hu@mediatek.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 20 Oct 2022 17:04:03 +0800
In-Reply-To: <3e20104a-674a-666a-10b4-4a19abeabc9a@collabora.com>
References: <1666249553-15801-1-git-send-email-xinlei.lee@mediatek.com>
	 <1666249553-15801-3-git-send-email-xinlei.lee@mediatek.com>
	 <3e20104a-674a-666a-10b4-4a19abeabc9a@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_020434_369523_CC607D16 
X-CRM114-Status: GOOD (  18.56  )
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

On Thu, 2022-10-20 at 10:33 +0200, AngeloGioacchino Del Regno wrote:
> Il 20/10/22 09:05, xinlei.lee@mediatek.com ha scritto:
> > From: xinlei lee <xinlei.lee@mediatek.com>
> > 
> > For MT8188, the vdosys0 only supports 1T1P mode, so we need to add
> > the compatible for mt8188 edp-intf.
> > 
> > Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dpi.c     | 17 +++++++++++++++++
> >   drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
> >   2 files changed, 19 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 508a6d9..5cefda4 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -929,6 +929,20 @@ static const struct mtk_dpi_conf mt8183_conf =
> > {
> >   	.csc_enable_bit = CSC_ENABLE,
> >   };
> >   
> > +static const struct mtk_dpi_conf mt8188_edpintf_conf = {
> > +	.cal_factor = mt8195_dpintf_calculate_factor,
> > +	.max_clock_khz = 600000,
> > +	.output_fmts = mt8195_output_fmts,
> > +	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
> > +	.pixels_per_iter = 4,
> > +	.input_2pixel = false,
> > +	.dimension_mask = DPINTF_HPW_MASK,
> > +	.hvsize_mask = DPINTF_HSIZE_MASK,
> > +	.channel_swap_shift = DPINTF_CH_SWAP,
> > +	.yuv422_en_bit = DPINTF_YUV422_EN,
> > +	.csc_enable_bit = DPINTF_CSC_ENABLE,
> > +};
> > +
> >   static const struct mtk_dpi_conf mt8192_conf = {
> >   	.cal_factor = mt8183_calculate_factor,
> >   	.reg_h_fre_con = 0xe0,
> > @@ -1079,6 +1093,9 @@ static const struct of_device_id
> > mtk_dpi_of_ids[] = {
> >   	{ .compatible = "mediatek,mt8183-dpi",
> >   	  .data = &mt8183_conf,
> >   	},
> > +	{ .compatible = "mediatek,mt8188-edp-intf",
> > +	  .data = &mt8188_edpintf_conf,
> 
> Please rename to:
> 
> mediatek,mt8188-dp-intf
> 
> and
> 
> &mt8188_dpintf_conf
> 
> > +	},
> >   	{ .compatible = "mediatek,mt8192-dpi",
> >   	  .data = &mt8192_conf,
> >   	},
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index 91f58db..5732ed8 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -631,6 +631,8 @@ static const struct of_device_id
> > mtk_ddp_comp_dt_ids[] = {
> >   	  .data = (void *)MTK_DPI },
> >   	{ .compatible = "mediatek,mt8183-dpi",
> >   	  .data = (void *)MTK_DPI },
> > +	{ .compatible = "mediatek,mt8188-edp-intf",
> 
> Same here.
> 
> Regards,
> Angelo
> 

Hi Angelo:

Thanks for your review.
I will modify it in the next version.

Best Regards!
xinlei


