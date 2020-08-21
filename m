Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCD0C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:37:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A10D920738
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:37:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xAnCWSOR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZlKQmE5h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A10D920738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hhiFx1lMtrGrGDTy6R6sedNpVHOZc9VXA2jJ90fKDlU=; b=xAnCWSORXVAJxB2H0Eq30qHiq
	VjkB2heSD+gHMTKtEADYlYgekamSu2RMgZ4H5WDNXBD9KN7kQsqO/8GplZnyCtPRnjRJrauS5IV7V
	vpG65NHXy43I/Kh5keKx1SeL24hsIomXannjtHkIUCDJ024JZDdlyZAnaAS2XtOhLJ/ocDUzCQjvl
	087VcTWtdzjH1peX+cL8F6QkVSruvsmjDV5fq4OixrYGsXoVAmIDOQWBLkhtCXiSLAWtQjxg9yVvj
	WsyqL8/wGGYTAEu1eQq+CTxFSrBDCsYcMeb3J+2gtWoNcBLycsJqKL49nEEuKcDfMvepu6AX6flHH
	EhlUqUhjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k94Q0-0002Ic-Qz; Fri, 21 Aug 2020 10:37:08 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k94Px-0002Ew-2I
 for linux-mediatek@lists.infradead.org; Fri, 21 Aug 2020 10:37:07 +0000
Received: by mail-pl1-x642.google.com with SMTP id bh1so682936plb.12
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2020 03:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0ogu4zyI9T8PI1xsyrjjgzgW28SyITF1aMpk9WZWLBQ=;
 b=ZlKQmE5huNd3UC53+O+Z+U4Qjo+JXEG8uEmbtaFdRBZ6vfyId9xLnIiSmQBMFiaSCw
 OpJoP4ZvIjPV1X5EmqOuc0/oJ78KXHxxWHukmwYwHMLZTiJ38A0Y/4IA51915uLewcAD
 8IKcKsIwyModqp0ppwQtyBh+5CXGDdjO8HkAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0ogu4zyI9T8PI1xsyrjjgzgW28SyITF1aMpk9WZWLBQ=;
 b=gZgAvAvZjiKQjSFpVOaw84hykXrpvkwW7ArCgTqi/MEzGAH5Iqh0hNCoDNx8n3hYNC
 RKaz/SbuoBPx8eup+LWC6wLKlyJliR9U0sxvopEqmww6Yy4YWPWUvxxE/IP97+IkeqEJ
 GlmYC9Bcol6cmU7TeRWbQ3x1t3pG4U3SpNWWc5jLvhkssmt+F+hF+o37hxIEaPwNGIH2
 Z/6lKffHn1Nd9fB0wpkET1ruY8sJ8BqvoKSppfsTKrb2I1QUs74qQOwFLt/Z5mrv8ex7
 B+wVBNohdfkN2EpOKjm9H+XRmw8Jl7t3+JhWHLmhRISq1ZURYfdkgDgLa2yWzlCZPUnX
 s1KQ==
X-Gm-Message-State: AOAM531IQ1UMz/H/949UuCOJ9o1g6OCCtNrNXbOxV8XOP/gWXvB+uU6B
 qOe+ZIvhFp+FQgA2t4kiVo0d7Q==
X-Google-Smtp-Source: ABdhPJwzVHeP+hwx4rJ5StG4oZ7I43tyoQQQKXOz8JI7yIRHhQyvnjPhPiwUhan5FhWHmdG6bLPBig==
X-Received: by 2002:a17:902:b098:: with SMTP id
 p24mr1833850plr.255.1598006223130; 
 Fri, 21 Aug 2020 03:37:03 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id y20sm2081525pfn.183.2020.08.21.03.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 03:37:02 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 09/17] arm64: dts: mt8183: add encoder node
Date: Fri, 21 Aug 2020 19:36:00 +0900
Message-Id: <20200821103608.2310097-10-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200821103608.2310097-1-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_063705_822472_60B81A6A 
X-CRM114-Status: GOOD (  12.22  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Now that the MT8183 encoder driver is ready, add its DT node. Also pull
the iommu and scp ones, which the encoder depends upon.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   | 10 ++++++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 12 +++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 36 +++++++++++++++++++
 3 files changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index ae405bd8f06b..9e77b420eee8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -25,6 +25,16 @@ memory@40000000 {
 	chosen {
 		stdout-path = "serial0:921600n8";
 	};
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		scp_mem_reserved: scp_mem_region {
+			compatible = "shared-dma-pool";
+			reg = <0 0x50000000 0 0x2900000>;
+			no-map;
+		};
+	};
 };
 
 &auxadc {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index f0a070535b34..3c763be658da 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -90,6 +90,18 @@ pp3300_alw: regulator6 {
 		regulator-max-microvolt = <3300000>;
 	};
 
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		scp_mem_reserved: scp_mem_region {
+			compatible = "shared-dma-pool";
+			reg = <0 0x50000000 0 0x2900000>;
+			no-map;
+		};
+	};
+
 	max98357a: codec0 {
 		compatible = "maxim,max98357a";
 		sdmode-gpios = <&pio 175 0>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 102105871db2..8f77eea6df27 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8183-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/memory/mt8183-larb-port.h>
 #include <dt-bindings/reset-controller/mt8183-resets.h>
 #include <dt-bindings/phy/phy.h>
 #include "mt8183-pinfunc.h"
@@ -339,6 +340,25 @@ pwrap: pwrap@1000d000 {
 			clock-names = "spi", "wrap";
 		};
 
+		iommu: iommu@10205000 {
+			compatible = "mediatek,mt8183-m4u";
+			reg = <0 0x10205000 0 0x1000>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
+			#iommu-cells = <1>;
+		};
+
+		scp: scp@10500000 {
+			compatible = "mediatek,mt8183-scp";
+			reg = <0 0x10500000 0 0x80000>,
+			      <0 0x105c0000 0 0x19080>;
+			reg-names = "sram", "cfg";
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_SCPSYS>;
+			clock-names = "main";
+			memory-region = <&scp_mem_reserved>;
+			status = "disabled";
+		};
+
 		systimer: timer@10017000 {
 			compatible = "mediatek,mt8183-timer",
 				     "mediatek,mt6765-timer";
@@ -772,6 +792,22 @@ vencsys: syscon@17000000 {
 			#clock-cells = <1>;
 		};
 
+		vcodec_enc: vcodec@17020000 {
+			compatible = "mediatek,mt8183-vcodec-enc";
+			reg = <0 0x17020000 0 0x1000>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_LOW>;
+			iommus = <&iommu M4U_PORT_VENC_REC>,
+				 <&iommu M4U_PORT_VENC_BSDMA>,
+				 <&iommu M4U_PORT_VENC_RD_COMV>,
+				 <&iommu M4U_PORT_VENC_CUR_LUMA>,
+				 <&iommu M4U_PORT_VENC_CUR_CHROMA>,
+				 <&iommu M4U_PORT_VENC_REF_LUMA>,
+				 <&iommu M4U_PORT_VENC_REF_CHROMA>;
+			mediatek,scp = <&scp>;
+			clocks = <&vencsys CLK_VENC_VENC>;
+			clock-names = "MT_CG_VENC";
+		};
+
 		ipu_conn: syscon@19000000 {
 			compatible = "mediatek,mt8183-ipu_conn", "syscon";
 			reg = <0 0x19000000 0 0x1000>;
-- 
2.28.0.297.g1956fa8f8d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
