Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A6CC3DA61
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jul 2024 12:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXRD4T8Sdv60h0uyEFXaREU3np3ECNbip0ZEKAYODiY=; b=n6YuMLueQwESWTnEz6lVLfP1Lf
	T6Yd7hzr7C5Li17iezKm9WLwlvV82Y6mxaRcVvvAW9jeZ5tqelKn4Z0stiEYfipBpwXfvVn16sVOC
	hB/Mld5WWKYsHSCUyadKKemQ34/nIJESsMei/MNdXORrn7JH+hsDp46zeqKQfXyGhRQ+g1SvXUjFK
	YH9CkqcrxlxZMCAZ5N5FJoCwOHV9LoW/7oh+xcJzsNFxC914fouFa7T5p5EOELptQPfKoY7+EeB9M
	dCNPx+nXxLg58gE+TCoO5ibWILGBkzORziw3Kmc+ycvCGVefs+naG6ulfmb4mnCrP+H7SJiyWgU+5
	bxtD12Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXgKu-00000006fFG-3SZC;
	Sat, 27 Jul 2024 12:15:44 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXgK9-00000006f7Q-3mV4;
	Sat, 27 Jul 2024 12:14:59 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-58ef19aa69dso2726521a12.3;
        Sat, 27 Jul 2024 05:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722082496; x=1722687296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXRD4T8Sdv60h0uyEFXaREU3np3ECNbip0ZEKAYODiY=;
        b=kkEmsMvQY0OSlUFr8YsGjv6G+rV9Zi0lSUsbNGsQzmMDWrBbI3GfjGzU5A8gg6vg4+
         KFSU2pknxYFFBCarEQ7ewMG3EeD8Vgq2Z75EKlp4qt9th21P7uJsTB038Gncz1NUwqfS
         uKeLK0gN0hMjdeYGP8k/hM8hXW68XPr7rdELS2SV+uO7Pt00GyK3/A3JCHdgn6HOJ70H
         bAyeToeCosony5THVsFcjSnYM8QFMB1YBdXjR7m27tXHgKeUqqiFBfQJYkh6bE9YR12L
         wOEtmK8yV9oSATbe1ySkD+BYhk0lX7MsEW4Fb37rvyTlaFoQrzL7Hce/JC6V59r3SAoV
         F1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722082496; x=1722687296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXRD4T8Sdv60h0uyEFXaREU3np3ECNbip0ZEKAYODiY=;
        b=XQUYbSQ+FZ+IVtdJoP08dusvOidHjJRLARf21pF9vIfmFAlXgNv9dJ99TrfJt+H+hv
         FwsD9ZPgiTyZDMC21vtIRdpjRvlq9aQ4MFGqmniR9yuVTHUm30nbBcbIilwoWkWVEeDI
         hk8AZnB307grelPRODU7N0VjZmM3EPQdG/flkQk/icwfSS1sfFdVpTeikt+AZb7Ytq+9
         PzzAMVenSS1O/yYn6OsePDio+JkmxKYOV+qgYlEsyWPedIyhIXlfS+0koA/8DPLcXXY0
         ehfOkjUud9QY8omjJLW1/EoN6WPq2mM94U4GSjHAfRSUhE5o5Z55vLU2vHwmj452WFuD
         Z5+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUs1M/aGQLWjn4cTb728llytRXOHqaZcBvBeaEXF/vC1tZC5Lt23oSEdioqC1zaolmILgciB/P/2B9OobCMmJa9vwT7FijM7NeCgiLR0+LqtOD4L3lalpqBq1bffeCIM2B/qX2zXwiw2gLJJbQiAyc2L2HQIj335K8=
X-Gm-Message-State: AOJu0YzkBIeYbZ8/UqHkMP8gGdIemeL03CBx2+3mqJYD1o9jzAGQGApx
	2tq1aTPBkXwrZrVJz+CB+UmGqDRQylxGpslu8txCq4AqGkFH8/Ax
X-Google-Smtp-Source: AGHT+IER/q48nsm2HXaWn1x7wbcIBLaFCPE9pn0FAuXkO7Bu1saORaSRwYXlWLaLbIV0bcZFhQUgbg==
X-Received: by 2002:a05:6402:4303:b0:5a2:8c11:7e05 with SMTP id 4fb4d7f45d1cf-5b020102e6emr1627536a12.6.1722082495704;
        Sat, 27 Jul 2024 05:14:55 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac63590e73sm3005180a12.35.2024.07.27.05.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 05:14:55 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	John Crispin <john@phrozen.org>,
	Daniel Golle <daniel@makrotopia.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt7981: add UART controllers
Date: Sat, 27 Jul 2024 14:14:47 +0200
Message-Id: <20240727121447.1016-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240727121447.1016-1-zajec5@gmail.com>
References: <20240727121447.1016-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240727_051457_966726_2EFEDA07 
X-CRM114-Status: GOOD (  10.59  )
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

MT7981 has three on-SoC UART controllers.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index b096009ef99c..5cbea9cd411f 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -94,6 +94,39 @@ pwm@10048000 {
 			#pwm-cells = <2>;
 		};
 
+		serial@11002000 {
+			compatible = "mediatek,mt7981-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11002000 0 0x100>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uart", "wakeup";
+			clocks = <&infracfg CLK_INFRA_UART0_SEL>,
+				 <&infracfg CLK_INFRA_UART0_CK>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		serial@11003000 {
+			compatible = "mediatek,mt7981-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11003000 0 0x100>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uart", "wakeup";
+			clocks = <&infracfg CLK_INFRA_UART1_SEL>,
+				 <&infracfg CLK_INFRA_UART1_CK>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		serial@11004000 {
+			compatible = "mediatek,mt7981-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11004000 0 0x100>;
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uart", "wakeup";
+			clocks = <&infracfg CLK_INFRA_UART2_SEL>,
+				 <&infracfg CLK_INFRA_UART2_CK>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
 		i2c@11007000 {
 			compatible = "mediatek,mt7981-i2c";
 			reg = <0 0x11007000 0 0x1000>,
-- 
2.35.3


