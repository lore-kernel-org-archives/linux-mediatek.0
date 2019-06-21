From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] watchdog: convert remaining drivers to use SPDX license
 identifier
Date: Fri, 21 Jun 2019 14:04:40 +0200
Message-ID: <09965bd4-d95c-b415-5ef1-25b799e6022b@gmail.com>
References: <1561048126-27578-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561048126-27578-1-git-send-email-linux@roeck-us.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: William Breathitt Gray <vilhelm.gray@gmail.com>, Jerry Hoemann <jerry.hoemann@hpe.com>, Vladimir Zapolskiy <vz@mleia.com>, Wan ZongShun <mcuos.com@gmail.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org



On 20/06/2019 18:28, Guenter Roeck wrote:
> This gets rid of the unnecessary license boilerplate, and avoids
> having to deal with individual patches one by one.
> 
> No functional changes.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> Note: Several drivers include a paragraph such as
> 
> "Neither <name> nor <company> admit liability nor
>  provide warranty for any of this software. This material is
>  provided "AS-IS" and at no charge."
> 
> Presumably this is covered by the GPL license. However, since I am not
> an attorney, I am not sure, and I opted for leaving such paragraphs in
> place.
> 
>  drivers/watchdog/acquirewdt.c          |  6 +-----
>  drivers/watchdog/advantechwdt.c        |  6 +-----
>  drivers/watchdog/ath79_wdt.c           |  6 +-----
>  drivers/watchdog/davinci_wdt.c         |  6 ++----
>  drivers/watchdog/ebc-c384_wdt.c        |  9 ---------
>  drivers/watchdog/eurotechwdt.c         |  6 +-----
>  drivers/watchdog/ftwdt010_wdt.c        |  5 +----
>  drivers/watchdog/hpwdt.c               |  6 +-----
>  drivers/watchdog/iTCO_vendor_support.c |  7 +------
>  drivers/watchdog/iTCO_wdt.c            |  6 +-----
>  drivers/watchdog/ib700wdt.c            |  6 +-----
>  drivers/watchdog/ie6xx_wdt.c           | 17 +----------------
>  drivers/watchdog/imgpdc_wdt.c          |  5 +----
>  drivers/watchdog/intel_scu_watchdog.c  | 19 +------------------
>  drivers/watchdog/intel_scu_watchdog.h  | 17 +----------------
>  drivers/watchdog/iop_wdt.c             | 14 +-------------
>  drivers/watchdog/kempld_wdt.c          | 10 +---------
>  drivers/watchdog/ks8695_wdt.c          |  5 +----
>  drivers/watchdog/lantiq_wdt.c          |  5 +----
>  drivers/watchdog/lpc18xx_wdt.c         |  5 +----
>  drivers/watchdog/max77620_wdt.c        |  5 +----
>  drivers/watchdog/mt7621_wdt.c          |  5 +----

for mt7621_wdt.c
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
