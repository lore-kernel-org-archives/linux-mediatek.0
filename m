Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C41CCD4851
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 06:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w02SH6PIRFOFu6YnjfK7owcWnXxBUkNw8szwIzUQj54=; b=nuEdQWYPS+FPCJ1XvW7JcLIhFu
	4kGnbgSMBG/USF9wZeVlWfaTUteIhoHrZOYQsiQyRVeicjgJiEQAC6+uyfEP43ia+ACzLPOQmKTul
	yaWjraQtRRFJS0zW515kaiQahIOv6w2EDuWh8QYeJ27rfXHIi0Ew0OD//9I0Fe9vnq6EtM9bNUlPs
	bz+x8uVoVmlgMamcUCvyM91ubaCE2XkSwDdk/UAoieQNP3NS8EV126rwiELY9MRwJVk1owuw/ioHO
	ajiWaZSWsSwl0lObcMgHZilpnDxUnN+pUHrvx8IyuDSTAYBH4RUcgTX6NyfuD4F38pHTAZLFXP1BK
	qpVCDlBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPoj-00000004kCA-3pQ2;
	Thu, 14 May 2026 06:45:09 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPog-00000004kB4-0ee2
	for linux-mediatek@lists.infradead.org;
	Thu, 14 May 2026 06:45:07 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2c156c4a9efso10495795eec.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2026 23:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pcc-me-uk.20251104.gappssmtp.com; s=20251104; t=1778741105; x=1779345905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w02SH6PIRFOFu6YnjfK7owcWnXxBUkNw8szwIzUQj54=;
        b=a7Z9/U+92OadBnT3XYA1t1n/S1ulG1bCuFdj4jIwJJ2udgTJ80VwYPu7gHumYcFeyF
         qwF1HJI+EfCPokCWZZ97Kp+JzhDiisOdE663q0JfcmcBpvvl8hHuby7f8A1H0M54mVp8
         syAxux9DR9Cyj2uiBBta0OpspIjip05fFIGhHxE5JPA0IQhV7/qz8LPk6v0GccSzOG/2
         Vy/qKK+XKdiYwSIli4K2zoGIGgBKaLRlzipQ34e3fWRs1+Whxts9s0ENz5Wuaa68saDB
         t6v7VA8DlOtPGCn3Dc7zEmZLa2fPyc7Ecrua2u9F0reodf+mEh0yIPhVBjGrZcvMSHH2
         wFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778741105; x=1779345905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w02SH6PIRFOFu6YnjfK7owcWnXxBUkNw8szwIzUQj54=;
        b=jBHcHD2vwFEbM3WnVNZAw/sVR4Pc6NvB2R5TYl0ZkjJ0Paoker5napekC1PHyFmUrc
         palosV8F+iHHnSi14kVVTdPCVekVre6nBg8fLcrahBD4D9XULc3Yc+ZZtBALJEDSHVrW
         /Vc210MDHd8Nswy5mC9i4cuUoHSl1sV9jcPfpFTEiyOPNE/MY5CA+NhMwwyZdg9G1HpQ
         LYb67MP6gDANXXOfUWQVw4XpnZzUBcRqMn9+S2RAUvbcF5KpjnNaEoL//3HTgcdE+lQr
         +osg+tG7VIJPoSSi0MHrQaO2stCBW1HcNCSIXQXLMqGJB4vAZhDDMonLCLkFCfhmo57B
         7qrw==
X-Forwarded-Encrypted: i=1; AFNElJ/IMmYXNmuJMUqYd8NUJn+2CsrZuZLqf+JU6rZzI6ZP1sHRtk0T1Psk/qAV7n60IcfEkZnothZEo9aGTkEIwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvgQfiA/Ul57DzCW4KRwXTM7cMs8xDewJws8hctmCoLbu7RoTB
	2Kepdw9aBnsrDdTgmkYLzev2NRB+bI7F72iJh28FNtZ95MT3tQELJ+wS0WLUp55+EPo=
X-Gm-Gg: Acq92OGpkWnZHXDs4GAg658OfvDCEhekc9pwyznTSWfk9nYhrGGthnwSxC0RzgqfR0U
	QQlFuhu4NgEiCQCu7pVslOFs1q2/rqTs+BV+liB9GWLGDiT2MmC3M1e5WoS14PZK4izpX6QmnK6
	tdJgjnMOrHKYa8Elt1/OBEFVahwIWsaVF+KSqELdwdF0fLBrvK7jEyUEGYfBhOUSfP+HN3RARW0
	9B7N0F/m5XeSKm3X4/iBp5L8t0GW5n49rOHych7nBfhVzBW3U5hQwKPKKk7Yn0KIZL0dA6vFB23
	ovJj3thXzRv0Y+AGDezxme2RPS2k9wqqmw9CJDTi3PKX5zWlZnGZUaIalm3OV4TIJ7yA7Jufoym
	WiZH5y+W9CxCGGdJ2WdEGpBW0KK8sx948dho6beVKgzUjiqUJEATGkVfU38F+glNAKjr5wCmQJR
	ZQczv8A/Rta452+aBlQjGo4p0pzZ7dQozyzgnLN05a2RGKF4AZOPHBCXc=
X-Received: by 2002:a05:7301:3d0f:b0:2e6:ffa8:ef85 with SMTP id 5a478bee46e88-301512632c6mr3381953eec.0.1778741104665;
        Wed, 13 May 2026 23:45:04 -0700 (PDT)
Received: from localhost (c-67-180-161-137.hsd1.ca.comcast.net. [67.180.161.137])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-302973bc8ddsm1807663eec.21.2026.05.13.23.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 23:45:03 -0700 (PDT)
From: Peter Collingbourne <peter@pcc.me.uk>
To: Sjoerd Simons <sjoerd@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Peter Collingbourne <peter@pcc.me.uk>
Subject: [PATCH v2] arm64: dts: mediatek: mt7981b: Add PMU
Date: Wed, 13 May 2026 23:44:45 -0700
Message-ID: <20260514064445.83487-1-peter@pcc.me.uk>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_234506_423496_5CDCEAB0 
X-CRM114-Status: UNSURE (   9.22  )
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

The interrupt number was taken from a downstream DTS of the similar MT7987
[1] and verified on my OpenWrt One.

Signed-off-by: Peter Collingbourne <peter@pcc.me.uk>
Link: [1] https://github.com/openwrt/openwrt/blob/e4b3d5c799aef3be20b7f6079e8e5a14b215c116/target/linux/mediatek/dts/mt7987.dtsi#L246
---
v2:
* Remove interrupt-parent

 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 1bbe219380f9..ba6720031908 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -38,6 +38,11 @@ oscillator-40m {
 		#clock-cells = <0>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
-- 
2.54.0


