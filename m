Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02610C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 13:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ycq2qGbCq4gp4GdyosDM5PwOaYdMKUbIrOS4iJYcEhw=; b=MFupneQ1X8zYF4/UEL+8UJog/K
	b8YCXxmiHr4ifKlI7w5Yahj7KGFz692J7zb3SHJr7ZD4X3RdtR9bjigaLrT2+VgFQpnnUGJilh8WJ
	fVyFmq//lUKStS13DKrGNVVA9SBjk0L157zbaYXUDWs7icAXkS2b6UabJzgg7ehr608R2X4e3RfHl
	vTI/2sYd+uc4RiTiknWzwmlal+7g5Gc7+Ya4FzjX9Fl00d7FAvPlUjFc+mJLJMCBp8arCgaH6Gqcp
	EYf68Dx14N2nr3nUiJahyiWymfEdw9wViLOIXbuJmvFgQWdhodLSjjDmumoskvpGLaqbLPG7n5GOw
	qLkd2c4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXFK-000Kwl-Ob; Tue, 07 Mar 2023 13:20:50 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXCi-000JkK-3A
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:18:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so10369717wmb.5
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678195087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ycq2qGbCq4gp4GdyosDM5PwOaYdMKUbIrOS4iJYcEhw=;
        b=8Jkb79b7aDSyuotEgPJjp135oUosSHOKbLHzo3J2KIM0/vq7OaTSsnGwFGmdB1lBWg
         96Rha7CK2u9XCuzB48T80eYawBUpEOzKabab32PA2ICiNNfKgn7cpoKYb7Wwv3HDcy8N
         tSApnVe+sKrPLxyFIFme8mOQ/kjPhl1tFOTsG9AZepWbpKh2KU9Vu8i0K+AQSXGyhg4U
         xV5jXN17UZo9vR+wzzsvYVYpYTd+wEuQsvCSWcL9o6b29wvZtoDsb0qyfuscrrWTH6e2
         3WGMB43hbKIS5HWyn7jawti1+uvq8GoTUEoPf52OpJkmUMunw/phUbHg/f2ZQJLrzwP2
         6nXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ycq2qGbCq4gp4GdyosDM5PwOaYdMKUbIrOS4iJYcEhw=;
        b=kH+LC/+KaSTbKDNmjdUqKHfU9QxzJ4OBjDNPGtE/qaFfCZsvXNpZPURThGqJwnbQza
         LeKXyY/lePcs5bmau/DN26a4i7UcMVHDci4UFIY6BEfgAcha4bsQjimB9AartYK1+6yG
         IphTM7vAtkZfWhLb2TU72jKvCK1uQXE+aQdMFq56awMA47snXN7XK3F9WPgZONIzwQZR
         BadtC1LEYfSG3BV7fPTcw2mTjqoVCnWwAZ5ITWTZ3SmJUkByzgaBT2eEFdlqZLHZAk7T
         nzMOiNaTI367+mWXO5hSQTesuWXVYVMyc8N/oDsNwMvwr70KQZk+g7alVgVggN3dxvi3
         u0vA==
X-Gm-Message-State: AO0yUKWoHTsEBj+ctfOpMkfEZtqcOJbJsKssszhPFopbuqmsZrPEjhhU
	Ym4fpVcuezzg/ZSxuhkN/xt+AA==
X-Google-Smtp-Source: AK7set97FITZPS/X2hztd/2R8Db8MrT5BSdLvVQYgQ+svhIM8ACEGKh9V4Wj/Kvhu7sSeA4A9EmyVA==
X-Received: by 2002:a05:600c:3594:b0:3eb:395b:19dc with SMTP id p20-20020a05600c359400b003eb395b19dcmr12777994wmq.9.1678195086727;
        Tue, 07 Mar 2023 05:18:06 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm12986242wmb.33.2023.03.07.05.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:18:06 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:17:36 +0100
Subject: [PATCH v2 07/18] arm64: dts: mediatek: add pwrap support to mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230203-evk-board-support-v2-7-6ec7cdb10ccf@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bernhard Rosenkränzer <bero@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, devicetree@vger.kernel.org,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Iy+JlpwcXpubs6mhkIYZfkpEPtOcPV81mErEUunc5QE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzmEie2UpC2lAo8W0pOZ+7mFt1tZMgQscEEj9Q08
 FCkXVFeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAc5hAAKCRArRkmdfjHURRRVEA
 C1mqBHlIObMMnm+SsFPk3+g0gtiIK+ZqYTtvIZ81le+Funxycq6WLwBCoMwZ53mO4GuQgmE/u3n8df
 va5Craew2zTu1gm2PfLdamuUYGGsHrdWbqEQvQY5mtDshXTFFj2yB8QPMX3rJMRBteU4Y0Ef+FKH1h
 o6HpO3WpIyV1pc8UwYqUe1Vkd3gQ0kD7lLwK1TGO580zMI7DBJPOhkGQAqCbQ6vXbWimQTKLi94HEf
 K3uulRPSYYVb3aetnHQe6EZPIXu+JU9jGaE8MHusxUMWI+Zz/BKNapo8AhAdpZ8emDMt4THTYVA1rT
 zQQTSsmbE1IYf8wq79YDAAK6PwDyobcstdvbLd+YcxCtal6a0y3dRDiyuVbR3JyieSeyWJ733mHhwG
 uTBT6XraMR0VLS547pkjBAmxYLYGDynqTeX30z1mWlfauKXo64l3VglhqrGI4p9Zkc1YeiBX+Z1Vni
 809uEpSu8c8/m7s+l27g+NFnK3tfFqNUFespehSZgMygDrl3DIl8ZRwW/4h608g5NyIV1U0NZ0N13g
 2YOMe235F4TzM/A9iXSinczMQKaKMgdHXeKYoaUfX4G3TbDY93kon6MltV4gYBanhymYkQcTQ5RmH1
 kKt30KUb+W+XCpt8udIsYqUrpTOsV+crEwY8QX1qA5SYck3rEO2G8hGdNJUQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_051808_279426_D770B4C0 
X-CRM114-Status: GOOD (  10.22  )
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

In order to use the PMIC, the pwrap support should be added
to allow communication between the SoC and the PMIC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index e018df6844f6..687011353f69 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -186,6 +186,18 @@ apmixedsys: syscon@1000c000 {
 			#clock-cells = <1>;
 		};
 
+		pwrap: pwrap@1000d000 {
+			compatible = "mediatek,mt8365-pwrap";
+			reg = <0 0x1000d000 0 0x1000>;
+			reg-names = "pwrap";
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_IFR_PWRAP_SPI>,
+				 <&infracfg CLK_IFR_PMIC_AP>,
+				 <&infracfg CLK_IFR_PWRAP_SYS>,
+				 <&infracfg CLK_IFR_PWRAP_TMR>;
+			clock-names = "spi", "wrap", "sys", "tmr";
+		};
+
 		keypad: keypad@10010000 {
 			compatible = "mediatek,mt6779-keypad";
 			reg = <0 0x10010000 0 0x1000>;

-- 
b4 0.10.1

