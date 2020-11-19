Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3475CC63777
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 22:29:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E670221F8
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 22:29:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DxYFNCqg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJZ8Pspc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E670221F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iAOdY5PuO1edlUkst4Mng72L6DvLYUSCEQuW0tOk6es=; b=DxYFNCqgJKTFohNW46nXOteCc
	T1yPztCJFll6l3oFOb94wjKhEmjAdkdtfLSfpvld3Gvguau8tEbWtgmpbApicDqmDFqldnja5tPrw
	TdCY0pHyMo+KysOj+R7gbgI0TJHGBhMx1IhZybDk+16CbmP770uKgMnAWn2tqRKSAVt0JxFj9Qgxw
	wIXv1W7jzhxNij/1aW4ISBrnd5pTJQhixWm+nk15bU/jBR/VVzi+mM1sCir8X2RTpajbnUKlAD/3F
	FIoThqml54EKPY/6jpQaeGi6UvIfsFyqM6Ai0R+jgTW2goD5NwUK5I1sljis/ia4mkvkmoVDLJBTC
	FcJzwcmkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfsQx-0000Mg-8V; Thu, 19 Nov 2020 22:29:43 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfsQu-0000LN-La; Thu, 19 Nov 2020 22:29:41 +0000
Received: by mail-ej1-x642.google.com with SMTP id i19so10148804ejx.9;
 Thu, 19 Nov 2020 14:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YE+NfLWS5nN0QpwMQoDKHvzm/h0QK+Pd5fMfxxvArlQ=;
 b=sJZ8PspcKQvHwdsuWkKA6BzPZ9GjaqKhwq99gFjNplm0+Qv1GtbjlG7kTfD9RPhgPN
 kWatUjM6i4M1JHZ1CVojXI+gG51faLdWhKHQ6iLZilY6OfKY3/WsekzgVWpPU+5i22lQ
 SvBwm24uppGA92+X5EB9YW/23or4D2XlSQjCA6HFuQJpk9Tf/OheMz/SAlo7JxjdWh95
 9pGTr4z+zIM/EEoAjnSVHDFdNL6wIacksV96CIQ/Q3tVODUXRDIUnKtie+1rtgSt0AXF
 LZbUWNPUaBO8bqwxuv8eDfZm2k5+fVsA8kfjfahqUudEHKQdT9X5B0lTJ/f/Ypowlbmx
 NLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YE+NfLWS5nN0QpwMQoDKHvzm/h0QK+Pd5fMfxxvArlQ=;
 b=i1YY6IZ18wV6xr3sPGVK+Ao042uUgAeoWSGSr4S4GyZX2Q1z0tnXkiH81IWxon64vy
 Z6omSlpCXrf9XnrIVmgoOlxJ4aNKkHlfBnn9Evt6iu1mwFJsIffnZcnazcrWHaue4dVF
 q9PFA7MpAkNJEMMkEOi1Ny8ecmKVwE+ggq19UFTfthNwtoDKi4zfdrIR7FEY64rlnvgs
 /xA6u7UJSdAfBmVVj8Elw/0Vyp8OUkYVAphMMM4mer/HSMJZBJlw1k0tujyoiU/UIgJJ
 yAAY1ARuXgXSjSJESFnK5yIkCCV5p8+bZUuplCJDpNJLLb2sCc/30eUf2jthFrEmuJky
 5tiQ==
X-Gm-Message-State: AOAM533e2LcQ0FRPDEexezx1D5xpLoZc3nLCxtiMww8hR+hXAUJ0VU62
 m5ojtC8TZf1/R/jybhMHVsJUwrBdWqM=
X-Google-Smtp-Source: ABdhPJw2rQ1fkucfU+GA3P4pJqvB9mWFBRySbizNIECPrFVzfhykidWs/IvGPgG7CDECBB9djxnpqg==
X-Received: by 2002:a17:906:c1c3:: with SMTP id
 bw3mr28934986ejb.126.1605824979191; 
 Thu, 19 Nov 2020 14:29:39 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:5807:584b:19c8:e7be?
 ([2a01:110f:b59:fd00:5807:584b:19c8:e7be])
 by smtp.gmail.com with ESMTPSA id rn2sm400989ejb.94.2020.11.19.14.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 14:29:38 -0800 (PST)
Subject: Re: [PATCH v7 1/5] leds: flash: Add flash registration with undefined
 CONFIG_LEDS_CLASS_FLASH
To: Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-2-git-send-email-gene.chen.richtek@gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <3164b1ed-9e47-88cd-d492-ff5a9243e5ef@gmail.com>
Date: Thu, 19 Nov 2020 23:29:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <1605696462-391-2-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_172940_779370_45A9D79B 
X-CRM114-Status: GOOD (  23.08  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, linux-leds@vger.kernel.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Gene,

On 11/18/20 11:47 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   include/linux/led-class-flash.h | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
> index 21a3358..4f56c28 100644
> --- a/include/linux/led-class-flash.h
> +++ b/include/linux/led-class-flash.h
> @@ -85,6 +85,7 @@ static inline struct led_classdev_flash *lcdev_to_flcdev(
>   	return container_of(lcdev, struct led_classdev_flash, led_cdev);
>   }
>   
> +#if IS_ENABLED(CONFIG_LEDS_CLASS_FLASH)
>   /**
>    * led_classdev_flash_register_ext - register a new object of LED class with
>    *				     init data and with support for flash LEDs
> @@ -127,6 +128,41 @@ static inline int devm_led_classdev_flash_register(struct device *parent,
>   void devm_led_classdev_flash_unregister(struct device *parent,
>   					struct led_classdev_flash *fled_cdev);
>   
> +#else
> +
> +static inline int led_classdev_flash_register_ext(struct device *parent,
> +				    struct led_classdev_flash *fled_cdev,
> +				    struct led_init_data *init_data)
> +{
> +	return -EINVAL;

s/-EINVAL/0/

The goal here is to assure that client will not fail when using no-op.

> +}
> +
> +static inline int led_classdev_flash_register(struct device *parent,
> +					   struct led_classdev_flash *fled_cdev)
> +{
> +	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
> +}

This function should be placed after #ifdef block because its
shape is the same for both cases.

> +static inline void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev) {};
> +static inline int devm_led_classdev_flash_register_ext(struct device *parent,
> +				     struct led_classdev_flash *fled_cdev,
> +				     struct led_init_data *init_data)
> +{
> +	return -EINVAL;

/-EINVAL/0/

Please do the same fix in all no-ops in the led-class-multicolor.h,
as we've discussed.

> +}
> +
> +static inline int devm_led_classdev_flash_register(struct device *parent,
> +				     struct led_classdev_flash *fled_cdev)
> +{
> +	return devm_led_classdev_flash_register_ext(parent, fled_cdev, NULL);
> +}


This function should also be placed after #ifdef block.
Please make the same optimizations in the led-class-multicolor.h as you
are at it.

> +
> +void devm_led_classdev_flash_unregister(struct device *parent,

s/void/static inline void/

That's the reason why you got warning from buildbot.

> +					struct led_classdev_flash *fled_cdev)
> +{};
> +
> +#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_FLASH) */
> +
>   /**
>    * led_set_flash_strobe - setup flash strobe
>    * @fled_cdev: the flash LED to set strobe on
> 

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
