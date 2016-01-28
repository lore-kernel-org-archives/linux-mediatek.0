From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: MTK mt8173-evb: mainline unstable, and big-endian boot failures
Date: Wed, 27 Jan 2016 17:16:45 -0800
Message-ID: <7hsi1ilczm.fsf@baylibre.com>
References: <CAOi56cVDbkAJEDWy3+DV63a=UuD7nqpUu8X7e-OjtWM-4dj_-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAOi56cVDbkAJEDWy3+DV63a=UuD7nqpUu8X7e-OjtWM-4dj_-w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
 (Kevin Hilman's message of "Wed, 27 Jan 2016 16:55:25 -0800")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: =?utf-8?B?6Zmz5p+P5a6P?= <howard.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koan-Sin Tan <freedom.tan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, =?utf-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pi-Cheng Chen <pi-cheng.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

[...]

> It seems to be pretty stable up through v4.4 but
> unreliable/unpredictable in v4.5-rc1 and lots of places in between.
> It's hard to bisect because it doesn't reliably fail, but when it does
> fail to finish booting, it's typically after it reaches a shell, and
> trying to run various simple shell commands fails to complete, like
> this example from next-20160125[2].
>
> To me this suggests possibly an issue with the idle driver where
> characters might be getting lost on the serial console, which causes
> the automated boot scripts to fail because the shell is still waiting
> for the command to be finished.

FWIW, I think I confirmed my suspicion that it's an idle driver issue
because adding 'nohlt' on the cmdline, which forces cpuidle_poll mode
(essentially disabling cpuidle) makes mainline boot quite reliably on my
mt8173-evb board now.

Kevin
