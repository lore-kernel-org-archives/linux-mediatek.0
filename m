Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864D0EB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 16:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnvGyeFdqT1PJXerhGhkw4nha+gp/hm34hmEQZehQBc=; b=HCC5xmZFMtHO96eDR16/JmeOZH
	o+998Y8vg4mBo9pYh7YKFao/8so1MHS8FJQUuJGWQ14M0i6cl7YuUGii2rJauz5D7I3fDpM80S0IE
	oK32s4JrCQUl6oSgLri7LXrX8E7aOttoBA7OHmYxcHdf9lx/iJTp+VgXFjDfBOvVj2Qqs4GUbBJuQ
	LkQRuYnsA+y5Aar8Rf2V0uX8y+kq1hb1+L4C/xZdUS5c42+HKbtEoZTu9Soc5rFyKRdcpBK+2bhIe
	YOS5UnlvGQmjcbLrjxkHZCslXBfB/FI6bvyyX6aurgpIT+Ko129AXTT5gjXru1VVDZ31SzwM5HTh8
	dOmOS33w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJG6r-00FNa2-1g;
	Tue, 11 Jul 2023 16:21:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJG6o-00FNZO-1T;
	Tue, 11 Jul 2023 16:21:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 74DC261562;
	Tue, 11 Jul 2023 16:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481CAC433C7;
	Tue, 11 Jul 2023 16:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689092460;
	bh=NnvGyeFdqT1PJXerhGhkw4nha+gp/hm34hmEQZehQBc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q41kwYFyr8xOB61pvc5FELxseCH+442Dfz/DDdwc4nm0O7JlQxfOdE8eTyj4F38un
	 9SVnab643Xy9DHecsJiimbYR73eH+hWG966vCNGvww2Wot57F6wrGsNXk/uZEJpnhq
	 WuoWb78NXvY0FHvB/7RBe3L5/HzqtGNiLFQ0wz2Yzzm/nj1M7Y90DL73GXVj2KU6PN
	 vLfRRu6T5KbDARbYtXLhJO6oYV11t6WP55vDJMJ3Eu7KazqQXS7E5Rkyp9BO1P4C8k
	 D20Bh6Lu9Nc+aO6pLS89qrGOhZa786q5r+/cU9U0a0eclcSTY1Cyvi1DqYKmSEO4jv
	 QFjLXRx3oQvqg==
Message-ID: <04187826-8dad-d17b-2469-2837bafd3cd5@kernel.org>
Date: Tue, 11 Jul 2023 10:20:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: Memory providers multiplexing (Was: [PATCH net-next v4 4/5]
 page_pool: remove PP_FLAG_PAGE_FRAG flag)
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Christoph Hellwig <hch@lst.de>
Cc: Mina Almasry <almasrymina@google.com>, John Hubbard
 <jhubbard@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
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
 linux-mediatek@lists.infradead.org, Jonathan Lemon <jonathan.lemon@gmail.com>
References: <5e0ac5bb-2cfa-3b58-9503-1e161f3c9bd5@kernel.org>
 <CAHS8izP2fPS56uXKMCnbKnPNn=xhTd0SZ1NRUgnAvyuSeSSjGA@mail.gmail.com>
 <ZKNA9Pkg2vMJjHds@ziepe.ca>
 <CAHS8izNB0qNaU8OTcwDYmeVPtCrEjTTOhwCHtVsLiyhXmPLsXQ@mail.gmail.com>
 <ZKxDZfVAbVHgNgIM@ziepe.ca>
 <CAHS8izO3h3yh=CLJgzhLwCVM4SLgf64nnmBtGrXs=vxuJQHnMQ@mail.gmail.com>
 <ZKyZBbKEpmkFkpWV@ziepe.ca> <20230711042708.GA18658@lst.de>
 <20230710215906.49514550@kernel.org> <20230711050445.GA19323@lst.de>
 <ZK1FbjG+VP/zxfO1@ziepe.ca> <20230711090047.37d7fe06@kernel.org>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20230711090047.37d7fe06@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_092102_575033_4FA25634 
X-CRM114-Status: UNSURE (   8.52  )
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

On 7/11/23 10:00 AM, Jakub Kicinski wrote:
>> RDMA works with the AMD and Intel intree drivers using DMABUF without
>> requiring struct pages using the DRM hacky scatterlist approach.
> I see, thanks. We need pages primarily for refcounting. Avoiding all
> the infamous problems with memory pins. Oh well.

io_uring for example already manages the page pinning. An skb flag was
added for ZC Tx API to avoid refcounting in the core networking layer.
Any reason not to allow an alternative representation for skb frags than
struct page?

