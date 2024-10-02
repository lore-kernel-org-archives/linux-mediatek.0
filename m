Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AA4CF319B
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 06:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wi2knaZL4xgHJFaFdtzBXqIWLSuRG81LD3CTPdMJ4G8=; b=JTBcJ/YsfIUyL85XiQZMIUWSD1
	B1Au1xjsyM5R9wOX4Nyss/AXmO6XfCOeboGNK4ikQlnXcznsl9hVE9QbttGeLpUucVPlnJHnbWL4g
	W2z7NnKynAKcrhzGMbiXcijiI4pcWCd9Ncx9WLz1pfgysUq1AMVxwgduQsWO2IjYAWwsLzYI5YPyX
	HmguacFsw3tBkE1ufbsYaoDgqOm2+VX7qQqKk//lk+L13CzITjMFDaotEFZfjY7Toqcfr3F4z8NBI
	1QIpTW3MvGlQUMKbWnKCwP9gA9RD4CE7ozl0Yds4k5eH15aaNn7ADXohp3HMfyGmzhnMFPUIUevxH
	cV5LJFkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svtDq-00000004yCN-03WR;
	Wed, 02 Oct 2024 06:52:30 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svtDm-00000004yBZ-2J64
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Oct 2024 06:52:27 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7db54269325so4868625a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Oct 2024 23:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727851945; x=1728456745; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wi2knaZL4xgHJFaFdtzBXqIWLSuRG81LD3CTPdMJ4G8=;
        b=blEJzmHnSrxnT7xRCVNVNX17d7t/yVcRXSYqyLqOd8KhWBcVj8uXz4kYuhsvMNvK9C
         /TSVKHq8gt140k4dbKx0k3oNFISAcK5rquUrEgfpJN8sl9/v4dCcxM7VT6NWwl9MKsLL
         76VG4KH7SSyISjLcyDwyYUx5hcUIcJ0rPIVxT2xIluXXH4rW7jhxAP/B4ZL/97mbC1m7
         yVrx3ETI+3rr1wdegnFe87Ptt5YIn13G3iju3uWNr7d8XcCiGTarhZTN2leTrzE2NHiK
         OJS++xZ/XVKF9RVOnNA3wHeLTqlMyMDgROTZcP55kOhtA2QFSb9oDOXzaJa/jGWWdpsX
         5VFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727851945; x=1728456745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wi2knaZL4xgHJFaFdtzBXqIWLSuRG81LD3CTPdMJ4G8=;
        b=EoTF8t+jwWvRC16Qc0rGoqeP0x5S1EZjOZu1kaS2yD6R28ieKl6mHvZgo/IA9tePZN
         V48cwKnK/lWFWrklwqnF3hz6U221lJvK/sER1XBqD32uL2sNIIrGm6uIY0AkkdCqrVSc
         9DRlsrgpDYwTJtnGMpFtDtjBik2fTZiQjCR2nTqLJmZPQFJBpkODEae7Irys85uqnTf3
         h0Xvbffoq5/xuzu780UXXXgpTv8qseyJtfaSJpJYKrSEwpc4s45uQadmf4++cW0XENWh
         VFBRHYMUXuqh2Ve064pIZiXdUBF5tEM0h9+QoQWgS8T/wYiB0a+MobhjBVeUW+d9wV2v
         u0Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUPbrT40ImqZGJQHsCDdL1umUynjksBnsJRTFsVTa6E3UlLbqzxJS1Ib1uiwYh+ZZrkrIIv+xu583SmEoRkPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxsX/p0VZOaaG7gH0CP3V09Rrmp49V39uoGDT+oBSnQFwSDjeL
	Ba8jApX0iAoCKZC8JGc6r6o8KBfgl0xyGBLWj0fx/1zChemo4p7Mt2eQUZ5MC7HNYrxI0UCzC7Q
	Cze9BJi5hV8T0oXLs3OvT96hVtDKscRh7gAHGuA==
X-Google-Smtp-Source: AGHT+IHsypqnvHxqefjiDxYFDz2akYzDsFoGU6PLh+7312onUDhEMOGndUNDmbbTnJmbGIeOeR17h1E7o2px85taLvw=
X-Received: by 2002:a05:6a21:2d8b:b0:1d5:10c3:af5a with SMTP id
 adf61e73a8af0-1d5e2d3df25mr3361839637.47.1727851945585; Tue, 01 Oct 2024
 23:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240925075707.3970187-1-linyunsheng@huawei.com>
 <20240925075707.3970187-3-linyunsheng@huawei.com> <4968c2ec-5584-4a98-9782-143605117315@redhat.com>
 <CAC_iWjKHofqDrp+jOO_QTp_8Op=KeE_jjhjsDUxjRa4vnHYJmQ@mail.gmail.com>
