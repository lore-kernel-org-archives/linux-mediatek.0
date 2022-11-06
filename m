Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A59C43217
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 08:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8iyCtYf/S4Xy39ojyQ6Mk9mNXir36Uajzk5LIv0/AQQ=; b=29faoa5uXfLqHu
	wxsaaaZ1BFOWt9gvkCQAkbEJ8gKY21rSUa8E4dkxbjcRd2tbEM9xW0UZ3QEepVIxmDhqsy5Q4ApG7
	fQjDaAoHGKPWFqqEijDKsAP1HiV+IziHd557fnUULtJFjQ00QbS9IdYCg6zJ5LKGQYC0mkOIwIGwi
	rVj7AC5aPBtFGB50Sn9miDy90WL+nvP2g5Bi7cIRhDPLIjxr2sxL/uSCnUZilbHwkTdcjU/W9vwk6
	LlY8eqmoLZab90XcTDXsyA8LzsljMKTjT1AwaQ3lzxVNpwO99NZBMxsUL6Bo38+L6YdvpEVQDlIRy
	ALckUhy94IO3R6vZrNHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orbMn-007kGo-AJ; Sun, 06 Nov 2022 08:50:57 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orbMb-007kA6-Gm; Sun, 06 Nov 2022 08:50:46 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id 1EDDD5FDE8;
	Sun,  6 Nov 2022 08:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1667724644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8iyCtYf/S4Xy39ojyQ6Mk9mNXir36Uajzk5LIv0/AQQ=;
	b=dYv65eJwqY6uRrSaPOfN5QWvdG/NrMFLXSyhFXAGGcyXpmomNN2jphTZlOVcqg0AyB5rAT
	GXi4pcYNyZLWtVl3SsWY1oUWX+2P5ADoENJ9jRJva293UnvpqH5yzf2hxTrgZl0V+Gv7cI
	VmbIIekzEk+dq39MR5s9QRm1sagM7TU=
Received: from frank-G5.. (fttx-pool-80.245.79.199.bambit.de [80.245.79.199])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 45BED360707;
	Sun,  6 Nov 2022 08:50:43 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v3 06/11] arm64: dts: mt7986: add i2c node
Date: Sun,  6 Nov 2022 09:50:29 +0100
Message-Id: <20221106085034.12582-7-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106085034.12582-1-linux@fw-web.de>
References: <20221106085034.12582-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: a0a1a384-5582-43d5-9121-0ae405ecdabb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_015045_718283_BEC86FC4 
X-CRM114-Status: UNSURE (   8.30  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add i2c Node to mt7986 devicetree.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 32c26b239ae6..a1a788db113a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -261,6 +261,20 @@ uart2: serial@11004000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@11008000 {
+			compatible = "mediatek,mt7986-i2c";
+			reg = <0 0x11008000 0 0x90>,
+			      <0 0x10217080 0 0x80>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+			clock-div = <5>;
+			clocks = <&infracfg CLK_INFRA_I2C0_CK>,
+				 <&infracfg CLK_INFRA_AP_DMA_CK>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		ssusb: usb@11200000 {
 			compatible = "mediatek,mt7986-xhci",
 				     "mediatek,mtk-xhci";
-- 
2.34.1


