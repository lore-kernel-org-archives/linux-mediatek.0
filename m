Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059ACC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 12:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eN8MG6ika8snV5HX2h3jGNlhWTpwjCCkwNZHa6OiU+4=; b=KZ8g17aolOioWf
	8f86+uyw+/tE8eOrUhehukKYPELmetUwF+ApmQ8TLOI7Kfxr4vbpi8xaMRf9WWdSPojdtlJmXk/U2
	o/KsNhqsbeXnlDnSPdYuFJNeOCPRpbInp1KSqxWkV+5leWC/+9M4LIu4O57NkndqwlAWSrJ9e1uNC
	8pp4DECaJW0aYYhx4DdH80rPfDBf1UTB4fN3maLAAVXUUer6e6pMPYBSpnTcDyufkQJImEcIXHkgK
	4dJYP7ksJCv1myrpuF8cFEgTPVDyHHPLUZXfxP3GR0WTaYnxpydgjbrfWaTw0/F9K4TJZqQ2tYsi5
	zoqjDX6Zy1Jm54/yjqkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYo2T-008Tan-8G; Mon, 28 Mar 2022 12:00:01 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYo2A-008TUX-NZ; Mon, 28 Mar 2022 11:59:44 +0000
Received: by mail-ej1-x630.google.com with SMTP id qa43so28113096ejc.12;
 Mon, 28 Mar 2022 04:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ze/m2vpSHnRCFApl36JFy8UvWyMkN8Q8xJDfS9/vOsQ=;
 b=NVOXoLAv+phJR/OXqllZcD5b1Fb56JYg3bpa9CyubfWoBO1WHvjfTDV45sk6lAT8Fy
 7t009RHWxiiHqBKnz/OeQuqQmXSCOcVYaXqLTiGiASfhycyiNyEFoUiPQZUsxarV74gK
 EhdNs8Ll/Sv/A7aqkcPJrL1WXaa/SyK4WORC78JxBpCteMPOv8tFjbmuBOhaI2hiioYQ
 zlTctUJcXcIcVntfbCHEOJXr8PjiDoUyFKlkig+4SFg2C13BlGNwT+QPFNe1swUJVUQi
 ECSzsfOHlRzKZo6tPYChgj4YND8eh2r+yggI6cBl6P8sqPujf7WDxjSttAM5bNwcqPqT
 xGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ze/m2vpSHnRCFApl36JFy8UvWyMkN8Q8xJDfS9/vOsQ=;
 b=p1Y3upcuPcwyfrJZJtLyn6WYl48c9OiPbuzlvITtM7yzNeNLH9Z8UJsogm1m/NZARZ
 tl7ZDwSsFILGZdd7cnJfBf0FTpD0xjYfbJnh8mMI8n82lZ86TRbhgczYK9QfCNAwWhRl
 55Klz2Aa7P4xvdAMdM5warFtHXLOEn8UgW7/INI9EfpKsVlPvTlEPSYKKPIBEYyiJUFN
 CcjpPshEMFYtsgQtODxDn9TTMLJT5wNYYjbsO7sZaZSS3RO3Ohq7s74YuhN9WixV05a/
 X0DDjZ2W7HhfnhMhNlOqWvMpAVwjKDSsQG31vEWnhefVxv8F2Y7wQTcsGuOOjNCeSQfu
 SwHw==
X-Gm-Message-State: AOAM533e1K7334Wed+k9b/wwUF6/nPGcahhOdYoyN1+pgkPeZX2lxx11
 s9u62E7AWUwbrQWA3JzEjeEXPS99yuA=
X-Google-Smtp-Source: ABdhPJyPqxtkyOhDlzlQWoqBpr2/PWiXxO8oiWRGFKkhtuHhlxy5u1G+w790Mbqi41xojqATEHav1w==
X-Received: by 2002:a17:907:2162:b0:6df:ec76:af98 with SMTP id
 rl2-20020a170907216200b006dfec76af98mr17316920ejb.314.1648468781204; 
 Mon, 28 Mar 2022 04:59:41 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-42-69-170.ip85.fastwebnet.it.
 [93.42.69.170]) by smtp.gmail.com with ESMTPSA id
 j9-20020a170906534900b006df9b29eaf1sm5867876ejo.8.2022.03.28.04.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 04:59:40 -0700 (PDT)
Date: Mon, 28 Mar 2022 13:59:40 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-tegra@vger.kernel.org, linux-oxnas@groups.io,
 linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 1/1] ARM/arm64: categorize dts in arm
 dir and fix dependency in arm64
