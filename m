From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 2/2] phy: phy-mt65xx-usb3: add support for mt2701
 platform
Date: Wed, 13 Apr 2016 19:01:21 +0530
Message-ID: <570E4A29.3030103@ti.com>
References: <1460360490-18606-1-git-send-email-chunfeng.yun@mediatek.com>
 <1460360490-18606-2-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1460360490-18606-2-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi,

On Monday 11 April 2016 01:11 PM, Chunfeng Yun wrote:
> A new compatible string, "mediatek,mt2701-u3phy", is added.
> 
> Some register settings to avoid RX sensitivity level degradation
> which may arise on mt8173 platform are separated from other
> platforms.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/phy/Kconfig           |    5 ++-
>  drivers/phy/phy-mt65xx-usb3.c |   77 ++++++++++++++++++++++++++++-------------
>  2 files changed, 54 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 26566db..3037f28 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -218,9 +218,8 @@ config PHY_MT65XX_USB3
>  	depends on ARCH_MEDIATEK && OF
>  	select GENERIC_PHY
>  	help
> -	  Say 'Y' here to add support for Mediatek USB3.0 PHY driver
> -	  for mt65xx SoCs. it supports two usb2.0 ports and
> -	  one usb3.0 port.
> +	  Say 'Y' here to add support for Mediatek USB3.0 PHY driver,
> +	  it supports multiple usb2.0 and usb3.0 ports.

Do you mean this PHY driver support both USB2 and USB3? Then it's not really a
USB3 PHY driver right?

Thanks
Kishon
