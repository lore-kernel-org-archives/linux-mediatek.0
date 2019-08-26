From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 -next] net: mediatek: remove set but not used
 variable 'status'
Date: Sun, 25 Aug 2019 19:06:43 -0700 (PDT)
Message-ID: <20190825.190643.573913079872386152.davem@davemloft.net>
References: <20190824.142158.1506174328495468705.davem@davemloft.net>
        <20190826013118.22720-1-maowenan@huawei.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190826013118.22720-1-maowenan@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maowenan@huawei.com
Cc: nbd@openwrt.org, john@phrozen.org, sean.wang@mediatek.com, nelson.chang@mediatek.com, matthias.bgg@gmail.com, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

From: Mao Wenan <maowenan@huawei.com>
Date: Mon, 26 Aug 2019 09:31:18 +0800

> Fixes gcc '-Wunused-but-set-variable' warning:
> drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function mtk_handle_irq:
> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1951:6: warning: variable status set but not used [-Wunused-but-set-variable]
> 
> Fixes: 296c9120752b ("net: ethernet: mediatek: Add MT7628/88 SoC support")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Are you sure the register isn't being read in order to make some
hardware side effect happen?

Have you tested this on effected hardware?

I'm not applying this without definitive answers to these questions.
