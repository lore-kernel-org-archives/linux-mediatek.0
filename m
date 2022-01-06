Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4AAC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 03:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+PFR0QPCXOMPs5YF9ozGifzS2dWakvrnu7uLbnzH+c0=; b=yhCHI1jCxp9j0V
	1MdchbqN+0k6Ybme3oHuSKlHypeTQjpDwnXWc5YuW1yTDnqzxV8M9ROEpsnMLWgnF9kHzB7wqYZtS
	vFCb4nM4B23o6aBTT6TW9hr94mC4e8+CTOsHOJODaWVL9h/FHG1dYc3fBAtOTcUQjYt4IZ0S/fmzR
	Nt2sYiMCq5g2U5EuJRMa0lNGclR/cnopbdItA31BhfFd8Jdjhoy+iHozSV1fPxLz8ySp9gBuC2uD3
	lK4oaERlbrcL5Lj/IqGQkjUorELcLNN7t9i82jwnaVNzENJTkfHQEOEsDy+5+xHjRBQO2ozjBw3Qx
	N0/KT9+UtnQODuZ7S/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5JP6-00GHn5-RO; Thu, 06 Jan 2022 03:25:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5JOE-00GHVs-Ll; Thu, 06 Jan 2022 03:24:36 +0000
X-UUID: c5465ed6a053453daeeca00983543443-20220105
X-UUID: c5465ed6a053453daeeca00983543443-20220105
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 548252198; Wed, 05 Jan 2022 20:24:25 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Jan 2022 19:24:24 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 6 Jan 2022 11:24:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 Jan 2022 11:24:22 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, <nfraprado@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <drinkcat@chromium.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v2 1/5] arm64: dts: mediatek: Correct uart clock of MT8192
Date: Thu, 6 Jan 2022 11:24:16 +0800
Message-ID: <20220106032420.11544-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220106032420.11544-1-allen-kh.cheng@mediatek.com>
References: <20220106032420.11544-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_192434_799315_BF836902 
X-CRM114-Status: GOOD (  13.42  )
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

From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

When the initial devicetree for mt8192 was added in 48489980e27e ("arm64:
dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile"), the
clock driver for mt8192 was not yet upstream, so the clock property nodes
were set to the clk26m clock as a placeholder.

Given that the clock driver has since been added through 710573dee31b ("clk:
mediatek: Add MT8192 basic clocks support"), as well as its dt-bindings
through f35f1a23e0e1 ("clk: mediatek: Add dt-bindings of MT8192 clocks") and
devicetree nodes through 5d2b897bc6f5 ("arm64: dts: mediatek: Add mt8192
clock controllers"), fix the uart clock property to point to the actual

Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index c7c7d4e017ae..cfb67cc40c2c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -327,7 +327,7 @@
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11002000 0 0x1000>;
 			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART0>;
 			clock-names = "baud", "bus";
 			status = "disabled";
 		};
@@ -337,7 +337,7 @@
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11003000 0 0x1000>;
 			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
-			clocks = <&clk26m>, <&clk26m>;
+			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART1>;
 			clock-names = "baud", "bus";
 			status = "disabled";
 		};
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
