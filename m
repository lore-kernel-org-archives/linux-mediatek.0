From: David Miller <davem@davemloft.net>
Subject: Re: [v4, PATCH 0/3] fix some bugs in stmmac
Date: Sat, 25 May 2019 11:02:52 -0700 (PDT)
Message-ID: <20190525.110252.292904127953775877.davem@davemloft.net>
References: <1558679169-26752-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558679169-26752-1-git-send-email-biao.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: biao.huang@mediatek.com
Cc: joabreu@synopsys.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, jianguo.zhang@mediatek.comi, boon.leong.ong@intel.com
List-Id: linux-mediatek@lists.infradead.org

From: Biao Huang <biao.huang@mediatek.com>
Date: Fri, 24 May 2019 14:26:06 +0800

> changes in v4:                                                                  
>         since MTL_OPERATION_MODE write back issue has be fixed in the latest driver,
> remove original patch#3                                                         
>                                                                                 
> changes in v3:                                                                  
>         add a Fixes:tag for each patch                                          
>                                                                                 
> changes in v2:                                                                  
>         1. update rx_tail_addr as Jose's comment                                
>         2. changes clk_csr condition as Alex's proposition                      
>         3. remove init lines in dwmac-mediatek, get clk_csr from dts instead.   
>                                                                                 
> v1:                                                                             
> This series fix some bugs in stmmac driver                                      
> 3 patches are for common stmmac or dwmac4:                                      
>         1. update rx tail pointer to fix rx dma hang issue.                     
>         2. change condition for mdc clock to fix csr_clk can't be zero issue.   
>         3. write the modified value back to MTL_OPERATION_MODE.                 
> 1 patch is for dwmac-mediatek:                                                  
>         modify csr_clk value to fix mdio read/write fail issue for dwmac-mediatek

Series applied, thanks.
