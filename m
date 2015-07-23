From: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/2] Add Mediatek watchdog suspend resume and shutdown
Date: Thu, 23 Jul 2015 13:49:09 +0800
Message-ID: <1437630551-39650-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

This series add Mediatek watchdog suspend, resume and shutdown support.
These patches are based on v4.2-rc1

Change in v2:
Use watchdog_active() to check whether watchdog been active.
Change to register suspend,resume function to dev_pm_ops

Greta Zhang (2):
  watchdog: add wdt suspend/resume support
  watchdog: add wdt shutdown callback to disable wdt if enabled

 drivers/watchdog/mtk_wdt.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

-- 
1.8.1.1.dirty

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
