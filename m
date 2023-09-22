Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60892E6FE32
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 13:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKh/ueRM5HZmi6FYT2wRNjbc9zcPpyB2edErzQvJXdA=; b=zScaRAJjEhka6ivaM4Mj8KHfjk
	T+TWeWdpmoG8Q91wfYUfJosWs4ZnmEadVUkwAhohrtEpkviTIpb30B3WQh84whW0dRlpdoiHmUICh
	LidjopG39SvRvUl9g8t8Bt6bmL4T3fr676nzQUCLIuXgNmBHUDqwdJ/3KI36Wyli2cmovnRrw2gzX
	O+hQkl5WrH4EoDI/eBMJzRA3BPG48cmEzAmI8f6oIpecZauv/5wmJYlFvwrErLXnhu2B+fxBRvF9N
	9Vd0UAze2U12pVGMDcu1TdbmzOPLLeSq7oLcpvO8kGJGcs0dSFZpCTC/Mhn5FBM81y4PlpgNHrl8J
	apAzxUdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjgbP-0099Z9-0u;
	Fri, 22 Sep 2023 13:53:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjgbM-0099YK-0B;
	Fri, 22 Sep 2023 13:53:49 +0000
Received: from [192.168.68.123] (unknown [177.98.21.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 284DF66072BD;
	Fri, 22 Sep 2023 14:53:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695390824;
	bh=WoiS3+8J2m0h7J1ZYU1c9DU2eQCub1jdA/yONAZ1bYk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QeM9MoNZ0/i5NssNN3eIMNJnh/KuVZ3GdFE4UdN3s1KKEbL+KzuAVB/ktU+FuhnJC
	 2S/z3KiEBwnQuUKfuClAANB8gx1laSJWGF+dVNjSVsQibm/e4vVN6psO7SfYGcvB/O
	 wd6txqBR8BO7J0rysd5/XpgWVU0bllFaaHRtRfQPlTCUh26jiIcFReYnN2yU+gCfqI
	 Xidw9JbP3gAW8YpqOY5dmlydxyvDa2VschOrDhA/e7Y/qyiCUAq9Jz5eY7R923xCAo
	 tCjp4fvc2Gd6CbX0qStK2UywRUBlsIjiX4tVIc2lKtP+QikTO5Dq5xf31grl3eStWs
	 52QFxq9cMkqLQ==
Message-ID: <26cb3404-56ad-8e23-5da5-eee94c4c4350@collabora.com>
Date: Fri, 22 Sep 2023 10:53:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 0/7] drm: ci: fixes
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>, airlied@gmail.com,
 daniel@ffwll.ch
Cc: david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
 guilherme.gallo@collabora.com, daniels@collabora.com,
 gustavo.padovan@collabora.com, emma@anholt.net, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 virtualization@lists.linux-foundation.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20230914085426.883255-1-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230914085426.883255-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_065348_268576_3F874EA5 
X-CRM114-Status: GOOD (  18.82  )
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



On 14/09/2023 05:54, Vignesh Raman wrote:
> The patch series contains improvements, enabling new ci jobs which
> enables testing for Mediatek MT8173, Qualcomm APQ 8016 and VirtIO GPU,
> fixing issues with the ci jobs and updating the expectation files.
> This series is intended for drm branch drm-next.
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

Jfyi, this patch got applied, see 
https://lore.kernel.org/lkml/169539077994.4014786.12440074307606036817.b4-ty@kernel.org/

Regards,
Helen
> 
> Vignesh Raman (7):
>    drm: ci: igt_runner: Remove todo
>    drm: ci: Force db410c to host mode
>    drm: ci: virtio: Update ci variables
>    drm: ci: Enable regulator
>    drm: ci: Update xfails
>    drm: ci: Enable new jobs
>    drm: ci: Use scripts/config to enable/disable configs
> 
>   drivers/gpu/drm/ci/arm64.config                  |  1 +
>   drivers/gpu/drm/ci/build.sh                      | 16 ++++++++--------
>   drivers/gpu/drm/ci/igt_runner.sh                 |  1 -
>   drivers/gpu/drm/ci/test.yml                      | 16 +++++-----------
>   .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt    |  1 -
>   drivers/gpu/drm/ci/xfails/i915-cml-fails.txt     |  1 -
>   drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt    |  2 ++
>   drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt    |  1 +
>   .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt  |  2 --
>   .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt | 16 ++++++++++++++++
>   drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt |  2 ++
>   .../gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt |  1 +
>   .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt  |  4 ++--
>   .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt |  3 +++
>   14 files changed, 41 insertions(+), 26 deletions(-)
> 

