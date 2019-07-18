From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: ethernet: mediatek: Add MT7628/88 SoC support
Date: Thu, 18 Jul 2019 16:36:11 -0700 (PDT)
Message-ID: <20190718.163611.739573720782543608.davem@davemloft.net>
References: <20190717110243.14240-1-sr@denx.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190717110243.14240-1-sr@denx.de>
Sender: netdev-owner@vger.kernel.org
To: sr@denx.de
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, opensource@vdorst.com, sean.wang@mediatek.com, nbd@openwrt.org, john@phrozen.org
List-Id: linux-mediatek@lists.infradead.org

From: Stefan Roese <sr@denx.de>
Date: Wed, 17 Jul 2019 13:02:43 +0200

> This patch adds support for the MediaTek MT7628/88 SoCs to the common
> MediaTek ethernet driver. Some minor changes are needed for this and
> a bigger change, as the MT7628 does not support QDMA (only PDMA).
> 
> Signed-off-by: Stefan Roese <sr@denx.de>

Besides the feedback you've received, this kind of change is only appropriate
for the net-next tree at this time.

If you wish to keep sending versions for review until the net-next tree opens
back up, clearly indicate in your Subject line by saying "[PATCH RFC ...]" or
similar.

Thank you.
