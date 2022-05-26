Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB36EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 20:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WAvQyYeIz0lq9fWuBBh8+1ILbOaSjYeOjLJc2TubqAA=; b=ARkcJFUpjzMiV/
	zONaeQyZlnazLxkZ/D2A/aSCJjLRrwh4geTti+sVqTPPzfk5v/7UNJ4hZQXLyYtgQYTDkvqKkTBvW
	B8GKV90jCFs6vcDNMThnP/onpyymTRNa/Gp4Svl8+PwkWfrIMhfcgV6zpnMnKDM1r5kmFvS2r1zCZ
	l/AO5Zgh2SftXIO2JIU0LlIQwKxfXiRVKcHAymP8H4t8rxSIWLhxIyebNC4PoHfTxDxt2JcQmoR2t
	Q0acCoA2MRrN/85kx/RZ33eRAP4SFkzBlhj3JT9P7WhjxIb5CjPUYAB50poXgjZOyjapNmsh/TWgF
	3u4P2aArqcp9vPi08JwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuKWu-00FtpM-37; Thu, 26 May 2022 20:56:24 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuKL4-00Foue-4M
	for linux-mediatek@lists.infradead.org; Thu, 26 May 2022 20:44:11 +0000
Received: by mail-ed1-x52c.google.com with SMTP id er5so3139581edb.12
        for <linux-mediatek@lists.infradead.org>; Thu, 26 May 2022 13:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XOY58nRo2FBMVZy4R9dChoRFoguqNiD/V0YfBQb6+is=;
        b=jP0bjuQktDPX6JTVbJjvC+zRgIO8NTyrFajRszjwmIwb1XAOJzbMLaoYRW4V9EiAvC
         unlwEAj2AHm1wi/ncAhOpQltINgTs8tyspxKTxa45VV/Q9qryXDtlCggrdOE05keuzg5
         SdkZ1uKmYeQ4JjSlTUnxAyZsOJS4MoGnPqC2g2TRh+wE9jGJJyLBacNOg5dZbcc8Nns0
         DujxcKG2MHdwp505Fqt4dhqJvokj5t88Tx9ZrCFJJJdBx2rrWKdK9QQgrLExp0cwzio+
         GlCCQx79fnPsReDh2OMi6GifCZ2J8Q1D6fpPp8sgJfg7YyqQf9a8S/jIp8c3LHDb6SRH
         gFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XOY58nRo2FBMVZy4R9dChoRFoguqNiD/V0YfBQb6+is=;
        b=3N4Z7of0Ndekh//7GXPk/XDFkgNYjhhePTOv16w8EWWxRaBNcoFldK7BYeQhiSjO1D
         l5aTdKnOOQ4HBDn9pyiwOaHzOXurKAUyf46HMU4MGueD0f+CvR1GJmazitczP9LYKWmr
         s6ZTkX0PAoNTSimzCQAOw7XEhQXbZJ10CL7ryqw6YMUX4qlZtv7rIVqiZFnKQnr5t/BR
         sYxHg0nh7kSJuPxZ6ARezY3mQ//KyNHYCgoFpD9khjUUaPVy9s99+qrKKgYg9FpgYmRP
         aqvuqkU7Yt2F5O2IAEI+GwjskckG0NWPDTtbVPIf6SuaBoBEuivwcroh+dE3mKPJ9Iv8
         8kjg==
X-Gm-Message-State: AOAM531yedulzvyHuVu+jzls773O4gJ31DVTuhHMtb1+yeP6TUhl/Kmc
	47psO3p4MdoeBqjtsGtmz3NEVQ==
X-Google-Smtp-Source: ABdhPJyrLaR89tqeL23Sv2113VdbG8ErSnQMN2ndTBmG7bJIm8BHM2LMNk1k5z6mSMinJ7S/qaYvBw==
X-Received: by 2002:aa7:dbc1:0:b0:42b:77a2:4f81 with SMTP id v1-20020aa7dbc1000000b0042b77a24f81mr19418697edt.287.1653597849731;
        Thu, 26 May 2022 13:44:09 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i15-20020a1709061ccf00b006fec5cef701sm803475ejh.197.2022.05.26.13.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:44:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: mediatek: adjust whitespace around '='
Date: Thu, 26 May 2022 22:44:02 +0200
Message-Id: <20220526204402.832393-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204402.832393-1-krzysztof.kozlowski@linaro.org>
References: <20220526204402.832393-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_134410_225693_3726C4A9 
X-CRM114-Status: GOOD (  11.48  )
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

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm/boot/dts/mt2701.dtsi | 8 ++++----
 arch/arm/boot/dts/mt7623.dtsi | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index ef583cfd3baf..b8eba3ba153c 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -427,9 +427,9 @@ audsys: clock-controller@11220000 {
 
 		afe: audio-controller {
 			compatible = "mediatek,mt2701-audio";
-			interrupts =  <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>,
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>,
 				      <GIC_SPI 132 IRQ_TYPE_LEVEL_LOW>;
-			interrupt-names	= "afe", "asys";
+			interrupt-names = "afe", "asys";
 			power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
 
 			clocks = <&infracfg CLK_INFRA_AUDIO>,
@@ -559,7 +559,7 @@ jpegdec: jpegdec@15004000 {
 		compatible = "mediatek,mt2701-jpgdec";
 		reg = <0 0x15004000 0 0x1000>;
 		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
-		clocks =  <&imgsys CLK_IMG_JPGDEC_SMI>,
+		clocks = <&imgsys CLK_IMG_JPGDEC_SMI>,
 			  <&imgsys CLK_IMG_JPGDEC>;
 		clock-names = "jpgdec-smi",
 			      "jpgdec";
@@ -573,7 +573,7 @@ jpegenc: jpegenc@1500a000 {
 			     "mediatek,mtk-jpgenc";
 		reg = <0 0x1500a000 0 0x1000>;
 		interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
-		clocks =  <&imgsys CLK_IMG_VENC>;
+		clocks = <&imgsys CLK_IMG_VENC>;
 		clock-names = "jpgenc";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
 		iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index f4848362b3be..25d31e40a553 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -241,7 +241,7 @@ infracfg: syscon@10001000 {
 	};
 
 	pericfg: syscon@10003000 {
-		compatible =  "mediatek,mt7623-pericfg",
+		compatible = "mediatek,mt7623-pericfg",
 			      "mediatek,mt2701-pericfg",
 			      "syscon";
 		reg = <0 0x10003000 0 0x1000>;
@@ -628,9 +628,9 @@ audsys: clock-controller@11220000 {
 		afe: audio-controller {
 			compatible = "mediatek,mt7623-audio",
 				     "mediatek,mt2701-audio";
-			interrupts =  <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>,
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>,
 				      <GIC_SPI 132 IRQ_TYPE_LEVEL_LOW>;
-			interrupt-names	= "afe", "asys";
+			interrupt-names = "afe", "asys";
 			power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
 
 			clocks = <&infracfg CLK_INFRA_AUDIO>,
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
