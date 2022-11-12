Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C79C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Nov 2022 09:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wARWjXaekHXd+qoR6cih6bO82ffPMj6tdvVNWGcPmCQ=; b=eHYFA6y7vDhbZ+
	QUCg3mELXygroMVJOXwAsgPHbDvuFgVZM9DwmP8230CB6rktQ528bs6PObryzLYvFC+ENtcoAcSk+
	qRwr+LrPkpSUXBTHj92VnnHsEL42B5XXg8hyyBjbDThKgSMj/uGVuMcGHtDNc4bAP4WYkldVUpeuQ
	UEW9J8lBZLBe3Q2Jme8b278KOJMmvtEno2r4GHbVh/YPdX7nE3uMUliyCUvEBwQVmF0SOxsFT0jDy
	MO5QJ5CIYNzhFcPD1a/9fQ67VSGa+rcj7giaOwDWg4U/UFnp4B5ReaibDbvq5/PsMVpeqhTjWjjYp
	9DV5ToYW+MOUopUHln2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otmdj-004ZNL-A0; Sat, 12 Nov 2022 09:17:27 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otmcI-004YRk-2i; Sat, 12 Nov 2022 09:16:00 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 028FF3FF3B;
	Sat, 12 Nov 2022 09:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1668244535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wARWjXaekHXd+qoR6cih6bO82ffPMj6tdvVNWGcPmCQ=;
	b=lfZHMkUDmepqCe5Ny4OohuDOC/wbqoWmz9OCU/jQUCSrsjqifv7Yjdhu/T7k7o1xTPb1b1
	2VsMWWvIDWFVMeuOm4vNKp+9TtmOp06uyhr9o5Jg8EKAGEnSf1ug01q+UJ74fWrR0W6yOl
	jVQ5RjXuwG1Unq1rHquK9A11lhIYvfc=
Received: from frank-G5.. (fttx-pool-157.180.227.41.bambit.de [157.180.227.41])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id E9A4A360D0E;
	Sat, 12 Nov 2022 09:15:33 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v4 01/11] arm64: dts: mt7986: move wed_pcie node
Date: Sat, 12 Nov 2022 10:15:08 +0100
Message-Id: <20221112091518.7846-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221112091518.7846-1-linux@fw-web.de>
References: <20221112091518.7846-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 43985d64-a28d-4a3c-a1dc-63718da2295f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221112_011558_416922_7B643237 
X-CRM114-Status: UNSURE (   9.25  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Move the wed_pcie node to have node aligned by address.

Fixes: 00b9903996b3 ("arm64: dts: mediatek: mt7986: add support for Wireless Ethernet Dispatch")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index a22e10e89ab9..afc01abfa99c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -112,6 +112,12 @@ infracfg: infracfg@10001000 {
 			#clock-cells = <1>;
 		};
 
+		wed_pcie: wed-pcie@10003000 {
+			compatible = "mediatek,mt7986-wed-pcie",
+				     "syscon";
+			reg = <0 0x10003000 0 0x10>;
+		};
+
 		topckgen: topckgen@1001b000 {
 			compatible = "mediatek,mt7986-topckgen", "syscon";
 			reg = <0 0x1001B000 0 0x1000>;
@@ -257,12 +263,6 @@ ethsys: syscon@15000000 {
 			 #reset-cells = <1>;
 		};
 
-		wed_pcie: wed-pcie@10003000 {
-			compatible = "mediatek,mt7986-wed-pcie",
-				     "syscon";
-			reg = <0 0x10003000 0 0x10>;
-		};
-
 		wed0: wed@15010000 {
 			compatible = "mediatek,mt7986-wed",
 				     "syscon";
-- 
2.34.1


