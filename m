Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EEAC3065C
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 10:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nvqcTE+d+I6/PYlZYlUrN3ZSE7/0dbyWuREcOgf8aA=; b=0o9rXuu0uOoxe9HIl18pQ7llkR
	9SitOi6T8l0xz6F2SO8HpaYzaQIsaHugcT/WywqCZba/4SdUC30gT3VNVpQwySq9T7c8+rXxzpqfS
	CaomWGZw9WRUfR1ivZ/R2OQm4rC9LxIUQNhYjoKcqv47eyKgvS8dc6M4uieZ6M4X80gRVxQa0Dr/Z
	YBqN34/kRaCb5EwGg52dJJq2c5zfnmWydCveCpWUxDi1+VjlSatbwyhtKW/OaTp2vaIy5xkmx4jJ7
	ouGNS++0XXEUlFTIVfzF1DqjXlBBpFnODE9wmJi6Klc/FRV+WIMVqZpyOzU5rcmviTMu5Qp3AknDI
	DD6SJJig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPJVQ-0000000Cqce-00bH;
	Thu, 04 Jul 2024 10:16:00 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPJVM-0000000CqZc-2R6Y
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Jul 2024 10:15:58 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so4741071fa.1
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Jul 2024 03:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720088154; x=1720692954; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1nvqcTE+d+I6/PYlZYlUrN3ZSE7/0dbyWuREcOgf8aA=;
        b=yssXao/9N/62IS2GE2PymOgwEmR+G5PRGX8P2WXhWRfG2yHxe+D7CPqwSHGs5cIc89
         SvmWWSdeuJPK/xmIJ+AozrnO8lTIrbXYqpS3e1HhlRhz2HQ2RJXh79HbC/9lLxmxwb7s
         deDldg0M3xDIOZ2iSWLfL9qU6GkNe2MipTWHZ3JEInC76bX2Mj7C1o+six+it4//IdmU
         CUypFsAPwTGvDerwNlstU947VqaMiVa0bqyiI1/swl6XlH1otJxTg4w38L2nD/9cCD0N
         Zg3d5VXjSsefxNV9AjCNSxqeuyMVv/xBzc7i/Ttx2ihL6eOuSoOhQSQ9UFEdB5ElOBXC
         ZA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720088154; x=1720692954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nvqcTE+d+I6/PYlZYlUrN3ZSE7/0dbyWuREcOgf8aA=;
        b=lUtO2qTwN+qYf78qVC5NGEwseSy97qoREeXmULLZwAaw7ytO21NrSdq5oNxbEAcEh2
         EZMxB+Lf4Kc2FL50rCpWmJCR9lhsMVMMRgb7El2erQ+J5Ve/C9aJebg6xl/LxayIS/b+
         55AbVzsZKQLBD6wAv8vNNqijVn6y/QiOeDjroKkJ+m03GYsgM8vYHgkv1rhNF8NVJeUy
         GV0lTfq6+INUgGquGiKvK+usznosDe/anYOHMCvIm/UdyvvQFuxiLHk2JvX1ggZNBaL/
         hqgocDppLuTcpnhLgsvavld89BY9c5Du8FytVK/Bufg97NVZcqC4dl/+6rR/+/VA/57F
         XHsw==
X-Forwarded-Encrypted: i=1; AJvYcCX+yGQLaASQ1Ocaelsu+lD6STlPQJg2gLcUvNfRWY6bxs8Wyvf1+fvNBl0Xl/MxBgEDnMKe/Hni5bpWutcjfYLk3ExLm73nmdCwmzO/6W2K+liH
X-Gm-Message-State: AOJu0YzTPwnLmV3NP/7+Jj+4dK8H31upy4Eo/u3ibdJVNKcZo43HLC0S
	8g/hgyvFQwqn3fbUWfz45jheSuWViH/yoGIrWCcPkoQ+ZItYYvYDUmC0ljc5dwI=
X-Google-Smtp-Source: AGHT+IFjFbE6dWkiueh16FP2N9UOEw13MN12/uduae8Rfkcs3JR/7QPB7Yfqddj+KjB9xdjW8KZcuw==
X-Received: by 2002:a2e:98c3:0:b0:2ec:5200:a935 with SMTP id 38308e7fff4ca-2ee8edc2d45mr8049801fa.40.1720088154177;
        Thu, 04 Jul 2024 03:15:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee5168cf1fsm22523201fa.116.2024.07.04.03.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 03:15:53 -0700 (PDT)
Date: Thu, 4 Jul 2024 13:15:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, mcanal@igalia.com, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/ci: uprev IGT
Message-ID: <ojnz5hjfht6gwouphvmvizb2udlz2wvwnsj4vgosp3chrhsmcv@c7cxscdyxtsn>
References: <20240704092202.75551-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704092202.75551-1-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_031556_634301_FBF2915E 
X-CRM114-Status: GOOD (  16.15  )
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

On Thu, Jul 04, 2024 at 02:52:02PM GMT, Vignesh Raman wrote:
> Uprev IGT to the latest version, which includes a fix for the
> writeback tests issue on MSM devices. Enable debugging for
> igt-runner to log output such as 'Begin test' and 'End test'.
> This will help identify which test causes system freeze or hangs.
> Update xfails and add metadata header for each flake test.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v1:
>   - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1216850
> 
> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml              |   2 +-
>  drivers/gpu/drm/ci/igt_runner.sh              |   1 +
>  .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   1 +
>  .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  14 +-
>  .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  12 +-
>  .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |  41 ++++-
>  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   5 +-
>  drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |   2 +-
>  drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  14 +-
>  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   9 +-
>  drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   5 +-
>  drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  24 +--
>  drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |   8 +-
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   2 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt |   2 +-
>  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |  25 +--
>  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |  17 +-
>  drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt |   2 +-
>  drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |   5 +-
>  .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   9 +-
>  .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |  32 +++-
>  .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   4 +-
>  .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   2 +-
>  .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   2 +-
>  .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   2 +-
>  .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   2 +-
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   5 +-
>  .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   2 +-
>  .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |   2 +-
>  .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |   4 +-

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm tests


>  .../msm-sc7180-trogdor-kingoftown-fails.txt   | 145 ------------------
>  .../msm-sc7180-trogdor-kingoftown-flakes.txt  |  18 ++-
>  .../msm-sc7180-trogdor-kingoftown-skips.txt   |   5 +-
>  ...sm-sc7180-trogdor-lazor-limozeen-fails.txt | 145 ------------------
>  ...m-sc7180-trogdor-lazor-limozeen-flakes.txt |  11 +-
>  ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   2 +-
>  .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   | 105 ++++++++++++-
>  .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   4 +-
>  .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   2 +-
>  .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   2 +-
>  .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   2 +-
>  .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |   4 +-
>  .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   2 +-
>  .../drm/ci/xfails/virtio_gpu-none-fails.txt   |  64 ++++++++
>  .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   4 +-
>  drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   4 -
>  .../gpu/drm/ci/xfails/vkms-none-flakes.txt    |  21 +++
>  drivers/gpu/drm/ci/xfails/vkms-none-skips.txt | 105 ++++++++++++-
>  53 files changed, 527 insertions(+), 395 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 80fb0f57ae46..b09976c3d2c2 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -5,7 +5,7 @@ variables:
>    UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>    TARGET_BRANCH: drm-next
>  
> -  IGT_VERSION: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56
> +  IGT_VERSION: f13702b8e4e847c56da3ef6f0969065d686049c5
>  
>    DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
>    DEQP_RUNNER_GIT_TAG: v0.15.0


-- 
With best wishes
Dmitry

