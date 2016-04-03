From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC PATCH 0/9] ARM: start to move arch/arm/mach-* to
 arch/arm/platforms/*
Date: Sun, 3 Apr 2016 19:25:43 +0100
Message-ID: <20160403182543.GQ19428@n2100.arm.linux.org.uk>
References: <1459694367-18635-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459694367-18635-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Marcus Cooper <codekipper@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: linux-mediatek@lists.infradead.org

On Sun, Apr 03, 2016 at 11:39:18PM +0900, Masahiro Yamada wrote:
> We have growing number of mach-* directories in arch/arm, and I guess
> it might be a good time to discuss moving them into a sub-directory.

What does it buy us?  Let me summarise the actual change:

- Move up to 71 arch/arm/mach-* directories to arch/arm/platforms/*,
  which just means another level of directory structure.  We still
  end up with up to 71 directories in arch/arm/platforms/

- The ability to use obj-y rather than machine-y, where both already
  work in the same way.

Is there anything I missed?

If that is all, then I really do not like this change - it's seems
to be churn for no benefit, and that's something we really should be
minimising.  Linus Torvalds has historically moaned at the ARM
architecture for stuff like this.

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
