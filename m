From: Nelson Chang <nelson.chang@mediatek.com>
Subject: RE: [PATCH net-next 2/2] net: ethernet: mediatek: bug fix to
 disable HW LRO
Date: Mon, 26 Sep 2016 19:43:45 +0800
Message-ID: <1474890225.2669.4.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: sergei.shtylyov@cogentembedded.com, john@phrozen.org, davem@davemloft.net
Cc: nbd@openwrt.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, nelsonch.tw@gmail.com
List-Id: linux-mediatek@lists.infradead.org

Hi Sergei,

Because these modifications are both related to LRO relinquishments, I
put them in a single patch.


Nelson

-----Original Message-----
From: Sergei Shtylyov [mailto:sergei.shtylyov@cogentembedded.com] 
Sent: Monday, September 26, 2016 7:21 PM
To: Nelson Chang (張家祥); john@phrozen.org; davem@davemloft.net
Cc: nbd@openwrt.org; netdev@vger.kernel.org;
linux-mediatek@lists.infradead.org; nelsonch.tw@gmail.com
Subject: Re: [PATCH net-next 2/2] net: ethernet: mediatek: bug fix to
disable HW LRO

Hello.

On 9/26/2016 9:33 AM, Nelson Chang wrote:

> (1) Modify the register settings for LRO relinquishments
> (2) Jump out from the waiting loop while LRO relinquishments are done

    Why this is done in a single patch?

> Signed-off-by: Nelson Chang <nelson.chang@mediatek.com>
[...]

MBR, Sergei
