Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECF0C433FE
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 08:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xWv16uoFOb6bItdqVi9OeYNnzGyV0xjUXLKdhVz8KGs=; b=fx6RzWZIW0/Hjh
	hNqExSUzVU4OEpn4y482r9/7KMse2kajz6x0ybUam9fqDPnJmoS6FFoomrOeIRgoNMMv3YoJiyy0b
	oZrj/yfAv/hS3FJoFCxkDdYDJxnMn1jIzgaNNEkmYh0KyqHdLGdkr3DcUj5LYLzEPfsaOSQGh3awJ
	s7pnSFmymY0PJyOu+6fpO9uBOS9EgHI4zJ9ELKja1TEidq3LIS+LXFTOKxVqKZk/KM0bWPKx38ROv
	pKMSYeX/FWHuAZCAhplVspgVqZidsIzMgp+Thm7YDr8nBw067Y/vg50JF8SVu0ShvBXtljBhu1KpN
	0n6rgOLBt0rjCgFY2B8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orbOM-007l6J-As; Sun, 06 Nov 2022 08:52:34 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orbMe-007kBS-6G; Sun, 06 Nov 2022 08:50:50 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id 7C7365FF40;
	Sun,  6 Nov 2022 08:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1667724646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xWv16uoFOb6bItdqVi9OeYNnzGyV0xjUXLKdhVz8KGs=;
	b=hpZ5+Tn7KBcpoPDAZ/XeZBAhLzcJUC8XYQOxJRCzxkLPH05hQlnAzQMPebnHEkI9sNrnLz
	OU+srMGfTWpM5w2qxBzQpaDuRpvDcadWiwV2sBfbvO5BO2XCWV2R9EzXruvmAOZ0BgkSDZ
	0g40hdrFnZxquINAlSmFtxwveMwnQV4=
Received: from frank-G5.. (fttx-pool-80.245.79.199.bambit.de [80.245.79.199])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id ED25936054A;
	Sun,  6 Nov 2022 08:50:45 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v3 10/11] arm64: dts: mt7986: add PCIe nodes to BananaPi-R3
Date: Sun,  6 Nov 2022 09:50:33 +0100
Message-Id: <20221106085034.12582-11-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106085034.12582-1-linux@fw-web.de>
References: <20221106085034.12582-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 3b59d6be-ad3e-472f-8b86-c55df8f8e314
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_015048_410190_0FFD6E76 
X-CRM114-Status: UNSURE (   8.72  )
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

Add PCIe nodes to Banana Pi R3 SBC which is used on M.2 slot.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi
index 93ac67641351..01f92db3336a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi
@@ -195,6 +195,16 @@ &i2c0 {
 	status = "okay";
 };
 
+&pcie {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_pins>;
+	status = "okay";
+};
+
+&pcie_phy {
+	status = "okay";
+};
+
 &pio {
 	i2c_pins: i2c-pins {
 		mux {
@@ -261,6 +271,13 @@ conf-rst {
 		};
 	};
 
+	pcie_pins: pcie-pins {
+		mux {
+			function = "pcie";
+			groups = "pcie_clk", "pcie_pereset";
+		};
+	};
+
 	spi_flash_pins: spi-flash-pins {
 		mux {
 			function = "spi";
-- 
2.34.1


