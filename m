From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [v5, PATCH] net: stmmac: add support for hash table size
 128/256 in dwmac4
Date: Wed, 29 May 2019 10:30:46 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B9334CE@DE02WEMBXB.internal.synopsys.com>
References: <1559122268-22545-1-git-send-email-biao.huang@mediatek.com>
 <1559122268-22545-2-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559122268-22545-2-git-send-email-biao.huang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Biao Huang <biao.huang@mediatek.com>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "yt.shen@mediatek.com" <yt.shen@mediatek.com>, "jianguo.zhang@mediatek.com" <jianguo.zhang@mediatek.com>, "boon.leong.ong@intel.com" <boon.leong.ong@intel.com>, "andrew@lunn.ch" <andrew@lunn.ch>
List-Id: linux-mediatek@lists.infradead.org

From: Biao Huang <biao.huang@mediatek.com>
Date: Wed, May 29, 2019 at 10:31:08

> 1. get hash table size in hw feature reigster, and add support
> for taller hash table(128/256) in dwmac4.
> 2. only clear GMAC_PACKET_FILTER bits used in this function,
> to avoid side effect to functions of other bits.
>=20
> stmmac selftests output log:
> 	ethtool -t eth0
> 	The test result is FAIL
> 	The test extra info:
> 	 1. MAC Loopback                 0
> 	 2. PHY Loopback                 -95
> 	 3. MMC Counters                 0
> 	 4. EEE                          -95
> 	 5. Hash Filter MC               0
> 	 6. Perfect Filter UC            0
> 	 7. MC Filter                    0
> 	 8. UC Filter                    0
> 	 9. Flow Control                 1

Thanks for testing, this patch looks good to me.

Do you want to check why Flow Control selftest is failing ?


Thanks,
Jose Miguel Abreu
