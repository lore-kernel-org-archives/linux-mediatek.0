Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B51C25B76
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 08:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzCw56uBajgoPcSKxbxBOTmVAmxJFjZGHkEQgNNQnIk=; b=hbGhpfW5mK1azx+jkAvuXPAZl9
	fuJL5Dy3W/Z1PAK4AYbb/nBMmMFSyIJrlM0CwucorpE7aMSHhSspfbkt/hZXD8GJoLOhcsl01abET
	7IgkUQSMKT3AbCJTWU1l4hofWbR6V7GvbOciXDEpLBKsAQbLQVjm/ipzDMchAHT7Qw19aq8F1WWfK
	td17f9EpOdIaRm+N2nhFgs7RnWUD3fjG3e2+OqS64faIivo4tlFtEr4dp3xse3n4yS0mPHjassNeO
	VvsauQIGZMLOxvD3SZB8cPLNB2xExLo1S3NDbTPeywYrN8jBw6CHsDOzeoajy/yrPLEwbHYQHgRzr
	d0Jr0hKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEmQB-00000005Ieb-3N29;
	Wed, 05 Jun 2024 08:55:03 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEmQ4-00000005IZn-3QuN;
	Wed, 05 Jun 2024 08:54:58 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a68c8b90c85so463833366b.2;
        Wed, 05 Jun 2024 01:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717577694; x=1718182494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzCw56uBajgoPcSKxbxBOTmVAmxJFjZGHkEQgNNQnIk=;
        b=lgvBsYxaRRfQRBTuU+kSzk5pmqLNubc3rgxdJ7Qdlet7idSgrXDqIrpUumv1JruHBO
         o9bnwd82M1QiFCbEq0TY4w6pqxN3O5dNVhju/dM5GYdBeGXLN8/6epQPBfsIJLaI4bcF
         SZob0Ov5juv9cIVmCbNhs45gQD5RYw6psjIab2CkZjzrgWTThtekaFD4MX7ZwlDNuuvy
         9OSNveMXj91MNHcO3R3o/l2mUrZ4IqllseAM/FyzfLX76HsKA+ncBy/8oCH28FK7uBzu
         jO6M69fQCdyJ0fyqFrthXYO/xZCR8BawrD53f5KmwGzxYxfL+F+SH6PKZGcLsfbx2Sab
         sfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717577694; x=1718182494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzCw56uBajgoPcSKxbxBOTmVAmxJFjZGHkEQgNNQnIk=;
        b=BbBHkZB1qWYnihv8SvRvLdqZzPjSXMTUWgcK0kn9HbP+bkLNiv/KV6wUGCx0H92CRR
         AxMQX30kIiHcwznhpyE/XVnJMWdQaM89waES/BXoayjm2h4UyXaUQgGHhLdgoZ3wj/On
         wdcOm6stlmGolZRG1qEyNuo0jgWG/5OLGUfOravLTJycHkJ0yTqEIkfy0Ll3IH+1efOk
         b5JjnrWoM7ruhrsaasN8sZnNEdiu7CduN71BRgq+QdxM81UzI0qUFa9fpgtqElOtU4h1
         NQhzrKgrY1DeXm3R59bjRL6h5jwNTXHZOVeOqXHOoZxfLZZbcz5aSamwmLA7+MmWTcM1
         FSaw==
X-Forwarded-Encrypted: i=1; AJvYcCWe1B12Nfrd/jVD+WLbLEzdEwAuGGajqsaIwAlnlNGORTTy3TUw5WdVnGEkSBbLJeVwymmQv7QsQA2oR1zpmz4n0B44pwaMcE1qAYpX+nBUfjp2mcoIBJYSuSo5Vk5hw1H6AVTxkJwFJWi6b9phZwoeBMzU4IHeKew=
X-Gm-Message-State: AOJu0YzfHdyKKjpiPIYcrWIp5FD2V8NT7c7zRUQm/E+QZZTLrDT34OkG
	fL5WL2cCMwo4XJu8sZ1adoaCMOEKy2nix1PUiH2nt+p77BUoZD7kjRag4g==
X-Google-Smtp-Source: AGHT+IH6OtCR7PLNaxYCvlpziDK8I1V+86+Us/G+mB0/DfR0zTAG5P+/fb+cGawEEBhtJmDl0TX/5A==
X-Received: by 2002:a17:906:b209:b0:a66:7b79:3573 with SMTP id a640c23a62f3a-a699f6664demr134166666b.25.1717577693663;
        Wed, 05 Jun 2024 01:54:53 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68bfe84c67sm586249866b.62.2024.06.05.01.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:54:53 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt7988: add UART controllers
Date: Wed,  5 Jun 2024 10:54:33 +0200
Message-Id: <20240605085433.26513-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240605085433.26513-1-zajec5@gmail.com>
References: <20240605085433.26513-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_015456_933604_C1674AE3 
X-CRM114-Status: GOOD (  11.68  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Rafał Miłecki <rafal@milecki.pl>

MT7988 has three on-SoC UART controllers that support M16C450 and
M16550A modes.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 35 ++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index aa728331e876..7690a83911af 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -86,7 +86,7 @@ infracfg: clock-controller@10001000 {
 			#clock-cells = <1>;
 		};
 
-		clock-controller@1001b000 {
+		topckgen: clock-controller@1001b000 {
 			compatible = "mediatek,mt7988-topckgen", "syscon";
 			reg = <0 0x1001b000 0 0x1000>;
 			#clock-cells = <1>;
@@ -124,6 +124,39 @@ pwm@10048000 {
 			status = "disabled";
 		};
 
+		serial@11000000 {
+			compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11000000 0 0x100>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uart", "wakeup";
+			clocks = <&topckgen CLK_TOP_UART_SEL>,
+				 <&infracfg CLK_INFRA_52M_UART0_CK>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		serial@11000100 {
+			compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11000100 0 0x100>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uart", "wakeup";
+			clocks = <&topckgen CLK_TOP_UART_SEL>,
+				 <&infracfg CLK_INFRA_52M_UART1_CK>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		serial@11000200 {
+			compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11000200 0 0x100>;
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uart", "wakeup";
+			clocks = <&topckgen CLK_TOP_UART_SEL>,
+				 <&infracfg CLK_INFRA_52M_UART2_CK>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
 		i2c@11003000 {
 			compatible = "mediatek,mt7981-i2c";
 			reg = <0 0x11003000 0 0x1000>,
-- 
2.35.3


