Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27950C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 15:13:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAC7660E93
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 15:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DAC7660E93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Db1lqFG+xbHpc5RCQofnBpqqZDb8wb1GWQk0bkGyJ08=; b=KjWqpZc1KTsTYz
	m1x3KGgfKeGq9UOMiamkNIIsq9xyY21qc1UtLJhTTQKkiis/3EaKcxta9Nc0A4OiT6jO8thRwb7KP
	fcNRA4QAcM5Nub6t/gqXR/rr2FK7FQwR0BtXtR3YnuvBLN8szuZylN9G/pdFXPx++HVRMUGQC5feK
	9QR6UWAWtQAsPhitUCuSF3hS+DvAI4VvRJvZgwHPkSQz2Mcn3KAzSzMUXF92wBMmB4R+NnNnRydGB
	Ig4nhaPX9ppg0/eudXAOiuTAbV2Hf+w+AssH+Am8PEU+iMffMZmAPEomk40fl0FK8ZBHIaf560O0x
	CqbXOfFwFsUMKpkOQJGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGjjl-008kwv-9c; Thu, 19 Aug 2021 15:13:45 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGjiC-008kEH-Vd
 for linux-mediatek@lists.infradead.org; Thu, 19 Aug 2021 15:12:13 +0000
Received: by mail-wr1-x435.google.com with SMTP id v4so9582027wro.12
 for <linux-mediatek@lists.infradead.org>; Thu, 19 Aug 2021 08:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+6dCR2Sy8mCxrAUvzFLxowXAhP/YWerIYxie+COUDA8=;
 b=D+qk5dlqFo0jmmTxYR8xlL6FOklZcMqO5iPvRvAlfi5N/HEdno4ZYQBdAVJuXM+B2Z
 befESi5L9nqCWmXPT2+GfckVRrmOz8Bbs2IEhGvuf7RnfBA9/trCPrWm2ufAJekGfAS+
 qGaLA7OY3GFofgLlHEIA8uwEN5uPbJ+AEpXa9Tb63g044wljrq4tC5p6UkndlVP2jo4m
 XigVJmtNRMkNsRG4xx5FUx18cdKI6sNA/VH2oQ+nxQb2eBykWlJZbYUeUAsjag0f20Qn
 2/HgNE8vZi/S2wROXbBzXKiGbw28ZrHVO1U0QixHX+oXyHMD9z9OiCM2yJyJRVWnp/Ku
 Frhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+6dCR2Sy8mCxrAUvzFLxowXAhP/YWerIYxie+COUDA8=;
 b=m9uNs6V6mtWGT86sCigdl70BKigBUnmBXHVoxpz76y5gqJ0mSxaC5aovhSE83sEm2I
 2M5qXo4wsUSgI1JpC5nnrp6MYDAoublTKMMbCaJty+E47rS7VXn3pmxshbrYzBH2bwbe
 4BWzYkR+ivfXiMCD5hSQ4Q3QwGiWKFYdeNZmzrM51A23vnsF1jA8Rghjuj4zK8wf0VRk
 D2ievVrbfBLsbbvc8RYAS+CrNlvKddVE4Pa9/5aEDvJv45owr0YuRCbGbiCn9ntV14xn
 74GyoRq4hAW9AGGPYhsigLiICn2b0Bzc945WpK8Bb5zmzM3S1Y69ah45qjkVu+oyT93/
 pFkg==
X-Gm-Message-State: AOAM530onRbPbeUOo0G/RZrbCANetSH02kHmmGaccBZxZ3f1aJTLnDO3
 T0tiMo9KW9JNRk7Aw/kBTpb3iw==
X-Google-Smtp-Source: ABdhPJx+KruGbNeoNNy4aHQddQo1BqnAXWQBy1dX6kFWZdVEtQ3tSFx9ReF6fkb5oze+BzJ52AboeA==
X-Received: by 2002:a5d:6908:: with SMTP id t8mr4484675wru.182.1629385927100; 
 Thu, 19 Aug 2021 08:12:07 -0700 (PDT)
