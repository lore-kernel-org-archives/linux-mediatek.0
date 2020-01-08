Return-Path: <SRS0=HKXf=25=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556DDC33C99
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 02:01:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A71420848
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 02:01:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DtHeSEY6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="n32hK4ue"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A71420848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYHKcVfgXXVWHCsBcNYiGu3rplDbkYFuTWK9v5JMUr4=; b=DtHeSEY6nQd+pa
	coWmwC2ZgHXl8Vz0s4dJDXl1oBhYY1BUAVuMSX1VUBGIakwmtpuCbN3u1aq0Wqmv3lchrgohfzuSO
	9LsDtcIQQXw6yv2QfZH6szAjxPuqykHETfN8lY/wjyKeMGtmmzc7FwGNl7u3LL3YjtenqKowqolwN
	PT400IhIAK90DULTprvVyk/pCUDRywvyKVJhnbWwo3EC767Tp8aW2qx4cQfM9tImSQStJYS7/MIDC
	Hj+rIkkMqjZzdNecOLSbUJyrh3sPSGOO3qCcYJDzs9RfyEGipjvMs1KF8bgkkrv4hLLta83VE2i4s
	CVftT2hfkUFT2ewRWOUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip0eu-0000Ww-P9; Wed, 08 Jan 2020 02:01:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip0eh-0000In-7l; Wed, 08 Jan 2020 02:01:08 +0000
X-UUID: 0a1e0f4e071345a581d36a292695d981-20200107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XON1V6tySuKrrDd+LZuRUKWj6qe9V3o3++228yp8h3k=; 
 b=n32hK4uepg8xny5iSYNAA4s0iMkd8NmhhDkL6xamLTo5Eo/UUNrssKgDj/OfxxKR+QMHdvVjLc9GxXuUXYlrWDapp7+t6AYO/IkneTfyT6qxRo5arv4jYpR96FanLnQcbRrgL+cAU2ybW8/SiDkQ5X2VfPbQ3eM938t854WFazI=;
X-UUID: 0a1e0f4e071345a581d36a292695d981-20200107
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1743964777; Tue, 07 Jan 2020 18:01:02 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 Jan 2020 17:53:11 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 8 Jan 2020 09:50:54 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 8 Jan 2020 09:53:08 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [RESEND PATCH v5 11/11] arm64: dts: mt2712: use non-empty ranges for
 usb-phy
Date: Wed, 8 Jan 2020 09:52:06 +0800
Message-ID: <1578448326-27455-11-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1578448326-27455-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1578448326-27455-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 32088C3A5289AA2B75F197998577605D9ED7203238422932856D68F6EB9315852000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_180107_280362_16D73DA4 
X-CRM114-Status: UNSURE (   9.55  )
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
