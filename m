Return-Path: <SRS0=jhbW=2B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CFDC43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 06:05:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B8892077B
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 06:05:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T2Y5U9nx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ESKfSwtY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B8892077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYHKcVfgXXVWHCsBcNYiGu3rplDbkYFuTWK9v5JMUr4=; b=T2Y5U9nx9+nSD3
	wTPP3A+xNPTwqb9AJDpnwejRK+dldKQUnx+KrMreytpvYUHVd48ef40x0ApfXWfM8CDzbrRDQ6pOE
	y5qyXt9oCOFWQg/iSbGwzMH7tc0FZjErnZq/KQ1g09JtK/Tq5aP2r7pK5sCMtnr2hTFJs1CB8NL4C
	S4rnartSGQL/934Oz22z38L/rWH93mhsZpb33CTGfAFOAZhNhJuRzgtPatOCYJrbVjFb1XDITt1c+
	xgZm9hUG9drDZig+Z5wEzhLKDT0aSBNHrJolfjnNqs/zmcJNOXwRrbX6645PM8npTE8PD5OuMXn17
	4mtbtXLebhkHtba3Pd9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iev7H-0003dj-CI; Wed, 11 Dec 2019 06:04:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iev7F-0003ce-1o; Wed, 11 Dec 2019 06:04:54 +0000
X-UUID: da5cf4dd9a4449b0a55e6e7f740e0bf4-20191210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XON1V6tySuKrrDd+LZuRUKWj6qe9V3o3++228yp8h3k=; 
 b=ESKfSwtYEJel+qShT+LTMdaz2d0yPLjuphWzpp3VWmsECyoUHMgKyS0tEwAt4BVwVPcZQziES9mpY9wcTVIPT/jcgs2njpu3fqn2TK1cjTJC9ugsBEb+45W6dzrMdd/E3F75MjdFZJIvvwZw5t5Fa8IiHdv2I6DveiMyp18pJfM=;
X-UUID: da5cf4dd9a4449b0a55e6e7f740e0bf4-20191210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1188864698; Tue, 10 Dec 2019 22:04:47 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 21:55:57 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 13:53:58 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Dec 2019 13:54:50 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH v5 11/11] arm64: dts: mt2712: use non-empty ranges for usb-phy
Date: Wed, 11 Dec 2019 13:54:23 +0800
Message-ID: <1576043663-14240-11-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1576043663-14240-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1576043663-14240-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E8A290FF9FD2179443F17556F81E7A3BC6A551CDB3B9A8AC9CC0F71F0DD2591A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_220453_102025_14115FCF 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use non-empty ranges for usb-phy to make the layout of
its registers clearer;
Replace deprecated compatible by generic

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3~v5: no changes

v2: use generic compatible
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi | 42 ++++++++++++-----------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index 43307bad3f0d..e24f2f2f6004 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -697,30 +697,31 @@ usb_host0: xhci@11270000 {
 	};
 
 	u3phy0: usb-phy@11290000 {
-		compatible = "mediatek,mt2712-u3phy";
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
+		compatible = "mediatek,mt2712-tphy",
+			     "mediatek,generic-tphy-v2";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0x11290000 0x9000>;
 		status = "okay";
 
-		u2port0: usb-phy@11290000 {
-			reg = <0 0x11290000 0 0x700>;
+		u2port0: usb-phy@0 {
+			reg = <0x0 0x700>;
 			clocks = <&clk26m>;
 			clock-names = "ref";
 			#phy-cells = <1>;
 			status = "okay";
 		};
 
-		u2port1: usb-phy@11298000 {
-			reg = <0 0x11298000 0 0x700>;
+		u2port1: usb-phy@8000 {
+			reg = <0x8000 0x700>;
 			clocks = <&clk26m>;
 			clock-names = "ref";
 			#phy-cells = <1>;
 			status = "okay";
 		};
 
-		u3port0: usb-phy@11298700 {
-			reg = <0 0x11298700 0 0x900>;
+		u3port0: usb-phy@8700 {
+			reg = <0x8700 0x900>;
 			clocks = <&clk26m>;
 			clock-names = "ref";
 			#phy-cells = <1>;
@@ -760,30 +761,31 @@ usb_host1: xhci@112c0000 {
 	};
 
 	u3phy1: usb-phy@112e0000 {
-		compatible = "mediatek,mt2712-u3phy";
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
+		compatible = "mediatek,mt2712-tphy",
+			     "mediatek,generic-tphy-v2";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0 0x112e0000 0x9000>;
 		status = "okay";
 
-		u2port2: usb-phy@112e0000 {
-			reg = <0 0x112e0000 0 0x700>;
+		u2port2: usb-phy@0 {
+			reg = <0x0 0x700>;
 			clocks = <&clk26m>;
 			clock-names = "ref";
 			#phy-cells = <1>;
 			status = "okay";
 		};
 
-		u2port3: usb-phy@112e8000 {
-			reg = <0 0x112e8000 0 0x700>;
+		u2port3: usb-phy@8000 {
+			reg = <0x8000 0x700>;
 			clocks = <&clk26m>;
 			clock-names = "ref";
 			#phy-cells = <1>;
 			status = "okay";
 		};
 
-		u3port1: usb-phy@112e8700 {
-			reg = <0 0x112e8700 0 0x900>;
+		u3port1: usb-phy@8700 {
+			reg = <0x8700 0x900>;
 			clocks = <&clk26m>;
 			clock-names = "ref";
 			#phy-cells = <1>;
-- 
2.24.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
