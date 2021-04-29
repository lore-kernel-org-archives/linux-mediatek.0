Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8D7C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 14:58:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F9F761441
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 14:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F9F761441
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jrwiEm9NPWirPs+2I3zI+wyQZCQfNQasqeqdSadw5So=; b=hvZmX82tBmH5BonL5gwkxjcBY
	EDC2grWXLl79ftojXi78d07K52JMd+s8ryngNlKZoF4u2d72iHIsARlXsba9+oloZcfADN7vtaY1J
	WMAamBZg4FPB2GfAATm0x38ZIVPjBvdxeaAquMOQNiKa/vQp06elySSFGQWxB1sJmLvD3GBPvT1la
	C1izBqJn5sRngKs9Rx8IG3btclHhRoYMcGLXeuF1SuiwzjXPqIkGcwGOgu6nromnBGJCpapStn3Cv
	zS8qA62cK7xGNiNucxNCVmhY/Lg4wXgxss3hJk1+79i0TmlvIQIIzAweJf/zsHzfQn6jeoSdhankD
	8CyRvL67w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc86y-005s3O-89; Thu, 29 Apr 2021 14:57:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc86m-005s2P-1W
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 14:57:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wuKzS2oTtiQkbI8rPVbUG3ar6t1lshuChsCbJCKipHw=; b=sde82F9a0iBX0YjWtCOxLOGbeI
 nqNOT5gXM+ozj5wtRcstJJtYVjeTmY4LK8er63JKyE12mSzPzL2KsmzCqY749nNMKk76Cpc4NxnSy
 N/49m18VlFu+Au3/GO2ZF2AobZefrRjOc/uyrMEVNHSm9qh4mGN1xHBgNVEcXXhoTl8giSzT8xDKa
 gOp+zGTz22pINvg8h8134vtRFq0Zf7PH+PUly5y5LlYfWa+W1/juYT6LtcpzKVpEBXyedsO4VJ1cp
 Vjgdrl+vL29dyZrzNXGGIXTvB3tffXrywuRdB1MP1OsbltDnEU95CBGq4dm0ZR0MLgJSkolzNKuNs
 b+oEwwFA==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc86f-000hsY-5Z
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 14:57:35 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 o21-20020a1c4d150000b029012e52898006so11016287wmh.0
 for <linux-mediatek@lists.infradead.org>; Thu, 29 Apr 2021 07:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=wuKzS2oTtiQkbI8rPVbUG3ar6t1lshuChsCbJCKipHw=;
 b=2QKoHx7WyUfVy7QJfMYEcBL3OYzyIZOIFXLhGuZ3M7fSJph8xBr4xNHNVTIBbKXwEf
 ri5ADWb2cygpnEr8Ju0O94UXUVOpmjYSAsdWKjaAYnqkE7NULo+K1NeJROeXf7bYJjv8
 K/SbhS72Oo5VUQbD+gPp9q2VX5lTJNAGZSehGJLKZEhlwDZnqBQCyEO+4dXdXsVr48z8
 vWTJajCRegoGSx9qWTUbyWXhNQsKv4W1SJtgElJz6xGjtxAeNVyXlbP+OhDO9HgSumBD
 ybCDy5smJjVyRp5KCUQ33LIZW1aGOBwIYIvfEcgHt0ZjUrNind18CUa9mNhyKm6Q5sqn
 0eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=wuKzS2oTtiQkbI8rPVbUG3ar6t1lshuChsCbJCKipHw=;
 b=OygwcSGs547T7BZCH61LSg100kiJp4bOa7GYVw5nf6RIioQDewvHx7gVWtsxBnpSlC
 tsqaCtQw/uG7pa71hiRGBUlIICrHMXgPZ4pgK6X2w+ygcqR9ZA4rqyVMv9C9eLOgnTbJ
 4gZBye/HlLOYwnOsKdBA05bBo6sIR+SJ5D1mpopld/aVwTVxlKuKrxb0oEJuswBbdt+R
 rCjvwqmsVTWW2elHO+7yiSuoq0yR+ty8hANwW+UhMwfT57NYpOfaaTIBRoPF5TfbUtW3
 Ovdrx6YVVCM370QbrILkgrSUZG3g/F+Anr0AvB3kqgYe7H8d6C6BbEl5J14sehORAM5/
 wh8g==
X-Gm-Message-State: AOAM531VwzfZ3JDoIVynMkJ3IEDd3L+7bsKcY7JU5a6bWyw/M7kU3CpA
 EHWSuRlEGWMBgtDG/owhusFn3Q==
X-Google-Smtp-Source: ABdhPJygeu6+jxHQmMh0dCZBBeXl2cnq+lKGRRvmHXZEtCsdJj+5PCFNbBWGlVZIWeaVZ7MgqZ2Z9g==
X-Received: by 2002:a7b:cb85:: with SMTP id m5mr10700979wmi.53.1619708251697; 
 Thu, 29 Apr 2021 07:57:31 -0700 (PDT)
Received: from localhost ([2a01:cb19:826e:8e00:f37e:9091:b397:6f48])
 by smtp.gmail.com with ESMTPSA id k16sm250190wmi.44.2021.04.29.07.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 07:57:31 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Lee Jones <lee.jones@linaro.org>
Cc: fparent@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/7] Input: mtk-pmic-keys - add support for MT6358
In-Reply-To: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
References: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
Date: Thu, 29 Apr 2021 16:57:30 +0200
Message-ID: <87tunpw339.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_075733_233636_C5DF8711 
X-CRM114-Status: GOOD (  18.49  )
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

Hi Matthias, Dmitry, Lee,

Mattijs Korpershoek <mkorpershoek@baylibre.com> writes:

Please ignore this series for now

> The MediaTek MT6358 PMIC has support for two buttons: PWR and HOME.
>
> The interrupt logic is a little different than other PMICs from the
> same family:
> * for MT6323 and MT6397, we have one interrupt source per button
> * for MT6358, we have two interrupts lines per button: the press and
> * release interrupts are distinct sources.
>
> These series:
> * Fix a NULL ptr error when we use mtk-pmic-keys without dts code
I've submitted this as a separate bugfix [1] to ease the review.

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210429143811.2030717-1-mkorpershoek@baylibre.com/

> * Rework the mt6397 driver to prepare for this different interrupt logic
> * Add support for the MT6358 power buttons
>
> This has been functionally tested (using evtest) on
> the mt8183-pumpkin board on linux/master
>
> It has also been used for a couple of months in a downstream
> tree based on v5.4.
>
> Mattijs Korpershoek (7):
>   Input: mtk-pmic-keys - check for NULL on of_match_device()
>   mfd: mt6397: add mt6358 register definitions for power key
>   mfd: mt6397: keys: use named IRQs instead of index
>   dt-bindings: input: mtk-pmic-keys: add MT6358 binding definition
>   Input: mtk-pmic-keys - add support for MT6358
I'll send a v2 for these

>   mfd: mt6397: Add PMIC keys for MT6358
>   arm64: dts: mt6358: add mt6358-keys node
>
>  .../bindings/input/mtk-pmic-keys.txt          |  5 +-
>  arch/arm64/boot/dts/mediatek/mt6358.dtsi      | 12 ++++
>  drivers/input/keyboard/mtk-pmic-keys.c        | 59 +++++++++++++++++--
>  drivers/mfd/mt6397-core.c                     | 20 +++++--
>  include/linux/mfd/mt6358/registers.h          |  2 +
>  5 files changed, 89 insertions(+), 9 deletions(-)
>
>
> base-commit: 4a0225c3d208cfa6e4550f2210ffd9114a952a81
> -- 
> 2.27.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
