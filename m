From: biao huang <biao.huang@mediatek.com>
Subject: RE: [PATCH 2/2] net-next: stmmac: add mdio clause 45 access from
 mac device for dwmac4
Date: Tue, 30 Apr 2019 16:58:43 +0800
Message-ID: <1556614723.24897.33.camel@mhfsdcap03>
References: <1556519724-1576-1-git-send-email-biao.huang@mediatek.com>
         <1556519724-1576-3-git-send-email-biao.huang@mediatek.com>
         <AF233D1473C1364ABD51D28909A1B1B75C0C27ED@pgsmsx114.gar.corp.intel.com>
         <78EB27739596EE489E55E81C33FEC33A0B46E5B4@DE02WEMBXB.internal.synopsys.com>
         <AF233D1473C1364ABD51D28909A1B1B75C0C2849@pgsmsx114.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AF233D1473C1364ABD51D28909A1B1B75C0C2849@pgsmsx114.gar.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ong, Boon Leong" <boon.leong.ong@intel.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, "davem@davemloft.net" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "yt.shen@mediatek.com" <yt.shen@mediatek.com>, "jianguo.zhang@mediatek.com" <jianguo.zhang@mediatek.com>, Kweh,
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2019-04-29 at 15:23 +0000, Ong, Boon Leong wrote:
> >> What is the preference of the driver maintainer here?
> >
> >Your implementation doesn't need the mdelay() so I think we should follow
> >your way once you also address the review comments from Andrew and me.
> >
> >Maybe you can coordinate with Biao and submit a C45 implementation that
> >can be tested by both ?
> 
> Ok. We will address the review comments for that patch-series and resend the
> v3 patch-series soonest and for Biao to test. 
>  
I'll test it when your patch is ready. Please cc me, thanks.
> Thanks
