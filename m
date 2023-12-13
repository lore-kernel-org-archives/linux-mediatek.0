Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF2AC4167D
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 18:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QonODTv9i+I1mUWKNugWGfvARIRw4SqAilH2FmQQXlM=; b=F1z6VJNZy5bLLjHryZ6qC8qI8L
	gYr/6ZAK+V3rKwlRynrCheUm2ebY7mh8WDDPCQewCHIP3/gIgdGJzsyTkO0t/o0pAPOTQAuKN9twU
	U144keEThsX0pz2NdOke8DEe184YbM1CAnGozrX2KdRsvf9v4z+5vujEKzAXajuMjyn9nCa9UINCy
	Uii3OtrFK1XDvbXJnWd/c+VcxGRPUYYnInL/pjFJJTxOVG7ZCzwubL5edTyUQLcxRMCc9PMDbmRjs
	+AGAgh+2k7SmX54QWjfIpQ/2zvC+rTrEQCvsL8iecHE+ez+OIjeRDcHEBomnsaHLxztdxmk5l+J8J
	aWlux/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDTzz-00Fizl-2X;
	Wed, 13 Dec 2023 18:30:23 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDTzw-00FizN-22
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Dec 2023 18:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702492214;
	bh=siA7LXSw/cWZOr3eONb6GU7+2W3xc0vUDDvqYVEXHo4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HKaHHKc0GUtMtMwGqB+JhK/Vd2s7zl9h17X37TcWvqJ0glMkrpvUvtD8ZM5zP8oTb
	 Oj4pz9a2wJo3jO39ryXI/U1WQnYL+fCTObQZwpY+LyftemSP7OKFByncn0wiOqL0kC
	 /R1gMJO5f0fFI42K/EPxi5SXCGcG2Xw4aifPcDczViY3hkFFI1nPp0pYsRjl4YWwCG
	 ag3BhjF/myOaupGXZQYNhPbCmDhTDYQuojNMX3AFXDhFkgl+6ltnI1kbYK8l8ZDfzW
	 kfTH6jskaTJOYZBhR6GtJsxacD1N9KrTqBgrdxzKkZTo8fXUZJeiEstd75yGdAhLHg
	 7Svf5ssqsr+0g==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 95141378149B;
	Wed, 13 Dec 2023 18:30:10 +0000 (UTC)
Message-ID: <dd153cf3-541b-40c8-b33c-ce9e7074cc37@collabora.com>
Date: Wed, 13 Dec 2023 15:30:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/10] drm: ci: fixes
To: Vignesh Raman <vignesh.raman@collabora.com>, airlied@gmail.com,
 daniel@ffwll.ch
Cc: daniels@collabora.com, emma@anholt.net, gustavo.padovan@collabora.com,
 linux-arm-msm@vger.kernel.org, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 david.heidelberg@collabora.com, linux-mediatek@lists.infradead.org
References: <20231207091831.660054-1-vignesh.raman@collabora.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231207091831.660054-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_103020_869416_83F95651 
X-CRM114-Status: GOOD (  19.45  )
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



On 07/12/2023 06:18, Vignesh Raman wrote:
> The patch series contains improvements, enabling new ci jobs which
> enables testing for Mediatek MT8173, Qualcomm APQ 8016 and VirtIO GPU,
> fixing issues with the ci jobs and updating the expectation files.
> 
> v2:
>    - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources
>    - Reworded the commit message for enabling jobs
>    - Added a new patch in the series to use scripts/config to enable/disable configs
> 
> v3:
>    - New patch in the series to add device tree overlay in arch/arm64/boot/dts/qcom
>    - drm-ci scripts to use device tree overlay from arch/arm64/boot/dts/qcom and compile base device tree with overlay support
>    - New patch in the series to enable CONFIG_REGULATOR_DA9211 in defconfig
>    - Remove CONFIG_RTC_DRV_MT6397=y as it is already enabled in defconfig
> 
> v4:
>    - Drop 'enable CONFIG_REGULATOR_DA9211 in defconfig' patch as it is sent upstream as a seperate patch
>    - Use apq8016-sbc-usb-host.dtb which allows the USB controllers to work in host mode.
>      This patch depends on https://lore.kernel.org/lkml/20230911161518.650726-1-vignesh.raman@collabora.com/
> 
> v5:
>    - Added a new patch in the series to set IGT_FORCE_DRIVER to 'mediatek' for mt8173
>    - Added a new patch in the series to make artifacts available for virtio jobs
>    - Added a new patch in the series to add pipeline url to fails and flakes files
>    - Generate fails and flakes file with the updated xfails script - https://www.spinics.net/lists/kernel/msg4959630.html
>    - Drop 'virtio: Update ci variables' patch as the tests which causes the malloc issue are skipped
> 
> v6:
>    - Updated commit message for enable DA9211 regulator fix
>    - Use GPU_VERSION instead of CI_JOB_NAME to check if it is mt8173 while setting IGT_FORCE_DRIVER
>    - Added a new patch in the series to uprev IGT to fix memory corruption
>    - Added a new patch in the series to update drm ci documentation
>    - Generate fails file with drm-misc-next
> 
> v7:
>    - Fix checkpatch style problems in commit message
>    - Rework mt8173 IGT_FORCE_DRIVER fix and reword the commit message
> 
> Vignesh Raman (10):
>    drm: ci: igt_runner: Remove todo
>    drm: ci: Force db410c to host mode
>    drm: ci: arm64.config: Enable DA9211 regulator
>    drm: ci: Enable new jobs
>    drm: ci: Use scripts/config to enable/disable configs
>    drm: ci: mt8173: Do not set IGT_FORCE_DRIVER to panfrost
>    drm: ci: virtio: Make artifacts available
>    drm: ci: uprev IGT
>    drm/doc: ci: Add IGT version details for flaky tests
>    drm: ci: Update xfails
> 
>   Documentation/gpu/automated_testing.rst       |  7 +--
>   drivers/gpu/drm/ci/arm64.config               |  1 +
>   drivers/gpu/drm/ci/build.sh                   | 16 +++----
>   drivers/gpu/drm/ci/gitlab-ci.yml              |  2 +-
>   drivers/gpu/drm/ci/igt_runner.sh              | 10 +++-
>   drivers/gpu/drm/ci/test.yml                   | 13 ++----
>   .../drm/ci/xfails/mediatek-mt8173-fails.txt   | 13 ++++--
>   .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  5 ++
>   .../drm/ci/xfails/virtio_gpu-none-fails.txt   | 46 +++++++++++++++++++
>   9 files changed, 86 insertions(+), 27 deletions(-)
> 


Applied to drm/drm-misc (drm-misc-next).

Thanks!
Helen


