From: Biao Huang <biao.huang@mediatek.com>
Subject: [PATCH 0/2 net-next] fix out-of-boundary issue and add taller hash table support
Date: Tue, 9 Jul 2019 10:36:21 +0800
Message-ID: <20190709023623.8358-1-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net, Jose Abreu <joabreu@synopsys.com>, andrew@lunn.ch
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, biao.huang@mediatek.com, jianguo.zhang@mediatek.com, boon.leong.ong@intel.com
List-Id: linux-mediatek@lists.infradead.org

Fix mac address out-of-boundary issue in net-next tree.
and resend the patch which was discussed in
https://lore.kernel.org/patchwork/patch/1082117
but with no further progress.

Biao Huang (2):
  net: stmmac: dwmac4: mac address array boudary violation issue
  net: stmmac: add support for hash table size 128/256 in dwmac4

 drivers/net/ethernet/stmicro/stmmac/common.h  |  7 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  4 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 51 +++++++++++--------
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  6 +++
 5 files changed, 43 insertions(+), 26 deletions(-)

-- 
2.18.0
