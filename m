Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE52C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 10:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khS2HA7UEPwV/+qo1mYLRSayGOdGzYsbeTt1SMmsiOA=; b=liwpFe+se6ijOOsgQK5cMBOR0B
	70svz73MiTnTU8VxZN/FHkpuqW4Kpm0QOGBN1ssmG+EdLWkvt4g574QsSkATo1ueoViXEckYwXftz
	YeONf6m3/XwzgTOVOrGrVQWBrh7rPwyrYsKRjaGGs0MS5YlUsKp1B+PA6H5MWpNW9yY7Td2KGRoff
	DE6StJn+Zbere5dCjLUdnpB5qMyNiceplZhp5EmXcuedmFHVp1b/Nkja///VTqcyG+BZLlHTSJpuC
	AR172lUIST2ClyCLsGUj9uZrZt+mlSJg5wk3XyNFSU3ZBgKmpltjEoDJ7bq8coMunsxEF4UYPv4IT
	bWeRnjEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1n3u-001wNa-6z; Thu, 16 Jun 2022 10:49:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1n3q-001wLl-NS; Thu, 16 Jun 2022 10:49:16 +0000
X-UUID: 421e4826a4614bda82d14764588572ab-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:28bb4819-a322-4f41-a1a4-c1bce943d688,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:bb9fbf48-4c92-421c-ad91-b806c0f58b2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 421e4826a4614bda82d14764588572ab-20220616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 726920853; Thu, 16 Jun 2022 03:49:10 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 03:49:09 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Jun 2022 18:49:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jun 2022 18:49:07 +0800
Message-ID: <b8a421b7f467ed8b9e08a778957e99544485fd4e.camel@mediatek.com>
Subject: Re: [PATCH v11 11/12] drm/mediatek: dpi: Only enable dpi after the
 bridge is enabled
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
Date: Thu, 16 Jun 2022 18:49:07 +0800
In-Reply-To: <9adfb4b98e505c10469395bf3038010024ab86fd.camel@mediatek.com>
References: <20220613064841.10481-1-rex-bc.chen@mediatek.com>
	 <20220613064841.10481-12-rex-bc.chen@mediatek.com>
	 <9adfb4b98e505c10469395bf3038010024ab86fd.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_034914_816700_46490D6D 
X-CRM114-Status: GOOD (  19.90  )
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

On Tue, 2022-06-14 at 14:24 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Mon, 2022-06-13 at 14:48 +0800, Bo-Chen Chen wrote:
> > From: Guillaume Ranquet <granquet@baylibre.com>
> > 
> > Enabling the dpi too early causes glitches on screen.
> > 
> > Move the call to mtk_dpi_enable() at the end of the bridge_enable
> > callback to ensure everything is setup properly before enabling
> > dpi.
> 
> This seems a bug fix, so add Fixes tag on this patch.
> 
> Regards,
> CK
> 

ok, I will do this using this patch:
f89c696e7f635487481eee0d196ab49730ce8664

> > 
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 08c8f21b4421..9668bd5dd14a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -480,7 +480,6 @@ static int mtk_dpi_power_on(struct mtk_dpi
> > *dpi)
> >  	if (dpi->pinctrl && dpi->pins_dpi)
> >  		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
> >  
> > -	mtk_dpi_enable(dpi);
> >  	return 0;
> >  
> >  err_pixel:
> > @@ -726,6 +725,7 @@ static void mtk_dpi_bridge_enable(struct
> > drm_bridge *bridge)
> >  
> >  	mtk_dpi_power_on(dpi);
> >  	mtk_dpi_set_display_mode(dpi, &dpi->mode);
> > +	mtk_dpi_enable(dpi);
> >  }
> >  
> >  static enum drm_mode_status
> 
> 


