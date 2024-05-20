Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9560C04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 11:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbU3zeRUyfJhQipGYR6FKYCuEp6+mBicTADebou1jyQ=; b=FuF1OAefVvnsY/cqWF43PDVZl8
	9dKnb2YXtvV22vWoDa6SO+fmnZ6sSg5o+KO06WmqOUxVaLQtMx/ZOcB8lWA+jg16kUlh+AcnbdZgH
	4yiHo7lnqRu/8bKFl8wWCTPkObvNVeCZ+F8yNbcLcf/Nt1h9nvA9/pkTJPC0wrNYh4EU3inrkmZi4
	6QMIN7sWfT9sqv6KljXIjKsKJESaIn4OyTlINj8NsD8R7T/MmUNyqSqK/KA+ckCSAj9vzwqfKw3Um
	ZOEEygS69QSXn6amDC3+WsjHbtcApJznW/Veivk3AglH7EXpsHSfF5vJW/ilLCmKVNaVlO1hUvSA1
	W0srdm0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90l9-0000000EDva-0DLi;
	Mon, 20 May 2024 11:00:51 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90l6-0000000EDtG-099h
	for linux-mediatek@lists.infradead.org;
	Mon, 20 May 2024 11:00:49 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-51fdc9af005so5170433e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 20 May 2024 04:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716202843; x=1716807643; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zbU3zeRUyfJhQipGYR6FKYCuEp6+mBicTADebou1jyQ=;
        b=OSeN7zTb3l8yGHQUWPQb0ayPpiGQ63DRJ+QPQ0mU15bsiTL/6azmG3dsQt/1QpeLNf
         mzyE+rujkWbrlA2H421T8B+GVoegZW+M0aya1gs0mfZpcDm/04CMN6mW+K77lNfa3ATv
         P98/hrTx7Sb/gFb+KvJObO5GvOkw14hsT1zjKJbWOUQbaX9IaT5FYszrm1vLlz7tUvfS
         Rmt4GXwsuFC5DxRJwMQRAGZxLFXeGM+jnQUAth3ZCTQxKM01/a87ooXaI9o/xGZBBtbZ
         3NIqpmmZwXQX90iFzhip1OyLVrwQMNuMWHVCQdJAiIIX+ouyuPyx6rOfjq7L01+3OZ4o
         B5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716202843; x=1716807643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbU3zeRUyfJhQipGYR6FKYCuEp6+mBicTADebou1jyQ=;
        b=b1YYB/4NzYnYL2iVq8StASgWIrETPFlftzgf6ZRf3JZwgr/QFIAfl+0JK9h4xupd/V
         cjjmzbaUX7fKZ/TAT5CxNcAVo10+/JBqmMk9963iyMVVnkx/D5CU/TVuCHAdH2FlFx5Y
         zaLaCKNcSVsrtm3ZaOhWzAyYuxhH0+RshBBLnqRkv40HdEYwsqLJIUmckznkEvTdoYVl
         v2TkVprLQhuZosgRnEdJzqlg3qOxw+Vam6GYp2wVIlzmOw1nMgMRxlNxBIr2yK3LtDne
         Qwlb7vFAtHXQfrN+7vhgL12lTIqvqImmUSNE7tof2bzK1ApD2TrQoenAS22qNHEt2/8o
         eHrg==
X-Forwarded-Encrypted: i=1; AJvYcCUiYiA+itDO1MkeBvN4cBk5rbExgeaavVHb/HGxIjWpQGjwnocG9/UUGtk+DdFUbDP1IUiwPLFtGEOpNWENRhiisIy9uh8VtAMRntuS1G5v3glE
X-Gm-Message-State: AOJu0YxTywSE4bTeo8hfg1Tt5bWVUvxLjWDvFucN1w1605CBaISUNye4
	5vIdRPMp7w5I94SWEw/VArYRbmfnDb11So65dsA8vfKGrb5gLZR+frX7jf1UALE=
X-Google-Smtp-Source: AGHT+IEoP2+bL0oMFj4P0Aa7CMuek/Wx23WK1fJZHUBxVQUK6n4Or8upEK0eOTuockV49z8ZJoyWZA==
X-Received: by 2002:ac2:504c:0:b0:51a:df97:cc8d with SMTP id 2adb3069b0e04-5220fd7cc70mr18338046e87.26.1716202842997;
        Mon, 20 May 2024 04:00:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad5fdsm4253446e87.24.2024.05.20.04.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 04:00:42 -0700 (PDT)
Date: Mon, 20 May 2024 14:00:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] drm/ci: generate testlist from build
Message-ID: <o363vir3dqz2znrnifo6enbdwudalmxqbigdkci2ykxf5qjbnx@2ngllflxotgk>
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-3-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517092502.647420-3-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_040048_090989_B7267F81 
X-CRM114-Status: GOOD (  15.52  )
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

On Fri, May 17, 2024 at 02:54:58PM +0530, Vignesh Raman wrote:
> Stop vendoring the testlist into the kernel. Instead, use the
> testlist from the IGT build to ensure we do not miss renamed
> or newly added tests.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - Fix testlist generation for arm and arm64 builds.
> 
> ---
>  drivers/gpu/drm/ci/build-igt.sh  |   34 +
>  drivers/gpu/drm/ci/igt_runner.sh |    9 +-
>  drivers/gpu/drm/ci/testlist.txt  | 2761 ------------------------------
>  3 files changed, 39 insertions(+), 2765 deletions(-)
>  delete mode 100644 drivers/gpu/drm/ci/testlist.txt
> 
> diff --git a/drivers/gpu/drm/ci/build-igt.sh b/drivers/gpu/drm/ci/build-igt.sh
> index 7859554756c4..e62244728613 100644
> --- a/drivers/gpu/drm/ci/build-igt.sh
> +++ b/drivers/gpu/drm/ci/build-igt.sh

[...]

> @@ -26,6 +50,16 @@ meson build $MESON_OPTIONS $EXTRA_MESON_ARGS
>  ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>  ninja -C build install
>  
> +if [[ "$KERNEL_ARCH" = "arm64" ]]; then
> +    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/igt/lib/aarch64-linux-gnu
> +elif [[ "$KERNEL_ARCH" = "arm" ]]; then
> +    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/igt/lib
> +else
> +    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/igt/lib64

Could you please clarify this part? The arm64 vs arm don't look logical
from my point of view.

The rest LGTM.

> +fi
> +
> +generate_testlist
> +
>  mkdir -p artifacts/
>  tar -cf artifacts/igt.tar /igt
>  
-- 
With best wishes
Dmitry

