From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] watchdog: add wdt suspend/resume support
Date: Thu, 23 Jul 2015 19:36:53 +0200
Message-ID: <3323583.jRovLkk8YW@ubix>
References: <1437630551-39650-1-git-send-email-eddie.huang@mediatek.com> <1437630551-39650-2-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437630551-39650-2-git-send-email-eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Greta Zhang <greta.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Roger Lu <roger.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Thursday, July 23, 2015 01:49:10 PM Eddie Huang wrote:
> From: Greta Zhang <greta.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> add wdt driver suspend/resume support
> 
> Signed-off-by: Greta Zhang <greta.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Roger Lu <roger.lu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/watchdog/mtk_wdt.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Acked-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
