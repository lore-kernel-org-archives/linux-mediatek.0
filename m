Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F92C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Dec 2023 18:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSzcAyKl5NYpgvS14B97dH2hGAKsyWivPvq6H2cqxVo=; b=T86RyIMxcxZHdceP/IuE2ls63/
	HjrGDFEvJWSen3XN5X5BOs+saNwFUkjkW06EjBA2qrXChWuJ+e0oUa3jcr98i5M/03kw2ODouW6U/
	oUzfT5MHDKy79W/hMbat1l2KzHRpicMR/pdQ2zO4iAw031R22b2r/YdHyFrrma7GpEAaYwrD6U0bP
	RgJeX/wq/wTaZBWoaJqbJb6hWGqDUDNCO7QNe6KgwQixSpxbco4UqVnj/U8sCq5H5YfgtPdjWRVBt
	BH+1cwiVJwrf3jjaDUOrQlSEGw0XWRe/aD8x6xs3PrnBL8Z8vePkOympDoCCNwJp66kaBmPNEEue3
	BrJI7W9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZiQ-0085WP-1s;
	Tue, 05 Dec 2023 18:00:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZiN-0085Vr-3D;
	Tue, 05 Dec 2023 18:00:13 +0000
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CFBE6660715D;
	Tue,  5 Dec 2023 18:00:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701799208;
	bh=BJnfYEP4jnzEj4xC3SBzSpdhlHMoXjr4hMbNgToqNCg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZrmM49NoOB3x8hr/saLAgZ24NK1r5XWWETIfoXyilPXQw0teXOUfW/q9LhuUIpsEP
	 RXlGXacDZ5FwLpr1yhlqHD3schTPsf5KHXDlFbxPtnQN78DuT4kADVCfdIvry2bRSE
	 WSlVcOqqrUWHsHOv2SDEizYb9ROTxZ1coDO/bdOIRO0Dw3ssvk8/hcWg9lzZIs62cF
	 svBTTfCxg3O8YBLRGac9/7HiYDyjQ5de5yWPAFi+zk2ba+pR1ZEa/axQtGTgVoB/0a
	 0xsf0Ys2vZOz6chQenCg1G3WCGcBSHTRAeNvTNqkRPyb9Ou2SX3wcjXhz2rbDFw3Dx
	 EDTTvY+oEWndQ==
Message-ID: <92256a4b-f957-40ac-af90-d5ea03da497b@collabora.com>
Date: Tue, 5 Dec 2023 15:00:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/10] drm: ci: virtio: Make artifacts available
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
References: <20231129121841.253223-1-vignesh.raman@collabora.com>
 <20231129121841.253223-8-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231129121841.253223-8-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_100012_167296_1F29ABCD 
X-CRM114-Status: GOOD (  11.03  )
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



On 29/11/2023 09:18, Vignesh Raman wrote:
> There were no artifacts available for virtio job.
> So make the artifacts available in the pipeline job.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
> 
> v5:
>    - Added a new patch in the series to make artifacts available for virtio jobs
> 
> v6:
>    - No changes
> 
> ---
>   drivers/gpu/drm/ci/test.yml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index e0fdc55c9b69..2c9a1838e728 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -329,6 +329,8 @@ virtio_gpu:none:
>     script:
>       - ln -sf $CI_PROJECT_DIR/install /install
>       - mv install/bzImage /lava-files/bzImage
> +    - mkdir -p $CI_PROJECT_DIR/results
> +    - ln -sf $CI_PROJECT_DIR/results /results
>       - install/crosvm-runner.sh install/igt_runner.sh
>     needs:
>       - debian/x86_64_test-gl

