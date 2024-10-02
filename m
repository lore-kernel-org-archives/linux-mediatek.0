Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF89CF319C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 08:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qT8AJdSAevn7Lon301IIUYaxahlZK6BFR3I/iQhyNk=; b=rhqtqsX4Vk2FIzxmXrWah44PkZ
	gTzBdDaZhM+xamnPQYvetzzMRpHBx+6ZvvioXAVJV/IOLgLUXSAoViI6fcoiuGSm6iTyhw7Irp5y6
	yL0EQzSLwjpQvbpnEQBOYdL3B55RP9n+zdGty+3pcLySH4NMY5FMMaiNQ6wqDZGQKaS6s9JJGb6UJ
	G4Zd9ODJMF/U7SP6TlFQnL97EltDvS8MvYxAzYYkO7VT3C+HL+vVQJtHU4cuek9VuNt7ZwClfjpo7
	LLBuh79YafNGNpE1gPp+etNTxaUtbUdqb28uqjADe4kqolMYppldDwQiaLdIINzC/6PloRgMbb/uA
	xqqrGV6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svueR-000000059an-0YPe;
	Wed, 02 Oct 2024 08:24:03 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svueO-000000059a5-1QjZ
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Oct 2024 08:24:01 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2e0b93157caso441547a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Oct 2024 01:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727857439; x=1728462239; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8qT8AJdSAevn7Lon301IIUYaxahlZK6BFR3I/iQhyNk=;
        b=rbIuFvR3arQ2ngndUlb2i4gnfiua3FM+Ku8Hw7hnpHWG4iKwoB9967Idm5gZF+DaEi
         Uur5bjgT8HKu41MsJCU10iiOacwAV7I727327450c4nRmwTOnU40ywPrZX1k4xdvxvan
         TJ7egXb4rU/8udIEI0l+M8OYYlUElYbgIZDlNgn7lUcyJc90JWKCL/04TOrpWjQqpki5
         85Ugy/RkXTSIssCTldha9wVFsVyOG42zmprZPmR4245BAfxA4q+4oRPpPc/ijJ+b9l1d
         phymRWwO42/RxwPfpzIbCV7d2uI59mo2gVuTMQpp4N/XaeeGH2i/9/4fmShAyzF7Wpb5
         4QHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727857439; x=1728462239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qT8AJdSAevn7Lon301IIUYaxahlZK6BFR3I/iQhyNk=;
        b=cOGkJLf8QwJf7l1AnWjJ7q/gLJqEcwSbbBCWegIGCMLOHxXiTTcHrWPihz0GIFFX21
         05lMrBPu4AaXF3i8iSBRSLhAXpUA4xDCSlx1QVOKz6VXVQFrV2TuoK4B/rKEj1BaKxFE
         nX+S5xXuA3Sq46uQLVxFrZ0nIP9pRowGtsu3wZ7BOqg6HbGOTLmWo7v4w1HIrYjLLlwg
         WWp6evICS86g70mjbGCBME9LeCWe1kvnMokUO6mM5Xyh2ufXAhkUW3SRQScqh/vbf20M
         MBQH6ztMJga2d7lPZ8GmP55guRGmigWK/ASvPWgwdOdiUmQll0fztT+aymKKqAN1Wf92
         BPhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnHA4dLKTaN2iGiur2ua4eATZDBK5Ews63RviWQz81ClDdC2cuKSNzrTL34FOgXJsJSjmIOuBla+v/peRvkA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyNk0H2LDHH2VryfEcGXubsxiOeBh4Xq/7WP/Bc/mN50+G/Eup
	fU5/XPqzyqLIMn2VeD7vxHB0tmSgXG7AS6bnUnZcztOedriwz7NiXu5WUBqxZdZa8VdALNABvcy
	e11nJS5qHAHnBZ6LGCins2dxBWkNfJ6cJEnQ7Ag==
X-Google-Smtp-Source: AGHT+IEr1vFU0a1kvwV4sZXMH05Rcdg/y0G4x0gieaTwktCZi4DvPvG3W8WrO/0W27YGf2bHaceIX2iLNO+x3PuzjLM=
X-Received: by 2002:a17:90a:cb8f:b0:2c9:36bf:ba6f with SMTP id
 98e67ed59e1d1-2e1851496c6mr3427473a91.3.1727857439139; Wed, 02 Oct 2024
 01:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240925075707.3970187-1-linyunsheng@huawei.com>
 <20240925075707.3970187-3-linyunsheng@huawei.com> <4968c2ec-5584-4a98-9782-143605117315@redhat.com>
 <33f23809-abec-4d39-ab80-839dc525a2e6@gmail.com> <4316fa2d-8dd8-44f2-b211-4b2ef3200d75@redhat.com>
In-Reply-To: <4316fa2d-8dd8-44f2-b211-4b2ef3200d75@redhat.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Wed, 2 Oct 2024 11:23:22 +0300
Message-ID: <CAC_iWjLBE9UY2wk_kKE=t=npRBF13HoLWODLUpQJ6F3P8sv4rw@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] page_pool: fix IOMMU crash when driver has
 already unbound
To: Paolo Abeni <pabeni@redhat.com>
Cc: Yunsheng Lin <yunshenglin0825@gmail.com>, Yunsheng Lin <linyunsheng@huawei.com>, 
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
	linux-mediatek@lists.infradead.org, linux-mm@kvack.org, davem@davemloft.net, 
	kuba@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_012400_443720_31ABAEE7 
X-CRM114-Status: GOOD (  18.89  )
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

Hi Paolo,

On Wed, 2 Oct 2024 at 10:38, Paolo Abeni <pabeni@redhat.com> wrote:
>
> Hi,
>
> On 10/2/24 04:34, Yunsheng Lin wrote:
> > On 10/1/2024 9:32 PM, Paolo Abeni wrote:
> >> Is the problem only tied to VFs drivers? It's a pity all the page_pool
> >> users will have to pay a bill for it...
> >
> > I am afraid it is not only tied to VFs drivers, as:
> > attempting DMA unmaps after the driver has already unbound may leak
> > resources or at worst corrupt memory.
> >
> > Unloading PFs driver might cause the above problems too, I guess the
> > probability of crashing is low for the PF as PF can not be disable
> > unless it can be hot-unplug'ed, but the probability of leaking resources
> > behind the dma mapping might be similar.
>
> Out of sheer ignorance, why/how the refcount acquired by the page pool
> on the device does not prevent unloading?
>
> I fear the performance impact could be very high: AFICS, if the item
> array become fragmented, insertion will take linar time, with the quite
> large item_count/pool size. If so, it looks like a no-go.

It would be could if someone could test that. I'll look around in case
we have any test machines with cards that run on page pool.

>
> I fear we should consider blocking the device removal until all the
> pages are returned/unmapped ?!? (I hope that could be easier/faster)

Jakub send an RFC doing that [0]. Yes, this is far far simpler and
does not affect performance, but aren't we implicitly breaking
userspace?

[0] https://lore.kernel.org/netdev/20240806151618.1373008-1-kuba@kernel.org/

Thanks
/Ilias
>
> /P
>

