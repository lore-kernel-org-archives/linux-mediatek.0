Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79094E7107F
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 14:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxkPmAViZ4bBY9DKE4WBvD6KeHCq77X51+2zFhsJvjI=; b=UJzOVQac7J+Pxq/kwRvQUVLSNT
	zlEaiWm1L90kP8U4OiOSi6Eyi28R3UCLKvFIMW9qZ4B/NQbwXDg5A+jyeYoIsradEhgBs70SMU71h
	PwFeXcHMuxoqfcQYDohiWk18jpC7XRfNb/U36S8bj9zIsKXFptj66MNh3sbYzWQhHl7dj4KokmGgI
	y8E7qh2aRbFVc3Qd8cBK09R1ubj0/7iD9vNtl0+0osplOS2rznCW5jU+dPszw3bGf7p/2gpL7IzGD
	yO3xym02agaFWwk5ZLilEogXV5AKkSbAlMCXRrmrQqPnYkMV5MJzaPcNqSP0JEOtlUxc40dYvMFXj
	5k/nHNnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKkL-006IEO-1S;
	Thu, 21 Sep 2023 14:33:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKjn-006HwR-0F
	for linux-mediatek@bombadil.infradead.org;
	Thu, 21 Sep 2023 14:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fxkPmAViZ4bBY9DKE4WBvD6KeHCq77X51+2zFhsJvjI=; b=Z9agYvLQOaAB39131glQhCEZnw
	L2gdM6xndjbA1cBcDpN6GIQvMJ3Ge1/FaCVges1ZcZRLIXL/fE88yDVAUFItmEQgS0Cn7njLz+E/n
	Rg82pWcoaBDhyeffj8SEK9Qa9k9/6xsjlB9RFvaZBs1FaAX1cD0vhVqIjteX/wz2OjcWBPxo/wTP1
	fLfv6NwZkOf6tr3g4/Vtxqg2U+KzBmWqdT/MVbeTN3fXKVr0YqNnBpjCD/Gl23lF3XX7tDwM8eVJa
	K4Rcp04qT8pyOWz4T+WmsScgyQDZMnCoUN8YkmW/33pt6YmzU2fQIjzvIbxZMHT9oVZgKyOSmjPWi
	SgjeKbbQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKjh-00FRon-2L
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Sep 2023 14:33:01 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31c5cac3ae2so1010158f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Sep 2023 07:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306777; x=1695911577; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxkPmAViZ4bBY9DKE4WBvD6KeHCq77X51+2zFhsJvjI=;
        b=SRhBE3QLX4aAlzFiD2/9I6yR1/tN+/ScqC6E13SpzChpGnss3gqIJP7avi24HXlW5X
         IA7s0+0O3zD5aJg/fyRxX2WvfRtvy1QQiRDqHUakRPdDWdf5H5gvYh18Dp3iTbKsrK7e
         gQ76I4epJ6UBD8Sw17fG+QwBMrCgR2HCxBDaof4d/+bV/f+ZDTcMQ+ZIG7P8e2kW/2S6
         EYpAGMmANKOtvmm3F1tOAzzr9TCKgs2lcYODodVkezHFAinqvxBybQlPdWVvbKEJhkab
         EyZb/+KfkHXTmiRODi3IyFAWnJ3RhSmFGA5pZb/NdkxJ+jRL8/LgQPv0yJME2S/Pp05j
         sa/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306777; x=1695911577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxkPmAViZ4bBY9DKE4WBvD6KeHCq77X51+2zFhsJvjI=;
        b=Bm2DMjuQuJkie50ub9KN2WSPY5KP21d/MskDJX31BiWryWSU3TifDbSbDtI565Ylog
         ft2oPK6dpOtTP77N5h2LwMPJg0h6RNXaX9P7x+GjiZB7O+UdhB2ALDgX0dt8dJElw4ce
         IhAIfdhgylWgbs5mMv7gQLEPVhScQ852cLRgmOutV76xf223l0wSO6/dLHNCwd94iXwU
         Nyfipmk4aLDriJIScMR+bscoqCEFya0Avp4fFWvztWICb02Iys5S/Yd3PQ4x6RYdzz7D
         XjgkOZuRm1w7g9buo+WG408Po8qzRc9nP6VTU3WvVc67XE9d70f1vXapBgKz+UcwnJE/
         lliw==
X-Gm-Message-State: AOJu0Ywsz9dtCPFd89/TVCZraBeoMKxS4wBRY+lsZhNk0q2dmaJkXdqC
	jNIOf6pqwMGdc59z+Ia9KDdDog==
X-Google-Smtp-Source: AGHT+IE24TGT99DikzPg5zG+6oyXRaRUuY6+u/KuMZcpuCCWeHerHnJXlIqtmoOq6kDnMQwaM6y3ZQ==
X-Received: by 2002:a5d:6282:0:b0:321:4ca9:ee86 with SMTP id k2-20020a5d6282000000b003214ca9ee86mr5788827wru.53.1695306777512;
        Thu, 21 Sep 2023 07:32:57 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id lt12-20020a170906fa8c00b009a219ecbaf1sm1153327ejb.85.2023.09.21.07.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:32:56 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 21 Sep 2023 16:32:45 +0200
Subject: [PATCH v5 6/7] arm64: dts: mediatek: add larb support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v5-6-fa6f03680832@baylibre.com>
References: <20230207-iommu-support-v5-0-fa6f03680832@baylibre.com>
In-Reply-To: <20230207-iommu-support-v5-0-fa6f03680832@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlDFQPhJHEHhv6HpHOR8vnZbdJqOs94UdeCDIGq9yk
 oP0A2XCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZQxUDwAKCRArRkmdfjHURRxSD/
 95BCCUm6vXCQ3heLFsNf0wN6jPPVGGVQvyaRoSVnPA+qE1wmUMIJSJ3/Os+3vPTAaQKqRSSi5S4bps
 3H/NTU8PqwL2g2f0cN1qjKrnvBdsVR5DJ40Nf10BqZZu1TZHYNIcM7vg3HmLTXFb+s+cbg8bQwjQJa
 j01l+vxGCArOiBpxCAyGyzACfTCTlFFGdaIxUc4H4wqUKD04624XV5ntBjTNthw2P+qzkDxXcx9nur
 iG2zXXUBFyIhzl38RYQIxvCsP5pw2KELEZGIkzxSayQ5L44xtSBjPOiTWbdY5XvprQFxU9wnnmWepl
 7vwQSRnSrLz+OCv9MOzKCGroNm1IzNTrSdi0Za6+CD5+Q0yBwQkA0vUqoCf94y3R9wlDb3ZNoGGJIb
 bk2+P7zJHMCrEc/yDl6N2T/jG7cF5sLKBD+PympY8cfQHWeNXRWWShRXn09PQqB/gX5Nm79/Mzm57t
 omaDyWe3lrnXx1H2frtvyzr2Wf6nWbh0GD4zyKrl413WQgeXt5tcTPATFSY34QSXVPlNOU0SkRNz1p
 58/Dlrb9QqA2LODi+/nhKZUzjT5EluaUYCBS2GpeeuytKTL9EAxx9tgvGOWrSlIqHcImowYIaY4Hs4
 e3q3arOf4R4E/epzs7VxtO791cfKKfqRKw12rvXRk9Y2RIFwQPMqE73rPQ3Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_153259_447638_A90317F3 
X-CRM114-Status: UNSURE (   9.97  )
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


