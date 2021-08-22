Return-Path: <SRS0=dV3g=NN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC5D1C4338F
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Aug 2021 04:15:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BF886126A
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Aug 2021 04:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BF886126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gorani.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kOE0Y/5BZ3Z7BHzqVEknC9zXgN01m5p2ESMdKL739Dk=; b=Vl5qsFUHlSDMSR
	ksz3pWGgMp/1bkSE7zvfyeHESvPYJzTWQ/PpSVXE/rxYGWYPRTFZl4o89U+kh9vQpxxwjfIHp4o+I
	sxJ3teG/BpKktpARg3Hu1JwLWQXlAqttOwb/ZqFaMDQY8X0eRd26UdJw/CRHEtI9UZKjBgYuskK4q
	HSYfwtqOeA48KOtla3odsT85vdkEnwqGfgYFn5eOIykoRo3CMgChSsuTPyt+2Mz8yxO/lie+dr1FY
	mbyX0k7+X+uLO9moZR9aQT8W6KM5jMPwDJvB0UuvGGkQ+uJ6eAsnsi0q8vTNaHsqxIb6caS2JCkny
	/NnHMZpBwR2UoPcQsGXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHesn-00DUc2-C4; Sun, 22 Aug 2021 04:14:53 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050::465:102])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHesO-00DUYg-Hv; Sun, 22 Aug 2021 04:14:33 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4GshpV61kKzQjym;
 Sun, 22 Aug 2021 06:14:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001; 
 t=1629605661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+31EPRPMGVEy2Xpxt+EjtmwliDHXxQYcaVfkvS007Qw=;
 b=DxVAmhKTlqpkCYhwvRNC1T6FD3PfK/WNroEzQ8y17kyNsyLQGvW0kRBU2JuqDJCGO9Ym1l
 CTVyFArt3SkbDYkqpT6kh1TL+ucYNezRyURc9Zjaukrc3mn6kT2LgcvFOk2kaE2iMm50tb
 LsoJuIQmWKWcnWAESytJ8sWwFpP49eOMTyW3/EQ42NBIlrN7SGgnkgd7MvwxHI0XEOkY67
 4rEK1OgKDDXRjtf13wCFHMknU0OBGSBbpidX6+2dWocaarKsKDjxXFboCmUlseM/FeybbR
 hV/4bfnFlsmehk0qRFhjmnjYe01a+gxbDxziiSCeI6CfEBgLv0ksKEuH8Ojrew==
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id bGQP5vXKQSRq; Sun, 22 Aug 2021 06:14:19 +0200 (CEST)
From: Sungbo Eo <mans0n@gorani.run>
To: linux-mediatek@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Min Guo <min.guo@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sungbo Eo <mans0n@gorani.run>
Subject: [PATCH v3 1/1] arm: dts: mt7623: add musb device nodes
Date: Sun, 22 Aug 2021 13:13:33 +0900
Message-Id: <20210822041333.5264-2-mans0n@gorani.run>
In-Reply-To: <20210822041333.5264-1-mans0n@gorani.run>
References: <20210808123840.176738-1-mans0n@gorani.run>
 <20210822041333.5264-1-mans0n@gorani.run>
MIME-Version: 1.0
X-Rspamd-Queue-Id: E13A81887
X-Rspamd-UID: 89d88d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210821_211428_804082_2977CB39 
X-CRM114-Status: GOOD (  10.60  )
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
v3:
* remove unnecessary status=okay from u2port2

v2:
* rename usb3 label to usb0
* move usb0 & u2phy1 nodes to the right sorted place
* disable u2phy1 by default
* correct u2port2 node name to match its reg address
---
 arch/arm/boot/dts/mt7623.dtsi  | 33 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/mt7623a.dtsi |  4 ++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index 3c11f7cfcc40..21c8a291b74e 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -585,6 +585,39 @@ spi2: spi@11017000 {
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
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
