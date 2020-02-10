Return-Path: <SRS0=lG5C=36=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32BCC352A5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 14:11:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9515F20714
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 14:11:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Od0PQJtB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="G4uXB900"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9515F20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9sjld+irBQb4P8WHzamFEyVuo1iP+mmV6QDezw+BNB4=; b=Od0PQJtBnmFKjA
	su9mBOGjIu/kB9YHQSCYfGGYJ2cwsKnqxLkNL1sBg8gE6ZSPo0u0zJbPiTcwngVDZ6RyUYnz5BS9E
	QGEKs7BCBz2UrNO0doL8WAxnuVoPN9VHjqnQEd9ZXePwTTRPdaWeolh1vYkQ77upKmx4K0q+chFUr
	+LrTzBLUoBMtWy4Znmv5wNNtg4i3Q7h0QD8Vd3ZbRWh6E+71oDqkjyWVSQ2w4DcspuTCeTAXiandN
	ZPx5NZ+r4cTEGQtz3j6R31miuOu2aupPJmmTjUkKhJbb5C0v9n7wbEhypPljB85+hmXQTm+xKmzwA
	MFCvvvkqkZzIm/r6zsQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j19mY-0002hl-T6; Mon, 10 Feb 2020 14:11:26 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j19mV-0002gm-Nq
 for linux-mediatek@lists.infradead.org; Mon, 10 Feb 2020 14:11:25 +0000
Received: by mail-io1-xd42.google.com with SMTP id s6so7665253iol.9
 for <linux-mediatek@lists.infradead.org>; Mon, 10 Feb 2020 06:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FX0VcA61hup+M1eG33dRqyta/5/xteIuWl8koiSPDi4=;
 b=G4uXB900exoea2ii7+OFpaGuRK0OPIwrn5b/qyL1D2Q9SXUY52mV/GbNkHjMPnchAM
 ph7SyUwqgpei3jx8lD4a2qYiY8mhLmqs3rciAPdjTSxjBZSlhSwL+K5ny5rILoVPrv3K
 J48MqqhzBHWtUo3Y0ytkyzGLqroOVBCzNr/sxerxfodFVtmee1wXpdhLvt3EBdk3LnPN
 3WT9oeSCayoMbkTRIdriomu+/UmKLxQ5ZKy7yrZbimr7zSx9r6ju33sS2XOZyJiYvUUs
 oP2DGX5M3gjG49im59BCr2dlcbr00eT7960geinWms86EIHtLSGo6OUV128LQvBM4LRW
 S1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FX0VcA61hup+M1eG33dRqyta/5/xteIuWl8koiSPDi4=;
 b=GeOwxOb1IdJR8vuHjmxkRtJ3KTClG7MtKbEeylq92keyRLfjVJkizTDzNbhiSpkS3o
 StZDloAAyStjbEDfgawMnfwk464RF9uGGkmLvOOsvda+8+147B0UTP5UMF3rf+iM8utp
 v1UbP4No/0gfNwqRbM5/CifBcPIvvoQIlNMg4u793SY9DqI9FGa9XxOOnv66YEgmAL0a
 6ZD2GZin0JEP8NpeSiVg3G18+Td/1+kAC01NadKotUMIw1sZ50OjU0bBFsrMZL38Yx90
 gCQAeykUlj6i4ZHfBBhxt+qYcsALLiTGNdu4tAUdj3ZZUE7csDAoK0APkda6fcrm7dDF
 mkYQ==
X-Gm-Message-State: APjAAAX1DAbCR+/qh05wJZKzkbq4WwUxM2/L5Y2BenBf/JY4gk5DMPgl
 nvIVmRsXPGI6lAUqis5yPFfhxKU9obZ8Nq1O7pc84A==
X-Google-Smtp-Source: APXvYqwvxGWSdp4d4hKFIroc+x/DYVtfIyyldKkT3VpcOseZggDqKWwOctEN63TfW1gHDPo2n3ZDqZMJVhAWtbOk4dE=
X-Received: by 2002:a6b:f206:: with SMTP id q6mr9531130ioh.264.1581343878489; 
 Mon, 10 Feb 2020 06:11:18 -0800 (PST)
MIME-Version: 1.0
References: <20200206140140.GA18465@art_vandelay>
 <20200207152348.1.Ie0633018fc787dda6e869cae23df76ae30f2a686@changeid>
 <1581064499.590.0.camel@mtksdaap41> <1581303187.951.2.camel@mtksdaap41>
In-Reply-To: <1581303187.951.2.camel@mtksdaap41>
From: Sean Paul <sean@poorly.run>
Date: Mon, 10 Feb 2020 09:10:42 -0500
Message-ID: <CAMavQKLqr=a=WZKFfC2sEBcskjX+k-82a3V3XVk7LQLzpAMaBg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Find the cursor plane instead of hard
 coding it
To: CK Hu <ck.hu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_061123_826357_7CEF398E 
X-CRM114-Status: GOOD (  17.89  )
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

On Sun, Feb 9, 2020 at 9:53 PM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Evan:
>
> On Fri, 2020-02-07 at 16:34 +0800, CK Hu wrote:
> > Hi, Evan:
> >
> > On Fri, 2020-02-07 at 15:23 +1100, Evan Benn wrote:
> > > The cursor and primary planes were hard coded.
> > > Now search for them for passing to drm_crtc_init_with_planes
> > >
> >
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
>
> Applied to mediatek-drm-fixes-5.6 [1], thanks.
>

Hi CK,
Thanks for picking this up. Before you send the pull, could you please
reverse the order of these 2 patches? Evan's should come before mine
to prevent a regression.

Sean

> [1]
> https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.6
>
> Regards,
> CK
>
> >
> > > Signed-off-by: Evan Benn <evanbenn@chromium.org>
> > > ---
> > >
> > >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 18 ++++++++++++------
> > >  1 file changed, 12 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > index 7b392d6c71cc..935652990afa 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > @@ -658,10 +658,18 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
> > >
> > >  static int mtk_drm_crtc_init(struct drm_device *drm,
> > >                          struct mtk_drm_crtc *mtk_crtc,
> > > -                        struct drm_plane *primary,
> > > -                        struct drm_plane *cursor, unsigned int pipe)
> > > +                        unsigned int pipe)
> > >  {
> > > -   int ret;
> > > +   struct drm_plane *primary = NULL;
> > > +   struct drm_plane *cursor = NULL;
> > > +   int i, ret;
> > > +
> > > +   for (i = 0; i < mtk_crtc->layer_nr; i++) {
> > > +           if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_PRIMARY)
> > > +                   primary = &mtk_crtc->planes[i];
> > > +           else if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_CURSOR)
> > > +                   cursor = &mtk_crtc->planes[i];
> > > +   }
> > >
> > >     ret = drm_crtc_init_with_planes(drm, &mtk_crtc->base, primary, cursor,
> > >                                     &mtk_crtc_funcs, NULL);
> > > @@ -830,9 +838,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
> > >                     return ret;
> > >     }
> > >
> > > -   ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, &mtk_crtc->planes[0],
> > > -                           mtk_crtc->layer_nr > 1 ? &mtk_crtc->planes[1] :
> > > -                           NULL, pipe);
> > > +   ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
> > >     if (ret < 0)
> > >             return ret;
> > >
> >
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
