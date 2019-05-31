From: biao huang <biao.huang@mediatek.com>
Subject: Re: [PATCH 3/4] net: stmmac: modify default value of tx-frames
Date: Fri, 31 May 2019 09:46:43 +0800
Message-ID: <1559267203.24897.101.camel@mhfsdcap03>
References: <1559206484-1825-1-git-send-email-biao.huang@mediatek.com>
         <1559206484-1825-4-git-send-email-biao.huang@mediatek.com>
         <20190530125832.GB22727@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530125832.GB22727@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Jose Abreu <joabreu@synopsys.com>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, jianguo.zhang@mediatek.com, boon.leong.ong@intel.com
List-Id: linux-mediatek@lists.infradead.org

Hi Andrew,

On Thu, 2019-05-30 at 14:58 +0200, Andrew Lunn wrote:
> On Thu, May 30, 2019 at 04:54:43PM +0800, Biao Huang wrote:
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
> Hi Biao
> 
> What does this do to the number of interrupts? Do we get 25 times more
> interrupts? Have you done any performance tests to see if this causes
> performance regressions?
Yes, it seems tx-frames=25 can reduce interrupts.
But the tx interrupt is handled in napi now, which will disable/enable
tx interrupts at the beginning/ending of napi flow.

Here is the test result on our platform:
		tx-frames=1		tx-frames=25		
irq number	478514			393750	
performance	904Mbits/sec		902Mbits/sec

commands for test:
	"cat /proc/interrupts | grep eth0"
	"iperf3 -c ipaddress -w 256K -t 60"

Thanks to napi, the interrupts will not grow 25 times more(almost the
same level), and no obvious performance degradation.

Is there anybody can double check the performance with tx-frames = 0 or
25?
> 
> 	    Andrew
Thanks.
Biao
