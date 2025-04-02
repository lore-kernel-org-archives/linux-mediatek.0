Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7B2C28B20
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Apr 2025 10:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lw7No9CatrhunZQ4Ziy751N/t8utTcZj0hKQTdSN9jk=; b=Kucou3rvREmKtE4pBtHVfAn65M
	Mvg9fgrhLbQYhBS2wpUKS/VOblNhDx7AG/vrTFy9dCT9ZVXxZBkrG8gGMKpOwg6lKh0fHK+z+NTzR
	BD+GUubJ3kvilTONfWdWP/nRnWW1qoIUX0uGdQnPy86ydQFozbqelFeQT0JqSqRaNplN9UasWOydh
	5U/0k1Zpji+3uxwpxEJ8Q+MlCxcrM8lt6Ehohj0P6lT2BnOvOY2K3/MJgMe7mNz0djhspIBbPxgoL
	CqJS3J4dJCtUpZUkqIT/NkYqKZeZ0Jw8TgfL6749OEsgdUzYck+gZZ64vctu/Kv99yVjtKaziyRYt
	oB9+pJIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzv9E-00000005lxV-3RdQ;
	Wed, 02 Apr 2025 10:16:40 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzv7S-00000005lTu-1uEY
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Apr 2025 10:14:52 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso8548409a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Apr 2025 03:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743588889; x=1744193689; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lw7No9CatrhunZQ4Ziy751N/t8utTcZj0hKQTdSN9jk=;
        b=P0OL6oUX21X5S99/ssKAy3VaplHKvkjxaxbXuhGWUgmGWqmjDWJTMTC41BCbx2YYLa
         +BD35JvfF9uowLtQNM6enFQvZ/AZ7EHJVgUaqzbMtmhtmqeqE5iu+R927CbPXcWczu6A
         9+23Is6WQ6JeQsX5pHvTUv17v3yH3/jJo19mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743588889; x=1744193689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lw7No9CatrhunZQ4Ziy751N/t8utTcZj0hKQTdSN9jk=;
        b=j8b+l8LWAm9NmMII+7+qVM2vit4M0c5znbZ+CW7qmsOoNFFPT1+kPbZqhEXnRUMPcQ
         Ei5M7zuNLgJgjZvRsMhkHOkE3mru8/Ew6x9Np7bTBNV4w14AuCZJKhbH3r31r0U2UECq
         /5lu8PH8FFGtF1z1LHn+ooa4KApyS0+2Sg/WK8Ap1Lp46Ybkn7/bxySaMwgjpAVqHidD
         /XUYah/zAQ2v/Yb4WrUp4nlHVUEbMuedL5hcBttBeSQwtJg+jnV2X4ywDAoq6TbyIzBx
         BYHyP+M7kIHUSqojIKXxkK7Q4a+56nNJB6p4T24DKTZzPsInzrZSvh4N5eT/CIhYWgrx
         XUzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJovYiD2MbBYQ2P2ltH8Lr/150qH7H6aD9DXrdznz8+XzbAD2vkee8dafwG8F2xNGHuP+n6FM8vW6M2pPr1A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3j0ZGzufLSRX38XZOVJ1UWORDXkKLfgCvjdBJJDJI4ZLO/VPu
	uak4uMumHAnOzoxkDwvXLGptoAINBqTjNSmotdxAbr4ldaifRC9johuS8Qi2z7JeSFXfAZuUSpJ
	qZ5xT8+tWjgXp0Bpnw6o+hx4OJ355kk4Ih2JC
X-Gm-Gg: ASbGncv6EOHsO+8Qms+lwAv1om4Jqo2DPoMOfwMHB0F4p0qvpGHJrtztQ3AbxNQPq1w
	N8ezJRVogjfjecP9ZGfetpiFwupMyv2/+9LPJFvd4reotJ7fylhehmzW5PgABoV2QJVwH4irQIA
	vPwkX84ElcAch8R0C1FPemzcFsrGY5TO01SZ3TCIwUawZU2f6F3Gga
X-Google-Smtp-Source: AGHT+IH4KbDIAmz8gZLfVjOiL+nuNvvi6uk1SQsIGj72ELmQEPT6v+Qk+JdsGhfa3B8h399dfK9zguZ+jHJ7xZMou58=
X-Received: by 2002:a17:90a:d2ce:b0:2ff:5a9d:9390 with SMTP id
 98e67ed59e1d1-30531f957a3mr24885869a91.8.1743588889523; Wed, 02 Apr 2025
 03:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com> <20250402083628.20111-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083628.20111-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 18:14:36 +0800
