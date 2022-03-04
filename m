Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86B7C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 13:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bPUiCV8fb7XMZILQhv1qSD/j1s5S3BRWFXz54FqZAqQ=; b=U13gE6Jb4NYaO6
	QMWkxYinP+Z8sJP12c0ZWIxoDQ3Q44JkIzbbJkY5uyE5jJzH3bvkPEW82emyWcAvxvUIfFstQfSYN
	VWRDYd4hBdnS7Mof5Ivo5FH3gsCcsE7W2Lx3WxhIIXEmbUd7jJVlNVyHkZZ9G4zNVe42HI6Kl6gA3
	NsME21TuO3hJE4KjYMHBtqGI1a2CJJ2p7MOXats9ROVxggRuXe/Tf/nrk7fCkB3V5Uv5RCMevwSa5
	LZNsDUMI/o3V/9PBvIv9wMNOK1IsbQgglQ367lmFp6uYKuM0f/h4ypYzLVk3tiBRPrO13bqHXg5Kj
	3pyWGo0h+2qk0CvXFVRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ7pO-00A96U-Qg; Fri, 04 Mar 2022 13:18:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ7p9-00A8yU-9z; Fri, 04 Mar 2022 13:18:24 +0000
X-UUID: 18ba905930134d60879ffe3cb55669f3-20220304
X-UUID: 18ba905930134d60879ffe3cb55669f3-20220304
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 406800367; Fri, 04 Mar 2022 06:18:18 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 05:08:31 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 21:08:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Mar 2022 21:08:29 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v3 19/21] arm64: dts: mt8192: Add dsi node
Date: Fri, 4 Mar 2022 21:08:07 +0800
Message-ID: <20220304130809.12924-20-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
References: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_051823_424179_6F6E0D7D 
X-CRM114-Status: GOOD (  10.02  )
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

Add dsi ndoe for mt8192 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 94f88e52776b..3d16cb0b3ea1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -1327,6 +1327,20 @@
 			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
 		};
 
+		dsi0: dsi@14010000 {
+			compatible = "mediatek,mt8183-dsi";
+			reg = <0 0x14010000 0 0x1000>;
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,syscon-dsi = <&mmsys 0x140>;
+			clocks = <&mmsys CLK_MM_DSI0>,
+				 <&mmsys CLK_MM_DSI_DSI0>,
+				 <&mipi_tx0>;
+			clock-names = "engine", "digital", "hs";
+			phys = <&mipi_tx0>;
+			phy-names = "dphy";
+			status = "disabled";
+		};
+
 		ovl_2l2: ovl@14014000 {
 			compatible = "mediatek,mt8192-disp-ovl-2l";
 			reg = <0 0x14014000 0 0x1000>;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
