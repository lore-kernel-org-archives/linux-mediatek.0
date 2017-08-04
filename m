From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [V3 1/2] phy: ralink-usb: add driver for Mediatek/Ralink
Date: Fri, 4 Aug 2017 10:59:10 +0530
Message-ID: <b66e6346-2eb6-b0c7-2cfe-856cea0fd564@ti.com>
References: <1501756323-61555-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1501756323-61555-1-git-send-email-harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org



On Thursday 03 August 2017 04:02 PM, Harvey Hunt wrote:
> From: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
> 
> Add a driver to setup the USB phy on Mediatek/Ralink SoCs.
> The driver is trivial and only sets up power and host mode.
> 
> Signed-off-by: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
> Signed-off-by: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org 
> Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org 
> ---
> Changes in V3
> * Separate DT bindings
> * Update Kconfig text
> * Modify John's email address
> * Rebase onto v4.13-rc3
> 
> Changes in V2
> * remove refcounting
> * drop empty functions
> * dont use static globals
> * use explicit compatible strings
> 
>  drivers/phy/Kconfig          |   8 ++
>  drivers/phy/Makefile         |   1 +
>  drivers/phy/phy-ralink-usb.c | 175 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 184 insertions(+)
>  create mode 100644 drivers/phy/phy-ralink-usb.c
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index c1807d4..79f966a 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -41,6 +41,14 @@ config PHY_PISTACHIO_USB
>  	help
>  	  Enable this to support the USB2.0 PHY on the IMG Pistachio SoC.
>  
> +config PHY_RALINK_USB
> +	tristate "Ralink USB PHY driver"
> +	select GENERIC_PHY
> +	depends on RALINK

depends on RALINK || COMPILE_TEST?

Thanks
Kishon
