Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DC3C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 10:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dk0kMz7hR3coINSWjDwmI0XO6Rjx3neJcG0NlcGk1J4=; b=njnh3mU5wCBbB3
	RkJBs4jmCSo7thFlLXTkavcW0mIBaXafrzqGh+bN1is72DRC0qx9X/ouXLIKGxWW7vNtYI/ZcoSPp
	sdfXC6qTSoV2LKzgfnp4kgq1iCpiJfcwktA2RL6PghkdjxNAjTh0fmUWpNspwRDAkFvbpjz5vpzU0
	vZJhmX8hsRbVt5yUfyXS7KO1cqmL0M6SohpDGI7rNsjLYLeddjJgwqtjog3y0AIK/kLMZFe33TnzW
	OYRAVCT/4REH8sgEY3MEKMRcXAl4dVOehsYo3chgtaFuTj+pI+1bMN33lgcSoxSB8VXIVkrniRc0Z
	WJrEMbT64Ep+VM7om+qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okNe5-00ARnB-5R; Mon, 17 Oct 2022 10:46:57 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okNZP-00ANKL-Ro; Mon, 17 Oct 2022 10:42:09 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id DCFAF60479;
	Mon, 17 Oct 2022 10:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666003321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dk0kMz7hR3coINSWjDwmI0XO6Rjx3neJcG0NlcGk1J4=;
	b=Jw6Bj4qCi/xXFdJTrdvgRw9XgJJ2nOeJv502C0a6/LTJrfLr/HZsA6yY5iUpfMPmI7PoNl
	/NKhNq4HmYdzdQO9lsmNnGsEmwrvesOgAYcbKLAw7EzHA9K+q5QvnQd0KEczRVSXzbv9p6
	fTqKsntoXKaUvEM7Oryh/V6OZjY9FR0=
Received: from frank-G5.. (fttx-pool-217.61.154.127.bambit.de [217.61.154.127])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 33C13406D6;
	Mon, 17 Oct 2022 10:42:01 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v1 11/12] arm64: dts: mt7986: add i2c node
Date: Mon, 17 Oct 2022 12:41:40 +0200
Message-Id: <20221017104141.7338-12-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017104141.7338-1-linux@fw-web.de>
References: <20221017104141.7338-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 493f2678-a1f4-4e10-a63b-e3fc3b414c71
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_034208_061183_09D6DA68 
X-CRM114-Status: UNSURE (   8.35  )
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
index f451788d93f9..ac88d23e3bec 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -262,6 +262,20 @@ uart2: serial@11004000 {
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


