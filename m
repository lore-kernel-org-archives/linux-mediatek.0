Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5509C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 07:10:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C50F64E30
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 07:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C50F64E30
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n71CzTTziZ5P4p2YqNkGYRc6055KR1kPGyPi+kJ6eD8=; b=C+z1X/9F8RCfSwwRaNKzxRCGR
	tAf6Hc5AVesPU8EB9soKjEWGk3cjeYImCIsBaIb9IQ/swAPGWMgy4ShHSWQGplfEmqXYLq65HWYnc
	Y0JLn99k58plABTj61xtvZseVKfur9IO9VLuJ5P6TR4cKfqkuoLpsgxVvZ6IQbAJOjxETjlrrmcSu
	7eyp3vEkg7zsnUbtm6wJ/8vBndo71+z0Ob4gvO8BtIdn3uWgBtoVft9DCTVK8v+mBMZaxbiyr0O+I
	oSWlHw4vrw0jgZIAOpGHxeLodx4U2jegLAfWvSsb/94+vLC4gwur9GiFLHgZI0r/Xn0/EMGGFZDaT
	SV34r2edw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6TM5-0003kK-7e; Mon, 01 Feb 2021 07:10:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6TM2-0003ij-QV; Mon, 01 Feb 2021 07:10:36 +0000
X-UUID: 03ded6cfef6d4020bf245e402ed73e5a-20210131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=C3ATWN1+oY0xGAGinwc0R+3+ArJ0j5lmgz03y3lyQHo=; 
 b=E5FgA+m+flYAt0+xpM2Cbxfy61oPuB/g9DExAure8NDLOkZEdcAmXvhzZkZv0y2NjGeGiH3FHtGMpiWOaDomEjuL+bTU/F6ug4S0cLLJMZCkbnqI/u1MWVrKBnq+Wi1lI7KOY2utl4CodUlfZUDz3jXk5LOOuBviBDUpz5rOpE0=;
X-UUID: 03ded6cfef6d4020bf245e402ed73e5a-20210131
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1118446569; Sun, 31 Jan 2021 23:10:31 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 31 Jan 2021 23:00:38 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Feb 2021 15:00:30 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 1 Feb 2021 15:00:30 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH next v3 14/16] arm: dts: mt7629: harmonize node names and
 compatibles
Date: Mon, 1 Feb 2021 15:00:14 +0800
Message-ID: <20210201070016.41721-14-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
References: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 48AA4ECAD272AC694A4EDE2BA7F3A7458B1DA5C31968D581750C53D7B115D6102000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_021035_119015_C91D0C80 
X-CRM114-Status: GOOD (  10.12  )
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

This is used to fix dtbs_check warning

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v3: no changes
---
 arch/arm/boot/dts/mt7629.dtsi | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/mt7629.dtsi b/arch/arm/boot/dts/mt7629.dtsi
index 5cbb3d244c75..874043f0490d 100644
--- a/arch/arm/boot/dts/mt7629.dtsi
+++ b/arch/arm/boot/dts/mt7629.dtsi
@@ -329,8 +329,9 @@
 			status = "disabled";
 		};
 
-		u3phy0: usb-phy@1a0c4000 {
-			compatible = "mediatek,generic-tphy-v2";
+		u3phy0: t-phy@1a0c4000 {
+			compatible = "mediatek,mt7629-tphy",
+				     "mediatek,generic-tphy-v2";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x1a0c4000 0xe00>;
@@ -413,14 +414,15 @@
 			};
 		};
 
-		pciephy1: pcie-phy@1a14a000 {
-			compatible = "mediatek,generic-tphy-v2";
+		pciephy1: t-phy@1a14a000 {
+			compatible = "mediatek,mt7629-tphy",
+				     "mediatek,generic-tphy-v2";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x1a14a000 0x1000>;
 			status = "disabled";
 
-			pcieport1: port1phy@0 {
+			pcieport1: pcie-phy@0 {
 				reg = <0 0x1000>;
 				clocks = <&clk20m>;
 				clock-names = "ref";
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
