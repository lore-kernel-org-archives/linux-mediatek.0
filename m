Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EBFC4321E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 17:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvHkbVkJp6EcnRQi+5PIMElEgmgHrVtQA2UXnyTLJnE=; b=Uh1fyP67Qlegpmgr1jw4KQhUIX
	oTb3pXAyC+sgAMAbgsh+o/BCzjzbxHZ4aHsJcV+FYCfyHNYVm4IQa8oasb4AOuWv3JSacR3wxJuUs
	Jze7iKsMa6D4FWCG7+nxDnrNkyEyB0pQl81AWLCdaCrFh6xabxC7cv8DIeQomi8G4qtR7RtEm8PUk
	lH38m6x6672frez7DQG/L+KGmXPsqdlgR9XZNtfu94M8BPoLVB/7TQRiBJbBknwb05wX3A37YF3Mu
	Ao4qbuiFs0p5I9qKuF5RvyWXhScJdqp5gdUYCesQSC6ln7gBWrNXG/oABHb4ZbdAXfGLGy3gkS7z0
	lCJyNgDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOD3-00FS73-M1; Fri, 14 Oct 2022 17:10:57 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOCr-00FS5f-PM; Fri, 14 Oct 2022 17:10:47 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1322fa1cf6fso6575313fac.6;
        Fri, 14 Oct 2022 10:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lvHkbVkJp6EcnRQi+5PIMElEgmgHrVtQA2UXnyTLJnE=;
        b=UigVBOMALTsPKNEDJ5HLNuYVHLL3LdbmGKmb7QccsIWD9OUI1M/d4hfnqa4j+dxasl
         k0mZMczbS3Ed3p7E6US1OI14quCpOgFMt3PF9zrQIQxDuGtqmy1kbvQdyZN7NHtwr7Sw
         HelkeT8jWTDEHWaqA4m01Vvzh1BBiuEEcQ0XVYxRjNj6DQ80oH+4CusowLliMcMuPnmN
         8vENjthImk7oxzd9mv15wldxXJgggP0XD1H8yMk5G7D6jl4MqtEVyP5Gknmkh1AaRiH/
         RkAVsgJ/8aKOvb78eA4Iy+ivCKQP0/Aw4UJElz3I13f9k+4b7h6xV17QjsTTM/W7AzwY
         8rEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvHkbVkJp6EcnRQi+5PIMElEgmgHrVtQA2UXnyTLJnE=;
        b=NWeXD1cG3G3aDndA18PH1WGJ3lyvHaXH3zbO6xH4zbuEUCCo0uyK8mi18Gsx+5xAvd
         1DGAaaI8c8A9IR06G8aj7Z2QG5InNQkSQlghZoIzxAGi61QR7BfYbQGeEHN0NhflWFeM
         b1hUlTujMlZQdgBiVkIQc9/7uF/e9jWmS8P4FlZJKS86JJts28gfE7v3zMShbz9OXZBG
         /VV4XLJzrShY1atZ37k+argO/1l50SXQqK1umMM/wrgfJQKUFZ6+TrMqqT5iKJNh0rqs
         vlYn/2kHHIxRl+vP7YdaQ+RgvibFjiGqeaeVDnOw1wr/y1Z6ecQtV7P2ISBAl00O7A0J
         5I7A==
X-Gm-Message-State: ACrzQf3J0Sdz5dkKNTpIi7f3W0HmaEYBCPvr7TzHmUD+z4O4/AhaKrYh
	AtFaRldFj/c7na77UZzaMDXoalT/tjuT9NSv4VE=
X-Google-Smtp-Source: AMsMyM5YRJU50ghT4+PK7ZzjpjEuEF0K9MRdSqXqrXv+y3RgpJpGuixHukGTzRdv7CkiKNlLB9FtM4jof+P+XDYdfHA=
X-Received: by 2002:a05:6870:4286:b0:132:756f:6b97 with SMTP id
 y6-20020a056870428600b00132756f6b97mr3301793oah.38.1665767443808; Fri, 14 Oct
 2022 10:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220909141528.5090-1-tomeu.vizoso@collabora.com> <20220912072903.14626-1-tomeu.vizoso@collabora.com>
In-Reply-To: <20220912072903.14626-1-tomeu.vizoso@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 14 Oct 2022 10:10:50 -0700
Message-ID: <CAF6AEGsjfHSYwB0q4qKnLeMnpZigBwcFrkkLpxofKizLVArX5A@mail.gmail.com>
Subject: Re: [PATCH v9] drm: Add initial ci/ subdirectory
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, 
	Heiko Stuebner <heiko@sntech.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_101045_870449_90EF3AA4 
X-CRM114-Status: GOOD (  33.07  )
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

