Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D6FCF31B7
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 11:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M1kvp0VcH49Dd7pUdjrxa7BKtPwxncHiMFzmQPvOHBw=; b=jQSqx+Yjo3DyOe
	zxqWVcTsR+CR5T4YCZNQ8hbP314zh0cFeqa2GsNGfoSbIB2RgoMX9wNWtyvJf1ggaEaiKFdF1Uj7+
	lkFbyWpRMxaxTIsxvd4YiD04fEwcRPd9DcAh42WGinUeD3PkyI1VBN7Z7EZTEaSs8CQ2ygBtppKAh
	hbWURaVxnC9dAy0C0eM40skjQtRDgU8Vkwe+FE2kCfWmtMACGF0yavFQ5aA+giv16j/fa9IawRKjw
	SbQYXm3ctQbGBzj91cNA+UuAYoNFg7lv/DSGcmU0gG9mR6vcVzMHnoFM9edCnf6AylX4Cc1vlFsn8
	14NZycESVwRwfdM/nRKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svxun-00000005jSO-3YiO;
	Wed, 02 Oct 2024 11:53:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svxow-00000005hwc-1iNX
	for linux-mediatek@bombadil.infradead.org;
	Wed, 02 Oct 2024 11:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=M1kvp0VcH49Dd7pUdjrxa7BKtPwxncHiMFzmQPvOHBw=; b=ZcOqFzemXUvBIpZHYGommw+K5k
	m4YdNDCQYURpyhpYwIO6ouoII8zvV+8pUdD6D6O2X0kD3hYMYZ3CR/S3XhLk4gR9pq12j32uu5P9Y
	58886i24Lim6WxhdYjeOrMC7yug9Q5aKnDkjuKYfRzDUCFM9ejMxTuWBDmNvi2uMA1v18JXblL68G
	IM/2UuoVAo/WFVzGhDLuJTPbA+2ffXysSCZao28/neRTANStKjsT6oHdOPDw3CMaQoaCtACjcPg8i
	g3rDOFg9B3WvGBe+6O6hSg/2p/TkkwBoZK5WAZJfHVXYZRgxQIUbJrRlJdqGygRT7x4maHbwW/vR9
	QIhh8bjQ==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svxot-00000003TjV-1rNH
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Oct 2024 11:47:05 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-718e285544fso5119875b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Oct 2024 04:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727869622; x=1728474422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1kvp0VcH49Dd7pUdjrxa7BKtPwxncHiMFzmQPvOHBw=;
        b=aKWw7wBqK5J/xgmvP28f3A/sYsZoYjzQUD9Ei9D5CTPsHpbyYPWERFCh8gKnjsbB7u
         7KG9o0ZAMRv/zJ6Uqd6dH5iED7dmS3deVuLxvGFUv0UY5HE9sa5n24zWzrporJJA4Qqi
         FiXK4Ro9eA/SNjjzuGV19JJgrwK2DrSXgrnFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727869622; x=1728474422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1kvp0VcH49Dd7pUdjrxa7BKtPwxncHiMFzmQPvOHBw=;
        b=dUimK6x44rswc5gma3JShUSZJDOMsBcZZtzRFENu23kaaYbhj1hclp4kkGNcOERqZw
         Ibxn0iWTuE6A7N9DAsMUqFWKvXb0Dh1R1aiPq9YoBuccqMZei4iw3OKnlpaUbEBU56Cr
         Q9/EvNMcbDm1sWSpcQEjvBWLYMWEe1YzFn9/lrS3bWB2B28SZWq7uTk2ydbuDu4d5stM
         8dwcGBaC5rCM7U88efJo3DpWbU83nRPE4E21G/ku52Ls2/yNdF+0k/MpuiokvTcYIDgf
         6O8AcU6fePT6lg/8HFejqIwD1F8qepkyvHTHsH2w+uKKvX45GkrSiRpLinFJBaXagkXQ
         f3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUvporJMUr/vGoZSQxkSNa28FJHn8azuGLDkBBozLGcb4nG5Q/dsNBPsbamLLKr7W7gBLvSCSh84qlYLlAnRg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0JYTe79sctTscSF2XlRjygUZPnyJQ7cN+y3u1tpw3n8HaAyPD
	SLi3qlUY8n4jlR9sgOTQs3YJarSRS1FSYF7kdxzhE/b3ULeR6nYVao4zbVnLwA==
X-Google-Smtp-Source: AGHT+IF6Sqgx1tY88G1e9K/KXewRN0uZSr4m6+KJokFU2mORUavDZPLIjw+Q/puV3XntoKVReVaLgg==
X-Received: by 2002:a05:6a00:2d88:b0:714:186a:ae0b with SMTP id d2e1a72fcca58-71dc5d6e144mr4961081b3a.24.1727869621952;
        Wed, 02 Oct 2024 04:47:01 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:3bd0:d371:4a25:3576])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2652baefsm9639627b3a.180.2024.10.02.04.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:47:01 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 5/9] arm64: dts: mediatek: mt8188: Add JPEG decoder and encoder nodes
Date: Wed,  2 Oct 2024 19:41:45 +0800
Message-ID: <20241002114614.847553-6-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241002114614.847553-1-fshao@chromium.org>
References: <20241002114614.847553-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_124703_637208_F0A8A6D0 
X-CRM114-Status: UNSURE (   9.32  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add JPEG encoder and decoder nodes for hardware-accelerated JPEG
decoding and encoding support.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index dbea562ee8ba..c1b057166aa3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2315,6 +2315,35 @@ video_encoder: video-encoder@1a020000 {
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


