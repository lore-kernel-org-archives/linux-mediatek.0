Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1500DEE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 09:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGa6FNa0TnH7tbWkyIKDZQpdvZ7mf2zQVoRzgvDpsHU=; b=KXijyQ0xEY5SPDRj2bR/YqSPlg
	QRjqNbngOoYU8Q/utryLK3aTUIlUyAY5SsG4V9iNTG+CqnM6UKVLXaHPVQfUjQVQ4/4q9BbSs8HHW
	qeJNfWf8UKY9nQ8OQfsO0ClNYsX6RuMb9uHiogem4Qbl35SlsIDzCIhL3vOcTjlWvG2Jr4M1+qB3x
	WPHUPyxXn1kYEpguaad6m7al8alLwJ3mLtBQRni7eZTd3FaeC90Cf1UDRGQYRgJCnjLNOX5S34++Z
	sVxoajfpeoJ6Czf7EFwFFUdlCL/6F7WSkscr8W/snBOridEjWF8NtAz5aqdMxuzUtmUvB3kf6a/Ek
	D9wt2lZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdIz-0001Up-08;
	Mon, 11 Sep 2023 09:34:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdIw-0001UC-0j;
	Mon, 11 Sep 2023 09:34:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C3CF966072F0;
	Mon, 11 Sep 2023 10:33:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694424840;
	bh=rHHHuF02A5nvt+AXbCIowWRbwndRguiS4v+mhK3ndws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hdEWKVqo2v+9z5TdmS3rsrer803Qt2ExqloC2R16vDBb7HzzZm8InCiQhzTKEB5jV
	 h/GZcp87wLWxXngKvN3N6LFft7Z9rOzIEzICp1S2uOvBNiT8QLjnSj1sOQGxGCxtl+
	 b3R9QGOcOM1GUQfQPgxDD9SordElS28hYwIO6Axb3HOH0zh/3jTIgD4k/m9/LCuC25
	 waPj7xE0dpPGBLtYjoZUVWSOyfphK2L/xqTN0syYLACpTujIeg/T7T0YmH6d2+SxRO
	 8RZtgPaUop56crCMOSYatDaTZfv/2i4IETmyUQQla/KkNb4IWL7JpM1X4Ewdd1QgXg
	 WcMMM3kRqLYeg==
Message-ID: <dd418409-1c91-f58d-f8ed-a0c8d42a26be@collabora.com>
Date: Mon, 11 Sep 2023 11:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 9/9] dma_buf: heaps: mtk_sec_heap: Add a new CMA heap
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 tjmercier@google.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 jianjiao.zeng@mediatek.com, kuohong.wang@mediatek.com
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-10-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230911023038.30649-10-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_023402_395775_0D57E0C7 
X-CRM114-Status: GOOD (  17.28  )
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

Il 11/09/23 04:30, Yong Wu ha scritto:
> Create a new mtk_svp_cma heap from the CMA reserved buffer.
> 
> When the first allocating buffer, use cma_alloc to prepare whole the
> CMA range, then send its range to TEE to protect and manage.
> For the later allocating, we just adds the cma_used_size.
> 
> When SVP done, cma_release will release the buffer, then kernel may
> reuse it.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/dma-buf/heaps/Kconfig           |   2 +-
>   drivers/dma-buf/heaps/mtk_secure_heap.c | 121 +++++++++++++++++++++++-
>   2 files changed, 119 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> index 729c0cf3eb7c..e101f788ecbf 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -15,7 +15,7 @@ config DMABUF_HEAPS_CMA
>   
>   config DMABUF_HEAPS_MTK_SECURE
>   	bool "DMA-BUF MediaTek Secure Heap"
> -	depends on DMABUF_HEAPS && TEE
> +	depends on DMABUF_HEAPS && TEE && CMA
>   	help
>   	  Choose this option to enable dma-buf MediaTek secure heap for Secure
>   	  Video Path. This heap is backed by TEE client interfaces. If in
> diff --git a/drivers/dma-buf/heaps/mtk_secure_heap.c b/drivers/dma-buf/heaps/mtk_secure_heap.c
> index daf6cf2121a1..3f568fe6b569 100644
> --- a/drivers/dma-buf/heaps/mtk_secure_heap.c
> +++ b/drivers/dma-buf/heaps/mtk_secure_heap.c

..snip..

> +}
> +
> +RESERVEDMEM_OF_DECLARE(mtk_secure_cma, "mediatek,secure_cma_chunkmem",

I'd suggest "mediatek,secure-heap" as compatible name.

> +		       mtk_secure_cma_init);
> +

Regards,
Angelo



