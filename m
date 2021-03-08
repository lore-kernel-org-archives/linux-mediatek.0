Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDA8C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 05:40:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 495DA651EE
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 05:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 495DA651EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+sJ0m3nKm7sf2fnR8diDfyRZ4ICpncSt/DJqr7K4cTE=; b=lC7CeD8+lhtYYNVsqaHyRn7o6
	HreujJpPeN1/nPpkeBoInTXUp28Ew330gqfYdOfJe4FhLUGrzoYvlmOArXsCZiG3l6vcd+DEht9pn
	J5qT4x6XjKzTa9Y4c0xe9R3fnD4FlRZsEoQ//ir0oZiMoAONeOxXlT9zgt80v2WsrdqHqoatnwtwW
	WpEWorhNE5xrIcCv6WTmRda39qBa7GKETeAr/7RlMsZ/CDQuSbgHOUDN4cpjwqnuwBrPIMNQE+qTr
	KWWDTehI1qEUlQ7kEOh1b0tr5osNbxLXLgZz8qlzqUDon70e31KKP2h8lzGVpFUe8ih2pySr01mE4
	iSmtBF8nQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ8cV-00FIaj-US; Mon, 08 Mar 2021 05:39:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ8c8-00FIMD-P5; Mon, 08 Mar 2021 05:39:36 +0000
X-UUID: f608b32c000046eebe7118cbdaa71ec7-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=M43plPAlJu0dIq9N1qVljuhme6bwHRp+zmB6OUheLr0=; 
 b=IKCJ66mi+z76FH3tXWk9aE+4vmfn1uOcjFkI49D5bUYop4kU8dcqH3OuFbc8/GYRwgzfaiBW9vdL4gGzamb/GgNrmn+04g9iROObqmvey2umiPVnSO9F5iuFjakwnFmfVdvPbKlpc99jmBQArPgtoUjUWmaWYqZBHbHQIkwx9xA=;
X-UUID: f608b32c000046eebe7118cbdaa71ec7-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2131090577; Sun, 07 Mar 2021 21:39:26 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 21:37:51 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 13:37:50 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 8 Mar 2021 13:37:49 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
Subject: [PATCH v4 07/12] arm64: dts: mediatek: mt8516: harmonize node names
 and compatibles
Date: Mon, 8 Mar 2021 13:37:40 +0800
Message-ID: <20210308053745.25697-7-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210308053745.25697-1-chunfeng.yun@mediatek.com>
References: <20210308053745.25697-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 935F5C00A7322E8CAB4DB261B1E7BC0B77011C37FC0CA73782C288BA4BCDDE242000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_053933_694795_F46A1648 
X-CRM114-Status: GOOD (  11.21  )
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

This is used to fix dtbs_check warning:
  harmonize node names and compatibles;
  add property "usb-role-switch" for connector dependence.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v4: no changes
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi         | 9 +++++----
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 1 +
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index b80e95574bef..bbe5a1419eff 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -480,7 +480,7 @@
 		};
 
 		usb0: usb@11100000 {
-			compatible = "mediatek,mtk-musb";
+			compatible = "mediatek,mt8516-musb", "mediatek,mtk-musb";
 			reg = <0 0x11100000 0 0x1000>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-names = "mc";
@@ -493,7 +493,7 @@
 		};
 
 		usb1: usb@11190000 {
-			compatible = "mediatek,mtk-musb";
+			compatible = "mediatek,mt8516-musb", "mediatek,mtk-musb";
 			reg = <0 0x11190000 0 0x1000>;
 			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-names = "mc";
@@ -506,8 +506,9 @@
 			status = "disabled";
 		};
 
-		usb_phy: usb@11110000 {
-			compatible = "mediatek,generic-tphy-v1";
+		usb_phy: t-phy@11110000 {
+			compatible = "mediatek,mt8516-tphy",
+				     "mediatek,generic-tphy-v1";
 			reg = <0 0x11110000 0 0x800>;
 			#address-cells = <2>;
 			#size-cells = <2>;
diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index 63fd70086bb8..7d738f01cf8d 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -188,6 +188,7 @@
 &usb0 {
 	status = "okay";
 	dr_mode = "peripheral";
+	usb-role-switch;
 
 	usb_con: connector {
 		compatible = "usb-c-connector";
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
