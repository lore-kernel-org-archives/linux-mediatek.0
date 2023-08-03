Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5DBEB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 12:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KINzkY+2pTqpgggwDRnN6ZDXxLdRP48C4+yT1alhZW0=; b=gdcK8eHzde0eBJpOIkfmNPND5N
	k0SUnzEEYv1w3NLbkfikg7USUpZJL4vyi5BkJpYA5gsnPZ1SqRZmfFpgWjYVsgvoi4u76hORe83dd
	Uasmd6hSG9dFgLA4t/BuocZmswQVLdR3UiACbtBOHY4gfWBexpoZrEgFXmmB6br0fG8vG8FZ4J0g4
	biKvGbkonW5jbXAd1/eQa3vFekLN7VP2ZRIzOzioqjHoRIXcUnHCb/zcRpYNE3abfIhZ0Q/E5OYF+
	DarY4cxpB2LAEARONE9ClY9IBM0nDfsBQ2mSA+MiJfBmzrFDpfuoewcP+qslh4lsiI/9/6ufD9cQs
	5cPB9yew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRXlR-008c48-1A;
	Thu, 03 Aug 2023 12:49:13 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRXlO-008c0y-14
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 12:49:11 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-26814f65d7fso475088a91.0
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 05:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691066948; x=1691671748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KINzkY+2pTqpgggwDRnN6ZDXxLdRP48C4+yT1alhZW0=;
        b=FLG0aNm32sS+XHN5I5Y+oBXcneb5nhWHffdSaglK04SJWjwdCruhjcCMpGRDmQKEo/
         dUNa5R5rumYhograB20KM5QQblPCxXoQ8ZGQVLvR3UoUkEic8GJvmZpmWcmiIah2dok7
         fbGqVsz9ep9aogRrBoMg9zggdj9lXDLtihA5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691066948; x=1691671748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KINzkY+2pTqpgggwDRnN6ZDXxLdRP48C4+yT1alhZW0=;
        b=VnFDhARnWEoHfF7v9LPz/Q2RMnOd7yPQUKa1gQcp58ppS6XY4k+ELJhzXKfqbez+pu
         5e+NIOOjiOg83jlTHa75v7oaaHFqjuR5GaujDDO+CszEllh99sp9NjyLc1Z5crrKdXQ8
         oPGdOtxWA/iudxw4j+qUSfdmujThqkYAM/B1/Wb9IXXN2M35AgqyJxN5p+B9hjgxpKPf
         4GcEa0PqwiTkpmAIQWXHpnlInOmc5+lQtv7mlkqV2HaeavmQX6h6bdOWUyKL1tkjLLWN
         eI+aJsTCvBBzoKZMIG2qJFybwf2Si+76EtaSAIbXRLTrXdc8V/kD6iC6/HnDstJcvBd7
         wFEw==
X-Gm-Message-State: ABy/qLaaPp74r2auovWKcvvYTZiI4mUo9bCUAZZg6O19YMxAo6h3jvCy
	Mw+4LQ6Mwq1tsL1+lmXwx8/5mbl6jfVvgwEk0zMpNA==
X-Google-Smtp-Source: APBJJlFjhCqu83YatWbs6solrrW1ZC3HnaGzLi79mqRRwPhv8z+cIO3WAE1eJpOmWss6LSTrOliZSTyEMjemBAej5JA=
X-Received: by 2002:a17:90b:4f81:b0:267:f893:d562 with SMTP id
 qe1-20020a17090b4f8100b00267f893d562mr16081750pjb.8.1691066947603; Thu, 03
 Aug 2023 05:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230724175839.675911-1-greenjustin@chromium.org> <ZMtkIHkfhbOCodhw@phenom.ffwll.local>
In-Reply-To: <ZMtkIHkfhbOCodhw@phenom.ffwll.local>
From: Justin Green <greenjustin@chromium.org>
Date: Thu, 3 Aug 2023 08:48:56 -0400
Message-ID: <CAHC42Rfz6jjY9RfVsrrPuENgXiaCB7EecH=-Dnfzm0KynGFNjA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/mediatek: Add valid modifier check
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, 
	wenst@chromium.org, angelogioacchino.delregno@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_054910_394176_73C2C8A4 
X-CRM114-Status: GOOD (  28.76  )
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

> See c91acda3a380 ("drm/gem: Check for valid formats") and the related gem
fb helper functions to see how this is supposed to be done.

Oh that's interesting, so does this imply that the infrastructure
automatically calls format_mod_supported() during framebuffer
creation? In that case, this entire patch might be unnecessary in the
tip of tree kernel.

On Thu, Aug 3, 2023 at 4:24=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
>
> On Mon, Jul 24, 2023 at 01:58:39PM -0400, Justin Green wrote:
> > Add a check to mtk_drm_mode_fb_create() that rejects any modifier that
> > is not the AFBC mode supported by MT8195's display overlays.
> >
> > Tested by booting ChromeOS and verifying the UI works, and by running
> > the ChromeOS kms_addfb_basic binary, which has a test called
> > "addfb25-bad-modifier" that attempts to create a framebuffer with the
> > modifier DRM_FORMAT_MOD_INVALID and verifies the ADDFB2 ioctl returns
> > EINVAL.
> >
> > Signed-off-by: Justin Green <greenjustin@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_drv.c
> > index cd5b18ef7951..2096e8a794ad 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -51,6 +51,13 @@ mtk_drm_mode_fb_create(struct drm_device *dev,
> >       if (info->num_planes !=3D 1)
> >               return ERR_PTR(-EINVAL);
> >
> > +     if (cmd->modifier[0] &&
> > +         cmd->modifier[0] !=3D DRM_FORMAT_MOD_ARM_AFBC(
> > +                                     AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
> > +                                     AFBC_FORMAT_MOD_SPLIT |
> > +                                     AFBC_FORMAT_MOD_SPARSE))
> > +             return ERR_PTR(-EINVAL);
>
> If you set the modifiers/format properties correctly and use all the
> helpers then the drm core should already validate that only formats you
> can use are allowed.
>
> See c91acda3a380 ("drm/gem: Check for valid formats") and the related gem
> fb helper functions to see how this is supposed to be done. These kind of
> checks in driver code for gem drivers (which really is everyone at this
> point) should not be needed at all.
>
> Cheers, Sima
>
> > +
> >       return drm_gem_fb_create(dev, file, cmd);
> >  }
> >
> > --
> > 2.41.0.162.gfafddb0af9-goog
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

