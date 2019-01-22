From: Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] mm/slub: use WARN_ON() for some slab errors
Date: Tue, 22 Jan 2019 12:14:35 +0800
Message-ID: <1548130475.7975.74.camel@mtkswgap22>
References: <1548063490-545-1-git-send-email-miles.chen@mediatek.com>
 <01000168726fcf15-81d8feb3-26f0-44d6-bbd8-62aa149118b5-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <01000168726fcf15-81d8feb3-26f0-44d6-bbd8-62aa149118b5-000000-p/GC64/jrecnJqMo6gzdpkEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Christopher Lameter <cl-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pekka Enberg <penberg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Joonsoo Kim <iamjoonsoo.kim-Hm3cg6mZ9cc@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Mon, 2019-01-21 at 22:02 +0000, Christopher Lameter wrote:
> On Mon, 21 Jan 2019, miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> 
> > From: Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >
> > When debugging with slub.c, sometimes we have to trigger a panic in
> > order to get the coredump file. To do that, we have to modify slub.c and
> > rebuild kernel. To make debugging easier, use WARN_ON() for these slab
> > errors so we can dump stack trace by default or set panic_on_warn to
> > trigger a panic.
> 
> These locations really should dump stack and not terminate. There is
> subsequent processing that should be done.

Understood. We should not terminate the process for normal case. The
change only terminate the process when panic_on_warn is set.

> Slub terminates by default. The messages you are modifying are only
> enabled if the user specified that special debugging should be one
> (typically via a kernel parameter slub_debug).

I'm a little bit confused about this: Do you mean that I should use the
following approach?

1. Add a special debugging flag (say SLAB_PANIC_ON_ERROR) and call
panic() by:

if (s->flags & SLAB_PANIC_ON_ERROR)
     panic("slab error");

2. The SLAB_PANIC_ON_ERROR should be set by slub_debug param.

> It does not make sense to terminate the process here.


Thanks for you comment. Sometimes it's useful to trigger a panic and get
its coredump file before any restore/reset processing because we can
exam the unmodified data in the coredump file with this approach. 

I added BUG() for the slab errors in internal branches for a few years
and it does help for both software issues and bit flipping issues. It's
a quite useful in developing stage.

cheers,
Miles
