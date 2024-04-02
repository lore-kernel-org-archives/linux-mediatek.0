Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D427CCD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 06:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shqlq6Lh2nkw8jKgccn+0z6P0PK3jsGq44ex/4Q7xCU=; b=n3mCegilVveOJXXWsQBZpgCFeH
	ultcMywdXcd7M8/AojLPCpeqxQPyqI6D1bSqPbPrgEkibvzlgCxRVKnJOcKYd2yOz/Ww79kLeUapA
	lTVgFAPGHCrGPxiDNoOaWQRPLTEHL2F7q6pvkXIDCenUBYliFAGTCCnI7Hwwh5SiY05EdLQFj86M7
	w3RtRcg7W43PmyZbGT+OILNYLKAH+74ysVEtDARsPNtZXemvc7hk9rSCs0Z36CVkWnU/Dxs7I4gsm
	rFmUg5NTijULxMMfUamjLUC2jm2DtDfHIhZid1iC1CwiIslD3jSKMnryeNBr35AlakncDjQnReMsQ
	sWz51hDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrXrE-00000009wkq-15k1;
	Tue, 02 Apr 2024 06:42:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrXrB-00000009wjs-1jIK;
	Tue, 02 Apr 2024 06:42:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=shqlq6Lh2nkw8jKgccn+0z6P0PK3jsGq44ex/4Q7xCU=; b=sqxUQ3Hqkw5AgTa5z7vPbujIGx
	wqPpXpUunm11i1sC/vHjxx9uyUqrVHJnBm87PetU4Sf3kys1t1onSi61yPXRKchGk4m6j5DeMUvmw
	buR1MhO9QWRvRpz4jZA/+eprNomX/kX0OQo+QqXgxeYj6JJcUWzwUBdA1O6VHRSHa2kpeljHQqYRP
	9iCliDTWCEm03Ih4+k45AGNc0Jnsi8TesJZTETw4TuRuDju7OUzMcDNnMlKgUQm6oVag/dmCJiCoq
	bVt6ipUtzHWBpXtWfs/E56JsyH9Qa5c36CyeE+kWQbKvZQedEDhUCZCyo2S2Eb/Zx2wROV/DiaHmQ
	gDVaeCsg==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrXr8-00000002PsA-14rQ;
	Tue, 02 Apr 2024 06:42:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712040097;
	bh=AO1wb3IPItsDNPEq19anOATTeoinz91gegsrR8G/DZQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BEz/Sn+gJH0e3+yjB8hfuV65ypefkpNQEKxq6ZrLtN8USdVd75zSAGvb2Xh7HMPBa
	 BWMLWW5HFzzhZWfT9kB9yQsrr7J2Yx42QbGRducn7izXEcbbD8gIV5JZJAkHBKaES1
	 etoAPv41GSUbn/zUn+gOfCa8izU022FeaQtsVrLyTI+x15pqoSrlyjIG43MhfxvscE
	 6NM3ihfHmO8sPyLBrrcZctNyt0p0jVo81RK7Y361RooJn9+2FCUdeRHUbAcMhNvaZd
	 Q5k5aRRr5YbdiO2+eV9yOI5ezoGxrPioGB2VhzNNOxgpWrS6ZZ/XHRgkxiM/z772TB
	 CmsmPVD1UjV7g==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5282B37803EE;
	Tue,  2 Apr 2024 06:41:32 +0000 (UTC)
Message-ID: <ce5058c2-9e06-47a8-ba99-5686a64acd81@collabora.com>
Date: Tue, 2 Apr 2024 12:11:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] drm/ci: mediatek: Refactor existing mediatek
 jobs
Content-Language: en-US
To: Helen Koike <helen.koike@collabora.com>, dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 emma@anholt.net, robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, mairacanal@riseup.net, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240401061235.192713-1-vignesh.raman@collabora.com>
 <20240401061235.192713-5-vignesh.raman@collabora.com>
 <f4b6cb98-0146-4f9c-a1ed-3324da01ca16@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <f4b6cb98-0146-4f9c-a1ed-3324da01ca16@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_074250_344021_A3518B00 
X-CRM114-Status: GOOD (  16.79  )
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

