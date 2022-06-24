Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB81CC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 16:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vaOGSSaS2BSeF0eCGOBdnJBKLvorCKIGcPWI6JfN0M=; b=jI9GgBN3sstLNr0Pw1NjtOZ4eN
	NecxRHbOeQUl3ELBEz/PEwc7ACXzChj4DyLcVv56Y5cz6Ij1NUwZgdtIqsIOUf7Y8ge+xyqfohj72
	FEHB5OZdi4SsmgfzeioYQsTTy51FJy4TEiD9Gy7nGMiDzg7Ty4GeShqbQDeGjo0wTTmpkki4cn9yY
	uFMA4cU5iVUZIB94Bk/9nSIh21mPxLkyYVwOSzgBdiWPwcVj2gdYiumppsJ8b4U2Fw4E//joUvcbY
	BR87zM9nEQkeMDFqfELNDW1mjEDXWuy5v9gNFodU3YqfFDCcPnW10qnpWnui5TDQ5CVhoTg+/XMkj
	G+ctQXfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mU9-0033rK-7F; Fri, 24 Jun 2022 16:48:45 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mU5-0033pR-Mb
	for linux-mediatek@lists.infradead.org; Fri, 24 Jun 2022 16:48:43 +0000
Received: by mail-pl1-x635.google.com with SMTP id a17so2590950pls.6
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jun 2022 09:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7vaOGSSaS2BSeF0eCGOBdnJBKLvorCKIGcPWI6JfN0M=;
        b=y/IbSUpXpt2dGe1jDFLOsSSUkh1YBHRUnJmUb8sFZZm5NLih02wnUPXYt5zjjKeypb
         5Ffpu8piazgJRDNC42kW6T6j1S8K0mebrE7N0RwQPnfu+w8dFmATyybUe8Li6Ax2Pbsq
         6i0tJIm6mnulrZuaP8LlD+bk0IDIh7ztPilxJLZ2r82xW5PSaATQjSK6ypPckDxrjzPQ
         1bJK58MfXrbD6UbHeCtj6QwHeNzd3TOhfuFAniLjlYZ5xRUrZA93EYYGbms/FfDtCwRZ
         fD3/L6ZsvUORcp5roVkzX0bDUqQJrvcXD+t6BkwOR2kijU8lP3ghEMss2dpRQ7RGgeA7
         3xtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7vaOGSSaS2BSeF0eCGOBdnJBKLvorCKIGcPWI6JfN0M=;
        b=TxY7AlVh4rQ22LQ6UG5qrpHAqt3DRhQo4EcDl1L9YbXIPbsLZSJTi4DJMmWIRY6KgI
         3gXfrLI5LMk0FPXAJCtKva1TBPrWAnZOJBts3mffOuQnHdDKcmUw4L/hT/KdiptfJg4J
         fBvTfxGOPejVY8rm79KfDY1y9Vyd3nP9/gI+Gsf+SOYO11IFY9p0PljasJkd4Z4hxYM3
         eagLpLv/TR/tZszLq5erpMEQNLoJzKsXN+g4264IW7wVtLOhRO0JTbyZWNaLJSjdVAcc
         bc72botYTPOD5D3Nb55NqeERH7Jd6l4Pj2AnmO9j24qZ1cSZcKvsJN2b6q7CtfGqSi7y
         v2tQ==
X-Gm-Message-State: AJIora8Zkt9f1C7D6OddW4F90cLIIN17e23PaV+IiXUYx6AwJhhpS8Hf
	hIxgIlvdcXxZtQNP3CcD4oPx5w==
X-Google-Smtp-Source: AGRyM1sMTKHk1czlE8w1vn1du6WoyJEAfH19Gy+e0hnTwhXskgrBEnEhnbwsZHR1W2asFkceOKtghg==
X-Received: by 2002:a17:902:e8d7:b0:168:e2da:893c with SMTP id v23-20020a170902e8d700b00168e2da893cmr45709631plg.152.1656089318365;
        Fri, 24 Jun 2022 09:48:38 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902f70900b001663cf001besm2033477plo.174.2022.06.24.09.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 09:48:36 -0700 (PDT)
Date: Fri, 24 Jun 2022 10:48:34 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: bjorn.andersson@linaro.org, robin.murphy@arm.com, hch@lst.de,
	m.szyprowski@samsung.com, matthias.bgg@gmail.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, yj.chiang@mediatek.com
Subject: Re: [PATCH 0/2] dma-mapping, remoteproc: Fix dma_mem leak after
 rproc_shutdown
Message-ID: <20220624164834.GA1736477@p14s>
References: <20220422062436.14384-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422062436.14384-1-mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_094841_859012_AFB4462E 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

On Fri, Apr 22, 2022 at 02:24:34PM +0800, Mark-PK Tsai wrote:
> Release dma coherent memory before rvdev is free in
> rproc_rvdev_release().
> 
> Below is the kmemleak report:
> unreferenced object 0xffffff8051c1a980 (size 128):
>   comm "sh", pid 4895, jiffies 4295026604 (age 15481.896s)
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<000000003a0f3ec0>] dma_declare_coherent_memory+0x44/0x11c
>     [<00000000ad243164>] rproc_add_virtio_dev+0xb8/0x20c
>     [<00000000d219c8e9>] rproc_vdev_do_start+0x18/0x24
>     [<00000000e694b468>] rproc_start+0x22c/0x3e0
>     [<000000000b938941>] rproc_boot+0x4a4/0x860
>     [<000000003c4dc532>] state_store.52856+0x10c/0x1b8
>     [<00000000df2297ac>] dev_attr_store+0x34/0x84
>     [<0000000083a53bdb>] sysfs_kf_write+0x60/0xbc
>     [<000000008ed830df>] kernfs_fop_write+0x198/0x458
>     [<0000000072b9ad06>] __vfs_write+0x50/0x210
>     [<00000000377d7469>] vfs_write+0xe4/0x1a8
>     [<00000000c3fc594e>] ksys_write+0x78/0x144
>     [<000000009aef6f4b>] __arm64_sys_write+0x1c/0x28
>     [<0000000003496a98>] el0_svc_common+0xc8/0x22c
>     [<00000000ea3fe7a3>] el0_svc_compat_handler+0x1c/0x28
>     [<00000000d1a85a4e>] el0_svc_compat+0x8/0x24
> 
> Mark-PK Tsai (2):
>   dma-mapping: Add dma_release_coherent_memory to DMA API
>   remoteproc: Fix dma_mem leak after rproc_shutdown
> 
>  drivers/remoteproc/remoteproc_core.c |  1 +
>  include/linux/dma-map-ops.h          |  3 +++
>  kernel/dma/coherent.c                | 10 ++++++++--
>  3 files changed, 12 insertions(+), 2 deletions(-)

Applied.

Thanks,
Mathieu

> 
> -- 
> 2.18.0
> 

