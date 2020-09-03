Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0B2C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:40:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 898BE2072A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 03:40:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ENfF9LuJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="A1hKaZmt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 898BE2072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rU1l1LrfVI1kpm/W7Qq/x2u7mDXjEyvWrcpPD61tAns=; b=ENfF9LuJbFp7dOWDZHcQX4b7g
	KuDdtUZsrKVLx2GWHkvAdx5AH2KYDS6QSPY4ZUKjqBHvmGZPJVLJzHT7DIb7ZYOcQvo/YGePGSdKq
	x2tAVB+7Ov1iihftDjMT/EkYqg+Uyc7EC55irc1KjkBY2dFI/cN04ynXWXAvnMSjPi1Mpul2w9IJq
	oSBHrEnERwRP5bahCNycQZtWeJoEgSRZTi6hiwlGoqe4YcxjDCwGUjrtgRngnkmsHkcdh4MUDATPv
	hE1FAjZmutZOdgH4DyZFC3pF+ruaj798v22SnavSznWDN1r6jUY6WZZC142l7zmIU3gc664vH4xDR
	bBaGSLLcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDg6Q-0006xf-5N; Thu, 03 Sep 2020 03:39:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDg6H-0006sp-Lc; Thu, 03 Sep 2020 03:39:50 +0000
X-UUID: d38f4c06cd034fd78ca80838fa20e6b4-20200902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=G+l2nCRr0+/8nka2nngFFVIR8XrakSr3N56sAqsrVVs=; 
 b=A1hKaZmtmRmjMY2wjjyNJ8HgS7IRd0EGI1MN2d+SFo3qiS9wMOgUpFRV/qrwBpm/1wRJywDK3A1N/yJVzqvakaRfFtSZHkvGfY34/2x0CtKK7lMnRBnsRXq4FGeNsTMQV1MRb5/q2j/+GRrImFj76KnqmQSqhaW3niL4r2uQ6hk=;
X-UUID: d38f4c06cd034fd78ca80838fa20e6b4-20200902
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2053128354; Wed, 02 Sep 2020 19:31:21 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 20:31:20 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 11:31:17 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Sep 2020 11:31:17 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Zhanyong Wang <zhanyong.wang@mediatek.com>
Subject: [RFC PATCH 4/4] arm64: dts: mt8192: add SSUSB related nodes
Date: Thu, 3 Sep 2020 11:28:59 +0800
Message-ID: <1599103739-7873-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1599103739-7873-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1599103739-7873-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 555095332610F26608A183E1336A0372661BB41058C02440A34D47EEA584F1BA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_233949_848924_0005728D 
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
