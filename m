Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D02C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 16:27:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F4B064F1B
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 16:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F4B064F1B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d3NtV1rA28LgDvgPbN2z8yxJybwDo+srYVQR/ScY1b0=; b=eQHgRlYy9XENnRHaxgBOxBtVr
	vkZ40Mcv6ySr4XHc/e9x0pr+TELe6cHOTLy/fMTRAcMMinLGieLzR1mN48pISsm/Uexs2DqU5H7Ly
	LMVYUsartZOHPmoebasoTtdEbE5K1JOJSJsMMk13KmwRqipnZjjXVEg5dHLTVY63i1usGIBkHFnfI
	6Me1qKMp6vTNvYVX3ADdLRc60R2YIQHmLPfCwixwEUgT1aoh1XtwLbpTqnnAzQh0jB1Bewzwf5Gwl
	0k7sZw0r3T8PqdymoXwU937LQOz8jN8Neu0UZB/f6s665VYsfAO2bD0jD4FLnMUmBIMujmToRxWBI
	G9wMuErOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFJTZ-00057G-As; Thu, 25 Feb 2021 16:26:53 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFJTX-00056i-Ij; Thu, 25 Feb 2021 16:26:52 +0000
Received: by mail-oi1-x22d.google.com with SMTP id h17so6626826oih.5;
 Thu, 25 Feb 2021 08:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c8+E3tKaHv1Iv53/dVuKP3IEuN3f05dgVCivKk8lejs=;
 b=Ld7CmKY4g+LqZwjMLPC7wKVNJONL7SRRph4vaveM7ySisL+OKqrBMdG68Yzto++BJ0
 wHct57jbHrgqf9LAnsS0Vwssu2eC2Vc/9HQRTt9I9HG8JlOlL8KWahMXGXEyRAhJwL9/
 C3MdGp/YYttr/45wiDIuwtASeYuMkRoklERDQQhf+UAVTUC3jLagWccLuuEX8fHISyh4
 5D1GsUBJzt1Oo0HC5JZN2syR+8Q9Ai2NyYjl9Ir1vrLWeyAqzEmt0V5yZO9LOXmlRU4G
 UsjnARgzDfD5i/EhGp9amqmpg6rgikCuhSDATB+7HpSx4XAYwUi1DqpI66kIbkFRa16I
 NoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c8+E3tKaHv1Iv53/dVuKP3IEuN3f05dgVCivKk8lejs=;
 b=CDfw2O39UH1ILc/0/kZ27jFmpwdgN+jm1pI+NcddSRYiDBwdiFiajNcQPpI26bX5JR
 ayX5grKuZqYQaNUtmZsB3D5VCXLwMVLLWSf6G+g+VP/RRF28wks30PzosTo3tSbW5J5b
 To8+XNFL5PuQNajoNQ9PfOCWvnPBetOsWMHxChsFcu93Ntvy/KbhJYuCjGDVfvjm2Fhw
 3QEyEC4mObiwIAyuHuGiTMXrwfBzlogL/kH2Qnw4ikRux8wJXO3N16nJKJw+6APOTbe8
 vpNHQhkXp1iKaSLPNskFo3QGKzYpA3Qxsgoh2Xdo0+Q4rERbd2w/lHotiTsYylfhZCaz
 xpAQ==
X-Gm-Message-State: AOAM5300sp3jGGWYprtB+5AgICWW8nib3dItbhqSFqyOQiWI4+pRfzIX
 XNfYGDpXSQWietpacqCVjarvycT56ip5JseqN0Y=
X-Google-Smtp-Source: ABdhPJyybdAtq8H+CRG2egH1fCHK6WDlPZP8BO+1ULhZK5N6M93VYf5idc5ZE+VeG4G2rB1ittD60d81irmaVwM5Qi8=
X-Received: by 2002:aca:4454:: with SMTP id r81mr2385686oia.129.1614270408226; 
 Thu, 25 Feb 2021 08:26:48 -0800 (PST)
MIME-Version: 1.0
References: <20210201110447.383473-1-hsinyi@chromium.org>
In-Reply-To: <20210201110447.383473-1-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 25 Feb 2021 17:26:36 +0100
Message-ID: <CAFqH_50_SKgwgtV+8UX+4v=S9mY9tf0HCQaCKgGCQzWuBfQ7ug@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: Add gce client reg for display
 subcomponents
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_112651_652304_87A0F662 
X-CRM114-Status: GOOD (  16.02  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hsin-Yi,

Thank you for the patch.

Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dl., 1 de febr.
2021 a les 12:05:
>
> Add mediatek,gce-client-reg for ccorr, aal, gamma, dither.
>
> Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

FWIW this removes some errors from the boot log like this:

 platform 14010000.aal: error -2 can't parse gce-client-reg property (0)

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index b3b8afec5ab9a..0ed37dd9d80b4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1058,6 +1058,7 @@ ccorr0: ccorr@1400f000 {
>                         interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
>                         power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>                         clocks = <&mmsys CLK_MM_DISP_CCORR0>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
>                 };
>
>                 aal0: aal@14010000 {
> @@ -1067,6 +1068,7 @@ aal0: aal@14010000 {
>                         interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_LOW>;
>                         power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>                         clocks = <&mmsys CLK_MM_DISP_AAL0>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
>                 };
>
>                 gamma0: gamma@14011000 {
> @@ -1075,6 +1077,7 @@ gamma0: gamma@14011000 {
>                         interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
>                         power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>                         clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
>                 };
>
>                 dither0: dither@14012000 {
> @@ -1083,6 +1086,7 @@ dither0: dither@14012000 {
>                         interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
>                         power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>                         clocks = <&mmsys CLK_MM_DISP_DITHER0>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
>                 };
>
>                 dsi0: dsi@14014000 {
> --
> 2.30.0.365.g02bc693789-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
