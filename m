Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5BBC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 06:27:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67F7064F5D
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 06:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67F7064F5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EbT4Pn8zAbmsuS4GgPzub/B9NQo9gG6qsZrbegFu7xg=; b=KCim4SiKot8ET3qjt5Q03ilOW
	ThQ81MCuYUtzQ5bsDD10Cqv1kRKzwM/48o5w4dPElt++LXBuDD5WfiQcytgwraG//mdq/Gv/2LAUQ
	N0dJT3KoSGlKkp92Nf3nvXvgzClgvskFGh3Caid5LODkS5zW0kuBh50pnceUVAxh60IFX2ynu/Ysa
	8V7DWkBAu/BwAjh63mHnt5LoHtf1pmguWVpm8CHg4Z1DSmdVJzqzAvRs/3HBj+4r4gmu/zkfofdxk
	hwzeRPZL6FGcb/joEtAJTgcBaMuUps+ecD2dcn9UA6k2Nx34YEWcWUUeTAKLe1Wl6ibakXzwr6c7U
	A2pn4OPjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Bdc-0001SZ-4t; Wed, 03 Feb 2021 06:27:40 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7BdY-0001Rm-Td
 for linux-mediatek@lists.infradead.org; Wed, 03 Feb 2021 06:27:37 +0000
Received: by mail-il1-x12d.google.com with SMTP id q9so21425021ilo.1
 for <linux-mediatek@lists.infradead.org>; Tue, 02 Feb 2021 22:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X5H7u6zfULjhTslVinp72inAV8tftlmzyLj44kPZOIo=;
 b=ATr9kJuhoM7hsEPMLnjZO+qm6UV1LVj8rzqxjUU8jx4jPJAuLYrR7/ZJvq/6fqdSZQ
 YKZmkGo8OmonC93l2P0UjhAlLyQpvI2y4QXQZzaehVss6Kyw5UiKDYw4hb2oGnyYq+ja
 E5b+ocFQF8WGclyVsu0U5ahnR/jWsjkBBHlbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X5H7u6zfULjhTslVinp72inAV8tftlmzyLj44kPZOIo=;
 b=O9Sl6LyISCyUy+4Sf+J4R2qFpk12jBZr9m6+k3hyzRWIJuwicjh15+ZuxHSXcELX1w
 lB+pPNPlPf2+kv/w9rGCmWqssWGzH6M0qRSbifemJ40fI+9PFmnfxBl6qL0utZCuqGZq
 0hnCvQ5P7JjCumwAEhAeGmt5t5k+fdsJm+DwdNMtgpxxHRQ8dmTIaNFswIS09jYW7K6H
 PaJAhwp3iLaaloz0MAT/jnzN4K4ag5bLqxpGt1jbeifElVGOH29KcOcPMBsmDahoSFff
 7/56dSHkFpBQ3efGNeDLWlwYu/z+Ev2ZofAHSX0fGHdRgqZBjjYg5ocq6P+wPVdoIX9a
 J08A==
X-Gm-Message-State: AOAM53249FLrpqRmrJp0NL/zQp8OeqipUuy6QfjKmrYwghL+SPyfrNj9
 gnNH/qxXvzgJXtmnZ8kuyeVrZKd0eQ2GXVDPPnm+lQ==
X-Google-Smtp-Source: ABdhPJxejwYn2puVey+RwiCn1hqYG5601tBESzbm/PelZLqN5flyaRACJ3sbmOAAzVTl66bgVRKcsUxC399ATAVUfXY=
X-Received: by 2002:a92:cc4d:: with SMTP id t13mr370408ilq.150.1612333654249; 
 Tue, 02 Feb 2021 22:27:34 -0800 (PST)
MIME-Version: 1.0
References: <20210129101012.25180-1-michael.kao@mediatek.com>
 <20210129101012.25180-2-michael.kao@mediatek.com>
In-Reply-To: <20210129101012.25180-2-michael.kao@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 3 Feb 2021 14:27:08 +0800
Message-ID: <CAJMQK-iYYGQ3N08PnkDzwSOc22ydEeekp_e1bXrm9Eas9xJQrA@mail.gmail.com>
Subject: Re: [v6,1/3] arm64: dts: mt8183: add thermal zone node
To: Michael Kao <michael.kao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_012736_972138_787D3BDE 
X-CRM114-Status: GOOD (  16.92  )
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
 fan.chen@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 29, 2021 at 6:10 PM Michael Kao <michael.kao@mediatek.com> wrote:
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
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 84 ++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 5b782a4769e7..0aa31d338fb0 100644
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
> @@ -926,6 +1007,9 @@
>                         reg = <0 0x11f10000 0 0x1000>;
>                         #address-cells = <1>;
>                         #size-cells = <1>;
> +                       thermal_calibration: calib@180 {
> +                               reg = <0x180 0xc>;
> +
missing };

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
