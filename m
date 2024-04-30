Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795ECC19F53
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 10:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mbwpFJFih7RIT1NY26n8+loi/ZJwnp9wrw9uANwmIA=; b=FT9xUoVC5sygXJ2C+mgCxmR0bq
	fF68ubhUVmWfp5YnUgl90y0stnyNYBjf9Hy4ZyqK3MHfqqqjCV28keAmgVHqLW2GeAoHNGLwMhcsK
	kmsujRxRuu8fH/R/s9MrN/OJWWoZCyIkSeguXGbAYFt2WMnF9GkhUgJX679OfVNCN987Of0BwLx4E
	K23JSBWtAsClt2jbTatGqdTjRKovxvQXtSNqjzJfO3rH3hAgw73HrVk3POzTYplRAAxLnSjvDuYnq
	90nxT6Olawf6M9Goj3OcnNiNH+iBjEGO9Ffq6+tMnSGQit8YG5qz1WAi259kM6+jgNSOyAlP/8Y1C
	6trerESA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1kQx-00000005xQf-46w0;
	Tue, 30 Apr 2024 10:09:59 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1kQv-00000005xOw-0vNL
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Apr 2024 10:09:59 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-516ef30b16eso6235906e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Apr 2024 03:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714471794; x=1715076594; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5mbwpFJFih7RIT1NY26n8+loi/ZJwnp9wrw9uANwmIA=;
        b=Gl4ZrhQFwmi6mDlWz683UzJ9Ry9rR5EVy0TKAzTz6ku7AeWROSGmTtfmGmejN4KyNp
         EktKajO0Ifw+TFtE2T1qYDXawNX+hSGquc6s+Wn762IwD2FWG/7r1ACS+iRoW+2AaE5U
         pMbqtZZKSsc7PKjaYmJQdEA2Z8euSryjdrJAdzR4AC1msgPrYwKCNPOHr5uJkYyLPFij
         BCOWWFSxiMrwtxEsUePSv7/Jt0q3EdfeaXW+olC5qRulFFNkBEqIiy/kBieSp/AarAhB
         AzrtVziG2DoXztB6M4sVKR/fWuBICf6w+IPKGC6qT5RxVSvP0j+pZkQ6IPEmRNclsJMg
         3Bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714471794; x=1715076594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mbwpFJFih7RIT1NY26n8+loi/ZJwnp9wrw9uANwmIA=;
        b=bl9Pz4cgIpZU9feFyEFIeCkMGBQaBYKC5qfLfDsAi7Yh3yfCjjaOrh4i2bs8pzSUyI
         XDZYeE0wC6kEszdApPhg7fvW0rxFE2vlvk17mr6a4IQ/FYsDJj/IU1/fW83R9nvODjcR
         wNc4G6mMFrfeCU2MXwJkxlLSeop7k7hImoxJxQwVw4SZ6iqdXU+JCOcx1ZZQzTwcSlsG
         h1nUdZ2gnrk4MWIvNVgbgPjJHmM/O39ZBSaRlGrJSHS2LzTwQJkoOoIe5JA6qhSa8OT5
         lTxYDYzDKZCf4f4JHYVNOhqwIBv1LFgoJS49EFt9/luMJ71uEitwDUVdqCvLTZ6YZIMl
         8NGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVTfOk8vt142HSBclY3q2DLYhNwWXM3TanNmxRyULFZdfdcYgTt9AVe1PY5BT/JaBYJhnIo6/mV4SA/sgR7BkiZMqeNCpQmWZqJuIKerH0v1WA
X-Gm-Message-State: AOJu0YzFBEtdLaFRANRWqfz8en+n00befhXhycT89y727MVstDN+hXBZ
	dTH7e3g9PFIha40PFzor+qsJULGM4uor2Ttj0d1YYiIBcxgfTqnSNQKR1N8rbtI=
X-Google-Smtp-Source: AGHT+IHLFfBk+3bT5MCPiG0Sy+oXtj7PLWqAxH1nSKl7+nAmTFj46bAxdYE1eFckW76M0RQSsj0nqA==
X-Received: by 2002:ac2:5607:0:b0:51a:f596:9d53 with SMTP id v7-20020ac25607000000b0051af5969d53mr1449277lfd.42.1714471794305;
        Tue, 30 Apr 2024 03:09:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id b30-20020a056512025e00b0051bc39ef08esm2453377lfo.10.2024.04.30.03.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 03:09:53 -0700 (PDT)
Date: Tue, 30 Apr 2024 13:09:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/5] drm/ci: skip driver specific tests
Message-ID: <esplx2t6yfrarxflxo5kq2lstx7uiy2atzcxtwf7kugsctnkat@ameojtgtpopj>
References: <20240430091121.508099-1-vignesh.raman@collabora.com>
 <20240430091121.508099-5-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430091121.508099-5-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_030957_339889_EFC6B8D4 
X-CRM114-Status: GOOD (  10.84  )
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

On Tue, Apr 30, 2024 at 02:41:20PM +0530, Vignesh Raman wrote:
> Skip driver specific tests and skip kms tests for
> panfrost driver since it is not a kms driver.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt   | 14 +++++++++++++-
>  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt   | 14 +++++++++++++-
>  drivers/gpu/drm/ci/xfails/i915-apl-skips.txt    | 14 +++++++++++++-
>  drivers/gpu/drm/ci/xfails/i915-cml-skips.txt    | 12 ++++++++++++
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt    | 14 +++++++++++++-
>  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt    | 14 +++++++++++++-
>  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt    | 14 +++++++++++++-
>  drivers/gpu/drm/ci/xfails/i915-whl-skips.txt    | 14 +++++++++++++-
>  .../gpu/drm/ci/xfails/mediatek-mt8173-skips.txt | 12 ++++++++++++
>  .../gpu/drm/ci/xfails/mediatek-mt8183-skips.txt | 14 ++++++++++++++
>  drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt  | 14 ++++++++++++++
>  drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt | 14 ++++++++++++++
>  drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt | 14 +++++++++++++-


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm skips


>  .../msm-sc7180-trogdor-kingoftown-skips.txt     | 15 +++++++++++++++
>  .../msm-sc7180-trogdor-lazor-limozeen-skips.txt | 15 +++++++++++++++
>  drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt  | 15 +++++++++++++++
>  .../gpu/drm/ci/xfails/rockchip-rk3288-skips.txt | 17 ++++++++++++++++-
>  .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt | 15 +++++++++++++++
>  .../gpu/drm/ci/xfails/virtio_gpu-none-skips.txt | 15 ++++++++++++++-
>  19 files changed, 260 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
> 
-- 
With best wishes
Dmitry

