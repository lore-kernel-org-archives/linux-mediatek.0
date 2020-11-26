Return-Path: <SRS0=o4uA=FA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C408C56202
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 18:12:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DDBE20B80
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 18:12:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CRF4spPZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lslK+q38"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DDBE20B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9vQ8bxLY/6wKtsku6FMsAplybF/RHpzo/kiw9UVJZJA=; b=CRF4spPZVr6I73dWeZPXBxwk2
	XgN1swSB8c4zas+If7PY2LxBSNxnAdjwJS/GRN15pN/TcKixgr0nA4W3O0m9x/jSep1WyAlAfWEPC
	Nojz+HAxD/wYHc9+E0Q1ZzXt3S4kuLY6lVfuy+DiqM2YFdDsyOEGJ+dzSulqc5hDH0XARKZq4K+6E
	4Ac/PvTkMfb0ejdI4VGO9Q6m5vEF7lCQ7LXvZu96vBttAz9Jy/CTb533YQoyov7+PZwkFDo8cr7mQ
	NHQz9ACQeU8OClhq+m+AnSKP3B2OGREEnDRWHkAp2zjZsWUEH+DF0MefqYEIvj1Uj/uZ12xPBK6ib
	r1BnqRLAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiLki-0000eu-Dq; Thu, 26 Nov 2020 18:12:20 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiLkb-0000Z8-55; Thu, 26 Nov 2020 18:12:14 +0000
Received: by mail-ej1-x642.google.com with SMTP id o9so4167616ejg.1;
 Thu, 26 Nov 2020 10:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wsJA7uvFveswa9oa5q3BcYpK4K/UQQ/hYMCGdNw27k8=;
 b=lslK+q38pDdMlxGUEhEznkii9b8maWWgwbU5TwxISoune0MT9dCOdR02fWKFWJewx6
 q1yusoV/9yMn8cJRB6poWERcHt8hbtrJfY7a8h2ypDp7wi9ywuZQmRASXhiCZTJ8eT6D
 xPJGXqcFB+jwRgv5fn1hbge4+tpARnReECQuN6qg0SVgh55jIudx2w11JwD0b6r2x4UU
 N5LxH2sYl6qwUrwYAY6hWt6tB4DkDUuTshDzTmJP6ntuCX4kT3yf53JjAKU7tqC1qe12
 7COZxJie9bwANr3D1O49YBCQqIFXACaW9/QJ37eQUmUE5rRayBhtwMNf5CBbwi11qpuX
 i9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wsJA7uvFveswa9oa5q3BcYpK4K/UQQ/hYMCGdNw27k8=;
 b=k7Z1LaLQgsRJpeHpZlYbWTFoyw4JFwSE/zXpAIvBIHdPU2yprP0na6u1vTmqWa8fsP
 afOx5kABGbL2hB6bM3zoDh+kvTznUH/euSOPWqrRksMWpKFOYvoKDaq2Trznu2RQwXuF
 UBhzhFRtJ4T/3C4tWa2g3wOOhGRLQnPcH9vSHtuyNMGN94SYKyQyFS7qTlNluXCwzz43
 Bp0c08CbKznfnJh7aBy+IqTBQ4XhFBJaRCTh6Y3n4Hr5oEGfVdK+41M5Q0ccp8eVZkH1
 bOEx4F6ixN9wywdrPLwmu/j3NQv7JmpwPauIXjcTRy1+XomzItfdSEuhR9pROOwUxfeD
 FQdw==
X-Gm-Message-State: AOAM532b/ivbCsWIbVfCWnO1MlTyGcD40sKLp1xJrSUKn51nUCxMkaID
 1OlFi8FfYvYjHlwYNvuytSc=
X-Google-Smtp-Source: ABdhPJxhQJAv2dJNegQkCi94M7mKoKOAd4Um4aSooo7QneCsYcM5iHfBsQB1N5l/Q5REF/8SJ+/NuA==
X-Received: by 2002:a17:906:8c7:: with SMTP id
 o7mr3970705eje.413.1606414329295; 
 Thu, 26 Nov 2020 10:12:09 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:385b:d58:7bd:b2fd?
 ([2a01:110f:b59:fd00:385b:d58:7bd:b2fd])
 by smtp.gmail.com with ESMTPSA id k2sm3475826ejp.6.2020.11.26.10.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 10:12:08 -0800 (PST)
Subject: Re: [PATCH v9 1/6] leds: flash: Add flash registration with undefined
 CONFIG_LEDS_CLASS_FLASH
To: Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606390654-6075-2-git-send-email-gene.chen.richtek@gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <2cfb1dce-8789-8c31-1c5a-873abe896418@gmail.com>
Date: Thu, 26 Nov 2020 19:12:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606390654-6075-2-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_131213_293609_5B77240C 
X-CRM114-Status: GOOD (  22.59  )
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

Thank you for addressing my remarks.

On 11/26/20 12:37 PM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   include/linux/led-class-flash.h | 42 ++++++++++++++++++++++++++++++++---------
>   1 file changed, 33 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
> index 21a3358..612b4ca 100644
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
> @@ -98,12 +99,6 @@ int led_classdev_flash_register_ext(struct device *parent,
>   				    struct led_classdev_flash *fled_cdev,
>   				    struct led_init_data *init_data);
>   
> -static inline int led_classdev_flash_register(struct device *parent,
> -					   struct led_classdev_flash *fled_cdev)
> -{
> -	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
> -}
> -
>   /**
>    * led_classdev_flash_unregister - unregisters an object of led_classdev class
>    *				   with support for flash LEDs
> @@ -118,15 +113,44 @@ int devm_led_classdev_flash_register_ext(struct device *parent,
>   				     struct led_init_data *init_data);
>   
>   
> +void devm_led_classdev_flash_unregister(struct device *parent,
> +					struct led_classdev_flash *fled_cdev);
> +
> +#else
> +
> +static inline int led_classdev_flash_register_ext(struct device *parent,
> +				    struct led_classdev_flash *fled_cdev,
> +				    struct led_init_data *init_data)
> +{
> +	return 0;
> +}
> +
> +static inline void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev) {};
> +static inline int devm_led_classdev_flash_register_ext(struct device *parent,
> +				     struct led_classdev_flash *fled_cdev,
> +				     struct led_init_data *init_data)
> +{
> +	return 0;
> +}
> +
> +static inline void devm_led_classdev_flash_unregister(struct device *parent,
> +					struct led_classdev_flash *fled_cdev)
> +{};
> +
> +#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_FLASH) */
> +
> +static inline int led_classdev_flash_register(struct device *parent,
> +					   struct led_classdev_flash *fled_cdev)
> +{
> +	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
> +}
> +
>   static inline int devm_led_classdev_flash_register(struct device *parent,
>   				     struct led_classdev_flash *fled_cdev)
>   {
>   	return devm_led_classdev_flash_register_ext(parent, fled_cdev, NULL);
>   }
>   
> -void devm_led_classdev_flash_unregister(struct device *parent,
> -					struct led_classdev_flash *fled_cdev);
> -
>   /**
>    * led_set_flash_strobe - setup flash strobe
>    * @fled_cdev: the flash LED to set strobe on
> 

It would be good if patch description mentioned also moving the
functions outside of #ifdef block.

With that:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
