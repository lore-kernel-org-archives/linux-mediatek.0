From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH] usb: core: buffer: avoid NULL pointer dereferrence
Date: Fri, 8 Apr 2016 11:21:05 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1604081120190.2069-100000@iolanthe.rowland.org>
References: <20160408140701.GA3547@kroah.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160408140701.GA3547-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 8 Apr 2016, Greg Kroah-Hartman wrote:

> On Fri, Apr 08, 2016 at 05:08:03PM +0800, Chunfeng Yun wrote:
> > NULL pointer dereferrence will happen when class driver
> > wants to allocate zero length buffer and pool_max[0]
> > can't be used, so skip reserved pool in this case.
> 
> Why would a driver want to allocate a 0 length buffer?  What driver does
> this?
> 
> Shouldn't we fix that issue instead?

And even if a driver does want to allocate a 0-length buffer, shouldn't 
the function simply return early instead of running through all its 
calculations?

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
