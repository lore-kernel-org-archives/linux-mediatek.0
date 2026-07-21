Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56F8C4452F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 13:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yif91B+KlLGgItRG2ZGYWcgS3NGMXtTFKaWfIW3KxWk=; b=ASwO1WF3VUez3nzfS1HeFiSF40
	gBNfGPA9+OEKB4JXwSaR/+ZCtwjoMLY+mvySs0OTUXWfE0TMbJTX1CbQ69hMl0SUmgNbGvlvyOkst
	dXIhfS+vEzNaUGwOIhmBuKpMflAn5vNkL6Qbxk5fLomIxiD+rnHM5tpE6HzISBVjaTZ9UCePxEH4x
	N+H7PCEznX/sv7+5qcpoyEVfkiEMK2ZaH3mxWf7P3IiuxzqvW7NUkkbuy5XAI9puQ/2pcOeM57U5x
	wEPPcWnjs4Odi9CQGPnV8uTvXhKkKgd1EmglNqaBVvfeImxot1UYC/bWjWKtI034MMwEOWdRv/FCO
	71DqYJpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAT0-00000009W0b-2AcZ;
	Tue, 21 Jul 2026 13:25:02 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmASx-00000009VzF-17BE
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 13:25:00 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4720f3bf164so2758606f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 06:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784640297; x=1785245097; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yif91B+KlLGgItRG2ZGYWcgS3NGMXtTFKaWfIW3KxWk=;
        b=I4pCr1kFw8x3R+Tj1R/9MCTHIWTeXob7RYrd7Nz/hX1+DvOyL/gmTFEPcGg1xJDoaD
         9zXPpB494gq5iFG7EBOiOXMHlMB8gMH2fJvjv6G6B3tsTHrodUZo5c8IM/0hQZZvzGBX
         IgvI8CXdLzvKuoX3lGLL1CE6UVyZFGJG/rpwuUtGKmKwqVboOJgURcQRMLnRIG7BiEub
         I+uSu9iEcBPt9wMXoXq6xKxNT9Dw4XHeNpRSxJO9Vlvry+ViLkOHDRIxxPvLdYERRnle
         UkeV88YKciMhBNoHYPU2ra1uoelk21MXQ74C6tTZ1p6QB62SvS0all0GzOD3w4164TMl
         I7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640297; x=1785245097;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yif91B+KlLGgItRG2ZGYWcgS3NGMXtTFKaWfIW3KxWk=;
        b=aHwPuqFSkPFWuSUqT5k59cG0I9f1UvIOc+BMQ+1P1FOEFFXzLekZChx2x0RWUKTC0D
         SFxmdxEFUu/kfuttgbuOk1KGzn9vY7WWy/QqdaeOnURylSo+LAdWzGoqe54e3Bs+YYMa
         mDpyEvPdq3u6nv3//H8eWwsBxELy27JebsWrcfIbQjl5Rbf7h9IL5OHIoJLQqlA1C9WU
         uTd3NdLsY63sMo9tvuod10ddk3XpBsWrgdaKrZQACkKFT0puXddnYaA1gR/q2yqugxnc
         km4Hor6SJDpYcEESV/sl4z+rWr1UJZwlYO2VPRX2/dA6g+pYiXauocjHEv7lDKKiK4M5
         Jl+Q==
X-Forwarded-Encrypted: i=1; AHgh+RptAgG9T7QcOozpk8TAT9vcp4lbg3lfVUZjBwRv0rTV36FoVhrLlrRyWzvD1pzONu2iaq4U83uGKy9rVpNvoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBKm6aFVrDDkwfsiVR4Qb/YAlVt+UKRyRaZTtF9GDZ4LnmfTBj
	SM7ZbPz2kHAtD27S6ZiKTPGVhMxgjCcyFefcl+NokMNgyozuV5OPeNaGnJ+lEh6ybKM=
