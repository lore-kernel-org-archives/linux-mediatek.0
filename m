Return-Path: <SRS0=9HTA=M7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE0D6C4338F
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 12:40:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DEE160FD8
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 12:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DEE160FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gorani.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WEoXwG1LmqTuzNyQH9fzjnt4jjycTLdzuGAd9M8roWM=; b=kLRvjwJAp4gVNK
	LEPYF/+YiaKEz0T9KjaEKVSfIVbX2nE+q2yiisAWwJJCKsNYZlq2SNrTf7IOG4nMV2OOtSo7uMLpt
	gnRRcwR5khkViRAIExXbN4y8aTY9AeEHUdjTvR14H+w8bqRW3001UdB9Vow07u9XQriw35OxHqfT0
	UifWaetHSgIJYtb1e8S1bACagE9CVe/tBgawOmn3NNAj7iHrop8U1F/8mIwUaXh5icGUBRa9MQ2lC
	Jtq/KJN6YwgYl1+gGvmDbqAZbBR8SxtXPlM4Fej3yKK08zd1+ZXbTNXRLktFeeE0eAvfAHL0LbB96
	4zMYOjnu+8rAf0owfNPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCi6I-00Fp0A-Un; Sun, 08 Aug 2021 12:40:22 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050::465:103])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCi5o-00Foqp-Fl; Sun, 08 Aug 2021 12:39:54 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4GjJh65nz2zQk9y;
 Sun,  8 Aug 2021 14:39:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001; 
 t=1628426389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wTDEWTY6DFnkW7Rjxxj/CcZyJlPojb5t/pJtInOE9bs=;
 b=njzXrk+pIxdCL4wWJkaLLZ7UkjSIqw58a948hlA7vJXsx1fXdyYfPuYfqA3A5fOwUMsudv
 2/SXoW2Ao3FLxzoMnzk1+pHyO9NaGObsnmKMQ8r4RPK9LC75FLqu37MBBvem9cMeFQqq6c
 P7P3miV9eFghBfBmQ/DefIfX7fHd0hNimdAogouTxbcrI4OYPXG865iOYhbQ1SCUaWGO/l
 hbZA+LalU5vkTtPaLi8D7+QTQ7fp5zEcfZna0g3ABEEw3Hr8ZKWDWyrCelP/dl3+ZlM1sc
 A+CJtlQlA73sYSJ8JZ/rtIQYoVgpNglmygYDmW2yDid5JFxivu7HLN4ncqahdw==
Received: from smtp1.mailbox.org ([80.241.60.240])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
 (amavisd-new, port 10030)
 with ESMTP id uGsJQJGVLIxf; Sun,  8 Aug 2021 14:39:47 +0200 (CEST)
From: Sungbo Eo <mans0n@gorani.run>
To: linux-mediatek@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Min Guo <min.guo@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sungbo Eo <mans0n@gorani.run>
Subject: [PATCH v2 2/2] arm: dts: mt7623: add musb device nodes
Date: Sun,  8 Aug 2021 21:38:40 +0900
Message-Id: <20210808123840.176738-3-mans0n@gorani.run>
In-Reply-To: <20210808123840.176738-1-mans0n@gorani.run>
References: <20210803151320.71531-1-mans0n@gorani.run>
 <20210808123840.176738-1-mans0n@gorani.run>
MIME-Version: 1.0
X-Rspamd-Queue-Id: ECECD189C
X-Rspamd-UID: 492da4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_053952_702490_5B6EEDE4 
X-CRM114-Status: GOOD (  10.34  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT7623 has an musb controller that is compatible with the one from MT2701.

Signed-off-by: Sungbo Eo <mans0n@gorani.run>
---
v2:
* rename usb3 label to usb0
* move usb0 & u2phy1 nodes to the right sorted place
* disable u2phy1 by default
* correct u2port2 node name to match its reg address
---
 arch/arm/boot/dts/mt7623.dtsi  | 34 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/mt7623a.dtsi |  4 ++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index 3c11f7cfcc40..790d74439cc6 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -585,6 +585,40 @@ spi2: spi@11017000 {
 		status = "disabled";
 	};
 
+	usb0: usb@11200000 {
+		compatible = "mediatek,mt7623-musb",
+			     "mediatek,mtk-musb";
+		reg = <0 0x11200000 0 0x1000>;
+		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "mc";
+		phys = <&u2port2 PHY_TYPE_USB2>;
+		dr_mode = "otg";
+		clocks = <&pericfg CLK_PERI_USB0>,
+			 <&pericfg CLK_PERI_USB0_MCU>,
+			 <&pericfg CLK_PERI_USB_SLV>;
+		clock-names = "main","mcu","univpll";
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
+		status = "disabled";
+	};
+
+	u2phy1: t-phy@11210000 {
+		compatible = "mediatek,mt7623-tphy",
+			     "mediatek,generic-tphy-v1";
+		reg = <0 0x11210000 0 0x0800>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "disabled";
+
+		u2port2: usb-phy@11210800 {
+			reg = <0 0x11210800 0 0x0100>;
+			clocks = <&topckgen CLK_TOP_USB_PHY48M>;
+			clock-names = "ref";
+			#phy-cells = <1>;
+			status = "okay";
+		};
+	};
+
 	audsys: clock-controller@11220000 {
 		compatible = "mediatek,mt7623-audsys",
 			     "mediatek,mt2701-audsys",
diff --git a/arch/arm/boot/dts/mt7623a.dtsi b/arch/arm/boot/dts/mt7623a.dtsi
index 0735a1fb8ad9..d304b62d24b5 100644
--- a/arch/arm/boot/dts/mt7623a.dtsi
+++ b/arch/arm/boot/dts/mt7623a.dtsi
@@ -35,6 +35,10 @@ &scpsys {
 	clock-names = "ethif";
 };
 
+&usb0 {
+	power-domains = <&scpsys MT7623A_POWER_DOMAIN_IFR_MSC>;
+};
+
 &usb1 {
 	power-domains = <&scpsys MT7623A_POWER_DOMAIN_HIF>;
 };
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
