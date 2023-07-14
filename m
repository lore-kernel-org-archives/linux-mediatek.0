Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FC6EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqbidthDP+5Vjtr0JCUWN4Dkfi/WO6xlD0Rgcx74nhk=; b=kwdwVd/ybweBeDdo6I6t71KK6k
	01Y7dAyf/LiwSXjuA39ps4ZMIHIYO7BSHEGg6ZIqBpa778rk1TESvE40HmzdbT5sZoTJOm7qq6TbY
	mtn8F/Fl8pcC+J/QpObwkvE2NTzpL+a9bhQBrOh/tCp4tILz3AgzVcbmJI3nIOsEpebFBylgNcB+h
	jZAr/mgHxC2I8bPnRiMIoVszqnK6dz89b7AAa38ohiohVaYYNfFLjedugijmXvE1kkexlhGd0a07k
	kPf4twaruaDDZ0VjaaB4XgMc+TBI0DQ/Gd1nxY2uNnDUmdptvyfKXNMEGCTx3NXNWeMMTbx4j3Orz
	hciRodmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKKZK-006V8k-3D;
	Fri, 14 Jul 2023 15:18:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKKZH-006V7y-2c;
	Fri, 14 Jul 2023 15:18:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 131B661D4A;
	Fri, 14 Jul 2023 15:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F26C433C8;
	Fri, 14 Jul 2023 15:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689347929;
	bh=GHCoMZ/UoQEwvyyLj6obOxuoQTyZeeHkQU5SH5+3Uxs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lrmyl9F8q9Rq2thyyQq0ZVZLcPhb4o/lwoL+z/+ADAjtZdUKdfTZTiunxbU+4kdKK
	 0Da5r0Eqg/61a4BCR/TFnukrBg1hJ7hEXuVYybrFim2RlP3R8UrA4w+0ROUPMcdX9f
	 1+xUb26QVvO2B/rhetJRb87Q5Q3VURFnqoLzqkAn2E0hFpF9NPAg9uj0EQdClX9hb6
	 C21oI9cSaPoxbm5sZLfsENXUBliAPZVEL1tx/P1ZxBiNTYRTv23FAc5qinpPFMLPDV
	 Vf3K0PJg8Ga+KB1Oi1jU7cRPCbfbwS3CAx+M2LAUNJAog2sZeKoQb8gvPpvQiiLyz9
	 al4TZNje6hjmA==
Message-ID: <9cf3ce79-2d5e-090d-c83e-0c359ace1cb9@kernel.org>
Date: Fri, 14 Jul 2023 09:18:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: Memory providers multiplexing (Was: [PATCH net-next v4 4/5]
 page_pool: remove PP_FLAG_PAGE_FRAG flag)
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Hari Ramakrishnan <rharix@google.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Samiullah Khawaja <skhawaja@google.com>,
 Willem de Bruijn <willemb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Christoph Hellwig <hch@lst.de>, John Hubbard <jhubbard@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Jesper Dangaard Brouer <jbrouer@redhat.com>, brouer@redhat.com,
 Alexander Duyck <alexander.duyck@gmail.com>,
 Yunsheng Lin <linyunsheng@huawei.com>, davem@davemloft.net,
 pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lorenzo Bianconi <lorenzo@kernel.org>, Yisen Zhuang
 <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
 Eric Dumazet <edumazet@google.com>, Sunil Goutham <sgoutham@marvell.com>,
 Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep
 <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-rdma@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Jonathan Lemon
 <jonathan.lemon@gmail.com>, logang@deltatee.com,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20230710215906.49514550@kernel.org>
 <20230711050445.GA19323@lst.de> <ZK1FbjG+VP/zxfO1@ziepe.ca>
 <20230711090047.37d7fe06@kernel.org>
 <04187826-8dad-d17b-2469-2837bafd3cd5@kernel.org>
 <20230711093224.1bf30ed5@kernel.org>
 <CAHS8izNHkLF0OowU=p=mSNZss700HKAzv1Oxqu2bvvfX_HxttA@mail.gmail.com>
 <20230711133915.03482fdc@kernel.org>
 <2263ae79-690e-8a4d-fca2-31aacc5c9bc6@kernel.org>
 <CAHS8izP=k8CqUZk7bGUx4ctm4m2kRC2MyEJv+N4+b0cHVkTQmA@mail.gmail.com>
 <ZK6kOBl4EgyYPtaD@ziepe.ca>
 <CAHS8izNuda2DXKTFAov64F7J2_BbMPaqJg1NuMpWpqGA20+S_Q@mail.gmail.com>
 <143a7ca4-e695-db98-9488-84cf8b78cf86@amd.com>
 <CAHS8izPm6XRS54LdCDZVd0C75tA1zHSu6jLVO8nzTLXCc=H7Nw@mail.gmail.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <CAHS8izPm6XRS54LdCDZVd0C75tA1zHSu6jLVO8nzTLXCc=H7Nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_081851_955882_EA6C38CC 
X-CRM114-Status: GOOD (  29.05  )
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

On 7/14/23 8:55 AM, Mina Almasry wrote:
> 
> I guess the remaining option not fully explored is the idea of getting
> the networking stack to consume the scatterlist that
> dma_buf_map_attachment() provides for the device memory. The very
> rough approach I have in mind (for the RX path) is:
> 
> 1. Some uapi that binds a dmabuf to an RX queue. It will do a
> dma_buf_map_attachment() and get the sg table.
> 
> 2. We need to feed the scratterlist entries to some allocator that
> will chunk it up into pieces that can be allocated by the NIC for
> incoming traffic. I'm thinking genalloc may work for this as-is, but I
> may need to add one or use something else if I run into some issue.
> 
> 3. We can implement a memory_provider that allocates these chunks and
> wraps them in a struct new_abstraction (as David called it) and feeds
> those into the page pool.
> 
> 4. The page pool would need to be able to process these struct
> new_abstraction alongside the struct pages it normally gets from
> providers. This is maybe the most complicated part, but looking at the
> page pool code it doesn't seem that big of a hurdle (but I have not
> tried a POC yet).
> 
> 5. The drivers (I looked at mlx5) seem to avoid making any mm calls on
> the struct pages returned by the pool; the pool abstracts everything
> already. The changes to the drivers may be minimal..?
> 
> 6. We would need to add a new helper, skb_add_rx_new_abstraction_frag
> that creates a frag out of new_abstraction rather than a struct page.
> 
> Once the skb frags with struct new_abstraction are in the TCP stack,
> they will need some special handling in code accessing the frags. But
> my RFC already addressed that somewhat because the frags were
> inaccessible in that case. In this case the frags will be both
> inaccessible and will not be struct pages at all (things like
> get_page() will not work), so more special handling will be required,
> maybe.
> 
> I imagine the TX path would be considerably less complicated because
> the allocator and page pool are not involved (I think).
> 
> Anyone see any glaring issues with this approach?

Moving skb_frags to an alternative scheme is essential to make this
work. The current page scheme to go from user virtual to pages to
physical is not needed for the dmabuf use case.

For the driver and hardware queue: don't you need a dedicated queue for
the flow(s) in question? If not, how can you properly handle the
teardown case (e.g., app crashes and you need to ensure all references
to GPU memory are removed from NIC descriptors)? If you agree on this
point, then you can require the dedicated queue management in the driver
to use and expect only the alternative frag addressing scheme. ie., it
knows the address is not struct page (validates by checking skb flag or
frag flag or address magic), but a reference to say a page_pool entry
(if you are using page_pool for management of the dmabuf slices) which
contains the metadata needed for the use case.

