From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH net-next v2 0/4] of_get_mac_address ERR_PTR fixes
Date: Tue, 7 May 2019 09:41:26 +0200
Message-ID: <20190507074126.GA26478@kroah.com>
References: <1557177887-30446-1-git-send-email-ynezz@true.cz>
 <20190507071914.GJ2269@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190507071914.GJ2269@kadam>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>, Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, devel@driverdev.osuosl.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

On Tue, May 07, 2019 at 10:19:14AM +0300, Dan Carpenter wrote:
> On Mon, May 06, 2019 at 11:24:43PM +0200, Petr Štetiar wrote:
> > Hi,
> > 
> > this patch series is an attempt to fix the mess, I've somehow managed to
> > introduce.
> > 
> > First patch in this series is defacto v5 of the previous 05/10 patch in the
> > series, but since the v4 of this 05/10 patch wasn't picked up by the
> > patchwork for some unknown reason, this patch wasn't applied with the other
> > 9 patches in the series, so I'm resending it as a separate patch of this
> > fixup series again.
> 
> I feel sort of ridiculous asking this over and over...  Maybe your spam
> filter is eating my emails?
> 
> This bug was introduced in https://patchwork.ozlabs.org/patch/1094916/
> "[v4,01/10] of_net: add NVMEM support to of_get_mac_address" but it
> looks like no one applied it.
> 
> You're acting as if it *was* applied but you refuse to answer my
> question who applied it and which to which tree so I can figure out what
> went wrong.
> 
> I only see comments from last Friday that it shouldn't be applied...  I
> also told you on Friday in a different thread that that patch shouldn't
> be applied.  Breaking git bisect is a bug, and we never do that.  I'm
> just very confused right now...  What I'm trying to do is figure out in
> my head how this process failed so we can do better next time.

Just to resend this, so that it hopefully does _not_ get stuck in a spam
filter.

Petr, please address Dan's comments, do not ignore them.

greg k-h
