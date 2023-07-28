Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB544C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 11:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFu7mnlDXbmlXbWasCgI2PC9m5jQyD3JuPUGhFojfqI=; b=N49ye600g6cZVwWsMe3DGRgmGq
	SoFL+v7YYdEfr6kaSaZcjEIkkXB63KknP7aEcm8WsSE01TX+BmuR6++rn544E3slvnFgudVc/vNgk
	RdIZpT5M37R1dbLdhzUCLy3ENmNg4uF9/OtWoB3V5gaOohhfAka+utA/TPz/qVfAWeCm8uOjDYoFY
	f3jDmoF2GJuZ8XW4pLg4gjOGWYCSB9E7A0T8yDNmGy3mermH65t+E3kgcJR98RNnJaS4kkTBmY474
	xXgi0dU5fbAqDgCBH3lgIs9DcGF2W7mYL+UJCFeiMDbxBJCOEg/ho1mZUxk4PzoOJK3uERjIn8FJ3
	GqFrineA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPM7V-003Gyq-2x;
	Fri, 28 Jul 2023 11:58:57 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPM7P-003Gwt-1Y;
	Fri, 28 Jul 2023 11:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xFu7mnlDXbmlXbWasCgI2PC9m5jQyD3JuPUGhFojfqI=; b=dZAFz116nQgxUH6DhndYf36rcP
	zgt6ImWhZZKDbWXV//Pc9c8kwS9LGj8/h6IPx6HH5L9STwfXMXYyrwliPZXGltlxIt/r81cQikA2+
	suvSboKEeiHfL4PVA/EZLeDI9HA+cuu9dj4U5hlnHYcrF3PNvIZdgQeweZO8pjGgjVggp4uCW7Ryv
	HmjaMVzKU4VWD/P4KAElt4AXkx+tSlck/tUS6Wtzolmmtp+C6I/p+rF0hSrxWxAuuZlTMG1WqTB4H
	Xwq7TN8M2Cu6K+wkPQvjbgAdwOratZawi/KdobO9IkHWoWEpLl+wTD/7Q3DE6PaFbNu1jzgbviQib
	+cZOJRjA==;
Received: from [187.36.235.191] (helo=[192.168.1.212])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1qPM7J-0059q5-GQ; Fri, 28 Jul 2023 13:58:46 +0200
Message-ID: <a92b05d0-65d4-c37d-c1d0-72366754e6a4@igalia.com>
Date: Fri, 28 Jul 2023 08:58:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v10] drm: Add initial ci/ subdirectory
Content-Language: en-US
To: Helen Koike <helen.koike@collabora.com>, dri-devel@lists.freedesktop.org
Cc: emma@anholt.net, linux-doc@vger.kernel.org,
 david.heidelberg@collabora.com, linux-amlogic@lists.infradead.org,
 jbrunet@baylibre.com, robdclark@google.com, corbet@lwn.net,
 khilman@baylibre.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org,
 daniels@collabora.com, martin.blumenstingl@googlemail.com,
 robclark@freedesktop.org, anholt@google.com,
 linux-mediatek@lists.infradead.org, mripard@kernel.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de
References: <20230720152737.102382-1-helen.koike@collabora.com>
From: Maira Canal <mcanal@igalia.com>
In-Reply-To: <20230720152737.102382-1-helen.koike@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_045853_001668_961693E1 
X-CRM114-Status: GOOD (  44.82  )
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

Hi Helen,

Great to see this coming to the DRM!

Just wondering, any chance we could add a stage to perform tests on
VKMS? The main way of validating VKMS is through IGT tests, so I feel
it would be a perfect match to have VKMS as a stage on the CI. As a
generic KMS driver, VKMS is also great to validate changes on DRM core.

Another question, could we add V3D to the default arm and arm64 config?

Best Regards,
- Maíra

