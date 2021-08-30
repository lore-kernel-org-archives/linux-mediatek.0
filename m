Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD20C432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 16:01:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 675FC60F25
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 16:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 675FC60F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gorani.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3LMGnQ2rEsLDxyWYaoYFe9RP5RAjjG3qxtTqE5Zzd4=; b=aueeFn24Lf2dTr
	Ctqa0HMZpoUY9lmRvpd8xwiFmC6/pYYo+HD0H8Qvn9JtoJ+cSwRyO0GgxqI9gonHRpY587lDAh8Yo
	2aFsdPHE+6jkpn7dUiXBmmhuDrfcqAv7LI7e17RyEzvK+eDeRNrDnSaabwuOmaFYS67SY9HTPeQ55
	adi4HLEvwBIoz2FhesOJ6vYBQIIeMzthOFuz4KqCPDtlUjEfP7qs3nHlxwksC7CeU688QYe0r2uVE
	GTVDyDBFNUZvzqNezsd494unbilqXSnvM4V8b0983XZb+fR+iP9yBjH0m5ALS3exhr38K6Dlu5FnN
	hw+Kf3AuUYr6oWYw5ALA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKjid-00HZqu-2q; Mon, 30 Aug 2021 16:01:07 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKjhN-00HZOg-2G; Mon, 30 Aug 2021 15:59:50 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:4:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Gyw4P692vzQk1P;
 Mon, 30 Aug 2021 17:59:33 +0200 (CEST)
Received: from spamfilter05.heinlein-hosting.de
 (spamfilter05.heinlein-hosting.de [80.241.56.123])
 by smtp202.mailbox.org (Postfix) with ESMTP id D57A026F;
 Mon, 30 Aug 2021 17:59:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001; 
 t=1630339172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MTTizMLuwhVpBLeJTWY07OqOEuFav9U7vpUUmUr4Zw0=;
 b=hFGzN9+tyeJjpM4lEauiH94S6b657fhgfbpcrr5LB+4U+WSrS5dUu5qx7xryxTIA2SEelm
 cediEVrYxYCUwvIWGjXMbwpIe2+Vb2FcTD7qYFw8zV8WJSXo+TayMyF0/QIKcKFshIoK/E
 BRA1reqKttbguYOOeoS2QS7pubsieSCK5PQmpr9+juJF2aumt7lHKl6wBudWtGO/BChnpM
 UQjOwn+eX0ICPoMNvl8gQBHmly4iDqTjeUSawzIXUKFnhzGVVkcMJLi3zcsYX8/QeH1qe0
 zWNiHYauISyIi8DN9mC+ruuCOebs2YmpCey3q00hhryKaoNXYBGPRzqDPRc5+Q==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp202.mailbox.org ([80.241.60.245])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id VydHLGUAP9nm; Mon, 30 Aug 2021 17:59:30 +0200 (CEST)
Received: from ms-v3.lan (unknown [211.58.59.88])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp202.mailbox.org (Postfix) with ESMTPSA id 1544726B;
 Mon, 30 Aug 2021 17:59:26 +0200 (CEST)
From: Sungbo Eo <mans0n@gorani.run>
To: linux-mediatek@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bin Liu <b-liu@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sungbo Eo <mans0n@gorani.run>
Subject: [PATCH v4 1/2] arm: dts: mt7623: add musb device nodes
Date: Tue, 31 Aug 2021 00:59:02 +0900
Message-Id: <20210830155903.13907-2-mans0n@gorani.run>
In-Reply-To: <20210830155903.13907-1-mans0n@gorani.run>
References: <20210822041333.5264-1-mans0n@gorani.run>
 <20210830155903.13907-1-mans0n@gorani.run>
MIME-Version: 1.0
X-Rspamd-Queue-Id: D57A026F
X-Rspamd-UID: 3f0b60
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_085949_366084_E1F7934B 
X-CRM114-Status: GOOD (  10.52  )
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
Tested-by: Frank Wunderlich <frank-w@public-files.de>
---
v4:
* add tested by Frank

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