X-Gm-Features: AQ5f1Jooc0a6tL_Gl6htqIUeZsyBaGUQis_xndlOKQ_9u_xfpEMy_zMefycOXDw
Message-ID: <CAGXv+5HUJUL342uMA7wjmm8TsBUveVa0i8k+BfB2aZXd--AoKg@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] drm/mediatek: mtk_drm_drv: Fix kobject put for
 mtk_mutex device ptr
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, nancy.lin@mediatek.com, 
	ck.hu@mediatek.com, djkurtz@chromium.org, littlecvr@chromium.org, 
	bibby.hsieh@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_031450_486415_2A801013 
X-CRM114-Status: GOOD (  24.64  )
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

On Wed, Apr 2, 2025 at 4:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This driver is taking a kobject for mtk_mutex only once per mmsys
> device for each drm-mediatek driver instance, differently from the
> behavior with other components, but it is decrementing the kobj's
> refcount in a loop and once per mmsys: this is not right and will
> result in a refcount_t underflow warning when mediatek-drm returns
> multiple probe deferrals in one boot (or when manually bound and
> unbound).
>
> Besides that, the refcount for mutex_dev was not decremented for
> error cases in mtk_drm_bind(), causing another refcount_t warning
> but this time for overflow, when the failure happens not during
> driver bind but during component bind.
>
> In order to fix one of the reasons why this is happening, remove
> the put_device(xx->mutex_dev) loop from the mtk_drm_kms_init()'s
> put_mutex_dev label (and drop the label) and add a single call to
> correctly free the single incremented refcount of mutex_dev to
> the mtk_drm_unbind() function to fix the refcount_t underflow.
>
> Moreover, add the same call to the error cases in mtk_drm_bind()
> to fix the refcount_t overflow.
>
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi =
mmsys support")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index e09578756de0..a8fbccb50c74 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -464,7 +464,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>
>         ret =3D drmm_mode_config_init(drm);
>         if (ret)
> -               goto put_mutex_dev;
> +               return ret;
>
>         drm->mode_config.min_width =3D 64;
>         drm->mode_config.min_height =3D 64;
> @@ -483,7 +483,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>                 drm->dev_private =3D private->all_drm_private[i];
>                 ret =3D component_bind_all(private->all_drm_private[i]->d=
ev, drm);
>                 if (ret)
> -                       goto put_mutex_dev;
> +                       return ret;
>         }
>
>         /*
> @@ -576,9 +576,6 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>  err_component_unbind:
>         for (i =3D 0; i < private->data->mmsys_dev_num; i++)
>                 component_unbind_all(private->all_drm_private[i]->dev, dr=
m);
> -put_mutex_dev:
> -       for (i =3D 0; i < private->data->mmsys_dev_num; i++)
> -               put_device(private->all_drm_private[i]->mutex_dev);
>
>         return ret;
>  }
> @@ -649,8 +646,10 @@ static int mtk_drm_bind(struct device *dev)
>                 return 0;
>
>         drm =3D drm_dev_alloc(&mtk_drm_driver, dev);
> -       if (IS_ERR(drm))
> -               return PTR_ERR(drm);
> +       if (IS_ERR(drm)) {
> +               ret =3D PTR_ERR(drm);
> +               goto err_put_dev;
> +       }
>
>         private->drm_master =3D true;
>         drm->dev_private =3D private;
> @@ -676,6 +675,8 @@ static int mtk_drm_bind(struct device *dev)
>         drm_dev_put(drm);
>         for (i =3D 0; i < private->data->mmsys_dev_num; i++)
>                 private->all_drm_private[i]->drm =3D NULL;
> +err_put_dev:
> +       put_device(private->mutex_dev);
>         return ret;
>  }
>
> @@ -688,6 +689,8 @@ static void mtk_drm_unbind(struct device *dev)
>                 drm_dev_unregister(private->drm);
>                 mtk_drm_kms_deinit(private->drm);
>                 drm_dev_put(private->drm);
> +
> +               put_device(private->mutex_dev);
>         }
>         private->mtk_drm_bound =3D false;
>         private->drm_master =3D false;
> --
> 2.48.1
>

