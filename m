From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] Mark clocks as critical for MT6797
Date: Tue, 2 Oct 2018 23:25:01 +0200
Message-ID: <96351fde-1702-8e12-9ec0-4cf4e1f88501@gmail.com>
References: <20180828204932.GA6721@xn--njmtys-xxab.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180828204932.GA6721-YV3CXrm7SyhVsOwjNIwEKpm7MGRryh++@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jasper Mattsson <jasu-tmnvWD0sGVAk+I/owrrOrA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi Jasper,

On 28/08/2018 22:49, Jasper Mattsson wrote:
> Hi,
> 
> Currently, DRAM-related clocks and the axi_sel MUX are not marked with
> CLK_IS_CRITICAL for MT6797. This causes memory corruption when the
> system is booted without clk_ignore_unused.
> 
> This patchset
> 
> 1. Makes it possible to mark outputs of MUXes as critical by introducing
>    a new macro, MUX_FLAGS,
> 2. Makes it possible to mark gates as critical by adding flags to
>    mtk_gate, and
> 3. Marks axi_sel, ddrphycfg_sel, infra_dramc_f26m and infra_dramc_b_f26m
>    as critical.
> 

I just tested your patches and they are actually fixing the problem.
Great, I wasn't even aware of it!

You can add a
Tested-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Please resend and use ./scripts/get_maintainers.pl on the whole series to see
whom you should send and CC.

Especially as this series should go through the clk tree. The normal is, to add
maintainers with To and all the rest including mailinglists with CC. Beware that
you will need to send this to several mailinglists.

If you study a bit git send-email, there is an option to send the series as a
thread, that helps normally to get things in your maintainers inbox in a sorted
way :)

Thanks for the patches and hope to see more of them in the future.

Best regards,
Matthias

> The addition of flags to mtk_gate also exists in the patch series "Add
> basic and clock support for Mediatek MT8183 SoC" [1].  The type of
> flags is unsigned int in that series, but the real type is unsigned
> long, so my patch differs from that patch.
> 
> [1] https://patchwork.kernel.org/patch/10549953/
> 
> 
> Jasper Mattsson (3):
>   clk: mediatek: Add MUX_FLAGS macro
>   clk: mediatek: Add flags to mtk_gate
>   clk: mediatek: Mark bus and DRAM related clocks as critical
> 
>  drivers/clk/mediatek/clk-gate.c   |  4 +-
>  drivers/clk/mediatek/clk-gate.h   |  3 +-
>  drivers/clk/mediatek/clk-mt6797.c | 64 ++++++++++++++++++-------------
>  drivers/clk/mediatek/clk-mtk.c    |  2 +-
>  drivers/clk/mediatek/clk-mtk.h    |  9 ++++-
>  5 files changed, 50 insertions(+), 32 deletions(-)
> 
> --
> 2.18.0
> 
