Return-Path: <SRS0=K1YL=GT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FBAC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jan 2021 09:17:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7278E23A56
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jan 2021 09:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7278E23A56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8BY1ZxVz0ClwBvT8GrZQNXYBXvYHw6mQxZI1Ps/OhzU=; b=I3tAee2jozHI48vgnY5gVcB4A
	m7gXc5i2gf3Olmh7hmvJhDQ6EfO15DXtAcDTwcb1LmhKP3yXK4z5McpexS4xha2PcBsygevZpMfPn
	X7gj2S17IKJMfhTvJ2aTogZhtMHIavDApwmWfDPi9JEVQLAOhve1/duWCEoRNP+bY2+8CyHiaCv/U
	OTTnbJOrpr5ttGgMbY3cJPl6XCAArxaZNrWLevq9aCX1zeGXW4AWD6yr0IBnnXdacOoCY3hlJ3LZS
	rPHeEqLh1pQ1n9VYF1DZYGw+uzaoUjBl5z6Q7SPFFVu2pX1cvPtz3mgczVjbOtVtHtZfJZN4votmR
	twito0EIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0hiD-0001Y0-7E; Sat, 16 Jan 2021 09:17:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0hhu-0001MQ-GW; Sat, 16 Jan 2021 09:17:20 +0000
X-UUID: 16f30cc2eaef401b9ef0e3584855357a-20210116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VR5RTJ8obuOVwCZGur1zpK6Fre5HWsYtAU4oqij905Q=; 
 b=lwcEokpF42DRvTBYxuOjZF+XTySvZTQrE/sMfgQSK/d7Z5LCrnpsrp0WODk6JpjE5nUYl+ifIJ0Yf41fG4Nt7q9hurhCtbtQsfylqMIXliSqDh3+HATvLuXpRayQfyCryy4nk1g9CCq8oCMNFsq7QqSP+QjMBvOyXo8w0V5WGEU=;
X-UUID: 16f30cc2eaef401b9ef0e3584855357a-20210116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1751317817; Sat, 16 Jan 2021 01:17:05 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 16 Jan 2021 01:07:08 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 16 Jan 2021 17:07:03 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 16 Jan 2021 17:07:03 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH next 13/15] arm: dts: mt7629: harmonize node names and
 compatibles
Date: Sat, 16 Jan 2021 17:06:54 +0800
Message-ID: <20210116090656.11752-13-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
References: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 83740CD150C773CF618FC4FA73D09DAFF1321D15ABC9DA8D35617FCFD9397B312000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_041718_727957_7265F1A2 
X-CRM114-Status: UNSURE (   9.66  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is used to fix dtbs_check warning

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
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
