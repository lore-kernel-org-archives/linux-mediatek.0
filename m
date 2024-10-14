Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48712D1625B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 12:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMU7P9+c9C3FDojD/5WNDOLh76aROvPNe+Sek9A6Ys0=; b=IXRUCD9G+EinI9
	liSN+oBsBY8Shh7Pjj6bbWumQNV1oip2jwtuzk8gLUGWYwCuyIA63YTyWddt5z0jCE4hZUSDCTlKT
	aiWtOkfkBbs2fQLS5L+t5lcJ3SOXo+2QUMD6JK+lH3ZzcrzUABztHspfWvkYxbjg+ge5yYaFNTQ2C
	leZt5a5vADv5l/ZnF+db6ajPSLMrqgMdUlUQii/eTytzKyL2Hdh6rtAWb6vQY6oJLrBLLEYP3ftLL
	TzuoSsaKej8WH62cdGfdXxAfHTDdrOSqNEiWBQ+9EOCGVIvak69RN+raiVuiq6IBkQWwlnyzleANc
	hmlWCkCk94oeaD7KAMVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0KW4-000000058rN-03Nl;
	Mon, 14 Oct 2024 12:49:40 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Iz4-00000004rTF-0kYz
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 11:11:32 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20cbca51687so16341825ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Oct 2024 04:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728904289; x=1729509089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMU7P9+c9C3FDojD/5WNDOLh76aROvPNe+Sek9A6Ys0=;
        b=c3Rl5xeocxi9DXnj85ABwWhLCzA5Vh0bjhZZTTGszbWq93v09aE8ryNpmsmxdAoSWw
         rCq+3A/OTq81MTMoZeOI5kNIR9zDgGSVKSKPZzVaFZRiIOnC6T9PfpqOjqXExeO6sjmG
         iADHXQSTyRo5M80SloPtdvxgvZu1DX2ERAkbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728904289; x=1729509089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMU7P9+c9C3FDojD/5WNDOLh76aROvPNe+Sek9A6Ys0=;
        b=tXTl75pkgWHbrljcxXsy48k/KHmoqeSHnaHIjbHylbGz5zbG/KrBsjt5gXY9tq1qd9
         n/92tUaNpPTTgvHqi8xFEbR8bYBPmEBGpL4JPUGzwnm9njrhdpya6k8uLJSd05OdMsl/
         wb1WGclA9SxgightrWt+42DqFMo8E6/wkc4WVlMXZzeLuksRhh5gF4PyPNzgZc3XEDfi
         ZnNXNdUahBBLR+Kzqb7D0iWNTJs9TSoLmSRUjEE1ljrJMZCyH3OBu4/AEOTD8kzvvtHd
         WAblerdVB68uPheE+UBv3C/DgE0TdVuC9geef8fWRjRDHT8eKxapDTys/QdspAutF2Nt
         tOzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgIVZO2En+8Oz3Gsklp3DFadVgxR0UrSZUlFMvNjkmH/FcIT9FWfRtdLjA1juoenIndmYSvaKA+8ICUEQV6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLzwXdDmocG4z5nJ1Re49KHHzVSR8nLrzD5eCVNySdpbMH32p5
	jmK33uIEnJAASlwJLcHIIbFVK8bs3MlLQ1ZsRsqfjc4WZiTSOwngoLe7OoOMjQ==
X-Google-Smtp-Source: AGHT+IHRbx+3OJFU6ui0PjOKiOvIt2/vg9YZnzOuwwuWKZ6XgEA2Dqga/WmQzdchLkAl3TGX4SSSlw==
X-Received: by 2002:a17:903:2342:b0:20c:aa41:997a with SMTP id d9443c01a7336-20cbb21ee7fmr116052045ad.34.1728904289248;
        Mon, 14 Oct 2024 04:11:29 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:4907:d52a:1a1a:58d0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bc3e6fcsm63858285ad.118.2024.10.14.04.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:11:28 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 6/9] arm64: dts: mediatek: mt8188: Add display nodes for vdosys0
