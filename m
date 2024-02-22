Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2A6C47DD9
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 21:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0R7omLoisreIX2kcFjxEIAnsFhQNU9zRKOi2kYu33bU=; b=S+/VPYD6gq+9oc35hAPOs/CCtd
	mh71X5UMDZvTwR2Az63IgUU+EJFyDEMhRUmLIm+CdEkvopOtOPNskd+cMXDDyNVCCTiYozHrBriT/
	5a6mEtmhh9mtbNQeXadVn/7ze5UHp1UV2rruCqSDIVvSk75RiJ6R5SHjN4JeGTsm3H/QLUJhAy3Uj
	iWi5HRGCcv1l1P79sIU2l02gtLC1vJ32zQkZ5Yvc84MWe2mW8YFiGjbQpCEsoy6WvwX0mm4tl/56R
	FSXg0pXyBmkMATr8hfQQLyg8gfr1sxOxAgUJslglnZ3IJ7R3dxpmKeeBMi+4sRc2/1xNJN+qkEP7q
	6q09XI9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdGpj-00000006ipZ-1bee;
	Thu, 22 Feb 2024 21:42:23 +0000
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdGpf-00000006ijH-1L25
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Feb 2024 21:42:21 +0000
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 3c868ecd-d1cb-11ee-b3cf-005056bd6ce9;
	Thu, 22 Feb 2024 23:42:13 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Thu, 22 Feb 2024 23:42:11 +0200
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Aleksandr Mezin <mezin.alexander@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	George Stark <gnstark@salutedevices.com>
Subject: Re: [PATCH 1/2] devm-helpers: Add resource managed version of mutex
 init
Message-ID: <Zde_s8iecR2ArKjC@surfacebook.localdomain>
References: <20240222145838.12916-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240222145838.12916-1-kabel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_134219_553702_5C52CC61 
X-CRM114-Status: GOOD (  18.77  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Thu, Feb 22, 2024 at 03:58:37PM +0100, Marek Behún kirjoitti:
> A few drivers are doing resource-managed mutex initialization by
> implementing ad-hoc one-liner mutex dropping functions and using them
> with devm_add_action_or_reset(). Help drivers avoid these repeated
> one-liners by adding managed version of mutex initialization.
> 
> Use the new function devm_mutex_init() in the following drivers:
>   drivers/gpio/gpio-pisosr.c
>   drivers/gpio/gpio-sim.c
>   drivers/gpu/drm/xe/xe_hwmon.c
>   drivers/hwmon/nzxt-smart2.c
>   drivers/leds/leds-is31fl319x.c
>   drivers/power/supply/mt6370-charger.c
>   drivers/power/supply/rt9467-charger.c

Pardon me, but why?

https://lore.kernel.org/linux-leds/20231214173614.2820929-1-gnstark@salutedevices.com/

Can you cooperate, folks, instead of doing something independently?


> --- a/include/linux/devm-helpers.h
> +++ b/include/linux/devm-helpers.h
> @@ -24,6 +24,8 @@
>   */
>  
>  #include <linux/device.h>
> +#include <linux/kconfig.h>
> +#include <linux/mutex.h>
>  #include <linux/workqueue.h>
>  
>  static inline void devm_delayed_work_drop(void *res)
> @@ -76,4 +78,34 @@ static inline int devm_work_autocancel(struct device *dev,
>  	return devm_add_action(dev, devm_work_drop, w);
>  }
>  
> +static inline void devm_mutex_drop(void *res)
> +{
> +	mutex_destroy(res);
> +}
> +
> +/**
> + * devm_mutex_init - Resource managed mutex initialization
> + * @dev:	Device which lifetime mutex is bound to
> + * @lock:	Mutex to be initialized (and automatically destroyed)
> + *
> + * Initialize mutex which is automatically destroyed when driver is detached.
> + * A few drivers initialize mutexes which they want destroyed before driver is
> + * detached, for debugging purposes.
> + * devm_mutex_init() can be used to omit the explicit mutex_destroy() call when
> + * driver is detached.
> + */
> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
> +{
> +	mutex_init(lock);
> +
> +	/*
> +	 * mutex_destroy() is an empty function if CONFIG_DEBUG_MUTEXES is
> +	 * disabled. No need to allocate an action in that case.
> +	 */
> +	if (IS_ENABLED(CONFIG_DEBUG_MUTEXES))
> +		return devm_add_action_or_reset(dev, devm_mutex_drop, lock);
> +	else
> +		return 0;
> +}

Cc: George Stark <gnstark@salutedevices.com>

-- 
With Best Regards,
Andy Shevchenko