Message-ID: <YkGjLPN7tjVeckEO@Ansuel-xps.localdomain>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <20220328000915.15041-2-ansuelsmth@gmail.com>
 <fef4e5dd-d843-ea37-7701-bcfac9d1c9b5@foss.st.com>
 <238c6d7b-a61c-d09e-9377-8f49dad40eeb@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <238c6d7b-a61c-d09e-9377-8f49dad40eeb@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_045942_806276_95A43AFC 
X-CRM114-Status: GOOD (  14.55  )
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

On Mon, Mar 28, 2022 at 11:20:00AM +0200, Patrice CHOTARD wrote:
> 
> 
> On 3/28/22 11:09, Patrice CHOTARD wrote:
> > Hi Ansuel
> > 
> > On 3/28/22 02:09, Ansuel Smith wrote:
> >> - Categorize every dts in arm directory in subdirectory
> >> - Fix Makefile to address for the arm subdirectory
> >> - Fix any arm64 dependency
> >>
> >> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > 
> >>  create mode 100644 arch/arm/boot/dts/st/Makefile
> >>  rename arch/arm/boot/dts/{ => st}/spear1310-evb.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear1310.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear1340-evb.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear1340.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear13xx.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear300-evb.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear300.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear310-evb.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear310.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear320-evb.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear320-hmi.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear320.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear320s.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear3xx.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear600-evb.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st}/spear600.dtsi (100%)
> > 
> > 
> > All SPEAr device tree should go into stm sub-directory, as this platform is a STMicroelectronics one
> > as STi or STM32.
> 
> Just got an internal discussion, all STMicroelectronics platform should go into "st" sub-directory, and not in "stm" as indicated in my previous e-mail. ;-)
> 
> Patrice
>

Noted will do the change. If you notice other wrong categorization, feel
free to write a big list so I can fix them. In short merge stm in the st
directory. (arch_sti and arch_stm32)
Aside from that they are all correct right?

> > 
> > Thanks
> > 
> > Patrice
> > 
> >>  create mode 100644 arch/arm/boot/dts/st_ericsson/Makefile
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ab8500.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ab8505.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-db8500.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-db8520.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-db9500.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-dbx5x0-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-dbx5x0.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-ab8500.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-family-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-stuib.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-tvk1281618-r2.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href-tvk1281618-r3.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-href520-tvk.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefprev60-stuib.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefprev60-tvk.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefprev60.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefv60plus-stuib.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefv60plus-tvk.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-hrefv60plus.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-nomadik-nhk15.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-nomadik-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-nomadik-s8815.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-nomadik-stn8815.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-snowball.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-codina.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-gavini.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-golden.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-janice.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-kyle.dts (100%)
> >>  rename arch/arm/boot/dts/{ => st_ericsson}/ste-ux500-samsung-skomer.dts (100%)
> >>  create mode 100644 arch/arm/boot/dts/stm/Makefile
> >>  create mode 120000 arch/arm/boot/dts/stm/armv7-m.dtsi
> >>  rename arch/arm/boot/dts/{ => stm}/st-pincfg.h (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih407-b2120.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih407-clock.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih407-family.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih407-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih407.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih410-b2120.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih410-b2260.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih410-clock.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih410-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih410.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih418-b2199.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih418-b2264.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih418-clock.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stih418.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stihxxx-b2120.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32429i-eval.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32746g-eval.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f4-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f429-disco.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f429-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f429.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f469-disco.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f469-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f469.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f7-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f746-disco.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f746-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f746.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f769-disco.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32f769-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32h7-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32h743.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32h743i-disco.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32h743i-eval.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32h750.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32h750i-art-pi.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp13-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp131.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp133.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp135.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp135f-dk.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp13xc.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp13xf.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp151.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp153.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp153c-dhcom-drc02.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-avenger96.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-dhcor-avenger96.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-dk1.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-icore-stm32mp1-ctouch2-of10.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-icore-stm32mp1-ctouch2.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-icore-stm32mp1-edimm2.2.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-icore-stm32mp1.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-iot-box.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-microgea-stm32mp1-microdev2.0.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-microgea-stm32mp1.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-stinger96.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157a-stinger96.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-dhcom-pdk2.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-dhcom-picoitx.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-dk2.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-ed1.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-emsbc-argon.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-emstamp-argon.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-ev1.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-lxa-mc1.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-odyssey-som.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp157c-odyssey.dts (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xc.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcom-drc02.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcom-pdk2.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcom-picoitx.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcom-som.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcor-avenger96.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcor-io1v8.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dhcor-som.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-dkx.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xx-osd32.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xxaa-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xxab-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xxac-pinctrl.dtsi (100%)
> >>  rename arch/arm/boot/dts/{ => stm}/stm32mp15xxad-pinctrl.dtsi (100%)

-- 
	Ansuel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
