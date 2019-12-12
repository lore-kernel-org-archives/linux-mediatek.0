Return-Path: <SRS0=NAie=2C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC0CC43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 04:55:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A37392173E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 04:55:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZCKj0DhF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IPUJTxwI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A37392173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ofa8s/+Bs4tyNlyfNB+7pTKV0lBS1+YA5/q8p1gKg6M=; b=ZCKj0DhFQ1JxJi
	IRaNHxtd638mfLg0cz8bOvxUQ1WiH8HLoKxPe68yPwS/R24yqPKpenJR04ksMRHrFSbSpaGC7XKU2
	q7uf9qKv3VMMydCP177M1kfp+aT5LvhX+hcRhCIuob3cc7tofRW9ozy5T6IYAdLC39HKxpjDhnpSi
	hBvUT/dfvnbSicCo7df9E5XtfbDbLHgT31bG+Uv4SroWII5i+triigjR/WfZzeS+lVlOfY4P+j79W
	xWFhPL/0+1yD5KbWBemGhdjitW6tv3uRoGWrPLVadOd5l8IlIXf7HHrrJA2AVaTnGAZLQiYZcZpNb
	gABpizYnbDwfX0L3subw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifGVY-0006ZF-2T; Thu, 12 Dec 2019 04:55:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifGVF-0005Wd-AH; Thu, 12 Dec 2019 04:55:07 +0000
X-UUID: 9c9a45e848df4884a0d2ba02da49c21f-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=E+WerAWO7LXcxAkqLk99bj1sr3WlUYbo9Q9kI8fEORY=; 
 b=IPUJTxwI2NNddllHMyhFySNdSF1bZRmbJz/aH5sxtX9jyyRd44Mj3teUXlS+8/PFMrAQBZBGCiDn6VwPsrrwrfeBOJvTgGP0CNsZitfo3H/5tv+JaMuBb92Nzj0Y7EdMg/JCv0NUb6qs6MK/ev3OiB2qRjTbpHQT/VP7lxDZObU=;
X-UUID: 9c9a45e848df4884a0d2ba02da49c21f-20191211
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1076878899; Wed, 11 Dec 2019 20:55:03 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 20:50:19 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 12:48:44 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Dec 2019 12:48:54 +0800
Message-ID: <1576126139.29693.2.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Check return value of
 mtk_drm_ddp_comp_for_plane.
From: CK Hu <ck.hu@mediatek.com>
To: Pi-Hsun Shih <pihsun@chromium.org>
Date: Thu, 12 Dec 2019 12:48:59 +0800
In-Reply-To: <1574409521.12825.0.camel@mtksdaap41>
References: <20191118061806.52781-1-pihsun@chromium.org>
 <1574409521.12825.0.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_205505_372415_CF0F8D3C 
X-CRM114-Status: GOOD (  14.29  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Pi-Hsun:

On Fri, 2019-11-22 at 15:58 +0800, CK Hu wrote:
> Hi, Pi-Hsun:
> 
> On Mon, 2019-11-18 at 14:18 +0800, Pi-Hsun Shih wrote:
> > The mtk_drm_ddp_comp_for_plane can return NULL, but the usage doesn't
> > check for it. Add check for it.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 

Applied to mediatek-drm-fixes-5.5 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.5

Regards,
CK

> > 
> > Fixes: d6b53f68356f ("drm/mediatek: Add helper to get component for a plane")
> > Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index f80a8ba75977..4c4f976c994e 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -310,7 +310,9 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
> >  
> >  		plane_state = to_mtk_plane_state(plane->state);
> >  		comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
> > -		mtk_ddp_comp_layer_config(comp, local_layer, plane_state);
> > +		if (comp)
> > +			mtk_ddp_comp_layer_config(comp, local_layer,
> > +						  plane_state);
> >  	}
> >  
> >  	return 0;
> > @@ -386,8 +388,9 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
> >  			comp = mtk_drm_ddp_comp_for_plane(crtc, plane,
> >  							  &local_layer);
> >  
> > -			mtk_ddp_comp_layer_config(comp, local_layer,
> > -						  plane_state);
> > +			if (comp)
> > +				mtk_ddp_comp_layer_config(comp, local_layer,
> > +							  plane_state);
> >  			plane_state->pending.config = false;
> >  		}
> >  		mtk_crtc->pending_planes = false;
> > @@ -401,7 +404,9 @@ int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
> >  	struct mtk_ddp_comp *comp;
> >  
> >  	comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
> > -	return mtk_ddp_comp_layer_check(comp, local_layer, state);
> > +	if (comp)
> > +		return mtk_ddp_comp_layer_check(comp, local_layer, state);
> > +	return 0;
> >  }
> >  
> >  static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
> > 
> > base-commit: 5a6fcbeabe3e20459ed8504690b2515dacc5246f
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
