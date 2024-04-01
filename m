Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0EDCD1288
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Apr 2024 16:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9b05YhwIjTpjaepAn1OCLYc3HVc9DpP1wWhgjvXSZ8=; b=J1ph9JrU8qWDzD8k1DL6ajOXAK
	IufSwE5P3vBmCYNHJxwqwX91UUQi4h52P7wC9r2aLanSqtnHltqI2HDEkGG0oVGsMw0M1FuHAxocI
	0UTXF9bjLbetd96bh4kwIaxUekx2ibPR/pQNBXsQI8eMuwCI3EQpSvTbiQ9UHEICdW5BDIcFcb/9W
	Brr2XmQW13qyIw/PuPZqR4za+/fynIEAiTSjDMR/RGlW3NDipNXCGGheK/ULBtJ7bGdOXLzidQrjp
	2xu9S5Rq/iQ6t0BaadMs5+fOzzZqaerH+3pM2oPZhGeL0HtxlBXdiJgmC8F9JKSxAUgIHQtbUK1/x
	jiOhpYOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrKkq-00000008MWL-2tZP;
	Mon, 01 Apr 2024 16:43:28 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrKkm-00000008MUX-3uKn;
	Mon, 01 Apr 2024 16:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711989803;
	bh=jj/7JBEtwmOllBv+V+90Ub0Tp6aGpKsq0JrqIiVbE5I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h9xlKKWyIwllQPpM8f6+Y5/WphYZoXQfOLS6XWg0Uleb9GaZuPBov4eBYJY9bYmz2
	 DLDzL7pItuSboJs3hA4CGcbnahRoRp8E1bhEatXhMzhcF5Fwd0aBKFEPgyjf6X9cHz
	 le0sb8OPhfDZ4BTUOzjp+E5bhPeMrLZ0MpPUaZuewWIHPvDE4jaAVvilALNm96GonT
	 ksvs9C1RguUVPhcrplQ4eYd0CMqHpjyudl2hmzywqn8ql1G77WL8Mxd/lHyY5UAr6X
	 bLwtpaVLIM/+g6jP2uNz39xSrtDLZaGC6OVNYMYwWtBgxGXGRykLGI2Mr1SH2zdz5Y
	 WG6+b61r1Z6wg==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 557AA378143B;
	Mon,  1 Apr 2024 16:43:17 +0000 (UTC)
Message-ID: <c0d9a271-7454-4e5d-8f53-f3b3cd0830ef@collabora.com>
Date: Mon, 1 Apr 2024 13:43:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/10] drm/ci: meson: Add job to test panfrost GPU
 driver
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
 <20240401061235.192713-8-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240401061235.192713-8-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_094325_138654_08AFBB5B 
X-CRM114-Status: GOOD (  18.43  )
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
> For amlogic meson SOC the GPU driver is panfrost. So add
> support in drm-ci to test panfrost driver for amlogic meson
> SOC and update xfails. Skip KMS tests for panfrost driver since
> it is not a not a KMS driver and skip driver-specific tests.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Nit: Maybe squash this with previous commit.

With or without this change:

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
> 
> v2:
>    - Add panfrost GPU jobs for amlogic meson SOC with new xfails.
> 
> v3:
>    - Skip KMS tests for panfrost driver since it is not a not a KMS
>      driver and update xfails. Add the job name in GPU_VERSION and use
>      it for xfail file names instead of using DRIVER_NAME.
> 
> v4:
>    - Remove the gpu suffix in job and rename xfails accordingly.
> 
> v5:
>    - Use panfrost-gpu job and skip driver-specific tests.
> 
> ---
>   drivers/gpu/drm/ci/test.yml                       | 5 +++++
>   drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt | 1 +
>   drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt | 8 ++++++++
>   3 files changed, 14 insertions(+)
>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
> 
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 505733069995..d1d42ff7df2d 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -381,6 +381,11 @@ meson:g12b:
>       - .g12b
>       - .meson-display
>   
> +panfrost:g12b:
> +  extends:
> +    - .g12b
> +    - .panfrost-gpu
> +
>   virtio_gpu:none:
>     stage: virtio-gpu
>     variables:
> diff --git a/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
> new file mode 100644
> index 000000000000..6f5e760d5ec0
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
> @@ -0,0 +1 @@
> +panfrost_prime@gem-prime-import,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
> new file mode 100644
> index 000000000000..41a846a59644
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
> @@ -0,0 +1,8 @@
> +# Panfrost is not a KMS driver, so skip the KMS tests
> +kms_.*
> +
> +# Skip driver specific tests
> +msm_.*
> +^amdgpu.*
> +v3d_.*
> +vc4_.*

