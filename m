From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL] ARM: mediatek: arm64 updates for v4.2
Date: Mon, 01 Jun 2015 16:32:17 +0200
Message-ID: <1461817.ARd56COj2q@wuerfel>
References: <CABuKBeLhFR=94cF301wL7J8hJVTtyseoD7g45PLE6znQkPAFGQ@mail.gmail.com>
 <2507882.daayE1Zgb4@wuerfel>
 <CABuKBeK+LT4UDKe0P=vswEXTUevcSNTf2Gn0cdMQ7r=tj2JmOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CABuKBeK+LT4UDKe0P=vswEXTUevcSNTf2Gn0cdMQ7r=tj2JmOA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Yingjoe Chen <Yingjoe.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Monday 01 June 2015 10:56:35 Matthias Brugger wrote:
> 2015-06-01 10:11 GMT+02:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> >
> > If you put the same file in two branches, please use the same commit
> > ID. While git can figure it out when everything goes right, it will
> > fail horribly if one of the branches later gets a patch on top that
> > modifies the file, before the two branches get merged.
> 
> I just saw, that the commit in question has dependencies to other commits.
> So I decided I will drop the patches which cause problems. They should
> go into the next merge window.
> 

Ok, thanks. That will make it simpler for me.

	Arnd
