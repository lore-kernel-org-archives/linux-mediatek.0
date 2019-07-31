From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: mediatek: Drop unneeded dependency on
 NET_VENDOR_MEDIATEK
Date: Wed, 31 Jul 2019 08:53:37 -0700 (PDT)
Message-ID: <20190731.085337.207327464892923101.davem@davemloft.net>
References: <20190731131202.16749-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190731131202.16749-1-geert+renesas@glider.be>
Sender: netdev-owner@vger.kernel.org
To: geert+renesas@glider.be
Cc: nbd@openwrt.org, john@phrozen.org, sean.wang@mediatek.com, nelson.chang@mediatek.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Wed, 31 Jul 2019 15:12:02 +0200

> The whole block is protected by "if NET_VENDOR_MEDIATEK", so there is
> no need for individual driver config symbols to duplicate this
> dependency.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied.
