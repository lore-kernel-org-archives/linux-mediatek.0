Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F028C25B7E
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 05:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KPQvvAhw/QNVA2rWSAmQjx+yY2X/Ig4NrPz7gPkeZ8=; b=dekgdOfkpleQeg5w224mTjonBC
	QfclNIGU1cvSFobeR8x6Q8xULsJcwpgtwbfBw6+R6Xg1ShvY72XABNJRiiXuShaAPp7OkHgFragoM
	/CSQmQXo2LGUiewhb7+/+Vhoo85RVyX17V1tTCFoyAYvIX2LUtInwgZO3DC5/vswGhK+Hp9wcvC/d
	f3FIGpYaCmaR6S3owyImWRnfHP0aPuD/dV0AMDCnhtYQbfrmYnNCd1yGNLhSWzIvvIGLPT2Pu3xB4
	3KHltCfZQKufKRUrTjEry2rE09TczP8w9jXGJfXDAD1dtcKbB19fDxFALfQgmej0ZCyE515wvcSj9
	2lB11jSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCKL-00000002w9q-2eMb;
	Wed, 29 May 2024 05:58:21 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCCKA-00000002w2G-3aA9
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 05:58:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-421087b6f3fso14562385e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 28 May 2024 22:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716962288; x=1717567088; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KPQvvAhw/QNVA2rWSAmQjx+yY2X/Ig4NrPz7gPkeZ8=;
        b=Lm7HBCi+zN/5Xa8ZptZnQewDPIipbPNbtSOsBW9grAaxVjxEAPeaViAK9ZT+QGX9ed
         lGvmGLrxP+QBUSA1zmiqpNRlu+5fo+fglAd19IeJWel5svEVl6YVySpnQq4b49jyOBg6
         UX0a/t/rh/oaJ+1UEDw8zUvfYtQiurKhAPPaUryEyXvAvOK2/E3HeOptDhoPUsNFRhVZ
         +f1IuLFMnwJqA4al7Cx+5+wnxd7vVgk3L0+/vp6dEtPomhGzMdMUsL5gOEPblixQtLCO
         UO5E5vAWpxVsxihKpN+79hWlMPIpCjlz4G47XWk2qGYF3ykUvz2a1hEB5lxK4XAyAgjD
         7t4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716962288; x=1717567088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KPQvvAhw/QNVA2rWSAmQjx+yY2X/Ig4NrPz7gPkeZ8=;
        b=hyUIEYQEQVsLFFji6K0BufVHkUJrpuFUc4KUVnZlFkq9m8xvLuLAJzFAkjfA6aTKoc
         W8lHtnNngtKtY/PPqbeyY/7tvUzhH3DL648GSTveKFGsxGIGpGvsAmqMY4RLh3npFSOE
         S6VIKGCaeZRTA2CQP5J0gfVJlwCMn5jCAgdfY5HATlahRTzC+nPFdg/tyxB+LJ0Z5yns
         LfWCzSmmxKFY+7LEWUspN2gFbsxj6r2zyB0hhbOSV0m6+8eJlqsA+kvQMdH5xReU9hd3
         A9TEqzc/hqiJJxFe8UwLSgSXwN+qBMsPtzCO7YzJKA4JvajDe+VdTvJR3fmz6URqj86w
         uKSA==
X-Forwarded-Encrypted: i=1; AJvYcCXG3W/7gJIIVMUP2CIUQHV507vqny3gmjLhkhQgR2Nf9Vd/Viyjo7RSkcoX7YvV8CgCnDfnOjSVruyYyTducm5iSiq0kke1UpTkJYvRQSp+4ixt
X-Gm-Message-State: AOJu0YypGOzj6GbcDOfrnMeGu7OD2w1xzB+XNxIUBOGGaWLsDI3t8VIO
	JpIlLrrnspYdfkR5b0SKk6d5jvqa38HR4bmtrTCR+40eGDV2lk0jzW5r3Atuj5Y=
X-Google-Smtp-Source: AGHT+IHRHeV/DqymbcQrp2sjzmirZJZlNgRDnEJKkc0ZTQJHByJvNmBGPhTAtrpx/elL6NKld9VpRw==
X-Received: by 2002:a05:600c:5719:b0:420:173f:e1e9 with SMTP id 5b1f17b1804b1-421089e97bcmr98181745e9.21.1716962287803;
        Tue, 28 May 2024 22:58:07 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4210896676bsm169075435e9.4.2024.05.28.22.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 22:58:07 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Wed, 29 May 2024 07:57:58 +0200
Subject: [PATCH v6 3/6] arm64: dts: mediatek: mt8186: add lvts definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-mtk-thermal-mt818x-dtsi-v6-3-0c71478a9c37@baylibre.com>
References: <20240529-mtk-thermal-mt818x-dtsi-v6-0-0c71478a9c37@baylibre.com>
In-Reply-To: <20240529-mtk-thermal-mt818x-dtsi-v6-0-0c71478a9c37@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716962279; l=1717;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=ZXPmUPXXFa1JCVfBMk9FrptEjzZlcdWN0z1cSMSnOwA=;
 b=OK85Uj3rrGZKhM3JHH4HH37bvvdgaZPlri/dH9Ot2gzRF2PTxp3xVfjp4zaOTnBta+MXzcw1t
 V4Oh/qlSE9oCfjLLpHptTWE7PqNg4Q/NHo5lMhCIc5HTvkEf+y35Bto
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_225810_931490_E2C42383 
X-CRM114-Status: UNSURE (   9.32  )
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

From: Nicolas Pitre <npitre@baylibre.com>

Values extracted from vendor source tree.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Link: https://lore.kernel.org/r/20240402032729.2736685-8-nico@fluxnic.net
[Angelo: Fixed validation and quality issues]
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 4763ed5dc86c..caec83f5eece 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1361,6 +1361,17 @@ spi0: spi@1100a000 {
 			status = "disabled";
 		};
 
+		lvts: thermal-sensor@1100b000 {
+			compatible = "mediatek,mt8186-lvts";
+			reg = <0 0x1100b000 0 0x1000>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+			resets = <&infracfg_ao MT8186_INFRA_THERMAL_CTRL_RST>;
+			nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
+			nvmem-cell-names = "lvts-calib-data-1", "lvts-calib-data-2";
+			#thermal-sensor-cells = <1>;
+		};
+
 		pwm0: pwm@1100e000 {
 			compatible = "mediatek,mt8186-disp-pwm", "mediatek,mt8183-disp-pwm";
 			reg = <0 0x1100e000 0 0x1000>;
@@ -1676,6 +1687,14 @@ efuse: efuse@11cb0000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			lvts_efuse_data1: lvts1-calib@1cc {
+				reg = <0x1cc 0x14>;
+			};
+
+			lvts_efuse_data2: lvts2-calib@2f8 {
+				reg = <0x2f8 0x14>;
+			};
+
 			gpu_speedbin: gpu-speedbin@59c {
 				reg = <0x59c 0x4>;
 				bits = <0 3>;

-- 
2.37.3


