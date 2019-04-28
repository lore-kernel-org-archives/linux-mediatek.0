From: Biao Huang <biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/6] fix some bugs and add some features in stmmac
Date: Sun, 28 Apr 2019 14:30:03 +0800
Message-ID: <1556433009-25759-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
Cc: jianguo.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

This series fix some bugs and add some features in stmmac driver.               
5 patches are for common stmmac or dwmac4:                                      
        1. update rx tail pointer to fix rx dma hang issue.                     
        2. change condition for mdc clock to fix csr_clk can't be zero issue.   
        3. write the modified value back to MTL_OPERATION_MODE.                 
        4. add support for hash table size 128/256                              
        5. add mdio clause 45 access from mac device for dwmac4.                
1 patche is for dwmac-mediatek:                                                 
        1. modify csr_clk value to fix mdio read/write fail issue for dwmac-mediatek.
                                                                                
Biao Huang (6):                                                                 
  net: stmmac: update rx tail pointer register to fix rx dma hang               
    issue.                                                                      
  net: stmmac: fix csr_clk can't be zero issue                                  
  net: stmmac: write the modified value back to MTL_OPERATION_MODE              
  net: stmmac: add support for hash table size 128/256 in dwmac4                
  net: stmmac: add mdio clause 45 access from mac device for dwmac4             
  stmmac: dwmac-mediatek: modify csr_clk value to fix mdio read/write           
    fail                                                                        
                                                                                
 drivers/net/ethernet/stmicro/stmmac/common.h       |   18 ++-                  
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   |    4 +-                   
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |    4 +-                   
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |   55 ++++---              
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c   |    1 +                    
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |    9 +-                   
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c  |  167 ++++++++++++++++++-- 
 7 files changed, 213 insertions(+), 45 deletions(-)                            
                                                                                
--                                                                              
1.7.9.5
