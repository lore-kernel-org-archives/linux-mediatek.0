From: Nelson Chang <nelson.chang@mediatek.com>
Subject: RE: [PATCH net-next 0/2] net: ethernet: mediatek: some bug fixes
 for PDAM and HW LRO
Date: Wed, 28 Sep 2016 01:16:25 +0800
Message-ID: <1474996585.11000.2.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net
Cc: john@phrozen.org, nbd@openwrt.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, nelsonch.tw@gmail.com
List-Id: linux-mediatek@lists.infradead.org

Got it. I'll notice that for later patches.
Thanks David.

-----Original Message-----
From: David Miller [mailto:davem@davemloft.net] 
Sent: Tuesday, September 27, 2016 9:42 PM
To: Nelson Chang (張家祥)
Cc: john@phrozen.org; nbd@openwrt.org; netdev@vger.kernel.org;
linux-mediatek@lists.infradead.org; nelsonch.tw@gmail.com
Subject: Re: [PATCH net-next 0/2] net: ethernet: mediatek: some bug
fixes for PDAM and HW LRO

From: Nelson Chang <nelson.chang@mediatek.com>
Date: Mon, 26 Sep 2016 14:33:48 +0800

> 1) Add to stop PDMA while stopping the frame engine
> 2) Modify the register settings for LRO relinquishments
> 3) Jump out from the waiting loop while LRO relinquishments are done

Series applied, but like Sergei I think you should have split patch
#2 into two separate patches.

You even list the changes individually here in your header posting.
