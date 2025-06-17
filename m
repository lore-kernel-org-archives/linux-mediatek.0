Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C497C71136
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jun 2025 13:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJGnTu2P8k2zWLpKT9gQ0C6Ynav6qAdbDTnXBuG6SzE=; b=xllPPMqCaiL0Kn0k9l73irKcJQ
	4Adz+E1h4frypDsJ+GpKzSqnRMMFUozULlVmFsUAaIqfrGoPDQNyx+bKe/UpN2OrJNPx15R/EYpZq
	gJzU2SN5LbgwP2vrVkXpjav1bVTb7j+nQnFhvENnYauGDio/IZomDvQJ4H/uJGNbPrPRri5oKqYMj
	kJiUIbbsTsb6iHG3PZyQBTZM8g9+U2eyJtpVF+E4PhVKNFsjoByJJL16mF9K44P1Brv1HJ2hoyeT8
	IOvR804lCNfF7pMn98Ukr1JjyeWmCMGc44f2N5PDCb2+MT/dLSb1dHe/cXk4rk+ukiAnsAyT5cRGV
	GODs0H1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWIT-00000007L4l-0CH3;
	Tue, 17 Jun 2025 13:24:17 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRVul-00000007G9j-1bwK;
	Tue, 17 Jun 2025 12:59:48 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-525b44b7720so1330720e0c.0;
        Tue, 17 Jun 2025 05:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165186; x=1750769986; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJGnTu2P8k2zWLpKT9gQ0C6Ynav6qAdbDTnXBuG6SzE=;
        b=GhHBkvYdbeLm5S2p5fAes7jUJHQVt0WXgJHjiqy8nWJRyLMNIwQBwszHngsMB5MWfn
         WTpj5ZQnmUVA+xJS6bMGGhwjuHZG0hLLIrn/MtZW4BlIxn4hCv6KI1u6nqEZxxMNZEr+
         iq3yae2Y8VJON+KsIYCLOxoQ5AeT5J/wu7mL5I3L7LmZHDRaDZITwhrQ3S0y8IYPZLn5
         gi84r/5JKJeAWA6ZpwgxnbXJd+mzl33z+bZzKkuV/8othcW7/6A8BgvXfDAIGIeeEkH6
         f4iZGt9aHpPYTU/qXNnl3zOvBaHLIv+Ma/j3i3WoKpzolcPVECaM+sUHdvqiyMdfQFbg
         uWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165186; x=1750769986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJGnTu2P8k2zWLpKT9gQ0C6Ynav6qAdbDTnXBuG6SzE=;
        b=lwi/rw9ScsyafSiTtNdswiJV5KMB9JR4thbIrjtRG5dVWsOgI6yt0c+/cVDQyKiwir
         ySKG2H/7qRfQsgQ6WKAv3J3ZOqWwTAo8w7uwwB1BUL/vik7VHZ6nOEw9LLz/OTZXpfHa
         PCwWAGVWkc2PAPmjseLSoZ97HYKZkL/UrituOnU+8OSnoDDBH5Hwzh9b/dMb8x5eALCt
         YCWK/Qh0EcuiFad4eR6EMZrIAVh4wFxQI50Xbzrk046ZuLQi+mEzoztLRDZ1xCplA/92
         aPboTpUbsQ5Z9Wwbo9gCaoMTZQlyoniCFy4b8CjbswKWqDBOOSGDES+0i41/xq6sfmQ6
         86lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFVIl5SvRpSxkIRjXOvMsbidJOYHpk4f5oVspO4U/0viiag99Hq2lB1z4JMreuiY4tv6OnE31QrvL2wRRvDt0=@lists.infradead.org, AJvYcCWnCWiRkhZE7qH/pPF3mYRncWkSIAiqC6jAqutIg7LuwxqvnFxaMjc8MQsmq/M3q6X8mt+oJoQy45PEYxyVcw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj/5toczqYiGSb7Dn1uhNMbMJEhyZDpGukjxo4JJ8X5f0U0bHX
	MAF8/tc6gRkr4lMOkAAnv/Vz768OGNxbvrbb0nVUxNic7WimVvMCGprvQq9lMfScC3S4KonP/f/
	FePnh9R0Wb04BrLPXgjv6RZbOsQkgMpl+01dT
X-Gm-Gg: ASbGncvJxtPRZVSXV8JFYN2TQBqpmpSvaA9/ywOauTKJcr45aU/k4eE2PUMAdz51ZM9
	8ckXg1vUGpokENvJq5KLI3SApHVhr6tsPQwv482AUIOOx0OrfW0miGBi0SVS5p1rGsYrhCCGoUp
	pHaSpF37mUKRZ+GRlmuGVrNkwlCE0nxPqIDNqZouwtag==
X-Google-Smtp-Source: AGHT+IFyDxk9ofOoSE1jUdDwuXC6uj68bPw86gFHeN0xbFulbam2J1M/auQRgbuNa5uXdcywAXE8tSUc/+x2hYqgo2M=
X-Received: by 2002:a05:6122:4586:b0:52f:47de:3700 with SMTP id
 71dfb90a1353d-53149677e4amr8402312e0c.5.1750165185838; Tue, 17 Jun 2025
 05:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250613090431.127087-1-tzimmermann@suse.de> <20250613090431.127087-8-tzimmermann@suse.de>
In-Reply-To: <20250613090431.127087-8-tzimmermann@suse.de>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 17 Jun 2025 21:59:08 +0900
X-Gm-Features: Ac12FXy1YqAOwtksyoMPU_mcRXzK8GOxRWP5F_To6gWRQ1V5y95DviShSwJIG6g
Message-ID: <CAAQKjZOiz3Z42N_GEPzqU=CCfim+Z7oCuyxuji6Guj_dKYsimw@mail.gmail.com>
Subject: Re: [PATCH v5 07/25] drm/exynos: Compute dumb-buffer sizes with drm_mode_size_dumb()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, geert@linux-m68k.org, 
	tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	xen-devel@lists.xenproject.org, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_055947_422879_115E81CC 
X-CRM114-Status: GOOD (  14.31  )
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

2025=EB=85=84 6=EC=9B=94 13=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 6:05, T=
homas Zimmermann <tzimmermann@suse.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. No alignment required.
>

Acked-by : Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gem.c
> index 4787fee4696f..ffa1c02b4b1e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -11,6 +11,7 @@
>  #include <linux/shmem_fs.h>
>  #include <linux/module.h>
>
> +#include <drm/drm_dumb_buffers.h>
>  #include <drm/drm_prime.h>
>  #include <drm/drm_vma_manager.h>
>  #include <drm/exynos_drm.h>
> @@ -330,15 +331,16 @@ int exynos_drm_gem_dumb_create(struct drm_file *fil=
e_priv,
>         unsigned int flags;
>         int ret;
>
> +       ret =3D drm_mode_size_dumb(dev, args, 0, 0);
> +       if (ret)
> +               return ret;
> +
>         /*
>          * allocate memory to be used for framebuffer.
>          * - this callback would be called by user application
>          *      with DRM_IOCTL_MODE_CREATE_DUMB command.
>          */
>
> -       args->pitch =3D args->width * ((args->bpp + 7) / 8);
> -       args->size =3D args->pitch * args->height;
> -
>         if (is_drm_iommu_supported(dev))
>                 flags =3D EXYNOS_BO_NONCONTIG | EXYNOS_BO_WC;
>         else
> --
> 2.49.0
>
>

