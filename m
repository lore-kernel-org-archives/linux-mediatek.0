Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F065AC432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 15:00:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAF8A60E90
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 15:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAF8A60E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AfQsymxKoLxKL7NcIUpeovThjDeEhOfmqgxHfLDmI9c=; b=RqpGdvSySTTMGr
	D/aPP9rJFOb5C6wTun0KRJq0l3jyf+sko8O3R/Tvukg3Cf68dxhG6QTdA6uI9QqLBy8OB73s+9+IC
	Q8KVYQP+wAwZvD01BIVrdzNFNZ86XWmpWkBN3IMHcWfpRd+04fCira8aLcyswgbiM8s/clKJTQC/j
	MdazlML4fs9C2PXVikNxRk3BrsVV+5Sww4lM+K1BhWYeX+3GMHOzXpSwxlZZKLCnGlx/+sWEdGwkB
	jRUf/IyYh57I9lbqYJtBulApfSdcnhUjhvoVVBFGm6Jlgw7fAGoiN70EQ79tdRWVLbGVgZeOExb91
	OSnSVVqefAuxWrejJLQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKils-00HU4H-R8; Mon, 30 Aug 2021 15:00:24 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKild-00HTxw-KX; Mon, 30 Aug 2021 15:00:13 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
 by mxout3.routing.net (Postfix) with ESMTP id 5AFF5604DD;
 Mon, 30 Aug 2021 15:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1630335606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FB34z+C8sGX7ZZ7kAsjc/5fqFHG4raJPZ6x3LyD7ocE=;
 b=hBakEaTBn9R0yk9TKrAV8B3L1JVUjd5HdThgCAOP1u7JJ2FoUwWJnR5ACemZrltDFDT4K1
 WejpT517SruouMylAXEgg+91cgFnN2aI/sA/wKxMkLQ7D+ol6cvfkg3in5L/VA3YZJomJr
 fpmNV55jQISDc0xI1ZHgsQWsh8X9Ew8=
Received: from localhost.localdomain (fttx-pool-157.180.227.230.bambit.de
 [157.180.227.230])
 by mxbox4.masterlogin.de (Postfix) with ESMTPSA id ADCE28008C;
 Mon, 30 Aug 2021 15:00:05 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm: dts: mt7623: add otg nodes for bpi-r2
Date: Mon, 30 Aug 2021 16:59:58 +0200
Message-Id: <20210830145958.108605-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: a7d5b3dd-a653-44e9-8e1d-254951e06a6d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_080009_870246_8DC1ADEC 
X-CRM114-Status: UNSURE (   9.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add OTG-Nodes for BananaPi-R2

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
patch is based on

"arm: dts: mt7623: add musb device nodes"

https://patchwork.kernel.org/project/linux-mediatek/patch/20210822041333.5264-2-mans0n@gorani.run/
---
v2:
	rebase on plain 5.14, v1 was based on some not upstreamed work
---
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index e96aa0ed1ebd..027c1b0c6a98 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -366,6 +366,14 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pio {
+	musb_pins: musb {
+		pins-musb {
+			pinmux = <MT7623_PIN_237_EXT_SDIO2_FUNC_DRV_VBUS>;
+		};
+	};
+};
+
 &pwm {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pwm_pins_a>;
@@ -396,6 +404,19 @@ &uart2 {
 	status = "okay";
 };
 
+&usb0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&musb_pins>;
+	status = "okay";
+	usb-role-switch;
+
+	connector {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		type = "micro";
+		id-gpios = <&pio 44 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &usb1 {
 	vusb33-supply = <&reg_3p3v>;
 	vbus-supply = <&reg_5v>;
@@ -408,6 +429,10 @@ &usb2 {
 	status = "okay";
 };
 
+&u2phy1 {
+	status = "okay";
+};
+
 &u3phy1 {
 	status = "okay";
 };
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