On 01/04/24 22:12, Helen Koike wrote:
> 
> 
> On 01/04/2024 03:12, Vignesh Raman wrote:
>> For mediatek mt8173 and mt8183, the display driver is mediatek.
>> Currently, in drm-ci for mediatek, only the display driver is
>> tested. Refactor the existing mediatek jobs so that gpu driver
>> testing jobs can be added later and update xfails accordingly.
>> Since the correct driver name is passed from the job to test gpu
>> and display driver, remove the check to set IGT_FORCE_DRIVER
>> based on driver name.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Refactor the patch to rename job to indicate display driver testing,
>>      rename the existing xfail files, and remove IGT_FORCE_DRIVER from 
>> the
>>      script since it's now set by the job.
>>
>> v3:
>>    - Add the job name in GPU_VERSION and use it for xfail file names 
>> instead
>>      of using DRIVER_NAME. Also update xfails.
>>
>> v4:
>>    - Remove the display suffix in job and rename xfails accordingly.
>>      Remove the change adding job name in GPU_VERSION.
>>
>> v5:
>>    - Add mediatek-display job.
>>
>> ---
>>   drivers/gpu/drm/ci/igt_runner.sh              | 10 ---------
>>   drivers/gpu/drm/ci/test.yml                   | 21 +++++++++++++++----
>>   .../drm/ci/xfails/mediatek-mt8173-fails.txt   | 15 -------------
>>   .../drm/ci/xfails/mediatek-mt8173-flakes.txt  | 13 ++++++++++++
>>   .../drm/ci/xfails/mediatek-mt8183-fails.txt   | 21 ++++++++++++-------
>>   .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |  8 +++++++
>>   6 files changed, 51 insertions(+), 37 deletions(-)
>>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
>>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
>>
>> diff --git a/drivers/gpu/drm/ci/igt_runner.sh 
>> b/drivers/gpu/drm/ci/igt_runner.sh
>> index f1a08b9b146f..ce6e22369d4d 100755
>> --- a/drivers/gpu/drm/ci/igt_runner.sh
>> +++ b/drivers/gpu/drm/ci/igt_runner.sh
>> @@ -20,16 +20,6 @@ cat /sys/kernel/debug/dri/*/state
>>   set -e
>>   case "$DRIVER_NAME" in
>> -    rockchip|meson)
>> -        export IGT_FORCE_DRIVER="panfrost"
>> -        ;;
>> -    mediatek)
>> -        if [ "$GPU_VERSION" = "mt8173" ]; then
>> -            export IGT_FORCE_DRIVER=${DRIVER_NAME}
>> -        elif [ "$GPU_VERSION" = "mt8183" ]; then
>> -            export IGT_FORCE_DRIVER="panfrost"
>> -        fi
>> -        ;;
>>       amdgpu)
>>           # Cannot use HWCI_KERNEL_MODULES as at that point we don't 
>> have the module in /lib
>>           mv /install/modules/lib/modules/* /lib/modules/.
>> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
>> index 612c9ede3507..d8af670ee51d 100644
>> --- a/drivers/gpu/drm/ci/test.yml
>> +++ b/drivers/gpu/drm/ci/test.yml
>> @@ -282,14 +282,17 @@ amdgpu:stoney:
>>   .mediatek:
> 
> Maybe we could s/.mediatek/.mediatek-device, so we know we are not 
> talking about the driver name, what do you think?

Yes, will rename this.

Regards,
Vignesh

> 
>>     extends:
>>       - .lava-igt:arm64
>> -  stage: mediatek
>>     variables:
>> -    DRIVER_NAME: mediatek
>>       DTB: ${DEVICE_TYPE}
>>       BOOT_METHOD: depthcharge
>>       KERNEL_IMAGE_TYPE: ""
>> -mediatek:mt8173:
>> +.mediatek-display:
>> +  stage: mediatek
>> +  variables:
>> +    DRIVER_NAME: mediatek
>> +
>> +.mt8173:
>>     extends:
>>       - .mediatek
>>     parallel: 4
>> @@ -298,7 +301,7 @@ mediatek:mt8173:
>>       GPU_VERSION: mt8173
>>       RUNNER_TAG: mesa-ci-x86-64-lava-mt8173-elm-hana
>> -mediatek:mt8183:
>> +.mt8183:
>>     extends:
>>       - .mediatek
>>     parallel: 3
>> @@ -307,6 +310,16 @@ mediatek:mt8183:
>>       GPU_VERSION: mt8183
>>       RUNNER_TAG: mesa-ci-x86-64-lava-mt8183-kukui-jacuzzi-juniper-sku16
>> +mediatek:mt8173:
>> +  extends:
>> +    - .mt8173
>> +    - .mediatek-display
>> +
>> +mediatek:mt8183:
>> +  extends:
>> +    - .mt8183
>> +    - .mediatek-display
> 
>  From the code, panfrost was being used in IGT_FORCE_DRIVER for mt8183 
> no? --> never mind, I just saw the next patch handles panfrost case. I 
> guess these two commits could be squashed (up to you).
> 
> Regards,
> Helen
> 
>> +
>>   # drm-mtk doesn't even probe yet in mainline for mt8192
>>   .mediatek:mt8192:
>>     extends:
>> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt 
>> b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
>> index ef0cb7c3698c..c63abd603b02 100644
>> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
>> @@ -9,28 +9,13 @@ kms_bw@linear-tiling-3-displays-1920x1080p,Fail
>>   kms_bw@linear-tiling-3-displays-2560x1440p,Fail
>>   kms_bw@linear-tiling-3-displays-3840x2160p,Fail
>>   kms_color@invalid-gamma-lut-sizes,Fail
>> -kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
>> -kms_color@pipe-B-invalid-gamma-lut-sizes,Fail
>>   kms_cursor_legacy@cursor-vs-flip-atomic,Fail
>>   kms_cursor_legacy@cursor-vs-flip-legacy,Fail
>>   kms_flip@flip-vs-modeset-vs-hang,Fail
>>   kms_flip@flip-vs-panning-vs-hang,Fail
>>   kms_flip@flip-vs-suspend,Fail
>>   kms_flip@flip-vs-suspend-interruptible,Fail
>> -kms_force_connector_basic@force-edid,Fail
>> -kms_force_connector_basic@force-load-detect,Fail
>> -kms_force_connector_basic@prune-stale-modes,Fail
>> -kms_hdmi_inject@inject-4k,Fail
>> -kms_plane_scaling@planes-upscale-20x20,Fail
>> -kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25,Fail
>> -kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5,Fail
>> -kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75,Fail
>> -kms_plane_scaling@upscale-with-modifier-20x20,Fail
>> -kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
>> -kms_plane_scaling@upscale-with-rotation-20x20,Fail
>>   kms_properties@get_properties-sanity-atomic,Fail
>>   kms_properties@plane-properties-atomic,Fail
>>   kms_properties@plane-properties-legacy,Fail
>>   kms_rmfb@close-fd,Fail
>> -kms_selftest@drm_format,Timeout
>> -kms_selftest@drm_format_helper,Timeout
>> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt 
>> b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
>> new file mode 100644
>> index 000000000000..64b30c092c85
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
>> @@ -0,0 +1,13 @@
>> +# Board Name: mt8173-elm-hana.dtb
>> +# Bug Report: 
>> https://lore.kernel.org/dri-devel/931e3f9a-9c5c-fc42-16fc-abaac4e0c0ff@collabora.com/T/#u
>> +# IGT Version: 1.28-gd2af13d9f
>> +# Failure Rate: 50
>> +# Linux Version: 6.7.0-rc3
>> +
>> +# Reported by deqp-runner
>> +kms_cursor_legacy@cursor-vs-flip-atomic-transitions
>> +
>> +# Below test shows inconsistency across multiple runs,
>> +# giving results of Pass and Timeout/Fail alternately
>> +kms_prop_blob@invalid-set-prop
>> +kms_prop_blob@invalid-set-prop-any
>> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt 
>> b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
>> index 67d690fc4037..91cd1c4ec068 100644
>> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
>> @@ -1,13 +1,18 @@
>> -kms_addfb_basic@addfb25-bad-modifier,Fail
>> +core_setmaster_vs_auth,Fail
>> +kms_bw@linear-tiling-1-displays-1920x1080p,Fail
>>   kms_bw@linear-tiling-1-displays-2560x1440p,Fail
>> +kms_bw@linear-tiling-1-displays-3840x2160p,Fail
>>   kms_bw@linear-tiling-2-displays-1920x1080p,Fail
>>   kms_bw@linear-tiling-2-displays-2560x1440p,Fail
>>   kms_bw@linear-tiling-2-displays-3840x2160p,Fail
>> -kms_bw@linear-tiling-3-displays-2560x1440p,Fail
>> -kms_bw@linear-tiling-3-displays-3840x2160p,Fail
>> -kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
>> -kms_plane_cursor@overlay,Fail
>> -kms_plane_cursor@primary,Fail
>> -kms_plane_cursor@viewport,Fail
>> -kms_plane_scaling@upscale-with-rotation-20x20,Fail
>> +kms_color@invalid-gamma-lut-sizes,Fail
>> +kms_cursor_legacy@cursor-vs-flip-atomic,Fail
>> +kms_cursor_legacy@cursor-vs-flip-legacy,Fail
>> +kms_flip@flip-vs-modeset-vs-hang,Fail
>> +kms_flip@flip-vs-panning-vs-hang,Fail
>> +kms_flip@flip-vs-suspend,Fail
>> +kms_flip@flip-vs-suspend-interruptible,Fail
>> +kms_properties@get_properties-sanity-atomic,Fail
>> +kms_properties@plane-properties-atomic,Fail
>> +kms_properties@plane-properties-legacy,Fail
>>   kms_rmfb@close-fd,Fail
>> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt 
>> b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
>> new file mode 100644
>> index 000000000000..5885a950fa72
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
>> @@ -0,0 +1,8 @@
>> +# Board Name: mt8183-kukui-jacuzzi-juniper-sku16.dtb
>> +# Bug Report: 
>> https://lore.kernel.org/dri-devel/931e3f9a-9c5c-fc42-16fc-abaac4e0c0ff@collabora.com/T/#u
>> +# IGT Version: 1.28-gd2af13d9f
>> +# Failure Rate: 100
>> +# Linux Version: 6.7.0-rc3
>> +
>> +# Reported by deqp-runner
>> +kms_cursor_legacy@cursor-vs-flip-atomic-transitions

