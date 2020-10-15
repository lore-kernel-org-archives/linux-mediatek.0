Return-Path: <SRS0=+2Q0=DW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93970C43457
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 12:33:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17CBE22248
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 12:33:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fhIHaCmV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CL0IeNyg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17CBE22248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+H4KzpLuQo82GomUPOhYGnlpfWf0+d5P/MvQUGflrAM=; b=fhIHaCmV72dg4OBb1iBoq6T2n
	Sb9nULVCC2UaT+/6CKOldWPC9HhZqJXSzQRdDftTYvG2rSnrjSybX2dj6L3aunt3c8abdQR2spM4O
	2uVpnb5iNG0aIAND3aFRACQoLFrTIi9K4XCiuR2VK8N1ZHspVdHHlQ7+LGoxqOTUshn0F48DtPi9x
	Y5E0ijY2mrne3AQ5xafDNf4yCbGA5DzqmfSWHkAtiI0Msk5cOXYaDg8elKgWdLewmJwlHSM1p6teN
	uf9LxbPBibikjjiKMADQDpB0248yS+0xWDiTSx3fwQ0yWtePn4Y1vGtpXjHCmBhgnHZwkKXq3oiDJ
	KXEGBxqPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT2Rl-0006Xv-3n; Thu, 15 Oct 2020 12:33:29 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT2Re-0006VI-F2
 for linux-mediatek@lists.infradead.org; Thu, 15 Oct 2020 12:33:24 +0000
Received: by mail-wr1-x441.google.com with SMTP id h5so3244121wrv.7
 for <linux-mediatek@lists.infradead.org>; Thu, 15 Oct 2020 05:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R6dwpPJHIiSRutrnQDaT8pB3t0nr9YNcN7bL7QingKY=;
 b=CL0IeNygAWXDyHEF5dwiKs8tsJ2RBgFNADeO0tnvF12aY/p6MjRiIBlStLJkEAdqZ8
 oo79xUd0CaQDEZtx4xzEJNBhLGZZlt+sSpf2lNdMyu+MMdPsWk58ykqLEa9aKU3oTl18
 hSXDYQsyx5y4nJfPs6TlkL3yL8IYNQzOc31PW1IkzVlvlo0YU4C1e9GzKdwu3KnVn50v
 IfzDRfw/b/HqbPdDpn1jvCQspP/jOXXBHpkV181q4LeI5FnbhjP9yw6fSvW1FIVaVabp
 Ub3ZMMo/PMY2MEB5cpo8WdJMTMmhUrmndssBLEfoUF12iJd811Vu0c+CYOANxjyb/l2d
 8bNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R6dwpPJHIiSRutrnQDaT8pB3t0nr9YNcN7bL7QingKY=;
 b=V8i1HE+YyWYmQiEp+1D4raF6isPZIzXls5mLUabrkThTOd+aTsPeBLJDIDk+QTsBTn
 BVkmbwHF9zfy0xmZYf6qGWcdyx3JufgG6WQ4M44MGndxT4KsgC5VRu0xbtoBZUYwdEiu
 KQ3jIuz4Om2RIyT33cq2eWNR22jLGKyYXpyTLxevAwTtwlG5YG7hkgqCZrVFSbx1ILE5
 qZuknh2JEi4Sik1InE+Sv4KxIXNXGdegLX1bgrPQzA/hheYN/DesOkaq4ZDPTWHPi07G
 OzXKU+3DXwLTOWnl7/Akt2WSr6P6+apodcSaEDoEngyhCAn1BtzT2AnIcMmeD+7QN/1S
 lGyg==
X-Gm-Message-State: AOAM5338k2zsmf2S2S9iypx1DMGK6gc0m+xBupv+WC/OmF7e0FIYFZLy
 njBgmdc7mjGqdVZOJ0QiW5tB8A==
X-Google-Smtp-Source: ABdhPJwn8zFW5bol5nozv7XpuQ8bkJ9yy2YxRvVgK+PZfhXBXEPqEnWgwqKL4QcFwdvP8BNFI0OqoA==
X-Received: by 2002:adf:e589:: with SMTP id l9mr4067420wrm.110.1602765201333; 
 Thu, 15 Oct 2020 05:33:21 -0700 (PDT)
Received: from localhost.localdomain (129.163.185.81.rev.sfr.net.
 [81.185.163.129])
 by smtp.gmail.com with ESMTPSA id j7sm4017406wmc.7.2020.10.15.05.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 05:33:20 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dmaengine@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8516: add support for APDMA
Date: Thu, 15 Oct 2020 14:33:15 +0200
Message-Id: <20201015123315.334919-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015123315.334919-1-fparent@baylibre.com>
References: <20201015123315.334919-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_083322_535298_92521E3E 
X-CRM114-Status: GOOD (  11.77  )
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
Cc: matthias.bgg@gmail.com, Fabien Parent <fparent@baylibre.com>,
 vkoul@kernel.org, robh+dt@kernel.org, sean.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support the APDMA IP on MT8516. APDMA is a DMA controller
for UARTs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index eca7969e15ab..a017664f8eed 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -269,6 +269,27 @@ gic: interrupt-controller@10310000 {
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
@@ -277,6 +298,8 @@ uart0: serial@11005000 {
 			clocks = <&topckgen CLK_TOP_UART0_SEL>,
 				 <&topckgen CLK_TOP_UART0>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0
+				&apdma 1>;
 			status = "disabled";
 		};
 
@@ -288,6 +311,8 @@ uart1: serial@11006000 {
 			clocks = <&topckgen CLK_TOP_UART1_SEL>,
 				 <&topckgen CLK_TOP_UART1>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 2
+				&apdma 3>;
 			status = "disabled";
 		};
 
@@ -299,6 +324,8 @@ uart2: serial@11007000 {
 			clocks = <&topckgen CLK_TOP_UART2_SEL>,
 				 <&topckgen CLK_TOP_UART2>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 4
+				&apdma 5>;
 			status = "disabled";
 		};
 
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
