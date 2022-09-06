Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9D0ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 03:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dn9b59ppNNvHD6c39h1V+jJIS09fOkViOiiBcMeql2I=; b=T0dNUwzStiGVuQEGGBywXvSW+y
	W5Izz544dNPU9MYFoQLw/mB3M2aT7xfAYZ3efjP65Z7vOCQHL+gIEXpBTYhLieooinsLYMxREfsXy
	fUUro2fAWlwQnDZXpGTPcIiaIB9AQinDRADnmFnN0u/DKQmaXAQwnIOEJXPb1bTpLEnKNq/OICfOQ
	3ZAN1c3Go2DQIX0L7WDzjVcflkm4MBQCxlmAPCzWkt6AHeW4Qp7sQ2BdK6SDQ8+KDy7sWjuJMBJFi
	w28V4l9omykN3Z8uAXaZwkJ0lCvXwPE3tVt3ayjk5HFUvQH1gWCTiqBDXBFdOZW6w2XXA1FxdOzuO
	XmZnHdXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVPLe-003AGT-G0; Tue, 06 Sep 2022 03:34:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVPLZ-003A6w-Vy; Tue, 06 Sep 2022 03:33:59 +0000
X-UUID: 1a155187907b4e19998068188bd2ebcf-20220905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Dn9b59ppNNvHD6c39h1V+jJIS09fOkViOiiBcMeql2I=;
	b=BLM7rAdiywad7MgsI7+N30y4AC0wDH3+sF2futYcmp3KzN+euTavAlPUfL3yVwhfFg0myFcZRx/Nat//nIdqKjxcUiXa++H9wJI+q74ou7dRbCNxHBdzG9M2i9pvuSdrJQ2NtljzwkEhNaVxJDxOvoBKw3el8pY//GzfS75mR0E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:0525448c-0415-4cc5-befc-4f7c83305df1,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18,CLOUDID:47d44c21-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1a155187907b4e19998068188bd2ebcf-20220905
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <nathan.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1580930284; Mon, 05 Sep 2022 20:33:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Sep 2022 10:39:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 6 Sep 2022 10:39:06 +0800
Message-ID: <d2f89e0b4929c6c37f5effe002cdc15b7475e500.camel@mediatek.com>
Subject: Re: [PATCH v1 4/4] drm/mediatek: add mediatek-drm of vdosys0
 support for mt8188
From: Nathan Lu <nathan.lu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
CC: "jason-jh . lin" <jason-jh.lin@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rex-BC Chen
	<rex-bc.chen@mediatek.com>, Enric Balletbo i Serra
	<enric.balletbo@collabora.com>, Moudy Ho <moudy.ho@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
	<wsd_upstream@mediatek.com>, <lancelot.wu@mediatek.com>, amy zhang
	<Amy.Zhang@mediatek.com>
Date: Tue, 6 Sep 2022 10:39:06 +0800
In-Reply-To: <805b7dd82e86e6c2297a5ffbd23be2c568ca29b3.camel@mediatek.com>
References: <20220822033213.15769-1-nathan.lu@mediatek.com>
	 <20220822033213.15769-5-nathan.lu@mediatek.com>
	 <805b7dd82e86e6c2297a5ffbd23be2c568ca29b3.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_203358_203387_FDBACAD9 
X-CRM114-Status: GOOD (  19.48  )
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

Hi CK,

Thanks for your review, and appreciate for all comments and sugestions.
I'll remove io_start variable at next version.
It will be upstream with vdosys1 patch later.

On Mon, 2022-08-22 at 13:50 +0800, CK Hu wrote:
> Hi, Nathan:
> 
> On Mon, 2022-08-22 at 11:32 +0800, nathan.lu wrote:
> > From: Nathan Lu <nathan.lu@mediatek.com>
> > 
> > add driver data of mt8188 vdosys0 to mediatek-drm and the sub
> > driver.
> > 
> > Signed-off-by: amy zhang <Amy.Zhang@mediatek.com>
> > Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 30
> > ++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index d72263c8a621..260514006093 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -178,6 +178,18 @@ static const unsigned int mt8186_mtk_ddp_ext[]
> > =
> > {
> >  	DDP_COMPONENT_DPI0,
> >  };
> >  
> > +static const unsigned int mt8188_mtk_ddp_main[] = {
> > +	DDP_COMPONENT_OVL0,
> > +	DDP_COMPONENT_RDMA0,
> > +	DDP_COMPONENT_COLOR0,
> > +	DDP_COMPONENT_CCORR,
> > +	DDP_COMPONENT_AAL0,
> > +	DDP_COMPONENT_GAMMA,
> > +	DDP_COMPONENT_POSTMASK0,
> > +	DDP_COMPONENT_DITHER0,
> > +	DDP_COMPONENT_DP_INTF0,
> > +};
> > +
> >  static const unsigned int mt8192_mtk_ddp_main[] = {
> >  	DDP_COMPONENT_OVL0,
> >  	DDP_COMPONENT_OVL_2L0,
> > @@ -323,6 +335,20 @@ static const struct mtk_mmsys_match_data
> > mt8186_mmsys_match_data = {
> >  	},
> >  };
> >  
> > +static const struct mtk_mmsys_driver_data
> > mt8188_vdosys0_driver_data
> > = {
> > +	.io_start = 0x1c01d000,
> 
> For only one mmsys, it's not necessary to set io_start.
> 
> Regards,
> CK
> 
> > +	.main_path = mt8188_mtk_ddp_main,
> > +	.main_len = ARRAY_SIZE(mt8188_mtk_ddp_main),
> > +	.mmsys_dev_num = 1,
> > +};
> > +
> > +static const struct mtk_mmsys_match_data mt8188_mmsys_match_data =
> > {
> > +	.num_drv_data = 1,
> > +	.drv_data = {
> > +		&mt8188_vdosys0_driver_data,
> > +	},
> > +};
> > +
> >  static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data
> > =
> > {
> >  	.main_path = mt8192_mtk_ddp_main,
> >  	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
> > @@ -376,6 +402,8 @@ static const struct of_device_id
> > mtk_drm_of_ids[]
> > = {
> >  	  .data = &mt8183_mmsys_match_data},
> >  	{ .compatible = "mediatek,mt8186-mmsys",
> >  	  .data = &mt8186_mmsys_match_data},
> > +	{ .compatible = "mediatek,mt8188-mmsys",
> > +	  .data = &mt8188_mmsys_match_data},
> >  	{ .compatible = "mediatek,mt8192-mmsys",
> >  	  .data = &mt8192_mmsys_match_data},
> >  	{ .compatible = "mediatek,mt8195-mmsys",
> > @@ -734,6 +762,8 @@ static const struct of_device_id
> > mtk_ddp_comp_dt_ids[] = {
> >  	  .data = (void *)MTK_DISP_MUTEX },
> >  	{ .compatible = "mediatek,mt8186-disp-mutex",
> >  	  .data = (void *)MTK_DISP_MUTEX },
> > +	{ .compatible = "mediatek,mt8188-disp-mutex",
> > +	  .data = (void *)MTK_DISP_MUTEX },
> >  	{ .compatible = "mediatek,mt8192-disp-mutex",
> >  	  .data = (void *)MTK_DISP_MUTEX },
> >  	{ .compatible = "mediatek,mt8195-disp-mutex",
> 
> 


