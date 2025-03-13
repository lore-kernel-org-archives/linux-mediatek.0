Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56AAC282EC
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Mar 2025 16:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HP3mNRFDa3oXlhU0cv5qzQmJ+uKrJehpMIxVwkO9Fc8=; b=ncvYUegzu8w8nOx0GWa/2q8b8W
	X3dfVPSFM1dX/s7Zw0dhVed2RPsf0OPUqB2AGVQ+7jAOYO0bvYejPu5EyfQFR/NygC5/+/0S4InHl
	H++4JS9OHRpzzl7f5sUk5FrkrOlzJpUsW6RePKEbFlF7Ds7s6KGxQmpzC9eJMGnntQJ5mzjZll9qm
	pEuz8tZoc0jfTY79wAHvDzy4F/DFuVtZU5NbxmDX1YI5x5eYEy5q2nrLwH1D5gbVFYS076we0RRNS
	rtfL9/EiRTwncmk2rp3S83SWyS1jR6xcE108tdDD1VcVgag4gX4pDRORVEUZyaTJ2BdnWG6B8GFn8
	i3cw7jxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tskzY-0000000BjWz-3SFV;
	Thu, 13 Mar 2025 16:01:04 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tskiC-0000000BhJg-1CQY
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Mar 2025 15:43:10 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7c08f9d0ef3so64043185a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Mar 2025 08:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741880586; x=1742485386; darn=lists.infradead.org;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HP3mNRFDa3oXlhU0cv5qzQmJ+uKrJehpMIxVwkO9Fc8=;
        b=KhnbsBVF1uvPYbFa+yS/MOVtrT5l/Pz+dnIKFPAEYZHwEzyyLlR6qps1ePEcxwgPgI
         2AtRDkZF8sx//eNK9EQxWHbZHsn9HUm86AUrtTbyzA2Z8obfeLy/iI6t96ceIcTYlpGu
         iOVUH037Inp7Mb0lr5KpURv3CLJuW0hFcAp1GjvUlQR64VhizoY21IZ+ZL+gG9jk8pmM
         riSw/4CxbGry1qYeyzMdjzRYDny50sVtLiB95LIzulzzBPIyt7tJQ0OTOmLCV45qg5mf
         y1rUG3q3p8eMk8e9hktkhq6YZwsHaDz/WIZy92OgzAIAvamOtKxW6/yu5K9e1gvWmT8t
         JZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741880586; x=1742485386;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HP3mNRFDa3oXlhU0cv5qzQmJ+uKrJehpMIxVwkO9Fc8=;
        b=dChNJT3BFAUizFr6S/lPA/wDyuyt6RF5QLY04OZWBnlnjk7dsmmL4xSOhXmXKxXrOx
         xQYWi2S8M14dAA8KGarRnGzA2hPjvfe49lYCnR6+NRKIzS0BGjvJw9dSINJkO3CZ9FoD
         BqGz1I63E4BdZS+PiIdIejMKsBsrSqWg5/j3g9zGSwVkxJof1tO2uXqWM2c3fKTUML0a
         lVR64N9AxI3UmWDgXARW2+dP+uTk3huvZi9IEwqXHRwtGmVzkUZXNA4Z/xOws2uU3QLa
         8fxIdheOwL5JVv19KIjozf+lajDHaIrb+RDkcJ/ZOfPq+OgyixPXEKn4pRyzIx47ihqg
         TaVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8zBBwQ4C0WcagdpPXugaInxMpBtDfdJ114GP44RidPgzxmIsMhpymBCYZ4IMKleG+vw9KvY8OKiMY31tJmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQCU0C9g8aC0KYUTiOpK1Z3vZKsyINwCjjRCzdjyr2g7nmZ2T4
	iyoj3MpUOENpynF0tz5i34/NxXCr+ktJJSgldpYUZJfXa2u4gseEPqsgM57XPxRnqUXg/cN0Wc3
	X
X-Gm-Gg: ASbGncueVbr+zKlacvrBnHMO7sePKH67sdx8PrM2MNexVzaHoHzi9Sjuh4YFazMDcfu
	44pcl9X0zxUBxdkClaOzkQnYuVDk2Ohgj2nOk2mtBNADfF4E/7rHNRGTx+UnCOf4aj5i8dss5ko
	8zsTQ2jAp8SRlxT8Ua4paR0hQOOHXfOLpnNKiq7H5nTqjJbrBpBMptxczBj5P52Jf73OxEjS2O0
	DcRFrGZt4FSVVN2miYCuIezaRO0ekQHd+07POAqGlDGQC/bIw60WbktRFQScWibYxIGgYFCYTZU
	7eQ5j5QJdIrx0KUPkcoi5KLi5U9G5AIBj4VmNA6JeAJDEAbFEhdtoCMB/H5gFyD/5HucCdYQPXD
	5xAwq0QE=
X-Google-Smtp-Source: AGHT+IG7DGBV7fS0OgNdV+jRDvbbHKYP9sJW8CMWzee0priMRP+NjaycF9KaDGtlbGEG0pwVFVd4tw==
X-Received: by 2002:a05:620a:6085:b0:7c5:4278:d151 with SMTP id af79cd13be357-7c579fb4c26mr20945085a.43.1741880586574;
        Thu, 13 Mar 2025 08:43:06 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c7854asm112540985a.38.2025.03.13.08.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 08:43:06 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:43:05 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>
cc: linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] dts: arm64: mediatek: mt8188: add more thermal trip points
Message-ID: <s2sp5o57-o534-qso0-2733-o0prs6028por@onlyvoer.pbz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_084308_524644_F7BF9F0B 
X-CRM114-Status: UNSURE (   7.09  )
X-CRM114-Notice: Please train this message.
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

Provide the "switch on" thermal trip point to be used by the power
allocator governor.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 338120930b..262eab8fd3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -472,6 +472,12 @@ cpu-little0-thermal {
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU0>;
 
 			trips {
+				cpu_little0_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_little0_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -510,6 +516,12 @@ cpu-little1-thermal {
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU1>;
 
 			trips {
+				cpu_little1_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_little1_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -548,6 +560,12 @@ cpu-little2-thermal {
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU2>;
 
 			trips {
+				cpu_little2_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_little2_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -586,6 +604,12 @@ cpu-little3-thermal {
 			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU3>;
 
 			trips {
+				cpu_little3_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_little3_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -624,6 +648,12 @@ cpu-big0-thermal {
 			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU0>;
 
 			trips {
+				cpu_big0_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_big0_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;
@@ -658,6 +688,12 @@ cpu-big1-thermal {
 			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU1>;
 
 			trips {
+				cpu_big1_switch_on: trip-switch-on {
+					temperature = <68000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				cpu_big1_alert0: trip-alert0 {
 					temperature = <85000>;
 					hysteresis = <2000>;

