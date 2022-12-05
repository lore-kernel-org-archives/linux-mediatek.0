Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967C6C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 13:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uc9R8Uf/pCe2qvKF4aFF/8KuZBFNDVNUUa6PyIFKSQ=; b=sLrz6K7Cd2bdyYgnFBspOIXWoX
	rzI3hbgVJ3sK82h0H8BmK9oWr67Vca6FF66vIy4kRn6u/ZZsSqw1JH1ie0WL6pIgZrT9ITfNK/vUU
	AdMD06VDotzeRN0e395FwKEFKyMWh34PDLZyG1iLT7pdy4V/1J4C10Hvqb+HYMYvn6suRPc9EyLUu
	s07mnFbdY98JjcPocnIEIMscD7YoQedU5ffhGjSDuqbjDVw9cFk74DG1wSSA36meGR1QhTAwWu2zI
	QpZCNjUgfjED292Mo1LDcNhTZxNkTNV18I6aSCLEi7wCztEbLvEY3dInw7uFDI0tbUGBDt6kAzhus
	lJrBWS5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Bu3-003hBN-TU; Mon, 05 Dec 2022 13:53:03 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2BtH-003ggC-0K
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 13:52:17 +0000
Received: by mail-wr1-x42f.google.com with SMTP id bs21so18695282wrb.4
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Dec 2022 05:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3uc9R8Uf/pCe2qvKF4aFF/8KuZBFNDVNUUa6PyIFKSQ=;
        b=RkjkX1iZ5R0Yaqz0WAQr37pobuFT+aJMIBmxyWhCn6lx6BNIMq1ZuMmZIi5eq7x44P
         fI58BD0j/5M2j/PhK/mv6zK5XSPQDLjr6cFSQp7/290ryoDIthzp7GH6pCqbcq33Czws
         tu72Agr5scZe48h6R/exhLO7qC5J7LJHAdfIpgHSs/TOAB91haaBQlcCdornhma56CwQ
         ycTatCKwkajBhUQxSrgwuayQvqRmJiKpekpHKYhpb1GxoDvybMyrHy6uIu+xb5lkoK2+
         FovoXA66R3UESptREd5ICtcrnTOQjuIuFFfqsAAV8nHpPZfoa2l91ZG/fM1sUtWdxAEz
         1lXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uc9R8Uf/pCe2qvKF4aFF/8KuZBFNDVNUUa6PyIFKSQ=;
        b=6vg3AEf3PrDNGrtj4QDqjuaICavUMWyXBhqaG5bi7l+N3UdPNFov8k133bxlTPvMmF
         zrs66Eph6UOXI6AZ1rucCnMxfMJAHCpSDf1q7vC2hSzp8WcCPwPUUd5eF3sbz/TpzJfd
         uOaEN1oblp2N4wvwTFvG/IzDHusBOVAuZxzBytctGuT70rqL2gSg1dKZo+mQygS01oYZ
         vtUwoLfYrnkP1MaNplg+pbdM3X3JprzmpnSwMg0ayg+M7/V+6KbgKR5qfn+qWmNvPK3M
         du+HgiNowdqVOkbOShJKSqQ2gcLEULYSN81KcVMF4uKn7L3p2GXae592AMnl2on2yvLU
         +SGg==
X-Gm-Message-State: ANoB5pmnD+VPf/x3PJCo59dfMfNoV2Yot0EEshlj81kex4Cw69kAh15P
	LkKh2Ck3WnoBgZpeAA5XSjsIQg==
X-Google-Smtp-Source: AA0mqf5FPRwt19PLh2T1fJ+ixYYqormZd+LI8rffdiI7G4LLSJQHjGxKOWRYJ5cKOJWEYhztpWv1xA==
X-Received: by 2002:adf:fec6:0:b0:242:4697:d828 with SMTP id q6-20020adffec6000000b002424697d828mr8422358wrs.494.1670248331460;
        Mon, 05 Dec 2022 05:52:11 -0800 (PST)
Received: from predatorhelios.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a3-20020adffac3000000b0024245e543absm9012700wrs.88.2022.12.05.05.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 05:52:11 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	krzysztof.kozlowski@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 3/3] ARM: dts: stm32: Remove the pins-are-numbered property
Date: Mon,  5 Dec 2022 14:51:58 +0100
Message-Id: <20221205135158.1842465-4-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205135158.1842465-1-bero@baylibre.com>
References: <20221205135158.1842465-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_055215_086080_8E3DC049 
X-CRM114-Status: UNSURE (   8.52  )
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

Remove the pins-are-numbered property from STM32 DeviceTrees

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 1 -
 arch/arm/boot/dts/stm32f7-pinctrl.dtsi | 1 -
 arch/arm/boot/dts/stm32h743.dtsi       | 1 -
 arch/arm/boot/dts/stm32mp131.dtsi      | 1 -
 arch/arm/boot/dts/stm32mp151.dtsi      | 2 --
 5 files changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
index 500bcc302d422..4523c63475e4c 100644
--- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
@@ -51,7 +51,6 @@ pinctrl: pinctrl@40020000 {
 			ranges = <0 0x40020000 0x3000>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&syscfg 0x8>;
-			pins-are-numbered;
 
 			gpioa: gpio@40020000 {
 				gpio-controller;
diff --git a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
index 8f37aefa73150..c8e6c52fb248e 100644
--- a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
@@ -15,7 +15,6 @@ pinctrl: pinctrl@40020000 {
 			ranges = <0 0x40020000 0x3000>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&syscfg 0x8>;
-			pins-are-numbered;
 
 			gpioa: gpio@40020000 {
 				gpio-controller;
diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
index 28e3deb20e1e1..f30796f7adf36 100644
--- a/arch/arm/boot/dts/stm32h743.dtsi
+++ b/arch/arm/boot/dts/stm32h743.dtsi
@@ -588,7 +588,6 @@ pinctrl: pinctrl@58020000 {
 			ranges = <0 0x58020000 0x3000>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&syscfg 0x8>;
-			pins-are-numbered;
 
 			gpioa: gpio@58020000 {
 				gpio-controller;
diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
index accc3824f7e98..6b86e031f60e6 100644
--- a/arch/arm/boot/dts/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/stm32mp131.dtsi
@@ -547,7 +547,6 @@ pinctrl: pinctrl@50002000 {
 			ranges = <0 0x50002000 0x8400>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
-			pins-are-numbered;
 
 			gpioa: gpio@50002000 {
 				gpio-controller;
diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 5491b6c4dec20..4e437d3f2ed66 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1660,7 +1660,6 @@ pinctrl: pinctrl@50002000 {
 			ranges = <0 0x50002000 0xa400>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
-			pins-are-numbered;
 
 			gpioa: gpio@50002000 {
 				gpio-controller;
@@ -1789,7 +1788,6 @@ pinctrl_z: pinctrl@54004000 {
 			#size-cells = <1>;
 			compatible = "st,stm32mp157-z-pinctrl";
 			ranges = <0 0x54004000 0x400>;
-			pins-are-numbered;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
 
-- 
2.38.1


