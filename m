From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net] net: mediatek: setup proper state for disabled
 GMAC on the default
Date: Tue, 19 Dec 2017 13:21:50 -0500 (EST)
Message-ID: <20171219.132150.57249791249142933.davem@davemloft.net>
References: <1ce99b9e64c6212eac501b98ee982b2e37fd7962.1513587298.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1ce99b9e64c6212eac501b98ee982b2e37fd7962.1513587298.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: john@phrozen.org, nbd@openwrt.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: <sean.wang@mediatek.com>
Date: Mon, 18 Dec 2017 17:00:17 +0800

> From: Sean Wang <sean.wang@mediatek.com>
> 
> The current solution would setup fixed and force link of 1Gbps to the both
> GMAC on the default. However, The GMAC should always be put to link down
> state when the GMAC is disabled on certain target boards. Otherwise,
> the driver possibly receives unexpected data from the floating hardware
> connection through the unused GMAC. Although the driver had been added
> certain protection in RX path to get rid of such kind of unexpected data
> sent to the upper stack.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Applied, thanks.
