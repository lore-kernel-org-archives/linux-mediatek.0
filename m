Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D84CD128A
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Apr 2024 16:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9deoxj/0pSHDAisvALViOxvwVNJRhnNUaDbubhDog2M=; b=qincCFdIH4bQuEkYYpx6IrIJRc
	pnG0djr8NgPx+aB1XwxFtyuQOrmfkmQlrkFqbXS1ZYZzsoE1rHLphOsI9/94odQb6sgCXjdnKl3q1
	UgxTFsROxAun3SAjcLfyvJnbaJR/dyJ6mK6AfwjzIN47WOwe4HXJOlc3D2km7GSmPjay0y7nkwkOZ
	GoKC0G5Hhvxj5IIjXUDoGXxzCTKTn41m8BTY2NZ+u2mOwCp2xuNktfN2ERoXJP8lohO01V7bFTuJa
	9gsGiU/jYVcjQd/WuOFMecZd9tDmpynKQh3bnWQCE4fjrGu2bEGkU/a0hxY0UQLaPiUxX6KGnRWmO
	fXVN5X0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrKmo-00000008N2x-47ZU;
	Mon, 01 Apr 2024 16:45:30 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrKmg-00000008N0Y-3BQ2;
	Mon, 01 Apr 2024 16:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711989921;
	bh=heEWpXD2d4ioamqcjV7dMigkm+Pyz3fXsZggrGudDyE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QVRDSDu+fZDRGSOFV/02926geo1si6E/74JtfFQW9eSIOfoJArC2cES1tlfKeDbZj
	 vXDBVxpI4XT9PuB8jrO+QRHdHDjrZmDgkxeb6H/sQhsxPgv9+vXzbVTHc/WQjrPvBA
	 iEhtiuudDsmdI4BUC5nkox0KAxtbs4S3g/x3UXKB2p3bbQGlNi7P4DeUIecefD5nAc
	 XXL1OxSB2/E5xVolY00Ig+M+PcxfeYI0Ky3UxAOaWOEP/v12i6kDsaIiSzdCvzmfKX
	 awmZbcL40ZHgWf6htwI6K5aESAwMRRzuecz6Y9ZgLGJ22kR61XIkBQaS2I78zFSVWA
	 1boJe2piEwImw==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D1A803781144;
	Mon,  1 Apr 2024 16:45:15 +0000 (UTC)
Message-ID: <c05bbde7-7119-4fff-9b62-a7a585259143@collabora.com>
Date: Mon, 1 Apr 2024 13:45:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] drm/ci: add tests on vkms
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 emma@anholt.net, robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, mairacanal@riseup.net, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240401061235.192713-1-vignesh.raman@collabora.com>
 <20240401061235.192713-11-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240401061235.192713-11-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_094526_256100_1E491A8A 
X-CRM114-Status: GOOD (  21.72  )
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



