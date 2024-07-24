Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AC7C3DA63
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jul 2024 01:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YfQhPNVrqgALVr/cdQep6gw3nUqu25ZYdVbKZA6d8rQ=; b=Cn5MF4CO/wQGqGgjpS+azsgNW2
	GmU988JNkWtjwg9KHMTKtzkN3O5niwXmGPv9skfuoA20JEACanv2uLFHU2Kqoxym3JU3sjjwMgDTk
	7awNsqNlN83RnwHkaXVUpPyqAr4awjcmeTq6XDcxPpS1Or6TOCWG+LtQHGSad1q+FI6XtE5wnTYAe
	cpCzLa5b0Nt1IKePOK5e/UEVz3ncxwybCRCQE6oiMN+iEnH3ILIlJ+QnEpOiJAI47v/tJcfhQI9Cz
	HRsXELDUTU3DoThHUjMaBim8eFLmH1mFraRCAw9cT/WAOg8XULruva6W52PbLbEigqG6fn//xZPY1
	csvQ7RlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWR6S-0000000E2fb-3Hrt;
	Wed, 24 Jul 2024 01:47:40 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWR6N-0000000E2cd-2pML;
	Wed, 24 Jul 2024 01:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721785650;
	bh=B0X6Ir40zqw+g3Kj/nhcP3LeAOQW5j+ByLYTDJE+wME=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OhMXDAWl6d4B6IpuFxmFzXpIdfiDy0YAi1t91IYfqwGDBB1C0VfzrAFMb9pl8YZsl
	 BIvsuQRkZF46nLN//sYXv1/qtnEgy+A3ODs1m6l/11DkYfI1uWbT7+8lLgcstdC45+
	 qUjyLGjCGfO8+PEJ6wwMwfHPnF6nlI0Rz1CpMmf448Il/sKvMY9E44MYJytBmSj2Af
	 Kb4UdQzoVL9xFRO3zPoUEsI99gp0Wbsylp5fWnQ3z0dTsFjV23ozsrgj65W6DH8h9V
	 cJmh4kxbd97V9eJYiAxlcCQCVrX19CR+C/7vvYEbNr5/brVjwHIg4JWiYYN7nhcRxs
	 /dLNlXJjIXuKg==
Received: from [10.3.2.176] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1894D3781144;
	Wed, 24 Jul 2024 01:47:24 +0000 (UTC)
Message-ID: <f28634bf-b2bb-438f-bfff-98d3b0bcfe15@collabora.com>
Date: Tue, 23 Jul 2024 22:47:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] drm/ci: mediatek: add tests for mediatek display
 driver
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 deborah.brouwer@collabora.com, robdclark@gmail.com,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240712091549.56635-1-vignesh.raman@collabora.com>
 <20240712091549.56635-3-vignesh.raman@collabora.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240712091549.56635-3-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_184736_062479_EDAE8346 
X-CRM114-Status: GOOD (  27.30  )
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



On 12/07/2024 06:15, Vignesh Raman wrote:
> For mediatek mt8183, the display driver is mediatek, while the
> gpu driver is panfrost. Currently, in drm-ci for mt8183, only
> the gpu driver is tested. Refactor the existing mediatek jobs
> and add support in drm-ci to test both display and gpu driver
> for mt8183 and update xfails.
> 
> Since the correct driver name is passed from the job to test gpu
> and display driver, remove the check to set IGT_FORCE_DRIVER
> based on driver name for mediatek jobs.
> 
> Update the MAINTAINERS file to include xfails for panfrost driver.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

