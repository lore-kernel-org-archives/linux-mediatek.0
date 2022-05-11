Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DF8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 10:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DuH3DXOQpvPaZvfAUOcVm0XBDpNA3rDKo4Ai2xn3z1U=; b=cVfvtVgbqP0SYa
	tyKO1B11zX2yQVcrKBLWlUrMzicTSOcFJas4/S7BQ0Mg/2kvxUykhzXGasYm5JqncjyRZqjcsis6T
	YccJPWAIBiYHs2gI9NOQeLf+eTKWRYAVWUMv41lqBUmQNdQIaP49kk1woVlRIIx1MQRJ/YHzwmY0Y
	LwUp3dcWOV/zBcRdlJ6RI2QxIopRIUKI06o/LcyIslEisVATtUOQPmF5xXrP+DYCreLPwd6otpEAs
	/cMIOHYmsTY5qwqNutHsTtTQi03TI/gcO0M75Ld3FkfgM/cQtG7NtLZeGpE4wzeyIwJCvlGHzgdD/
	GiL+ZVMm8Ra/y98bkMYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nojQp-006KMK-0w; Wed, 11 May 2022 10:18:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nojQm-006KKv-Gs; Wed, 11 May 2022 10:18:57 +0000
X-UUID: e50f25636bc240c0b136add308a4701a-20220511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Cx+NqRIlKyfbviLdo1ub3z2eAq0hVTp78b3z0CU04fA=; 
 b=Jz5k1gdro050pNueEnOpO0/X9k7VYea+BBv5tA+hn3Vaf8TukRNJ1reypDt2WSDY41Yqwq//n4gkYTTo8DW6FA1bJ3qF1iLPukfqRzeIFY7LUz6kdhhUMJAO0NaVL6WhQKC1hrzm+GzMqaKosk5cEFuWVcJnNkEskuTyJq0peV4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:22576cfc-a573-4b12-baa6-7aafa9173cbe, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:2
X-CID-META: VersionHash:faefae9, CLOUDID:5fe917e6-38f2-431d-8de7-bf8fac490b0a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: e50f25636bc240c0b136add308a4701a-20220511
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1211154033; Wed, 11 May 2022 03:18:51 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 03:08:49 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 18:08:47 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 May 2022 18:08:45 +0800
Message-ID: <07e3873240945e8f352ba252c0b9ca727a1a3c2e.camel@mediatek.com>
Subject: Re: [PATCH v1, 1/1] drm/mediatek: fixup crtc event null pointer issue
From: yongqiang.niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, David Airlie
 <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Dennis YC
 Hsieh" <dennis-yc.hsieh@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Date: Wed, 11 May 2022 18:08:45 +0800
In-Reply-To: <9f14d6a0aa782a8f6c3e7044fe90d74b80d17ed0.camel@mediatek.com>
References: <20220314074239.28507-1-yongqiang.niu@mediatek.com>
 <20220314074239.28507-2-yongqiang.niu@mediatek.com>
 <9f14d6a0aa782a8f6c3e7044fe90d74b80d17ed0.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_031856_609591_E1DC4ECE 
X-CRM114-Status: GOOD (  19.81  )
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

On Mon, 2022-03-28 at 17:34 +0800, CK Hu wrote:
> Hi, Yongqiang:
> 
> On Mon, 2022-03-14 at 15:42 +0800, Yongqiang Niu wrote:
> > if crtc event is null pointer, do not send vblank event
> 
> This is a bug-fix, so add a Fixes tag here.

Fixes tag will be added in next version.
> 
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index d661edf7e0fe..265fed446628 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -92,6 +92,9 @@ static void mtk_drm_crtc_finish_page_flip(struct
> > mtk_drm_crtc *mtk_crtc)
> >  	struct drm_crtc *crtc = &mtk_crtc->base;
> >  	unsigned long flags;
> >  
> > +	if (!mtk_crtc->event)
> > +		return;
> > +
> >  	spin_lock_irqsave(&crtc->dev->event_lock, flags);
> >  	drm_crtc_send_vblank_event(crtc, mtk_crtc->event);
> 
> I think pending_needs_vblank is used to protect this situation. It
> seems that pending_needs_vblank should be protected by critical
> section.
> 
> Regards,
> CK
actually, in the NG case pending_needs_vblank is true, but crtc->event
is null.

> 
> >  	drm_crtc_vblank_put(crtc);
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
