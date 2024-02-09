Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E013C48297
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Feb 2024 18:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqiVy6PaAmz85KvbwryicMfGqdNPPlfw0wi4OihbUso=; b=ALNYqFtOiOjayCreHzHAXGjn1n
	Vq9za0jOcYcdC2dLTI394YbCT/Zyyd45QtTsHXgoK3xUEHtqTvRgFrKKIaV1t1KTnV9w6C4T+IfZT
	tjQQc1BdRfxbYd85m6y4DV4OzDc/p8zY8mVPjJDFphb/1wqy1LNMyecQF+ZvY1e8d7ynw4n+vqhT3
	lZJ1Ky0TWa9iXJ6/4k+ZG6oFH/QJMRX4/7HR6Sucy07wL3O3JBQdR3ns9TOeyOQ92ZMf9SXq0pjxF
	lYSyFtSreOh/hRuFrOeJNgdxCWMQXrM69kNFjl4WAXcDaQj9tN4Q6b8ve/prLp/V8d/gy8HtHANO2
	Nht6WShQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYVV6-00000000EZd-3U7Z;
	Fri, 09 Feb 2024 18:21:24 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYVV3-00000000EYp-3A7G;
	Fri, 09 Feb 2024 18:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707502879;
	bh=RQN5MGS4XVAPPYsi2lPds5+UF19v4GYqJkH9OE+mD8Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=yN5P6XulrJ8rd7UyuudshM4fbGOop4nsXhLLyuhoWiAv4LM9b6i7DBiE7Jd5iwOCg
	 CLbdPLn9KprIhuKJFxgFKvU0FwJBJqEBmhT5zRc4bHBrDOWdVJoTrh9zCdwidaoyz9
	 3AKbWH6pNaCmrFgANcpPXd8UjdyzR/NzYzafsKF8dOYQoP9XXgSkkFSa40+zUekglO
	 HnN3NJkT/lC0QKFNaJq9343+dnaAtDTj/x4nwZzJAKIW0r/yv6ihtGlQ4CQl+Ebr1r
	 O8ORljO8oyv360G94tPkyEKL1qJILNjzJ5yTlBrOnKP1jTCSjZX8Y3aIKYSHzRjBY7
	 mpiZjBNiHga3g==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8BBF33780F7F;
	Fri,  9 Feb 2024 18:21:14 +0000 (UTC)
Message-ID: <61575073-ce37-4027-8f95-f05290cc10c4@collabora.com>
Date: Fri, 9 Feb 2024 15:21:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] drm/ci: mediatek: Add job to test panfrost and
 powervr GPU driver
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniel@fooishbar.org, airlied@gmail.com, daniel@ffwll.ch,
 david.heidelberg@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, robdclark@gmail.com,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240130150340.687871-1-vignesh.raman@collabora.com>
 <20240130150340.687871-4-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240130150340.687871-4-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_102121_961064_0891B6EB 
X-CRM114-Status: GOOD (  25.49  )
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



On 30/01/2024 12:03, Vignesh Raman wrote:
> For mediatek mt8173, the GPU driver is powervr and for mediatek
> mt8183, the GPU driver is panfrost. So add support in drm-ci to
> test panfrost and powervr GPU driver for mediatek SOCs and update
> xfails. Powervr driver was merged in linux kernel, but there's no
> mediatek support yet. So disable the mt8173-gpu job which uses
> powervr driver.
> 
> Add panfrost specific tests to testlist and skip KMS tests for
> panfrost driver since it is not a not a KMS driver. Also update
> the MAINTAINERS file to include xfails for panfrost driver.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Hi Vignesh, thanks for your work.

I'm still wondering about a few things, please check below.

> ---
> 
> v2:
>    - Add panfrost and PVR GPU jobs for mediatek SOC with new xfails, add xfail
>      entry to MAINTAINERS.

Maybe we should review how the xfails failes are named. I think they 
should start with the DRIVER_NAME instead of GPU_VERSION.

For instance, consider the following job:

mediatek:mt8183-gpu:
   extends:
     - .mt8183
   variables:
     GPU_VERSION: mediatek-mt8183-gpu
     DRIVER_NAME: panfrost

And we have mediatek-mt8183-gpu-skips.txt

If there is an error, we want to notify the panfrost driver maintainers 
(and maybe not the mediatek driver maintainers), so MAINTAINERS file 
doesn't correspond to this.

How about a naming <driver name>_<hardware/gpu>_<type: gpu/display> ?

