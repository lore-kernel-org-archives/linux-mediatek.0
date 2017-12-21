From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] arm: Updates of armv7 DTS for v4.15-next
Date: Thu, 21 Dec 2017 10:54:54 +0100
Message-ID: <a914ab89-af0a-7c7e-4c5d-e85754c68848@gmail.com>
References: <8bf16d56-579c-1579-142f-121990ec0572@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <8bf16d56-579c-1579-142f-121990ec0572-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Andrew-sh Cheng <andrew-sh.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Weiyi Lu <weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org



On 12/20/2017 08:18 PM, Matthias Brugger wrote:
> Hi Arnd and Olof,
> 
> Please feel free to pull the following patches.

Please ignore this pull request.
It has several issues. I'll send a new one soon.

Sorry for the inconvenience.
Matthias

> 
> Thanks,
> Matthias
> 
> ---
> The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:
> 
>   Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git
> tags/v4.15-next-dts64
> 
> for you to fetch changes up to c0c3333daba6617b44228a8dffb8184b2fd1931d:
> 
>   arm64: dts: Add power controller device node of MT2712 (2017-12-20 20:02:50 +0100)
> 
> ----------------------------------------------------------------
> - mt8173 add cpufreq related nodes
>   supply nodes
>   frequency/voltage operation table
> 
> - mt2712 add cpufreq related nodes
>   fixed regulator
>   supply nodes
>   frequency/voltage operation table
> - mt2712 add clock contoller nodes
> - mt2712 add scpsys node
> 
> ----------------------------------------------------------------
> Andrew-sh Cheng (2):
>       arm64: dts: mediatek: add mt8173 cpufreq related device nodes
>       arm64: dts: mediatek: add mt2712 cpufreq related device nodes
> 
> weiyi.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org (2):
>       arm64: dts: mt2712: Add clock controller device nodes
>       arm64: dts: Add power controller device node of MT2712
> 
>  arch/arm64/boot/dts/mediatek/mt2712-evb.dts |  27 ++++
>  arch/arm64/boot/dts/mediatek/mt2712e.dtsi   | 188 ++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8173-evb.dts |  18 +++
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi    |  90 +++++++++++++
>  4 files changed, 323 insertions(+)
> 
