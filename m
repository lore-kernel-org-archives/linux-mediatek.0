From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] checkpatch: avoid default n
Date: Wed, 03 Jul 2019 01:42:55 -0700
Message-ID: <be8a97c15249ff8a613910db5792c5bcdc75333c.camel@perches.com>
References: <20190703083031.2950-1-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703083031.2950-1-miles.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miles Chen <miles.chen@mediatek.com>, Andy Whitcroft <apw@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2019-07-03 at 16:30 +0800, Miles Chen wrote:
> This change reports a warning when "default n" is used.
> 
> I have seen several "remove default n" patches, so I think
> it might be helpful to add this test in checkpatch.
> 
> tested:
> WARNING: 'default n' is the default value, no need to write it explicitly.
> +       default n

I don't think this is reasonable as there are
several uses like:

		default y
		default n if <foo>

For instance:

arch/alpha/Kconfig-config ALPHA_WTINT
arch/alpha/Kconfig-     bool "Use WTINT" if ALPHA_SRM || ALPHA_GENERIC
arch/alpha/Kconfig-     default y if ALPHA_QEMU
arch/alpha/Kconfig:     default n if ALPHA_EV5 || ALPHA_EV56 || (ALPHA_EV4 && !ALPHA_LCA)
arch/alpha/Kconfig:     default n if !ALPHA_SRM && !ALPHA_GENERIC
