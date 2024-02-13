Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5936CC4829A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 13:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Cq+iI48CDe+5VO7sSMk/e7qj86AX8EMGUWgbiDs5Ns=; b=csgk6doxGPy6CfGhGG5Wn9vJL8
	tCrMeQXoejzsLqGdCGEXBu7yiKzKMjIes5TB+iUk55M1q41s7U0wx5tRzP49aJsywCQHI5JnEOmcA
	qQvSSboZyzV+DW+1iRWuA+a39HFktEwujobl6Ec6z82zjeFJXJrduhq8r4DOA6Fc9hLKUfFx5lf3f
	wMApYqIZv1oBqiLhiI3wD7X7I7HS4JY3ol8fdxgmScIkSlsWhvACJwAHglHdcImsoAe+evF6krTpA
	oGDfrbU6x2YoqI8YoGHPAKCxqJajkOpXKOBnYYF6A1qOqTVe6ws+dR7KEWtIqwhDnx+vqzC0gYOQ0
	tSA67dgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZsR4-00000009Gh0-41sP;
	Tue, 13 Feb 2024 13:02:54 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZsQz-00000009Gdq-1fwy;
	Tue, 13 Feb 2024 13:02:50 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-560e9c7a094so5608096a12.0;
        Tue, 13 Feb 2024 05:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707829366; x=1708434166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Cq+iI48CDe+5VO7sSMk/e7qj86AX8EMGUWgbiDs5Ns=;
        b=O36sECfHqwqhzh1IJOm+3/XSVjDt7ygcmmNat3yNAKFvlU/uYSKa8intTS9D0Gb/7e
         AWUa2WraVuQMv996iGh9oIUjbqKLoOYgr9i50rUMrPeGpecUY2XYlQerUrMjurSPGQJe
         U5q89zO82OHzbWCFhbhdPYXkFwQUtfOw28CCWbYkD8L2aQJ6vx/YMtqPr6RSl5v06whq
         f3Jk8SaxVHNeXUuHZWXYHxcuiKDvssMX621qrcQT1GB7SxrXv4mpogsGEBy2BY8sxfaL
         wL0QIUJVcSxfl6Z5M+8BjvUNbOXZUZuFKOg3k3XEuLVtI1RuuaW8L/5pliU9DNq7CIzP
         LjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707829366; x=1708434166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Cq+iI48CDe+5VO7sSMk/e7qj86AX8EMGUWgbiDs5Ns=;
        b=aLmUYVRlwhe15rgFLkBuWtKkr/AoSUH/htqogVfq4MBTIqjl2dVUiaBQVxl1IM51el
         7gIS3p2MV+NRvEbbsIaXOb5/58MTHMdQZ42m3GNv5Z65+SPcStsuItCQbPpNTUB8JdKu
         txJZYhm3A5kHLw+uKq40lEVrTPftB7qxQGhU9c7zOqN+OpDUQd2Is22nSI0G6RQdIjJC
         6mx9J0ga+RCObLkuAFuZKU0kMqqm7e46AnpLiPc3hsVwvtuRgFOF8gxMD8IaAYIA8ZCU
         ius9TDK5bLyecxBPJ0gZ/sPaMrcLQT99F0CJt66lq2399FlEm20f9tUHEadFRgk0kU/3
         1gEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIcHrkJZjJFe2TNa5OFbx/SfJHY6T+msSUAcAbByL7xkDmwlAZSFGJb9BTx3cklYEb0zDKDBY81eP5+zngzyDZFkoxp7X2rZ9hsV89jpbpR/vrdv6nFDZaZ/L9MzdZES2RsXjN6iSl7b4pVxul1eOY07f+ekKCKnY=
X-Gm-Message-State: AOJu0YxJB3k1Oxn8ByNMxfW5HtGsDaYtVPCISwGPJkhkR7QYTAQFWRdq
	9xkYLXU416IIgHd8F31oWzKMBkHIZoRZdvMl15oKvpBgPBMEEWHI33OxzEAF
