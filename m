From: chunfeng yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH] usb: core: buffer: avoid NULL pointer dereferrence
Date: Mon, 11 Apr 2016 11:01:45 +0800
Message-ID: <1460343705.10419.12.camel@mhfsdcap03>
References: <1460106483-24793-1-git-send-email-chunfeng.yun@mediatek.com>
	 <20160408140701.GA3547@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160408140701.GA3547@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2016-04-08 at 07:07 -0700, Greg Kroah-Hartman wrote:
> On Fri, Apr 08, 2016 at 05:08:03PM +0800, Chunfeng Yun wrote:
> > NULL pointer dereferrence will happen when class driver
> > wants to allocate zero length buffer and pool_max[0]
> > can't be used, so skip reserved pool in this case.
> 
> Why would a driver want to allocate a 0 length buffer?  What driver does
> this?
It's misc/usbtest.c
> 
> Shouldn't we fix that issue instead?
I don't know which way is better, but it seems simple to fix it up in
buffer.c 
> 
> thanks,
> 
> greg k-h
