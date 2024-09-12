Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE8EEED609
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 14:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwLc+XjyWhYA8wehQi12J7lKOf62muLl4QoZfdwa35k=; b=qrW62VJzs3HYpYxARJHj+rjI04
	blGQ+plQMhIfZ2bYvrBnZpdC1ZUsk9QiCM5clJEFI7DT1qJ9pNjMYS42JlnlBchBYk9Qlf+93ODIJ
	HjSCSY+pmAgPkoN4p5QB2e5qOwu9w3iCqQua/yLxP9njkVnJfxFep68D+WkNZ+DAd1AK1xlt5C2+D
	JidmsZfGtu599qluaAaCbyaYociSFHZyNkovGlIaDF+Nc7Dvmg2SHKM7qF91PSbzrsvlVlKCHNrLa
	Bi8OF4JPYgYTydvmUQev+B1pEPdfGETj+lMvkQPbPLGBE5QApEO1MBeeXfmZ6c5DKVWXgrG7Ua+BD
	rFgH9oeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sokmY-0000000DLFl-0Ef9;
	Thu, 12 Sep 2024 14:26:50 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soklQ-0000000DKz5-0jqx
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Sep 2024 14:25:41 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4582fa01090so281321cf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Sep 2024 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726151138; x=1726755938; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwLc+XjyWhYA8wehQi12J7lKOf62muLl4QoZfdwa35k=;
        b=4IanzZCTdqxlWpIac4V9/raZ6Y4RUlrYyH5yQjXAENRYeYChplhOR4BQKKcJaFOqa3
         5gr5JAyUj6L362TIR8cGBsGRWiPPJCpG40V8KDXL7YgysPlfK0jAgfQdzmtbju3WZOpU
         bm+85Hm3cXSCQZBG9S0OlJPMatQ594oBbToH0/FyuM3Ax2GdxkREsaAwFi9aQVSwaFFq
         hXjOwSqjqvw0UfYYSl/RwNasI2eogMEgWCQKDoqRBQw3V81Kg1w0gqNa5yDvD3WKbbjH
         rMe+wLRggpMd/hG4sGcDiSJoVO9zk4V7p1hObTDw6XPHypvGEnf4e8QdyaAciJ6Vu69v
         xpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726151138; x=1726755938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwLc+XjyWhYA8wehQi12J7lKOf62muLl4QoZfdwa35k=;
        b=Q8Ymsnk3TOU09Rhk3K6nZRUecLC6KUi6ea/CQ3JB0QxjchaIRrzt10h/PEJUNXhu+O
         iBIy3g5zmiGZZ7DMrsqliKPnFIHe5/39/8FAfeWG27CfCL69kB73Hjo/4b0SrI46Kg/W
         nIOR71APSa/aZoiGBxUvlS0nVZIkZIpJeb1/HvGaZP++VgGtJr4bB/AZNvmb1jEzAQJj
         jNXEqxWA4G6hmpOLTkMov63yctEKco9Uzqo+gThzUiEdgIELGyv3Gy7oiFNPhFLKXdKh
         1vxGd6P6r1T8iup/AAP2yqVg8QsXN5V5N68vUCOG6k/GxReaQG9tG7v8adhPNKJf2hdn
         34XA==
X-Forwarded-Encrypted: i=1; AJvYcCXFVSEoTIa2MqAw/khZXzlQ1GBKoZc5GUnMWNHmV2/FgRRF1Sdnu/WU6DPzr+gt0jjQ5WRUyNnAOZj86e4rhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzM+MHCbHrT8LWRgSc/v3RDg7pWO81sEiRl5VbvIrzml9NBFK5e
	Vxd18JCcYxoQ3OY/vrbgCHgwL+EbwjRug95dbh0tb5c6tsIAm99SSpbNvdH9xUv085gGgLLv7mV
	7v2MAn9r5M7cYw3bgJ17ftWBE6Abfv06UHxEu
