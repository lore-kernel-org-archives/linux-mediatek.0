From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 1/2] net-next: mediatek: improve more with
 using dma_zalloc_coherent
Date: Sun, 29 Jul 2018 13:16:14 -0700 (PDT)
Message-ID: <20180729.131614.1749970569742868829.davem@davemloft.net>
References: <658dfd485c035cdae5452bc5d572125076b47a48.1532755541.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <658dfd485c035cdae5452bc5d572125076b47a48.1532755541.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: john@phrozen.org, nbd@openwrt.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: <sean.wang@mediatek.com>
Date: Sat, 28 Jul 2018 13:35:55 +0800

> From: Sean Wang <sean.wang@mediatek.com>
> 
> Improve more in the existing code by reusing dma_zalloc_coherent instead
> of dma_alloc_coherent with __GFP_ZERO or superfluous zeroing buffer.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Applied.
