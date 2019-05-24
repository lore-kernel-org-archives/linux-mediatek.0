From: biao huang <biao.huang@mediatek.com>
Subject: RE: [v2, PATCH] net: stmmac: add support for hash table size
 128/256 in dwmac4
Date: Fri, 24 May 2019 17:44:44 +0800
Message-ID: <1558691084.24897.51.camel@mhfsdcap03>
References: <1557802843-31718-1-git-send-email-biao.huang@mediatek.com>
         <78EB27739596EE489E55E81C33FEC33A0B92D26F@DE02WEMBXB.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <78EB27739596EE489E55E81C33FEC33A0B92D26F@DE02WEMBXB.internal.synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: "davem@davemloft.net" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "yt.shen@mediatek.com" <yt.shen@mediatek.com>, "jianguo.zhang@mediatek.comi" <jianguo.zhang@mediatek.comi>, "boon.leong.ong@intel.com" <boon.leong.ong@intel.com>
List-Id: linux-mediatek@lists.infradead.org

Seems I should modify this patch base on
"https://patchwork.ozlabs.org/project/netdev/list/?series=109699"

On Fri, 2019-05-24 at 09:24 +0000, Jose Abreu wrote:
> From: biao huang <biao.huang@mediatek.com>
> Date: Fri, May 24, 2019 at 09:31:44
> 
> > On Fri, 2019-05-24 at 08:24 +0000, Jose Abreu wrote:
> > > From: biao huang <biao.huang@mediatek.com>
> > > Date: Fri, May 24, 2019 at 07:33:37
> > > 
> > > > any comments about this patch?
> > > 
> > > Can you please test your series on top of this one [1] and let me know 
> > > the output of :
> > > # ethtool -t eth0
> > "ethtol -T eth0"? This patch only affect hash table filter, seems no
> > relation to timestamp.
> > > 
execute "ethtool -t eth0", then we got "Cannot test: Operation not
supported", is there any config should be enabled?
> > > Just to make sure that this patch does not introduce any regressions. The 
> > > remaining ones of the series look fine by me!
> > > 
> > > [1] 
> > which one? Did I miss anything here?
> 
> Sorry, my mail client tried to wrap the long link and ended up in a 
> loooong email.
> 
> [1] https://patchwork.ozlabs.org/project/netdev/list/?series=109699
> 
Got it.
> Thanks,
> Jose Miguel Abreu
