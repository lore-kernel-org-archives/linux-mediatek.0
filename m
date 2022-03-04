Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6445AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 13:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iQ2HYQYbYs+dcGkRkhEa5C0/qwBDO0EmlfU3112GtgQ=; b=alBjGg0aoL8sgF
	Rk++wRmcoTT0f79izqTRXZk7wkj8ns9ikVWNVeIRwkAT+0J/KBj/sQPK/WPeyNNd/KUmsqFxbLVtc
	jMBb2eq8PxElN/e1MLL8Ns1n7tkwhLNUMXFjg2g3OpI/wKgeNn7p71MlwGcwbFLe7UJr8FHOy3PG2
	ukl051KyCRk7q68CdN8aV05XiOa5rnaOzwXqhmbGnvyK7J/29fFCkkB/WRSJIbrCAUnqMHKdVDghJ
	OHoEtvL/Fi7a7qw8SHgdjT0tuQ8MD+Xov0Nei3nUTWJxTjVsRdsKpFdjSae9RZbHs2H7op41TqhJj
	Rn/K1jLb4Ttwl5+z5BkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ7x3-00ACSJ-8J; Fri, 04 Mar 2022 13:26:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ7pI-00A93G-Nc; Fri, 04 Mar 2022 13:18:34 +0000
X-UUID: a2bc2a6fc76a45618479edc0cc5bd230-20220304
X-UUID: a2bc2a6fc76a45618479edc0cc5bd230-20220304
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 801075287; Fri, 04 Mar 2022 06:18:25 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 05:08:30 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 4 Mar 2022 21:08:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Mar 2022 21:08:28 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v3 17/21] arm64: dts: mt8192: Add dpi node
Date: Fri, 4 Mar 2022 21:08:05 +0800
Message-ID: <20220304130809.12924-18-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
References: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_051832_794438_436B14FB 
X-CRM114-Status: GOOD (  10.27  )
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

Add dpi node for mt8192 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 5fd1fed354d0..039aba7ac0e2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -1236,6 +1236,17 @@
 			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
 		};
 
+		dpi0: dpi@14016000 {
+			compatible = "mediatek,mt8192-dpi";
+			reg = <0 0x14016000 0 0x1000>;
+			interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&mmsys CLK_MM_DPI_DPI0>,
+				 <&mmsys CLK_MM_DISP_DPI0>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL>;
+			clock-names = "pixel", "engine", "pll";
+			status = "disabled";
+		};
+
 		iommu0: m4u@1401d000 {
 			compatible = "mediatek,mt8192-m4u";
 			reg = <0 0x1401d000 0 0x1000>;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
