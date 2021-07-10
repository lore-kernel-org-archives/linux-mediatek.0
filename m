Return-Path: <SRS0=Fd5v=MC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BABC07E95
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 07:23:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E54FB613C3
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 07:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E54FB613C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wuYH2aygH8RIIqJaolzPqXYs8cd+ArDrhQAIG5ga5Y8=; b=d5JcZ1LZkvatwV
	TURwlGCxAZjpf5/FeSroOPU169u/O1AiaTZOU27DkIih3FYRPvg1PHwTnVC1OslcdLc2Pd37pryQz
	8D5vVfLJ0Bt70CEJ8saGaANug3dB1Zuw0+cFKcoDqiQyn7oiWSnS3aPMKd/wiZaQj1+4t+lxNVAEF
	43ubWWYxguheB8nAKeIkYuve0FsrR/spO0WtVV21mvezuVFeKU9nXlv+Z0DswaUcyKaMX+Bg0Aj4r
	c8FRzGucJk49RSbFdz2QBuUvSA06NYUZbLKH3zDlfcA/T9ASJCRMPzM70hZkKi7E7FzlSZKEBsJ0+
	b8V7e4YGf1xyuN6LLvRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m27KC-003ETo-VD; Sat, 10 Jul 2021 07:22:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m27Jz-003ER5-VR; Sat, 10 Jul 2021 07:22:45 +0000
X-UUID: 5e1d30fa2467479ba8aad72fd7616056-20210710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Vg7kkK3ymZSbjBH6a6slF/p57CVU3Geh15a8IH3+LaE=; 
 b=JqHit2EqUSUG6yOXk3Ol1AXuWrSJdhaiq9T61TPSiNc8Rk34zlRTckvxLyFOoK9ZzVvJpLKfneOPZ6hNklwhWzq8bsLYmHKf5Qm4TLIlHtaWAGx3FuJ79J5r8e/ectwaNz/Dm78ld66qZQl91zlPDMPIb8SjIXm/7ewf57AxLUU=;
X-UUID: 5e1d30fa2467479ba8aad72fd7616056-20210710
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 99755818; Sat, 10 Jul 2021 00:22:35 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 00:22:33 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 15:22:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Jul 2021 15:22:25 +0800
Message-ID: <ffb03cb6a7f473791731df60641bedb45bcdd85c.camel@mediatek.com>
Subject: Re: [PATCH v1 12/17] drm/mediatek: add CCORR support for MT8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Sat, 10 Jul 2021 15:22:25 +0800
In-Reply-To: <1625637767.7824.23.camel@mtksdaap41>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
 <20210707041249.29816-13-jason-jh.lin@mediatek.com>
 <1625637767.7824.23.camel@mtksdaap41>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_002244_667910_7EF10037 
X-CRM114-Status: GOOD (  15.92  )
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

On Wed, 2021-07-07 at 14:02 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Wed, 2021-07-07 at 12:12 +0800, jason-jh.lin wrote:
> > Add CCORR support for MT8195.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 2 ++
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c    | 2 ++
> >  2 files changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> > index 141cb36b9c07..8188b220cc6d 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
> > @@ -208,6 +208,8 @@ static const struct mtk_disp_ccorr_data
> > mt8183_ccorr_driver_data = {
> >  static const struct of_device_id mtk_disp_ccorr_driver_dt_match[]
> > = {
> >  	{ .compatible = "mediatek,mt8183-disp-ccorr",
> >  	  .data = &mt8183_ccorr_driver_data},
> > +	{ .compatible = "mediatek,mt8195-disp-ccorr",
> > +	  .data = &mt8183_ccorr_driver_data},
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_disp_ccorr_driver_dt_match);
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index 28bf4a11efb0..058b50d0e64b 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -440,6 +440,8 @@ static const struct of_device_id
> > mtk_ddp_comp_dt_ids[] = {
> >  	  .data = (void *)MTK_DISP_WDMA },
> >  	{ .compatible = "mediatek,mt8183-disp-ccorr",
> >  	  .data = (void *)MTK_DISP_CCORR },
> > +	{ .compatible = "mediatek,mt8195-disp-ccorr",
> > +	  .data = (void *)MTK_DISP_CCORR },
> 
> The same question as OVL and COLOR.
> 
> Regards,
> CK
> 
Hi CK,

OK, I'll remove this patch at the next version.

Regard,
Jason-JH.Lin
> >  	{ .compatible = "mediatek,mt2701-disp-color",
> >  	  .data = (void *)MTK_DISP_COLOR },
> >  	{ .compatible = "mediatek,mt8173-disp-color",
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
