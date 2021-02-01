Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29974C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 07:00:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9E2864E30
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 07:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9E2864E30
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dQcdRyqXAbzdpEFCj1y46nSrse5gh85kuSGRf94sWVM=; b=o/zSgrph7gjFYzdBnQCc89DU3
	ZFN1d8r6+1eVnoFWfVi8jdzKbJDWOE9DH2sXRrlIjWNCSt5xfFUtlk2WluZPWWbIgmFjwO9hsT42b
	m4ZUnAkDzXo42rQOFSfON+KMpQ/omYst2Bm50C4T/vkyXX9X8k7b+XsN6fVRHhEhTpIihMwRnGEbp
	Vfy6KOL4p4WrusSjRORBUihFYR11auuvG6aTxcY++WUVaycxTIb0rVZkG8JE/lWc5GlraRjZNmwOe
	KVP2y2xnDq8LW8Ru92zSrY4LWQWo6ZNJKZ9F3ik+oPqL/PrUoMCoU+VA4a9EGFRFZdkeuCAy+mxeg
	oeYO96NEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6TCX-0001gc-Fh; Mon, 01 Feb 2021 07:00:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6TCU-0001fP-Qy; Mon, 01 Feb 2021 07:00:44 +0000
X-UUID: c63bf94f768745fca60ce91bd78b38be-20210131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bGjHJF6RZKKemR27qW1pqZryA/7HPE2P9xKrjpMmo0Y=; 
 b=BDEBco63DWaSbPB7uZaJjo6Ud/H5NzTkBLZLmCuGfvTQV7oeSXDc8xjd01RyJ2E0HZq15GmIhaW3NPnN4T0/b8DHl2ywPO2HRjhgbt1/1RjG6dX+itLJnyP6HmNe7hv6CHJqDxOGh30acyNxVquKPJNKvhHf1o2bYAhA43tPQlU=;
X-UUID: c63bf94f768745fca60ce91bd78b38be-20210131
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1688935844; Sun, 31 Jan 2021 23:00:39 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 31 Jan 2021 23:00:33 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Feb 2021 15:00:30 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 1 Feb 2021 15:00:30 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH next v3 13/16] arm64: dts: mediatek: mt8183: fix dtbs_check
 warning
Date: Mon, 1 Feb 2021 15:00:13 +0800
Message-ID: <20210201070016.41721-13-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
References: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F35C95C5F653576E0C7267B963AB40C92DF40E2A3A3BC513DF55976A89FB3E582000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_020043_100246_04EF8B6D 
X-CRM114-Status: GOOD (  10.45  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Harmonize node names, compatibles and properties.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: remove property clock-names suggested by CK
v2: no changes
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 5b782a4769e7..12a3c7f03e1a 100644
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
@@ -908,11 +908,10 @@
 			status = "disabled";
 		};
 
-		mipi_tx0: mipi-dphy@11e50000 {
+		mipi_tx0: dsi-phy@11e50000 {
 			compatible = "mediatek,mt8183-mipi-tx";
 			reg = <0 0x11e50000 0 0x1000>;
 			clocks = <&apmixedsys CLK_APMIXED_MIPID0_26M>;
-			clock-names = "ref_clk";
 			#clock-cells = <0>;
 			#phy-cells = <0>;
 			clock-output-names = "mipi_tx0_pll";
@@ -931,11 +930,10 @@
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
