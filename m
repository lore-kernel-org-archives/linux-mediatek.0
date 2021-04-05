Return-Path: <SRS0=PUi9=JC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3025C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 20:09:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F551613BE
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Apr 2021 20:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F551613BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uVi7SmkS9n/B4z+ODwddh6AJESmVSZRSDBfpCky+iVU=; b=SgTI0fr94NCDEbXJaprAO83ZA
	LwN6I3uEDiMZSobMfHUQ4ej/PffVJF+H082UwUn31o5/AHytAxNcPJVbjmCgjzrPexZu9s4vBomFL
	UVk5iRlMRB6duo6YrTUE6fDf6uO0r3culZu0kUkBCaRbkTnLZFDYOdOneaXSTd2OlDNnX2wVkBUK4
	jbbYZ41rgGlP1mAJIIAfNEXlhfoawxhzh+9WALl0YnJgjPrQZRwOFSQPF5PeiykHk0MUtICEtsEgX
	HaeDPp0XPRQrv4ugk99Ob1x/zT3OOyWc8vXrqMGwVtZe09Du/sr08XCSRm1RZpnXsRS7VQK9sEBlN
	+uCGaLXeg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTVXI-000YLd-0p; Mon, 05 Apr 2021 20:09:24 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTVWR-000Y3f-Ua
 for linux-mediatek@lists.infradead.org; Mon, 05 Apr 2021 20:08:35 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 g18-20020a7bc4d20000b0290116042cfdd8so3009541wmk.4
 for <linux-mediatek@lists.infradead.org>; Mon, 05 Apr 2021 13:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zBI59S0esvtyRJVOZTHC86ExpUhwst9TBLwdi/kDYn8=;
 b=tiGffN4digjOme3ZvvrFri/s9NDzwTOWr1qHeG7BhTyV469zeXcoPoWnAOWuxGsYAi
 Az5xcWk7WCcViBojAQEXw5P/uuykrC+FsLOcTwv9ubhKl9S3/hJRgTCCENfz+BrqWfC8
 ba6I1hvGtwuyC8L6h+lyGyzCHxZ/QLnrrzO4Zglshtj0IhwYd2Kxug+1/FTNIYOfL3VW
 SBUcPjQIKzojr6sSAiwT8Li40JANAE3kv9jDylR8RBujP55GTbjMeQ6Y78a9pvYvtWZN
 cacolBfsSb0/bf5zJ145x7bvf2NLcro51gQMdpFj38C9jhg4E3+wNxMbsAD0xenGezdf
 be3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zBI59S0esvtyRJVOZTHC86ExpUhwst9TBLwdi/kDYn8=;
 b=a4K5W+MMNCpIrWi8ypk8uy0P21b7JKoszqfo/g8NWRPVWeSg9eFZvyitmrhbju0uoB
 mwF/yln9C3nOrT5oZo2oaPaIU/b1wQM8sxX+P83idSY0o6dZva95RIZ2Q/aXaIYB7BQU
 3NVrOP/wE8/LySsNqHdYtb4qa2EdaQDockPXnquapKwIbO6JcP1tIfBS7VX1yKiaJhrA
 QA/vLWR5OEscP2/LkFC1wrSX39RvJpeNLaXgROPgHDE2i0qr7tRvLINCiJcYknNYhrJK
 BzpIrhTY7ssj1xnm/O8A+n1Y84W6t1OUupwk3efR/1ijYBJA3P7+NszEwwBXiMFKHCgj
 4T6A==
X-Gm-Message-State: AOAM531GuV78Ei3fNVqrNR829bPnyJbF3wDr0ns854da2wh2Ti0kOjXs
 EgeWlw7YftCnigJ+dteHb5GAgw==
X-Google-Smtp-Source: ABdhPJyfy0YtdT4isJjzVUiZ5iElNhki0/lybno+DvYH9leDZPbn06qlgznbrXa6NBC610NsrAp3HA==
X-Received: by 2002:a05:600c:228d:: with SMTP id
 13mr689696wmf.49.1617653310820; 
 Mon, 05 Apr 2021 13:08:30 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id v185sm609420wmb.25.2021.04.05.13.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 13:08:30 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: mediatek: mt8167: add some DRM nodes
