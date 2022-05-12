Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C39DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 05:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJPdab5YCClxm5d/vTMsTiiOg8jtxnjMdxSfrqkq0WA=; b=ONc1f9wOyXExhj
	ckQPqohvvym/SV5s8Ms+FstXuEIK3/42UMwXz6eB89wX6UUDh+zXEdwq5X6bbre749OYRCrs89zhq
	0pT43TfSKvXUtEOyglT887AQlRfkAIF0CSDe57yBuW1cGlnrkkeKg+AjKztrLCSnuvFWK4Asft90z
	GY/Xn2Ri5Xh30lsbwyJEOa3hPHMeLouXparuKEDQEN19s2zZ7gzaX936TLUGR5TUebulcUrW3f1Oa
	6bjydhBB+QaGz18S+8iH8OYdtQ5uYETYe5SkqEon47GdZsuQCpcm9DUVtDpLM+9xXqSLkmOQZcM8A
	6iYUoaJnozACYLD6NLSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np1GE-00A3f6-Cw; Thu, 12 May 2022 05:21:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np1GB-00A3eC-IM; Thu, 12 May 2022 05:21:13 +0000
X-UUID: 5ad816581e5a458d919a1ed0a89c0ad7-20220511
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:e3428830-cc9a-4736-a0fd-29d5f9a9437e, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:582427f6-13a6-4067-b017-3b2864319134,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 5ad816581e5a458d919a1ed0a89c0ad7-20220511
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 207780230; Wed, 11 May 2022 22:20:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 22:20:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 12 May 2022 13:20:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 12 May 2022 13:20:51 +0800
Message-ID: <a7d3f0d90e45e7845735663d07a8c505113fd789.camel@mediatek.com>
Subject: Re: [PATCH v1, 1/1] drm/mediatek: fixup crtc event null pointer issue
From: CK Hu <ck.hu@mediatek.com>
To: yongqiang.niu <yongqiang.niu@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, David Airlie
 <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Dennis YC
 Hsieh" <dennis-yc.hsieh@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Date: Thu, 12 May 2022 13:20:51 +0800
In-Reply-To: <07e3873240945e8f352ba252c0b9ca727a1a3c2e.camel@mediatek.com>
References: <20220314074239.28507-1-yongqiang.niu@mediatek.com>
 <20220314074239.28507-2-yongqiang.niu@mediatek.com>
 <9f14d6a0aa782a8f6c3e7044fe90d74b80d17ed0.camel@mediatek.com>
 <07e3873240945e8f352ba252c0b9ca727a1a3c2e.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_222111_637506_352A5909 
X-CRM114-Status: GOOD (  26.87  )
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

Hi, Yongqiang:

On Wed, 2022-05-11 at 18:08 +0800, yongqiang.niu wrote:
> On Mon, 2022-03-28 at 17:34 +0800, CK Hu wrote:
> > Hi, Yongqiang:
> > 
> > On Mon, 2022-03-14 at 15:42 +0800, Yongqiang Niu wrote:
> > > if crtc event is null pointer, do not send vblank event
> > 
> > This is a bug-fix, so add a Fixes tag here.
> 
> Fixes tag will be added in next version.
> > 
> > > 
> > > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > index d661edf7e0fe..265fed446628 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > @@ -92,6 +92,9 @@ static void
> > > mtk_drm_crtc_finish_page_flip(struct
> > > mtk_drm_crtc *mtk_crtc)
> > >  	struct drm_crtc *crtc = &mtk_crtc->base;
> > >  	unsigned long flags;
> > >  
> > > +	if (!mtk_crtc->event)
> > > +		return;
> > > +
> > >  	spin_lock_irqsave(&crtc->dev->event_lock, flags);
> > >  	drm_crtc_send_vblank_event(crtc, mtk_crtc->event);
> > 
> > I think pending_needs_vblank is used to protect this situation. It
> > seems that pending_needs_vblank should be protected by critical
> > section.
> > 
> > Regards,
> > CK
> 
> actually, in the NG case pending_needs_vblank is true, but crtc-
> >event
> is null.

It looks like that other driver access an invalid address which store
mtk_crtc->event, so mediatek drm driver has no bug and we should fix
the bug from other driver. This work around does not fix bug but just
hide the bug. So try to fix this bug in other driver.

Regards,
CK

> 
> > 
> > >  	drm_crtc_vblank_put(crtc);
> > 
> > 
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
