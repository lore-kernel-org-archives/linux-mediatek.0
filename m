Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D271C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 11:45:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F5FC23B5D
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 11:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F5FC23B5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q5GrlzWgKAcC9CN4nbDvQbiq6Cd3Aj56XXwG8cuvAxk=; b=gOXuJoYn6oXi5BCHSp1AGlmHg
	tyjGIZD1yS380+hNlVrtNKwQmdmMuxwEE5QB4l4RCIn+AsBmPbBg/zyYsVl8PsmPMYOmcKtO7n9Ne
	xFcAfkzddFsIca/Th1wUWlTtIym47IMU+APnXW9V04xl0IELJBSSvX97kcB+yCWlTDlmJbPZfH4SU
	d4cIrPb55Sht1R1ZbYwNGd0IsL2LoDx9KjGiwxXuRJHboY2JP9kcESVHnfdMXRTVcE8NwNrcto+Ao
	c11Q/JZJqCFxh8QEKmD5eRC+9KCS8kn7dgkz9TxGOjJiuYE7A8E+a1w4lH8H17zMizPoNMOqf8Lc6
	Eljmx4n/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmxty-00015C-Vv; Wed, 09 Dec 2020 11:44:59 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmxts-00012s-W4
 for linux-mediatek@lists.infradead.org; Wed, 09 Dec 2020 11:44:55 +0000
Received: by mail-ed1-x544.google.com with SMTP id b73so1178769edf.13
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Dec 2020 03:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AZ7wYcWUmWH+uVrdi5m11ZubeY2Wy0/H7RjJZGg6xE4=;
 b=aqX9kip9J67BsY4pqUSEZXQ/TMIQwaOOP0xcefZgGlThWPS+VU2sNeN/oEbCEBTZ2u
 6FYJ01oNYSo2AkF28wg60tISmWxKpcue92Fu8mM6H1IGfK6JLvYhO8quWwWQKaNkbmmd
 /KTJvFBabmHv8hSXWU0zUOQxUcJDrBrUHfs4GC+3yc+K8WqpmGxPZYAlz6lzGX4AC+qq
 0NZgu5NPxUKcBP6d6gu8L584maZrmI+4NK5v2KTvQ2ACTr49cRzWHFrIc+rDsxYtErJi
 g/HXOjMqRtZPb4gnt3V3bSLJEV+1aSXGkDE0ofPfIavp338fZD3OZME6nNg6dJEb8urB
 pckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AZ7wYcWUmWH+uVrdi5m11ZubeY2Wy0/H7RjJZGg6xE4=;
 b=pJwBlxphN1wczXzkNelfqwnD69E77pOEZk+PjyxVUxgzqaJXaODroXSDABGY/Sy4SK
 Ue5kPaLZWCbAvAgK8o2qb+xX1q5wwyUY24NqQQpthToIdjsF2kv7NKQ5EhOClV2Ex50L
 VHT/e0IjVeCpyOPZaRGyuTRO8YLfqZVxcZWSzN9S5Rcqg69BfCDGuKyr1qsOiVIJ8uO9
 tgzuPxbhUMzT/nqTTAx/tgjsMsHThmnAY8+pJ/u5qjqcXyz2rHtvewdu7YCIEmKodZ8l
 OFOj0kVPiewcDyvBVXhKrFpypv495prqv8kRZiVLCFtM/QuAAFWMk0cZKJWmCr88ZOxU
 Qk9w==
X-Gm-Message-State: AOAM533dqX4AUSo4bWUlDM/f2MG4Lo8evcELpp3H9qpD67ic25VDj/nD
 Q1ETY38jryPitxIi92ZIr7Q+Eg==
X-Google-Smtp-Source: ABdhPJxNqsA7hfko0K/oKynB9g7B5UaxABjUkJLiTKKQ1Ka5HzerQx5TREnQtWCg7kQ3RyD6ytVHTQ==
X-Received: by 2002:a50:8b61:: with SMTP id l88mr1629668edl.250.1607514290713; 
 Wed, 09 Dec 2020 03:44:50 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id c25sm1260327ejx.39.2020.12.09.03.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 03:44:50 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 2/2] =?UTF-8?q?=F0=9F=93=A4=20arm64:=20dts:=20mediatek:?=
 =?UTF-8?q?=20mt8516:=20add=20support=20for=20APDMA?=
Date: Wed,  9 Dec 2020 12:44:40 +0100
Message-Id: <20201209114440.62950-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209114440.62950-1-fparent@baylibre.com>
References: <20201209114440.62950-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_064453_064646_FA6EA68D 
X-CRM114-Status: GOOD (  11.24  )
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
