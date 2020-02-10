Return-Path: <SRS0=lG5C=36=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668FBC352A4
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 02:53:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C9682086A
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 02:53:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dO4ZlCx6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Lae74vM2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C9682086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRgRFQIO1QUZBYbTMV4pS7FZk7KFLynp0tq2Dggxw+A=; b=dO4ZlCx62uHlbN
	lrlfPi8OYzSxDJQQ9oHoy7D7fNviXuoK/VQtzRON2b8ubHur++ZfKPWc6Of45UqGDXm9m6y/tFZR8
	1h9cxpgrry6Actpv3UVrZTXnLhds9i0nQsewdXoCQxeujmNlf9m8jeg6MNdR85vJuUGhJeAWV5vxB
	rnqvdWiAtg2aDFsh/H+RQY4nmv/tvPDGXnYafxJ6DHRqUMpUglKxU6U9NgV+e6ygv8jl8MnnQYP6F
	cK2s+eA/EpxuT5y2Hx0p9brR5pNvIpnPNPsQ4tZ+Bh+6SlMlNdYm/z1k4YDNBLUlielrjMOHRFI9U
	elKvtWMqwo4i/RuHMfLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j0zCF-0006kX-Oj; Mon, 10 Feb 2020 02:53:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j0zCD-0006k5-5a; Mon, 10 Feb 2020 02:53:14 +0000
X-UUID: cd411884028c4fb082d5d1214dda46e7-20200209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=W9H3gUT21gGxakLPlN7C+OdzFLN/Tl44T7eG40NyIp0=; 
 b=Lae74vM2lIGTQnPzJo/fh/ko34RNSZ4n9XoVN6pkcEpVpsT8Ii2WMVvVkuXVdCpP9TvwJ+CWzxE2MbQJML09lHlOdQvbVglMlbQAJ7F4sD/CvODLq3Rk+MxiTpMuIMSb5vg2EWrkxHetweCevm8ifcFM4eJoclnBBGmRgkvvK8E=;
X-UUID: cd411884028c4fb082d5d1214dda46e7-20200209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1799714164; Sun, 09 Feb 2020 18:53:10 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 9 Feb 2020 18:53:13 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 10 Feb 2020 10:52:18 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 10 Feb 2020 10:53:24 +0800
Message-ID: <1581303187.951.2.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Find the cursor plane instead of hard
 coding it
From: CK Hu <ck.hu@mediatek.com>
To: Evan Benn <evanbenn@chromium.org>
Date: Mon, 10 Feb 2020 10:53:07 +0800
In-Reply-To: <1581064499.590.0.camel@mtksdaap41>
References: <20200206140140.GA18465@art_vandelay>
 <20200207152348.1.Ie0633018fc787dda6e869cae23df76ae30f2a686@changeid>
 <1581064499.590.0.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200209_185313_212631_F840428E 
X-CRM114-Status: GOOD (  13.88  )
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Evan:

On Fri, 2020-02-07 at 16:34 +0800, CK Hu wrote:
> Hi, Evan:
> 
> On Fri, 2020-02-07 at 15:23 +1100, Evan Benn wrote:
> > The cursor and primary planes were hard coded.
> > Now search for them for passing to drm_crtc_init_with_planes
> > 
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Applied to mediatek-drm-fixes-5.6 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.6

Regards,
CK

> 
> > Signed-off-by: Evan Benn <evanbenn@chromium.org>
> > ---
> > 
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index 7b392d6c71cc..935652990afa 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -658,10 +658,18 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
> >  
> >  static int mtk_drm_crtc_init(struct drm_device *drm,
> >  			     struct mtk_drm_crtc *mtk_crtc,
> > -			     struct drm_plane *primary,
> > -			     struct drm_plane *cursor, unsigned int pipe)
> > +			     unsigned int pipe)
> >  {
> > -	int ret;
> > +	struct drm_plane *primary = NULL;
> > +	struct drm_plane *cursor = NULL;
> > +	int i, ret;
> > +
> > +	for (i = 0; i < mtk_crtc->layer_nr; i++) {
> > +		if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_PRIMARY)
> > +			primary = &mtk_crtc->planes[i];
> > +		else if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_CURSOR)
> > +			cursor = &mtk_crtc->planes[i];
> > +	}
> >  
> >  	ret = drm_crtc_init_with_planes(drm, &mtk_crtc->base, primary, cursor,
> >  					&mtk_crtc_funcs, NULL);
> > @@ -830,9 +838,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
> >  			return ret;
> >  	}
> >  
> > -	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, &mtk_crtc->planes[0],
> > -				mtk_crtc->layer_nr > 1 ? &mtk_crtc->planes[1] :
> > -				NULL, pipe);
> > +	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
> >  	if (ret < 0)
> >  		return ret;
> >  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
