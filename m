Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A0AC56201
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 08:21:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22E702073C
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 08:21:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xc1MEYiO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WgmWs9sl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22E702073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nLWcPStglPq4bvGQfQRo+JWUc6LCxzbw6pecjaxOpCc=; b=Xc1MEYiOx8sE41n3UKkK5rFJP
	bQkF2djvmMRqqeZ710XVmu9fCvHK340QyoXjMCOudJijPDrZL4g5DkVnrAgBRXFpEvYtpQm5kDBus
	kJT/QlQ9PP6V06BzjOMqaVSzsWTyChdzHT1BJOuayr10RXvjmKfWRVbAHVAhCIglS243IeuMAkjRk
	TIPQ0V/X4Wj05XzFplkZKSPSarAo6s8emsNtoltkizgd9MOv4+AHvAKJMomGjyf9u5EE9969GxH26
	+OsLyuMyXhRCr2LAdn0YJBAZp7u36AzLtQcKQ/ZbRPl1o/96qwHlU3JMDRILqrDbJ2yXFLF+PHQm9
	b1bbXO6RQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khTZT-000267-4A; Tue, 24 Nov 2020 08:21:07 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khTZN-000247-8F
 for linux-mediatek@lists.infradead.org; Tue, 24 Nov 2020 08:21:03 +0000
Received: by mail-io1-xd43.google.com with SMTP id u21so21013863iol.12
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Nov 2020 00:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X/x0LTb4J+x0tLkU4UfWhgC2IEt8b2Ne7z/1P9Z0zjA=;
 b=WgmWs9slVGpefYI3u0JHnro604o3Rsq37SkQhMRrVMYlX/I0yTj+7o3zmxiXFzt/tf
 bhnMMfKan6dMtMuDpoPKwLz+aQ/FMx/7F1N/6iAKe7b/qxjzVUSItHnJlVrjmryJ7Jax
 zBBhZWT4nMXkonUV58hrO/c24uCLaMdPZheAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X/x0LTb4J+x0tLkU4UfWhgC2IEt8b2Ne7z/1P9Z0zjA=;
 b=MnyqzZVI0Q/9ItodLDL5+hoEhN4cuxecp0qfVnyBgezCJ0myLE1jFz3SsWF+lxXJZj
 vLYXO7Z6KNVAilVV9IZLU5YZDxw7ukfqsCW8KaWm8ShI7tUsgdQBaIBqTpCKTKPhbGY4
 7gSYcmXAZbBI5uqq9BxUkOv7d3MHfq8ZoZz9XQiE2gBKVLXgL3gqcERmfuNkREo/VvPR
 ezeD7cxV9uXdoP+MQE41VKCEEVBGgFNSZeAcXkwtglIj3imS7w9HtzjQJT9LwBhjDc1c
 N2I4wo7JOQzoG/Co44V2MVRHyRVX8NFjs9IONHm9bMLB9UWnBW/w+a+jJR/jFWoLXVps
 hymA==
X-Gm-Message-State: AOAM532aeCK1v9dhAjbX4xCDAzhVfGZTs319AeMO9yC33RXwmAqRjGys
 MrHWiQHqiYHzXOO+18ELcX+JtmdTrM9MCZxltck3Mg==
X-Google-Smtp-Source: ABdhPJwDD+cQREmdCGOOrIMuL9X8U9Zd3cwX9xY7MHPd1cZdR0F/0sSKV86O9Bh13f2qdJctm1O4CME4HC/nfxZd+EI=
X-Received: by 2002:a05:6638:3f1:: with SMTP id
 s17mr3341338jaq.102.1606206059023; 
 Tue, 24 Nov 2020 00:20:59 -0800 (PST)
MIME-Version: 1.0
References: <20201013102358.22588-1-michael.kao@mediatek.com>
 <20201013102358.22588-2-michael.kao@mediatek.com>
