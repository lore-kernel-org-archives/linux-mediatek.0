Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99F4C433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 11:21:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 850326191F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 11:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 850326191F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ap/XYifbRcElt+OUS/Cs21ZDuDhdxlgHutcbIegeXfg=; b=gkmnluzQKP7vOPm53xgv5tCqf
	kIHX+eLXsOaTCZfS31ptpr7HG1J23WgnmsNjoTB289zYVS4YpNuCl3XS/lEMsiCepElXYzen2zYYk
	Kr8dGLJ9dmSQFeUf1OZVFLDeeKSXLWsvifpuU7YaqcWoizuNK4hdjJhFPSSu4/LGFZAl4wqmjv6hr
	IlVnjjQJ6YiG0EbwhkBTiL6cTPYw1DPs27xq3yfZCu1MYOUuY+8pk10v0g/Jr7AR75dLJ2DTrpr6G
	8DM+xfif31Zfq8YFhAn5gFVkL61liMYDAZwlRnskFqpXwkVMGl3eRB0Y2IkMwtB1MKNrUyYCBEMOe
	erne+V2vQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOIcF-00BQYD-4k; Mon, 22 Mar 2021 11:20:59 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOIbr-00BQVS-R3
 for linux-mediatek@lists.infradead.org; Mon, 22 Mar 2021 11:20:38 +0000
Received: by mail-io1-xd33.google.com with SMTP id x16so13463830iob.1
 for <linux-mediatek@lists.infradead.org>; Mon, 22 Mar 2021 04:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WLLgEIAtDhMTSlLjCARkd+VJiQyrR8iYWRkfviadf/g=;
 b=AbqpB8QwU4/7RB4f8fZepWBAaxQqLiKJjhB3ycqCCzkyq9EnbPksnDKUcrS6HfOF2C
 IrhRp1J48jiVA6DGtRTHD3UNITrkQ32d92aguVjWKzmHBVD8fffe9ndzSKT45hC3Vt+F
 DAupby+KLDTRgaOw8EnYRNkH6sWQALyACQANw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WLLgEIAtDhMTSlLjCARkd+VJiQyrR8iYWRkfviadf/g=;
 b=MrkSuWn8FVCXBr8zjl5JoJo/Ex4zup6klf9cdkziyOTIVxknCX71X3NFqOGTu+314E
 qO9P+p7o1fyjhLFqxFVNKZiMggxIrry7HAfk1hqQ+zUvNXxGpZ98xAWHbGpuXk2uR51H
 N4TPnsYrFjLbFIHrD7/pQU/RyF74HbLv0rP9FZoVf4Yo068Gs3CbtI8bs0Z7r4f/l/el
 evt6xtnkBuZi0GS7pKyoPAmadwCQXjzqn/bTwiLhdh9vUe3vHxu1PxL0f9iNzZzthpAw
 hM4NaE670BOILpqYfXY0aGhlNxrGbbJiRj/bn9lZ+ZxEtFON8aLMJ4wH1asO165HfYvj
 lhkA==
X-Gm-Message-State: AOAM5307tDTzFk44mTV44UiGDArqH6cFzRj082sLl6bZFNGZiNl4sAYs
 q/p8YJkX1ZpkKfJuD7TL/IHqhGVYzaHAvoyOoYTfKg==
X-Google-Smtp-Source: ABdhPJzUJ+JxnlyP/XApOqLy+Gt3yTqy+AekHvnYCXijerfjWVc0LzSdZZqcyLxOpFBc8xCRTu8kBAhdLf1Mjb4Hi0c=
X-Received: by 2002:a02:ccd9:: with SMTP id k25mr10591705jaq.43.1616412031652; 
 Mon, 22 Mar 2021 04:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210316070144.28440-1-michael.kao@mediatek.com>
 <20210316070144.28440-2-michael.kao@mediatek.com>
In-Reply-To: <20210316070144.28440-2-michael.kao@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 22 Mar 2021 19:20:05 +0800
Message-ID: <CAJMQK-gQxMmq-4+Hb2vuTmz9T7XOZPV3=uwTp-8doHRVD4y_Jg@mail.gmail.com>
Subject: Re: [v7,1/3] arm64: dts: mt8183: add thermal zone node
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
X-CRM114-CacheID: sfid-20210322_112036_184572_85225DEB 
X-CRM114-Status: GOOD (  18.04  )
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

On Tue, Mar 16, 2021 at 3:02 PM Michael Kao <michael.kao@mediatek.com> wrote:
>
> From: "michael.kao" <michael.kao@mediatek.com>
>
> Add thermal zone node to Mediatek MT8183 dts file.
>
> Evaluate the thermal zone every 500ms while not cooling
> and every 100ms when passive cooling is performed.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>

Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

Tested this patch on mt8183 devices.

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 85 ++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 5b782a4769e7..d3550af06408 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -657,6 +657,87 @@
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
> +                       interrupts = <0 76 IRQ_TYPE_LEVEL_LOW>;
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
>                 pwm0: pwm@1100e000 {
>                         compatible = "mediatek,mt8183-disp-pwm";
>                         reg = <0 0x1100e000 0 0x1000>;
> @@ -926,6 +1007,10 @@
>                         reg = <0 0x11f10000 0 0x1000>;
>                         #address-cells = <1>;
>                         #size-cells = <1>;
> +                       thermal_calibration: calib@180 {
> +                               reg = <0x180 0xc>;
> +                       };
> +
>                         mipi_tx_calibration: calib@190 {
>                                 reg = <0x190 0xc>;
>                         };
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