Date: Mon,  5 Apr 2021 22:08:21 +0200
Message-Id: <20210405200821.2203458-5-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210405200821.2203458-1-fparent@baylibre.com>
References: <20210405200821.2203458-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_210833_237109_942504FA 
X-CRM114-Status: UNSURE (   9.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add all the DRM nodes required to get DSI to work on MT8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 149 +++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 3ba03ca749b2..8ca92d6b203a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -16,6 +16,19 @@
 / {
 	compatible = "mediatek,mt8167";
 
+	aliases {
+		aal0 = &aal;
+		ccorr0 = &ccorr;
+		color0 = &color;
+		dither0 = &dither;
+		dsi0 = &dsi;
+		ovl0 = &ovl0;
+		pwm0 = &disp_pwm;
+		rdma0 = &rdma0;
+		rdma1 = &rdma1;
+		wdma0 = &wdma;
+	};
+
 	soc {
 		topckgen: topckgen@10000000 {
 			compatible = "mediatek,mt8167-topckgen", "syscon";
@@ -114,6 +127,13 @@ vdecsys: syscon@16000000 {
 			#clock-cells = <1>;
 		};
 
+		mutex: mutex@14015000 {
+			compatible = "mediatek,mt8167-disp-mutex";
+			reg = <0 0x14015000 0 0x1000>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8167-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
@@ -126,6 +146,135 @@ pio: pinctrl@1000b000 {
 			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		rdma1: rdma1@1400a000 {
+			compatible = "mediatek,mt8167-disp-rdma",
+				     "mediatek,mt2701-disp-rdma";
+			reg = <0 0x1400a000 0 0x1000>;
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
+			mediatek,larb = <&larb0>;
+		};
+
+		disp_pwm: disp_pwm@1100f000 {
+			compatible = "mediatek,mt8167-disp-pwm",
+				     "mediatek,mt8173-disp-pwn";
+			reg = <0 0x1100f000 0 0x1000>;
+			#pwm-cells = <2>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			clocks = <&topckgen CLK_TOP_PWM_SEL>,
+				 <&topckgen CLK_TOP_PWM_MM>,
+				  <&mmsys CLK_MM_DISP_PWM_26M>,
+				  <&mmsys CLK_MM_DISP_PWM_MM>;
+			clock-names = "pwm_sel",
+				      "pwm_mm",
+				      "main",
+				      "mm";
+			status = "disabled";
+		};
+
+		dsi: dsi@14012000 {
+			compatible = "mediatek,mt8167-dsi",
+				     "mediatek,mt2701-dsi";
+			reg = <0 0x14012000 0 0x1000>;
+			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DSI_ENGINE>,
+				 <&mmsys CLK_MM_DSI_DIGITAL>,
+				 <&mipi_tx>;
+			clock-names = "engine", "digital", "hs";
+			phys = <&mipi_tx>;
+			phy-names = "dphy";
+			status = "disabled";
+		};
+
+		mipi_tx: mipi_dphy@14018000 {
+			compatible = "mediatek,mt8167-mipi-tx",
+				     "mediatek,mt2701-mipi-tx";
+			reg = <0 0x14018000 0 0x90>;
+			clocks = <&topckgen CLK_TOP_MIPI_26M_DBG>;
+			clock-output-names = "mipi_tx0_pll";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		ovl0: ovl0@14007000 {
+			compatible = "mediatek,mt8167-disp-ovl",
+				     "mediatek,mt8173-disp-ovl";
+			reg = <0 0x14007000 0 0x1000>;
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0>;
+			iommus = <&iommu M4U_PORT_DISP_OVL0>;
+			mediatek,larb = <&larb0>;
+		};
+
+		rdma0: rdma0@14009000 {
+			compatible = "mediatek,mt8167-disp-rdma",
+				     "mediatek,mt2701-disp-rdma";
+			reg = <0 0x14009000 0 0x1000>;
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
+			mediatek,larb = <&larb0>;
+		};
+
+		color: color@1400c000 {
+			compatible = "mediatek,mt8167-disp-color",
+				     "mediatek,mt8173-disp-color";
+			reg = <0 0x1400c000 0 0x1000>;
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_COLOR>;
+		};
+
+		ccorr: ccorr@1400d000 {
+			compatible = "mediatek,mt8167-disp-ccorr",
+				     "mediatek,mt8183-disp-ccorr";
+			reg = <0 0x1400d000 0 0x1000>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_CCORR>;
+		};
+
+		aal: aal@1400e000 {
+			compatible = "mediatek,mt8167-disp-aal";
+			reg = <0 0x1400e000 0 0x1000>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_AAL>;
+		};
+
+		gamma: gamma@1400f000 {
+			compatible = "mediatek,mt8167-disp-gamma",
+				     "mediatek,mt8173-disp-gamma";
+			reg = <0 0x1400f000 0 0x1000>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_GAMMA>;
+		};
+
+		dither: dither@14010000 {
+			compatible = "mediatek,mt8167-disp-dither";
+			reg = <0 0x14010000 0 0x1000>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_DITHER>;
+		};
+
+		wdma: wdma0@1400b000 {
+			compatible = "mediatek,mt8167-disp-wdma";
+			reg = <0 0x1400b000 0 0x1000>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+			clocks = <&mmsys CLK_MM_DISP_WDMA>;
+			iommus = <&iommu M4U_PORT_DISP_WDMA0>;
+			mediatek,larb = <&larb0>;
+		};
+
 		mmsys: mmsys@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
2.31.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
