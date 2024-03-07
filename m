Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EB9C48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 14:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mm31RAfaslCFuy6Tldysr+4L4tpTUdIfQoeppyfHf3g=; b=FuWLaujw6MEqhHx9mUcirz+k+A
	0Wjwm1MrnPNBf9P2eUtQ4ifUFP+uAwtWqWJBDa1OJFSLxir6jDRQBzBp+vbgLZSQdD4Y8GYc8G9tj
	fs0b8XX1o8N6+OwNJ6JcgJqiX81HSRwAxNVo/NZxVxcRMhpqGJL59gtI8gb7rxjffJDM6VN7PFoYv
	Dt7e8MWEDZsiGqnNmuYWiIYwr8VIadtMCGQRHwGuYDYdTQMnWKIbP+OnTjxO6Y38IjQAKFsxVZwCL
	IPCIDqCEpw47uNeQmjj/XCT1Ztgz+H/lolC3jW1O/ZTnOqiR8QXgOqrkqZGu5Zuf4Xg6nrSUSpUSo
	o/AmXwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riEKi-00000004v3U-2Xj3;
	Thu, 07 Mar 2024 14:02:52 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riEKZ-00000004uuP-1QYW;
	Thu, 07 Mar 2024 14:02:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709820161;
	bh=el7Xx44TkO/oXmS7mAYy5b9cHRg71LxMpmK1H3GipkM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LgINMicX/QDKggUxWPkJvRxWF13oZJKjSsojQ11dzqmJXn8xvc3PfRb/LAEueBomL
	 bOLcDaOCNMELJxW67wfidD1O+CuIRcm5FdMu3XUMUg9LT7VpRgZsMrYqsg7my6TJR2
	 drptsKePCY742KS0WK29YgJjGbI8SbhyVNS496McXt3GRx2EYxKXWFTzvy3camtYu0
	 k20ysDUaz0kl0cx6CeLcEC3wFtAbOFXVDu1MGXZMe6sdvctnbdL3/BN8s5GhGQ5OBY
	 KSqg4jAoV8n+5+2mAi53pqkPbTxEoU9WGBPW9Rlhk6gYjhv2GwVTzEWqRTnTyNkRwQ
	 jenrk05jpsWFA==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1226937820DA;
	Thu,  7 Mar 2024 14:02:35 +0000 (UTC)
Message-ID: <f6c1ced6-7f33-455d-9e7a-f26608241372@collabora.com>
Date: Thu, 7 Mar 2024 11:02:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] drm/ci: meson: Refactor existing meson jobs
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
References: <20240306030649.60269-1-vignesh.raman@collabora.com>
 <20240306030649.60269-8-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240306030649.60269-8-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_060243_617063_94C59F8F 
X-CRM114-Status: GOOD (  15.69  )
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



On 06/03/2024 00:06, Vignesh Raman wrote:
> For Amlogic Meson SOC the display driver is meson. Currently,
> in drm-ci for meson, only the display driver is tested.
> Refactor the existing meson jobs so that gpu driver testing
> jobs can be added later and update xfails accordingly.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>    - Refactor the patch to rename job to indicate display driver testing,
>      rename the existing xfail files.
> 
> v3:
>    - Add the job name in GPU_VERSION and use it for xfail file names instead
>      of using DRIVER_NAME.
> 
> v4:
>    - Remove the display suffix in job and rename xfails accordingly.
>      Remove the change adding job name in GPU_VERSION.
> 
> ---
>   drivers/gpu/drm/ci/test.yml                    | 11 ++++++++---
>   drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt |  5 -----
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 99fd101ce2fe..951a44bf9d19 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -351,20 +351,25 @@ panfrost:mt8183:
>       - .lava-igt:arm64
>     stage: meson
>     variables:
> -    DRIVER_NAME: meson
>       DTB: ${DEVICE_TYPE}
>       BOOT_METHOD: u-boot
>       KERNEL_IMAGE_TYPE: "image"
>   
> -meson:g12b:
> +.g12b:
>     extends:
>       - .meson
>     parallel: 3
>     variables:
>       DEVICE_TYPE: meson-g12b-a311d-khadas-vim3
> -    GPU_VERSION: g12b

Looks like it make sense to keep GPU_VERSION here, no?

Regards,
Helen

>       RUNNER_TAG: mesa-ci-x86-64-lava-meson-g12b-a311d-khadas-vim3
>   
> +meson:g12b:
> +  extends:
> +    - .g12b
> +  variables:
> +    GPU_VERSION: g12b
> +    DRIVER_NAME: meson
> +
>   virtio_gpu:none:
>     stage: virtio-gpu
>     variables:
> diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
> index 56a2ae7047b4..029b4ade21f6 100644
> --- a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
> @@ -5,11 +5,6 @@ kms_cursor_legacy@single-bo,Fail
>   kms_cursor_legacy@single-move,Fail
>   kms_cursor_legacy@torture-bo,Fail
>   kms_cursor_legacy@torture-move,Fail
> -kms_force_connector_basic@force-edid,Fail
> -kms_hdmi_inject@inject-4k,Fail
> -kms_plane_cursor@overlay,Fail
> -kms_plane_cursor@primary,Fail
> -kms_plane_cursor@viewport,Fail
>   kms_properties@connector-properties-atomic,Fail
>   kms_properties@connector-properties-legacy,Fail
>   kms_properties@get_properties-sanity-atomic,Fail

