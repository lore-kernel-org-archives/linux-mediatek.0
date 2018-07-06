From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 04/11] mt76x0: usb files
Date: Fri, 6 Jul 2018 12:42:27 +0200
Message-ID: <20180706104226.GC2033@redhat.com>
References: <1530771142-4118-1-git-send-email-sgruszka@redhat.com>
 <1530771142-4118-5-git-send-email-sgruszka@redhat.com>
 <20180705150519.GB17524@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180705150519.GB17524-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Jakub Kicinski <kubakici-5tc4TXWwyLM@public.gmane.org>, Michal Schmidt <mschmidt-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Jul 05, 2018 at 05:05:20PM +0200, Lorenzo Bianconi wrote:
> > +static int mt76x0_suspend(struct usb_interface *usb_intf, pm_message_t state)
> > +{
> > +	struct mt76x0_dev *dev = usb_get_intfdata(usb_intf);
> > +
> > +	mt76x0_cleanup(dev);
> 
> Is it necessary to deallocate rx queue here in case of a system suspend?
> 

It's not optimal, but allow to utilize initialization and cleanup
routines in resume/suspend.

Regards.
Stanislaw
