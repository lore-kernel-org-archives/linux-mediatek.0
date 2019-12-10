Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E531C43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 08:15:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 144312073D
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 08:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oi6ReT0O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eagJVm76"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 144312073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6d3RdahElEBA6k8435Hb+hr5F3SOd++X6WeCwJqYmA=; b=oi6ReT0OEj8v7C
	cD8sTSjSN4VmEsXo2CLdWYHbdSeJFxT5gBo+IUszptztaGbUwX1i1ycaiHq/XOPYuMkMPjcZ8WiNJ
	voQXmd93+Ss2V/FmO289YzRwlH4mpvmteFkY1LtwSwMN2BPGzjgd9vePG+NZK1iaxL7AYvaEjXLNQ
	55y/onXsKG3zZLh7O8V4W9ys8EXQmtKsYHi+KlziCERXVCIl09qHVK29BHNFYS4dStX2Nj+2x/tCn
	OXbtc993xwXaELfA/aKXdHVx1fN0ihnzs27XV1zn0OEvIB3vyV4xGrCh3M0gSs0hASbACetcARd1Z
	gC+iT/FG/92ghBjNOrNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieafb-0000A1-TD; Tue, 10 Dec 2019 08:14:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieafV-0008Tz-BU
 for linux-mediatek@lists.infradead.org; Tue, 10 Dec 2019 08:14:54 +0000
X-UUID: 88e335affded4712a666f2675a839654-20191210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BT+q/z4xoeKXCk+y25bvARvW/z0vRa1uB7kHqAjvpaw=; 
 b=eagJVm76XNgnVVvxDHR4QtcIyynPPYY4k7twyvlRAQeSnsJbABh1afLK+LlxnJ0TM069F+hNNzWXq7ZGru/I+gYhmqZcYCt/SkEYgxdTb0VNE+DIW0hmNAOoJ0i23gobJ3xa7JVRfIfeZcbjwRJSuqwzLBRZBLIFzqSs71VZx1Y=;
X-UUID: 88e335affded4712a666f2675a839654-20191210
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 444849056; Tue, 10 Dec 2019 00:14:49 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 00:15:03 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 16:14:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 10 Dec 2019 16:14:27 +0800
From: Landen Chao <landen.chao@mediatek.com>
To: <andrew@lunn.ch>, <f.fainelli@gmail.com>,
 <vivien.didelot@savoirfairelinux.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Subject: [PATCH net-next 6/6] arm64: dts: mt7622: add mt7531 dsa to
 bananapi-bpi-r64 board
Date: Tue, 10 Dec 2019 16:14:42 +0800
Message-ID: <62eef5503c117f48d4b41e94fd28d75e123590b4.1575914275.git.landen.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1575914275.git.landen.chao@mediatek.com>
References: <cover.1575914275.git.landen.chao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_001453_422723_9458617E 
X-CRM114-Status: UNSURE (   6.61  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <landen.chao@mediatek.com>,
 frank-w@public-files.de, netdev@vger.kernel.org, sean.wang@mediatek.com,
 linux-kernel@vger.kernel.org, opensource@vdorst.com,
 linux-mediatek@lists.infradead.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mt7531 dsa to bananapi-bpi-r64 board for 5 giga Ethernet ports support.

Signed-off-by: Landen Chao <landen.chao@mediatek.com>
---
 .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 83e10591e0e5..ffacefee8e2a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -143,6 +143,56 @@
 	mdio: mdio-bus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		switch@0 {
+			compatible = "mediatek,mt7531";
+			reg = <0>;
+			reset-gpios = <&pio 54 0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					label = "wan";
+				};
+
+				port@1 {
+					reg = <1>;
+					label = "lan0";
+				};
+
+				port@2 {
+					reg = <2>;
+					label = "lan1";
+				};
+
+				port@3 {
+					reg = <3>;
+					label = "lan2";
+				};
+
+				port@4 {
+					reg = <4>;
+					label = "lan3";
+				};
+
+				port@6 {
+					reg = <6>;
+					label = "cpu";
+					ethernet = <&gmac0>;
+					phy-mode = "2500base-x";
+
+					fixed-link {
+						speed = <2500>;
+						full-duplex;
+						pause;
+					};
+				};
+			};
+		};
+
 	};
 };
 
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
