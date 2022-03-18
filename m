Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C500C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 15:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rNkBtxmf3ci0lA0vx7IWCY2Xe+9DIbdTqyonIuufOhE=; b=gC8/XVnSXk2ZAQ
	/mbOBptqn1P9qnCD8MJu05uL/7+N9CVBB0vFd2BuundhLvxqhq1FKNycO31LLbz9vSo7HfNUlfnkK
	8TWGnx/LLeK92B/bwFbupBQ0XXijQmYuRIdngTuKrNEyxoX1JJYVqVxQ2ghq97lx7sIV6dqPWlqUz
	2z0uD+5SrLX7paWTimD761F1r8iyNcyJBlTyhG/rEnIyc1oF5jX4VINnemnJocB3GYnuUsI7r5flT
	umGdi0UP3dsTICFvJ5PMJTR7RGXI3tvDb8ZakKLacIys3z9u4kXeFzsahoErSPmHXbj3SziDJJTMO
	PjU3F7YLs9P360g5qUdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVE5M-0028U4-7Q; Fri, 18 Mar 2022 15:00:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVE1K-0026X8-SX; Fri, 18 Mar 2022 14:56:04 +0000
X-UUID: d886509aa8ff471492a3414ad3b97994-20220318
X-UUID: d886509aa8ff471492a3414ad3b97994-20220318
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 365526294; Fri, 18 Mar 2022 07:55:49 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 07:45:54 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 22:45:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Mar 2022 22:45:52 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v4 15/22] arm64: dts: mt8192: Add H264 venc device node
Date: Fri, 18 Mar 2022 22:45:27 +0800
Message-ID: <20220318144534.17996-16-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_075602_967007_5CD39B96 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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

Adds H264 venc node for mt8192 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 4addf6ddd86d..63893779b193 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -1336,6 +1336,29 @@
 			power-domains = <&spm MT8192_POWER_DOMAIN_VENC>;
 		};
 
+		vcodec_enc: vcodec@17020000 {
+			compatible = "mediatek,mt8192-vcodec-enc";
+			reg = <0 0x17020000 0 0x2000>;
+			iommus = <&iommu0 M4U_PORT_L7_VENC_RCPU>,
+				 <&iommu0 M4U_PORT_L7_VENC_REC>,
+				 <&iommu0 M4U_PORT_L7_VENC_BSDMA>,
+				 <&iommu0 M4U_PORT_L7_VENC_SV_COMV>,
+				 <&iommu0 M4U_PORT_L7_VENC_RD_COMV>,
+				 <&iommu0 M4U_PORT_L7_VENC_CUR_LUMA>,
+				 <&iommu0 M4U_PORT_L7_VENC_CUR_CHROMA>,
+				 <&iommu0 M4U_PORT_L7_VENC_REF_LUMA>,
+				 <&iommu0 M4U_PORT_L7_VENC_REF_CHROMA>,
+				 <&iommu0 M4U_PORT_L7_VENC_SUB_R_LUMA>,
+				 <&iommu0 M4U_PORT_L7_VENC_SUB_W_LUMA>;
+			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,scp = <&scp>;
+			power-domains = <&spm MT8192_POWER_DOMAIN_VENC>;
+			clocks = <&vencsys CLK_VENC_SET1_VENC>;
+			clock-names = "venc-set1";
+			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
+		};
+
 		camsys: clock-controller@1a000000 {
 			compatible = "mediatek,mt8192-camsys";
 			reg = <0 0x1a000000 0 0x1000>;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
