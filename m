From: biao huang <biao.huang@mediatek.com>
Subject: RE: [v2, PATCH 3/4] net: stmmac: modify default value of tx-frames
Date: Tue, 4 Jun 2019 10:31:06 +0800
Message-ID: <1559615466.24897.106.camel@mhfsdcap03>
References: <1559527086-7227-1-git-send-email-biao.huang@mediatek.com>
         <1559527086-7227-4-git-send-email-biao.huang@mediatek.com>
         <78EB27739596EE489E55E81C33FEC33A0B93B6DF@DE02WEMBXB.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <78EB27739596EE489E55E81C33FEC33A0B93B6DF@DE02WEMBXB.internal.synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "andrew@lunn.ch" <andrew@lunn.ch>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "yt.shen@mediatek.com" <yt.shen@mediatek.com>, "jianguo.zhang@mediatek.com" <jianguo.zhang@mediatek.com>, "boon.leong.ong@intel.com" <boon.leong.ong@in>
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2019-06-03 at 11:40 +0000, Jose Abreu wrote:
> From: Biao Huang <biao.huang@mediatek.com>
> 
> > the default value of tx-frames is 25, it's too late when
> > passing tstamp to stack, then the ptp4l will fail:
> > 
> > ptp4l -i eth0 -f gPTP.cfg -m
> > ptp4l: selected /dev/ptp0 as PTP clock
> > ptp4l: port 1: INITIALIZING to LISTENING on INITIALIZE
> > ptp4l: port 0: INITIALIZING to LISTENING on INITIALIZE
> > ptp4l: port 1: link up
> > ptp4l: timed out while polling for tx timestamp
> > ptp4l: increasing tx_timestamp_timeout may correct this issue,
> >        but it is likely caused by a driver bug
> > ptp4l: port 1: send peer delay response failed
> > ptp4l: port 1: LISTENING to FAULTY on FAULT_DETECTED (FT_UNSPECIFIED)
> > 
> > ptp4l tests pass when changing the tx-frames from 25 to 1 with
> > ethtool -C option.
> > It should be fine to set tx-frames default value to 1, so ptp4l will pass
> > by default.
> 
> I'm not sure if this is the right approach ... What's the timeout value 
> you have for TX Timestamp ?
I use the default tx_timestamp_timeout value 1, which represents 1ms.
do you try ptp4l on your side?

performance test is done in https://lkml.org/lkml/2019/5/30/1617
and seems no performance degradation.

> 
> Thanks,
> Jose Miguel Abreu
