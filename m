From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 4/4 v3] net: ethernet: mediatek: Add MT7628/88
 SoC support
Date: Sun, 18 Aug 2019 14:17:26 -0700 (PDT)
Message-ID: <20190818.141726.699941540105787008.davem@davemloft.net>
References: <20190816132325.28426-1-sr@denx.de>
        <20190816132325.28426-4-sr@denx.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190816132325.28426-4-sr@denx.de>
Sender: netdev-owner@vger.kernel.org
To: sr@denx.de
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, opensource@vdorst.com, daniel@makrotopia.org, sean.wang@mediatek.com, john@phrozen.org
List-Id: linux-mediatek@lists.infradead.org

From: Stefan Roese <sr@denx.de>
Date: Fri, 16 Aug 2019 15:23:25 +0200

> This patch adds support for the MediaTek MT7628/88 SoCs to the common
> MediaTek ethernet driver. Some minor changes are needed for this and
> a bigger change, as the MT7628 does not support QDMA (only PDMA).
> 
> Signed-off-by: Stefan Roese <sr@denx.de>

Applied.

Please submit your patch series properly next time, which means including
a "[PATCH 0/N]" introductory posting which explains what the patch series
is doing, how it is doing it, and why it is doing it that way.

It not only provides a proper organizational object for your patch series,
it also makes less work for me because I can just reply to that single email
when I apply your series instead of having to reply to every single one
in the set.

Thanks.
