From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v3 net-next 0/3] add VLAN support to DSA MT7530
Date: Fri, 15 Dec 2017 10:35:44 -0500 (EST)
Message-ID: <20171215.103544.1455899068451080679.davem@davemloft.net>
References: <cover.1513312600.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1513312600.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: <sean.wang@mediatek.com>
Date: Fri, 15 Dec 2017 12:46:59 +0800

> From: Sean Wang <sean.wang@mediatek.com>
> 
> Changes sicne v2:
> update to the latest code base from net-next and fix up all building
> errors with -Werror.
> 
> Changes since v1:
> - fix up the typo
> - prefer ordering declarations longest to shortest
> - update that vlan_prepare callback should not change any state
> - use lower case letter for function naming
> 
> The patchset extends DSA MT7530 to VLAN support through filling required
> callbacks in patch 1 and merging the special tag with VLAN tag in patch 2
> for allowing that the hardware can handle these packets with VID from the
> CPU port.

This one builds :-)  Series applied, thanks.
