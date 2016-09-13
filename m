From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next 2/3] net: ethernet: mediatek: add ethtool
 functions to configure RX flows of HW LRO
Date: Tue, 13 Sep 2016 11:26:51 -0700
Message-ID: <0416bf6a-1a3d-f8fe-9150-8f143c48ee8c@gmail.com>
References: <1473774866-3156-1-git-send-email-nelson.chang@mediatek.com>
 <1473774866-3156-3-git-send-email-nelson.chang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1473774866-3156-3-git-send-email-nelson.chang@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: Nelson Chang <nelson.chang@mediatek.com>, john@phrozen.org, davem@davemloft.net
Cc: nbd@openwrt.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, nelsonch.tw@gmail.com
List-Id: linux-mediatek@lists.infradead.org

On 09/13/2016 06:54 AM, Nelson Chang wrote:
> The codes add ethtool functions to set RX flows for HW LRO. Because the
> HW LRO hardware can only recognize the destination IP of TCP/IP RX flows,
> the ethtool command to add HW LRO flow is as below:
> ethtool -N [devname] flow-type tcp4 dst-ip [ip_addr] loc [0~1]
> 
> Otherwise, cause the hardware can set total four destination IPs, each
> GMAC (GMAC1/GMAC2) can set two IPs separately at most.
> 
> Signed-off-by: Nelson Chang <nelson.chang@mediatek.com>
> ---

> +
> +static int mtk_set_features(struct net_device *dev, netdev_features_t features)
> +{
> +	int err = 0;
> +
> +	if (!((dev->features ^ features) & NETIF_F_LRO))
> +		return 0;
> +
> +	if (!(features & NETIF_F_LRO))
> +		mtk_hwlro_netdev_disable(dev);

you may want to implement a fix_features ndo operations which makes sure
that NETIF_F_LRO is turned on in case a RX flow is programmed,
otherwise, it may be confusing to the user that a flow was programmed,
but no offload is happening.
-- 
Florian