On 7/20/23 12:27, Helen Koike wrote:
> From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> 
> Developers can easily execute several tests on different devices
> by just pushing their branch to their fork in a repository hosted
> on gitlab.freedesktop.org which has an infrastructure to run jobs
> in several runners and farms with different devices.
> 
> There are also other automated tools that uprev dependencies,
> monitor the infra, and so on that are already used by the Mesa
> project, and we can reuse them too.
> 
> Also, store expectations about what the DRM drivers are supposed
> to pass in the IGT test suite. By storing the test expectations
> along with the code, we can make sure both stay in sync with each
> other so we can know when a code change breaks those expectations.
> 
> Also, include a configuration file that points to the out-of-tree
> CI scripts.
> 
> This will allow all contributors to drm to reuse the infrastructure
> already in gitlab.freedesktop.org to test the driver on several
> generations of the hardware.
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> 
> Hello,
> 
> I'm re-spining this patch sent originally by Tomeu.
> 
> This is meant to be an auxiliary tool where developers and
> maintainers can just submit their code to fdo and see if
> tests passes, than they can decide if it is worthy merging
> it or not.
> 
> This tool has proven its value on the Mesa community
> and it can bring a lot of value here too.
> 
> Please review and let me know your thoughts.
> 
> You can also see this patch on
> https://gitlab.freedesktop.org/helen.fornazier/linux/-/tree/drm-ci-tests
> 
> Thanks!
> 
> v2:
>    - Fix names of result expectation files to match SoC
>    - Don't execute tests that are going to skip on all boards
> 
> v3:
>    - Remove tracking of dmesg output during test execution
> 
> v4:
>    - Move up to drivers/gpu/drm
>    - Add support for a bunch of other drivers
>    - Explain how to incorporate fixes for CI from a
>      ${TARGET_BRANCH}-external-fixes branch
>    - Remove tests that pass from expected results file, to reduce the
>      size of in-tree files
>    - Add docs about how to deal with outages in automated testing labs
>    - Specify the exact SHA of the CI scripts to be used
> 
> v5:
>    - Remove unneeded skips from Meson expectations file
>    - Use a more advanced runner that detects flakes automatically
>    - Use a more succint format for the expectations
>    - Run many more tests (and use sharding to finish in time)
>    - Use skip lists to avoid hanging machines
>    - Add some build testing
>    - Build IGT in each pipeline for faster uprevs
>    - List failures in the GitLab UI
> 
> v6:
>    - Rebase on top of latest drm-next
>    - Lower priority of LAVA jobs to not impact Mesa CI as much
>    - Update docs
> 
> v7:
>    - Rebase on top of latest drm-next
> 
> v8:
>    - Move all files specific to testing the kernel into the kernel tree
>      (thus I have dropped the r-bs I had collected so far)
>    - Uprev Gitlab CI infrastructure scripts to the latest from Mesa
>    - Add MAINTAINERS entry
>    - Fix boot on MT8173 by adding some Kconfigs that are now needed
>    - Link to the docs from index.rst and hard-wrap the file
> 
> v9:
>    - Only automatically run the pipelines for merge requests
>    - Switch to zstd for the build artifacts to align with Mesa
>    - Add Qcom USB PHYs to config as they are now =m in the defconfig
> 
> v10:
>    - Include ci yml files from mesa/mesa (where the development is
>      current active) instead of a spin off project.
>    - Uprev Gitlab CI infrastructure scripts to the latest from Mesa
>    - Update MAINTAINERS entry
>    - Uprev igt tool
>    - add LAVA_JOB_PRIORITY: 30
>    - pipeline example:
>    https://gitlab.freedesktop.org/helen.fornazier/linux/-/pipelines/940506
> ---
>   Documentation/gpu/automated_testing.rst       |  144 +
>   Documentation/gpu/index.rst                   |    1 +
>   MAINTAINERS                                   |    8 +
>   drivers/gpu/drm/ci/arm.config                 |   69 +
>   drivers/gpu/drm/ci/arm64.config               |  199 ++
>   drivers/gpu/drm/ci/build-igt.sh               |   35 +
>   drivers/gpu/drm/ci/build.sh                   |  157 +
>   drivers/gpu/drm/ci/build.yml                  |  110 +
>   drivers/gpu/drm/ci/check-patch.py             |   57 +
>   drivers/gpu/drm/ci/container.yml              |   61 +
>   drivers/gpu/drm/ci/gitlab-ci.yml              |  252 ++
>   drivers/gpu/drm/ci/igt_runner.sh              |   77 +
>   drivers/gpu/drm/ci/image-tags.yml             |   15 +
>   drivers/gpu/drm/ci/lava-submit.sh             |   57 +
>   drivers/gpu/drm/ci/static-checks.yml          |   12 +
>   drivers/gpu/drm/ci/test.yml                   |  335 ++
>   drivers/gpu/drm/ci/testlist.txt               | 2912 +++++++++++++++++
>   drivers/gpu/drm/ci/x86_64.config              |  111 +
>   .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   22 +
>   .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   19 +
>   .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |    2 +
>   drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |   17 +
>   .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |   32 +
>   drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |    4 +
>   drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   57 +
>   drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |    1 +
>   drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |    4 +
>   drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |   18 +
>   drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   37 +
>   drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |    2 +
>   drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |   18 +
>   drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |   41 +
>   drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |    5 +
>   drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   26 +
>   drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt |   25 +
>   drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |    5 +
>   drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   37 +
>   drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |    5 +
>   drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |   11 +
>   drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |   47 +
>   drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt |    1 +
>   drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |    2 +
>   .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   29 +
>   .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |    0
>   .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   10 +
>   .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |   14 +
>   .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   12 +
>   .../gpu/drm/ci/xfails/meson-g12b-flakes.txt   |    4 +
>   .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   15 +
>   .../gpu/drm/ci/xfails/msm-apq8016-flakes.txt  |    4 +
>   .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |    2 +
>   .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |    4 +
>   .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |    2 +
>   .../gpu/drm/ci/xfails/msm-sc7180-fails.txt    |   25 +
>   .../gpu/drm/ci/xfails/msm-sc7180-flakes.txt   |    7 +
>   .../gpu/drm/ci/xfails/msm-sc7180-skips.txt    |   23 +
>   .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |   68 +
>   .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   |   11 +
>   .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |    2 +
>   .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   49 +
>   .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |    8 +
>   .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   52 +
>   .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   39 +
>   .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |   23 +
>   .../drm/ci/xfails/rockchip-rk3399-skips.txt   |    5 +
>   .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   38 +
>   .../drm/ci/xfails/virtio_gpu-none-flakes.txt  |    0
>   .../drm/ci/xfails/virtio_gpu-none-skips.txt   |    6 +
>   test                                          |    0
>   69 files changed, 5502 insertions(+)
>   create mode 100644 Documentation/gpu/automated_testing.rst
>   create mode 100644 drivers/gpu/drm/ci/arm.config
>   create mode 100644 drivers/gpu/drm/ci/arm64.config
>   create mode 100644 drivers/gpu/drm/ci/build-igt.sh
>   create mode 100644 drivers/gpu/drm/ci/build.sh
>   create mode 100644 drivers/gpu/drm/ci/build.yml
>   create mode 100755 drivers/gpu/drm/ci/check-patch.py
>   create mode 100644 drivers/gpu/drm/ci/container.yml
>   create mode 100644 drivers/gpu/drm/ci/gitlab-ci.yml
>   create mode 100755 drivers/gpu/drm/ci/igt_runner.sh
>   create mode 100644 drivers/gpu/drm/ci/image-tags.yml
>   create mode 100755 drivers/gpu/drm/ci/lava-submit.sh
>   create mode 100644 drivers/gpu/drm/ci/static-checks.yml
>   create mode 100644 drivers/gpu/drm/ci/test.yml
>   create mode 100644 drivers/gpu/drm/ci/testlist.txt
>   create mode 100644 drivers/gpu/drm/ci/x86_64.config
>   create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
>   create mode 100644 test
>

