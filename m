Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D60ECE7AB9
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 18:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxkPmAViZ4bBY9DKE4WBvD6KeHCq77X51+2zFhsJvjI=; b=ZqGNUP15UZiV7XFGh0DitjFBqn
	sm3wwsVFK9Eexkkzdm+EtZFRFRvdMYv/f+bRlum6eqdtdqGXYJD0NgeEONJ14MB+k6OzEJ9wDVL9T
	mv8808wH3+oPsa5IaCGhyySTVFFcvKBicvO6J/fAJcD+GKfDv51lnCmvUB2U56JgJS+tGxYfCzK+G
	tQknqedV9LEWwJcTD1sjxkYAHvPehMgcp8LOnJtg4njZTlNSZVyIBmCyUTyJnxmOuSYzwko7GEjpO
	0uYg1HE8ELGTg0Vyc65i9R/GfkV5s6N5IOgDc/kRuRdkeBMCyTklGCTSrKjuipqwIf1fZx5F/jmmA
	UJr5KZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkqAB-00Eows-0O;
	Mon, 25 Sep 2023 18:18:31 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkq9a-00Eocf-09
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 18:17:55 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9a6190af24aso858379366b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 11:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695665872; x=1696270672; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxkPmAViZ4bBY9DKE4WBvD6KeHCq77X51+2zFhsJvjI=;
        b=cbC71+9cnDnLvJuYsdCvPyNoztqgtMUBACn37XDf/lJV57a++fJZBlJvxWKD0w69EE
         IaawhaQIJDIjOkiaRrgOrQxWt153OBd//eNy1I2KGKGxs9G6EunpDOnZA5pKqX5PqhgI
         4c25Dk6uxdvin1R+s0tiPuZHzt8DJq2XGUD8enW6oHY4oHLun9YX5geDrhA+I6HeiDy4
         GkVysUbWIwDPiJZpacRTBOK4wFfqKchhgQBabiyG/ElJ1NurRUDfvsS0otr7ib9jR2AC
         fHLR8Qd+7bBZr5ipCb9j6T5JR/7+14aK1pD0GJWGdhSiTSfEhcAY0iPcp984TIT05f7E
         T0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695665872; x=1696270672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxkPmAViZ4bBY9DKE4WBvD6KeHCq77X51+2zFhsJvjI=;
        b=pRMRQQPdg3se+OqwDrMfVG06l0IbdVf3FI18nMfecA5AHI1lTea1B9EfjMafnHCSeK
         rCIWbfUu8/bmc8Q2wQIjcuYydfDHexx0qGJBLQCDqo4q+pjMPZjTcbg1naLCX/wkf8KQ
         I2A6tTM1n9/pL9aTZ3I76HdBUAmBHY0cDGk6t/gG0Mgbf/ypAq/zkPw2U4k8l59QFVTR
         Dr48TEKMezS7RqfBplJPZtMMWvJOwllg8sXQdxVu8Cxl4hNo2zhsAf0B3S2dKZqTm9NL
         zyhPt9ze7ShEC4blwvuSyrjI5gjVPVqJeKCjZO5jRFsULxFJ0m9bBogqwuM/8ua3qL9b
         0biw==
X-Gm-Message-State: AOJu0YzOBux4LhCfUWQPLI9ZbQSTHWHC/U8tbGswuajF1MUllfXTouis
	urswqXu8j1d6jz73lkLp9zHijA==
X-Google-Smtp-Source: AGHT+IHT3syoSHTbKtilMHTDdnamW084akA+RA0Z1wDTTjmW2uxSgNEb1Sm286eCv+m4TnzoxP+WLQ==
X-Received: by 2002:a17:906:2088:b0:9a5:d657:47e1 with SMTP id 8-20020a170906208800b009a5d65747e1mr6035027ejq.43.1695665871898;
        Mon, 25 Sep 2023 11:17:51 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j26-20020a170906831a00b00997d7aa59fasm6793962ejx.14.2023.09.25.11.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 11:17:51 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 25 Sep 2023 20:17:40 +0200
