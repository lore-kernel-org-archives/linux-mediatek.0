From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH] usb: core: buffer: avoid NULL pointer dereferrence
Date: Mon, 11 Apr 2016 10:44:45 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1604111043340.2314-100000@iolanthe.rowland.org>
References: <1460358968.10419.26.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460358968.10419.26.camel@mhfsdcap03>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, 11 Apr 2016, chunfeng yun wrote:

> On Mon, 2016-04-11 at 08:07 +0300, Felipe Balbi wrote:
> > Hi,
> > 
> > chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> writes:
> > > On Fri, 2016-04-08 at 07:07 -0700, Greg Kroah-Hartman wrote:
> > >> On Fri, Apr 08, 2016 at 05:08:03PM +0800, Chunfeng Yun wrote:
> > >> > NULL pointer dereferrence will happen when class driver
> > >> > wants to allocate zero length buffer and pool_max[0]
> > >> > can't be used, so skip reserved pool in this case.
> > >> 
> > >> Why would a driver want to allocate a 0 length buffer?  What driver does
> > >> this?
> > > It's misc/usbtest.c
> > 
> > that'll do what you ask it to do with the userspace tool testusb. Are
> > you trying to pass a size of 0 ?
> > 
> No, I just ran "testusb -t10" which called test_ctrl_queue().
> In this function, sub-case 8 passed a parameter @len as 0 to
> simple_alloc_urb(), and then it tried to allocate a 0-length buffer.

That should be easy enough to fix.  Just skip the calls that allocate 
the buffer if the length would be 0.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
