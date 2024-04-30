Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380EBC10F16
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 14:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ExNhW5O4hj84oEqnhv79372aA3j6EnOiERIUc0bq2BY=; b=gS16t7DHORJ+OzsguVLw/Vtd2P
	ESCT9zcsObhVLpOtIBfMd5fqhgzqeVgYLOi7EUgqojHeJU19281rlXIOYl4FTtPEKgEQ96809XUM8
	2XaMdOrbGtY8wZtW5qOqluID/NuzhQhR1mFOfbE/nWlojKQ/mErvLCYc4UVr6hkADevxm6KvLTofM
	znU1s4Rq9zjAtqB2pMBkakWe6seSLDJMyu6zcTzUpukv4FMYL7zuSar+z17mLAELOiMLp3LdjSQi8
	jHZt7HUTlBITpLW+siwY6En4EggOuGHojN8PubE6WT7L1sGiE5fDZUqUa8fTw1RZPSYqgQpL0e6AC
	ys6aMvVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1oWK-00000006pzd-1vO8;
	Tue, 30 Apr 2024 14:31:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1oW4-00000006pq9-1VSp;
	Tue, 30 Apr 2024 14:31:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ExNhW5O4hj84oEqnhv79372aA3j6EnOiERIUc0bq2BY=; b=YKg1fLNX9Crs3ruQR4DbL/YhFT
	LdXZTgqbFPVm2TkJfTYeCpn6rdv7x39M5v02LUkFkHmyPUdakezkN4TZVTgyTCs59P0xxR+rPfKD4
	xxuupShcwUWYTpY9a8Sxz1jw7BDQEb+q4jwH2+rtroyZfPaRn18o2aGsjVSw8dyRpe0ugqzXA5UKg
	uBKMHQ84dq97jkVq1qJkSjcgaQiF8mSdhkUMWkwMNH+3UnKFNvR1wAbK5ZZKX91kU+wlH/hP+sbkW
	tvdKnWHCb7IM+fWcT9n6VUfTeneVPrsq1t6zjY8wbSTyRUunniOizyG0eKRt+ChociW/UYZGrH/ac
	IBwzHG8Q==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1oVy-0000000GyyQ-3syK;
	Tue, 30 Apr 2024 14:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714487483;
	bh=08lyesCEKaOnB28Fw3u34HvaM0G+lf8uBMq021leP4Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ELnbSRWDFqn73oBgEYJ+2HofrbwUEL9fiAUKRFjRAhKTmp3jClMgXjfJwIdeXB18v
	 6jGMkYTgqmRdFNQeGIT1Kb9snc5sFNOIKqP8LRBMFbmnMUNPCJZb8oC3zdq+QEYYE0
	 oycM7kEzyi90lVMaa7xAoloKsGH42Yj5WSHTYNpDJj073sqN0bumZx8wJGwjooWAo7
	 3opI+K5o0ADfK1nx3H8c2MU/fz39cqLsOXK3c6swPE5KFGxQtj0I0yclS7DK3r6ZtM
	 BF+cv+R7BDQzjOM4Z1R0xLV0JZIN48A48JxAcp8DJlyUp3NlHSps7YfWzym7K1Gpcz
	 9HQVphiC870/A==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7720437820AB;
	Tue, 30 Apr 2024 14:31:17 +0000 (UTC)
Message-ID: <90a0b4ba-52e3-446e-8de1-ca67e0c71a53@collabora.com>
Date: Tue, 30 Apr 2024 11:31:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] drm/ci: build virtual GPU driver as module
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dmitry.baryshkov@linaro.org, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20240430091121.508099-1-vignesh.raman@collabora.com>
 <20240430091121.508099-4-vignesh.raman@collabora.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240430091121.508099-4-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_153127_273808_BD84A216 
X-CRM114-Status: GOOD (  13.87  )
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



On 30/04/2024 06:11, Vignesh Raman wrote:
> With latest IGT, the tests tries to load the module and it
> fails. So build the virtual GPU driver for virtio as module.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>   drivers/gpu/drm/ci/build.sh       | 1 -
>   drivers/gpu/drm/ci/igt_runner.sh  | 6 +++---
>   drivers/gpu/drm/ci/image-tags.yml | 4 ++--
>   drivers/gpu/drm/ci/test.yml       | 1 +
>   drivers/gpu/drm/ci/x86_64.config  | 2 +-
>   5 files changed, 7 insertions(+), 7 deletions(-)
> 
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
> diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
> index 20026612a9bd..55532f79fbdc 100755
> --- a/drivers/gpu/drm/ci/igt_runner.sh
> +++ b/drivers/gpu/drm/ci/igt_runner.sh
> @@ -30,10 +30,10 @@ case "$DRIVER_NAME" in
>               export IGT_FORCE_DRIVER="panfrost"
>           fi
>           ;;
> -    amdgpu)
> +    amdgpu|virtio_gpu)
>           # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
> -        mv /install/modules/lib/modules/* /lib/modules/.
> -        modprobe amdgpu
> +        mv /install/modules/lib/modules/* /lib/modules/. || true
> +        modprobe --first-time $DRIVER_NAME
>           ;;
>   esac
>   
> diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
> index d8f72b82c938..fd1cb6061166 100644
> --- a/drivers/gpu/drm/ci/image-tags.yml
> +++ b/drivers/gpu/drm/ci/image-tags.yml
> @@ -4,9 +4,9 @@ variables:
>      DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
>   
>      DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
> -   DEBIAN_BUILD_TAG: "2023-10-08-config"
> +   DEBIAN_BUILD_TAG: "2024-04-22-virtio"
>   
> -   KERNEL_ROOTFS_TAG: "2023-10-06-amd"
> +   KERNEL_ROOTFS_TAG: "2024-04-22-virtio"
>      PKG_REPO_REV: "3cc12a2a"
>   
>      DEBIAN_X86_64_TEST_BASE_IMAGE: "debian/x86_64_test-base"
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 612c9ede3507..864ac3809d84 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -350,6 +350,7 @@ virtio_gpu:none:
>     script:
>       - ln -sf $CI_PROJECT_DIR/install /install
>       - mv install/bzImage /lava-files/bzImage
> +    - mkdir -p /lib/modules
>       - mkdir -p $CI_PROJECT_DIR/results
>       - ln -sf $CI_PROJECT_DIR/results /results
>       - install/crosvm-runner.sh install/igt_runner.sh
> diff --git a/drivers/gpu/drm/ci/x86_64.config b/drivers/gpu/drm/ci/x86_64.config
> index 1cbd49a5b23a..78479f063e8e 100644
> --- a/drivers/gpu/drm/ci/x86_64.config
> +++ b/drivers/gpu/drm/ci/x86_64.config
> @@ -91,7 +91,7 @@ CONFIG_KVM=y
>   CONFIG_KVM_GUEST=y
>   CONFIG_VIRT_DRIVERS=y
>   CONFIG_VIRTIO_FS=y
> -CONFIG_DRM_VIRTIO_GPU=y
> +CONFIG_DRM_VIRTIO_GPU=m
>   CONFIG_SERIAL_8250_CONSOLE=y
>   CONFIG_VIRTIO_NET=y
>   CONFIG_VIRTIO_CONSOLE=y

