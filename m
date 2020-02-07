Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4ECDC2BA83
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 17:29:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76EF92082E
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 17:29:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VWXm4ux+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="JiDfGPDA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76EF92082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nqOQxOvAJxSSrWnDVA8lNMSUNK2oSkbnng6JU0iWMFU=; b=VWXm4ux+etbKks
	80WTA1Z2xKDbJHISYDue0dDtEb9LQIWTDYGeJpNCI8MWDuHaOn0BeEW/mvcUqIUQYG5mwbGCaClQG
	7BuOczzJrFppFavMD7cTSuVMdKJOy+xdsdrrQNFF/CWTqawQugLbKZ7XvuoV0x6MKGxoBnM9JK/vX
	JhiQRJzU38nraT9Eax/GDQbmDsvPo37+g7AXaeW5KEROS0vR/25W1Ka3jVEiDLJo7PEhZepVXc9BG
	X63eHXhls5lG0KoB3p3WNuCpZaU8wDqmMXdNr59y+KeijhSCTxxX6H1tsflneBk0EdImBnHolLJtf
	vWUu0MFebrVwranuHVIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j07RA-00023l-MR; Fri, 07 Feb 2020 17:29:04 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j07R7-00022v-MH
 for linux-mediatek@lists.infradead.org; Fri, 07 Feb 2020 17:29:03 +0000
Received: by mail-il1-x143.google.com with SMTP id p8so165228iln.12
 for <linux-mediatek@lists.infradead.org>; Fri, 07 Feb 2020 09:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SQthra+5Tb+MdByAUBovPY1PsDx5TneOE+jweSiM4d0=;
 b=JiDfGPDAovB+nWhtAim+Qoa8yJlNkdbELjctfRTRJacs8IQcvDG9LBHzFe9BQE3eQv
 dUOCXG2MkvMvtLIh2LL+PXl2A83qDPOOQrPwvxURTxkykvPzQq6O5rtHvJNfil+Wn/Bo
 26tHe3ii1y1hyDj1HOvXvj+PTlB10z9cnA5mkIB6LDRdAOD0NxM3SbGze+LUNFmHgViB
 CyLR7MuxG0ICSeU2tg1kFLHrIKcn4LFjnwP1nfxJIN8EEMoKzlCYC4AZ2/cC3ObGDdgc
 +RCPQknvTwh8bsAvfydBTTSoj58aGw3qrXn7mVRUyXM3ddYoZ1mUnVg0ap2PgDZLn/8d
 xo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SQthra+5Tb+MdByAUBovPY1PsDx5TneOE+jweSiM4d0=;
 b=StzInuIUXg42a253qWv8pSXsmLagY8j0mR7bp5k88Lql8QdV0093p6YDZSn7SPGaTG
 YN+aI1ZTjwZS1LpvJ7N0na2DPLFv0YcXbXUxC7ddFRD7s4iIvgzoP4PZ9hWeiDwbbYzg
 BADyGQSbnWdcdvFHL2IwBo2BElqj7hMvl6ms2dm+jtv+aZlh7xeRnTvqaOfx2kKln+yq
 mYXkb8XULigZ5dONkqvoq0XiCXsycu9DeCw5KZ3g7hS4QHbKI7kGiIdXqSWfXm2tsjS/
 8T4boDlshqbMikRuw11jbXjijERGPNuwFOR2G8z3WbfuyYmTxNP+1vivYSrlMCcAJxoG
 +A0g==
X-Gm-Message-State: APjAAAW8XflcI9plRBuCuOYZ+CjhPPIHWgFEpDU5+B+92bVPunShIQC3
 D3sOiBOweoa32HHgfM3//HbCpZaUdMFh3cCV3Riqbw==
X-Google-Smtp-Source: APXvYqwXFhIati6Vp0GDfgQt0l5PZHt8xFRskEGYtNtbtsgxbozzjhsd86PDJjPrBvQAZjGbzw1snCPkeL1BuMgVfjk=
X-Received: by 2002:a92:88c4:: with SMTP id m65mr450018ilh.165.1581096540300; 
 Fri, 07 Feb 2020 09:29:00 -0800 (PST)
MIME-Version: 1.0
References: <20200206140140.GA18465@art_vandelay>
 <20200207152348.1.Ie0633018fc787dda6e869cae23df76ae30f2a686@changeid>
In-Reply-To: <20200207152348.1.Ie0633018fc787dda6e869cae23df76ae30f2a686@changeid>
From: Sean Paul <sean@poorly.run>
Date: Fri, 7 Feb 2020 12:28:24 -0500
Message-ID: <CAMavQKKZAYgpCLPodWw0pS1na7rthuJy8DkSvexOb+TRKHeKfg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Find the cursor plane instead of hard
 coding it
To: Evan Benn <evanbenn@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_092901_782302_CC875020 
X-CRM114-Status: GOOD (  13.97  )
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
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 6, 2020 at 11:24 PM Evan Benn <evanbenn@chromium.org> wrote:
>
> The cursor and primary planes were hard coded.
> Now search for them for passing to drm_crtc_init_with_planes
>
> Signed-off-by: Evan Benn <evanbenn@chromium.org>

I like it!

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> ---
>
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 7b392d6c71cc..935652990afa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -658,10 +658,18 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
>
>  static int mtk_drm_crtc_init(struct drm_device *drm,
>                              struct mtk_drm_crtc *mtk_crtc,
> -                            struct drm_plane *primary,
> -                            struct drm_plane *cursor, unsigned int pipe)
> +                            unsigned int pipe)
>  {
> -       int ret;
> +       struct drm_plane *primary = NULL;
> +       struct drm_plane *cursor = NULL;
> +       int i, ret;
> +
> +       for (i = 0; i < mtk_crtc->layer_nr; i++) {
> +               if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_PRIMARY)
> +                       primary = &mtk_crtc->planes[i];
> +               else if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_CURSOR)
> +                       cursor = &mtk_crtc->planes[i];
> +       }
>
>         ret = drm_crtc_init_with_planes(drm, &mtk_crtc->base, primary, cursor,
>                                         &mtk_crtc_funcs, NULL);
> @@ -830,9 +838,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>                         return ret;
>         }
>
> -       ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, &mtk_crtc->planes[0],
> -                               mtk_crtc->layer_nr > 1 ? &mtk_crtc->planes[1] :
> -                               NULL, pipe);
> +       ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
>         if (ret < 0)
>                 return ret;
>
> --
> 2.25.0.341.g760bfbb309-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
