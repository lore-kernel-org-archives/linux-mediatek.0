Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5300CD1625B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 12:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzRjb+S8zyoCwq6LpSDCmXTOKhtLT2g1jRj+6KgRZV8=; b=AsIreEg4WL3Xid
	d9fbwnRnKvTZu9JsPQtkQERo/VtXUGk0b1WOY9ctd7+GJ9j/u3Yu02KwcP6MqTCH72SL1w+kN8opY
	YmhOFza+qK6CdO7+wH7yeyp2N/TJIaepVDXcrYV32tFpn65zs5KqNLCaxgPIEzGj5S+ICkTtcclvj
	bfXoqK/BtsCvyHoYnsYYClltGZlan4FfSmFUn/MQAOBLMimbLAVUTx30ofyj5rrmdlo6g4Sqq7A6r
	W6H9bAzM9V6OloO2Has6QL7GPOH3UdVE2dtZHARVUB24cUb95Hr9XHCB2quk8YHLM6A0rPwiOSNRq
	rmlJBbrvlmqjbwJsqlnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0KVj-000000058l1-4Acd;
	Mon, 14 Oct 2024 12:49:19 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Iz1-00000004rSM-2J4d
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 11:11:28 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20c8c50fdd9so22720905ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Oct 2024 04:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728904286; x=1729509086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzRjb+S8zyoCwq6LpSDCmXTOKhtLT2g1jRj+6KgRZV8=;
        b=HUJBImDALnBaw1UH5/7meKtsIPzJdUla1y8lwIk5SeaUFfat6qC9U4nlSdUJ+BPSP8
         2THFpHP/0HdSOC7ajs0NgN724sfR3vhgo4oJGy0qpBkTavjbnCRvQzAzVAOW8vHwx0D+
         b850buL9FP7SJaMsaxdotXWQf/TTuV9ntiUpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728904286; x=1729509086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JzRjb+S8zyoCwq6LpSDCmXTOKhtLT2g1jRj+6KgRZV8=;
        b=xP+kkKg64ZX9DScmEKZOmumguAcecSthTDZ+A3IZcBLrYUh6g5jqdT7a7JTZEP934V
         Hfj5zTm//HZR8AAWoEQ2FiJ6FT6NBIsFa6MODxnYYfp6vr3c/K1V+hc+5y4shNP0ubw8
         4M/RiNdx3b8AhFY1ABTsjtVI6xwaz+8fbGwSuVMlryf8B7NJw7rvh72FqjWSto9ObJuM
         jyCkLQdcVJvdt9aXzt4inU/n3Yw1ymv0a5rG2KbG25p/Df3EdOSgvJLere3btZm+BHat
         YrCj8tXgYYkiGm+b2IsO8OrQuUp5VyQcL/Ltjmh8cknv51LS+iiNYjdhTeUQVLbsxSOU
         BLpA==
X-Forwarded-Encrypted: i=1; AJvYcCWrxz96WnJBKWD4FPV0OALm4RDkHdyZ/iDAppLzF4TWF0bdO9b/nx/CZfXihzjXN5Z8jwuvO6b3KrvK9vo1WA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yya3iYY4py+CmXMLcCFKdT7WwZ6lK8aFm2SNVUaoGJ+ydyj3nki
	nNM2nychIHNDkVbqi1Gd2J1RkR1fJac+4hRpALuwoE//X+CAyN+zknY3jASXvw==
X-Google-Smtp-Source: AGHT+IELUu+qrYGjcjMowi7359iDu4Heemy/A3/8LsSdVAlzuHR6kP5CWQn9jo3hK1Lq1jF5k4GIZQ==
X-Received: by 2002:a17:902:c406:b0:20b:6c1e:1e13 with SMTP id d9443c01a7336-20c804ee35dmr226867335ad.23.1728904286674;
        Mon, 14 Oct 2024 04:11:26 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:4907:d52a:1a1a:58d0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bc3e6fcsm63858285ad.118.2024.10.14.04.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:11:26 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 5/9] arm64: dts: mediatek: mt8188: Add JPEG decoder and encoder nodes
Date: Mon, 14 Oct 2024 19:09:27 +0800
Message-ID: <20241014111053.2294519-6-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241014111053.2294519-1-fshao@chromium.org>
References: <20241014111053.2294519-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_041127_611706_F699DD3C 
X-CRM114-Status: UNSURE (   8.08  )
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

Add JPEG encoder and decoder nodes for hardware-accelerated JPEG
decoding and encoding support.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 57f283be4402..79bb80f4b7e5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2327,6 +2327,35 @@ video_encoder: video-encoder@1a020000 {
 			mediatek,scp = <&scp>;
 		};
 
+		jpeg_encoder: jpeg-encoder@1a030000 {
+			compatible = "mediatek,mt8188-jpgenc", "mediatek,mtk-jpgenc";
+			reg = <0 0x1a030000 0 0x10000>;
+			clocks = <&vencsys CLK_VENC1_JPGENC>;
+			clock-names = "jpgenc";
+			interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&vdo_iommu M4U_PORT_L19_JPGENC_Y_RDMA>,
+				 <&vdo_iommu M4U_PORT_L19_JPGENC_C_RDMA>,
+				 <&vdo_iommu M4U_PORT_L19_JPGENC_Q_TABLE>,
+				 <&vdo_iommu M4U_PORT_L19_JPGENC_BSDMA>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VENC>;
+		};
+
+		jpeg_decoder: jpeg-decoder@1a040000 {
+			compatible = "mediatek,mt8188-jpgdec", "mediatek,mt2701-jpgdec";
+			reg = <0 0x1a040000 0 0x10000>;
+			clocks = <&vencsys CLK_VENC1_LARB>,
+				 <&vencsys CLK_VENC1_JPGDEC>;
+			clock-names = "jpgdec-smi", "jpgdec";
+			interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&vdo_iommu M4U_PORT_L19_JPGDEC_WDMA_0>,
+				 <&vdo_iommu M4U_PORT_L19_JPGDEC_BSDMA_0>,
+				 <&vdo_iommu M4U_PORT_L19_JPGDEC_WDMA_1>,
+				 <&vdo_iommu M4U_PORT_L19_JPGDEC_BSDMA_1>,
+				 <&vdo_iommu M4U_PORT_L19_JPGDEC_HUFF_OFFSET_1>,
+				 <&vdo_iommu M4U_PORT_L19_JPGDEC_HUFF_OFFSET_0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDEC0>;
+		};
+
 		disp_dsi0: dsi@1c008000 {
 			compatible = "mediatek,mt8188-dsi";
 			reg = <0 0x1c008000 0 0x1000>;
-- 
2.47.0.rc1.288.g06298d1525-goog


