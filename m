Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E80FE77188
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2025 10:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/m618hW0R2m1nQFr2zn8iDxB4stTlPC9L/MKkQZd3FA=; b=e9uqXZExKZDOKS7Krdrg+VsLFV
	DVr8ihqQv4Ys/P6wK9anXnJj1YyotamMdlSf28C0ignz23k4KWndeY1T0J3HmHSKvTGtPx4W4rxSU
	OC5ERNlx1u5GpsQLikjX5Y4sMzTuBT/uPbsbkhUc2GJ1y0qqdw96lUZTKIz1n8D1ufEQXXUFCn0UY
	rFANQykpljT2wzICGEiz/aN2mGyEgeXZmAr7AGfHhCrZy/Eju9vBH2Xht3lD3PJRtK3kzoColdX1k
	YA1bEkMvfYOZcQyxvfsMNzwPRZANrguaURQQH2dq0AaHfsV4mP+2U9mlK9KyhT0hjPSaQWHuBWexV
	W5Qhm//g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTf7F-0000000CkTi-35O7;
	Fri, 03 Jan 2025 10:41:17 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTf4C-0000000CkAV-2JIt
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jan 2025 10:38:09 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30219437e63so140308321fa.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jan 2025 02:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735900686; x=1736505486; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/m618hW0R2m1nQFr2zn8iDxB4stTlPC9L/MKkQZd3FA=;
        b=dGK7Qja9JJ6z4MjqrydsQHD6O8daQgqdS0o9ZxV7/AtCVWDtYzN6qFQOdLg0JqucgC
         M80gC37oTfvKryCYFeQ2rFGjn3p0y6UkSLjz99kYfR/t1YByu7inKTgBWmYtEZW80tyq
         O3FMJhtw3Zn31mAoYI/sKqv7H/myJkKwBNNVnLuRe6eB+nI2WHzuw+wipNiORopmbYvl
         Gu3swCKL0qCAQKkQJWydwkA637jwx7tEk7+X7oo7RgdWeExHLoUXCFSf73JLwp6jRooW
         190kxjDXgH8Xa7pTxQlNc2V9uF4HtdmTg6+CUOA7ET1YSRTKxFOMFbFrO090cy0RfCbl
         CZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735900686; x=1736505486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/m618hW0R2m1nQFr2zn8iDxB4stTlPC9L/MKkQZd3FA=;
        b=HdPUlfAVqR653JAUvumU6K3bh+Ig2vHicrzIeJIJx+uGlP9GZ4V2uhM5X+DMk7Me/O
         1l6aGW5OMBY64jpk5mTg04gVX9AXQ7vF6w6J65Bgz1FMidpk2o/0JhqXQVTNYQde0nRm
         4dOg76Vb9aKici4DTtIn5Avz25QaDO3tfjLG1N9LlvzSG3GzwL6veib4sX2L9y7TCh4R
         MNLmmn44R8vSAhvQJc9j7pUm1SVt1Cm29GbrFzAIgtm6OC8WjYxF/L/wF3pByHzO04qS
         AFAIHO0gHZctxYVec0tr2Ub9QAZbJJ4dQmO9ZlIZWCF+9exxKER24IrzVGypweB3vD04
         jrrA==
X-Forwarded-Encrypted: i=1; AJvYcCXMaOzlKuHEkCS4P1To19YnElNg5EPov7HOgq/v5tXyKY4YXUf7oMVOcOF9RiAmxmvWJbjiInX3zf3QxbypLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHqiBAYneQlKLcEdrCNMMCpel+NqmCBvVgHCHUK8yiJ2eO/ud1
	Hw1DPYacbsvn2si7EQhssoASFdNfvuPun/z1sM3mZpu7MZCPNkb3/CwMx7Yr+jU=