X-Google-Smtp-Source: AGHT+IGwFZ/B7NIFFcOnp2yFup95b+UeJUZ6E+6zkb73wGvSwm0cn063bkqvcUbgz2zWlqx3KDTONA==
X-Received: by 2002:a17:906:f88c:b0:a3c:8770:3795 with SMTP id lg12-20020a170906f88c00b00a3c87703795mr4365644ejb.15.1707829365845;
        Tue, 13 Feb 2024 05:02:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUQd7FhW+1Uji0/Kw8nyU5iosaUylTYW21ZHKoUoT9ZyjzXWSFkwAIhE6Op8Ai/8id8BMsPSYCUjv/0QPqvImddI3pTh5U3rNX76vbsxis4r65rvE9S4ka4TixwJvOdwq94CbIxE7qh+NgiRyva159qE7FTL0xCmmLMleU7R1sknZS/ZZatTKaJGqqo+iI6b657bbo6hBx/G/cAGOzfGRxZcGNxoXZ2t0i2uxmQ7TpiLASQJxbBX9BJ599Ksk2UCqJZrbtQDsuIlDmw943oOQDrMfaRxHTGsJAgC8dAN3c7bLNZwIfp5udFq1Qmc4PGKcO7RbRvzRbUy5DaRcujhAcakboeIaiUrBnCcE9Is7TEn2KGwALWXK1Ao7e98mNC3rH6mbNiyequTN/yiFmfDmE5KbLBgjO44/c1JDuGj2YuLx3wlwbOSSeLDEC4WwjutfpiTecOlOZKeCAA2hWGinRelblNGFcmaFlTLfRaUpH0ifPBICKQgcAm87xGbrGjhILR+66YG2HkRzR20wBYbFwmRI2pATXlTDvdBISYEnxyBQ==
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id cw15-20020a170907160f00b00a3d004237ebsm633078ejd.212.2024.02.13.05.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 05:02:45 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt7988: add XHCI controllers
Date: Tue, 13 Feb 2024 14:00:44 +0100
Message-Id: <20240213130044.1976-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240213130044.1976-1-zajec5@gmail.com>
References: <20240213130044.1976-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_050249_478556_0A62B35D 
X-CRM114-Status: GOOD (  11.84  )
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

Add bindings of two on-SoC XHCI controllers.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 32 ++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index bba97de4fb44..3eb5396dea22 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only OR MIT
 
+#include <dt-bindings/clock/mediatek,mt7988-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy.h>
 
 / {
 	compatible = "mediatek,mt7988a";
@@ -78,7 +80,7 @@ gic: interrupt-controller@c000000 {
 			#interrupt-cells = <3>;
 		};
 
-		clock-controller@10001000 {
+		infracfg: clock-controller@10001000 {
 			compatible = "mediatek,mt7988-infracfg", "syscon";
 			reg = <0 0x10001000 0 0x1000>;
 			#clock-cells = <1>;
@@ -103,6 +105,34 @@ clock-controller@1001e000 {
 			#clock-cells = <1>;
 		};
 
+		usb@11190000 {
+			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
+			reg = <0 0x11190000 0 0x2e00>,
+			      <0 0x11193e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_USB_SYS>,
+				 <&infracfg CLK_INFRA_USB_REF>,
+				 <&infracfg CLK_INFRA_66M_USB_HCK>,
+				 <&infracfg CLK_INFRA_133M_USB_HCK>,
+				 <&infracfg CLK_INFRA_USB_XHCI>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
+		};
+
+		usb@11200000 {
+			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
+			reg = <0 0x11200000 0 0x2e00>,
+			      <0 0x11203e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_INFRA_USB_SYS_CK_P1>,
+				 <&infracfg CLK_INFRA_USB_CK_P1>,
+				 <&infracfg CLK_INFRA_66M_USB_HCK_CK_P1>,
+				 <&infracfg CLK_INFRA_133M_USB_HCK_CK_P1>,
+				 <&infracfg CLK_INFRA_USB_XHCI_CK_P1>;
+			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
+		};
+
 		clock-controller@11f40000 {
 			compatible = "mediatek,mt7988-xfi-pll";
 			reg = <0 0x11f40000 0 0x1000>;
-- 
2.35.3


