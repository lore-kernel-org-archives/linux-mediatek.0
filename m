From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 0/2] net: ethernet: mediatek: some bug fixes
 for PDAM and HW LRO
Date: Tue, 27 Sep 2016 09:42:24 -0400 (EDT)
Message-ID: <20160927.094224.1540701192272023517.davem@davemloft.net>
References: <1474871630-4134-1-git-send-email-nelson.chang@mediatek.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1474871630-4134-1-git-send-email-nelson.chang@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: nelson.chang@mediatek.com
Cc: john@phrozen.org, nbd@openwrt.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, nelsonch.tw@gmail.com
List-Id: linux-mediatek@lists.infradead.org

From: Nelson Chang <nelson.chang@mediatek.com>
Date: Mon, 26 Sep 2016 14:33:48 +0800

> 1) Add to stop PDMA while stopping the frame engine
> 2) Modify the register settings for LRO relinquishments
> 3) Jump out from the waiting loop while LRO relinquishments are done

Series applied, but like Sergei I think you should have split patch
#2 into two separate patches.

You even list the changes individually here in your header
posting.
