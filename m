From: Fan Chen <fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: MTK mt8173-evb: mainline unstable, and big-endian boot failures
Date: Tue, 2 Feb 2016 10:17:42 +0800
Message-ID: <1454379462.27798.11.camel@mtksdaap41>
References: <CAOi56cVDbkAJEDWy3+DV63a=UuD7nqpUu8X7e-OjtWM-4dj_-w@mail.gmail.com>
 <7hsi1ilczm.fsf@baylibre.com>
 <CAF-23O3ps0Wt_UCmJbArpc5iJJryJKA0k_2qAyNb7op8O=UnAg@mail.gmail.com>
 <1453964180.26397.8.camel@mtksdaap41> <7hy4b8gc7q.fsf@baylibre.com>
 <1454309376.11974.3.camel@mtksdaap41> <7hh9hrgbbh.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <7hh9hrgbbh.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Koan-Sin Tan <freedom.tan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?=E9=99=B3=E6=9F=8F=E5=AE=8F?= <howard.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pi-Cheng Chen <pi-cheng.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Kevin,

I just checked that the problem cannot be reproduced (tested 100 times
with your script) after flashing new firmware which we uploaded to
github[0] yesterday.
This latest firmware got many fixes and also supports cluster idle, so
we prefer testing with this new one
Would you please test in your side? Thanks for your great help!! 

[0] https://github.com/ibanezchen/evb-utils/tree/master


Best regards,
Fan

On Mon, 2016-02-01 at 17:17 -0800, Kevin Hilman wrote:
> Hi Eddie,
> 
> Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> writes:
> 
> [...]
> 
> > Thanks your patience to provide detail steps, we can reproduce this
> > problem now. It seems something wrong in ATF, we still investigate how
> > to fix it. We will provide you new ATF firmware once we have solution
> 
> Great, I'm glad you can reproduce it.  I was starting to worry it was
> only my hardware with the problem.
> 
> Please let me know if there are firmware updates you'd like me to test
> and I'll be happy to.
> 
> Thanks,
> 
> Kevin
