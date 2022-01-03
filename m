Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B83C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 18:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZKgP/jd+HDhVZPkLRw4tBf1gjdveYiXvY8yTD+WL/PU=; b=phOs+YBX67POtm
	sqSs7DAT3CDl4buuMCtB60XpmrOoqiCC4if7Rx1ZbL3lM0NoZJjE4hEL5oGSAi6/wPzEtRdyXtJ5i
	lN5yMQyyUj8xR0d5bbVy8ABv6VQ6fFgybiXwXvF24S4WOrB2s+SsvKKnhjFersMD06FNLLW2FXanI
	XZxKXb6FjMD4MgyGINKUQ7/isi44G+jaDyW1csp7QR4ErMuf09ByzoJjeMQ6nisk1ACN5UbPYdTIa
	4ElrKRkCurpIKJI0ICU5bcmbe2XqqLGMN4q6mrT6SqGYM6ZNMb8LFrpBwWMCGTA2UZzP9SUdUUoYv
	5SFix7emo6hnuqZHF46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4SWr-009sTq-97; Mon, 03 Jan 2022 18:57:57 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4SWf-009sRH-I5
 for linux-mediatek@lists.infradead.org; Mon, 03 Jan 2022 18:57:47 +0000
Received: by mail-lj1-x233.google.com with SMTP id u22so57072132lju.7
 for <linux-mediatek@lists.infradead.org>; Mon, 03 Jan 2022 10:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MMhWstZ09q6Cszqpd54WHd2qjsYduZF9Gp6qbEFoKEg=;
 b=CYPX06mYYQ2+cOhSoLGgV/rWQWqKCDXJJ9Iw+5ssEOfXIYPGzUj7v+4rgZWAs1vh9q
 5dxy3dqwPKsdPh8M3wwJtoHaqrBWQUbMh0A78AgqwE65oMtsmJWN3KeAWc/54E/cAKAr
 Af4lQCwRkQcSkAYn+OL6rnmExbIWZFSFNvDj7/ZAPCsUj/Rz2SXUD2thJ9cfusFoDFQr
 QGbuXD9mOwVVPjgcFZxbjvS/9OAAV9ib3h9azZpUnhYbKgMGsSu28tLpirCWUJjnPYR+
 xzbw3RM5EoVWXwBcFP6EaXw9vEwmSo8tRcQaG21dwkUF+pAPRLaunXbEMhCn4sM7w1Y6
 xpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MMhWstZ09q6Cszqpd54WHd2qjsYduZF9Gp6qbEFoKEg=;
 b=R289Bnr8bPxvRGbfj79HTtH5Z2C6tx0lJUoBdxPOJp8Gdjen5/M8xMz3XHr3EdhM3U
 Adcmpz6530wGuQT8x+KCPs6YeZjjcP1f/KboJIuWoNSDKmdyAwNP98DUH+pYLPNhz2uH
 R/OIYLLstGpYYsVXkHPFuXI1+SZkIOZ0K9Znb+36zeN/ALoXOJb81cxbDvrUGP0KXSGk
 piNZARaLRAGeIdVoIpVMwOeAGgKVMw8/6GbyfFhYgKXH2rTXOK+MdjlEEjWQiMDjNU1V
 SUjDg2mX4AakNc6aFu0gsbqgAuOXnEbhbXxB2yT+PfjCHwUUryW3I+jgOruUdzB0cFbN
 8ieQ==
X-Gm-Message-State: AOAM533BbEVCYejTxNrFZicDOM907a4RVdSvVQzmyP/NS97xgsZmhdcZ
 Tr9PpWX2UefmTBdfL5sWZ3nZP41xC1Ed3zqOgoVOPA==
X-Google-Smtp-Source: ABdhPJxESlTLF6vDjNiq9g3jYw19mn2gjb5KvscdlznFgTwwArdG339mJObBz8nFkUB+6pOx0s4aqg8oPJhp9SWaWGY=
X-Received: by 2002:a2e:9b96:: with SMTP id z22mr37955720lji.427.1641236262660; 
 Mon, 03 Jan 2022 10:57:42 -0800 (PST)
MIME-Version: 1.0
References: <20211217094104.24977-1-guangming.cao@mediatek.com>
 <20211227095102.6054-1-guangming.cao@mediatek.com>
In-Reply-To: <20211227095102.6054-1-guangming.cao@mediatek.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 3 Jan 2022 10:57:30 -0800
Message-ID: <CALAqxLVA4jUk-2o28RZobrPDUnuXfV1xN77Pt8Pu1o27V3aUQQ@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: dma-heap: Add a size check for allocation
To: guangming.cao@mediatek.com
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, 
 Laura Abbott <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "open list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>, 
 "open list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>, 
 "moderated list:DMA-BUF HEAPS FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Bo Song <bo.song@mediatek.com>, 
 Libo Kang <libo.kang@mediatek.com>, jianjiao zeng <jianjiao.zeng@mediatek.com>,
 mingyuan ma <mingyuan.ma@mediatek.com>, Yunfei Wang <yf.wang@mediatek.com>, 
 wsd_upstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_105745_607975_1485D4B8 
X-CRM114-Status: GOOD (  17.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 27, 2021 at 1:52 AM <guangming.cao@mediatek.com> wrote:
>
> From: Guangming <Guangming.Cao@mediatek.com>
>

Thanks for submitting this!

> Add a size check for allcation since the allocation size is

nit: "allocation" above.

> always less than the total DRAM size.

In general, it might be good to add more context to the commit message
to better answer *why* this change is needed rather than what the
change is doing.  ie: What negative thing happens without this change?
And so how does this change avoid or improve things?


> Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
> Signed-off-by: jianjiao zeng <jianjiao.zeng@mediatek.com>
> ---
> v2: 1. update size limitation as total_dram page size.
>     2. update commit message
> ---
>  drivers/dma-buf/dma-heap.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 56bf5ad01ad5..e39d2be98d69 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -55,6 +55,8 @@ static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
>         struct dma_buf *dmabuf;
>         int fd;
>
> +       if (len / PAGE_SIZE > totalram_pages())
> +               return -EINVAL;

This seems sane. I know ION used to have some 1/2 of memory cap to
avoid unnecessary memory pressure on crazy allocations.

Could you send again with an improved commit message?

thanks
-john

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
