From: David Miller <davem@davemloft.net>
Subject: Re: [v3, PATCH] net: stmmac: add support for hash table size
 128/256 in dwmac4
Date: Mon, 27 May 2019 10:08:00 -0700 (PDT)
Message-ID: <20190527.100800.1719164073038257292.davem@davemloft.net>
References: <1558926867-16472-1-git-send-email-biao.huang@mediatek.com>
        <1558926867-16472-2-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558926867-16472-2-git-send-email-biao.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: biao.huang@mediatek.com
Cc: joabreu@synopsys.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, jianguo.zhang@mediatek.com, boon.leong.ong@intel.com
List-Id: linux-mediatek@lists.infradead.org

From: Biao Huang <biao.huang@mediatek.com>
Date: Mon, 27 May 2019 11:14:27 +0800

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> index 5e98da4..029a3db 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> @@ -403,41 +403,50 @@ static void dwmac4_set_filter(struct mac_device_info *hw,
>  			      struct net_device *dev)
>  {
>  	void __iomem *ioaddr = (void __iomem *)dev->base_addr;
> -	unsigned int value = 0;
> +	unsigned int value;
> +	int numhashregs = (hw->multicast_filter_bins >> 5);
> +	int mcbitslog2 = hw->mcast_bits_log2;
> +	int i;

Please retain the reverse christmas tree ordering here.

Thank you.