Date: Mon, 14 Oct 2024 19:09:28 +0800
Message-ID: <20241014111053.2294519-7-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241014111053.2294519-1-fshao@chromium.org>
References: <20241014111053.2294519-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_041130_408614_56BF9F1A 
X-CRM114-Status: UNSURE (   9.02  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the vdosys0 display nodes to support the internal display pipeline.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 86 ++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 79bb80f4b7e5..09556225751e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -26,6 +26,7 @@ / {
 	aliases {
 		gce0 = &gce0;
 		gce1 = &gce1;
+		mutex0 = &mutex0;
 	};
 
 	cpus {
@@ -2356,6 +2357,71 @@ jpeg_decoder: jpeg-decoder@1a040000 {
 			power-domains = <&spm MT8188_POWER_DOMAIN_VDEC0>;
 		};
 
+		ovl0: ovl@1c000000 {
+			compatible = "mediatek,mt8188-disp-ovl", "mediatek,mt8183-disp-ovl";
+			reg = <0 0x1c000000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
+			interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&vdo_iommu M4U_PORT_L0_DISP_OVL0_RDMA0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x0000 0x1000>;
+		};
+
+		rdma0: rdma@1c002000 {
+			compatible = "mediatek,mt8188-disp-rdma", "mediatek,mt8195-disp-rdma";
+			reg = <0 0x1c002000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_RDMA0>;
+			interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&vdo_iommu M4U_PORT_L1_DISP_RDMA0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x2000 0x1000>;
+		};
+
+		color0: color@1c003000 {
+			compatible = "mediatek,mt8188-disp-color", "mediatek,mt8173-disp-color";
+			reg = <0 0x1c003000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_COLOR0>;
+			interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x3000 0x1000>;
+		};
+
+		ccorr0: ccorr@1c004000 {
+			compatible = "mediatek,mt8188-disp-ccorr", "mediatek,mt8192-disp-ccorr";
+			reg = <0 0x1c004000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_CCORR0>;
+			interrupts = <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x4000 0x1000>;
+		};
+
+		aal0: aal@1c005000 {
+			compatible = "mediatek,mt8188-disp-aal", "mediatek,mt8183-disp-aal";
+			reg = <0 0x1c005000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_AAL0>;
+			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x5000 0x1000>;
+		};
+
+		gamma0: gamma@1c006000 {
+			compatible = "mediatek,mt8188-disp-gamma", "mediatek,mt8195-disp-gamma";
+			reg = <0 0x1c006000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_GAMMA0>;
+			interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x6000 0x1000>;
+		};
+
+		dither0: dither@1c007000 {
+			compatible = "mediatek,mt8188-disp-dither", "mediatek,mt8183-disp-dither";
+			reg = <0 0x1c007000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_DITHER0>;
+			interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x7000 0x1000>;
+		};
+
 		disp_dsi0: dsi@1c008000 {
 			compatible = "mediatek,mt8188-dsi";
 			reg = <0 0x1c008000 0 0x1000>;
@@ -2386,6 +2452,26 @@ disp_dsi1: dsi@1c012000 {
 			status = "disabled";
 		};
 
+		mutex0: mutex@1c016000 {
+			compatible = "mediatek,mt8188-disp-mutex";
+			reg = <0 0x1c016000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_MUTEX0>;
+			interrupts = <GIC_SPI 658 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c01XXXX 0x6000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VDO0_DISP_STREAM_DONE_0>;
+		};
+
+		postmask0: postmask@1c01a000 {
+			compatible = "mediatek,mt8188-disp-postmask",
+				     "mediatek,mt8192-disp-postmask";
+			reg = <0 0x1c01a000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_POSTMASK0>;
+			interrupts = <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c01XXXX 0xa000 0x1000>;
+		};
+
 		vdosys0: syscon@1c01d000 {
 			compatible = "mediatek,mt8188-vdosys0", "syscon";
 			reg = <0 0x1c01d000 0 0x1000>;
-- 
2.47.0.rc1.288.g06298d1525-goog


