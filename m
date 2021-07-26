Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E669EC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 14:01:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A01D660F55
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 14:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A01D660F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nFZBp8FhKJX8RMUL3aJAGjK70VRRcBHZ3W3R1GAOPtk=; b=D/uZ/EBenDjlo2
	9gt0U+AJWn3gkkJwLvyElsNYX9sLmDJeP99ykdQh+S02cvNdrdE+h0obKsCl57y7bJHIKm6nUwvua
	C41SCD+vU6iPU+77qrRFDhugwx9y03YUxS5TUmGDa8vG1+rLI2Sik59tHe72h2qyTxfnPo2cNZPr7
	z//xi/aszuR5T3tWuOsUvU+884F27EQVlQk2dHI4fl7CqK+Q6bIRD9LzqSKxtY4XOb8VTSo+nInVY
	XpI1i7nukhX7LZCBAH1W8NHuXEnMG18LD1ZWXPd6Em745Y9vbhhj1sdcx8umBJ+HPB1kUMbOAKju7
	DBTUzaGOhHLC7gHJUluQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m81A4-00BPEL-UI; Mon, 26 Jul 2021 14:00:52 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m819e-00BP8e-ON; Mon, 26 Jul 2021 14:00:28 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id s14so5113711qvm.4;
 Mon, 26 Jul 2021 07:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=pxMM15ZHXjLx5HEWP2ljfrxj5I8bM98TUGkRptn2eJc=;
 b=Qf2LmVbSl9kTgbqdlNUVhOdyd+yNxxcP7wfQ/CaAIfH7Hft+4wIvhedth+71WhHBV7
 Nr+3zTmJdoZtoo1SRN8myq2jQKUr9AhkWa7gmnwaFX9mQkDJo6dTYeyWxgb5GpIqxDvE
 dDsWjXh9Am3VraObY1ionR1s8Z9p5fjp0qs3yHPfd4zOfsVWNVjg4IKW+YkZ7J9PPTT3
 5LTx9zXrdS63Xh6QaYDBYMIaRKA726J7fVydrWNuUV290mC08KxV7clB0LA5kMPA79xw
 Efz15tYH9PECyZy38aL+Dww65BituNb31u0NNE8rOTXXSfNFeQFFAU241s3EIqSaQn4O
 rCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=pxMM15ZHXjLx5HEWP2ljfrxj5I8bM98TUGkRptn2eJc=;
 b=RmopX+NhplvFAenRV1ndNsNwJ++n003J+DW5qfp+BKxw0G3LVORkPaxYaScL4QR/Vh
 TFfDe3cgHqSsos6ojeQ3JIc+avQiJCAsbl0wNMUPrhSH619eqlYNiCgKQeGU1/G1bmFK
 YCVgcTc+FwAxz83FwvuldJ02hysmmw2d+9XhkYgV5INOeL0ItffNQOLO/Kb/4uzQt+0x
 67PDoGPA4tx97yDYkok5RHWjvbMHKS059xTGwUT/YAELFRYtIvN154xBVgYh95VfPub0
 Y7id05q8ZSAG9DJpMiM3lUScRBxQ+ZU2Vi5ELWpI14ccV9DO3zELvtD28LcDzEEon75Z
 LFXQ==
X-Gm-Message-State: AOAM530JX3mPxnHIPx6ouTIfCm1QwwsDJmMntWEPtD/uBBAIZ99hrfAS
 K4CTQt+L54RA4F0sHrv95Nc=
X-Google-Smtp-Source: ABdhPJw48dTY8WUiWkjDerFNPjvQvAUCyTp2uni4QtKPaVhNgOIf6mzr/X9WEZdSFJ7DhnbTekwlcg==
X-Received: by 2002:a05:6214:27e7:: with SMTP id
 jt7mr18028066qvb.28.1627308024966; 
 Mon, 26 Jul 2021 07:00:24 -0700 (PDT)
Received: from [192.168.1.3] ([69.73.219.130])
 by smtp.gmail.com with ESMTPSA id u3sm48780qtg.16.2021.07.26.07.00.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Jul 2021 07:00:23 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] thermal: fix thermal_cooling_device_register() prototype
From: =?utf-8?Q?Jean-Fran=C3=A7ois_Dagenais?= <jeff.dagenais@gmail.com>
In-Reply-To: <20210722090717.1116748-1-arnd@kernel.org>
Date: Mon, 26 Jul 2021 10:00:18 -0400
Cc: Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Amit Kucheria <amitk@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>,
 Thara Gopinath <thara.gopinath@linaro.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Message-Id: <ABDAFCAB-8DF5-41A7-B1E0-4953A9BF32B3@gmail.com>
References: <20210722090717.1116748-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_070026_836293_724532B3 
X-CRM114-Status: GOOD (  22.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Good job.

> On Jul 22, 2021, at 05:06, Arnd Bergmann <arnd@kernel.org> wrote:
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There are two pairs of declarations for thermal_cooling_device_register()
> and thermal_of_cooling_device_register(), and only one set was changed
> in a recent patch, so the other one now causes a compile-time warning:
> 
> drivers/net/wireless/mediatek/mt76/mt7915/init.c: In function 'mt7915_thermal_init':
> drivers/net/wireless/mediatek/mt76/mt7915/init.c:134:48: error: passing argument 1 of 'thermal_cooling_device_register' discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
>  134 |         cdev = thermal_cooling_device_register(wiphy_name(wiphy), phy,
>      |                                                ^~~~~~~~~~~~~~~~~
> In file included from drivers/net/wireless/mediatek/mt76/mt7915/init.c:7:
> include/linux/thermal.h:407:39: note: expected 'char *' but argument is of type 'const char *'
>  407 | thermal_cooling_device_register(char *type, void *devdata,
>      |                                 ~~~~~~^~~~
> 
> Change the dummy helper functions to have the same arguments as the
> normal version.
> 
> Fixes: f991de53a8ab ("thermal: make device_register's type argument const")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
> ---
> include/linux/thermal.h | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/thermal.h b/include/linux/thermal.h
> index d296f3b88fb9..8050d929a5b4 100644
> --- a/include/linux/thermal.h
> +++ b/include/linux/thermal.h
> @@ -404,12 +404,13 @@ static inline void thermal_zone_device_unregister(
> 	struct thermal_zone_device *tz)
> { }
> static inline struct thermal_cooling_device *
> -thermal_cooling_device_register(char *type, void *devdata,
> +thermal_cooling_device_register(const char *type, void *devdata,
> 	const struct thermal_cooling_device_ops *ops)
> { return ERR_PTR(-ENODEV); }
> static inline struct thermal_cooling_device *
> thermal_of_cooling_device_register(struct device_node *np,
> -	char *type, void *devdata, const struct thermal_cooling_device_ops *ops)
> +	const char *type, void *devdata,
> +	const struct thermal_cooling_device_ops *ops)
> { return ERR_PTR(-ENODEV); }
> static inline struct thermal_cooling_device *
> devm_thermal_of_cooling_device_register(struct device *dev,
> -- 
> 2.29.2
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
