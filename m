Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9BCC5478C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 18:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDF5rof44gEIb9jX4TIDVAFNvDzRBoYmWa48QZ9r6nQ=; b=YsxzAjcIoAZWDEi1KSj0g1J04B
	omUivstmLD0sj0G10QaA3NL4eyHL+HPxPgpWJIcjfPFXrCCWz+VV7VGLJbSthc9the8KcNtL3ehJd
	IDaRGCC1iOJLSh4llG/MnypPwR6rIW8u+grcmRKXT7+dCg4SHN8Yf+L12Bm7A9yraR8Q7haKn4X0f
	bh1hcOd+wd9Rw/9XHCx4CJp6LW/OVRAmoa8MHNqqgsBYPPH3AO/PvYUIL87RosZYUdMDrqPY9ZMJe
	VQBWjPXj9c3IALCtZl05Kws4MdbH3ft3TCU41/lBl+oD4C5n62z8zv28gT6KD6uQ95cgAf3C70qex
	0Fq7QNZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdDss-000000066XQ-1dnN;
	Thu, 22 Feb 2024 18:33:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdDsq-000000066VV-0O8X
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Feb 2024 18:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708626800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IDF5rof44gEIb9jX4TIDVAFNvDzRBoYmWa48QZ9r6nQ=;
	b=g83gJR897ZwJ8rUK8X1YTLxVGhoTuOhG56I2tSszT+J9GWM2FdvaR++WIq28LNW0Hy2egM
	kaGysJ/uG6CthGSsm8gZUa4h8CJyi+sFVtoPDIiZsyRZGNXX3kSvJBtPE4aaUj3CYTVTDe
	ji2b+4QZJvKMaFNGY4HLkK3kUzHtaog=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-HKZux-r7OJWTZugurHknew-1; Thu, 22 Feb 2024 13:33:19 -0500
X-MC-Unique: HKZux-r7OJWTZugurHknew-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a3f865db87aso1844766b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Feb 2024 10:33:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708626798; x=1709231598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IDF5rof44gEIb9jX4TIDVAFNvDzRBoYmWa48QZ9r6nQ=;
        b=Zlqpx9HXoRj3J4UI4EPQkwoOorIJXARDrrCXH1lV1EcagoSCVsDVXsy5iLs5GKsvim
         +UqbCgspfl+nidO53x+0ZslSeAyqhc4G4jWho2J6ivPem3Pm6eQts9wZa++Bw1wpGOQR
         M7M8boguldz697+ROtcgBiIMvn17uh/Y3+w1ZExRgs9oW3aauqmVEG7UWm1tnFuO1O83
         uIRRdwzLdX+5JVQnkVEYxABCDsNeW8QpQGDAEzSEZo7iQ5fCsTpz44nhguHDcz2WQyH6
         xFfaOVOjRsErrTA8mvVsnTOBTDGXH4f4Y7yfx91gHyVsYDu69Uz2Il4z3PGzubwbRE6A
         J71A==
X-Forwarded-Encrypted: i=1; AJvYcCVxHlotM3TeSwCaJRBXl764u0DWW+vDCcMMb0SLMwLii4eoUYaU6sCijd8CAaPwI4S3kPsTMIbEsrkkTWvy5g/wlBrtsRa/u+MSmjN/UAwm9oab
X-Gm-Message-State: AOJu0YzNBD7V4MR2oDRWlxeygS0Dod4GpRQW+IslD3sTnCC9rIlfhpzn
	74R7bgVAdkn7t6PClAm4OXjTS6OuueIDpZbIBavs5fXlnP5vJY4l2/SyyepIArvve4eetGDnnrw
	P8YBVuImIUVNvhYCuXUcwEO+8TuEsyoZxI76JbodnCtHIu1pJ1wSZaQKndULNa83XSdGLkA==
