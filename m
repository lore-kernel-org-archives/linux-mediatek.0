Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E158FC56201
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 18:16:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B4EA2075A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 18:16:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="20EJv2ZY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Airjt+mq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B4EA2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PQ3tz8Rm+98MKx898ovkadEmzR2f0VM0fQF5BFGbBSQ=; b=20EJv2ZYTodGaDH9pMAx3cGjc
	cfmvUROYRf2TBUMtKnZgJr7EqOaChRE+glRy86BQ+HUgbowYw5Chq1CiiUDTpQPrDp63z+IjzzcXH
	yqT6DdXtNcwe4j2ZCb6uuZjPx6p2Xw7FG4FjCOIV3QGCgXUWabtN3SZOofG5J5UTcYNnr14yGiulB
	qEH/wdWPZ/u4KuP4YS52aHqlNtTJkjlwdT7sLprV5fi3nIcv0wt3/DKY3PPuExvTUupvjUq0FqMS4
	V+Z9QdL/Clp5tm9BWnzXBRJ0NE+TMT2hDp6DULiQlysug4jAvrxzKWeMiZi3Qs9PVVL9R7hdQmUuk
	RJeArD15w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khzKt-0000aa-Tf; Wed, 25 Nov 2020 18:16:11 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khzKr-0000ZV-0q; Wed, 25 Nov 2020 18:16:10 +0000
Received: by mail-wm1-x344.google.com with SMTP id 1so3008666wme.3;
 Wed, 25 Nov 2020 10:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Mb92urLVYSY+Uus96fOTjrBSsMQ8BjraUW9LyjqFTKM=;
 b=Airjt+mq6yinBpTpkaAmqB+3+WEfthrezYEJdl2u54Vl75bg/xv9jVbllYf6I7OOQP
 cIUY5JKHYkLS+uifQqZ+btoP9EXv1583HVdtYzC7g+Ze7At39yobgqNlYlMBz2eWcYGg
 ze3ZRQkk1W38sla7dbI2bs8/4pkONI62375f2bMZYdvZSSKzBCuNf1tpDOXLaPYAypeh
 vlWdjFvQrY/xkAFNsHR+Rabc5wKhaLillsVwCsPfMQzAfR14x7Pw6PJ+WQoNlnFZ+KVV
 RQPV+6iVEVoBi5KTCqCX9+qXFmGWoE/rlKBUxRSXiGFpIDxLONoVsi1T0NzUxZp7JgIp
 pnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mb92urLVYSY+Uus96fOTjrBSsMQ8BjraUW9LyjqFTKM=;
 b=p+ATxQnEqGv1XItX//pKpVo7GUP8uGr0Xl+NN4lB4sd0xUWHK0JFWPhaZx/sf0VkVL
 96JUBNcLhirpK4/a2dsP6rhWigIpNm5MX3mKeE74Pl3mQ1vGs+6sL+HSABAZ4d2dN33k
 5Ol9UaPzRNKeBq1lk/Oqv6bn5W5f6JcgFISvzUuRhJTePDz3K8ypH/vvwf++g9/L+ucJ
 KPSaGVv+icBvGUsB5JOltZQ0S07IABdBBSxBv3uewVU677y/iCaAhbIJAMeexWvicc6a
 UBfbQrY7NoKO6B50lYabZalgoT3R4lynyzw3OuZ3tjhPQ8/V3O4p/3wpEMidtrLwzs9d
 0MmQ==
X-Gm-Message-State: AOAM533qDsliP7lo+H4k471C8Na6smSiJaQWvJjXum77UNgvzRRfJPxC
 Psm0Ta0itHaFpA8Oj2/FuD0=
X-Google-Smtp-Source: ABdhPJyyG7VwLy9LuuPXSKLesJ2fb/BOioRR0i7p7g2pgb5kzYyNWEh9R8nWxx792TCUV3CFnGdmEQ==
X-Received: by 2002:a1c:f20d:: with SMTP id s13mr5426446wmc.156.1606328167869; 
 Wed, 25 Nov 2020 10:16:07 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:a410:510b:ab5:5694?
 ([2a01:110f:b59:fd00:a410:510b:ab5:5694])
 by smtp.gmail.com with ESMTPSA id t20sm5875506wmi.3.2020.11.25.10.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 10:16:07 -0800 (PST)
Subject: Re: [PATCH v8 2/6] leds: flash: Fix multicolor registration no-ops by
 return 0
To: Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606301475-7030-3-git-send-email-gene.chen.richtek@gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <8ef9eee8-4f7b-6849-9151-210738e8fff6@gmail.com>
Date: Wed, 25 Nov 2020 19:16:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606301475-7030-3-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_131609_150679_5A4B2D4D 
X-CRM114-Status: GOOD (  19.98  )
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

Thank you for the fix.

Would you mind fixing in the same patch also a duplication of
led_classdev_multicolor_register() and
devm_led_classdev_multicolor_register(), by moving them
outside of #ifdef block ?

They look identical for both CONFIG_LEDS_CLASS_MULTICOLOR states.

On 11/25/20 11:51 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Fix multicolor registration no-ops by return 0
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   include/linux/led-class-multicolor.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
> index 5116f9a..dbf3832 100644
> --- a/include/linux/led-class-multicolor.h
> +++ b/include/linux/led-class-multicolor.h
> @@ -83,7 +83,7 @@ static inline int led_classdev_multicolor_register_ext(struct device *parent,
>   					    struct led_classdev_mc *mcled_cdev,
>   					    struct led_init_data *init_data)
>   {
> -	return -EINVAL;
> +	return 0;
>   }
>   
>   static inline int led_classdev_multicolor_register(struct device *parent,
> @@ -96,14 +96,14 @@ static inline void led_classdev_multicolor_unregister(struct led_classdev_mc *mc
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
>   }
>   
>   static inline int devm_led_classdev_multicolor_register(struct device *parent,
> 

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
