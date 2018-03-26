From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net 1/2] net: dsa: mt7530: remove redundant MODULE_ALIAS
 entries
Date: Mon, 26 Mar 2018 17:32:57 +0200
Message-ID: <20180326153257.GB3014@lunn.ch>
References: <2497321afc9156f7954e813721f60a0a95c03bd2.1522057659.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2497321afc9156f7954e813721f60a0a95c03bd2.1522057659.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: davem@davemloft.net, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, Mar 26, 2018 at 06:07:09PM +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> MODULE_ALIAS exports information to allow the module to be auto-loaded at
> boot for the drivers registered using legacy platform registration.
> 
> However, currently the driver is always used by DT-only platform,
> MODULE_ALIAS is redundant and should be removed properly.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

For this, and the second patch:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
