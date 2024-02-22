Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACC9C5479F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 16:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gghvldwZB33TV7wLpn+GyJBycJVE43C0mpIDyBExBuE=; b=YDOjtH1WNLShfxCg68aGRaLCVZ
	yLgtV1+INyi0UgSSppc062M++dfOtAp0DDtYZJe8pg49MXvJP1Vrd1pPyrzAhev4pIhnxrIu3SZdU
	nAA4PR645dDov6iECXycDXSsRWYt/hzrl2Xb2QCq+4cSeCyAcWDvropjHQoeItGHlPDj39pwgnmRU
	R+Jr3GXKzBP8/b568BzuUf157kXKLeJQjYU61GMHp4TyzDYH9AANpmQ6gTh2I80VvcrGchAblEJwY
	k5lsaqZKhLjawMKLuCS+dTIWSCX+LgzmZqVmoRGLer5vbMJUpHzoG9CBDiGV+xienoEfhCAH9tRMs
	p0eDv4zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdCBI-00000005eAv-09Zw;
	Thu, 22 Feb 2024 16:44:20 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdCBF-00000005e7T-0VzU;
	Thu, 22 Feb 2024 16:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708620257; x=1740156257;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hzQJmorMTV5rdTl82QUGox6zoC899///hh48jdQr9E4=;
  b=l+Q5o+tatMPS9g1/wykNMJAzM/lb2GlbBL5kZGpwLbgllcsvwVRypG4X
   VyO9oA2X6AqjMPbjSJKnlDyZfFSC2ri9eyhneAHO2Nm4BsKwBcv7JSmzE
   izCgQow/aMkd7aU9PyRbnfAiwc/DNCMXvfNbljMXZsBFtaAp87N6HcIRZ
   WP2xaxXU3rOhQJWj+hVVlWr+8YUayj/3fGIyZtoqjS16+cKFoB72QRDJY
   65o88BGGB9gK7i61Ut7h58Kr+47Z+KjEIerqXZXr26ABozWlbpYp33uRC
   6Yl61s+GX7CIozLPyBY0TXBnDSnUxX4qYgNH+DJ9RHuPH8eFTIALOg8pN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2718254"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2718254"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 08:44:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="10289434"
Received: from mhaehnex-mobl1.ger.corp.intel.com (HELO [10.252.2.135]) ([10.252.2.135])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 08:44:10 -0800
Message-ID: <03e62bcf-137c-4947-8f34-0cbfcba92a30@intel.com>
Date: Thu, 22 Feb 2024 16:44:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] devm-helpers: Add resource managed version of mutex
 init
Content-Language: en-GB
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Aleksandr Mezin <mezin.alexander@gmail.com>, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-gpio@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240222145838.12916-1-kabel@kernel.org>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240222145838.12916-1-kabel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_084417_275142_BBD98CED 
X-CRM114-Status: GOOD (  29.19  )
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