lgtm

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
> 
> v2:
>    - Refactor the patch to rename job to indicate display driver testing,
>      rename the existing xfail files, and remove IGT_FORCE_DRIVER from the
>      script since it's now set by the job.
> 
> v3:
>    - Add the job name in GPU_VERSION and use it for xfail file names instead
>      of using DRIVER_NAME. Also update xfails.
> 
> v4:
>    - Remove the display suffix in job and rename xfails accordingly.
>      Remove the change adding job name in GPU_VERSION.
> 
> v5:
>    - Add mediatek-display job.
> 
> v6:
>    - Squash commits for display and gpu driver testing. Reword the commit message.
> 
> 
> v7:
>    - Rebase with recent drm-ci fixes and retest with latest IGT.
> 
> ---
>   MAINTAINERS                                   |  1 +
>   drivers/gpu/drm/ci/gitlab-ci.yml              |  2 +-
>   drivers/gpu/drm/ci/igt_runner.sh              |  7 ----
>   drivers/gpu/drm/ci/test.yml                   | 38 +++++++++++++++----
>   .../drm/ci/xfails/mediatek-mt8183-fails.txt   | 28 +++++++++++---
>   .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |  7 ++++
>   .../drm/ci/xfails/mediatek-mt8183-skips.txt   |  4 +-
>   .../drm/ci/xfails/panfrost-mt8183-fails.txt   | 11 ++++++
>   .../drm/ci/xfails/panfrost-mt8183-skips.txt   | 18 +++++++++
>   9 files changed, 92 insertions(+), 24 deletions(-)
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cb8355f20b36..f3783f2269ff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1741,6 +1741,7 @@ L:	dri-devel@lists.freedesktop.org
>   S:	Supported
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	Documentation/gpu/panfrost.rst
> +F:	drivers/gpu/drm/ci/xfails/panfrost*
>   F:	drivers/gpu/drm/panfrost/
>   F:	include/uapi/drm/panfrost_drm.h
>   
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index b09976c3d2c2..9d800f629f08 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -121,8 +121,8 @@ stages:
>     - mediatek
>     - meson
>     - msm
> +  - panfrost
>     - rockchip
> -  - virtio-gpu
>     - software-driver
>   
>   # YAML anchors for rule conditions
> diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
> index 37c724dba8cb..6193865f23a3 100755
> --- a/drivers/gpu/drm/ci/igt_runner.sh
> +++ b/drivers/gpu/drm/ci/igt_runner.sh
> @@ -23,13 +23,6 @@ case "$DRIVER_NAME" in
>       rockchip|meson)
>           export IGT_FORCE_DRIVER="panfrost"
>           ;;
> -    mediatek)
> -        if [ "$GPU_VERSION" = "mt8173" ]; then
> -            export IGT_FORCE_DRIVER=${DRIVER_NAME}
> -        elif [ "$GPU_VERSION" = "mt8183" ]; then
> -            export IGT_FORCE_DRIVER="panfrost"
> -        fi
> -        ;;
>       amdgpu|vkms)
>           # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
>           mv /install/modules/lib/modules/* /lib/modules/. || true
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index ee908b66aad2..219eca5ef24c 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -280,38 +280,62 @@ amdgpu:stoney:
>       GPU_VERSION: stoney
>       RUNNER_TAG: mesa-ci-x86-64-lava-hp-11A-G6-EE-grunt
>   
> -.mediatek:
> +.mediatek-device:
>     extends:
>       - .lava-igt:arm64
>     stage: mediatek
>     variables:
> -    DRIVER_NAME: mediatek
>       DTB: ${DEVICE_TYPE}
>       BOOT_METHOD: depthcharge
>       KERNEL_IMAGE_TYPE: ""
>   
> -mediatek:mt8173:
> +.mediatek-display:
> +  stage: mediatek
> +  variables:
> +    DRIVER_NAME: mediatek
> +
> +.panfrost-gpu:
> +  stage: panfrost
> +  variables:
> +    DRIVER_NAME: panfrost
> +
> +.mt8173:
>     extends:
> -    - .mediatek
> +    - .mediatek-device
>     parallel: 4
>     variables:
>       DEVICE_TYPE: mt8173-elm-hana
>       GPU_VERSION: mt8173
>       RUNNER_TAG: mesa-ci-x86-64-lava-mt8173-elm-hana
>   
> -mediatek:mt8183:
> +.mt8183:
>     extends:
> -    - .mediatek
> +    - .mediatek-device
>     parallel: 3
>     variables:
>       DEVICE_TYPE: mt8183-kukui-jacuzzi-juniper-sku16
>       GPU_VERSION: mt8183
>       RUNNER_TAG: mesa-ci-x86-64-lava-mt8183-kukui-jacuzzi-juniper-sku16
>   
> +mediatek:mt8173:
> +  extends:
> +    - .mt8173
> +    - .mediatek-display
> +
> +mediatek:mt8183:
> +  extends:
> +    - .mt8183
> +    - .mediatek-display
> +
> +panfrost:mt8183:
> +  extends:
> +    - .mt8183
> +    - .panfrost-gpu
> +
>   # drm-mtk doesn't even probe yet in mainline for mt8192
>   .mediatek:mt8192:
>     extends:
> -    - .mediatek
> +    - .mediatek-device
>     parallel: 3
>     variables:
>       DEVICE_TYPE: mt8192-asurada-spherion-r0
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
> index 5b7d623f404b..cf3a747f7cec 100644
> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
> @@ -1,8 +1,24 @@
> -dumb_buffer@create-clear,Fail
> -dumb_buffer@create-valid-dumb,Fail
> +core_setmaster@master-drop-set-shared-fd,Fail
> +device_reset@cold-reset-bound,Fail
> +device_reset@reset-bound,Fail
> +device_reset@unbind-cold-reset-rebind,Fail
> +device_reset@unbind-reset-rebind,Fail
> +dumb_buffer@create-clear,Crash
>   dumb_buffer@invalid-bpp,Fail
> -dumb_buffer@map-invalid-size,Fail
> -dumb_buffer@map-uaf,Fail
> -dumb_buffer@map-valid,Fail
> -panfrost/panfrost_prime@gem-prime-import,Fail
> +fbdev@eof,Fail
> +fbdev@pan,Fail
> +fbdev@read,Fail
> +fbdev@unaligned-read,Fail
> +kms_bw@connected-linear-tiling-1-displays-1920x1080p,Fail
> +kms_bw@connected-linear-tiling-1-displays-2160x1440p,Fail
> +kms_bw@connected-linear-tiling-1-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-1-displays-1920x1080p,Fail
> +kms_bw@linear-tiling-1-displays-2560x1440p,Fail
> +kms_bw@linear-tiling-1-displays-3840x2160p,Fail
> +kms_color@invalid-gamma-lut-sizes,Fail
> +kms_flip@flip-vs-panning-vs-hang,Fail
> +kms_flip@flip-vs-suspend,Fail
> +kms_lease@lease-uevent,Fail
> +kms_properties@plane-properties-atomic,Fail
> +kms_rmfb@close-fd,Fail
>   tools_test@tools_test,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
> new file mode 100644
> index 000000000000..2d1f24e56083
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
> @@ -0,0 +1,7 @@
> +# Board Name: mt8183-kukui-jacuzzi-juniper-sku16
> +# Bug Report: https://lore.kernel.org/linux-mediatek/0b2a1899-15dd-42fa-8f63-ea0ca28dbb17@collabora.com/T/#u
> +# Failure Rate: 100
> +# IGT Version: 1.28-gf13702b8e
> +# Linux Version: 6.10.0-rc5
> +kms_bw@linear-tiling-1-displays-2560x1440p
> +kms_cursor_legacy@cursor-vs-flip-atomic-transitions
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
> index 03eefa518afa..562662eff802 100644
> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
> @@ -2,6 +2,7 @@
>   ^amdgpu.*
>   ^msm.*
>   nouveau_.*
> +^panfrost.*
>   ^v3d.*
>   ^vc4.*
>   ^vmwgfx*
> @@ -10,9 +11,6 @@ nouveau_.*
>   gem_.*
>   i915_.*
>   
> -# Panfrost is not a KMS driver, so skip the KMS tests
> -kms_.*
> -
>   # Currently fails and causes coverage loss for other tests
>   # since core_getversion also fails.
>   core_hotunplug.*
> diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
> new file mode 100644
> index 000000000000..fd6155dd99ef
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
> @@ -0,0 +1,11 @@
> +dumb_buffer@create-clear,Fail
> +dumb_buffer@create-valid-dumb,Fail
> +dumb_buffer@invalid-bpp,Fail
> +dumb_buffer@map-invalid-size,Fail
> +dumb_buffer@map-uaf,Fail
> +dumb_buffer@map-valid,Fail
> +fbdev@eof,Fail
> +fbdev@read,Fail
> +fbdev@unaligned-read,Fail
> +panfrost/panfrost_prime@gem-prime-import,Fail
> +tools_test@tools_test,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
> new file mode 100644
> index 000000000000..03eefa518afa
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
> @@ -0,0 +1,18 @@
> +# Skip driver specific tests
> +^amdgpu.*
> +^msm.*
> +nouveau_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +
> +# Panfrost is not a KMS driver, so skip the KMS tests
> +kms_.*
> +
> +# Currently fails and causes coverage loss for other tests
> +# since core_getversion also fails.
> +core_hotunplug.*


