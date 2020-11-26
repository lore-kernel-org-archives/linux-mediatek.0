Return-Path: <SRS0=o4uA=FA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1CABC63697
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 18:14:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A97821D7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 18:14:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wSeKSCPV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkM536ph"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A97821D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=23VBfprB793MoQrkRN59url1GVyTgbtFvjS/o2jt+mg=; b=wSeKSCPVbPKDzL1l087HpiHcw
	awvhDTyAOUgLu5WjbAI0gyrYenESRtc5Zr+cO44LJih5n9EQPGFjt5v1gkfJcHB+LBs4ki6trF+Aw
	3C5Ilk8N/ePGOAdjl/mDOreYZxW0f92bRhAyPuzJIaNUJbX0oR59PRmLN7aHeqH0DzmUKBik61Zco
	uaouaA8//lfXjamlSteJse41wW0jnFhyZOZajb8kaBVQc6X7YPAtCA7IUD4FwrQb6zSNuN4O4qx21
	pE63S8/fHG2ADWppHkqMRrqDoOLoRbM51L9IlbwaHloWrmKNsHeN1m5jpi74EMjHICJgaKu5QgxYR
	/q01dBIng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiLmg-0001LU-EI; Thu, 26 Nov 2020 18:14:22 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiLmc-0001JI-LM; Thu, 26 Nov 2020 18:14:19 +0000
Received: by mail-ej1-x643.google.com with SMTP id f9so1943491ejw.4;
 Thu, 26 Nov 2020 10:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OHU0uLzKqhNntOb28JbWE0OII+Zx2F3KXLp7TJVHtuo=;
 b=XkM536phVMS/RzN86F8NayUyKPl+kGO+uJ7r9Eg7eQ1KefDMEsAmQtgCDJI2DtKBvO
 Vvm8yNuRDT7V8jQI/aTEeUstjkJWe5zu7DDta3twqJYhu8eD5GA3WmEmF2Fnfx1k6SMP
 jZhrdO3PW2hOMU/QJ+ooP0o838zysu+SayEA3ub1LMA6AwvecumtVtgjf0TmtmSMQY8Y
 He7RID2qPisEQN3Ck9UJFMtn8Gb66WREYAdh0LhA0/YqOSrMqx3Blttwnc+Eo90/1C8X
 BLDvnhUeDVCoutu4u2ljnyR5z0t5t5QWyKloswMeDWSojcfCwoJuvrKVfE0rjax1e+pR
 pN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OHU0uLzKqhNntOb28JbWE0OII+Zx2F3KXLp7TJVHtuo=;
 b=T8T5U0bJ3RMmETnDS5yFy4HEEvB5jmR+RpWY3qOp2kcWedzE/NpdR3IEBkUsmuuxKH
 XYQparNLGt4+t9MhNOZmEQ6kAlscP0xuoaFhy5jGvEAaZNkIbdXHsGZPdNyVYNecQ7qE
 S7vDjBExwRFEna6YhR+9dO5tsl65C3L0ON6MvcGJrk/Q9Zd1MaVQT0/D/goHV5ytyJlc
 luyaenswh/P19uh0zkfqx/8eyd1X77gzEOaTW8lnMiYXXbf3eOwWO4oSprRVWJb/gxQE
 g/ZxmGQN+w5u5D8srOLKCOpU9efIpOCCmt0ldthgx3G+8RJozqBTmjM5Ty9Qp5xm2nmL
 O7xg==
X-Gm-Message-State: AOAM532ghpNL0pwXuw0OnBG+Xxx+1curdtx8UrrFMr+K8M75RzHrt+Xz
 92/pfzv6N77bm0DF5M6C28Y=
X-Google-Smtp-Source: ABdhPJx/D90d3j/kCctxkpSSPxh6BbcL3xpffD4VqilAJKpHEqYCXGYSuU5aDNZktUmtzDmN+2BtDw==
X-Received: by 2002:a17:906:5c43:: with SMTP id
 c3mr4051769ejr.390.1606414457299; 
 Thu, 26 Nov 2020 10:14:17 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:385b:d58:7bd:b2fd?
 ([2a01:110f:b59:fd00:385b:d58:7bd:b2fd])
 by smtp.gmail.com with ESMTPSA id h9sm3540346ejk.118.2020.11.26.10.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 10:14:16 -0800 (PST)
