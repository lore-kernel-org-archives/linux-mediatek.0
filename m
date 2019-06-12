From: Kobe-CP Wu <Kobe-CP.Wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] locking/lockdep: Fix UBSAN warnings
Date: Wed, 12 Jun 2019 20:35:41 +0800
Message-ID: <1560342941.16581.2.camel@mtkswgap22>
References: <1560318544-27635-1-git-send-email-kobe-cp.wu@mediatek.com>
 <20190612073425.GD3436@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190612073425.GD3436-Nxj+rRp3nVydTX5a5knrm8zTDFooKrT+cvkQGrU6aU0@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Eason Lin <eason-yh.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2019-06-12 at 09:34 +0200, Peter Zijlstra wrote:
> On Wed, Jun 12, 2019 at 01:49:04PM +0800, Kobe Wu wrote:
> > Fix complaints from UBSAN about signed integer overflow.
> > 
> > ========================================================================
> > UBSAN: Undefined behaviour in kernel/locking/lockdep.c:2998:3
> > signed integer overflow:
> 
> I don't mind the patch, but this is an UBSAN bug and cannot therefore be
> a reason.

I think the description could be amended as follows.
There is unnecessary to mention the UBSAN bug.

locking/lockdep: add size of counters for lockdep statistics

When system has been running for a long time, signed integer counters 
are not enough for some lockdep statistics. Using unsigned long counters
can satisfy the requirement. Besides, most of lockdep statistics are 
unsigned. It is better to use unsigned int instead of int.
