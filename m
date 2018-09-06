From: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 39/42] mt76: move some irq code to common mmio module
Date: Thu, 6 Sep 2018 12:29:36 +0200
Message-ID: <20180906102935.GC16539@redhat.com>
References: <1536225538-16454-1-git-send-email-sgruszka@redhat.com>
 <1536225538-16454-40-git-send-email-sgruszka@redhat.com>
 <91c0c1d5-12a9-7155-c4bf-191a511080ee@nbd.name>
 <CAJ0CqmWrDke=WWPukf09rXYkCV3e4JKgcoBgvytVeyy1j8ZvOA@mail.gmail.com>
 <786cb12a-a27e-bd82-edfd-9ea5866e5e00@nbd.name>
 <CAJ0CqmUeFaYhC-L8QdL9Q5RPG4zfR5eZUbHP7Savqg4Nr-C+fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJ0CqmUeFaYhC-L8QdL9Q5RPG4zfR5eZUbHP7Savqg4Nr-C+fw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Sep 06, 2018 at 11:47:53AM +0200, Lorenzo Bianconi wrote:
> >
> > On 2018-09-06 11:37, Lorenzo Bianconi wrote:
> > >>
> > >> On 2018-09-06 11:18, Stanislaw Gruszka wrote:
> > >> > Move some irq handling code to generic mmio module.
> > >> >
> > >> > Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > >> Please drop this patch. This won't work on MT7603 and later.
> > >>
> > >> - Felix
> > >
> > > I can move that code in a dedicated module with a separated patch.
> > > I have a pending patchset to fix that kind of issues for usb as well.
> > > Does it sound good?
> > I don't think it's worth having yet another dedicated module for these
> > small things. Just keep it in the common mt76x02 code, even if it
> > doesn't get used by the usb variants.
> >
> > - Felix
> 
> Ack, I agree. I guess Stanislaw can fix it sending a v2

Actually those two patches can be dropped from the set, remainging
40,41,42 patches will apply.

Kalle plese drop:
[PATCH 38/42] mt76: initial separation of mmio part
[PATCH 39/42] mt76: move some irq code to common mmio module

Thanks
Stanislaw
