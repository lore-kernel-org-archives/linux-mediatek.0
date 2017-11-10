From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: Frequent TX timeouts on a MT7623 (MT7530)
Date: Fri, 10 Nov 2017 11:18:28 +0800
Message-ID: <1510283908.20663.27.camel@mtkswgap22>
References: <CAKfDRXjU4wYXBfi=PV5fjsss_-4a2a4M24xKwEOVFXvk9daVTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAKfDRXjU4wYXBfi=PV5fjsss_-4a2a4M24xKwEOVFXvk9daVTg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Kristian Evensen <kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, 2017-11-09 at 20:35 +0100, Kristian Evensen wrote:
> Hello,
> 
> I am (still) working on adding upstream support for an MT7623-based
> board and have found a bug in either the Ethernet driver or, most
> likely, the MT7530 switch itself. When the next-hop fails, but the
> link layer does not go down, then I always get a "transmit timed
> out"-error. This error message appears roughly every minute and the TX
> part of the switch is dead. I have verified with tcpdump that RX works
> fine. If I restart the ports, then TX starts working again until the
> error strikes next time.
> 

Hi, Kristian

Do you use both eth0 and eth1 for routing those packets ?

I guess there are probable coherence problems between gmac1 and gmac2 on
hardware which are mapped into eth0 , eth1, on software, respectively.

coherence problem would probably complete skbs into wrong devices which 
causes the watchdog timer out after a wait for certain time.

can you help to disable eth1 and use eth0 ONLY to route packets to test
whether the setup still hits the problem?

For example, the setup could be, you just take lan0 as LAN port , lan1
as WAN port and then disable eth1 and its slave device wan and test
again routing packets between lan0 and lan1.

If everything goes right, we continues to see what's going wrong in the
dual gmac case.

