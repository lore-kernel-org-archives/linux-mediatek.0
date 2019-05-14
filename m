From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [v2, PATCH 0/4] fix some bugs in stmmac
Date: Tue, 14 May 2019 05:00:16 +0200
Message-ID: <20190514030016.GA19642@lunn.ch>
References: <1557800933-30759-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557800933-30759-1-git-send-email-biao.huang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biao Huang <biao.huang@mediatek.com>
Cc: Jose Abreu <joabreu@synopsys.com>, davem@davemloft.net, jianguo.zhang@mediatek.com, Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, yt.shen@mediatek.com, linux-mediatek@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, May 14, 2019 at 10:28:49AM +0800, Biao Huang wrote:
> changes in v2:                                                                  
>         1. update rx_tail_addr as Jose's comment                                
>         2. changes clk_csr condition as Alex's proposition                      
>         3. remove init lines in dwmac-mediatek, get clk_csr from dts instead.   

Hi Biao

Since these are fixes, could you provide a Fixes: tag for each one?

Thanks
	Andrew
