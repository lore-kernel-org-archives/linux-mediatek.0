From: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH] locking/lockdep: Save and display stack trace of held
 locks
Date: Mon, 24 Jun 2019 13:08:52 +0200
Message-ID: <20190624110852.GV3419@hirez.programming.kicks-ass.net>
References: <1561363259-14705-1-git-send-email-kobe-cp.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1561363259-14705-1-git-send-email-kobe-cp.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Kobe Wu <kobe-cp.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Eason Lin <eason-yh.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Mon, Jun 24, 2019 at 04:00:59PM +0800, Kobe Wu wrote:
> Save the stack trace of held locks when lock_acquire() is invoked
> and display the stack trace when lockdep_print_held_locks() is
> invoked. The runtime stack trace of held locks are helpful in
> analyzing code flow and lockdep's warning.
> 
> Save stack trace of each held lock will increase runtime overhead
> and memory consumption. The operation will be activated under
> CONFIG_LOCKDEP_TRACE_HELD_LOCK. So the impact will only occur
> when CONFIG_LOCKDEP_TRACE_HELD_LOCK=y.

Yeah, I don't see the point of this. If you cannot find where the lock
got taken you've bigger problems.
