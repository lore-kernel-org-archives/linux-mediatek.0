From: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: mt8173-evb: failing to boot in linux-next and mainline
Date: Mon, 28 Mar 2016 19:51:16 +0800
Message-ID: <1459165876.24094.8.camel@mtksdaap41>
References: <CAOi56cV2M_Ee2AhxTUgHhZuZ1y7LH4sKKyiq3Okorj3K+L15GA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAOi56cV2M_Ee2AhxTUgHhZuZ1y7LH4sKKyiq3Okorj3K+L15GA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi Kevin,

On Thu, 2016-03-24 at 11:42 -0700, Kevin Hilman wrote:
> Hello,
> 
> The mt8173-evb has been failing to boot in linux-next since 29 Feb,
> and is now causing failures in mainline[2] since the merge window is
> open and things are getting merged.
> 
> Bisecting this has led to inconclusive results, so I'm still not sure
> what the real culprit is.  The last few kernel for the failures are:
> 
> [    0.570979] NET: Registered protocol family 17
> [    0.571615] 9pnet: Installing 9P2000 support
> [    0.572211] Key type dns_resolver registered
> [    0.573195] registered taskstats version 1
> [    0.574170] hctosys: unable to open rtc device (rtc0)
> [    0.581122] usb_vbus: disabling
> 
> Thinking it was this regulator getting prematurely disabled, I set the
> 'regulator-always-on' property, which doesn't do much better, but does
> report a CPU stall:
> 
> [    0.556186] NET: Registered protocol family 17
> [    0.556829] 9pnet: Installing 9P2000 support
> [    0.557496] Key type dns_resolver registered
> [    0.558669] registered taskstats version 1
> [    0.559611] hctosys: unable to open rtc device (rtc0)
> [   21.573504] INFO: rcu_preempt detected stalls on CPUs/tasks:
> [   21.574227]  1-...: (1 GPs behind) idle=483/140000000000000/0
> softirq=221/222 fqs=2638
> [   21.575227]  (detected by 3, t=5252 jiffies, g=-238, c=-239, q=204)
> [   21.576017] Task dump for CPU 1:
> [   21.576424] swapper/0       R  running task        0     1      0 0x00000002
> [   21.577316] Call trace:
> [   21.577634] [<ffffff8008086c20>] __switch_to+0xd0/0xdc
> [   21.578280] [<ffffffc077096900>] 0xffffffc077096900
> [   33.321443] random: nonblocking pool is initialized
> [   84.593487] INFO: rcu_preempt detected stalls on CPUs/tasks:
> [   84.594207]  1-...: (1 GPs behind) idle=483/140000000000000/0
> softirq=221/222 fqs=10861
> [   84.595216]  (detected by 3, t=21007 jiffies, g=-238, c=-239, q=204)
> [   84.596017] Task dump for CPU 1:
> [   84.596424] swapper/0       R  running task        0     1      0 0x00000002
> [   84.597315] Call trace:
> [   84.597628] [<ffffff8008086c20>] __switch_to+0xd0/0xdc
> [   84.598273] [<ffffffc077096900>] 0xffffffc077096900
> 
> Anyways, I gave up on this for now hoping someone here would take a closer look.
> 
> Thanks,
> 
> Kevin
> 
> [1] https://kernelci.org/boot/mt8173-evb/job/next/kernel/next-20160324/defconfig/defconfig/lab/lab-khilman/?_id=56f3b10759b51423934b0500
> [2] https://kernelci.org/boot/mt8173-evb/job/mainline/kernel/v4.5-12149-gaca04ce5dbda/defconfig/defconfig/lab/lab-khilman/?_id=56f3c33f59b5145aa14b04f2
> 

Thanks your testing again. I can reproduce your case in my local
environment using 4.6-rc1. After checking, there are two ways to avoid
the hang:
1. set clk_ignore_unused to kernel command line
2. Revert patch "cc8ed76 soc: mediatek: SCPSYS: Fix double enabling of
regulators"

It seems there is a problem between turn on/off clock and power domain.
We will try to fix this and send patch to public once have a solution.

Thanks
Eddie
