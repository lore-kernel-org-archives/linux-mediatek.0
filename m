Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B74CA0EF8
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 16:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6o1thThd289wI9XIAJsdvOr7KGwAU5guEYMa1KCopzg=; b=klUIwukNGsYMIC7+rlfooJq7vc
	I7kzby/6lpN1gk9cLjv28rLg+h1zKJyKJ9vnwCM3JGKnzYQhCkBYTdjsBImmYiXliVh/g2zlXWvci
	TQMb+CnoRmlFOBuae6vrqGCufNj55r6YHjVIeZTcPkUmfaytu9HPlB8R5sMOQS5gQYwUsETLOYudj
	2oRluSgfH52xNpc8+JnCIdxPOLaO/W+A0TYKNWbDfXlXV0swltjaG2N98YT3dKug5FOHqS+kHCWcf
	9TWznMYh++wDr3WbitrKktMTe5Ecdgk5WpT9izxSD3m+hQuoZBLUq5f/AajhWRrgrZi6xITQLhzcM
	dMXRGvSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6cu-003s2G-0S;
	Tue, 12 Sep 2023 16:52:36 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6cq-003s1a-2u
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 16:52:34 +0000
Received: from [192.168.0.106] (unknown [186.235.7.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F1221660716C;
	Tue, 12 Sep 2023 17:52:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694537551;
	bh=igS9u76vL2oPeSqObcVgUtmTOkkby+Pw+fIrRSQSDjw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UpeqNcvSWdUCXowwhN7YAh4SQxCJ4z3gCql/zXkdJ8kJu7G8lnp1IyPSKTWiPWjEE
	 eBkh0Xej143eLTLObrQqfDBjEwmCJF3LspuubwXbss9yuWoIkVyxZIBEtLAxzxwaol
	 83pHxtG8BjSUwQx6iKbkfAGuZibLCXcbyy+NSwwWtILVj81biyqQ8gPgYfu28h4hc0
	 nCk/nWv68wpF9ZqrdoirBO8J3IIBrFB2o210wI6jGKxgNVNvshsKGcW890+fJNg6hP
	 D1pxCSEyZQjRNokWQgLmT5+Bbg2j81pGo7LOsZhwRUh+YcOOqZ34qU92Y+Q8+G60DJ
	 kj6gWE5vKpgCA==
Message-ID: <3f28b185-07bf-3bc8-05bb-0af2e65d1677@collabora.com>
Date: Tue, 12 Sep 2023 13:52:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 3/9] drm: ci: Force db410c to host mode
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 david.heidelberg@collabora.com, daniels@collabora.com,
 gustavo.padovan@collabora.com, angelogioacchino.delregno@collabora.com,
 emma@anholt.net, robclark@freedesktop.org, robdclark@google.com,
 anholt@google.com, robdclark@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, mripard@kernel.org,
 dmitry.baryshkov@linaro.org, matthias.bgg@gmail.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
 <20230908152225.432139-4-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230908152225.432139-4-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_095233_068431_9A470EEE 
X-CRM114-Status: GOOD (  18.95  )
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



On 08/09/2023 12:22, Vignesh Raman wrote:
> Force db410c to host mode to fix network issue which results in failure
> to mount root fs via NFS.
> See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8
> 
> Compile the base device tree with overlay support and use fdtoverlay
> command to merge base device tree with an overlay which contains the
> fix for USB controllers to work in host mode. [suggested by Maxime Ripard]
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
> 
> v2:
>    - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources
> 
> v3:
>    - drm-ci scripts to use device tree overlay from arch/arm64/boot/dts/qcom and compile base device tree with overlay support
> 
> ---
>   drivers/gpu/drm/ci/build.sh | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index 7b014287a041..092c195af242 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -91,7 +91,12 @@ for image in ${KERNEL_IMAGE_NAME}; do
>   done
>   
>   if [[ -n ${DEVICE_TREES} ]]; then
> -    make dtbs
> +    make DTC_FLAGS=-@ dtbs
> +    if [[ -e arch/arm64/boot/dts/qcom/apq8016-sbc.dtb ]]; then
> +        dtc -@ -I dts -O dtb -o arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtbo arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso
> +        fdtoverlay -i arch/arm64/boot/dts/qcom/apq8016-sbc.dtb -o arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtbo
> +        mv arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb arch/arm64/boot/dts/qcom/apq8016-sbc.dtb
> +    fi
>       cp ${DEVICE_TREES} /lava-files/.
>   fi
>   