powervr_mediatek-mt8173_gpu-skipts.txt
mediatek_mediatek-mt8173_display-skipts.txt
panfrost_mediatek-mt8183_gpu-skips.txt
mediatek_mediatek-mt8183_display-skips.txt
...

What do you think?

Thanks
Helen



> 
> v3:
>    - Add panfrost specific tests to testlist and skip KMS tests for
>      panfrost driver since it is not a not a KMS driver and update xfails.
>      Update the MAINTAINERS file to include xfails for panfrost driver.
>      Add the job name in GPU_VERSION and use it for xfail file names instead
>      of using DRIVER_NAME.
> 
> ---
>   MAINTAINERS                                    |  1 +
>   drivers/gpu/drm/ci/test.yml                    | 18 ++++++++++++++++++
>   drivers/gpu/drm/ci/testlist.txt                | 16 ++++++++++++++++
>   .../ci/xfails/mediatek-mt8183-gpu-skips.txt    |  2 ++
>   4 files changed, 37 insertions(+)
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-gpu-skips.txt
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9d959a6881f7..bcdc17d1aa26 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1645,6 +1645,7 @@ L:	dri-devel@lists.freedesktop.org
>   S:	Supported
>   T:	git git://anongit.freedesktop.org/drm/drm-misc
>   F:	Documentation/gpu/panfrost.rst
> +F:	drivers/gpu/drm/ci/xfails/panfrost*
>   F:	drivers/gpu/drm/panfrost/
>   F:	include/uapi/drm/panfrost_drm.h
>   
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 0cd44e6ea18b..e153c5a7ad80 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -299,6 +299,17 @@ amdgpu:stoney:
>       DEVICE_TYPE: mt8183-kukui-jacuzzi-juniper-sku16
>       RUNNER_TAG: mesa-ci-x86-64-lava-mt8183-kukui-jacuzzi-juniper-sku16
>   
> +mediatek:mt8173-gpu:
> +  extends:
> +    - .mt8173
> +  variables:
> +    GPU_VERSION: mediatek-mt8173-gpu
> +    DRIVER_NAME: powervr
> +  rules:
> +    # TODO: powervr driver was merged in linux kernel, but there's no mediatek support yet
> +    # Remove the rule once mediatek support is added for powervr
> +    - when: never
> +
>   mediatek:mt8173-display:
>     extends:
>       - .mt8173
> @@ -306,6 +317,13 @@ mediatek:mt8173-display:
>       GPU_VERSION: mediatek-mt8173-display
>       DRIVER_NAME: mediatek
>   
> +mediatek:mt8183-gpu:
> +  extends:
> +    - .mt8183
> +  variables:
> +    GPU_VERSION: mediatek-mt8183-gpu
> +    DRIVER_NAME: panfrost
> +
>   mediatek:mt8183-display:
>     extends:
>       - .mt8183
> diff --git a/drivers/gpu/drm/ci/testlist.txt b/drivers/gpu/drm/ci/testlist.txt
> index eaeb751bb0ad..772fc025b1f8 100644
> --- a/drivers/gpu/drm/ci/testlist.txt
> +++ b/drivers/gpu/drm/ci/testlist.txt
> @@ -2959,3 +2959,19 @@ msm_submit@invalid-duplicate-bo-submit
>   msm_submit@invalid-cmd-idx-submit
>   msm_submit@invalid-cmd-type-submit
>   msm_submit@valid-submit
> +panfrost_get_param@base-params
> +panfrost_get_param@get-bad-param
> +panfrost_get_param@get-bad-padding
> +panfrost_gem_new@gem-new-4096
> +panfrost_gem_new@gem-new-0
> +panfrost_gem_new@gem-new-zeroed
> +panfrost_prime@gem-prime-import
> +panfrost_submit@pan-submit
> +panfrost_submit@pan-submit-error-no-jc
> +panfrost_submit@pan-submit-error-bad-in-syncs
> +panfrost_submit@pan-submit-error-bad-bo-handles
> +panfrost_submit@pan-submit-error-bad-requirements
> +panfrost_submit@pan-submit-error-bad-out-sync
> +panfrost_submit@pan-reset
> +panfrost_submit@pan-submit-and-close
> +panfrost_submit@pan-unhandled-pagefault
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-gpu-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-gpu-skips.txt
> new file mode 100644
> index 000000000000..2ea09d1648bc
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-gpu-skips.txt
> @@ -0,0 +1,2 @@
> +# Panfrost is not a KMS driver, so skip the KMS tests
> +kms_.*

