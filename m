From: biao huang <biao.huang@mediatek.com>
Subject: RE: [v5, PATCH] net: stmmac: add support for hash table size
 128/256 in dwmac4
Date: Thu, 30 May 2019 09:39:09 +0800
Message-ID: <1559180349.24897.72.camel@mhfsdcap03>
References: <1559122268-22545-1-git-send-email-biao.huang@mediatek.com>
         <1559122268-22545-2-git-send-email-biao.huang@mediatek.com>
         <78EB27739596EE489E55E81C33FEC33A0B9334CE@DE02WEMBXB.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <78EB27739596EE489E55E81C33FEC33A0B9334CE@DE02WEMBXB.internal.synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "yt.shen@mediatek.com" <yt.shen@mediatek.com>, "jianguo.zhang@mediatek.com" <jianguo.zhang@mediatek.com>, "boon.leong.ong@intel.com" <boon.leong.ong@intel.com>, "andrew@lunn.ch" <andrew@lunn.ch>
List-Id: linux-mediatek@lists.infradead.org

Hi Jose,
	Flow control is disabled in v5 commit.

	I tried "insmod stmmac flow_ctrl=1", and the output log shows self test
pass:
	ethtool -t eth0                                    
	The test result is PASS
 	The test extra info:
 	 1. MAC Loopback                 0
 	 2. PHY Loopback                 -95
 	 3. MMC Counters                 0
 	 4. EEE                          -95
 	 5. Hash Filter MC               0
 	 6. Perfect Filter UC            0
 	 7. MC Filter                    0
 	 8. UC Filter                    0
	 9. Flow Control                 0

	Is v5 OK? Should I resend a v6?

On Wed, 2019-05-29 at 10:30 +0000, Jose Abreu wrote:
> From: Biao Huang <biao.huang@mediatek.com>
> Date: Wed, May 29, 2019 at 10:31:08
> 
> > 1. get hash table size in hw feature reigster, and add support
> > for taller hash table(128/256) in dwmac4.
> > 2. only clear GMAC_PACKET_FILTER bits used in this function,
> > to avoid side effect to functions of other bits.
> > 
> > stmmac selftests output log:
> > 	ethtool -t eth0
> > 	The test result is FAIL
> > 	The test extra info:
> > 	 1. MAC Loopback                 0
> > 	 2. PHY Loopback                 -95
> > 	 3. MMC Counters                 0
> > 	 4. EEE                          -95
> > 	 5. Hash Filter MC               0
> > 	 6. Perfect Filter UC            0
> > 	 7. MC Filter                    0
> > 	 8. UC Filter                    0
> > 	 9. Flow Control                 1
> 
> Thanks for testing, this patch looks good to me.
> 
> Do you want to check why Flow Control selftest is failing ?
> 
> 
> Thanks,
> Jose Miguel Abreu

Thanks,
Biao
