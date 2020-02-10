Return-Path: <SRS0=lG5C=36=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DE6C2BA83
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 02:52:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 574542086A
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 02:52:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H2NZXPy1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="t65FEvW9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 574542086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7JSkGquUnOTW6CtUJWQS46tYhaugiAF0wkkei68yCc=; b=H2NZXPy1YeYBd0
	qyK6RLilm8jaorCf1ZmBy7nx4Eo1nARRPsab58mNDWcwD32YhWkMIjhyDhcJlVIG5voAkq8InKhbL
	jP9KDvXf+TUso2d5gQlLRe1Rx862nFBlRWWBLC0jLN/Ufq676l8u4Z0JOBkfdA98E2Ri7WbeY8/u+
	tR5dJyEPwy1CKOYw8r31Y5GjSSpGgpolydowFVFq9w0O/U1P+0hzINsu0vndr797K1bQys7Xo9R9D
	6r1N+WjKNqjWlw88aUbSgo5BRPDWrkKTpzJlIVFvUCUu6oW8jpbvk8KsihlerVCOy1Wr4D8kmGSK4
	SHMym11SaKff85mZsl7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j0zBG-0006ac-U0; Mon, 10 Feb 2020 02:52:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j0zB7-0006SD-CQ; Mon, 10 Feb 2020 02:52:06 +0000
X-UUID: 0355937f39ae445597b2eed98d46f735-20200209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=EJpRwbjSh58mj6l2nQ/bNZGk/GQgl0/adoFvtAUjmAg=; 
 b=t65FEvW9RFvsiH+mt1LBXASuu/S25/yu3c0oIIDqK2ea6l0ywQXa7/+/3zWODd46jYK8nZVd063SV/d59UBkd16Xd7fsMAVPZ9jGZsKCdfBr9P3TFXGhNHMKSMrIX6i2YHdq+dDdFQHrHPoX/ECHKLPU2svEuZ/qeKOdLBkC3WQ=;
X-UUID: 0355937f39ae445597b2eed98d46f735-20200209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1389923424; Sun, 09 Feb 2020 18:51:58 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 9 Feb 2020 18:52:32 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 10 Feb 2020 10:50:33 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 10 Feb 2020 10:52:06 +0800
Message-ID: <1581303109.951.1.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Ensure the cursor plane is on top of
 other overlays
From: CK Hu <ck.hu@mediatek.com>
To: Sean Paul <sean@poorly.run>
Date: Mon, 10 Feb 2020 10:51:49 +0800
In-Reply-To: <1580441226.9516.1.camel@mtksdaap41>
References: <20200130192511.81205-1-sean@poorly.run>
 <1580441226.9516.1.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C0506BEC4AA5A41519AE24F56027614D84231C02A31EF03E8A3004DDC58C47C22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200209_185205_432342_0A2765B2 
X-CRM114-Status: GOOD (  15.14  )
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
Cc: dcastagna@chromium.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias
 Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Sean:

On Fri, 2020-01-31 at 11:27 +0800, CK Hu wrote:
> Hi, Sean:
> 
> On Thu, 2020-01-30 at 14:24 -0500, Sean Paul wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> > 
> > Currently the cursor is placed on the first overlay plane, which means
> > it will be at the bottom of the stack when the hw does the compositing
> > with anything other than primary plane. Since mtk doesn't support plane
> > zpos, change the cursor location to the top-most plane.
> > 
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Applied to mediatek-drm-fixes-5.6 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.6

Regards,
CK

> 
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index 0dfcd1787e651..4ac76b9613926 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -689,11 +689,12 @@ static int mtk_drm_crtc_num_comp_planes(struct mtk_drm_crtc *mtk_crtc,
> >  }
> >  
> >  static inline
> > -enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx)
> > +enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx,
> > +					    unsigned int num_planes)
> >  {
> >  	if (plane_idx == 0)
> >  		return DRM_PLANE_TYPE_PRIMARY;
> > -	else if (plane_idx == 1)
> > +	else if (plane_idx == (num_planes - 1))
> >  		return DRM_PLANE_TYPE_CURSOR;
> >  	else
> >  		return DRM_PLANE_TYPE_OVERLAY;
> > @@ -712,7 +713,8 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
> >  		ret = mtk_plane_init(drm_dev,
> >  				&mtk_crtc->planes[mtk_crtc->layer_nr],
> >  				BIT(pipe),
> > -				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr),
> > +				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr,
> > +							num_planes),
> >  				mtk_ddp_comp_supported_rotations(comp));
> >  		if (ret)
> >  			return ret;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
