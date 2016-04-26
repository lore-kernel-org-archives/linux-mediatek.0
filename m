From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: core: buffer: avoid NULL pointer dereferrence
Date: Tue, 26 Apr 2016 16:11:15 -0700
Message-ID: <20160426231115.GB23273@kroah.com>
References: <20160408140701.GA3547@kroah.com>
 <Pine.LNX.4.44L0.1604081120190.2069-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1604081120190.2069-100000@iolanthe.rowland.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, Apr 08, 2016 at 11:21:05AM -0400, Alan Stern wrote:
> On Fri, 8 Apr 2016, Greg Kroah-Hartman wrote:
> 
> > On Fri, Apr 08, 2016 at 05:08:03PM +0800, Chunfeng Yun wrote:
> > > NULL pointer dereferrence will happen when class driver
> > > wants to allocate zero length buffer and pool_max[0]
> > > can't be used, so skip reserved pool in this case.
> > 
> > Why would a driver want to allocate a 0 length buffer?  What driver does
> > this?
> > 
> > Shouldn't we fix that issue instead?
> 
> And even if a driver does want to allocate a 0-length buffer, shouldn't 
> the function simply return early instead of running through all its 
> calculations?

Yes it should, Chunfeng, can you fix this patch to do that please.

thanks,

greg k-h