Subject: [PATCH v6 6/7] arm64: dts: mediatek: add larb support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v6-6-24453c8625b3@baylibre.com>
References: <20230207-iommu-support-v6-0-24453c8625b3@baylibre.com>
In-Reply-To: <20230207-iommu-support-v6-0-24453c8625b3@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2919; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=YQ4gFuFLZ3ZXhHJoLIMLvf6JGXdHrmuwZeJIyfaEitM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlEc7F7qzSRjVHw3D4953FjAQpy02IRt7Bxz4Q11WU
 pRp6gGWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZRHOxQAKCRArRkmdfjHURZFND/
 97j8hIibvje8nqBVb8pJ/n5gAklskcO6X2r5QqLlaedqjf2PH4qAbaVmPrbU01rF2zOIq3Y+T0SZcm
 7VLM4w4H1flT9mr1D7na3MJ7VPtV8XbzvppZJ3WEdj634c50ebGsqE/e6MGtIOojOFpb7URUr+iIPc
 5oIjYm2rqMxDo60UyJOxnPg2mknQ2UhVo+NDynRhEaFxy6FfzRtwnoSXyrA9PXZ4QOJ8VwBk5NNhKa
 F8ob15opFebohf3ghsyUyCxUK6Aqmqyuft6hEKNJYXzuVBDCz/EdKGhq/4KYwy9r8PUbV8AWKkiGzF
 SrUmB6zKYRxaPrNKfxfShdKaifxnfIbCxyOyD/Ec+bbi3tR5HtuSjy5a4WrN4akgYUW4uUdOXYww/t
 IPbr1HxwaoWsa+9CH/aO+adV0mhURYFZjpm1Vb/ZFbPXsXb2YIVS8rDfc5c0gafTt0CnaLfLnxiT2s
 qcbj6ZxI8JmdCn2h7X/TFvF+CG+nKD2Z8b8XGXOsJFikcK/WOOP4Fob3HizUSGvcPconTRhlqYRejO
 AHp2uZwFpPHuMIGQJNyh8R4cb9kSPi+8HYPL7maITrrHBnt/ELS/9cGNbGKHYdjhuK3wyeXcqnZ8EC
 GJgkqz9i6mpmYHQl2mfM9ICSupb2NEHeNb8TRpR00EAYMllM5tyHk7X/y2HQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_111754_094877_F33374D5 
X-CRM114-Status: GOOD (  10.24  )
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

Local arbiter (LARB) is a component of Smart Multimedia Interface (SMI),
used to help the memory management (IOMMU).
This patch add 4 LARBs and 2 clocks for the larb1 and larb3 support.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 59 ++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index a03b8c0da68b..afcfa1dd242e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -735,12 +735,71 @@ smi_common: smi@14002000 {
 			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
 		};
 
+		larb0: larb@14003000 {
+			compatible = "mediatek,mt8365-smi-larb",
+				     "mediatek,mt8186-smi-larb";
+			reg = <0 0x14003000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&mmsys CLK_MM_MM_SMI_LARB0>,
+				 <&mmsys CLK_MM_MM_SMI_LARB0>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8365_POWER_DOMAIN_MM>;
+			mediatek,larb-id = <0>;
+		};
+
 		camsys: syscon@15000000 {
 			compatible = "mediatek,mt8365-imgsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb2: larb@15001000 {
+			compatible = "mediatek,mt8365-smi-larb",
+				     "mediatek,mt8186-smi-larb";
+			reg = <0 0x15001000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&mmsys CLK_MM_MM_SMI_IMG>,
+				 <&camsys CLK_CAM_LARB2>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
+			mediatek,larb-id = <2>;
+		};
+
+		vdecsys: syscon@16000000 {
+			compatible = "mediatek,mt8365-vdecsys", "syscon";
+			reg = <0 0x16000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		larb3: larb@16010000 {
+			compatible = "mediatek,mt8365-smi-larb",
+				     "mediatek,mt8186-smi-larb";
+			reg = <0 0x16010000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&vdecsys CLK_VDEC_LARB1>,
+				 <&vdecsys CLK_VDEC_LARB1>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8365_POWER_DOMAIN_VDEC>;
+			mediatek,larb-id = <3>;
+		};
+
+		vencsys: syscon@17000000 {
+			compatible = "mediatek,mt8365-vencsys", "syscon";
+			reg = <0 0x17000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		larb1: larb@17010000 {
+			compatible = "mediatek,mt8365-smi-larb",
+				     "mediatek,mt8186-smi-larb";
+			reg = <0 0x17010000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&vencsys CLK_VENC>, <&vencsys CLK_VENC>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8365_POWER_DOMAIN_VENC>;
+			mediatek,larb-id = <1>;
+		};
+
 		apu: syscon@19020000 {
 			compatible = "mediatek,mt8365-apu", "syscon";
 			reg = <0 0x19020000 0 0x1000>;

-- 
2.25.1


