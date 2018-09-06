From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 39/42] mt76: move some irq code to common mmio module
Date: Thu, 6 Sep 2018 11:37:45 +0200
Message-ID: <CAJ0CqmWrDke=WWPukf09rXYkCV3e4JKgcoBgvytVeyy1j8ZvOA@mail.gmail.com>
References: <1536225538-16454-1-git-send-email-sgruszka@redhat.com>
 <1536225538-16454-40-git-send-email-sgruszka@redhat.com> <91c0c1d5-12a9-7155-c4bf-191a511080ee@nbd.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <91c0c1d5-12a9-7155-c4bf-191a511080ee-Vt+b4OUoWG0@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Cc: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

>
> On 2018-09-06 11:18, Stanislaw Gruszka wrote:
> > Move some irq handling code to generic mmio module.
> >
> > Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Please drop this patch. This won't work on MT7603 and later.
>
> - Felix

I can move that code in a dedicated module with a separated patch.
I have a pending patchset to fix that kind of issues for usb as well.
Does it sound good?

Regards,
Lorenzo
