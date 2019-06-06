From: David Miller <davem@davemloft.net>
Subject: Re: [v2, PATCH 0/4] complete dwmac-mediatek driver and fix flow
 control issue
Date: Wed, 05 Jun 2019 17:03:28 -0700 (PDT)
Message-ID: <20190605.170328.2300021130625279075.davem@davemloft.net>
References: <1559527086-7227-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1559527086-7227-1-git-send-email-biao.huang@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: biao.huang@mediatek.com
Cc: joabreu@synopsys.com, andrew@lunn.ch, peppe.cavallaro@st.com, alexandre.torgue@st.com, mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, jianguo.zhang@mediatek.com, boon.leong.ong@intel.com
List-Id: linux-mediatek@lists.infradead.org

From: Biao Huang <biao.huang@mediatek.com>
Date: Mon, 3 Jun 2019 09:58:02 +0800

> Changes in v2:                                                                  
>         patch#1: there is no extra action in mediatek_dwmac_remove, remove it            
>                                                                                 
> v1:                                                                             
> This series mainly complete dwmac-mediatek driver:                              
>         1. add power on/off operations for dwmac-mediatek.                      
>         2. disable rx watchdog to reduce rx path reponding time.                
>         3. change the default value of tx-frames from 25 to 1, so               
>            ptp4l will test pass by default.                                     
>                                                                                 
> and also fix the issue that flow control won't be disabled any more             
> once being enabled.                                                             

Series applied to net-next.
