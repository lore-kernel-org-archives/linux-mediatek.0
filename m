From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net v1 2/2] net: ethernet: mediatek: Use NET_IP_ALIGN
 to judge if HW RX_2BYTE_OFFSET is enabled
Date: Mon, 03 Jun 2019 15:04:35 -0700 (PDT)
Message-ID: <20190603.150435.519222045740513627.davem@davemloft.net>
References: <1559348187-14941-1-git-send-email-sean.wang@mediatek.com>
        <1559348187-14941-2-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559348187-14941-2-git-send-email-sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: john@phrozen.org, nbd@openwrt.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, mark-mc.lee@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

From: <sean.wang@mediatek.com>
Date: Sat, 1 Jun 2019 08:16:27 +0800

> From: Sean Wang <sean.wang@mediatek.com>
> 
> Should only enable HW RX_2BYTE_OFFSET function in the case NET_IP_ALIGN
> equals to 2.
> 
> Signed-off-by: Mark Lee <mark-mc.lee@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Applied.