X-Received: by 2002:a17:906:3b52:b0:a3f:1ec7:8765 with SMTP id h18-20020a1709063b5200b00a3f1ec78765mr4781470ejf.8.1708626797798;
        Thu, 22 Feb 2024 10:33:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHy6MVM+yU0ergPm1eOLv+jCkZxkYnKmu7DqTz49UohXBGjHmSJ/pKffRukeXLaaXuaiUR+Cg==
X-Received: by 2002:a17:906:3b52:b0:a3f:1ec7:8765 with SMTP id h18-20020a1709063b5200b00a3f1ec78765mr4781437ejf.8.1708626797348;
        Thu, 22 Feb 2024 10:33:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lu16-20020a170906fad000b00a3d5efc65e0sm4854658ejb.91.2024.02.22.10.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 10:33:16 -0800 (PST)
Message-ID: <7013bf9e-2663-4613-ae61-61872e81355b@redhat.com>
Date: Thu, 22 Feb 2024 19:33:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] devm-helpers: Add resource managed version of mutex
 init
To: Matthew Auld <matthew.auld@intel.com>, =?UTF-8?Q?Marek_Beh=C3=BAn?=
 <kabel@kernel.org>, linux-kernel@vger.kernel.org,
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
 <03e62bcf-137c-4947-8f34-0cbfcba92a30@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <03e62bcf-137c-4947-8f34-0cbfcba92a30@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_103324_229812_03A1561B 
X-CRM114-Status: GOOD (  16.46  )
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

Hi,

On 2/22/24 17:44, Matthew Auld wrote:
> On 22/02/2024 14:58, Marek Behún wrote:
>> A few drivers are doing resource-managed mutex initialization by
>> implementing ad-hoc one-liner mutex dropping functions and using them
>> with devm_add_action_or_reset(). Help drivers avoid these repeated
>> one-liners by adding managed version of mutex initialization.

<snip>

>> index 74891802200d..70640fb96117 100644
>> --- a/include/linux/devm-helpers.h
>> +++ b/include/linux/devm-helpers.h
>> @@ -24,6 +24,8 @@
>>    */
>>     #include <linux/device.h>
>> +#include <linux/kconfig.h>
>> +#include <linux/mutex.h>
>>   #include <linux/workqueue.h>
>>     static inline void devm_delayed_work_drop(void *res)
>> @@ -76,4 +78,34 @@ static inline int devm_work_autocancel(struct device *dev,
>>       return devm_add_action(dev, devm_work_drop, w);
>>   }
>>   +static inline void devm_mutex_drop(void *res)
>> +{
>> +    mutex_destroy(res);
>> +}
>> +
>> +/**
>> + * devm_mutex_init - Resource managed mutex initialization
>> + * @dev:    Device which lifetime mutex is bound to
>> + * @lock:    Mutex to be initialized (and automatically destroyed)
>> + *
>> + * Initialize mutex which is automatically destroyed when driver is detached.
>> + * A few drivers initialize mutexes which they want destroyed before driver is
>> + * detached, for debugging purposes.
>> + * devm_mutex_init() can be used to omit the explicit mutex_destroy() call when
>> + * driver is detached.
>> + */
>> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
>> +{
>> +    mutex_init(lock);
> 
> Do you know if this this needs __always_inline? The static lockdep key in mutex_init() should be
> different for each caller class. See c21f11d182c2 ("drm: fix drmm_mutex_init()").

That is a very good point. I believe that this should mirror mutex_init() and
the actual static inline function should be __devm_mutex_init() which takes
the key as extra argument (and calls __mutex_init()) and then make
devm_mutex_init() itself a macro mirroring the mutex_init() macro.

Regards,

Hans






> 
>> +
>> +    /*
>> +     * mutex_destroy() is an empty function if CONFIG_DEBUG_MUTEXES is
>> +     * disabled. No need to allocate an action in that case.
>> +     */
>> +    if (IS_ENABLED(CONFIG_DEBUG_MUTEXES))
>> +        return devm_add_action_or_reset(dev, devm_mutex_drop, lock);
>> +    else
>> +        return 0;
>> +}
>> +
>>   #endif
> 


