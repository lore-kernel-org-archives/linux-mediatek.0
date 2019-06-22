From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH] watchdog: convert remaining drivers to use SPDX license
 identifier
Date: Sun, 23 Jun 2019 08:58:03 +0900
Message-ID: <20190622235803.GA3286@icarus>
References: <1561048126-27578-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1561048126-27578-1-git-send-email-linux@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Jerry Hoemann <jerry.hoemann@hpe.com>, Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>, Wan ZongShun <mcuos.com@gmail.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Jun 20, 2019 at 09:28:46AM -0700, Guenter Roeck wrote:
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
[...]
>  drivers/watchdog/ebc-c384_wdt.c        |  9 ---------
[...]
> diff --git a/drivers/watchdog/ebc-c384_wdt.c b/drivers/watchdog/ebc-c384_wdt.c
> index c176f59fea28..8ef4b0df3855 100644
> --- a/drivers/watchdog/ebc-c384_wdt.c
> +++ b/drivers/watchdog/ebc-c384_wdt.c
> @@ -2,15 +2,6 @@
>  /*
>   * Watchdog timer driver for the WinSystems EBC-C384
>   * Copyright (C) 2016 William Breathitt Gray
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License, version 2, as
> - * published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful, but
> - * WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * General Public License for more details.
>   */
>  #include <linux/device.h>
>  #include <linux/dmi.h>

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>
