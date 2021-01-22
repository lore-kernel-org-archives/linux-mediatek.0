Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FE9C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 12:14:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACEC023444
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 12:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACEC023444
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5wAJkw8hR2RCYBAYnDHH60TtypXxh91ZzIvqwsc11oY=; b=MInva+Bkj280t3RXCDZVo6DGy
	qcxDViNM+w6gEwWf/AOVVqwcpo4Y7NsbkumV7ad5u0g8yGdn2fotDvTd2QXJO7iyMv+unbEMmkglC
	DHEDG8iyOmm1Klc6kgffXa//AjbuvrxEFLq6VK2tiLU27ifueWMDtvoTUs2yM55X1l7s+NlFz1+xi
	ltqwe9MXXvG/MWwl0sYAyVFKeZEwqmxVXc+GiMuQ7Sxp4s3itj5I1EUDyrd6nA08nUwI3UcEytQHl
	ESUomBo5ov6n1WNaDLL4ptAaQkXSMuIp1MGZ+kau7NgCmhK1QkpL6e0D8yQxb2y15emlQ+hcsdECn
	a0VNx2Gqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2vKY-0007lc-GX; Fri, 22 Jan 2021 12:14:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2vK5-0007XC-U1; Fri, 22 Jan 2021 12:13:55 +0000
X-UUID: ab952e0e7f3e4c70abda425a4c5af915-20210122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IoSpFkZfN5zWBssj/M0jIzpQEODxOOztR6vrrRwST9Q=; 
 b=LLl1w5H5SygoyDBi+VFXgeexB/GMOw6DQJS8Elc+XBQ4Et/H05s534JqWJ2XVRjcTUD3oHtWX3kNcJK3uB2kTOCVoIxMS2dVOV15sLcbPFN5jGx/zOkFGPHCn84jImtySfnCDjG1BS31iD9AYZ1n3sgReDzEOx0CG+yhZdQn/Jw=;
X-UUID: ab952e0e7f3e4c70abda425a4c5af915-20210122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 571154636; Fri, 22 Jan 2021 04:13:47 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 04:03:47 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 20:03:44 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Jan 2021 20:03:43 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [PATCH next v2 14/17] arm64: dts: mediatek: mt8183: fix dtbs_check
 warning
Date: Fri, 22 Jan 2021 20:03:20 +0800
Message-ID: <20210122120323.4337-14-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210122120323.4337-1-chunfeng.yun@mediatek.com>
References: <20210122120323.4337-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 62EA1FA93DE4F85F02C2B74F15D1006C0FC5CB1F644CDC0AB45944C9F7ED8D2A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_071354_139701_7EDC059F 
X-CRM114-Status: GOOD (  10.30  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Harmonize node names, compatibles and properties.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 5b782a4769e7..a69a033a68ac 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -865,7 +865,7 @@
 			ranges;
 			status = "disabled";
 
-			usb_host: xhci@11200000 {
+			usb_host: usb@11200000 {
 				compatible = "mediatek,mt8183-xhci",
 					     "mediatek,mtk-xhci";
 				reg = <0 0x11200000 0 0x1000>;
@@ -908,11 +908,11 @@
 			status = "disabled";
 		};
 
-		mipi_tx0: mipi-dphy@11e50000 {
+		mipi_tx0: dsi-phy@11e50000 {
 			compatible = "mediatek,mt8183-mipi-tx";
 			reg = <0 0x11e50000 0 0x1000>;
 			clocks = <&apmixedsys CLK_APMIXED_MIPID0_26M>;
-			clock-names = "ref_clk";
+			clock-names = "ref";
 			#clock-cells = <0>;
 			#phy-cells = <0>;
 			clock-output-names = "mipi_tx0_pll";
@@ -931,11 +931,10 @@
 			};
 		};
 
-		u3phy: usb-phy@11f40000 {
+		u3phy: t-phy@11f40000 {
 			compatible = "mediatek,mt8183-tphy",
 				     "mediatek,generic-tphy-v2";
 			#address-cells = <1>;
-			#phy-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0 0x11f40000 0x1000>;
 			status = "okay";
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
