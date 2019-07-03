From: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH] checkpatch: avoid default n
Date: Wed, 3 Jul 2019 19:22:30 +0800
Message-ID: <1562152950.25531.4.camel@mtkswgap22>
References: <20190703083031.2950-1-miles.chen@mediatek.com>
         <be8a97c15249ff8a613910db5792c5bcdc75333c.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <be8a97c15249ff8a613910db5792c5bcdc75333c.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2019-07-03 at 01:42 -0700, Joe Perches wrote:
> On Wed, 2019-07-03 at 16:30 +0800, Miles Chen wrote:
> > This change reports a warning when "default n" is used.
> > 
> > I have seen several "remove default n" patches, so I think
> > it might be helpful to add this test in checkpatch.
> > 
> > tested:
> > WARNING: 'default n' is the default value, no need to write it explicitly.
> > +       default n
> 
> I don't think this is reasonable as there are
> several uses like:
> 
> 		default y
> 		default n if <foo>
> 
> For instance:
> 
> arch/alpha/Kconfig-config ALPHA_WTINT
> arch/alpha/Kconfig-     bool "Use WTINT" if ALPHA_SRM || ALPHA_GENERIC
> arch/alpha/Kconfig-     default y if ALPHA_QEMU
> arch/alpha/Kconfig:     default n if ALPHA_EV5 || ALPHA_EV56 || (ALPHA_EV4 && !ALPHA_LCA)
> arch/alpha/Kconfig:     default n if !ALPHA_SRM && !ALPHA_GENERIC
> 
> 
Thanks for your comment, perhaps we can just deal with the "default n$"
case?

like:
+         $line =~ /^\+\s*\bdefault n$/) {
