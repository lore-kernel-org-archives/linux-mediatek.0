From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 net-next] net: mediatek: use dma_zalloc_coherent
 instead of allocator/memset
Date: Sun, 22 Jul 2018 20:52:19 -0700 (PDT)
Message-ID: <20180722.205219.971856341700917090.davem@davemloft.net>
References: <20180723031647.9820-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723031647.9820-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yuehaibing@huawei.com
Cc: nbd@openwrt.org, john@phrozen.org, sean.wang@mediatek.com, nelson.chang@mediatek.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 23 Jul 2018 11:16:47 +0800

> Use dma_zalloc_coherent instead of dma_alloc_coherent
> followed by memset 0.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: remove redundant __GFP_ZERO

Applied, thank you.
