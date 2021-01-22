Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E35CC433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 12:14:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 062AD2343E
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 12:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 062AD2343E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T+6nMizUUKBRmRGjGqDw80P09gJcVHfb7aKAqOlOTaQ=; b=FxD5i+BiX7RUE189QMwoYbp8c
	U/+/XC2hZIK3Fh2GiSI8kd+DvMwuAlZhweoGInLs/Y/DY23QR52pKw2UU4Rpt5X9RkQFwmW9nA1yX
	3hMnGhXRTBKQluUKcmda6bG0e/2l128HAwyhcfU4+nr40VxZGCD3/shcU8FzUUxy3VavIWP05eddI
	erCiWEpxkcNUcqLb/YA+PKxZi/11nPhfC9i1ZU3y3TyqhX7UdrDM5D6YvxlekzUcaqRl8wgFXoDrK
	2pfw0dcCxazXAjCz0B2FjWHQZ90SMgSbsXGHXCpCxkM00aVmaPWmLvAWSf/Sons94VOWnoGDQhtT4
	rcTZ9DKNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2vKH-0007eZ-3b; Fri, 22 Jan 2021 12:14:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2vK4-0007XC-7g; Fri, 22 Jan 2021 12:13:53 +0000
X-UUID: 81210e5894984ec7a4eb78e02de21581-20210122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=uUkfGqqCxCFWoBRe1Hp2gLCJX5B+cAZ8kmC5XDvA+IU=; 
 b=Mew0w6qK2hPU7EhcslAgxW7AzJ50Cs85XN4aFZ/E56rMgnqseiGz5yCqWC/o2aDE18wwwkXkP7KX4KpwFA1AOAxQX22RXoEhIij63V1fX8HsQiODjqEMs8Km550HPObsI8+eONFW02Slj1NZ2Fb8uziSSMdl2wJouBD1h/gzcQc=;
X-UUID: 81210e5894984ec7a4eb78e02de21581-20210122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 525576891; Fri, 22 Jan 2021 04:13:47 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 04:03:46 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 20:03:44 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Jan 2021 20:03:44 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [PATCH next v2 15/17] arm: dts: mt7629: harmonize node names and
 compatibles
Date: Fri, 22 Jan 2021 20:03:21 +0800
Message-ID: <20210122120323.4337-15-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210122120323.4337-1-chunfeng.yun@mediatek.com>
References: <20210122120323.4337-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 724D2CBA5CBBCA9E67223AC6DD9CBC8D9C4576045DDCB515EE0AC2073ADA45CB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_071352_436517_8A5301E0 
X-CRM114-Status: GOOD (  10.53  )
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

This is used to fix dtbs_check warning

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
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
