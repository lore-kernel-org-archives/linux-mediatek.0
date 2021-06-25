Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 452C8C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 11:09:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3E0261458
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 11:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3E0261458
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxBYlL81GTTQm5i1xgB8yeLLsd7IoHDZ6NqSwY8+//Q=; b=T5q1GiUpQTVB1H
	aPDR8oGY5r5ug6IftSx9vys7KKiJywbErH5RTZMTvg2QCECgLbIkMSW3xP+T+vFySBPdKwLHyxqTs
	gYtSY4e9ypumAWkjvuyq5Il797vMqr83UofQy1HgxwqsE2RZyNaMlWrdzlhuqvdmo4+C0O0340rQm
	MrryrGvfkL2DUbeE2jwXvga1JaPZRR5og4Ih/32NqGuZnM2JvF56sUar0WQmcCJuo2vOdYliAKxSc
	T1cjwnxMk6llF4s27kGEPDIYwHroGz8myH7zdBGY4vGo1XCBfrOAqJLSdKLZ9XFiQjPu1Dah6lcHs
	wAJpcj0GPFWd1aPJlfig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwjhd-001E2h-8J; Fri, 25 Jun 2021 11:08:53 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwjcM-001BuI-8f; Fri, 25 Jun 2021 11:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1624618996;
 bh=g/1l77n9SRFOvqNNHUd97uMSJe2gTcM2ug+hsnbl3Gk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EMeCoMdPzNQZym6nwtrXDEQeWas1h+MMoYjDX6eep49P5tjRFBjTLvnxdU7gU66M+
 JXjIXJZuisw0H+Q+0R8bDU9AdSJblpjIMNJ+d5OAFWoHTn5XXx2YCaD1cCRGY3BGxX
 jlGsTxNWLvqMfFxg83E2Q06TyoQVj/hWBYjeyvxU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.157.219] ([217.61.157.219]) by web-mail.gmx.net
 (3c-app-gmx-bs66.server.lan [172.19.170.210]) (via HTTP); Fri, 25 Jun 2021
 13:03:16 +0200
MIME-Version: 1.0
Message-ID: <trinity-2eb7c0ac-d9dc-446c-8907-69b5f4df6838-1624618996538@3c-app-gmx-bs66>
From: Frank Wunderlich <frank-w@public-files.de>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Eric Woudstra <ericwouds@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Daniel Golle <daniel@makrotopia.org>
Subject: Aw: Re:  Re: [PATCH] Fix mt7622.dtsi thermal cpu
Date: Fri, 25 Jun 2021 13:03:16 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <8b27246b-721e-fa0e-5c2b-b1b4b4d6fdd3@linaro.org>
References: <20210619121927.32699-1-ericwouds@gmail.com>
 <e30a2d01-a200-80cb-88d9-6aea62dd49f1@linaro.org>
 <56fb5540-fb86-4e6a-a596-1276026b37e5@gmail.com>
 <a4e41929-6ab4-fabb-741e-f25a5fd14e3b@linaro.org>
 <47261865-00e3-41eb-bb36-2b939f81f1e8@gmail.com>
 <fb633034-96e5-6165-b43f-290ae1a65cfd@linaro.org>
 <189b52d5-b103-43e1-a64f-1e627fbc75af@gmail.com>
 <173e6bab-9d21-eb28-9b91-a5f80c01fd03@linaro.org>
 <3dd22cf2-1186-4870-aa49-e5cddc18c6e9@gmail.com>
 <trinity-7580d955-3187-41e5-9297-1ac8f628a9d5-1624609003739@3c-app-gmx-bs66>
 <8b27246b-721e-fa0e-5c2b-b1b4b4d6fdd3@linaro.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:0os7uhuK8TvkyvnXgZYkBKOUKqVXeknBjyVhU8kcofVYZisfTdOZDW21UW96lmFSKWJe3
 BB/hvXUJMiJizJhW1zn2Dl+fzi2CM+bBKg4Pt8OAXChs9W65IU3PA2FK4akf+z4jgP4quoY1Qkae
 gM35Jxb+STndPOC3BdW9tz3fMxfOHG0d2RlOHInF0eyZ8nLyOKkLGVqZiak/C06iKYR0L+Ubu6/t
 EXxyVbdVfi+jAvDGgGKvz+7HYpYdyfgPfX5+AXX16wIYD9IXADjmz7/8XuyjkZBhHTvGxmGLmuMl
 9U=
