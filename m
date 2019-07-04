From: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH] checkpatch: avoid default n
Date: Thu, 4 Jul 2019 13:48:03 +0800
Message-ID: <1562219283.6549.2.camel@mtkswgap22>
References: <20190703083031.2950-1-miles.chen@mediatek.com>
         <be8a97c15249ff8a613910db5792c5bcdc75333c.camel@perches.com>
         <1562144624.3550.1.camel@mtksdaap41>
         <c8d5cc6171d2cff131e8600ac57e2eb441812617.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c8d5cc6171d2cff131e8600ac57e2eb441812617.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>, Andy Whitcroft <apw@canonical.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2019-07-03 at 08:37 -0700, Joe Perches wrote:
> On Wed, 2019-07-03 at 17:03 +0800, Yingjoe Chen wrote:
> > On Wed, 2019-07-03 at 01:42 -0700, Joe Perches wrote:
> > > On Wed, 2019-07-03 at 16:30 +0800, Miles Chen wrote:
> > > > This change reports a warning when "default n" is used.
> > > > 
> > > > I have seen several "remove default n" patches, so I think
> > > > it might be helpful to add this test in checkpatch.
> > > > DEFAULT_VALUE_STYLE
> > > > tested:
> > > > WARNING: 'default n' is the default value, no need to write it explicitly.
> > > > +       default n
> > > 
> > > I don't think this is reasonable as there are
> > > several uses like:
> > > 
> > > 		default y
> > > 		default n if <foo>
> > > 
> > > For instance:
> > > 
> > > arch/alpha/Kconfig-config ALPHA_WTINT
> > > arch/alpha/Kconfig-     bool "Use WTINT" if ALPHA_SRM || ALPHA_GENERIC
> > > arch/alpha/Kconfig-     default y if ALPHA_QEMU
> > > arch/alpha/Kconfig:     default n if ALPHA_EV5 || ALPHA_EV56 || (ALPHA_EV4 && !ALPHA_LCA)
> > > arch/alpha/Kconfig:     default n if !ALPHA_SRM && !ALPHA_GENERIC
> > 
> > Hi,
> > 
> > 
> > I've sent similar patch in 2016, my version won't complain about these.
> > 
> > https://lkml.org/lkml/2016/4/22/580
> 
> Hi again.
> 
> https://lore.kernel.org/lkml/1461259011.1918.23.camel@perches.com/
> 
> I would prefer a generic solution that also handles the
> quoted use.
> 
> $ git grep -P 'default\s*\"[ynm]"' -- '*/Kconfig*'
> arch/mips/Kconfig:      default "y"
> arch/mips/Kconfig:      default "y"
> arch/mips/Kconfig:      default "y"
> arch/mips/Kconfig:      default "y"
> arch/mips/cavium-octeon/Kconfig:        default "n"
> arch/mips/cavium-octeon/Kconfig:        default "y"
> arch/mips/cavium-octeon/Kconfig:        default "y"
> arch/mips/cavium-octeon/Kconfig:        default "y"
> arch/mips/cavium-octeon/Kconfig:        default "y"
> arch/mips/cavium-octeon/Kconfig:        default "y"
> arch/mips/cavium-octeon/Kconfig:        default "y"
> arch/powerpc/Kconfig:   default "y" if PPC_POWERNV
> arch/powerpc/Kconfig:   default "y" if PPC_POWERNV
> arch/powerpc/Kconfig:   default "n"
> drivers/auxdisplay/Kconfig:     default "n"
> drivers/crypto/Kconfig: default "m"
> drivers/rapidio/devices/Kconfig:        default "n"
> 
> or maybe 2 separate patches.
> 
> And the "default y" case and probably the
> "default \!?EXPERT" is or should be generally
> discouraged.  Especially for drivers.
> 
> https://lore.kernel.org/lkml/CAHk-=wiZ24JuVehJ5sEC0UG1Gk2nvB363wO02RRsR1oEht6R9Q@mail.gmail.com/
> 
> 
Thanks for your comment, I'll send another patch for these cases:
1. default "[ynm]"
2. default \!?EXPERT
3. default n$
