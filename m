Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1200FC04A6A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 14:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtoiTWg/wie+YUV9nDTimeU0umr3skhvQtwNFa8H0qo=; b=cJ8uWBh5/VI1Trl0aDKZX88o4Y
	pOFM0Dodey6Os2lpuB37KknmvUfXvLsjyuRII9ymTkFDQfF+bvaNWS+k9Oyhf3pWKiOkuDFoW2jbS
	qmyi6kZuBFAb5hGOEcwlLka0LAHCHwc/cOc+0zAQWpVW4yDrfiwWFH7fLDhIH1XGIQL+wupKdoCNt
	aNGGIytq+w3avE4CdoS+BdkHNzeJfnOQb0Ckgc0e3z9CxBacGUZ35QY5YqxyQhwxGw/47HFOvXUNO
	o+cDPvp8ykF7OPoDlCgVoXHKYN6v6KCFmm9gVHHCo0OYB1YKVxn9nW8Ri2NzP1lt7GZ/h2vmAkRMU
	oBRrLfhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRZle-009vsC-2E;
	Thu, 03 Aug 2023 14:57:34 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRZlc-009vp5-0T
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 14:57:33 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fe0a3377bfso448421e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 07:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1691074650; x=1691679450;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BtoiTWg/wie+YUV9nDTimeU0umr3skhvQtwNFa8H0qo=;
        b=HFhFpOsy+MD1XmsUcSrWzHh5kJ5zayPAvPM2bAleZEZJZHYQNOIN1yn7A5Ky2AzASs
         M/TgpoL76zoqvgtaT58Sf+7wrFdXCP/ANiaS+mm/zJG6N+T3B0HHpOBq1N96TKTqXLXt
         UuWVXT/0s53DOIegOx4+YP/VGCXMN5rs+Ghi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691074650; x=1691679450;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BtoiTWg/wie+YUV9nDTimeU0umr3skhvQtwNFa8H0qo=;
        b=emJAYnH/Wg9QqEsSwGGJzJKYpD0+MeEezcwWpwoANpF2NLOYa+CXSlrl3U0vnCEYMF
         qTdLcjNP5n+uG23Z1PAm/dxJv9YMtgbKs/gnBENeo8JhN27JaqXwYIsyPRNEqDCTx9rF
         SL8RqOSfjAj3DAsg+HvSuTNRQji8rxZPBDr8ou3agYN5q0F99l2HGeSHI9m95VGk6Gm3
         HxvnrkyOKSCZm3nTdQ4ZPyhhe6R+oDf9zZJBHvzQIuoPREg0YkpYX/Z2NfKgb9EDYhSf
         6kzuNTxBIdrQ+jKat3axywYhaQYrrDbxD41bYCnyiFBjfez8Km15h6QKt/ySefoSlG8B
         I66g==
X-Gm-Message-State: ABy/qLaC3HAgOtGA88h1XWytSqcYD5r0Q5cMn1wzqtHdjQGPQs0E0Ka3
	wQc2WXmfY7gmCmzGSXW6kxgJpw==
X-Google-Smtp-Source: APBJJlEpF0DWzUN+W6T0dNmRzfn5TpxtjrNfgi2K+oa/HBRt3yDg0KvZd/++TnbwzIPjVUChsKzmNQ==
X-Received: by 2002:ac2:44d2:0:b0:4fd:cbd8:17d5 with SMTP id d18-20020ac244d2000000b004fdcbd817d5mr8690927lfm.4.1691074650248;
        Thu, 03 Aug 2023 07:57:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y10-20020a17090668ca00b0099bd1ce18fesm10740953ejr.10.2023.08.03.07.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:57:29 -0700 (PDT)
Date: Thu, 3 Aug 2023 16:57:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Justin Green <greenjustin@chromium.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org, chunkuang.hu@kernel.org,
	jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
	wenst@chromium.org, angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH RESEND] drm/mediatek: Add valid modifier check
Message-ID: <ZMvAV42bm7ZTKXfv@phenom.ffwll.local>
References: <20230724175839.675911-1-greenjustin@chromium.org>
 <ZMtkIHkfhbOCodhw@phenom.ffwll.local>
 <CAHC42Rfz6jjY9RfVsrrPuENgXiaCB7EecH=-Dnfzm0KynGFNjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHC42Rfz6jjY9RfVsrrPuENgXiaCB7EecH=-Dnfzm0KynGFNjA@mail.gmail.com>
X-Operating-System: Linux phenom 6.3.0-2-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_075732_190766_5801AC53 
X-CRM114-Status: GOOD (  36.21  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 03, 2023 at 08:48:56AM -0400, Justin Green wrote:
> > See c91acda3a380 ("drm/gem: Check for valid formats") and the related gem
> fb helper functions to see how this is supposed to be done.
> 
> Oh that's interesting, so does this imply that the infrastructure
> automatically calls format_mod_supported() during framebuffer
> creation? In that case, this entire patch might be unnecessary in the
> tip of tree kernel.

It /should/, but maybe a wheel fell off somewhere. So please double-check
that it doesn indeed work.

Also because we had to put the check into gem helpers, if your driver
doesn't use those but hand-rolls a bit of that code (the helpers predate a
bunch of drivers, not sure all got converted), then you might also have a
validation gap here.

Cheers, Sima

> 
> On Thu, Aug 3, 2023 at 4:24 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Jul 24, 2023 at 01:58:39PM -0400, Justin Green wrote:
> > > Add a check to mtk_drm_mode_fb_create() that rejects any modifier that
> > > is not the AFBC mode supported by MT8195's display overlays.
> > >
> > > Tested by booting ChromeOS and verifying the UI works, and by running
> > > the ChromeOS kms_addfb_basic binary, which has a test called
> > > "addfb25-bad-modifier" that attempts to create a framebuffer with the
> > > modifier DRM_FORMAT_MOD_INVALID and verifies the ADDFB2 ioctl returns
> > > EINVAL.
> > >
> > > Signed-off-by: Justin Green <greenjustin@chromium.org>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > > index cd5b18ef7951..2096e8a794ad 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > > @@ -51,6 +51,13 @@ mtk_drm_mode_fb_create(struct drm_device *dev,
> > >       if (info->num_planes != 1)
> > >               return ERR_PTR(-EINVAL);
> > >
> > > +     if (cmd->modifier[0] &&
> > > +         cmd->modifier[0] != DRM_FORMAT_MOD_ARM_AFBC(
> > > +                                     AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
> > > +                                     AFBC_FORMAT_MOD_SPLIT |
> > > +                                     AFBC_FORMAT_MOD_SPARSE))
> > > +             return ERR_PTR(-EINVAL);
> >
> > If you set the modifiers/format properties correctly and use all the
> > helpers then the drm core should already validate that only formats you
> > can use are allowed.
> >
> > See c91acda3a380 ("drm/gem: Check for valid formats") and the related gem
> > fb helper functions to see how this is supposed to be done. These kind of
> > checks in driver code for gem drivers (which really is everyone at this
> > point) should not be needed at all.
> >
> > Cheers, Sima
> >
> > > +
> > >       return drm_gem_fb_create(dev, file, cmd);
> > >  }
> > >
> > > --
> > > 2.41.0.162.gfafddb0af9-goog
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

