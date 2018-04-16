From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: mediatek: use of_device_get_match_data()
Date: Mon, 16 Apr 2018 13:43:33 -0400 (EDT)
Message-ID: <20180416.134333.1584175683168282946.davem@davemloft.net>
References: <31f944ab8dfcc1d7b6f03b35657a2a34825b5246.1523347340.git.ryder.lee@mediatek.com>
        <9bf87205f84062580934168774d690d4cd2bf26b.1523347340.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9bf87205f84062580934168774d690d4cd2bf26b.1523347340.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ryder.lee@mediatek.com
Cc: sean.wang@mediatek.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: Ryder Lee <ryder.lee@mediatek.com>
Date: Mon, 16 Apr 2018 10:33:41 +0800

> The usage of of_device_get_match_data() reduce the code size a bit.
> 
> Also, the only way to call mtk_probe() is to match an entry in
> of_mtk_match[], so match cannot be NULL.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

Applied to net-next.
