From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: RE: [PATCH 2/2] net-next: stmmac: add mdio clause 45 access from
 mac device for dwmac4
Date: Mon, 29 Apr 2019 15:19:16 +0000
Message-ID: <78EB27739596EE489E55E81C33FEC33A0B46E5B4@DE02WEMBXB.internal.synopsys.com>
References: <1556519724-1576-1-git-send-email-biao.huang@mediatek.com>
 <1556519724-1576-3-git-send-email-biao.huang@mediatek.com>
 <AF233D1473C1364ABD51D28909A1B1B75C0C27ED@pgsmsx114.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AF233D1473C1364ABD51D28909A1B1B75C0C27ED@pgsmsx114.gar.corp.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Ong, Boon Leong" <boon.leong.ong@intel.com>, Biao Huang <biao.huang@mediatek.com>, "davem@davemloft.net" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "yt.shen@mediatek.com" <yt.shen@mediatek.com>, "jianguo.zhang@mediatek.com" <jianguo.zhang@mediatek.com>, "Kweh, Hock Leong" <hock.leong.kweh@intel.com>, "Voon, Weifeng" <weifeng.voon@intel.com>
List-Id: linux-mediatek@lists.infradead.org

From: Ong, Boon Leong <boon.leong.ong@intel.com>
Date: Mon, Apr 29, 2019 at 16:15:42

> What is the preference of the driver maintainer here? =20

Your implementation doesn't need the mdelay() so I think we should follow=20
your way once you also address the review comments from Andrew and me.

Maybe you can coordinate with Biao and submit a C45 implementation that=20
can be tested by both ?

Thanks,
Jose Miguel Abreu
