Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CE0CE8D64
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 09:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eg0aw/JsSDa801QveFhK5iGJwVmtnC/bbMMJdc1DKK4=; b=BSkFUFecvlCRuuHCIOiOFvLd7P
	drp94Ft83yHV/OwSmW3Hu7zbr7PNeDqTck5iJolBHYQfQrCAkQqM/89QqpHAtlI0pbVxUleHQxfDR
	Woe3moNJmOd/oIWpzaBwvhbwR+8KBdNPqgypDXltPB+cA+W1de0F4aQPS4P89I33MR1cJUbb3DBi8
	2qNQgkxB9xayPfepryxGxUoltHl+8t7dekwCLddrA8cfI8qZnQgRaW302KXAJLqG/epToM15C2Zo8
	j7XwvYOGD2T1tu0MXNHl8X16yiNKe2YduQqmLzFUFXEJp6mdfBw8r3MOhTXwxWScGNqMtE8jsUfpd
	2rFatRUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srDiL-00000009xfh-3IoB;
	Thu, 19 Sep 2024 09:44:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srDga-00000009x6N-1ZlF;
	Thu, 19 Sep 2024 09:42:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BDBC35C57F2;
	Thu, 19 Sep 2024 09:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC7FC4CEC4;
	Thu, 19 Sep 2024 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726738970;
	bh=4mBPJ1/8ZHYMdSjeFFRdSDpez+20eaW5Qpk0ZxpyplE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WNvFUZlIeZCdtFKQ6JJfXg22qRTupBYLgnu8Znpgj7u9GzB9cb+oCuqkGaUUFXqZg
	 u3FLl6T6Dc6z14wmNEhM9sxXlKK/hnTLT7l41VAHBzniRkxJuoPGhWwQEozIgpKcqn
	 e0kS1YGW5Ob7pUpRgtI7MbGmwk2xVRYMaz+rj6ubfII71lcBL9BipnzLBPVQDxC0s+
	 6tii01Hw8+gMcMOU9sr4JhVfid9pQ8djWVDTMMnYh2tWVR7phPjsbZwqdPYB+N9hdB
	 cnocJ45KkOqJzUN/IKhO7vvYPYCr6HhVzm91jSPJ6/m++FZ0VQT1lV4F/UgLqGCLlU
	 /zO3c8TS5wTbA==
Message-ID: <894a3c2c-22f9-45b9-a82b-de7320066b42@kernel.org>
Date: Thu, 19 Sep 2024 11:42:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/2] page_pool: fix IOMMU crash when driver has
 already unbound
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Yunsheng Lin <linyunsheng@huawei.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 liuyonglong@huawei.com, fanghaiqing@huawei.com, zhangkun09@huawei.com,
 Robin Murphy <robin.murphy@arm.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, IOMMU <iommu@lists.linux.dev>,
 Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Saeed Mahameed
 <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>, imx@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, bpf@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mm@kvack.org
References: <20240918111826.863596-1-linyunsheng@huawei.com>
 <20240918111826.863596-3-linyunsheng@huawei.com>
 <CAC_iWjK=G7Oo5=pN2QunhasgDC6NyC1L+96jigX7u9ad+PbYng@mail.gmail.com>
Content-Language: en-US
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <CAC_iWjK=G7Oo5=pN2QunhasgDC6NyC1L+96jigX7u9ad+PbYng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_024252_561749_C6729E00 
X-CRM114-Status: GOOD (  12.34  )
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


On 18/09/2024 19.06, Ilias Apalodimas wrote:
>> In order not to do the dma unmmapping after driver has already
>> unbound and stall the unloading of the networking driver, add
>> the pool->items array to record all the pages including the ones
>> which are handed over to network stack, so the page_pool can
>> do the dma unmmapping for those pages when page_pool_destroy()
>> is called.
>
> So, I was thinking of a very similar idea. But what do you mean by
> "all"? The pages that are still in caches (slow or fast) of the pool
> will be unmapped during page_pool_destroy().

I really dislike this idea of having to keep track of all outstanding pages.

I liked Jakub's idea of keeping the netdev around for longer.

This is all related to destroying the struct device that have points to
the DMA engine, right?

Why don't we add an API that allow netdev to "give" struct device to
page_pool.  And then the page_poll will take over when we can safely
free the stuct device?

--Jesper

