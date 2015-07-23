From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] ARM: mediatek: Add regmap to mediatek Kconfig
Date: Thu, 23 Jul 2015 20:02:19 +0200
Message-ID: <1437677861.d66HCIve0i@ubix>
References: <1437166406-14233-1-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437166406-14233-1-git-send-email-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@arm.linux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Friday, July 17, 2015 10:53:26 PM Matthias Brugger wrote:
> Mediatek SoC needs the regmap/syscon infrastructure.
> The infrastructure is used by the clock and pinctrl driver.
> This patch adds MD_SYSCON to Kconfig for all Mediatek devices.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  arch/arm/mach-mediatek/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek/Kconfig
> index 9f59e58..aeece17 100644
> --- a/arch/arm/mach-mediatek/Kconfig
> +++ b/arch/arm/mach-mediatek/Kconfig

applied to v4.2-next/soc
