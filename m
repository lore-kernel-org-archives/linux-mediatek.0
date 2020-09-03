Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10638C433E7
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:39:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDFFC2072A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:39:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J/cY1Cy7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TgxVzL42"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDFFC2072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rU1l1LrfVI1kpm/W7Qq/x2u7mDXjEyvWrcpPD61tAns=; b=J/cY1Cy70MDeft7PGVAa3x2Um
	cMfElKLth553oS6SfmcduJ1ifYlEgKk4xHt996ry5wdubFCK4B02vrdA1vhyAX8II6lMTxoEGMpJM
	6s6vRgjp9VBE/Mc3CpUkQTN9n7ok/1yTDj8R0VmwxI357EI01t0d7gUq9FjEmmfN+DSfe7ou6cF7E
	G9zDwL6WNnMhnx2Nuvhi04gKYsF+YbeFRMgkhgoy+wwMzDJXP56j+lbxhtfVubLpsV9k19xrPn8kT
	NY2fwn/nhOSPt2td3Uy7cfRnBFBEi5Jzv69DD0PHGO++8h9yCmqrzuHp6EsrgFB36hc0AltujV9LH
	+Jm36cW7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDg5z-0006k3-6O; Thu, 03 Sep 2020 03:39:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDg5s-0006gA-C9; Thu, 03 Sep 2020 03:39:25 +0000
X-UUID: e4cd28f29ea54a1c8afbb5007615c66c-20200902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=G+l2nCRr0+/8nka2nngFFVIR8XrakSr3N56sAqsrVVs=; 
 b=TgxVzL42IyHDk+MKrBWupj9Z4pNFzKtA0nv2MlJflitamZPzpL42OfwvDtF/XZSAbSMTlFNEtGD+Ha/VfaBlNif79KHVfPbIXxIz+Eccm90kQrQ1ruInxUPD8ZC9bqiGnOE7IdAXF653GzsTJ+lyKgl89ZyfShmURGRJAsTvyCI=;
X-UUID: e4cd28f29ea54a1c8afbb5007615c66c-20200902
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 573485749; Wed, 02 Sep 2020 19:36:14 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 20:36:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 11:36:08 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Sep 2020 11:36:09 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Zhanyong Wang <zhanyong.wang@mediatek.com>
Subject: [RFC PATCH 4/4] arm64: dts: mt8192: add SSUSB related nodes
Date: Thu, 3 Sep 2020 11:34:25 +0800
Message-ID: <1599104065-8009-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1599104065-8009-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1599104065-8009-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3A3E419C5DC6D5207B72190C999188292D90C9DBD895924E68040D78088BB0772000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_233924_544202_36600DB9 
X-CRM114-Status: GOOD (  11.91  )
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
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Zhanyong Wang <zhanyong.wang@mediatek.com>

Add SSUSB related nodes for mt8192

Signed-off-by: Zhanyong Wang <zhanyong.wang@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
Depends on:
https://patchwork.kernel.org/patch/11713559/
[v4,1/3] arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 48 ++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 8871c2f..755f152 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -434,6 +434,54 @@
 			status = "disabled";
 		};
 
+		xhci: xhci@11200000 {
+			compatible = "mediatek,mt8192-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x11200000 0 0x1000>,
+			      <0 0x11203e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts-extended = <&gic GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&pio 211 IRQ_TYPE_LEVEL_LOW>;
+			phys = <&u2port0 PHY_TYPE_USB2>,
+			       <&u3port0 PHY_TYPE_USB3>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_SEL>,
+					  <&topckgen CLK_TOP_SSUSB_XHCI_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&infracfg CLK_INFRA_SSUSB>,
+				 <&infracfg CLK_INFRA_SSUSB_XHCI>,
+				 <&apmixedsys CLK_APMIXED_USBPLL>;
+			clock-names = "sys_ck", "xhci_ck", "ref_ck";
+			mediatek,syscon-wakeup = <&pericfg 0x420 3>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+		};
+
+		u3phy0: usb-phy@11e40000 {
+			compatible = "mediatek,mt8192-tphy",
+				     "mediatek,generic-tphy-v2";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "okay";
+
+			u2port0: usb-phy@11e40000 {
+				reg = <0 0x11e40000 0 0x700>;
+				clocks = <&clk26m>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+				status = "okay";
+			};
+
+			u3port0: usb-phy@11e40700 {
+				reg = <0 0x11e40700 0 0x900>;
+				clocks = <&clk26m>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+				status = "okay";
+			};
+		};
+
 		audsys: syscon@11210000 {
 			compatible = "mediatek,mt8192-audsys", "syscon";
 			reg = <0 0x11210000 0 0x1000>;
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