In-Reply-To: <CAC_iWjKHofqDrp+jOO_QTp_8Op=KeE_jjhjsDUxjRa4vnHYJmQ@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Wed, 2 Oct 2024 09:51:49 +0300
Message-ID: <CAC_iWjJXWgt9TdBSYGkc=htyeS=VAago5wqXzBgX_Mun76Z42g@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] page_pool: fix IOMMU crash when driver has
 already unbound
To: Paolo Abeni <pabeni@redhat.com>
Cc: Yunsheng Lin <linyunsheng@huawei.com>, davem@davemloft.net, kuba@kernel.org, 
	liuyonglong@huawei.com, fanghaiqing@huawei.com, zhangkun09@huawei.com, 
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
	Andrew Morton <akpm@linux-foundation.org>, imx@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	bpf@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_235226_619752_632AE5D6 
X-CRM114-Status: GOOD (  37.27  )
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

On Wed, 2 Oct 2024 at 09:46, Ilias Apalodimas
<ilias.apalodimas@linaro.org> wrote:
>
> Hi Paolo,
>
> Thanks for taking the time.
>
> On Tue, 1 Oct 2024 at 16:32, Paolo Abeni <pabeni@redhat.com> wrote:
> >
> > On 9/25/24 09:57, Yunsheng Lin wrote:
> > > Networking driver with page_pool support may hand over page
> > > still with dma mapping to network stack and try to reuse that
> > > page after network stack is done with it and passes it back
> > > to page_pool to avoid the penalty of dma mapping/unmapping.
> > > With all the caching in the network stack, some pages may be
> > > held in the network stack without returning to the page_pool
> > > soon enough, and with VF disable causing the driver unbound,
> > > the page_pool does not stop the driver from doing it's
> > > unbounding work, instead page_pool uses workqueue to check
> > > if there is some pages coming back from the network stack
> > > periodically, if there is any, it will do the dma unmmapping
> > > related cleanup work.
> > >
> > > As mentioned in [1], attempting DMA unmaps after the driver
> > > has already unbound may leak resources or at worst corrupt
> > > memory. Fundamentally, the page pool code cannot allow DMA
> > > mappings to outlive the driver they belong to.
> > >
> > > Currently it seems there are at least two cases that the page
> > > is not released fast enough causing dma unmmapping done after
> > > driver has already unbound:
> > > 1. ipv4 packet defragmentation timeout: this seems to cause
> > >     delay up to 30 secs.
> > > 2. skb_defer_free_flush(): this may cause infinite delay if
> > >     there is no triggering for net_rx_action().
> > >
> > > In order not to do the dma unmmapping after driver has already
> > > unbound and stall the unloading of the networking driver, add
> > > the pool->items array to record all the pages including the ones
> > > which are handed over to network stack, so the page_pool can
> > > do the dma unmmapping for those pages when page_pool_destroy()
> > > is called. As the pool->items need to be large enough to avoid
> > > performance degradation, add a 'item_full' stat to indicate the
> > > allocation failure due to unavailability of pool->items.
> >
> > This looks really invasive, with room for potentially large performance
> > regressions or worse. At very least it does not look suitable for net.
>
> Perhaps, and you are right we need to measure performance before
> pulling it but...
>
> >
> > Is the problem only tied to VFs drivers? It's a pity all the page_pool
> > users will have to pay a bill for it...
>
> It's not. The problem happens when an SKB has been scheduled for
> recycling and has already been mapped via page_pool. If the driver
> disappears in the meantime,

Apologies, this wasn't correct. It's the device that has to disappear
not the driver

> page_pool will free all the packets it
> holds in its private rings (both slow and fast), but is not in control
> of the SKB anymore. So any packets coming back for recycling *after*
> that point cannot unmap memory properly.
>
> As discussed this can either lead to memory corruption and resource
> leaking, or worse as seen in the bug report panics. I am fine with
> this going into -next, but it really is a bugfix, although I am not
> 100% sure that the Fixes: tag in the current patch is correct.
>
> Thanks
> /Ilias
> >
> > /P
> >

