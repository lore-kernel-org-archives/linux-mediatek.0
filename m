Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B1DCF855A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 07:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/d/o7lkyrEK7MdTXzGL48vZFksOeTQ6shmZULA6Dpk0=; b=WAHRH6npV0vA8o
	UrCIntahdSkdUL85OsI+KVpVlRtot5SUhxIIMfnttUJ/opXeqEvXuWEIg+g/ZHpkPnmUgKCgvC0yg
	R83XfKSfKeSHIMGdxdLAydYfE7zgr7ovZh3K+QBITCR+60k3tbHwYAuKY38nMp9igxhpfvZViEd1S
	zMYSFkTm1y/N5LqH7NpRqkPITqOfcUoepKpLXFjiH7ToWGoAvYGL+NlI9JyXUT11Sil+GETADELqk
	erZXNm9lFRFkc1xAVG5LGFiyYFGnE9xPmtS1v1n+3qULvt4WIDPYDs6F633mquySU2GaRxKAey9yr
	ms3Z3dsFDiEBIE8Qtdlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swFxh-00000008LzJ-1TAH;
	Thu, 03 Oct 2024 07:09:21 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swFqa-00000008KV3-2hp8
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Oct 2024 07:02:02 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-718d606726cso490535b3a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Oct 2024 00:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727938920; x=1728543720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/d/o7lkyrEK7MdTXzGL48vZFksOeTQ6shmZULA6Dpk0=;
        b=YOo37oJ7ZGD4mO9VShzZHXf3ceQ/AJJgxPLZo1+k/AHI9DzeHSGpK45w3LgNkpN6sH
         JIeLMa2593vikBW/5BQ5o5D3fYgtG6ZruZg0t3FDXxwENZSF0aQWoOqsUuXOXgiLZedB
         bgPozCvOLIlolkox6guCODbCQlznn5g6wPRQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727938920; x=1728543720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/d/o7lkyrEK7MdTXzGL48vZFksOeTQ6shmZULA6Dpk0=;
        b=gxQYAo+IfA0DbpRgt6YwJAhEopu0vyZUfXaTwpMeIbN4utRywvfuPOiR6gnhVunNVd
         4/0/I1K4jtaEcex+A/1TQbyxFAZKslknExFi60mgkaDsd0Fm04KlLcCK9p/0/fEeSaJR
         yQZaQFoIoUHnpzh/280y+X+U5ODBcn9h7dZ0fowEHSWuUOBwb3Bs1tTckjnx0fNMJTGv
         YkhlpzMjPh+nU57g1ev2sfJ8JFC2BYEeHffp9rb3MTwIBlf10rR5qL7/NEsLyvqUDqYn
         GUSykVpzu7S96Q5A+XMs1n6t0KvA2SbgWuTW1bVdV4iuI3/+RIHFb2yr0yACA+4mcYyk
         cqGw==
X-Forwarded-Encrypted: i=1; AJvYcCXJbT19m5+2jvzaesjqu7A9/o1a+Qa4JZDjvq+bWA+v6w929MBS//gF8cN3QJTZmWYlSGt0oMBf4NnMuELnow==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuH5MmSrx+lNoCeHaoGpickMf5bxftTVeaMCSVjoFnCgZbGadT
	19Zh+zQ9Ha96qjoBhns9CWbdClJhusc3KI343tl+snPAShARCZDYKT3aN6YQnQ==
X-Google-Smtp-Source: AGHT+IFh1+pRTF5QP2Z4S/FKW/7aJxh3DsNrBR5NMDBZX20D5QgF1Et4sk3LUOF99xcybVx+7A1zsw==
X-Received: by 2002:a05:6a00:a14:b0:717:81b3:4c7a with SMTP id d2e1a72fcca58-71dc5d6e0dcmr9516899b3a.24.1727938919636;
        Thu, 03 Oct 2024 00:01:59 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:3bd0:d371:4a25:3576])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d8e473sm633782b3a.81.2024.10.03.00.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 00:01:59 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 5/9] arm64: dts: mediatek: mt8188: Add JPEG decoder and encoder nodes
Date: Thu,  3 Oct 2024 14:59:59 +0800
Message-ID: <20241003070139.1461472-6-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241003070139.1461472-1-fshao@chromium.org>
References: <20241003070139.1461472-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_000200_726962_6209FD56 
X-CRM114-Status: UNSURE (   8.55  )
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
index 49d4180595a9..0eb57f95bbaf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2317,6 +2317,35 @@ video_encoder: video-encoder@1a020000 {
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
 		disp_dsi: dsi@1c008000 {
 			compatible = "mediatek,mt8188-dsi";
 			reg = <0 0x1c008000 0 0x1000>;
-- 
2.46.1.824.gd892dcdcdd-goog


