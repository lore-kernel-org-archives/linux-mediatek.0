Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68EEC4361B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 11:47:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81CCE23B5D
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 11:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81CCE23B5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l2GFyVgs+QRmjGaB/JWWlaRt9Dk4iihT/FU8eqz0Z4U=; b=PXygw2GFxEF1k9jc6R7dVybyD
	Y8NWAa4d1bMa8lJ/g1+Rv5Y8/6jgkIxWE4nQDlDSx+dUj2k82t7evAOGi2KUSK/yOiJXxXXO+qhch
	rtGSscBxfrl8EKLTZg8ZeK3h8ldPqSfk0DamvhurE+sS/RNIi67y9BhKF8GsGBuaNG7vSEg3MKIV9
	0Wi66uUV+qHOSlWium0Ot+xJikBv0xe0Bql7XKpBPxd9QSSOuRKRJjiyXjiNvAXCwtXYsUxxbfOXz
	VFyjc0AswYKKbnGxf0FaDSbugygG1ui+7+q0aeP0++g1YCXVJ+oMBeEYGQJurAg9wq0cLbVxj2DQE
	/UCY2xrQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmxwh-0001U1-O2; Wed, 09 Dec 2020 11:47:47 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmxwd-0001SR-KE
 for linux-mediatek@lists.infradead.org; Wed, 09 Dec 2020 11:47:45 +0000
Received: by mail-ej1-x642.google.com with SMTP id qw4so1656187ejb.12
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Dec 2020 03:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9woAOYYUTApfHEXuDyQxlO3UMapZTcSjzqhS/D3AjbE=;
 b=H1MYjEBUHXsEmRB5zK3lrIfUDCESZ/yUle4xUxQpR2/3Uefg9+OmJZPu5Y1tGst44h
 KASM+xB37usilH2dPzK/Gm9MsuKZ7Q0Q6PjWN9BRw2ywD2+HeGPYB3Zj3WfMntMDT2e4
 ticNha5B96fMZ2qOr5ZFZTzsRgkDApr8sHUbOiObz1/EVXaxMbSlAIyynriuzC1HyWdq
 VCBgmAqaxgVcI8DZa35fhFk2sRPGLBb0RDVDiZ3ickoHiWmCHxaj4lA97aIebFkf9exZ
 bHkZu8z7JjMJLwXegEfxCS4VaQ5G6WPDxDhwxCacSHSopwfz5HPljMlgyTvTsJIWmufP
 XcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9woAOYYUTApfHEXuDyQxlO3UMapZTcSjzqhS/D3AjbE=;
 b=sFK+vOV1bCABsuvt+xMEVpvs4bHNyv+JfG5sFh2YtNXCv6M8WVW6f+8spwqd1HUSSH
 pM9LbQVwye5fauIfOgnZOmnPDcVuom9J1vKpGIUvEhesz96HpUVrUBEScs1K1YOK+xZ8
 0koujeNKKuPqVc31xkYSppdPNGNUYs2uyDTt642Tyo+xyIWZfc2ogC3fSNkc3inPh00T
 +IAiEUpltxkf/C5/4F6bU95ygJc6hr0wn1zDGqP4DkWRMs14ty2V0DGoeV6k4hx9hp9w
 esZEdGRRe/IOIxxLD9q0X3Icyo/65aMiT+dOs4dRnhl+/I4TaBNlaz2Sl+ReI9Wc4VHl
 A5dA==
X-Gm-Message-State: AOAM532jY+/qTu9tSlAhFbz2cGWX6LIVsYuBoSZTDPjIp5QnVIusPd5P
 PJ7Ftla737i02GfK62rfnomjpQ==
X-Google-Smtp-Source: ABdhPJwpP09moR3fOdYGPHtxzsHg0Xp80bWTYrzjqN1vN7fhPy8dIyqyuRU2qzTh7XSFbgSRvI0QDw==
X-Received: by 2002:a17:906:391b:: with SMTP id
 f27mr1665544eje.195.1607514462330; 
 Wed, 09 Dec 2020 03:47:42 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id k23sm1244877ejs.100.2020.12.09.03.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 03:47:41 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 2/2] arm64: dts: mediatek: mt8516: add support for APDMA
Date: Wed,  9 Dec 2020 12:47:36 +0100
Message-Id: <20201209114736.70625-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209114736.70625-1-fparent@baylibre.com>
References: <20201209114736.70625-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_064743_703023_194EE9C9 
X-CRM114-Status: GOOD (  12.06  )
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
Cc: Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support the APDMA IP on MT8516. APDMA is a DMA controller
for UARTs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

V3: remove unicode symbol that slips into patch summary
V2: Add missing dma-names properties on uart nodes

 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index e6e4d9d60094..b80e95574bef 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -276,6 +276,27 @@ gic: interrupt-controller@10310000 {
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		apdma: dma-controller@11000480 {
+			compatible = "mediatek,mt8516-uart-dma",
+				     "mediatek,mt6577-uart-dma";
+			reg = <0 0x11000480 0 0x80>,
+			      <0 0x11000500 0 0x80>,
+			      <0 0x11000580 0 0x80>,
+			      <0 0x11000600 0 0x80>,
+			      <0 0x11000980 0 0x80>,
+			      <0 0x11000a00 0 0x80>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 98 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 99 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 100 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 101 IRQ_TYPE_LEVEL_LOW>;
+			dma-requests = <6>;
+			clocks = <&topckgen CLK_TOP_APDMA>;
+			clock-names = "apdma";
+			#dma-cells = <1>;
+		};
+
 		uart0: serial@11005000 {
 			compatible = "mediatek,mt8516-uart",
 				     "mediatek,mt6577-uart";
@@ -284,6 +305,9 @@ uart0: serial@11005000 {
 			clocks = <&topckgen CLK_TOP_UART0_SEL>,
 				 <&topckgen CLK_TOP_UART0>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0
+				&apdma 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -295,6 +319,9 @@ uart1: serial@11006000 {
 			clocks = <&topckgen CLK_TOP_UART1_SEL>,
 				 <&topckgen CLK_TOP_UART1>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 2
+				&apdma 3>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -306,6 +333,9 @@ uart2: serial@11007000 {
 			clocks = <&topckgen CLK_TOP_UART2_SEL>,
 				 <&topckgen CLK_TOP_UART2>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 4
+				&apdma 5>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
