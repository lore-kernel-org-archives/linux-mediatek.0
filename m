Return-Path: <SRS0=52uS=37=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15350C352A4
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Feb 2020 01:19:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB9C220708
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Feb 2020 01:19:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dwGLcua7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Tktp5Tts"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB9C220708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PL6AclMZ+X9FHmtJjwSKJM/SftHg6U5xbzhpJCqQizA=; b=dwGLcua7x1NOMV
	ZQcnglj5Ah2X8P6hx7a574jBNtp16EyUIE/Arv5Er8Qkz0WA7ivdeJvUmG0tZrCM76/1Wmvt5qU9r
	gyz3bdbsupg67pzj/L8284+36uz+tkFkJyZhVJceFTwiiBi9jfjXqZIanGku40FkbTnPlMq7oG/yM
	oxBXaOEy8ezyOHgxACENhdA/kD8pVNRvv8+qy0A9SlLHgAiibg5ZOidepkKZlNz84xsaBClc9k/Hn
	sCvizllOX6JnuaKhl7MdpQnvlp42AuQciaB+1FWPQKcVo3mADak0svHRClrBdtlZ09drF4syQ4XpJ
	/jwAPYT9wuMe8FKLfslg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1KDK-00076K-Lt; Tue, 11 Feb 2020 01:19:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1KDH-000756-Gy; Tue, 11 Feb 2020 01:19:45 +0000
X-UUID: 2bd2d24f8b8d4ed6aacb6406d9c7b159-20200210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=mxKXHpMsJ5tja8hbUWbIbhD1W2Y9D1qbD+njzeGZeLo=; 
 b=Tktp5Ttsa726dao3RTS7GoXNd3YZYVkBSmBNjTBUHKgRcmtOlWHLtbpvTeZ0H+EMYjJVOfPSXOkbwQX8qcIzttInXfMIfiR9XW6jUSLcpkveZBE6B7qJcZXuFuhFpsrbnepqeSobKjpdZefnXWfoCuKQ1OBPbbkV4FsBfRWGU3s=;
X-UUID: 2bd2d24f8b8d4ed6aacb6406d9c7b159-20200210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 637836253; Mon, 10 Feb 2020 17:19:37 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 10 Feb 2020 17:19:42 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Feb 2020 09:18:52 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 11 Feb 2020 09:20:00 +0800
Message-ID: <1581383974.3194.1.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Find the cursor plane instead of hard
 coding it
From: CK Hu <ck.hu@mediatek.com>
To: Sean Paul <sean@poorly.run>
Date: Tue, 11 Feb 2020 09:19:34 +0800
In-Reply-To: <CAMavQKLqr=a=WZKFfC2sEBcskjX+k-82a3V3XVk7LQLzpAMaBg@mail.gmail.com>
References: <20200206140140.GA18465@art_vandelay>
 <20200207152348.1.Ie0633018fc787dda6e869cae23df76ae30f2a686@changeid>
 <1581064499.590.0.camel@mtksdaap41> <1581303187.951.2.camel@mtksdaap41>
 <CAMavQKLqr=a=WZKFfC2sEBcskjX+k-82a3V3XVk7LQLzpAMaBg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_171943_579355_B5A50621 
X-CRM114-Status: GOOD (  18.88  )
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Evan Benn <evanbenn@chromium.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-02-10 at 09:10 -0500, Sean Paul wrote:
> On Sun, Feb 9, 2020 at 9:53 PM CK Hu <ck.hu@mediatek.com> wrote:
> >
> > Hi, Evan:
> >
> > On Fri, 2020-02-07 at 16:34 +0800, CK Hu wrote:
> > > Hi, Evan:
> > >
> > > On Fri, 2020-02-07 at 15:23 +1100, Evan Benn wrote:
> > > > The cursor and primary planes were hard coded.
> > > > Now search for them for passing to drm_crtc_init_with_planes
> > > >
> > >
> > > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> >
> > Applied to mediatek-drm-fixes-5.6 [1], thanks.
> >
> 
> Hi CK,
> Thanks for picking this up. Before you send the pull, could you please
> reverse the order of these 2 patches? Evan's should come before mine
> to prevent a regression.
> 
> Sean
> 

Hi, Sean:

Thanks for your notice. I've reversed the order.

Regards,
CK

> > [1]
> > https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.6
> >
> > Regards,
> > CK
> >
> > >
> > > > Signed-off-by: Evan Benn <evanbenn@chromium.org>
> > > > ---
> > > >
> > > >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 18 ++++++++++++------
> > > >  1 file changed, 12 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > > index 7b392d6c71cc..935652990afa 100644
> > > > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > > @@ -658,10 +658,18 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
> > > >
> > > >  static int mtk_drm_crtc_init(struct drm_device *drm,
> > > >                          struct mtk_drm_crtc *mtk_crtc,
> > > > -                        struct drm_plane *primary,
> > > > -                        struct drm_plane *cursor, unsigned int pipe)
> > > > +                        unsigned int pipe)
> > > >  {
> > > > -   int ret;
> > > > +   struct drm_plane *primary = NULL;
> > > > +   struct drm_plane *cursor = NULL;
> > > > +   int i, ret;
> > > > +
> > > > +   for (i = 0; i < mtk_crtc->layer_nr; i++) {
> > > > +           if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_PRIMARY)
> > > > +                   primary = &mtk_crtc->planes[i];
> > > > +           else if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_CURSOR)
> > > > +                   cursor = &mtk_crtc->planes[i];
> > > > +   }
> > > >
> > > >     ret = drm_crtc_init_with_planes(drm, &mtk_crtc->base, primary, cursor,
> > > >                                     &mtk_crtc_funcs, NULL);
> > > > @@ -830,9 +838,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
> > > >                     return ret;
> > > >     }
> > > >
> > > > -   ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, &mtk_crtc->planes[0],
> > > > -                           mtk_crtc->layer_nr > 1 ? &mtk_crtc->planes[1] :
> > > > -                           NULL, pipe);
> > > > +   ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
> > > >     if (ret < 0)
> > > >             return ret;
> > > >
> > >
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