In-Reply-To: <20201013102358.22588-2-michael.kao@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 24 Nov 2020 16:20:33 +0800
Message-ID: <CAJMQK-hCDH_-JZG6uBrTmbCf-HG0J4GxGj2kyeh5sgjJs5Et1g@mail.gmail.com>
Subject: Re: [v5 1/3] arm64: dts: mt8183: add thermal zone node
To: Michael Kao <michael.kao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_032101_339823_462BAB1D 
X-CRM114-Status: GOOD (  17.41  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, srv_heupstream@mediatek.com,
 Linux PM <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>, Eduardo Valentin <edubezval@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Kaehlcke <mka@chromium.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 13, 2020 at 6:24 PM Michael Kao <michael.kao@mediatek.com> wrote:
>
> From: "Michael.Kao" <michael.kao@mediatek.com>
>
> Add thermal zone node to Mediatek MT8183 dts file.
>
> Evaluate the thermal zone every 500ms while not cooling
> and every 100ms when passive cooling is performed.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 84 ++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 8fed72bb35d7..1cd093cf33f3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -430,6 +430,86 @@
>                         status = "disabled";
>                 };
>
> +               thermal: thermal@1100b000 {
> +                       #thermal-sensor-cells = <1>;
> +                       compatible = "mediatek,mt8183-thermal";
> +                       reg = <0 0x1100b000 0 0x1000>;
> +                       clocks = <&infracfg CLK_INFRA_THERM>,
> +                                <&infracfg CLK_INFRA_AUXADC>;
> +                       clock-names = "therm", "auxadc";
> +                       resets = <&infracfg  MT8183_INFRACFG_AO_THERM_SW_RST>;

According to binding document[1], interrupts is required.
interrupts = <0 76 IRQ_TYPE_LEVEL_LOW>;

[1] https://elixir.bootlin.com/linux/v5.10-rc3/source/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt#L18

> +                       mediatek,auxadc = <&auxadc>;
> +                       mediatek,apmixedsys = <&apmixedsys>;
> +                       nvmem-cells = <&thermal_calibration>;
> +                       nvmem-cell-names = "calibration-data";
> +               };
> +
> +               thermal-zones {
> +                       cpu_thermal: cpu_thermal {
> +                               polling-delay-passive = <100>;
> +                               polling-delay = <500>;
> +                               thermal-sensors = <&thermal 0>;
> +                               sustainable-power = <5000>;
> +                       };
> +
> +                       /* The tzts1 ~ tzts6 don't need to polling */
> +                       /* The tzts1 ~ tzts6 don't need to thermal throttle */
> +
> +                       tzts1: tzts1 {
> +                               polling-delay-passive = <0>;
> +                               polling-delay = <0>;
> +                               thermal-sensors = <&thermal 1>;
> +                               sustainable-power = <5000>;
> +                               trips {};
> +                               cooling-maps {};
> +                       };
> +
> +                       tzts2: tzts2 {
> +                               polling-delay-passive = <0>;
> +                               polling-delay = <0>;
> +                               thermal-sensors = <&thermal 2>;
> +                               sustainable-power = <5000>;
> +                               trips {};
> +                               cooling-maps {};
> +                       };
> +
> +                       tzts3: tzts3 {
> +                               polling-delay-passive = <0>;
> +                               polling-delay = <0>;
> +                               thermal-sensors = <&thermal 3>;
> +                               sustainable-power = <5000>;
> +                               trips {};
> +                               cooling-maps {};
> +                       };
> +
> +                       tzts4: tzts4 {
> +                               polling-delay-passive = <0>;
> +                               polling-delay = <0>;
> +                               thermal-sensors = <&thermal 4>;
> +                               sustainable-power = <5000>;
> +                               trips {};
> +                               cooling-maps {};
> +                       };
> +
> +                       tzts5: tzts5 {
> +                               polling-delay-passive = <0>;
> +                               polling-delay = <0>;
> +                               thermal-sensors = <&thermal 5>;
> +                               sustainable-power = <5000>;
> +                               trips {};
> +                               cooling-maps {};
> +                       };
> +
> +                       tztsABB: tztsABB {
> +                               polling-delay-passive = <0>;
> +                               polling-delay = <0>;
> +                               thermal-sensors = <&thermal 6>;
> +                               sustainable-power = <5000>;
> +                               trips {};
> +                               cooling-maps {};
> +                       };
> +               };
> +
>                 i2c3: i2c@1100f000 {
>                         compatible = "mediatek,mt8183-i2c";
>                         reg = <0 0x1100f000 0 0x1000>,
> @@ -675,6 +755,10 @@
>                         compatible = "mediatek,mt8183-efuse",
>                                      "mediatek,efuse";
>                         reg = <0 0x11f10000 0 0x1000>;
> +
> +                       thermal_calibration: calib@180 {
> +                               reg = <0x180 0xc>;
> +                       };
>                 };
>
>                 u3phy: usb-phy@11f40000 {
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
