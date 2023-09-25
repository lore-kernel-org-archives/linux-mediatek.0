Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926A3CE7A89
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 09:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xr8Pm0FHns5z+sDzwSgcIqm9qFlErBM1xlOG5O4Qks=; b=Bt29+8aoQ/Jfb3jc1iRt/2cShf
	KjMqqHlH1Vn8XzAphirFRWMXXqWRm8wDU3tRBijoDwk0QTy/oUGqxOtfQ7ze06YnSDxWLpSLfkcj/
	qQjtgYa4rAeKrYazt0XT2cWH+z7zUGa8ftCAFv5VgeTyw9DHypGZnM+7TW3FYKMtqVWqEoJTEat9t
	5sVlAsjOfcs2+Eo/B9PnEVHnxtyz0vwdMFha7Vxb7EU6MUmremR5xcRUPkH8B97UhdQGqvH1nArVJ
	KbfcQU9ycdwLWxFrEtisHLW+EF0OXODtSZJjf5BYhTg56/bNroCXje0kxftSJzy0BXDJiaBNT4hPO
	DXph69kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkhqd-00Dqhn-10;
	Mon, 25 Sep 2023 09:25:47 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkhqa-00Dqgj-2m
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 09:25:46 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-415155b2796so672881cf.1
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 02:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695633942; x=1696238742; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xr8Pm0FHns5z+sDzwSgcIqm9qFlErBM1xlOG5O4Qks=;
        b=xOUUNIOQneoJyxDiFCaPH1/YPK4I2RNI2QIel0kfYEFVUtmzEguft8yFv+LmgA+mWv
         Jgcxtk3D7Z1e95IucEI5adXJTfnGR5OsX6h4EUQ0+Mv0hru4D311msxtRLGJe/llfOvI
         ivVsEucIUC8dA4gwaW48TUC/wDw43MszeY5c8ghYM+c5i3yb5S0MIU2ytPlrruKTgbPT
         FDbH0flFkhKdOFi9JsQaM1pVz2eN/p9JICbyabT+hcb2k4FWxcyS4wdz8vw+0pJcDUzU
         td2PluHl8b5B2esAyqLPRASTSWhPPfaJv6WnBioWoiPzWyAapvhcccGN1QNcmwJyv+Hr
         ZiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695633942; x=1696238742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xr8Pm0FHns5z+sDzwSgcIqm9qFlErBM1xlOG5O4Qks=;
        b=tlgkx0IUNQc4dzL1/gZ+C3o1lI2Yd5JRNA5qrSMa5cRjwvDt/0yQr7HCcjOzookydJ
         NnIyQ4iOrW8CZgdePcUZjHnvrJ7hMbI0OuklKyMa9h1D8GW38cPUQjyeyWXDw7SVm+2W
         ry/ZepyVKRwGbLNi7Lg5Ao99KKVpEmKrFLAoWe5SXgvkDRPFIOyOJBi4AzMMVxOHTzM+
         z/SdiFrpoGfAzYQvHmcWogfZRFJMKjlVOYUviM+RC5sitJV72NOZg7urUG3KSz2fh6h8
         gEVjdBw2xMHb6YvhDmd1g/8EtTOR+duy2BCyeInNHUdUlYOqrYgkCMemhzRy4bosSH9x
         PVtQ==
X-Gm-Message-State: AOJu0YyvOQua4iZVe5z4We75+eoLw1basAhS/+taZU9ImHNth9zjeKew
	9oRbuJNtevsJt5kOqh3FoyesE9gJSlY9QLTWSMbcyw==
X-Google-Smtp-Source: AGHT+IFfw6R3PruYRpn1KMKh6lR/ZIydA1Xovah/Z3U+3DE6GvyT7bl5mA/0LZHXEUU3B4R8i/UHE5x70+g4n5TmicA=
X-Received: by 2002:a05:622a:11c2:b0:410:653f:90e8 with SMTP id
 n2-20020a05622a11c200b00410653f90e8mr405985qtk.11.1695633941887; Mon, 25 Sep
 2023 02:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230925092249.2228743-1-hmazur@chromium.org>
In-Reply-To: <20230925092249.2228743-1-hmazur@chromium.org>
From: =?UTF-8?Q?Micha=C5=82_Krawczyk?= <mikrawczyk@google.com>
Date: Mon, 25 Sep 2023 11:25:30 +0200
Message-ID: <CAHDt3PPObYmUTedxQ5OJ4FcXNbb9LREQ9DfiBJ4KhA6=rCvBMA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Check GEM buffer size
To: Hubert Mazur <hmazur@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	Bibby Hsieh <bibby.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, 
	Daniel Kurtz <djkurtz@chromium.org>, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_022544_912611_1849C2FE 
X-CRM114-Status: GOOD (  17.18  )
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

On Mon, Sep 25, 2023 at 11:23=E2=80=AFAM Hubert Mazur <hmazur@chromium.org>=
 wrote:
>
> The buffer size is derived from parameters supplied by the userspace.
> Having the size equal 0 causes allocation failure leading to kernel
> panic.
>
> Fix this by checking if size equals 0.
>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
>
> Signed-off-by: Hubert Mazur <hmazur@chromium.org>
Reviewed-by: Michal Krawczyk <mikrawczyk@google.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/med=
iatek/mtk_drm_gem.c
> index 9f364df52478..3b985b99d5c6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -62,6 +62,11 @@ struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_=
device *dev,
>         struct drm_gem_object *obj;
>         int ret;
>
> +       if (size =3D=3D 0) {
> +               DRM_ERROR("Invalid allocation size: %zu", size);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
>         mtk_gem =3D mtk_drm_gem_init(dev, size);
>         if (IS_ERR(mtk_gem))
>                 return ERR_CAST(mtk_gem);
> --
> 2.42.0.515.g380fc7ccd1-goog
>

