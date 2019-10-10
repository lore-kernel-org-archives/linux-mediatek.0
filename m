From: Jakub Kicinski <jakub.kicinski@netronome.com>
Subject: Re: [RESEND,PATCH] net: stmmac: dwmac-mediatek: fix wrong delay
 value issue when resume back
Date: Wed, 9 Oct 2019 19:43:11 -0700
Message-ID: <20191009194311.55c8cf6e@cakuba.netronome.com>
References: <20191009073348.5503-1-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20191009073348.5503-1-biao.huang@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: Biao Huang <biao.huang@mediatek.com>
Cc: davem@davemloft.net, Jose Abreu <joabreu@synopsys.com>, andrew@lunn.ch, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, jianguo.zhang@mediatek.com, boon.leong.ong@intel.com
List-Id: linux-mediatek@lists.infradead.org

On Wed, 9 Oct 2019 15:33:48 +0800, Biao Huang wrote:
> mac_delay value will be divided by 550/170 in mt2712_delay_ps2stage(),
> which is invoked at the beginning of mt2712_set_delay(), and the value
> should be restored at the end of mt2712_set_delay().
> Or, mac_delay will be divided again when invoking mt2712_set_delay()
> when resume back.
> So, add mt2712_delay_stage2ps() to mt2712_set_delay() to recovery the
> original mac_delay value.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>

Applied, thanks.
