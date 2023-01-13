Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F98C54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 14:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEUcQJgo4nd7YRU9VbAj1BQarAeAhdaCCvt7HZueth4=; b=rIj0HcTs9AplK77j0WCoOg/bjd
	IWkQ8Xm1Q8GHUoU1t/q04ngCUnYxwERlYyZeOiOY7VR/HeACqSp+2hnV0+q/9O6lE+6imOVHMxSH8
	lrIGbjiOCEEHNxm+Fb/3mfLxD2RhOtFZXSFe/6nKCzv2/e/S2RidhGr2YVX2lCRMcjUydUSX+ol2w
	HGieYfGnF6eKYj2FYLveECTP6fCzoiUPMJ8q31nP55IvguqHLmyXmN59aghko4k10y43AUH4G4s9O
	SS3oglp5gfWJxfFAMY48cQt3fp9F83vKPaAOlniGONpdAWn9qW0sfx5DAgMApjxr5IzvQsgj6Ndz+
	zkRMSxPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGL08-002vf5-54; Fri, 13 Jan 2023 14:25:48 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGKzu-002vbq-16
	for linux-mediatek@lists.infradead.org; Fri, 13 Jan 2023 14:25:36 +0000
Received: by mail-ed1-x534.google.com with SMTP id c17so31360216edj.13
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Jan 2023 06:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YEUcQJgo4nd7YRU9VbAj1BQarAeAhdaCCvt7HZueth4=;
        b=k6r9nxffwxxByM++kGiGb1vHHyRXAE938BBi8hokhVcsx9RQWHVSsX/cqY4Pc6ObvP
         Fl/uwzCHjMccvMnIfnDa0Bs4yN7HT1OdK+AxVzTnxnDh8AFQh3CLtN5W+YsKXUXG34K1
         vUBV3KfCaTR5NqkFXScK8219n0P0mlxC8eg5Ab68JYMIIeQ28blbm8Od/N2C2V2cQxf0
         bgqb8ORnhcs+vourTXKeoCNZOdzLiPaJQ9anjnOjinn7XNJQ8Z5gpXQ32Xpuq/40DqvP
         AC2pJ1lYVnlQU7fqLKePJVO/GF7jyt9NXRi3UbRjAqK3CkssoaFX4SDICxjJjyFXO6uD
         L2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEUcQJgo4nd7YRU9VbAj1BQarAeAhdaCCvt7HZueth4=;
        b=wSgUR5AG6wFP6vPq02GAJdA52b487AQWGpZ6vFkEmjiqOagYlTFqrmublwgXXOz7Zl
         amTSpYRXnmgBcuSBUDISxz0pi5oXlmqZPjFetry+3quavpGxi7vJxKCX3MuPkC7eIXw3
         2+GQKyxGdL421DE/asqj8EfnUKR0jSu5GgMXmyXRVgnTSeD3fYIblZJLItAfTJXvrIj/
         ab8SIR4ONBC07XRpLb9ALlZTP0awuXqsmsqZO+99hbKlkpYvNvF7yoOTqzBntcnpWgiI
         UnZalRFpSJMayUfIEA0mQQ9nIVz+9aSwNnFrcnUF3cIU7hY/gtBXgJMsbgr0VIzbt4fw
         n+8g==
X-Gm-Message-State: AFqh2kopffBW4WyC3UVAYKJmxMoeTJy73DghXc9D/OiZXB2wvzbkt9Ck
	fzfty3OLbRusn+Z2iD6HlJpn3Lw1MfIP+1K68g1oZg==
X-Google-Smtp-Source: AMrXdXulmidvZ1oMRAo6JmZyF47HXbfqDleSFL/Eiv4c6UJxSDGmEO8n3WxUW+wsM7qr+H6GXfGk9iaQMny1qwxvTPo=
X-Received: by 2002:a05:6402:4013:b0:49a:b8ee:ef4b with SMTP id
 d19-20020a056402401300b0049ab8eeef4bmr787211eda.143.1673619932279; Fri, 13
 Jan 2023 06:25:32 -0800 (PST)
MIME-Version: 1.0
References: <20230112152855.216072-1-bchihi@baylibre.com> <20230112152855.216072-7-bchihi@baylibre.com>
 <daed4793-3aae-f927-5634-cfb876709f93@gmail.com>
In-Reply-To: <daed4793-3aae-f927-5634-cfb876709f93@gmail.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Fri, 13 Jan 2023 15:24:55 +0100
Message-ID: <CAGuA+orPcSkztt_9vUmrSD8R0tifAtdHt=KsKVebJFXpe6zBzA@mail.gmail.com>
Subject: Re: [PATCH v10 6/6] arm64/dts/mt8195: Add temperature mitigation threshold
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org, 
	rui.zhang@intel.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	khilman@baylibre.com, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_062534_283197_FB1D82F8 
X-CRM114-Status: GOOD (  15.73  )
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

On Fri, Jan 13, 2023 at 12:49 PM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
>
>
>
> On 12/01/2023 16:28, bchihi@baylibre.com wrote:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > The mt8195 board has several hotspots around the CPUs. Specify the
> > targeted temperature threshold when to apply the mitigation and define
> > the associated cooling devices.
> >
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 153 ++++++++++++++++++++---
> >   1 file changed, 137 insertions(+), 16 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index 683e5057d68d..0d6642603095 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -14,6 +14,7 @@
> >   #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> >   #include <dt-bindings/power/mt8195-power.h>
> >   #include <dt-bindings/reset/mt8195-resets.h>
> > +#include <dt-bindings/thermal/thermal.h>
> >   #include <dt-bindings/thermal/mediatek-lvts.h>
> >
> >   / {
> > @@ -2413,107 +2414,227 @@ dp_tx: dp-tx@1c600000 {
> >
> >       thermal_zones: thermal-zones {
> >               cpu0-thermal {
> > -                     polling-delay = <0>;
> > -                     polling-delay-passive = <0>;
> > +                     polling-delay = <1000>;
> > +                     polling-delay-passive = <250>;
> >                       thermal-sensors = <&lvts_mcu MT819x_MCU_LITTLE_CPU0>;
>
> New line here please.
>
> >                       trips {
> > +                             cpu0_alert: trip-alert {
> > +                                     temperature = <85000>;
> > +                                     hysteresis = <2000>;
> > +                                     type = "passive";
> > +                             };
>
> New line here please and on other trip point definitions.
>

Hi Matthias,

Thank you for the feedback!
It will be added in the next version.

Best regards,
Balsam

> Regards,
> Matthias

