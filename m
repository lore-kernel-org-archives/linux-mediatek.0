Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36959CF3198
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 06:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=julty6rnHcSXHSDPw3px62HgLzdn2IBXQjTC66JT5PQ=; b=PpOLqP+JzMHZun5aKQ9hAKDL4a
	SlUNYTxef7naFnxJ9OOQ7E7Q7bUPY9mc6dXi/kiLOB1XGyyKmuRs5tWb0FAt47Azu+X2F7ol4AjgE
	qNKrnq4zn/4CbES+mK3nMP8r7JrcsIsSmnsIroaUpJD9J/tSNOK7SeitbD8ibDZBUyf39SOSuCxou
	CVbry1qxUT4Q054ayezX3v2RLfPmJtKKrZS6OuJzPWZgN5TDDwSk8TTePNuWL6AP9CCiWkUvKCHUz
	CxaZjGkMpQfePmAoPSw7coDOyTr6YzLwSZ/dqW+XJ7RTU49HSrf2rTYe0Evcmqvdff+6juh8JGTrL
	7iFkxmNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svt9Y-00000004xok-0z9e;
	Wed, 02 Oct 2024 06:48:04 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svt8I-00000004xca-1RpR
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Oct 2024 06:46:47 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20b49ee353cso46865505ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Oct 2024 23:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727851605; x=1728456405; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=julty6rnHcSXHSDPw3px62HgLzdn2IBXQjTC66JT5PQ=;
        b=lpfSmZ3ASHGai0LsU00hy9FtVNo4mxaC6CvmRcXx+amifj7+ygfmWPmMPaGhfQgsb1
         MUnkHmg54b6gijTXohim1NJPij0w95xH6YATdF/6abb/meXVAXfkswWigcpEMplxs9l6
         MFZbcH+3WbI/htRjRczNyOEE1EGOp00AdE2UVabAKYm6bSCnPm8E9BoCsG2a+Z+L3av7
         PWFwGdU/mixwcDpa6B8PRbzON9aIvqjeWKkKUlG56byiZEf/psk03pF1CW4K6gb10ep4
         SbgezHNrQn2l+IAtWIJnTx5IOzwwncimGkaTM89YHm6s36dMimdfImSkKVCl0p4Ell54
         awgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727851605; x=1728456405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=julty6rnHcSXHSDPw3px62HgLzdn2IBXQjTC66JT5PQ=;
        b=Lzf/NUJJTmgUCiVVWoU/nzQykeqNviW5ZJPvV62RD4LhDBL3LBNmif5S5zoNFNtFk6
         gjDrR4lwdeTrm214ZhLpL2S/gkkfD0uyPcWtpOWZAwaTFFQ8JCM5WZtk92USZfBByen1
         8n593UKVhFoMj/fKdsEwAeDVPE6/4w7IBrKvuM7QUU28OfJsPwAJGhB9WjgK00ZmEX3E
         0wUeAXROFtjy884Z5xsslnpLsm0Vq3uu3ncHdaz7zDdU7oS6RoAWAFbwWBqrglSum6NK
         40iAZycgzMfsX/7qu8xcZTQplaCVAVETvO76LZhs3M4SDRy7dk9hg/Hmdlh70oYp84uf
         GvLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDR41K1nNYZIAPOB5jPBtvM+dMUW2PgKgUaqBS8JVO6A4o8O3zo5FmHHA2eaIqRETlAggrcpXLZcPAft/I9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQEl/aoCNcoF+JDSGceCr1zJt6IkIMj7BH1IWzXk5/E5Y1rFFv
	ZgeoyxiJhbZuCk2N2lHQeVZhOvTAGY6pG4VIgzTHm7DTtLNJLseJsbhLxmm41XYzBxcYuSccyTr
	BWTNyl8d+6Z1yY82MF4DDJvRsiaC22OQQryvJ9Q==
X-Google-Smtp-Source: AGHT+IFQFeN+13hsSVg8HfZx3v0JFKL/2OojczRKBuzwXMASAbyeLF4dgYHBH+F1NmuIXohzp3j20fi5PB1R6+vYJtE=
X-Received: by 2002:a17:902:d505:b0:205:4e4a:72d9 with SMTP id
 d9443c01a7336-20bc59efb2emr41817915ad.7.1727851604719; Tue, 01 Oct 2024
 23:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240925075707.3970187-1-linyunsheng@huawei.com>
 <20240925075707.3970187-3-linyunsheng@huawei.com> <4968c2ec-5584-4a98-9782-143605117315@redhat.com>
In-Reply-To: <4968c2ec-5584-4a98-9782-143605117315@redhat.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Wed, 2 Oct 2024 09:46:08 +0300
Message-ID: <CAC_iWjKHofqDrp+jOO_QTp_8Op=KeE_jjhjsDUxjRa4vnHYJmQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241001_234646_425382_11032E49 
X-CRM114-Status: GOOD (  30.43  )
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

Thanks for taking the time.

On Tue, 1 Oct 2024 at 16:32, Paolo Abeni <pabeni@redhat.com> wrote:
>
> On 9/25/24 09:57, Yunsheng Lin wrote:
> > Networking driver with page_pool support may hand over page
> > still with dma mapping to network stack and try to reuse that
> > page after network stack is done with it and passes it back
> > to page_pool to avoid the penalty of dma mapping/unmapping.
> > With all the caching in the network stack, some pages may be
> > held in the network stack without returning to the page_pool
> > soon enough, and with VF disable causing the driver unbound,
> > the page_pool does not stop the driver from doing it's
> > unbounding work, instead page_pool uses workqueue to check
> > if there is some pages coming back from the network stack
> > periodically, if there is any, it will do the dma unmmapping
> > related cleanup work.
> >
> > As mentioned in [1], attempting DMA unmaps after the driver
> > has already unbound may leak resources or at worst corrupt
> > memory. Fundamentally, the page pool code cannot allow DMA
> > mappings to outlive the driver they belong to.
> >
> > Currently it seems there are at least two cases that the page
> > is not released fast enough causing dma unmmapping done after
> > driver has already unbound:
> > 1. ipv4 packet defragmentation timeout: this seems to cause
> >     delay up to 30 secs.
> > 2. skb_defer_free_flush(): this may cause infinite delay if
> >     there is no triggering for net_rx_action().
> >
> > In order not to do the dma unmmapping after driver has already
> > unbound and stall the unloading of the networking driver, add
> > the pool->items array to record all the pages including the ones
> > which are handed over to network stack, so the page_pool can
> > do the dma unmmapping for those pages when page_pool_destroy()
> > is called. As the pool->items need to be large enough to avoid
> > performance degradation, add a 'item_full' stat to indicate the
> > allocation failure due to unavailability of pool->items.
>
> This looks really invasive, with room for potentially large performance
> regressions or worse. At very least it does not look suitable for net.

Perhaps, and you are right we need to measure performance before
pulling it but...

>
> Is the problem only tied to VFs drivers? It's a pity all the page_pool
> users will have to pay a bill for it...

It's not. The problem happens when an SKB has been scheduled for
recycling and has already been mapped via page_pool. If the driver
disappears in the meantime, page_pool will free all the packets it
holds in its private rings (both slow and fast), but is not in control
of the SKB anymore. So any packets coming back for recycling *after*
that point cannot unmap memory properly.

As discussed this can either lead to memory corruption and resource
leaking, or worse as seen in the bug report panics. I am fine with
this going into -next, but it really is a bugfix, although I am not
100% sure that the Fixes: tag in the current patch is correct.

Thanks
/Ilias
>
> /P
>