On Mon, Sep 12, 2022 at 12:29 AM Tomeu Vizoso
<tomeu.vizoso@collabora.com> wrote:
>
> And use it to store expectations about what the DRM drivers are
> supposed to pass in the IGT test suite.
>
> Also include a configuration file that points to the out-of-tree CI
> scripts.
>
> By storing the test expectations along the code we can make sure both
> stay in sync with each other, and so we can know when a code change
> breaks those expectations.
>
> This will allow all contributors to drm to reuse the infrastructure
> already in gitlab.freedesktop.org to test the driver on several
> generations of the hardware.
>
> v2:
>   - Fix names of result expectation files to match SoC
>   - Don't execute tests that are going to skip on all boards
>
> v3:
>   - Remove tracking of dmesg output during test execution
>
> v4:
>   - Move up to drivers/gpu/drm
>   - Add support for a bunch of other drivers
>   - Explain how to incorporate fixes for CI from a
>     ${TARGET_BRANCH}-external-fixes branch
>   - Remove tests that pass from expected results file, to reduce the
>     size of in-tree files
>   - Add docs about how to deal with outages in automated testing labs
>   - Specify the exact SHA of the CI scripts to be used
>
> v5:
>   - Remove unneeded skips from Meson expectations file
>   - Use a more advanced runner that detects flakes automatically
>   - Use a more succint format for the expectations
>   - Run many more tests (and use sharding to finish in time)
>   - Use skip lists to avoid hanging machines
>   - Add some build testing
>   - Build IGT in each pipeline for faster uprevs
>   - List failures in the GitLab UI
>
> v6:
>   - Rebase on top of latest drm-next
>   - Lower priority of LAVA jobs to not impact Mesa CI as much
>   - Update docs
>
> v7:
>   - Rebase on top of latest drm-next
>
> v8:
>   - Move all files specific to testing the kernel into the kernel tree
>     (thus I have dropped the r-bs I had collected so far)
>   - Uprev Gitlab CI infrastructure scripts to the latest from Mesa
>   - Add MAINTAINERS entry
>   - Fix boot on MT8173 by adding some Kconfigs that are now needed
>   - Link to the docs from index.rst and hard-wrap the file
>
> v9:
>   - Only automatically run the pipelines for merge requests
>   - Switch to zstd for the build artifacts to align with Mesa
>   - Add Qcom USB PHYs to config as they are now =m in the defconfig
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  Documentation/gpu/automated_testing.rst       |  144 +
>  Documentation/gpu/index.rst                   |    1 +
>  MAINTAINERS                                   |    8 +
>  drivers/gpu/drm/ci/arm.config                 |   57 +
>  drivers/gpu/drm/ci/arm64.config               |  179 ++
>  drivers/gpu/drm/ci/build-igt.sh               |   43 +
>  drivers/gpu/drm/ci/build.sh                   |  158 +
>  drivers/gpu/drm/ci/build.yml                  |  110 +
>  drivers/gpu/drm/ci/check-patch.py             |   57 +
>  drivers/gpu/drm/ci/container.yml              |   54 +
>  drivers/gpu/drm/ci/gitlab-ci.yml              |  225 ++
>  drivers/gpu/drm/ci/igt_runner.sh              |   77 +
>  drivers/gpu/drm/ci/image-tags.yml             |   13 +
>  drivers/gpu/drm/ci/lava-submit.sh             |   53 +
>  drivers/gpu/drm/ci/static-checks.yml          |   12 +
>  drivers/gpu/drm/ci/test.yml                   |  322 ++
>  drivers/gpu/drm/ci/testlist.txt               | 2763 +++++++++++++++++
>  drivers/gpu/drm/ci/x86_64.config              |  105 +
>  .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   19 +
>  .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   15 +
>  .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |    2 +
>  .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |   32 +
>  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |    2 +
>  drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   29 +
>  drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |    1 +
>  drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |    2 +
>  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   37 +
>  drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |   40 +
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |    2 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |    8 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt |   25 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |    2 +
>  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   19 +
>  drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |    5 +
>  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |    8 +
>  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |   30 +
>  drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt |    1 +
>  .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   29 +
>  .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   10 +
>  .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |   14 +
>  .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |    5 +
>  .../gpu/drm/ci/xfails/meson-g12b-flakes.txt   |    4 +
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   15 +
>  .../gpu/drm/ci/xfails/msm-apq8016-flakes.txt  |    4 +
>  .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |    2 +
>  .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |    4 +
>  .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |    2 +
>  .../gpu/drm/ci/xfails/msm-sc7180-fails.txt    |   21 +
>  .../gpu/drm/ci/xfails/msm-sc7180-flakes.txt   |    6 +
>  .../gpu/drm/ci/xfails/msm-sc7180-skips.txt    |   23 +
>  .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |   43 +
>  .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   |   11 +
>  .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |    2 +
>  .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   43 +
>  .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |    2 +
>  .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   49 +
>  .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   29 +
>  .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |   20 +
>  .../drm/ci/xfails/rockchip-rk3399-skips.txt   |    5 +
>  .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   38 +
>  .../drm/ci/xfails/virtio_gpu-none-flakes.txt  |    0
>  .../drm/ci/xfails/virtio_gpu-none-skips.txt   |    6 +
>  62 files changed, 5047 insertions(+)
>  create mode 100644 Documentation/gpu/automated_testing.rst
>  create mode 100644 drivers/gpu/drm/ci/arm.config
>  create mode 100644 drivers/gpu/drm/ci/arm64.config
>  create mode 100644 drivers/gpu/drm/ci/build-igt.sh
>  create mode 100644 drivers/gpu/drm/ci/build.sh
>  create mode 100644 drivers/gpu/drm/ci/build.yml
>  create mode 100755 drivers/gpu/drm/ci/check-patch.py
>  create mode 100644 drivers/gpu/drm/ci/container.yml
>  create mode 100644 drivers/gpu/drm/ci/gitlab-ci.yml
>  create mode 100755 drivers/gpu/drm/ci/igt_runner.sh
>  create mode 100644 drivers/gpu/drm/ci/image-tags.yml
>  create mode 100755 drivers/gpu/drm/ci/lava-submit.sh
>  create mode 100644 drivers/gpu/drm/ci/static-checks.yml
>  create mode 100644 drivers/gpu/drm/ci/test.yml
>  create mode 100644 drivers/gpu/drm/ci/testlist.txt
>  create mode 100644 drivers/gpu/drm/ci/x86_64.config
>  create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
>
[snip]

