Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FCEC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 12:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CO4ENm66ygCDGcf+oYb29oqyXitqtJ4E8j9C3+eAmc=; b=JJQipS3epItEyd
	p+1r+41VgJH0I/AM8bL03TGEJUUXm8XT7fQt3/VbvQ9mCFPg14jg2iDLm4AXymy0lz7+We50JCsBe
	okMRcjbVFcVw0HVsrfdOUWJIfvurX+/gsjooeaDLRLURkRo+/uFGUW/pt6ZSuFN3JgvDSumSW/1Gz
	KzMU11tCe7ezASwKecqDDGuLtdIa6cg45vTK9v+MT88C89TrVNOfrgc1Nn7EdY7mql5Xe+jW42eG9
	mdKvB5hALIScfdo+5kjiYDj/2r0qEX9cd6dHagJrolAQSASkhV/hW+wbQg6QxqGx8BHMMj/3uKt09
	RKy1hUZnMmzw9CmE/c2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np7sN-00BmZK-7f; Thu, 12 May 2022 12:25:03 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np7s5-00BmMp-PU
 for linux-mediatek@lists.infradead.org; Thu, 12 May 2022 12:24:48 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 125-20020a1c1983000000b003941f354c62so2911927wmz.0
 for <linux-mediatek@lists.infradead.org>; Thu, 12 May 2022 05:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O/dkIwzTHk+5gsotg7nLbrQsDZjzi6VTdK6DCeSc+w8=;
 b=QriHUDKYodKrRPdxpYYgtJTXUTjl6lU+iPjloHZmUjl6pz0T8QXq4FytbPxG5TJGWW
 SIR6jIVEMBAdtCoHsg9ZBHYt6Fmt76/9P2zA1nFKnL/uSuHVQrl2w4mMEupUJyKHsBNa
 rtkoisnbWKZ8J5IotNBpXoseTd6d9z7v+TL0JtYf9ARG9ApeW8ypCGCc//Kr+q/mzJiE
 D8nTwJ+ZSunczyXzcyX+2Jwstqa2kSug0pZrza8UvXqsS2qR9TPdlBrw1+9uqA1W7CvI
 7ZOt+8WS4I1B2yOcHuxg40VI2Q25dDYeQjnveExd7cXE8Vi5pNx3CYHsBZtVuDGtmXLY
 QYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O/dkIwzTHk+5gsotg7nLbrQsDZjzi6VTdK6DCeSc+w8=;
 b=MC5QuZ6JjCgv33ScW8mUNjolMMpUV6ln9bfjvwPX2cYJVQi0+7aKWLjtsXYomoW3kr
 226O/Q3gQsi3oMVRLvo30ltTc5PAPHpbe39c1uDjfCMOt31btjp65NXcjjJIUSvS409o
 nXKSUu0vNCNGKrJeOub9gns/ojitJfXBxfV1yz/lcS+WXNsAQjqRJ9cBDpfw5M8FIGtX
 RrUpHCcH5AUJNZ5m8U7geJEUpRsxlVU0mnA0WOOj/hytwfGrAcTX0hLFs9CTC1+oyK8X
 unwgG/NwWGATf1w5Q924N3utlJsSLwOJATxIVJ4knFBq9K7i2ACJ1tpQ/x4yw3i+inX+
 Hy0w==
X-Gm-Message-State: AOAM531rMTnsaqmn3lQTM3HdpPOhViIeSjQE22An42TqkuOm61j9LM0z
 zxQSG8Qk4JCtjIwK2epMx7EAvQ==
X-Google-Smtp-Source: ABdhPJz7xhNH2VS8qz0wUUIsoo72WfBxVT3Sy5iAc/peGlJ6NUtqhpFPZLhhTH9iUNPRol++6IwYDw==
X-Received: by 2002:a7b:ce02:0:b0:381:2007:f75c with SMTP id
 m2-20020a7bce02000000b003812007f75cmr10138584wmc.6.1652358284482; 
 Thu, 12 May 2022 05:24:44 -0700 (PDT)
Received: from xps-9300.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a7bc156000000b003942a244f30sm3047819wmi.9.2022.05.12.05.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 05:24:44 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: robh+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Subject: [PATCH v6 7/7] arm64: dts: mt8195: Add thermal zone
Date: Thu, 12 May 2022 14:24:33 +0200
Message-Id: <20220512122433.1399802-8-abailon@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512122433.1399802-1-abailon@baylibre.com>
References: <20220512122433.1399802-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_052445_875705_157F9F1E 
X-CRM114-Status: UNSURE (   9.09  )
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
Cc: devicetree@vger.kernel.org, daniel.lezcano@linaro.org, rafael@kernel.org,
 khilman@baylibre.com, linux-pm@vger.kernel.org, amitk@kernel.org,
 linux-kernel@vger.kernel.org, michael.kao@mediatek.com,
 ethan.chang@mediatek.com, linux-mediatek@lists.infradead.org,
 Alexandre Bailon <abailon@baylibre.com>, rui.zhang@intel.com,
 ben.tseng@mediatek.com, Tinghan Shen <tinghan.shen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Tinghan Shen <tinghan.shen@mediatek.com>

This adds the thermal zone for the mt8195.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 103 +++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 12887fb4d0d1..d6e5b595a89f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -823,6 +823,21 @@ spi0: spi@1100a000 {
 			status = "disabled";
 		};
 
+		lvts: lvts@1100b000 {
+			compatible = "mediatek,mt8195-lvts";
+			#thermal-sensor-cells = <1>;
+			reg = <0 0x1100b000 0 0x1000>,
+				<0 0x11278000 0 0x1000>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+			clock-names = "lvts_clk";
+			resets = <&infracfg_rst 1>,
+					<&infracfg_rst 2>;
+			nvmem-cells = <&lvts_e_data1 &lvts_e_data2>;
+			nvmem-cell-names = "e_data1","e_data2";
+		};
+
 		spi1: spi@11010000 {
 			compatible = "mediatek,mt8195-spi",
 				     "mediatek,mt6765-spi";
@@ -1627,4 +1642,92 @@ vencsys_core1: clock-controller@1b000000 {
 			#clock-cells = <1>;
 		};
 	};
+
+	thermal_zones: thermal-zones {
+		cpu_big1 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 0>;
+		};
+		cpu_big2 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 1>;
+		};
+		cpu_big3 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 2>;
+		};
+		cpu_big4 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 3>;
+		};
+		cpu_little1{
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 4>;
+		};
+		cpu_little2 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 5>;
+		};
+		cpu_little3 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 6>;
+		};
+		cpu_little4 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 7>;
+		};
+		vpu1 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 8>;
+		};
+		vpu2 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 9>;
+		};
+		gpu1 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 10>;
+		};
+		gpu2 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 11>;
+		};
+		vdec {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 12>;
+		};
+		img {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 13>;
+		};
+		infra {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 14>;
+		};
+		cam1 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 15>;
+		};
+		cam2 {
+			polling-delay = <0>; /* milliseconds */
+			polling-delay-passive = <0>; /* milliseconds */
+			thermal-sensors = <&lvts 16>;
+		};
+	};
 };
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
