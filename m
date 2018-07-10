From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [SPAM][PATCH v2 00/12] Add mt76x0 driver
Date: Tue, 10 Jul 2018 22:41:01 +0200
Message-ID: <CAJ0CqmXSVsosoZm0AB5sK9r77ipi=9jbhjg-OFVDRO3y29sT=w@mail.gmail.com>
References: <1530875029-26274-1-git-send-email-sgruszka@redhat.com>
 <1531205430.26214.8.camel@mtkswgap22> <20180710095222.GA18926@redhat.com>
 <1531230864.26214.20.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1531230864.26214.20.camel@mtkswgap22>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jakub Kicinski <kubakici-5tc4TXWwyLM@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Michal Schmidt <mschmidt-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

> On Tue, 2018-07-10 at 11:52 +0200, Stanislaw Gruszka wrote:
> > On Tue, Jul 10, 2018 at 02:50:30PM +0800, Sean Wang wrote:
> > > > For full support mt7610.bin firmware blob is need, hopefully with
> > > > the permission of Mediatek, the blob will be pushed into linux-firmware
> > > > git tree.
> > > >
> > >
> > > Hi, Stanislaw
> > >
> > > You can feel free to add mt7610.bin firmware blob to linux-firmware with
> > > the license LICENCE.mediatek I added in [1].
> > >
> > >
> > > [1]
> > > http://lists.infradead.org/pipermail/linux-mediatek/2018-June/013759.html
> >
> > Thank you Sean!
> >
> > I guess there is no problem with similar submission for
> > mt7662u.bin and mt7662u_rom_patch.bin needed for mt76x2u:
> > https://marc.info/?l=linux-wireless&m=153045438821562&w=2
> >
>
> Sure, there is no any problem for submitting mt7662u.bin and
> mt7662u_rom_patch.bin if they are added with LICENCE.mediatek.
>

Thank you Sean!

I will submit mt7662u.bin and mt7662u_rom_patch.bin with LICENCE.mediatek soon.

> Do you or Lorenzo have a plan to add MT7668u support to mt76?
> MT7668 is a newer wifi device than MT7610u or MT7662u.
>

Cool, I am interested in adding the support for mt7668u to mt76 driver.
Is the adapter available on the market?
Regards,

Lorenzo

> > Regards
> > Stanislaw
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
>
>