Received: from alex-xps13.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j37sm1556962wms.39.2021.08.19.08.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 08:12:06 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 robh+dt@kernel.org
Cc: matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stephane.leprovost@mediatek.com, gpain@baylibre.com, khilman@baylibre.com,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v3 4/4] ARM64: mt8183: Add support of APU to mt8183
Date: Thu, 19 Aug 2021 17:13:40 +0200
Message-Id: <20210819151340.741565-5-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819151340.741565-1-abailon@baylibre.com>
References: <20210819151340.741565-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_081209_082959_F1D01A50 
X-CRM114-Status: UNSURE (   9.70  )
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

This adds the support of APU to mt8183.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 .../boot/dts/mediatek/mt8183-pumpkin.dts      | 48 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 40 ++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index ee912825cfc60..7fbed2b7bc6f8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -37,6 +37,42 @@ scp_mem_reserved: scp_mem_region@50000000 {
 			reg = <0 0x50000000 0 0x2900000>;
 			no-map;
 		};
+
+		vdev0vring0: vdev0vring0 {
+			compatible = "shared-dma-pool";
+			size = <0 0x00008000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1 {
+			compatible = "shared-dma-pool";
+			size = <0 0x00008000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer {
+			compatible = "shared-dma-pool";
+			size = <0 0x00100000>;
+			no-map;
+		};
+
+		vdev1vring0: vdev1vring0 {
+			compatible = "shared-dma-pool";
+			size = <0 0x00008000>;
+			no-map;
+		};
+
+		vdev1vring1: vdev1vring1 {
+			compatible = "shared-dma-pool";
+			size = <0 0x00008000>;
+			no-map;
+		};
+
+		vdev1buffer: vdev1buffer {
+			compatible = "shared-dma-pool";
+			size = <0 0x00100000>;
+			no-map;
+		};
 	};
 
 	leds {
@@ -381,3 +417,15 @@ &scp {
 &dsi0 {
 	status = "disabled";
 };
+
+&apu0 {
+	memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>;
+	memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1";
+	status = "okay";
+};
+
+&apu1 {
+	memory-region = <&vdev1buffer>, <&vdev1vring0>, <&vdev1vring1>;
+	memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index f90df6439c088..bf3f315ad3b2f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1447,12 +1447,52 @@ ipu_adl: syscon@19010000 {
 			#clock-cells = <1>;
 		};
 
+		apu0: apu@0x19100000 {
+			compatible = "mediatek,mt8183-apu";
+			reg = <0 0x19180000 0 0x14000>;
+			interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_LOW>;
+
+			iommus = <&iommu M4U_PORT_IMG_IPUO>,
+				 <&iommu M4U_PORT_IMG_IPU3O>,
+				 <&iommu M4U_PORT_IMG_IPUI>;
+
+			clocks = <&ipu_core0 CLK_IPU_CORE0_AXI>,
+				 <&ipu_core0 CLK_IPU_CORE0_IPU>,
+				 <&ipu_core0 CLK_IPU_CORE0_JTAG>;
+
+			clock-names = "axi", "ipu", "jtag";
+
+			power-domains = <&spm MT8183_POWER_DOMAIN_VPU_CORE0>;
+
+			status = "disabled";
+		};
+
 		ipu_core0: syscon@19180000 {
 			compatible = "mediatek,mt8183-ipu_core0", "syscon";
 			reg = <0 0x19180000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		apu1: apu@19200000 {
+			compatible = "mediatek,mt8183-apu";
+			reg = <0 0x19280000 0 0x14000>;
+			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_LOW>;
+
+			iommus = <&iommu M4U_PORT_CAM_IPUO>,
+				 <&iommu M4U_PORT_CAM_IPU2O>,
+				 <&iommu M4U_PORT_CAM_IPU3O>;
+
+			clocks = <&ipu_core0 CLK_IPU_CORE1_AXI>,
+				 <&ipu_core0 CLK_IPU_CORE1_IPU>,
+				 <&ipu_core0 CLK_IPU_CORE1_JTAG>;
+
+			clock-names = "axi", "ipu", "jtag";
+
+			power-domains = <&spm MT8183_POWER_DOMAIN_VPU_CORE1>;
+
+			status = "disabled";
+		};
+
 		ipu_core1: syscon@19280000 {
 			compatible = "mediatek,mt8183-ipu_core1", "syscon";
 			reg = <0 0x19280000 0 0x1000>;
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
