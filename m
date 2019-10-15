From: Biao Huang <biao.huang@mediatek.com>
Subject: [v2, PATCH 0/1] net: stmmac: disable/enable ptp_ref_clk in suspend/resume flow
Date: Tue, 15 Oct 2019 11:24:43 +0800
Message-ID: <20191015032444.15145-1-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, Jose Abreu <joabreu@synopsys.com>, andrew@lunn.ch
Cc: jakub.kicinski@netronome.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, biao.huang@mediatek.com, jianguo.zhang@mediatek.com, boon.leong.ong@intel.com
List-Id: linux-mediatek@lists.infradead.org

changes in v2:
        1. add Fixes in commit message
        2. replace clk_disable/clk_enable with clk_disable_unprepare/clk_prepare_enable
        to ensure the source pll can be closed/open in suspend/resume for power saving.

Biao Huang (1):
  net: stmmac: disable/enable ptp_ref_clk in suspend/resume flow

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

--
2.18.0
