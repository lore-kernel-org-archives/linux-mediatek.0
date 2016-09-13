From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: ethernet: mediatek: add dts
 configuration to enable HW LRO
Date: Tue, 13 Sep 2016 11:24:38 -0700
Message-ID: <3103c7f5-0c67-1ad7-20f5-7722f412c152@gmail.com>
References: <1473774866-3156-1-git-send-email-nelson.chang@mediatek.com>
 <1473774866-3156-4-git-send-email-nelson.chang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1473774866-3156-4-git-send-email-nelson.chang@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: Nelson Chang <nelson.chang@mediatek.com>, john@phrozen.org, davem@davemloft.net
Cc: nbd@openwrt.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, nelsonch.tw@gmail.com
List-Id: linux-mediatek@lists.infradead.org

On 09/13/2016 06:54 AM, Nelson Chang wrote:
> Add the configuration of HW LRO in the binding document.
> 
> Signed-off-by: Nelson Chang <nelson.chang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/net/mediatek-net.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek-net.txt b/Documentation/devicetree/bindings/net/mediatek-net.txt
> index 32eaaca..f43c0d1 100644
> --- a/Documentation/devicetree/bindings/net/mediatek-net.txt
> +++ b/Documentation/devicetree/bindings/net/mediatek-net.txt
> @@ -20,6 +20,7 @@ Required properties:
>  - mediatek,ethsys: phandle to the syscon node that handles the port setup
>  - mediatek,pctl: phandle to the syscon node that handles the ports slew rate
>  	and driver current
> +- mediatek,hwlro: set to enable HW LRO functions of PDMA rx rings

That sounds like implementing a enable/disable policy in the Device Tree
as opposed to providing an indication as to whether the HW supports LRO
or not. If all versions of the hardware support LRO, then you would
rather let the users change NETIF_F_LRO using ethtool features instead
of having this be defined in the Device Tree.

If, on the other hand, not all version of the HW support LRO, then you
would just want to rephrase the property description to say this
describes a capability.
-- 
Florian
