From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] MAINTAINERS: Add mediatek git repository
Date: Thu, 20 Jul 2017 15:18:09 +0200
Message-ID: <20170720131809.GA19088@kroah.com>
References: <20170609084354.26499-1-matthias.bgg@gmail.com>
 <a0602546-11b4-87be-c738-9539208ce8cb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <a0602546-11b4-87be-c738-9539208ce8cb@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, mchehab@kernel.org, linux-mediatek@lists.infradead.org, davem@davemloft.net, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-mediatek@lists.infradead.org

On Thu, Jul 20, 2017 at 12:18:10PM +0200, Matthias Brugger wrote:
> On 06/09/2017 10:43 AM, Matthias Brugger wrote:
> > Mediatek repository lives in github for quite a while.
> > Add the repository to the file.
> > 
> > Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> > ---
> >   MAINTAINERS | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f7d568b8f133..41410639f650 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1554,6 +1554,7 @@ M:	Matthias Brugger <matthias.bgg@gmail.com>
> >   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >   L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> >   S:	Maintained
> > +T:	git https://github.com/mbgg/linux-mediatek.git for-next
> >   F:	arch/arm/boot/dts/mt6*
> >   F:	arch/arm/boot/dts/mt7*
> >   F:	arch/arm/boot/dts/mt8*
> > 
> 
> 
> Looks like this got forgotten for v4.13-rc1.
> Shall I take it through my tree for the next merge window?

Take it now, no reason an update can't go in now.

But why are you not using kernel.org?  Using github for kernel code is a
pain and discouraged.

thanks,

greg k-h
