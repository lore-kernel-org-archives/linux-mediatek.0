Return-Path: <SRS0=Fd5v=MC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641F5C07E95
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 07:22:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21544613C2
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 07:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21544613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zjgjATCSdf5xjdgLaf1zBZRow5muQuEjqz9unLqSFE4=; b=lftZTKPoYENDYS
	BJYNDklABSltp4QOmuOOSMs6XtmnchX6fv1I4EPmpoU+to9ACAWf1SqcjUFzwIFxK++XlzwOSzNW5
	o7L7w6qCw8yI8C9PS7OOsBhBaSv+0xAx+/tvNALXwbPxjaLCGx0Zq8RjA5ocZDNCF1/tw2UoEltsL
	jX7pe6jFTDLcn/A/EzU305lu2vJm7Y93chwnMWRIPVE5Ua9quQVElj7XgdEHewv6WY6rX9F5+fZNo
	nCrJZuDIXnjvNqf7CFpFDo934I/uY32ZjfWMkXLCJiVlNB0jNfCXGTWuqoHD3z7s9ByYn6aqcayQ3
	x/+Z7Es9gHr36Pj6NCTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m27JQ-003EIy-Ih; Sat, 10 Jul 2021 07:22:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m27JC-003EFQ-DI; Sat, 10 Jul 2021 07:21:55 +0000
X-UUID: fc96942cd626472b8f3718417cdedb31-20210710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xjRV8hrFDJRVVWuHy6a8LhwWoM4suBYQ/gE6TT4NFis=; 
 b=iam/WQD2a3EqzPonXKq1jPOXlrOriv82fccv3qTvku60erX/0SsxHLhwhnvJsMbc5XQ4FjTXsdTg7eso2O5oHL6cdkXmnpY8xM5SmHJM+4V2k3TpkFZXKZpTxpMkRGxka6zBvLEluBi++ML30CV7dv6F3y9n/Dl7Tg+J5mDP+go=;
X-UUID: fc96942cd626472b8f3718417cdedb31-20210710
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 916888531; Sat, 10 Jul 2021 00:21:50 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 00:21:48 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 15:21:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Jul 2021 15:21:46 +0800
Message-ID: <e38f1718d3dbdccb973effe637cabc7bb744a011.camel@mediatek.com>
Subject: Re: [PATCH v1 11/17] drm/mediatek: add COLOR support for MT8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Sat, 10 Jul 2021 15:21:46 +0800
In-Reply-To: <1625637697.7824.22.camel@mtksdaap41>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
 <20210707041249.29816-12-jason-jh.lin@mediatek.com>
 <1625637697.7824.22.camel@mtksdaap41>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_002154_593423_27C75984 
X-CRM114-Status: GOOD (  20.03  )
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

On Wed, 2021-07-07 at 14:01 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Wed, 2021-07-07 at 12:12 +0800, jason-jh.lin wrote:
> > Add COLOR support for MT8195.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_color.c | 6 ++++++
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c    | 2 ++
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_color.c
> > index 63f411ab393b..ce2cf9f504cc 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
> > @@ -149,6 +149,10 @@ static const struct mtk_disp_color_data
> > mt8173_color_driver_data = {
> >  	.color_offset = DISP_COLOR_START_MT8173,
> >  };
> >  
> > +static const struct mtk_disp_color_data mt8195_color_driver_data =
> > {
> > +	.color_offset = DISP_COLOR_START_MT8173,
> > +};
> 
> mt8195_color_driver_data is identical to mt8173_color_driver_data, so
> use mt8173_color_driver_data and remove mt8195_color_driver_data.
> 
> > +
> >  static const struct of_device_id mtk_disp_color_driver_dt_match[]
> > = {
> >  	{ .compatible = "mediatek,mt2701-disp-color",
> >  	  .data = &mt2701_color_driver_data},
> > @@ -156,6 +160,8 @@ static const struct of_device_id
> > mtk_disp_color_driver_dt_match[] = {
> >  	  .data = &mt8167_color_driver_data},
> >  	{ .compatible = "mediatek,mt8173-disp-color",
> >  	  .data = &mt8173_color_driver_data},
> > +	{ .compatible = "mediatek,mt8195-disp-color",
> > +	  .data = &mt8195_color_driver_data},
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_disp_color_driver_dt_match);
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index 8b24623dcd91..28bf4a11efb0 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -444,6 +444,8 @@ static const struct of_device_id
> > mtk_ddp_comp_dt_ids[] = {
> >  	  .data = (void *)MTK_DISP_COLOR },
> >  	{ .compatible = "mediatek,mt8173-disp-color",
> >  	  .data = (void *)MTK_DISP_COLOR },
> > +	{ .compatible = "mediatek,mt8195-disp-color",
> > +	  .data = (void *)MTK_DISP_COLOR },
> 
> Is mediatek,mt8195-disp-color identical to
> mediatek,mt8173-disp-color in hardware function? If so, use the
> compatible
> as
> 
> compatible = "mediatek,mt8195-disp-color", "mediatek,mt8173-disp-
> color";
> 
> And driver just keep "mediatek,mt8173-disp-color" and remove
> "mediatek,mt8195-disp-color".
> 
> If the hardware function has some different, just forget this.
> 
> Regards,
> CK
> 
Hi CK,

OK, I'll remove this patch at the next version.

Regard,
Jason-JH.Lin
> >  	{ .compatible = "mediatek,mt8173-disp-aal",
> >  	  .data = (void *)MTK_DISP_AAL},
> >  	{ .compatible = "mediatek,mt8173-disp-gamma",
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