X-Gm-Gg: AR+sD10Gpb8sjOUaBveLfFhfbS3riwkrR7CwOvDxfxvvQ+4CizTXZQbvtgNeoo+JlNJ
	E52qVO7Y1llxSWilaSzaM0kAaK9LzNcfV1dYn2bNHAKNquGGL3nPybkUkOnmY3Z7ApP/5rdeWwJ
	gi19v78YFzYH5kXGDJsXqnhtkMo6s25c0bc527Z8su0orlDPxW9n9VzMXdPt5Rwk+WL7/9UqBgJ
	46fesPD3Z+pzxYtCVQCwyF/wLPpy7h52/sN1/saIU7rFa6/WnftXAG9B1nexXAUQTugcv5a+NMW
	2n+pjRPosr9nEJs8roqySu3we7og8AK9WSrIackpozjWyHBWbiGKTyZysL4A9TMGtacAFYyW4U3
	+w73ZrfZTBDCAkOBMfKtPI/ngIbHevzFNiIk8IDHfWHfkGZ0UM8Fwc6Db4uM7WaKnNrRFXTZAao
	AWlRPrKF+jui0cgdLtofNzOYPSzxsfFuUYMBtWKSP9jflEKu/XQKymM1hjFrY=
X-Received: by 2002:a05:6000:178d:b0:474:bbbb:bf17 with SMTP id ffacd0b85a97d-47f62378c4bmr20304933f8f.0.1784640297061;
        Tue, 21 Jul 2026 06:24:57 -0700 (PDT)
Received: from [127.0.0.1] (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed244bsm2918310f8f.20.2026.07.21.06.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:24:56 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Tue, 21 Jul 2026 15:24:46 +0200
Subject: [PATCH] arm64: dts: mediatek: mt8390-genio-700: Add boot phase
 tags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-ccaione-upstream-mt8390-bootph-v1-1-5642198f979d@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN0QrCMAyF4VcZuTbQxeKcryK76GJ0EbaWphNh7
 N2tevnB4T8bmGQVg0uzQZaXmsaloj00wFNYHoJ6qwZydHIdtcgc6kRwTVayhBnncj72DscYS5p
 QQhfIe089MdRIynLX9+/gOvxt6/gULt8q7PsHCWa3c4IAAAA=
X-Change-ID: 20260721-ccaione-upstream-mt8390-bootph-ea7a2444292c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>, 
 Julien Stephan <jstephan@baylibre.com>, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_062459_326040_2ABB7629 
X-CRM114-Status: UNSURE (   8.95  )
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

U-Boot SPL runs after the platform DDR loader has initialized DRAM. It
needs the debug UART and eMMC controller, together with their clock,
syscon, pinctrl, interrupt and watchdog providers, to load the firmware
FIT.

Mark the nodes consumed by the current SPL configuration with
'bootph-pre-ram' so that the canonical devicetree carries the boot-phase
information and bootloaders do not need local overrides.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
index 0d5a75efb2ee..83f2d10fd28d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
@@ -16,11 +16,20 @@ / {
 		     "mediatek,mt8188";
 
 	memory@40000000 {
+		bootph-pre-ram;
 		device_type = "memory";
 		reg = <0 0x40000000 0x2 0x00000000>;
 	};
 };
 
+&apmixedsys {
+	bootph-pre-ram;
+};
+
+&clk26m {
+	bootph-pre-ram;
+};
+
 &cpu4 {
 	cpu-supply = <&mt6359_vcore_buck_reg>;
 };
@@ -28,3 +37,75 @@ &cpu4 {
 &cpu5 {
 	cpu-supply = <&mt6359_vcore_buck_reg>;
 };
+
+&gic {
+	bootph-pre-ram;
+};
+
+&infracfg_ao {
+	bootph-pre-ram;
+};
+
+&mmc0 {
+	bootph-pre-ram;
+};
+
+&mmc0_default_pins {
+	bootph-pre-ram;
+
+	pins-clk {
+		bootph-pre-ram;
+	};
+
+	pins-cmd-dat {
+		bootph-pre-ram;
+	};
+
+	pins-rst {
+		bootph-pre-ram;
+	};
+};
+
+&mmc0_uhs_pins {
+	bootph-pre-ram;
+
+	pins-clk {
+		bootph-pre-ram;
+	};
+
+	pins-cmd-dat {
+		bootph-pre-ram;
+	};
+
+	pins-ds {
+		bootph-pre-ram;
+	};
+
+	pins-rst {
+		bootph-pre-ram;
+	};
+};
+
+&pio {
+	bootph-pre-ram;
+};
+
+&topckgen {
+	bootph-pre-ram;
+};
+
+&uart0 {
+	bootph-pre-ram;
+};
+
+&uart0_pins {
+	bootph-pre-ram;
+
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&watchdog {
+	bootph-pre-ram;
+};

---
base-commit: b95f03f04d475aa6719d15a636ddf32222d55657
change-id: 20260721-ccaione-upstream-mt8390-bootph-ea7a2444292c

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


