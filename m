From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v1 0/6] Add MT7629 ethernet support
Date: Mon, 03 Jun 2019 15:00:18 -0700 (PDT)
Message-ID: <20190603.150018.656008041790620010.davem@davemloft.net>
References: <1559347395-14058-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1559347395-14058-1-git-send-email-sean.wang@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: john@phrozen.org, nbd@openwrt.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: <sean.wang@mediatek.com>
Date: Sat, 1 Jun 2019 08:03:09 +0800

> From: Sean Wang <sean.wang@mediatek.com>
> 
> MT7629 inlcudes two sets of SGMIIs used for external switch or PHY, and embedded
> switch (ESW) via GDM1, GePHY via GMAC2, so add several patches in the series to
> make the code base common with the old SoCs.
> 
> The patch 1, 3 and 6, adds extension for SGMII to have the hardware configured
> for 1G, 2.5G and AN to fit the capability of the target PHY. In patch 6 could be
> an example showing how to use these configurations for underlying PHY speed to
> match up the link speed of the target PHY.
> 
> The patch 4 is used for automatically configured the hardware path from GMACx to
> the target PHY by the description in deviceetree topology to determine the
> proper value for the corresponding MUX.
> 
> The patch 2 and 5 is for the update for MT7629 including dt-binding document and
> its driver.

Series applied.
