Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF542C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 07:18:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 278B361106
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 07:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 278B361106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0PqkPl07Iz6tG58bbCjHBWT5M09ErqoaXSFEGxSxX/g=; b=ICh6aiqYv0iyHasS3NIuWRjHr
	FPnL+/7v4h8BHDYAFFGgG+pwmZabeyHJFhZnLdJpwGqmCHCkTFtQcIb+RCiFUbYNQpRx89a2IFyIw
	efX7NfVsDW1LIwfyHNIDY1ohbrV7Q+/M0N2zg0yjGYaDFlnNw/3OOL47yHiUZfG2RDoEe7Nor9Ni/
	XMqS/McN0+uOf8zOcWxsvseUU6Cl0wwtuGFCDjFJW/l49fjtYFUGbdDU4RWyAhycLHgeDy68KOT8I
	zsc+JNDXk3UpifIGGx2GNxdHJrXwdER4kGUfyYXSqHEDYcrcupdC1vgN89P7HxNp3pqfmc3s4amv5
	Ai+s9u/6g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUlOy-00APbp-2Q; Fri, 09 Apr 2021 07:18:00 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUlOC-00APVQ-D5
 for linux-mediatek@lists.infradead.org; Fri, 09 Apr 2021 07:17:14 +0000
Received: by mail-il1-x12f.google.com with SMTP id o15so3917711ilf.11
 for <linux-mediatek@lists.infradead.org>; Fri, 09 Apr 2021 00:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kQnIRoHA4x1UAhY7RX5AeqrqGDyDCqLIFSUEhL1QK7s=;
 b=NDXgKlLvAaZbc2qgy4Q0R5uga266mP1/WWd6hXjrCDfa3vyAxGVho3/+i3MuR45Kl+
 eyLLJYmVei5meNFxRsbt4wB4mFC512Lw1pJQg7zCqwzePeXrP+07O0tpYz/M8jNVQ6SU
 BWJwbInvZcE0MZENZOpg1Xtt5H2jCmzhDALzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kQnIRoHA4x1UAhY7RX5AeqrqGDyDCqLIFSUEhL1QK7s=;
 b=jSMbAoEVXJ5qgbBOBMsZBHU9WJOB27oLVxzjkfe1sKl8n6xc8JdflO1bDR3Y6T3A+y
 WuXEVKH0Tf9V+xuIqPazd4Nd5l71GzdQQ057XDPhf9OrOdS5ymKvV3mjpa14IPDscXvJ
 3xWlPRnwq5HceJ/okzCWfKYltMwdNAQjD4dK6iaP8Fl57itJjccsgZ7bYoHdn9QpJwnX
 6+y7Plg5A6ns/iZ7zy+GTgNbGMp44EJR+tkhzcRQGKQhLi2ewwNz/0lOhpevQv2Ummpb
 aKlkJY1WjsQgKgeaVJny5UD2ZRD9pp+iHnEx1ZpU5aCfpibwOzSYJOakoZ4mxkXLZwFH
 LHEA==
X-Gm-Message-State: AOAM5332UVi1P8Izh6uEx6gDmsuPC1k+ryyYh2WU7YIUxbrNKFjxl5fb
 wJkjxuE3jadaq72KaU0m1LzNgQf2WWCG1NBAoQieIg==
X-Google-Smtp-Source: ABdhPJy9q6Hme9f6iqNO9ugJeOby6qDIOrflfECR7vElVqX4gwbpzavhILzhkX02xc2aDf1+38x6gz2hk27uUelkelQ=
X-Received: by 2002:a05:6e02:2197:: with SMTP id
 j23mr10336676ila.308.1617952630774; 
 Fri, 09 Apr 2021 00:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210409071158.2346-1-michael.kao@mediatek.com>
In-Reply-To: <20210409071158.2346-1-michael.kao@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 9 Apr 2021 15:16:44 +0800
Message-ID: <CAJMQK-gXfR2Ca-Ay5fwcRgQ4F6h4xXVt1bbAL+3LFwgotwYREA@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: mt8183-kukui: Enable thermal Tboard
To: Michael Kao <michael.kao@mediatek.com>
Cc: fan.chen@mediatek.com, Zhang Rui <rui.zhang@intel.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Linux PM <linux-pm@vger.kernel.org>,
 srv_heupstream@mediatek.com, Eduardo Valentin <edubezval@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Devicetree List <devicetree@vger.kernel.org>, 
 lkml <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_081712_952083_B20D5A5F 
X-CRM114-Status: GOOD (  17.14  )
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

On Fri, Apr 9, 2021 at 3:12 PM Michael Kao <michael.kao@mediatek.com> wrote:
>
> Add Tboard thermal sensor settings.
>
> pull-up voltage: 1800 mv
> pull-up resistor: 75K
>
> Vsense = pull-up voltage * Rntc / ( pull-up resistor + Rntc )
> AuxIn = Vsense * 4096 / 1500
>
> TEST=boot kukui
>      check /sys/class/thermal/thermal_zone*/type
>      check /sys/class/thermal/thermal_zone*/temp
the TEST lines can be removed.

>
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---

Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

This removes following error:
[   10.882325] generic-adc-thermal thermal-sensor1: Thermal zone
sensor register failed: -19
[   10.911912] generic-adc-thermal thermal-sensor2: Thermal zone
sensor register failed: -19

>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 14 ++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi       |  2 +-
>  2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index bf2ad1294dd3..202acb542b12 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -801,6 +801,20 @@
>         status = "okay";
>  };
>
> +&thermal_zones {
> +       Tboard1 {
> +               polling-delay = <1000>; /* milliseconds */
> +               polling-delay-passive = <0>; /* milliseconds */
> +               thermal-sensors = <&tboard_thermistor1>;
> +       };
> +
> +       Tboard2 {
> +               polling-delay = <1000>; /* milliseconds */
> +               polling-delay-passive = <0>; /* milliseconds */
> +               thermal-sensors = <&tboard_thermistor2>;
> +       };
> +};
> +
>  &u3phy {
>         status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 1ad0a1d55d53..f0719dbef249 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -673,7 +673,7 @@
>                         nvmem-cell-names = "calibration-data";
>                 };
>
> -               thermal-zones {
> +               thermal_zones: thermal-zones {
>                         cpu_thermal: cpu_thermal {
>                                 polling-delay-passive = <100>;
>                                 polling-delay = <500>;
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
