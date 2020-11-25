Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D4EC56201
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 18:15:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E3A0206F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 18:15:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yl0KvoTY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1ITS4HE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E3A0206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CtDeMvcIezPA7aWDyBR3rUW+EjAtG+yqZVYQFGB3T1A=; b=Yl0KvoTY9RVUOW04mNZ8aVnB/
	wAa5XiRB4xdsYdWXWbVTgItZXFTYv5j0uPA+BGSzkmDwv8W1DzcJuPs4Q4fwWvKbq68zpeLrTCPcS
	4flgPQp/hjBXIMpA2n1oe/oU+uuiFoPioAyhWpcI75ufbZ+MbxXeLWze2EF1uBzIQz29PNfqjufAV
	GeIUG9FAgSXWyk5jjkSC0i1mNQW9KJL8VnKBUKeg4pg63UQnt4fyAw556IoJK5fvNOfE2uuJHzWYt
	IeClTdA4vbVbpVgVecsG7ojzz1amB2qWujgOZhhOg6pwQ6u14jNl46Ik2plwRxl30yxxE+yUXWhIL
	HzeH/YPRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khzKP-0000Sr-51; Wed, 25 Nov 2020 18:15:41 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khzKM-0000Re-TL; Wed, 25 Nov 2020 18:15:39 +0000
Received: by mail-wr1-x443.google.com with SMTP id z7so2841560wrn.3;
 Wed, 25 Nov 2020 10:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cxDV/cJpIfcx9YO7YSoPmjZvWF3a1aMv7vyPqRw+nys=;
 b=Z1ITS4HEGGlN44kxO/mL0CCOmvDCCv4Vhdb3eLCCji8LCUdYLutVT5azV2xAhboLT3
 /78QMKmJtgZk7NiPxo9MPnufc3Fztepx9rnU8kxVMu5REmrL5750IDNyXDpkubW+yDcw
 xS1Fmo7qvONYFsoY8cTUdTs6PtBlOzAOMFUmGf86cULQweiLCRd2canys0jeLXsYCOE2
 B8+QF1Rn2W0J52u5dUrE8bfCh4bssT886l5v0IrBQbhi94KYGr2hZ/J14TF9ZINCp5jB
 nPV6wbepj5J4EzsnoQip8UAxRxNDUdQRTeOyLzRAhrooshahRLtwlX7tzy7bUMoR/7HD
 dq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cxDV/cJpIfcx9YO7YSoPmjZvWF3a1aMv7vyPqRw+nys=;
 b=BM2M7hERMjzbe9bXweRvKzZ3OnBAEuqRytV6zGm8X1i82Gz2KH4F38JiToNGd8al/c
 8fSVYazcW0pygNsM5xbo1mlmrRZ3TLICTfWTd2zYGVH9eWm4yFEM0RIKgmWX1zQfj2Jx
 MaHfO9CQVM0xXGpC5JF4+eft5d9d7MFqYcHgqdslDc/ItUaXK7hI1AA0qy6EkHVfHPq/
 Fz+wI/KaUXYluT3jBAJXugM5AcJ09/pyT0xQ6et+r4FFAu5FKZw2RmLiCtXwM7+cicy1
 GMKLEhmTu0HNmp8mqfFhc/WEJCDR2LjPC2Kx9adSGdtpSqa5BW8RuTxEvnck1EE+b+nY
 XRnQ==
X-Gm-Message-State: AOAM531MY6kT1yPgqls8oFZtJZoOTMOhY+1S1taPFqpXagh4L/7NJHCT
 btGUuKzLQLMWkVrxIo/gz72Pww3zqQM=
X-Google-Smtp-Source: ABdhPJwH143DPR/m8Ye15E/IMHSzxYoFs35JplLGyBmM4CvNLf+S+vQZyZHTh8os+pO9uvboH1qnlw==
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr5416545wrj.328.1606328137508; 
 Wed, 25 Nov 2020 10:15:37 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:a410:510b:ab5:5694?
 ([2a01:110f:b59:fd00:a410:510b:ab5:5694])
 by smtp.gmail.com with ESMTPSA id c9sm5412252wrp.73.2020.11.25.10.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 10:15:36 -0800 (PST)
Subject: Re: [PATCH v8 1/6] leds: flash: Add flash registration with undefined
 CONFIG_LEDS_CLASS_FLASH
To: Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606301475-7030-2-git-send-email-gene.chen.richtek@gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <da86a941-2752-fd25-a74f-e22b3e82357e@gmail.com>
Date: Wed, 25 Nov 2020 19:15:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606301475-7030-2-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_131539_035437_39E98C30 
X-CRM114-Status: GOOD (  22.00  )
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

On 11/25/20 11:51 AM, Gene Chen wrote:
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
> index 21a3358..5f36eae 100644
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
> +	return 0;
> +}
> +
> +static inline int led_classdev_flash_register(struct device *parent,
> +					   struct led_classdev_flash *fled_cdev)
> +{
> +	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
> +}

This function can be placed after #ifdef block - now it is in two copies
in this file.

> +
> +static inline void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev) {};
> +static inline int devm_led_classdev_flash_register_ext(struct device *parent,
> +				     struct led_classdev_flash *fled_cdev,
> +				     struct led_init_data *init_data)
> +{
> +	return 0;
> +}
> +
> +static inline int devm_led_classdev_flash_register(struct device *parent,
> +				     struct led_classdev_flash *fled_cdev)
> +{
> +	return devm_led_classdev_flash_register_ext(parent, fled_cdev, NULL);
> +}

Ditto.

> +static inline void devm_led_classdev_flash_unregister(struct device *parent,
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