On 01/04/2024 03:12, Vignesh Raman wrote:
> Add job that runs igt on top of vkms.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
> 
> v4:
>    - New patch in the series.
>      https://lore.kernel.org/lkml/20240201065346.801038-1-vignesh.raman@collabora.com/
> 
> v5:
>    - No changes.
> 
> ---
>   MAINTAINERS                                   |  2 ++
>   drivers/gpu/drm/ci/build.sh                   |  1 -
>   drivers/gpu/drm/ci/gitlab-ci.yml              |  3 +-
>   drivers/gpu/drm/ci/igt_runner.sh              |  6 ++--
>   drivers/gpu/drm/ci/image-tags.yml             |  2 +-
>   drivers/gpu/drm/ci/test.yml                   | 24 +++++++++++++-
>   drivers/gpu/drm/ci/x86_64.config              |  1 +
>   .../drm/ci/xfails/virtio_gpu-none-fails.txt   |  1 -
>   drivers/gpu/drm/ci/xfails/vkms-none-fails.txt | 33 +++++++++++++++++++
>   .../gpu/drm/ci/xfails/vkms-none-flakes.txt    | 20 +++++++++++
>   drivers/gpu/drm/ci/xfails/vkms-none-skips.txt | 23 +++++++++++++
>   11 files changed, 108 insertions(+), 8 deletions(-)
>   create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 333704ceefb6..c78c825508ce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6962,6 +6962,8 @@ L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	Documentation/gpu/vkms.rst
> +F:	drivers/gpu/drm/ci/testlist.txt
> +F:	drivers/gpu/drm/ci/xfails/vkms*
>   F:	drivers/gpu/drm/vkms/
>   
>   DRM DRIVER FOR VIRTUALBOX VIRTUAL GPU
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index 8a3baa003904..95493df9cdc2 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -156,7 +156,6 @@ fi
>   
>   mkdir -p artifacts/install/lib
>   mv install/* artifacts/install/.
> -rm -rf artifacts/install/modules
>   ln -s common artifacts/install/ci-common
>   cp .config artifacts/${CI_JOB_NAME}_config
>   
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 5b5d4a324659..df762d03533f 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -114,6 +114,7 @@ stages:
>     - panfrost
>     - powervr
>     - virtio-gpu
> +  - software-driver
>   
>   # YAML anchors for rule conditions
>   # --------------------------------
> @@ -269,4 +270,4 @@ sanity:
>   
>   # Jobs that need to pass before spending hardware resources on further testing
>   .required-for-hardware-jobs:
> -  needs: []
> \ No newline at end of file
> +  needs: []
> diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
> index ce6e22369d4d..c89acb974645 100755
> --- a/drivers/gpu/drm/ci/igt_runner.sh
> +++ b/drivers/gpu/drm/ci/igt_runner.sh
> @@ -20,10 +20,10 @@ cat /sys/kernel/debug/dri/*/state
>   set -e
>   
>   case "$DRIVER_NAME" in
> -    amdgpu)
> +    amdgpu|vkms)
>           # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
> -        mv /install/modules/lib/modules/* /lib/modules/.
> -        modprobe amdgpu
> +        mv /install/modules/lib/modules/* /lib/modules/. || true
> +        modprobe --first-time $DRIVER_NAME
>           ;;
>   esac
>   
> diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
> index cf07c3e09b8c..bf861ab8b9c2 100644
> --- a/drivers/gpu/drm/ci/image-tags.yml
> +++ b/drivers/gpu/drm/ci/image-tags.yml
> @@ -4,7 +4,7 @@ variables:
>      DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
>   
>      DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
> -   DEBIAN_BUILD_TAG: "2023-10-08-config"
> +   DEBIAN_BUILD_TAG: "2024-01-29-vkms"
>   
>      KERNEL_ROOTFS_TAG: "2023-10-06-amd"
>      PKG_REPO_REV: "67f2c46b"
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 8c90ae5a51e6..8fed797a26b9 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -411,7 +411,7 @@ panfrost:g12b:
>       - .panfrost-gpu
>   
>   virtio_gpu:none:
> -  stage: virtio-gpu
> +  stage: software-driver
>     variables:
>       CROSVM_GALLIUM_DRIVER: llvmpipe
>       DRIVER_NAME: virtio_gpu
> @@ -431,3 +431,25 @@ virtio_gpu:none:
>       - debian/x86_64_test-gl
>       - testing:x86_64
>       - igt:x86_64
> +
> +vkms:none:
> +  stage: software-driver
> +  variables:
> +    DRIVER_NAME: vkms
> +    GPU_VERSION: none
> +  extends:
> +    - .test-gl
> +    - .test-rules
> +  tags:
> +    - kvm
> +  script:
> +    - ln -sf $CI_PROJECT_DIR/install /install
> +    - mv install/bzImage /lava-files/bzImage
> +    - mkdir -p /lib/modules
> +    - mkdir -p $CI_PROJECT_DIR/results
> +    - ln -sf $CI_PROJECT_DIR/results /results
> +    - ./install/crosvm-runner.sh ./install/igt_runner.sh
> +  needs:
> +    - debian/x86_64_test-gl
> +    - testing:x86_64
> +    - igt:x86_64
> diff --git a/drivers/gpu/drm/ci/x86_64.config b/drivers/gpu/drm/ci/x86_64.config
> index 1cbd49a5b23a..8eaba388b141 100644
> --- a/drivers/gpu/drm/ci/x86_64.config
> +++ b/drivers/gpu/drm/ci/x86_64.config
> @@ -24,6 +24,7 @@ CONFIG_DRM=y
>   CONFIG_DRM_PANEL_SIMPLE=y
>   CONFIG_PWM_CROS_EC=y
>   CONFIG_BACKLIGHT_PWM=y
> +CONFIG_DRM_VKMS=m
>   
>   # Strip out some stuff we don't need for graphics testing, to reduce
>   # the build.
> diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
> index 007f21e56d89..f82d437909b5 100644
> --- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
> @@ -41,7 +41,6 @@ kms_flip@flip-vs-absolute-wf_vblank,Fail
>   kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
>   kms_flip@flip-vs-blocking-wf-vblank,Fail
>   kms_flip@flip-vs-expired-vblank,Fail
> -kms_flip@flip-vs-expired-vblank-interruptible,Fail
>   kms_flip@flip-vs-modeset-vs-hang,Fail
>   kms_flip@flip-vs-panning-vs-hang,Fail
>   kms_flip@flip-vs-wf_vblank-interruptible,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
> new file mode 100644
> index 000000000000..ef6101d2c356
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
> @@ -0,0 +1,33 @@
> +kms_cursor_crc@cursor-rapid-movement-128x128,Fail
> +kms_cursor_crc@cursor-rapid-movement-128x42,Fail
> +kms_cursor_crc@cursor-rapid-movement-256x256,Fail
> +kms_cursor_crc@cursor-rapid-movement-256x85,Fail
> +kms_cursor_crc@cursor-rapid-movement-32x10,Fail
> +kms_cursor_crc@cursor-rapid-movement-32x32,Fail
> +kms_cursor_crc@cursor-rapid-movement-512x170,Fail
> +kms_cursor_crc@cursor-rapid-movement-512x512,Fail
> +kms_cursor_crc@cursor-rapid-movement-64x21,Fail
> +kms_cursor_crc@cursor-rapid-movement-64x64,Fail
> +kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
> +kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
> +kms_cursor_legacy@cursor-vs-flip-atomic,Fail
> +kms_cursor_legacy@cursor-vs-flip-legacy,Fail
> +kms_cursor_legacy@cursor-vs-flip-toggle,Fail
> +kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
> +kms_cursor_legacy@flip-vs-cursor-atomic,Fail
> +kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
> +kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
> +kms_cursor_legacy@flip-vs-cursor-legacy,Fail
> +kms_flip@flip-vs-modeset-vs-hang,Fail
> +kms_flip@flip-vs-panning-vs-hang,Fail
> +kms_pipe_crc_basic@nonblocking-crc,Fail
> +kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Fail
> +kms_pipe_crc_basic@suspend-read-crc,Fail
> +kms_plane@plane-panning-bottom-right-suspend,Fail
> +kms_universal_plane@universal-plane-pipe-A-sanity,Fail
> +kms_universal_plane@universal-plane-sanity,Fail
> +kms_vblank@pipe-A-ts-continuation-dpms-suspend,Fail
> +kms_writeback@writeback-check-output,Fail
> +kms_writeback@writeback-fb-id,Fail
> +kms_writeback@writeback-invalid-parameters,Fail
> +kms_writeback@writeback-pixel-formats,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt b/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
> new file mode 100644
> index 000000000000..7b52dab45457
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
> @@ -0,0 +1,20 @@
> +# Board Name: vkms
> +# Bug Report: https://lore.kernel.org/dri-devel/005da8f1-8050-bffd-653c-2a87ae6376f7@collabora.com/T/#u
> +# IGT Version: 1.28-gb0cc8160e
> +# Linux Version: 6.7.0-rc3
> +# Failure Rate: 50
> +
> +# Reported by deqp-runner
> +kms_cursor_legacy@cursorA-vs-flipA-legacy
> +kms_cursor_legacy@cursorA-vs-flipA-varying-size
> +kms_flip@flip-vs-expired-vblank-interruptible
> +kms_flip@flip-vs-expired-vblank
> +kms_flip@plain-flip-fb-recreate
> +kms_flip@plain-flip-fb-recreate-interruptible
> +kms_flip@plain-flip-ts-check-interruptible
> +
> +# The below test shows inconsistency across multiple runs,
> +# giving results of Pass and Fail alternately.
> +kms_cursor_legacy@cursorA-vs-flipA-toggle
> +kms_pipe_crc_basic@nonblocking-crc
> +kms_flip@plain-flip-ts-check
> diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
> new file mode 100644
> index 000000000000..723de920dc37
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
> @@ -0,0 +1,23 @@
> +# Hits:
> +# rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> +# rcu: 	Tasks blocked on level-0 rcu_node (CPUs 0-1): P749/1:b..l
> +kms_prop_blob@invalid-get-prop
> +
> +# keeps printing vkms_vblank_simulate: vblank timer overrun and never ends
> +kms_invalid_mode@int-max-clock
> +
> +# Suspend seems to be broken
> +.*suspend.*
> +
> +# Hangs machine and timeout occurs
> +kms_flip@flip-vs-absolute-wf_vblank-interruptible
> +kms_invalid_mode@zero-hdisplay
> +kms_invalid_mode@bad-vtotal
> +kms_cursor_crc.*
> +
> +# Skip hw specific tests
> +msm_.*
> +amdgpu/amd_.*
> +panfrost_.*
> +v3d_.*
> +vc4_.*

