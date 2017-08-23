From: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [GIT PULL] arm: mediatek: dts32 updates for v4.14
Date: Wed, 23 Aug 2017 10:35:17 +0800
Message-ID: <1503455717.16782.7.camel@mtksdaap41>
References: <9434dcb8-d38d-ff3a-a6ce-2b27d3a74cef@gmail.com>
 <CAK8P3a0HnyJq4LUQyv8zn5vKcybyY3avam8s=6UFcMSeqXVQbg@mail.gmail.com>
 <1503454566.15454.0.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1503454566.15454.0.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

> On Sat, 2017-08-19 at 04:41 +0800, Arnd Bergmann wrote:
> > On Thu, Aug 17, 2017 at 3:37 PM, Matthias Brugger
> > <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > >
> > > The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:
> > >
> > >   Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)
> > >
> > > are available in the git repository at:
> > >
> > >   https://github.com/mbgg/linux-mediatek.git tags/v4.13-next-dts64
> > >
> > > for you to fetch changes up to bdf2cbb2b3160122f7ff16445fdb73267fffd583:
> > >
> > >   arm64: dts: Add Mediatek SoC MT2712 and evaluation board dts and Makefile
> > > (2017-08-17 15:33:45 +0200)
> > >
> > > ----------------------------------------------------------------
> > > - add SoC mt7622 and its reference board
> > > - cleanup of dts bindings
> > > - mt6797: add watchdog and delete unused clock
> > > - add support for SoC mt2701 and it's eval board
> > 
> > Nice to see mt7622 support already getting merged, at least it seems this
> > is getting there before the chip ends up in consumer devices, normally
> > it's the other way round ;-)
> > 
> > Could you let me know what mt2712 is? I can't find anything about this
> > chip, not even which business unit made it, and I'd like to have a brief
> > description for most newly added hardware in my own pull requests.
> > 
> >         Arnd
> > 
Hi,

MT2712 is a family of automotive processors designed for infotainment
applications.

Is that sufficient?  Thanks.
yt.shen
