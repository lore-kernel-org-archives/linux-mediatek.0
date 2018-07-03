From: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [ANN] mt76x0 usb driver
Date: Tue, 3 Jul 2018 17:31:04 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1807031725420.3545@T420s>
References: <20180409141032.GA9247@redhat.com> <20180409142640.GA5680@localhost.localdomain> <20180409144819.GA9253@redhat.com> <20180625120816.GA2072@redhat.com> <CAA2SeNJjHCrO5NyznK+EJt5K6SRVRr_FPZA2i53Z-FnqzkKz_g@mail.gmail.com> <20180625135419.GA3282@redhat.com>
 <CAJ0CqmXE7hF8UAe2iAZ7GhYWb7Uf3zJ+Fg_ervfyK1ojS1Oh=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJ0CqmXE7hF8UAe2iAZ7GhYWb7Uf3zJ+Fg_ervfyK1ojS1Oh=w@mail.gmail.com>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, =?ISO-8859-2?Q?Jakub_Kici=F1ski?= <moorray3-5tc4TXWwyLM@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Michal Schmidt <mschmidt-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi

>
> On Mon, Jun 25, 2018 at 02:55:51PM +0200, Lorenzo Bianconi wrote:

> > Not sure why many integration commits in upstream is a problem. I think
> > having patches posted on mailing list is better than doing them in my
> > "private" tree without any review.
> >
> > > What do you think?
> >
> > I was thinking about posting mt76x0 driver in a subdir (there is sill
> > some cleanup work need to be done there), wait for upstream mt76x2u
> > integration, then post patches that remove duplication between mt76x2
> > and mt76x0 and add support for mt76x0e on the way.
> >
> 
> Ack, fine. I modified a little bit mt76x2u/usb architecture moving
> some parts in common with mt76x0u
> in mt76-usb module (e.g. mt76_queue management in tx_status data path,
> tx_stats workqueue,
> some mcu utility routines). In this way the integration will be easier I guess
> 
> Regards,
> Lorenzo
> 
> > Thanks
> > Stanislaw
> 

I'm currrently working mt76x0u on top of Lorenzo's mt76x2u driver.

Ulli
