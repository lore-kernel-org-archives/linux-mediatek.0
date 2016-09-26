From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH net-next 2/2] net: ethernet: mediatek: bug fix to disable
 HW LRO
Date: Mon, 26 Sep 2016 14:21:15 +0300
Message-ID: <7124ebf3-8001-ed55-d727-3a524e0088ee@cogentembedded.com>
References: <1474871630-4134-1-git-send-email-nelson.chang@mediatek.com>
 <1474871630-4134-3-git-send-email-nelson.chang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1474871630-4134-3-git-send-email-nelson.chang@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: Nelson Chang <nelson.chang@mediatek.com>, john@phrozen.org, davem@davemloft.net
Cc: nbd@openwrt.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, nelsonch.tw@gmail.com
List-Id: linux-mediatek@lists.infradead.org

Hello.

On 9/26/2016 9:33 AM, Nelson Chang wrote:

> (1) Modify the register settings for LRO relinquishments
> (2) Jump out from the waiting loop while LRO relinquishments are done

    Why this is done in a single patch?

> Signed-off-by: Nelson Chang <nelson.chang@mediatek.com>
[...]

MBR, Sergei
