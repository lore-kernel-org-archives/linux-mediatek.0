From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net] net: ethernet: mediatek: fix module loading
 automatically based on MODULE_DEVICE_TABLE
Date: Fri, 16 Sep 2016 04:20:45 -0400 (EDT)
Message-ID: <20160916.042045.2235738935632187131.davem@davemloft.net>
References: <1473859774-6327-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1473859774-6327-1-git-send-email-sean.wang@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: john@phrozen.org, nbd@openwrt.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, keyhaede@gmail.com, objelf@gmail.com
List-Id: linux-mediatek@lists.infradead.org

From: <sean.wang@mediatek.com>
Date: Wed, 14 Sep 2016 21:29:34 +0800

> From: Sean Wang <sean.wang@mediatek.com>
> 
> The device table is required to load modules based on
> modaliases. After adding MODULE_DEVICE_TABLE, below entries
> for example will be added to modules.alias:
> alias of:N*T*Cmediatek,mt7623-ethC* mtk_eth_soc
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Applied.
