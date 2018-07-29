From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 2/2] net-next: mediatek: cleanup unnecessary
 get chip id and its user
Date: Sun, 29 Jul 2018 13:16:21 -0700 (PDT)
Message-ID: <20180729.131621.773833672945325604.davem@davemloft.net>
References: <658dfd485c035cdae5452bc5d572125076b47a48.1532755541.git.sean.wang@mediatek.com>
        <d4fa77f13190aefa5cf3f609a3ae555aeef38259.1532755541.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <d4fa77f13190aefa5cf3f609a3ae555aeef38259.1532755541.git.sean.wang@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: john@phrozen.org, nbd@openwrt.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: <sean.wang@mediatek.com>
Date: Sat, 28 Jul 2018 13:35:56 +0800

> From: Sean Wang <sean.wang@mediatek.com>
> 
> Since driver is devicetree-based, all device type and charateristic can be
> determined by the compatible string and its data. It's unnecessary to
> create another dependent function to check chip ID and then decide whether
> the specific funciton is being supported on a certain device. It can be
> totally replaced by the existing flag, so a cleanup is made by removing
> the function and the only user, HWLRO.
> 
> MT2701 also have a missing HWLRO support in old code, so add it the same
> patch.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Applied.