> I first started seeing the error during normal usage of my device, and
> in order to reproduce it I created the following testbed:
> 
> NUC (192.168.1.1) <-> (192.168.1.2) MT7623 (192.168.2.1) <->
> (192.168.2.2) Router #2 (192.168.3.1) <-> (192.168.3.2) Client
> 
> I configured UDP port 1203 to be forwarded from the MT7623 to router
> #2, and finally to the client. I then ran the following iperf command
> on the NUC to start hammering my routers with small-ish packets:
> 
> iperf -u -c 192.168.1.2 -t 72000 -d -p 1203 -l 100B -b 1000M
> 
> I then found a way to reliably trigger an RCU stall on router #2.
> Whenever I trigger the stall, the "transmit timed out"-error appears
> on the MT7623 and I can no longer send packets on any of the
> switch-ports/interfaces. If I disable/enable the port that router #2
> is connected to, TX works for a little bit until the "transmit timed
> out"-error is triggered again (just leaving the other router in the
> stalled-state). The error message from the kernel looks as follows
> (the last two lines are the ones that keep repeating over and over):
> 
> [  602.073791] ------------[ cut here ]------------
> [  602.078404] WARNING: CPU: 0 PID: 0 at net/sched/sch_generic.c:316
> dev_watchdog+0x190/0x210
> [  602.086617] NETDEV WATCHDOG: eth0 (mtk_soc_eth): transmit queue 0 timed out
> [  602.093523] Modules linked in: rt2800pci rt2800mmio rt2800lib
> qcserial ppp_async option usb_wwan rt2x00pci rt2x00mmio rt2x00lib
> rndis_host qmi_wwan ppp_generic nf_nat_pptp nf_conntrack_pptp
> nf_conntrack_ipv6 mt76x2i
> [  602.299851] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W       4.9.58 #0
> [  602.306925] Hardware name: Mediatek Cortex-A7 (Device Tree)
> [  602.312465] [<c0015b54>] (unwind_backtrace) from [<c00120e0>]
> (show_stack+0x10/0x14)
> [  602.320150] [<c00120e0>] (show_stack) from [<c019e0f8>]
> (dump_stack+0x78/0x98)
> [  602.327317] [<c019e0f8>] (dump_stack) from [<c001d6b0>] (__warn+0xbc/0xec)
> [  602.334137] [<c001d6b0>] (__warn) from [<c001d714>]
> (warn_slowpath_fmt+0x34/0x44)
> [  602.341563] [<c001d714>] (warn_slowpath_fmt) from [<c031d050>]
> (dev_watchdog+0x190/0x210)
> [  602.349678] [<c031d050>] (dev_watchdog) from [<c0066af0>]
> (call_timer_fn+0x20/0x94)
> [  602.357275] [<c0066af0>] (call_timer_fn) from [<c0066c20>]
> (expire_timers+0xbc/0xd0)
> [  602.364957] [<c0066c20>] (expire_timers) from [<c0066ccc>]
> (run_timer_softirq+0x98/0x164)
> [  602.373074] [<c0066ccc>] (run_timer_softirq) from [<c00218d4>]
> (__do_softirq+0xe8/0x228)
> [  602.381102] [<c00218d4>] (__do_softirq) from [<c0021c78>]
> (irq_exit+0x90/0xf4)
> [  602.388268] [<c0021c78>] (irq_exit) from [<c00584ac>]
> (__handle_domain_irq+0xa4/0xe0)
> [  602.396036] [<c00584ac>] (__handle_domain_irq) from [<c00093fc>]
> (gic_handle_irq+0x50/0x94)
> [  602.404323] [<c00093fc>] (gic_handle_irq) from [<c0012bac>]
> (__irq_svc+0x6c/0xa8)
> [  602.411741] Exception stack(0xc055df60 to 0xc055dfa8)
> [  602.416750] df60: 00000000 00000000 00076aca c001a720 c055c000
> c055efe4 00000001 c05695e5
> [  602.424861] df80: c055f034 c054aa28 00000000 00000000 00000000
> c055dfb0 c000f774 c000f778
> [  602.432968] dfa0: 60000013 ffffffff
> [  602.436429] [<c0012bac>] (__irq_svc) from [<c000f778>]
> (arch_cpu_idle+0x2c/0x38)
> [  602.443768] [<c000f778>] (arch_cpu_idle) from [<c0050650>]
> (cpu_startup_entry+0xc0/0x120)
> [  602.451882] [<c0050650>] (cpu_startup_entry) from [<c0528bb8>]
> (start_kernel+0x300/0x36c)
> [  602.460011] ---[ end trace b53e2408cef2bb4e ]---
> [  602.464602] mtk_soc_eth 1b100000.ethernet eth0: transmit timed out
> [  602.499529] mtk_soc_eth 1b100000.ethernet eth0: rx pause enabled,
> tx pause enabled
> 
> My MT7623 is running LEDE, which is why the kernel version is 4.9 and
> not 4.14. However, based on my understanding, the LEDE MT7623 network
> driver is fairly up to date, and I don't think this is a driver issue
> anyway. The reason I say that is that I am able to trigger the timeout
> on all devices I have that are equipped with an MT7530 switch (for
> example MT7621-based boards). Also, the error is easy to trigger even
> with the proprietary drivers/firmware. With MT7621, I have seen the
> error in both lightly and heavily loaded network. So it seems be some
> traffic pattern or network behavior that triggers the timeout, and not
> necessarily the amount of traffic.
> 

At least one thing as I knew is different between LEDE and upstream.
which is LEDE includes extra hacking for having the support of dual cpu
port on DSA while the upstream code still uses the single cpu port on
DSA.

> In order to try to debug the problem, I have looked at what feels like
> everything. For example, when the timeout happens, the TX DMA
> ringbuffer looks sane. I.e., all txds between dtx and ctx has an SKB
> attached and DDONE is not set, while all txds between ctx and dtx have
> DDONE set and no SKB attached.
> 
> My initial theory was that something caused DMA to stop, but that
> seems to be wrong. When I restart the ports, TX works again and what
> seems to be buffered packets are released. For example, when running
> ping (from 192.168.1.2 to 192.168.1.1) while the error happened and
> then restarting the ports, I saw RTTs of ~20 seconds. Instead, it
> seems that something causes TX for the whole switch to stop/block, and
> the only way to restore TX is to disable/enable the port.
> 
> Does anyone have an idea of what could be wrong, bits in registers to
> set or other things to try to fix this bug/work around it?
> 
> Thanks in advance for any help,
> Kristian
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
