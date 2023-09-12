Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF02CA0EF9
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 16:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPP5QZsReGJXBwBVpOwLo7r/F8hX8ctK0EVpBGbQ9og=; b=0o/XDMoux/JewwuzwpgUJZQS1j
	DtBxr7N4yqeC22tRGQ261mP12zYCzWddX+oTlgl+iGIOPpKSgWVotZJ6NDqU/amAMI6gFIxxyT4oC
	FXHgXCGq74xVokAbRwgSvfuparw7rRzcfxeXCkemufpKEW4bcUQam402zqVtyEENQywNJEpt1H9/O
	zXYzopoMQVqo8RlW9FiM/4+Ofqjt7OF7el6wCog+0ikOjubqyNuxHxSlGU7oiSqRtNJ3bXBydIYEf
	+kGFbpMONUfnKYAHXqy+9ht4+kPMoYYVWvBl5GTvprCIlyMGfmyYSteWc4a82k3SLBgyUM/+jX/xC
	BN+OkVoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6dH-003s5m-0L;
	Tue, 12 Sep 2023 16:52:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6dE-003s59-12
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 16:52:57 +0000
Received: from [192.168.0.106] (unknown [186.235.7.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CC7D866071C9;
	Tue, 12 Sep 2023 17:52:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694537575;
	bh=TVo8blOVOG3UIRsd0gEuMSvu6J/PcJyo+tO8L2Vpang=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WgqcopKFLk6Cp6RK+TO4+r+Pc+vI3zhvU7M99sa3ToH4A0zqU96YwnP5NcsOae1Nt
	 GQwZGaxHmvOkQsDW6PuEX2U8yAAfuPZo5l15rHiKMqZa5hVSWGUpNzOGG2H0ydAiaT
	 WcDf1rhF62wJGyTlXZMDQTHKJvKwZgvMKkKO+naJRwE+N4lMDTUNQcBDNTiPgJHGPm
	 9fkfIr3BY1S9t30UMea7pQX/FE0Es1u3dT06Vj6jyfWAu+CYwZskcjtlgN9N4ykd60
	 BV4IzEMzhniqm5oZfVxzGJN/p4QVF9BL1pd/f0yHwrgJMHNI5pB1cHyzvE7+5ryLES
	 33ChqUPD+xpZg==
Message-ID: <44b7c0d5-bfa5-bac1-83d5-debc2365b1ae@collabora.com>
Date: Tue, 12 Sep 2023 13:52:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 4/9] drm: ci: virtio: Update ci variables
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
 <20230908152225.432139-5-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230908152225.432139-5-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_095256_485374_2CB74B98 
X-CRM114-Status: GOOD (  12.54  )
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
> Update ci variables to fix the below error,
> ERROR - Igt error: malloc(): corrupted top size
> ERROR - Igt error: Received signal SIGABRT.
> ERROR - Igt error: Stack trace:
> ERROR - Igt error:  #0 [fatal_sig_handler+0x17b]
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
> 
> v2:
>    - No changes
> 
> v3:
>    - No changes
> 
> ---
>   drivers/gpu/drm/ci/test.yml | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 6473cddaa7a9..d85add39f425 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -316,8 +316,11 @@ virtio_gpu:none:
>     stage: virtio-gpu
>     variables:
>       CROSVM_GALLIUM_DRIVER: llvmpipe
> -    DRIVER_NAME: virtio_gpu
> +    DRIVER_NAME: virtio
>       GPU_VERSION: none
> +    CROSVM_MEMORY: 12288
> +    CROSVM_CPU: $FDO_CI_CONCURRENT
> +    CROSVM_GPU_ARGS: "vulkan=true,gles=false,backend=virglrenderer,egl=true,surfaceless=true"
>     extends:
>       - .test-gl
>     tags:

