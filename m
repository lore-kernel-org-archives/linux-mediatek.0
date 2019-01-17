From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 1/3] mailbox: Add ability for clients to abort data in channel
Date: Thu, 17 Jan 2019 09:22:09 -0600
Message-ID: <CABb+yY3Lk7up2+mrwQGBowm0j6SEyitQkj0=q9Z+C7aHad56Qw@mail.gmail.com>
References: <20190116050435.11624-1-ck.hu@mediatek.com> <20190116050435.11624-2-ck.hu@mediatek.com>
 <CABb+yY0JfRbdVb_3wqxve1pYH0ZpFNrA2Kr6qovBruzhbeFRuw@mail.gmail.com> <1547712032.5318.17.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547712032.5318.17.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Thu, Jan 17, 2019 at 2:00 AM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Jassi:
>
> On Wed, 2019-01-16 at 10:22 -0600, Jassi Brar wrote:
> > On Tue, Jan 15, 2019 at 11:07 PM CK Hu <ck.hu@mediatek.com> wrote:
> > >
> > > This patch supplies a new framework API, mbox_abort_channel(), and
> > > a new controller interface, abort_data().
> > >
> > > For some client's application, it need to clean up the data in channel
> > > but keep the channel so it could send data to channel later.
> > >
> > > Signed-off-by: CK Hu <ck.hu@mediatek.com>
> > > ---
> > >  drivers/mailbox/mailbox.c          | 23 +++++++++++++++++++++++
> > >  include/linux/mailbox_client.h     |  1 +
> > >  include/linux/mailbox_controller.h |  4 ++++
> > >  3 files changed, 28 insertions(+)
> > >
> > > diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> > > index c6a7d4582dc6..281647162c76 100644
> > > --- a/drivers/mailbox/mailbox.c
> > > +++ b/drivers/mailbox/mailbox.c
> > > @@ -428,6 +428,29 @@ struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
> > >  }
> > >  EXPORT_SYMBOL_GPL(mbox_request_channel_byname);
> > >
> > > +/**
> > > + * mbox_abort_channel - The client abort all data in a mailbox
> > > + *                     channel by this call.
> > > + * @chan: The mailbox channel to be aborted.
> > > + */
> > > +void mbox_abort_channel(struct mbox_chan *chan)
> > > +{
> > > +       unsigned long flags;
> > > +
> > > +       if (!chan || !chan->cl)
> > > +               return;
> > > +
> > > +       if (chan->mbox->ops->abort_data)
> > > +               chan->mbox->ops->abort_data(chan);
> > > +
> > > +       /* The queued TX requests are simply aborted, no callbacks are made */
> > > +       spin_lock_irqsave(&chan->lock, flags);
> > > +       chan->cl = NULL;
> > > +       chan->active_req = NULL;
> > > +       spin_unlock_irqrestore(&chan->lock, flags);
> > > +}
> > >
> > Why not just release and then request channel again ?
> > mbox_abort_channel() is just a copy of mbox_free_channel() and if the
> > abort can sleep, that is more reason to just do that.
>
> The cursor may change position 300 times in one second, so I still
> concern the processing time. Request and free channel looks too heavy to
> do 300 times per second.
You send data 300Hz, not abort ... which is supposed to be a rare event.
And then your shutdown/startup is currently empty, while abort isn't
quite lightweight.

> Conceptually, I just want to clean up the
> channel rather than free and request it, so they are somewhat different.
> I say it may sleep because mbox_abort_channel() is a copy of
> mbox_free_channel(). I could change it to 'must not sleep' because
> Mediatek controller does not sleep in abort callback.
>
No please. Just use the shutdown/startup.

Thanks.
