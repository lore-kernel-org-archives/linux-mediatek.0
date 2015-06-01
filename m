From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL] ARM: mediatek: soc updates for v4.2
Date: Mon, 01 Jun 2015 17:03:18 +0200
Message-ID: <2065890.i1QSckCvO8@wuerfel>
References: <CABuKBe+y5Em77WbKUu3YHAuwdc7n_ybLe-Eii8G1H-EQ0xZrRg@mail.gmail.com>
 <2169528.AHb4teykcE@wuerfel>
 <CABuKBe+2H8wFgaM+S-LAMm2B7DCXZKGetOOb9rkgTO4TjD7X=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CABuKBe+2H8wFgaM+S-LAMm2B7DCXZKGetOOb9rkgTO4TjD7X=A@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Friday 29 May 2015 18:20:36 Matthias Brugger wrote:
> Hi Arnd,
> 
> 2015-05-29 14:56 GMT+02:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> > On Wednesday 27 May 2015 17:09:43 Matthias Brugger wrote:
> >> - pmic wrapper: fix clock handling
> >> - pmic wrapper: fix state machine
> >> - pmic wrapper: fix compile dependency
> >>
> >
> > Merged into next/drivers now.
> >
> > It looks like these are all bug fixes, and I wonder if they
> > should be merged for 4.1 and possibly backports instead.
> > Can you clarify?
> 
> Yes, they should be merged for 4.1.
> I forgot about that.
> Sorry.

Ok, pulled into fixes now.

	Arnd
