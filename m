From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] perf/hw_breakpoint: Fix arch_hw_breakpoint
 use-before-initialization
Date: Thu, 10 Oct 2019 10:44:13 -0700
Message-ID: <CAD=FV=Vxdnecw2SnUeFpa8Rqq0DSTTeoD_bE1GXk4q37usZ9-w@mail.gmail.com>
References: <20190906060115.9460-1-mark-pk.tsai@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190906060115.9460-1-mark-pk.tsai@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Alix Wu <alix.wu@mediatek.com>, Peter Zijlstra <peterz@infradead.org>, YJ Chiang <yj.chiang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, namhyung@kernel.org, jolsa@redhat.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hi,

On Thu, Sep 5, 2019 at 11:01 PM Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
>
> If we disable the compiler's auto-initialization feature
> (-fplugin-arg-structleak_plugin-byref or -ftrivial-auto-var-init=pattern)
> is disabled, arch_hw_breakpoint may be used before initialization after
> the change 9a4903dde2c86.
> (perf/hw_breakpoint: Split attribute parse and commit)
>
> On our arm platform, the struct step_ctrl in arch_hw_breakpoint, which
> used to be zero-initialized by kzalloc, may be used in
> arch_install_hw_breakpoint without initialization.
>
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> Cc: YJ Chiang <yj.chiang@mediatek.com>
> Cc: Alix Wu <alix.wu@mediatek.com>
> ---
>  kernel/events/hw_breakpoint.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Stable should pick this up, please.  It landed in mainline as commit
310aa0a25b33 ("perf/hw_breakpoint: Fix arch_hw_breakpoint
use-before-initialization").

* I have confirmed that it cleanly applies to and fixes a kernel based
on v4.19.75, so picking it back to kernels 4.19+ is the easiest.

* I have confirmed that my test shows that hardware breakpoints fail
on my arm32 test machine on v4.18.20 and on v4.17.0.  They last worked
on 4.16.  Picking this patch alone is not sufficient to make 4.17 and
4.18 work again.  Bisecting shows that the first breakage was the
merge resolution that happened in commit 2d074918fb15 ("Merge branch
'perf/urgent' into perf/core").  Specifically both parents of that
merge passed my test but the result of the merge didn't pass my test.
If anyone cares about 4.17 and 4.18 at this point, I will leave it as
an exercise to them to try to get them working again.

-Doug
