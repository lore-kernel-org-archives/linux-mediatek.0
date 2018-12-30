From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] Fix compilation problem for mt7621_wdt.c and rt2880_wdt.c
Date: Sun, 30 Dec 2018 09:16:47 -0800
Message-ID: <20181230171647.GA8311@roeck-us.net>
References: <87va3baecv.fsf@notabene.neil.brown.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87va3baecv.fsf@notabene.neil.brown.name>
Sender: linux-kernel-owner@vger.kernel.org
To: NeilBrown <neil@brown.name>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Sun, Dec 30, 2018 at 02:21:52PM +1100, NeilBrown wrote:
> 
> These files need
>    #include <linux/mod_devicetable.h>
> to compile correctly.
> 
> Fixes: ac3167257b9f ("headers: separate linux/mod_devicetable.h from linux/platform_device.h")
> Signed-off-by: NeilBrown <neil@brown.name>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/mt7621_wdt.c | 1 +
>  drivers/watchdog/rt2880_wdt.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/watchdog/mt7621_wdt.c b/drivers/watchdog/mt7621_wdt.c
> index 5c4a764717c4..81208cd3f4ec 100644
> --- a/drivers/watchdog/mt7621_wdt.c
> +++ b/drivers/watchdog/mt7621_wdt.c
> @@ -17,6 +17,7 @@
>  #include <linux/watchdog.h>
>  #include <linux/moduleparam.h>
>  #include <linux/platform_device.h>
> +#include <linux/mod_devicetable.h>
>  
>  #include <asm/mach-ralink/ralink_regs.h>
>  
> diff --git a/drivers/watchdog/rt2880_wdt.c b/drivers/watchdog/rt2880_wdt.c
> index 98967f0a7d10..db7c57d82cfd 100644
> --- a/drivers/watchdog/rt2880_wdt.c
> +++ b/drivers/watchdog/rt2880_wdt.c
> @@ -18,6 +18,7 @@
>  #include <linux/watchdog.h>
>  #include <linux/moduleparam.h>
>  #include <linux/platform_device.h>
> +#include <linux/mod_devicetable.h>
>  
>  #include <asm/mach-ralink/ralink_regs.h>
>  
> -- 
> 2.14.0.rc0.dirty
> 