Subject: Re: [PATCH v9 2/6] leds: flash: Fix multicolor registration no-ops by
 return 0
To: Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606390654-6075-3-git-send-email-gene.chen.richtek@gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <a4670d78-18c9-37e5-d984-5aab1a5635f1@gmail.com>
Date: Thu, 26 Nov 2020 19:14:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606390654-6075-3-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_131418_830507_6BE8BBDB 
X-CRM114-Status: GOOD (  21.59  )
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

On 11/26/20 12:37 PM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Fix multicolor registration no-ops by return 0
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   include/linux/led-class-multicolor.h | 42 +++++++++++++-----------------------
>   1 file changed, 15 insertions(+), 27 deletions(-)
> 
> diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
> index 5116f9a..210d57b 100644
> --- a/include/linux/led-class-multicolor.h
> +++ b/include/linux/led-class-multicolor.h
> @@ -44,12 +44,6 @@ int led_classdev_multicolor_register_ext(struct device *parent,
>   					    struct led_classdev_mc *mcled_cdev,
>   					    struct led_init_data *init_data);
>   
> -static inline int led_classdev_multicolor_register(struct device *parent,
> -					    struct led_classdev_mc *mcled_cdev)
> -{
> -	return led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL);
> -}
> -
>   /**
>    * led_classdev_multicolor_unregister - unregisters an object of led_classdev
>    *					class with support for multicolor LEDs
> @@ -68,13 +62,6 @@ int devm_led_classdev_multicolor_register_ext(struct device *parent,
>   					  struct led_classdev_mc *mcled_cdev,
>   					  struct led_init_data *init_data);
>   
> -static inline int devm_led_classdev_multicolor_register(struct device *parent,
> -				     struct led_classdev_mc *mcled_cdev)
> -{
> -	return devm_led_classdev_multicolor_register_ext(parent, mcled_cdev,
> -							 NULL);
> -}
> -
>   void devm_led_classdev_multicolor_unregister(struct device *parent,
>   					    struct led_classdev_mc *mcled_cdev);
>   #else
> @@ -83,27 +70,33 @@ static inline int led_classdev_multicolor_register_ext(struct device *parent,
>   					    struct led_classdev_mc *mcled_cdev,
>   					    struct led_init_data *init_data)
>   {
> -	return -EINVAL;
> -}
> -
> -static inline int led_classdev_multicolor_register(struct device *parent,
> -					    struct led_classdev_mc *mcled_cdev)
> -{
> -	return led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL);
> +	return 0;
>   }
>   
>   static inline void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev) {};
>   static inline int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>   					       enum led_brightness brightness)
>   {
> -	return -EINVAL;
> +	return 0;
>   }
>   
>   static inline int devm_led_classdev_multicolor_register_ext(struct device *parent,
>   					  struct led_classdev_mc *mcled_cdev,
>   					  struct led_init_data *init_data)
>   {
> -	return -EINVAL;
> +	return 0;
> +}
> +
> +static inline void devm_led_classdev_multicolor_unregister(struct device *parent,
> +					    struct led_classdev_mc *mcled_cdev)
> +{};
> +
> +#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_MULTICOLOR) */
> +
> +static inline int led_classdev_multicolor_register(struct device *parent,
> +					    struct led_classdev_mc *mcled_cdev)
> +{
> +	return led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL);
>   }
>   
>   static inline int devm_led_classdev_multicolor_register(struct device *parent,
> @@ -113,9 +106,4 @@ static inline int devm_led_classdev_multicolor_register(struct device *parent,
>   							 NULL);
>   }
>   
> -static inline void devm_led_classdev_multicolor_unregister(struct device *parent,
> -					    struct led_classdev_mc *mcled_cdev)
> -{};
> -
> -#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_MULTICOLOR) */
>   #endif	/* _LINUX_MULTICOLOR_LEDS_H_INCLUDED */
> 

Here the same comment as for the patch 1/6.

With that:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
