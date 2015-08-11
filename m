From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] watchdog: add wdt shutdown callback to disable
 wdt if enabled
Date: Mon, 10 Aug 2015 21:42:20 -0700
Message-ID: <55C97D2C.6090505@roeck-us.net>
References: <1437630551-39650-1-git-send-email-eddie.huang@mediatek.com> <1437630551-39650-3-git-send-email-eddie.huang@mediatek.com> <1488521.5eJqASov2O@ubix> <CAGS+omD1UYSTfJ4-vZSE_BYuvGcTvpbC7T4ukaV10xuQxkCChg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omD1UYSTfJ4-vZSE_BYuvGcTvpbC7T4ukaV10xuQxkCChg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Greta Zhang <greta.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On 08/10/2015 09:28 PM, Daniel Kurtz wrote:
> Hi Guenter, Matthias,
>
> On Fri, Jul 24, 2015 at 1:37 AM, Matthias Brugger
> <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Thursday, July 23, 2015 01:49:11 PM Eddie Huang wrote:
>>> From: Greta Zhang <greta.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>>
>>> Without .shutdown(), watchdog might reset the system during power off.
>>> For example, if watchdog's timeout is set to 30s, then it is reset to
>>> zero by mtk_wdt_ping(). During power off, no app will ping watchdog,
>>> but watchdog is still running and may trigger reset.
>>>
>>> Signed-off-by: Greta Zhang <greta.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>> Signed-off-by: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>> ---
>>>   drivers/watchdog/mtk_wdt.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>
>> Acked-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> is the plan to land these two patches via Guenter's watchdog tree [0]?
> [0] git://www.linux-watchdog.org/linux-watchdog.git
>
That is Wim's tree, and Wim is the maintainer ;-).

I have the patches queued in my tree [1], and I plan to send a pull request
to Wim this week or early next week.

Guenter

---
[1] https://git.kernel.org/cgit/linux/kernel/git/groeck/linux-staging.git/log/?h=watchdog-next

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
