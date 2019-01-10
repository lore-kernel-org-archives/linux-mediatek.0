From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2] net: ethernet: mediatek: fix warning in
 phy_start_aneg
Date: Thu, 10 Jan 2019 13:58:22 -0800 (PST)
Message-ID: <20190110.135822.559533664183421677.davem@davemloft.net>
References: <20190109072028.30513-1-frank-w@public-files.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190109072028.30513-1-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
To: frank-w@public-files.de
Cc: nbd@openwrt.org, john@phrozen.org, sean.wang@kernel.org, nelson.chang@mediatek.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, hkallweit1@gmail.com
List-Id: linux-mediatek@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>
Date: Wed,  9 Jan 2019 08:20:28 +0100

> From: Heiner Kallweit <hkallweit1@gmail.com>
> 
> linux 5.0-rc1 shows following warning on bpi-r2/mt7623 bootup:
 ...
> maybe other boards using this generic driver are affected
> 
> v2:
> optimization:
 ...
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Applied, thank you.
