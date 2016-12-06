From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] firmware: qcom: scm: Fix interrupted SCM calls
Date: Tue, 6 Dec 2016 11:54:57 +0000
Message-ID: <20161206115456.GC2498@arm.com>
References: <1480405463-23165-1-git-send-email-andy.gross@linaro.org>
 <1480405463-23165-3-git-send-email-andy.gross@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1480405463-23165-3-git-send-email-andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: jesper.nilsson-VrBV9hrLPhE@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, lars.persson-VrBV9hrLPhE@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, niklas.cassel-VrBV9hrLPhE@public.gmane.org, ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, Nov 29, 2016 at 01:44:23AM -0600, Andy Gross wrote:
> This patch adds a Qualcomm specific quirk to the arm_smccc_smc call.
> 
> On Qualcomm ARM64 platforms, the SMC call can return before it has
> completed.  If this occurs, the call can be restarted, but it requires
> using the returned session ID value from the interrupted SMC call.
> 
> The quirk stores off the session ID from the interrupted call in the
> quirk structure so that it can be used by the caller.
> 
> This patch folds in a fix given by Sricharan R:
> https://lkml.org/lkml/2016/9/28/272
> 
> Signed-off-by: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm64/kernel/smccc-call.S |  9 ++++++++-
>  drivers/firmware/qcom_scm-64.c | 11 +++++++++--
>  include/linux/arm-smccc.h      | 11 ++++++++---
>  3 files changed, 25 insertions(+), 6 deletions(-)

Acked-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>

Will