On 22/02/2024 14:58, Marek Behún wrote:
> A few drivers are doing resource-managed mutex initialization by
> implementing ad-hoc one-liner mutex dropping functions and using them
> with devm_add_action_or_reset(). Help drivers avoid these repeated
> one-liners by adding managed version of mutex initialization.
> 
> Use the new function devm_mutex_init() in the following drivers:
>    drivers/gpio/gpio-pisosr.c
>    drivers/gpio/gpio-sim.c
>    drivers/gpu/drm/xe/xe_hwmon.c
>    drivers/hwmon/nzxt-smart2.c
>    drivers/leds/leds-is31fl319x.c
>    drivers/power/supply/mt6370-charger.c
>    drivers/power/supply/rt9467-charger.c
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>   drivers/gpio/gpio-pisosr.c            |  9 ++-----
>   drivers/gpio/gpio-sim.c               | 12 ++--------
>   drivers/gpu/drm/xe/xe_hwmon.c         | 11 ++-------
>   drivers/hwmon/nzxt-smart2.c           |  9 ++-----
>   drivers/leds/leds-is31fl319x.c        |  9 ++-----
>   drivers/power/supply/mt6370-charger.c | 11 +--------
>   drivers/power/supply/rt9467-charger.c | 34 ++++-----------------------
>   include/linux/devm-helpers.h          | 32 +++++++++++++++++++++++++
>   8 files changed, 47 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
> index e3013e778e15..dddbf37e855f 100644
> --- a/drivers/gpio/gpio-pisosr.c
> +++ b/drivers/gpio/gpio-pisosr.c
> @@ -7,6 +7,7 @@
>   #include <linux/bitmap.h>
>   #include <linux/bitops.h>
>   #include <linux/delay.h>
> +#include <linux/devm-helpers.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/gpio/driver.h>
>   #include <linux/module.h>
> @@ -116,11 +117,6 @@ static const struct gpio_chip template_chip = {
>   	.can_sleep		= true,
>   };
>   
> -static void pisosr_mutex_destroy(void *lock)
> -{
> -	mutex_destroy(lock);
> -}
> -
>   static int pisosr_gpio_probe(struct spi_device *spi)
>   {
>   	struct device *dev = &spi->dev;
> @@ -147,8 +143,7 @@ static int pisosr_gpio_probe(struct spi_device *spi)
>   		return dev_err_probe(dev, PTR_ERR(gpio->load_gpio),
>   				     "Unable to allocate load GPIO\n");
>   
> -	mutex_init(&gpio->lock);
> -	ret = devm_add_action_or_reset(dev, pisosr_mutex_destroy, &gpio->lock);
> +	ret = devm_mutex_init(dev, &gpio->lock);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index c4106e37e6db..fcfcaa4efe70 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -12,6 +12,7 @@
>   #include <linux/completion.h>
>   #include <linux/configfs.h>
>   #include <linux/device.h>
> +#include <linux/devm-helpers.h>
>   #include <linux/err.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/gpio/driver.h>
> @@ -307,13 +308,6 @@ static ssize_t gpio_sim_sysfs_pull_store(struct device *dev,
>   	return len;
>   }
>   
> -static void gpio_sim_mutex_destroy(void *data)
> -{
> -	struct mutex *lock = data;
> -
> -	mutex_destroy(lock);
> -}
> -
>   static void gpio_sim_put_device(void *data)
>   {
>   	struct device *dev = data;
> @@ -457,9 +451,7 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
>   	if (ret)
>   		return ret;
>   
> -	mutex_init(&chip->lock);
> -	ret = devm_add_action_or_reset(dev, gpio_sim_mutex_destroy,
> -				       &chip->lock);
> +	ret = devm_mutex_init(dev, &chip->lock);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 174ed2185481..bb88ae1c196c 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -3,6 +3,7 @@
>    * Copyright © 2023 Intel Corporation
>    */
>   
> +#include <linux/devm-helpers.h>
>   #include <linux/hwmon-sysfs.h>
>   #include <linux/hwmon.h>
>   #include <linux/types.h>
> @@ -729,13 +730,6 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
>   		xe_hwmon_energy_get(hwmon, &energy);
>   }
>   
> -static void xe_hwmon_mutex_destroy(void *arg)
> -{
> -	struct xe_hwmon *hwmon = arg;
> -
> -	mutex_destroy(&hwmon->hwmon_lock);
> -}
> -
>   void xe_hwmon_register(struct xe_device *xe)
>   {
>   	struct device *dev = xe->drm.dev;
> @@ -751,8 +745,7 @@ void xe_hwmon_register(struct xe_device *xe)
>   
>   	xe->hwmon = hwmon;
>   
> -	mutex_init(&hwmon->hwmon_lock);
> -	if (devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, hwmon))
> +	if (devm_mutex_init(dev, &hwmon->hwmon_lock))
>   		return;
>   
>   	/* primary GT to access device level properties */
> diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
> index 7aa586eb74be..00bc89607673 100644
> --- a/drivers/hwmon/nzxt-smart2.c
> +++ b/drivers/hwmon/nzxt-smart2.c
> @@ -5,6 +5,7 @@
>    * Copyright (c) 2021 Aleksandr Mezin
>    */
>   
> +#include <linux/devm-helpers.h>
>   #include <linux/hid.h>
>   #include <linux/hwmon.h>
>   #include <linux/math.h>
> @@ -721,11 +722,6 @@ static int __maybe_unused nzxt_smart2_hid_reset_resume(struct hid_device *hdev)
>   	return init_device(drvdata, drvdata->update_interval);
>   }
>   
> -static void mutex_fini(void *lock)
> -{
> -	mutex_destroy(lock);
> -}
> -
>   static int nzxt_smart2_hid_probe(struct hid_device *hdev,
>   				 const struct hid_device_id *id)
>   {
> @@ -741,8 +737,7 @@ static int nzxt_smart2_hid_probe(struct hid_device *hdev,
>   
>   	init_waitqueue_head(&drvdata->wq);
>   
> -	mutex_init(&drvdata->mutex);
> -	ret = devm_add_action_or_reset(&hdev->dev, mutex_fini, &drvdata->mutex);
> +	ret = devm_mutex_init(&hdev->dev, &drvdata->mutex);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
> index 66c65741202e..e9d7cf6a386c 100644
> --- a/drivers/leds/leds-is31fl319x.c
> +++ b/drivers/leds/leds-is31fl319x.c
> @@ -8,6 +8,7 @@
>    * effect LEDs.
>    */
>   
> +#include <linux/devm-helpers.h>
>   #include <linux/err.h>
>   #include <linux/i2c.h>
>   #include <linux/leds.h>
> @@ -495,11 +496,6 @@ static inline int is31fl3196_db_to_gain(u32 dezibel)
>   	return dezibel / IS31FL3196_AUDIO_GAIN_DB_STEP;
>   }
>   
> -static void is31f1319x_mutex_destroy(void *lock)
> -{
> -	mutex_destroy(lock);
> -}
> -
>   static int is31fl319x_probe(struct i2c_client *client)
>   {
>   	struct is31fl319x_chip *is31;
> @@ -515,8 +511,7 @@ static int is31fl319x_probe(struct i2c_client *client)
>   	if (!is31)
>   		return -ENOMEM;
>   
> -	mutex_init(&is31->lock);
> -	err = devm_add_action_or_reset(dev, is31f1319x_mutex_destroy, &is31->lock);
> +	err = devm_mutex_init(dev, &is31->lock);
>   	if (err)
>   		return err;
>   
> diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
> index e24fce087d80..fa0517d0352d 100644
> --- a/drivers/power/supply/mt6370-charger.c
> +++ b/drivers/power/supply/mt6370-charger.c
> @@ -766,13 +766,6 @@ static int mt6370_chg_init_psy(struct mt6370_priv *priv)
>   	return PTR_ERR_OR_ZERO(priv->psy);
>   }
>   
> -static void mt6370_chg_destroy_attach_lock(void *data)
> -{
> -	struct mutex *attach_lock = data;
> -
> -	mutex_destroy(attach_lock);
> -}
> -
>   static void mt6370_chg_destroy_wq(void *data)
>   {
>   	struct workqueue_struct *wq = data;
> @@ -900,9 +893,7 @@ static int mt6370_chg_probe(struct platform_device *pdev)
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Failed to init psy\n");
>   
> -	mutex_init(&priv->attach_lock);
> -	ret = devm_add_action_or_reset(dev, mt6370_chg_destroy_attach_lock,
> -				       &priv->attach_lock);
> +	ret = devm_mutex_init(dev, &priv->attach_lock);
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Failed to init attach lock\n");
>   
> diff --git a/drivers/power/supply/rt9467-charger.c b/drivers/power/supply/rt9467-charger.c
> index fdfdc83ab045..84f07c22077f 100644
> --- a/drivers/power/supply/rt9467-charger.c
> +++ b/drivers/power/supply/rt9467-charger.c
> @@ -10,6 +10,7 @@
>   #include <linux/bitfield.h>
>   #include <linux/completion.h>
>   #include <linux/delay.h>
> +#include <linux/devm-helpers.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/i2c.h>
>   #include <linux/interrupt.h>
> @@ -1149,27 +1150,6 @@ static int rt9467_reset_chip(struct rt9467_chg_data *data)
>   	return regmap_field_write(data->rm_field[F_RST], 1);
>   }
>   
> -static void rt9467_chg_destroy_adc_lock(void *data)
> -{
> -	struct mutex *adc_lock = data;
> -
> -	mutex_destroy(adc_lock);
> -}
> -
> -static void rt9467_chg_destroy_attach_lock(void *data)
> -{
> -	struct mutex *attach_lock = data;
> -
> -	mutex_destroy(attach_lock);
> -}
> -
> -static void rt9467_chg_destroy_ichg_ieoc_lock(void *data)
> -{
> -	struct mutex *ichg_ieoc_lock = data;
> -
> -	mutex_destroy(ichg_ieoc_lock);
> -}
> -
>   static void rt9467_chg_complete_aicl_done(void *data)
>   {
>   	struct completion *aicl_done = data;
> @@ -1222,21 +1202,15 @@ static int rt9467_charger_probe(struct i2c_client *i2c)
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Failed to add irq chip\n");
>   
> -	mutex_init(&data->adc_lock);
> -	ret = devm_add_action_or_reset(dev, rt9467_chg_destroy_adc_lock,
> -				       &data->adc_lock);
> +	ret = devm_mutex_init(dev, &data->adc_lock);
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Failed to init ADC lock\n");
>   
> -	mutex_init(&data->attach_lock);
> -	ret = devm_add_action_or_reset(dev, rt9467_chg_destroy_attach_lock,
> -				       &data->attach_lock);
> +	ret = devm_mutex_init(dev, &data->attach_lock);
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Failed to init attach lock\n");
>   
> -	mutex_init(&data->ichg_ieoc_lock);
> -	ret = devm_add_action_or_reset(dev, rt9467_chg_destroy_ichg_ieoc_lock,
> -				       &data->ichg_ieoc_lock);
> +	ret = devm_mutex_init(dev, &data->ichg_ieoc_lock);
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Failed to init ICHG/IEOC lock\n");
>   
> diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
> index 74891802200d..70640fb96117 100644
> --- a/include/linux/devm-helpers.h
> +++ b/include/linux/devm-helpers.h
> @@ -24,6 +24,8 @@
>    */
>   
>   #include <linux/device.h>
> +#include <linux/kconfig.h>
> +#include <linux/mutex.h>
>   #include <linux/workqueue.h>
>   
>   static inline void devm_delayed_work_drop(void *res)
> @@ -76,4 +78,34 @@ static inline int devm_work_autocancel(struct device *dev,
>   	return devm_add_action(dev, devm_work_drop, w);
>   }
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

Do you know if this this needs __always_inline? The static lockdep key 
in mutex_init() should be different for each caller class. See 
c21f11d182c2 ("drm: fix drmm_mutex_init()").

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
> +
>   #endif

