Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1216C38A2D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 06:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2ZE/qIsyIboT5rUi20tqGS1dAa2vfhMvGcGE1QuP94=; b=GFTb37Yi4DaENz
	FwY0Y6iAmMAF7ynky2PyUycpiSlDPj5m8FgaFcNMMZRUEIz/e9+XSo/Yjr7/ZcF7kwFUIjvjLaKwK
	nyXhKOeNaJvoWIImv+z4EHDqclDOaG7FUB8iJKl+ngOOWo3XmLer32qhMgrmTlAhSw0Uq9fW8Anes
	Mb56WwzEUh/eNJlJz5kWrW/XiHDHGQqfGNrbZnAEmDeS+CA93NNwCbkVfmDKHyps4kU85yxznkgtK
	HO3VFoSSFcPwfhZ1ZT30+LUDOqfKjrG2h9c5tTtDL468I5e5HGNtR+IlaggxeGY2In+gVU8DFT0OL
	UYWnJQvgVSjetzKW0isA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onvy5-00Bvi4-Tj; Thu, 27 Oct 2022 06:02:17 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onvxm-00Bvcs-59; Thu, 27 Oct 2022 06:01:59 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout4.routing.net (Postfix) with ESMTP id 308E81009A7;
	Thu, 27 Oct 2022 06:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666850514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w2ZE/qIsyIboT5rUi20tqGS1dAa2vfhMvGcGE1QuP94=;
	b=xu/80XHq712kMldqEFAn77AXFGc4ltrRt3kBabQFKFon+p76ogbIbTgv8EbYLwHF+CVWcc
	fVSlml6uTxMuLRcbotWh6YM1ASTrCza+naipI+WXjITDLdn6f6uY7/11J9X8WcqqeYdrTQ
	QIm1JxKe7hDef8RRtCUT4axQnDPq4HI=
Received: from frank-G5.. (fttx-pool-80.245.77.6.bambit.de [80.245.77.6])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 75228405D6;
	Thu, 27 Oct 2022 06:01:53 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v1 2/2] arm64: dts: mt7986: add PCIe nodes to BananaPi-R3
Date: Thu, 27 Oct 2022 08:01:42 +0200
Message-Id: <20221027060142.6354-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027060142.6354-1-linux@fw-web.de>
References: <20221027060142.6354-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: f1260125-602d-462f-afe8-10e90a54aa61
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_230158_392569_EDDA5A31 
X-CRM114-Status: UNSURE (   9.03  )
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
index fc100c3a6415..8eb7079cf6d7 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi
@@ -181,6 +181,16 @@ &i2c0 {
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
@@ -247,6 +257,13 @@ conf-rst {
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


