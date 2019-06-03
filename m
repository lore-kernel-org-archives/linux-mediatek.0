From: Biao Huang <biao.huang@mediatek.com>
Subject: [v2, PATCH 0/4] complete dwmac-mediatek driver and fix flow control issue
Date: Mon, 3 Jun 2019 09:58:02 +0800
Message-ID: <1559527086-7227-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, Jose Abreu <joabreu@synopsys.com>, andrew@lunn.ch
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, biao.huang@mediatek.com, jianguo.zhang@mediatek.com, boon.leong.ong@intel.com
List-Id: linux-mediatek@lists.infradead.org

Changes in v2:                                                                  
        patch#1: there is no extra action in mediatek_dwmac_remove, remove it            
                                                                                
v1:                                                                             
This series mainly complete dwmac-mediatek driver:                              
        1. add power on/off operations for dwmac-mediatek.                      
        2. disable rx watchdog to reduce rx path reponding time.                
        3. change the default value of tx-frames from 25 to 1, so               
           ptp4l will test pass by default.                                     
                                                                                
and also fix the issue that flow control won't be disabled any more             
once being enabled.                                                             
                                                                                
Biao Huang (4):                                                                 
  net: stmmac: dwmac-mediatek: enable Ethernet power domain                     
  net: stmmac: dwmac-mediatek: disable rx watchdog                              
  net: stmmac: modify default value of tx-frames                                
  net: stmmac: dwmac4: fix flow control issue                                   
                                                                                
 drivers/net/ethernet/stmicro/stmmac/common.h       |    2 +-                   
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   |    8 ++++++++             
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |    8 ++++++--             
 3 files changed, 15 insertions(+), 3 deletions(-)                              
                                                                                
--                                                                              
1.7.9.5
