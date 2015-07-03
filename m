From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: MT7623 Wifi SoC support questions
Date: Fri, 03 Jul 2015 15:44:43 +0200
Message-ID: <14968847.0a6uI5oGvX@ubix>
References: <5593C939.1020004@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <5593C939.1020004-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Wednesday, July 01, 2015 01:04:25 PM John Crispin wrote:
> Hi all,
> 
> I am currently busy making the linux-mediatek support work on the MT7623
> made by Mediatek/Ralink so we can add support to OpenWrt.
> 
> This SoC looks very similar to the MT8127. The main differences are that
> it uses a MT6232 pmic and has pcie/ethernet.
> 
> I already managed to get lots of drivers up and running based on what
> has been posted on this list. If do however have a few questions.

It's good to hear, that you can take profit out of this effort. It clearly shows 
the value of getting a SoC mainline.

> 
> * I noticed that ARM_ARCH_TIMER is not selected in v4.1 If I only
> register the mtk_timer, SMP comes up but the 3 extra cores seem to get
> no timer irqs and the whole system seems to run very slow. Selecting
> ARM_ARCH_TIMER makes the system boot fine. Is mtk_timer enough for other
> MTK SoCs to work ?

I think the basic problem, at least with mt6589 was, that the cntfreq register 
was not set correctly by the bootloader, which made the ARM_ARCH_TIMER 
unusable.

Apart from that I think, the ARM_ARCH_TIMER will get turned off in some deep 
idle state, so that you need mtk_timer (I'm not sure if this holds for mt7623 
as well).

> 
> * The MT7623 has a 7 port PWM that looks different to the display-pwm
> driver that was posted. This PWM has an old and new mode. Oldmode looks
> like classic period/duty cyle config, while the new mode has lots of
> complexe features. the kernel PWM subsystem can only handle oldmode
> style config right now so i was going to add a driver. is anyone working
> on this already ? is this core mt7623 specific or do other SoCs have it
> aswell ? The registers i have here are called PWMX_CON, PWMX_HDURATION,
> PWMX_LDURATION, PWMX_GDURATION ....
> 

I it seems that this PWM is present in other SoCs as well.

Best regards,
Matthias