X-Google-Smtp-Source: AGHT+IFyltmncYSZz561uPWQsvsGb5DFmLf+mGb3Vo6WS5NNhJE43ms4WKqkq6D4X3fyD6kxk1+1bYCNn1kURkFiU6A=
X-Received: by 2002:a05:622a:202:b0:456:7f34:f560 with SMTP id
 d75a77b69052e-458608812bdmr4020001cf.22.1726151137360; Thu, 12 Sep 2024
 07:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240912124514.2329991-1-linyunsheng@huawei.com> <20240912124514.2329991-3-linyunsheng@huawei.com>
In-Reply-To: <20240912124514.2329991-3-linyunsheng@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 12 Sep 2024 07:25:23 -0700
Message-ID: <CAHS8izPc8fy08mL1RJtnxiOvTx=Uk037Q5SKobC80jQocEKMJQ@mail.gmail.com>
Subject: Re: [RFC 2/2] page_pool: fix IOMMU crash when driver has already unbound
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	liuyonglong@huawei.com, fanghaiqing@huawei.com, 
	Robin Murphy <robin.murphy@arm.com>, Alexander Duyck <alexander.duyck@gmail.com>, 
	IOMMU <iommu@lists.linux.dev>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	imx@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, bpf@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_072540_226411_95CA74EC 
X-CRM114-Status: GOOD (  31.64  )
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

On Thu, Sep 12, 2024 at 5:51=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.co=
m> wrote:
>
> Networking driver with page_pool support may hand over page
> still with dma mapping to network stack and try to reuse that
> page after network stack is done with it and passes it back
> to page_pool to avoid the penalty of dma mapping/unmapping.
> With all the caching in the network stack, some pages may be
> held in the network stack without returning to the page_pool
> soon enough, and with VF disable causing the driver unbound,
> the page_pool does not stop the driver from doing it's
> unbounding work, instead page_pool uses workqueue to check
> if there is some pages coming back from the network stack
> periodically, if there is any, it will do the dma unmmapping
> related cleanup work.
>
> As mentioned in [1], attempting DMA unmaps after the driver
> has already unbound may leak resources or at worst corrupt
> memory. Fundamentally, the page pool code cannot allow DMA
> mappings to outlive the driver they belong to.
>
> Currently it seems there are at least two cases that the page
> is not released fast enough causing dma unmmapping done after
> driver has already unbound:
> 1. ipv4 packet defragmentation timeout: this seems to cause
>    delay up to 30 secs:
>
> 2. skb_defer_free_flush(): this may cause infinite delay if
>    there is no triggering for net_rx_action().
>
> In order not to do the dma unmmapping after driver has already
> unbound and stall the unloading of the networking driver, add
> the pool->items array to record all the pages including the ones
> which are handed over to network stack, so the page_pool can
> do the dma unmmapping for those pages when page_pool_destroy()
> is called.
>

The approach in this patch is a bit complicated. I wonder if there is
something simpler that we can do. From reading the thread, it seems
the issue is that in __page_pool_release_page_dma we're calling
dma_unmap_page_attrs() on a pool->p.dev that has been deleted via
device_del, right?

Why not consider pool->p.dev unusable if pool->destroy_cnt > 0? I.e.
in __page_pool_release_page_dma, we can skip dma_unmap_page_attrs() if
destry_cnt > 0?

More generally, probably any use of pool->p.dev may be invalid if
page_pool_destroy has been called. The call sites can be scrubbed for
latent bugs.

The hard part is handling the concurrency. I'm not so sure we can fix
this without introducing some synchronization between the
page_pool_destroy seeing the device go away and the code paths using
the device. Are these being called from the fast paths? Jespers
benchmark can tell for sure if there is any impact on the fast path.

> Note, the devmem patchset seems to make the bug harder to fix
> and to backport too, this patch does not consider fixing the
> case for devmem yet.
>

FWIW from a quick look I did not see anything in this patch that is
extremely hard to port to netmem. AFAICT the issue is that you skipped
changing page_pool to page_pool_items in net_iov. Once that is done, I
think the rest should be straightforward.

--=20
Thanks,
Mina