X-UI-Out-Filterresults: notjunk:1;V03:K0:9rdLbwbOXq0=:bT2NbFMJ3ks1ap4pjutQ9b
 gaQrK+8Jm7K3t1+Ep/+5qd16A8xx6FisDmJHZH+Pf1Bw/EKufuvej8ZOS1Y0P/DUlnPgs9f1I
 VoYyA46sUU/s5fP6UWBJeizpcKIXXtBts6G04Ngr0q3Sg8xsa5FX/gjS5o2FqsfwqEwxPhOi5
 vDgXN8OHQ2q8vWf0tSoki7tqRwEO4Hp+fzN9nEJz3EbuN+3pWVKyJ+0CUfkYpWaV9WhLr2Fq3
 +4APmI8rgavyJKWbnqf6QPc26KSwgT85uEqfyhN/bRH4TOs0mnN0TPsRnUnZ6SPGdP48tMbz8
 ki0Iy7nL90+rEZo7s210HCcPrDikZ+ATelOYJWE9e+HwBSYPt4XvFJ+PTwu64z7Nb3duGJxze
 ZA/j9W9kOP1WSVk83667UZd/vR1UzoNqnjQdkyxdEduidpvVj8EO3F7EANrF3hirSOsZHURHi
 15tn1Q/a8x3/rqghUlqcZShwlzXL3v86Hj7qhEkPHRcZvHatcFf/mgVXRMdDwha2+GxtYxW3C
 mgYrljdFDyzvuFt2ZE8Fpgo+bN5ngvkKHXbW+1kRsE+3yqBEGAe9O6x0oEZpOIPOq4JlrEHYX
 7JX3fVNIdqx39dKQkkulqWid4O/hzjmsangdCKzot23TGh8h8u8sscMLR1cTjgy8aWWjakUqh
 wZzY799FuWrZHejdwRzgze84Z6GFlr4198vlT8VXBP/3/Cd220qF8rR5VU/hIkp02c1eMqKUh
 hc4i4RdYqBV6ERFFgRnyBDZy4CBvYFki2Yi4A+9nTnXS/A29mQFgh26pZDV0WsUhm7Kh2HqSt
 hPm92VPi5tnDAmYZydAe3ud6wRYgiwRt4+RaLLbZxCBARe+was=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_040326_732127_118DBA17 
X-CRM114-Status: GOOD (  17.41  )
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

Hi

> Gesendet: Freitag, 25. Juni 2021 um 11:57 Uhr
> Von: "Daniel Lezcano" <daniel.lezcano@linaro.org>

> You should not add the fan in the mt7622.dtsi itself but in the board
> specific file where there is a fan output on it. mt7622.dtsi is supposed
> to be the SoC itself AFAICT.
>
> For instance:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/tree/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi#n39
>
> https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/tree/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi#n164

> > @@ -170,14 +177,12 @@
> >  			cooling-maps {
> >  				map0 {
> >  					trip = <&cpu_passive>;
> > -					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > -							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> > +					cooling-device = <&fan0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> >  				};
>
> fan == active trip point
>
> This is referring to the passive trip point. So it should point to the
> CPU as it is now. Note the order of mitigation is inverted regarding the
> proposal description.

but we need to disable the passive trip as cpu-trotteling starts there...the higher temperature trips are currently not reached

summary

moving fan and cpu_thermal-override to bananapi-r64.dts

passive-trip: cooling-device = <&cpu0/1 0 0> as in erics Patch
active trip: cooling-device = <&fan0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
the other 2 unchanged

but i suggest changing the temperature points in mt7622 dtsi as this is SoC specific

so basicly:

--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -143,13 +143,13 @@ cpu_thermal: cpu-thermal {

                        trips {
                                cpu_passive: cpu-passive {
-                                       temperature = <47000>;
+                                       temperature = <70000>;
                                        hysteresis = <2000>;
                                        type = "passive";
                                };

                                cpu_active: cpu-active {
-                                       temperature = <67000>;
+                                       temperature = <80000>;
                                        hysteresis = <2000>;
                                        type = "active";
                                };
@@ -170,8 +170,8 @@ cpu-crit {
                        cooling-maps {
                                map0 {
                                        trip = <&cpu_passive>;
-                                       cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-                                                        <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+                                       cooling-device = <&cpu0 0 0>,
+                                                        <&cpu1 0 0>;
                                };

                                map1 {
@@ -428,6 +428,7 @@ uart3: serial@11005000 {
        pwm: pwm@11006000 {
                compatible = "mediatek,mt7622-pwm";
                reg = <0 0x11006000 0 0x1000>;
+               #pwm-cells = <3>;
                interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_LOW>;
                clocks = <&topckgen CLK_TOP_PWM_SEL>,
                         <&pericfg CLK_PERI_PWM_PD>,

--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -37,6 +37,13 @@ cpu@1 {
                };
        };

+       fan0: pwm-fan {
+               compatible = "pwm-fan";
+               #cooling-cells = <2>;
+               pwms = <&pwm 2 10000 0>;
+               cooling-levels = <0 102 170 230>;
+       };
+
        gpio-keys {
                compatible = "gpio-keys";

@@ -582,6 +589,29 @@ &u3phy {
        status = "okay";
 };

+&cpu_thermal {
+       cooling-maps {
+               map1 {
+                       trip = <&cpu_active>;
+                       cooling-device = <&fan0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+               };
+       };
+};
+
 &uart0 {
        pinctrl-names = "default";
        pinctrl-0 = <&uart0_pins>;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
