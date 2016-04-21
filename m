From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: arm: soc fixes for v4.6
Date: Thu, 21 Apr 2016 11:25:54 +0200
Message-ID: <57189CA2.3080401@gmail.com>
References: <570E1BD5.4090305@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <570E1BD5.4090305-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org



On 13/04/16 12:13, Matthias Brugger wrote:
> Hi all,
>
> Please merge the following fix to end the boot regression for v4.6.
>
> Thanks,
> Matthias
>

Kindly ping on this patch. Mediatek mt8173 does not boot with v4.6-rc4 
and needs this fix.

Regards,
Matthias

> ---
>
> The following changes since commit
> f55532a0c0b8bb6148f4e07853b876ef73bc69ca:
>
>    Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)
>
> are available in the git repository at:
>
>    https://github.com/mbgg/linux-mediatek.git tags/v4.6-soc-fixes
>
> for you to fetch changes up to d9c9f3b809d2bb0356f013e88d10730eafab5346:
>
>    Revert "soc: mediatek: SCPSYS: Fix double enabling of regulators"
> (2016-04-13 11:55:08 +0200)
>
> ----------------------------------------------------------------
> - fix boot error reverting commit cc8ed76938b5
> ("soc: mediatek: SCPSYS: Fix double enabling of regulators")
>
> ----------------------------------------------------------------
> James Liao (1):
>        Revert "soc: mediatek: SCPSYS: Fix double enabling of regulators"
>
>   drivers/soc/mediatek/mtk-scpsys.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
