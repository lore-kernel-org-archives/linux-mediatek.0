Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E2AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 08:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5tnyY0K7Ty2XoNOlb7xdXyoNPkDY5L2lwldKnd8BKI=; b=4kyigoU7rhIM8x5WuX1lyM0SEU
	as+S2URxqKeO74EmXMGKgpdJ+bOQ5lL3JUAn27YvVWXQd08f1zOpHXuQW54Kwcob2uYjwZl5ELwd1
	skUV9hf4/vEhJrxFy5gm1ZCQuPULzLk3vD0TMNH0Ub0XFYpYO/LmKkuP5SCHycIIs275/WPdHhDAX
	+KRp8kdxkWZOyx8ARjXZQLVpP+NCkZXJDd0Bo2xENio9tOCC+ooI+MLWzUVSZ+reCK/8inyMjYMZ5
	jM0pnEbV/fWwr61N/+H9fItpQr9a8ybmnT5bqSHDS6ZMA2gK2CsEWFZxTWdJgsecAHcvzprBs+OOH
	0W2M/ZJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ZYV-004PKC-Hs; Tue, 21 Jun 2022 08:48:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ZYR-004PI8-Bo; Tue, 21 Jun 2022 08:48:14 +0000
X-UUID: d0926c4d87db4c1290e57a568e3ed61d-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:6e0a777c-0537-40c4-9156-91c20df6254a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:eeeaa12d-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: d0926c4d87db4c1290e57a568e3ed61d-20220621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1790812499; Tue, 21 Jun 2022 01:48:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 01:39:13 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 21 Jun 2022 16:39:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 21 Jun 2022 16:39:11 +0800
Message-ID: <446b9713cf2ad4313c8f3c8b53dd5295ab1aa575.camel@mediatek.com>
Subject: Re: [PATCH v12 12/14] drm/mediatek: dpi: Add YUV422 output support
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 21 Jun 2022 16:39:11 +0800
In-Reply-To: <d2a6c5044417e1ac8be9e6387951807e619162e8.camel@mediatek.com>
References: <20220620121028.29234-1-rex-bc.chen@mediatek.com>
	 <20220620121028.29234-13-rex-bc.chen@mediatek.com>
	 <d2a6c5044417e1ac8be9e6387951807e619162e8.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_014811_432791_A428D40A 
X-CRM114-Status: GOOD (  20.45  )
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

On Tue, 2022-06-21 at 11:04 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Mon, 2022-06-20 at 20:10 +0800, Bo-Chen Chen wrote:
> > Dp_intf supports YUV422 as output format. In MT8195 Chrome project,
> > YUV422 output format is used for 4K resolution.
> 
> Move this patch before [1]. Otherwise, [1] would result in a bug.
> 
> [1] [v12,10/14] drm/mediatek: dpi: Add dpintf support
> 
ok, I will do this.

> > 
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index f83ecb154457..fc76ccad0a82 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -692,7 +692,10 @@ static int mtk_dpi_bridge_atomic_check(struct
> > drm_bridge *bridge,
> >  	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
> >  	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
> >  	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
> > -	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> > +	if (out_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
> > +		dpi->color_format =
> > MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL;
> > +	else
> > +		dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> 
> If out_bus_format is MEDIA_BUS_FMT_YUV8_1X24, the color_format is
> MTK_DPI_COLOR_FORMAT_RGB?
> 

I will drop output format of MEDIA_BUS_FMT_YUV8_1X24 for mt8195_dpintf
because if support MEDIA_BUS_FMT_YUV8_1X24 means support RGB888.

BRs,
Bo-Chen

> Regards,
> CK
> 
> >  
> >  	return 0;
> >  }
> 
> 


