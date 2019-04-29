From: Biao Huang <biao.huang@mediatek.com>
Subject: [PATCH 0/2] net-next: stmmac: add some features in stmmac driver
Date: Mon, 29 Apr 2019 14:35:22 +0800
Message-ID: <1556519724-1576-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <joabreu@synopsys.com>, davem@davemloft.net
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, biao.huang@mediatek.com, jianguo.zhang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

This series add some features in stmmac driver.                                 
        1. add support for hash table size 128/256                              
        2. add mdio clause 45 access from mac device for dwmac4.                
                                                                                
Biao Huang (2):                                                                 
  net-next: stmmac: add support for hash table size 128/256 in dwmac4           
  net-next: stmmac: add mdio clause 45 access from mac device for               
    dwmac4                                                                      
                                                                                
 drivers/net/ethernet/stmicro/stmmac/common.h      |   18 ++-                   
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h      |    4 +-                    
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c |   53 ++++---               
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c  |    1 +                     
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |    4 +                     
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c |  167 +++++++++++++++++++-- 
 6 files changed, 205 insertions(+), 42 deletions(-)                            
                                                                                
--                                                                              
1.7.9.5
