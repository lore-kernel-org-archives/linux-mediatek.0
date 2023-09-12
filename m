Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF81CA0EF5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 17:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRAiF2M35t3Fm1RfL1jFJ56QIK7x1hfc6+XjzpyfZN4=; b=SAVRSDkW7mgzTIBxd4MXqXYZ9M
	lsOfCBXdJBPWUTqgU5GnkEOQ6PEBKZespcrGe67kDyDfKDux6YeGDCwbkG1JxdNZ+wWvsJfz6X60N
	1QY6bRTW6e717Cq9vS2FHNk4UNZVB8y+5vjG9LgOMuMKCQTc+JbpmG5mxcJOj+FDlU96YLKMNZ0S9
	jhoeaVICigjK5+ky/kK5yhSr9lcmNBZ7Ec6jyRBNPUD/PWdZ48CMKiHPGhCm9B6kgi8ZBMR1PR8PL
	zSd+R0tRKK7LxKzbyRcBQMCimYd2F2r6pCzuFo0FfdXy7FqZ1ZtAaAoLflm2ljWp9BaHPU9pO5w10
	KJS/2bAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6m3-003shA-0R;
	Tue, 12 Sep 2023 17:02:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6m0-003sgV-1T
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 17:02:01 +0000
Received: from [192.168.0.106] (unknown [186.235.7.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CFD3066072B4;
	Tue, 12 Sep 2023 18:01:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694538119;
	bh=sm5+is+zMEhHqe7EnrHHFL2UbWWzWkGkszkqR/V7AI0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LalD6Suk+Ksvjr+uEeVaKamf2/KVIIRDW+wLkOZj1Iu7g9MT2nSVHIFwGDcF6N5Ua
	 P7EwJ6QhNOmhMxS0DOZfWAcY6sngRbfeRwdVyeS+TRPKOJAHu1svXPveHbTjiYDJlD
	 0dXZ84byE0SmIZ9GyyIMXwKxDJ7nfxdh64VClNiDXQR1IHqO9RuuZkU0l4sA9L9dPE
	 s1raH+ZGKw8GAXouxv3XUTfm/wHJS7YswMT0esnSAYoYBDgIxk5o6WDsaP9NtVu8E6
	 Ur5FeEB/ctyIG8LYdtz84KMlh8ewDG0eW6P/AW7vpyO7ceojFdsFlEaS3szgs1CQc0
	 miKMaoyVbaWmg==
Message-ID: <c7b0b363-c3cf-248b-678a-11bbb6d4503d@collabora.com>
Date: Tue, 12 Sep 2023 14:01:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 9/9] drm: ci: Use scripts/config to enable/disable
 configs
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
 <20230908152225.432139-10-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230908152225.432139-10-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_100200_626057_0C1392F7 
X-CRM114-Status: GOOD (  16.24  )
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
> Instead of modifying files in git to enable/disable
> configs, use scripts/config on the .config file which
> will be used for building the kernel.
> 
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
> 
> v2:
>    - Added a new patch in the series to use scripts/config to enable/disable configs
> 
> v3:
>    - No changes
> 
> ---
>   drivers/gpu/drm/ci/build.sh | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index 092c195af242..093929a115de 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -70,19 +70,19 @@ if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
>       fi
>   fi
>   
> -for opt in $ENABLE_KCONFIGS; do
> -  echo CONFIG_$opt=y >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
> -done
> -for opt in $DISABLE_KCONFIGS; do
> -  echo CONFIG_$opt=n >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
> -done
> -
>   if [[ -n "${MERGE_FRAGMENT}" ]]; then
>       ./scripts/kconfig/merge_config.sh ${DEFCONFIG} drivers/gpu/drm/ci/${MERGE_FRAGMENT}
>   else
>       make `basename ${DEFCONFIG}`
>   fi
>   
> +for opt in $ENABLE_KCONFIGS; do
> +    ./scripts/config --enable CONFIG_$opt
> +done
> +for opt in $DISABLE_KCONFIGS; do
> +    ./scripts/config --disable CONFIG_$opt
> +done
> +
>   make ${KERNEL_IMAGE_NAME}
>   
>   mkdir -p /lava-files/

