Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573A0C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 11:48:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09FE5613A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 11:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09FE5613A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xm2SVbYTT7c3lizBRxXY1v5A26sRBOsG0rLqhygOHuY=; b=OWJc/qiwFGEsKEayzPHToCeuX
	zgKdHSlk5ScmudQmyYWYheSk7wIZ1r9K61lLBzs2NCbwvlUEMHGng6V2fldRlhwybekifIClrcuZA
	lePghgjJYE0qdTGrGS64LHUyVS0XmVh+uBHh/NTTybVqDdDUPVz2ECh6S1AryxVbsmyY2bQR5xtKm
	4QoOBHUxL8L4KZPY8KxuCiCEHomXf6u5m6QaK+RqsByvKMsCPhUgEmiUBp8vY91xjv2hYQ2Pg7zoM
	+E3qEDdt31FPB13mTKCdmMNK2Xn6eWynu764fbcg/tupz9RrsyXDbDGZJGKEGd/jpDbzQI0VUyR7B
	m3mCepvJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTkBV-002Qk5-Sx; Tue, 06 Apr 2021 11:47:53 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTk0b-002MxL-3N
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 11:36:44 +0000
Received: by mail-wr1-x434.google.com with SMTP id q26so8161281wrz.9
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 04:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fmDRbqtP+YDoUjuxUgyJwyFExQZfEPdy0d8S+LRWvjQ=;
 b=da/BlOh0qL3KhkDnkh1dcj+ftmfXRqcal7QU7xHXm4nFxd3BbvPE3elws20HHm4FZE
 LXOl1XXo79DzafbrvjESNds5njbnKMvuMKOJ0gN36pepbEU9vHt9QfEIwy0tTY0wU+a3
 Bepdw0FZYbZgguzsSDoBSzcZTYzsGnu/fkZmkyPqpoZTqctF3qB53jEq83Dk0/uhxaUP
 AKaakpRMQssB7EsKoH6zsjHaUJCdkiWk3TabwfNgN24EH8b7mTRL5Ttl6JmkBsP68Seq
 82xcLsEIGWny0CmJz2/iPsKIcOg3ct8bJnsEjGpla2PqmV2OCi5OBfUfB6V3MfVo4YYa
 ITYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fmDRbqtP+YDoUjuxUgyJwyFExQZfEPdy0d8S+LRWvjQ=;
 b=eOIRsJHOj5R63bOf8zZ+EqZZ7SlOzbo93NKDtW5PXSxNuLXxbJzAFZeUqw/WC4rHsR
 wxoW7Ou5f5JNrnMWFcghgVOq5GsDg+ZreyFqgkp4ACUDqsnd7ScsloIY6dsbnKNwikvt
 yN6k2e8HnXlK6uoQVfMtJSTDWDqy/ezQon/OBb/F6FyklCKkGJVeYcyu+TNQBpsB+5RU
 PQoX8clNzLSJavsC9X1WIr2AHf3sF/ddko8R4JwzpPsQclo/e92ZSoXnGMprHzaOqtSb
 crzKp2vx5dTF9FXGo+tFkndTVVUnplXzzqYymE2gHLYiJPmPVRHqFEZmu2k++o8aAcvq
 HKJw==
X-Gm-Message-State: AOAM530aJ5+FJbQgb2/+ewRreoeilodGt2b/eJ4O3cAHriePjMgT3HH6
 3O/bbalXHkYq0mCKfcFTLZU+6Q==
X-Google-Smtp-Source: ABdhPJzwWNoZ/y/OCsc+wQ/p1TbyyhKewDu+8j6fMlc7jZTDjbF0PM2NYKLa0BynpolrrbughOcVtQ==
X-Received: by 2002:a5d:5741:: with SMTP id q1mr2615875wrw.69.1617708996296;
 Tue, 06 Apr 2021 04:36:36 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id k3sm11880735wrc.67.2021.04.06.04.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 04:36:35 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: mediatek: mt8167: add some DRM nodes
Date: Tue,  6 Apr 2021 13:36:30 +0200
Message-Id: <20210406113631.2675029-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210406113631.2675029-1-fparent@baylibre.com>
References: <20210406113631.2675029-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_123637_777524_EE32E16F 
X-CRM114-Status: GOOD (  10.78  )
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
Note: This series is based on https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=v5.12-next/dts64-2

V3:
	* Removed unicode character in commit summary
V2:
	* No changes

 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 149 +++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 9029051624a6..17942095944e 100644
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
