From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net 1/2] net: dsa: mt7530: remove redundant
 MODULE_ALIAS entries
Date: Mon, 26 Mar 2018 13:09:56 -0400 (EDT)
Message-ID: <20180326.130956.19399658394636738.davem@davemloft.net>
References: <2497321afc9156f7954e813721f60a0a95c03bd2.1522057659.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2497321afc9156f7954e813721f60a0a95c03bd2.1522057659.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: <sean.wang@mediatek.com>
Date: Mon, 26 Mar 2018 18:07:09 +0800

> From: Sean Wang <sean.wang@mediatek.com>
> 
> MODULE_ALIAS exports information to allow the module to be auto-loaded at
> boot for the drivers registered using legacy platform registration.
> 
> However, currently the driver is always used by DT-only platform,
> MODULE_ALIAS is redundant and should be removed properly.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Applied.