X-Gm-Gg: ASbGncs0RO6REX+A2PDU2jL03klL9azDwlvCspCbIZCur9UID9ueh9ujEtjP9PzWDKd
	y/+8vru4/u67c7qI2jiyMms7Gn7V5edjiIPnKqNXpv2C+ttfTa4luPl1LWjznYej6z9Yj4y1pGV
	TWh2qAFDzpgtww7rYyvN39RUrn5mcIqhGixd2mUt6ZG2fsCdOvyqoLoo083JRohGpvaiK2XrhBp
	YGjdYlhbeBg9bEnQcNEGv/TjsNeRcaOdM2IXvhaujMlKQspyv7VvRHMmvIsk3G2F7JqPJO/q/pU
	UFww/VzUOpuLVHTYYGEAoFDgo01H+wc+6JxF
X-Google-Smtp-Source: AGHT+IHqyYKM0jK9B76DdsBNsu1ksVUKqjrNzWi2li/1a+VHxpUAgfWN/haMqHCMVuXOoMkqVNCF/Q==
X-Received: by 2002:a2e:bc1b:0:b0:302:215f:94ee with SMTP id 38308e7fff4ca-30458337550mr161864691fa.4.1735900686412;
        Fri, 03 Jan 2025 02:38:06 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b096cafsm45400051fa.123.2025.01.03.02.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:38:05 -0800 (PST)
Date: Fri, 3 Jan 2025 12:38:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/ci: uprev IGT
Message-ID: <gxrc6hqlmjl2pdylvi33wdukxgz6wqbhzgwk4ptyx3i55jshic@uu45kcjailxa>
References: <20241217160655.2371138-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217160655.2371138-1-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_023808_600435_1014FB87 
X-CRM114-Status: GOOD (  15.30  )
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

On Tue, Dec 17, 2024 at 09:36:52PM +0530, Vignesh Raman wrote:
> Uprev IGT to the latest version and update expectation files.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v1:
>   - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1327810
>     Will update the flake bug report link after v1 is reviewed.
> 
> v2:
>   - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1331363
>     Updated flake test bug report links.
> 
> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml              |   2 +-
>  .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   8 +-
>  .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  21 +-
>  .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |   5 +
>  drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  20 +-
>  .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |  14 +
>  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   1 +
>  drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   8 +-
>  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  22 +-
>  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   7 +
>  drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   1 +
>  drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  31 +-
>  drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |   7 +
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  | 298 ++++++++++
>  drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  18 +-
>  drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt |  15 +-
>  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  | 112 ++++
>  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |  55 +-
>  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |  13 +
>  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |  15 +-
>  drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt |   7 +
>  .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   7 +-
>  .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |   7 +
>  .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   5 +
>  .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  12 +-
>  .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   5 +
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   3 +
>  .../msm-sc7180-trogdor-kingoftown-fails.txt   |   1 -
>  .../msm-sc7180-trogdor-kingoftown-flakes.txt  |  14 +
>  .../msm-sc7180-trogdor-kingoftown-skips.txt   |   5 +
>  ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |   1 -
>  ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   5 +
>  .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |   2 -
>  .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   5 +
>  .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |   5 -
>  .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  26 +-
>  .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  13 +-
>  .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  56 ++
>  .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   5 +
>  .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   5 +
>  drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   8 -
>  drivers/gpu/drm/ci/xfails/vkms-none-skips.txt | 543 +++++++++++++++++-
>  42 files changed, 1202 insertions(+), 211 deletions(-)
> 


> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> index 066d24ee3e08..7752adff05c1 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> @@ -1,4 +1,7 @@
>  kms_3d,Fail
> +kms_cursor_legacy@forked-bo,Fail
> +kms_cursor_legacy@forked-move,Fail
> +kms_cursor_legacy@single-bo,Fail
>  kms_cursor_legacy@torture-bo,Fail
>  kms_force_connector_basic@force-edid,Fail
>  kms_hdmi_inject@inject-4k,Fail

Interesting. Though this might by the platform legacy cursor code (it
doesn't use a plane for cursors).

Anyway,

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm

-- 
With best wishes
Dmitry

