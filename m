Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0AAC678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 23:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0L3R90Rau+IIx4i87QXzcbyZkRvQgs/P+NQFhtKVhoM=; b=y8MWnhsYpbuvLIzl6H3qku/VRZ
	OMcXWJqAPErjYuO0vDQ0BlFRUC2EqXA9Co4svOS1G6LeV81VM/cD4Uh8bLueHtrPqX8X3V/L2uU1+
	AQUr5xiRfL6eHLdUtnC7gos5Sa7oBmBtT3CLncwQkc4GmAXHiGx6kBqaxvYELGyZdL/zu9yQdYNdg
	grKNyGskc/WeUIqab8HGUgbZVkdPdjRGqTcAOFBkqVfLvzbumEddRmLZEuQWGK5tRfflk38LbgMj2
	Mxk4goo1wjtK09NiMQ+/Bkgp6QGxG/s5343R7WOWlVybkrJUBwX4rBVLNAttsmm+1I8/c5YxcjYPY
	ry9/AKXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa3Jw-00794z-LR; Wed, 08 Mar 2023 23:35:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa3Jt-00793t-Lg
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 23:35:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4AF18B81E2E
	for <linux-mediatek@lists.infradead.org>; Wed,  8 Mar 2023 23:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC95C433A1
	for <linux-mediatek@lists.infradead.org>; Wed,  8 Mar 2023 23:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678318537;
	bh=RbtMQKg2Xucy89yY5ub2Cge2lq5W9QrN1nae527Olm8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cGiN3bc2o1ILpqLsATB8aSSSkQtP0+KAkMVoNd0eGmI2Y4K1dF5gtuOzfOs2z3G4B
	 67iYUV/1sAvW1LyBpUeA7YRgeS7UYaBynPxT1aeftqGo7+z4m7B1bSoW4sBS/wsxxu
	 PMtotBmjW8uIWkIFDbGgZ7YG9eahRTQNc6pfnSFbiMO7iOITFDjML5Tc8QuA8QQpjT
	 7n7uISIji/AQtRTpggKw/7PMxZ2iPBM0ebgFaK/1MMqiqu/QBlxJ9Co7H2lejXR0Nb
	 1wZ7jDJ8ar5uBi7V+OzpQd4VOhcwez0D+FQryPkoeRNzGzdI0QINGoLXlliHXsEftL
	 BWNHjUSOCSZ/A==
Received: by mail-lj1-f174.google.com with SMTP id z42so45012ljq.13
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 15:35:37 -0800 (PST)
X-Gm-Message-State: AO0yUKWngxJYMtrj0I1QXYriZrRz4NJ0eL8c5FmsPlSTJUTLgReHK39Z
	xBKLkf3H+ugzKUeYQqYl94NPdj04aYRbJpumSw==
X-Google-Smtp-Source: AK7set/tHrc6VkxMmyev2LYHjPqrafrWilhLS3Wfx2Fw/1l4z/og5+Y1EH6Tf7VSs2CrB+nG6v04akoO0HhR/rd2yp4=
X-Received: by 2002:a2e:a36a:0:b0:295:9040:fb0b with SMTP id
 i10-20020a2ea36a000000b002959040fb0bmr6196931ljn.10.1678318535536; Wed, 08
 Mar 2023 15:35:35 -0800 (PST)
MIME-Version: 1.0
References: <20230308153358.333297-1-greenjustin@chromium.org> <20230308153358.333297-4-greenjustin@chromium.org>
In-Reply-To: <20230308153358.333297-4-greenjustin@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 9 Mar 2023 07:35:23 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8fsqu7kK1Wv3_x4Yv4OT+5REh=21tbahrfZpHAK2A3Zw@mail.gmail.com>
Message-ID: <CAAOTY_8fsqu7kK1Wv3_x4Yv4OT+5REh=21tbahrfZpHAK2A3Zw@mail.gmail.com>
Subject: Re: [PATCH v7 RESEND 3/3] drm/mediatek: Enable AR30 and BA30 overlays
 on MT8195
To: Justin Green <greenjustin@chromium.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com, 
	justin.yeh@mediatek.com, wenst@chromium.org, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, matthias.bgg@gmail.com, daniel@ffwll.ch, 
	daniel@fooishbar.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_153542_024522_CAEE33CC 
X-CRM114-Status: GOOD (  16.30  )
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

Hi, Justin:

Justin Green <greenjustin@chromium.org> =E6=96=BC 2023=E5=B9=B43=E6=9C=888=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:34=E5=AF=AB=E9=81=93=EF=
=BC=9A
>

Describe more about what and why this patch does. The other
modification looks good to me.

Regards,
Chun-Kuang.

> Tested using "modetest -P" on an MT8195 device.
>
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index a6255e847104..7d26f7055751 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -85,6 +85,22 @@ static const u32 mt8173_formats[] =3D {
>         DRM_FORMAT_YUYV,
>  };
>
> +static const u32 mt8195_formats[] =3D {
> +       DRM_FORMAT_XRGB8888,
> +       DRM_FORMAT_ARGB8888,
> +       DRM_FORMAT_ARGB2101010,
> +       DRM_FORMAT_BGRX8888,
> +       DRM_FORMAT_BGRA8888,
> +       DRM_FORMAT_BGRA1010102,
> +       DRM_FORMAT_ABGR8888,
> +       DRM_FORMAT_XBGR8888,
> +       DRM_FORMAT_RGB888,
> +       DRM_FORMAT_BGR888,
> +       DRM_FORMAT_RGB565,
> +       DRM_FORMAT_UYVY,
> +       DRM_FORMAT_YUYV,
> +};
> +
>  struct mtk_disp_ovl_data {
>         unsigned int addr;
>         unsigned int gmc_bits;
> @@ -616,8 +632,9 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driv=
er_data =3D {
>         .fmt_rgb565_is_0 =3D true,
>         .smi_id_en =3D true,
>         .supports_afbc =3D true,
> -       .formats =3D mt8173_formats,
> -       .num_formats =3D ARRAY_SIZE(mt8173_formats),
> +       .formats =3D mt8195_formats,
> +       .num_formats =3D ARRAY_SIZE(mt8195_formats),
> +       .supports_clrfmt_ext =3D true,
>  };
>
>  static const struct of_device_id mtk_disp_ovl_driver_dt_match[] =3D {
> --
> 2.39.1.456.gfc5497dd1b-goog
>

