Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D838C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 07:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFaSi/A32Nu6ECS8oC3iZcdzw4hRwwLbhs14D11UrcI=; b=s9TjktKPRMETUP
	n2Ppi1PAOlvFEyVwz1ioHLV1P4bwSH5Cm0Ghrl5HIg+Uwa9I1vQ/rPJXqj5npvr3RqDg8RMUU/rtQ
	7jisTwsOz6fImVDI6xvjhuWyKBqB6QL2Ob8WgyIS4wOXM7oxaqDJ0YWOrfMlvmWT5eXoh3Lri37NB
	WdXXT7bLqLAt22asQxfoc38/6aJNQoTgsfMXaUNdocoHLFCwz6K5z1TyDf9BzN20NVfZUwxNSEeA+
	2got2aMywqAwIKf9jDo2pmtWMS/mJpd2VNtMbiMGbTaCwNwXJvIr2nh2aNkZ+B5gKZrzxO3LDLgn9
	2j8EpJg1AiW+iKYpBS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9MKf-00Dq5p-Go; Mon, 17 Jan 2022 07:21:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9MFb-00Dnk5-0C; Mon, 17 Jan 2022 07:16:28 +0000
X-UUID: 40ee7f7dd6404644ae040d24a81ae42c-20220117
X-UUID: 40ee7f7dd6404644ae040d24a81ae42c-20220117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1730303647; Mon, 17 Jan 2022 00:16:17 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 23:07:32 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 17 Jan 2022 15:07:30 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Jan 2022 15:07:28 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
 <hverkuil@xs4all.nl>, Joerg Roedel <jroedel@suse.de>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
Subject: [PATCH v10 12/13] arm: dts: mediatek: Get rid of mediatek,
 larb for MM nodes
Date: Mon, 17 Jan 2022 15:05:09 +0800
Message-ID: <20220117070510.17642-13-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220117070510.17642-1-yong.wu@mediatek.com>
References: <20220117070510.17642-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_231623_088001_4412A6CA 
X-CRM114-Status: GOOD (  10.95  )
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, yf.wang@mediatek.com,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org,
 mingyuan.ma@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 libo.kang@mediatek.com, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, yong.wu@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 anan.sun@mediatek.com, srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

After adding device_link between the IOMMU consumer and smi, the
mediatek,larb is unnecessary now.

CC: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Evan Green <evgreen@chromium.org>
Tested-by: Frank Wunderlich <frank-w@public-files.de> # BPI-R2/MT7623
---
 arch/arm/boot/dts/mt2701.dtsi  | 2 --
 arch/arm/boot/dts/mt7623n.dtsi | 5 -----
 2 files changed, 7 deletions(-)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 4776f85d6d5b..ef583cfd3baf 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -564,7 +564,6 @@
 		clock-names = "jpgdec-smi",
 			      "jpgdec";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-		mediatek,larb = <&larb2>;
 		iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
 			 <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
 	};
@@ -577,7 +576,6 @@
 		clocks =  <&imgsys CLK_IMG_VENC>;
 		clock-names = "jpgenc";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-		mediatek,larb = <&larb2>;
 		iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
 			 <&iommu MT2701_M4U_PORT_JPGENC_BSDMA>;
 	};
diff --git a/arch/arm/boot/dts/mt7623n.dtsi b/arch/arm/boot/dts/mt7623n.dtsi
index bcb0846e29fd..3adab5cd1fef 100644
--- a/arch/arm/boot/dts/mt7623n.dtsi
+++ b/arch/arm/boot/dts/mt7623n.dtsi
@@ -121,7 +121,6 @@
 		clock-names = "jpgdec-smi",
 			      "jpgdec";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-		mediatek,larb = <&larb2>;
 		iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
 			 <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
 	};
@@ -144,7 +143,6 @@
 		interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&mmsys CLK_MM_DISP_OVL>;
 		iommus = <&iommu MT2701_M4U_PORT_DISP_OVL_0>;
-		mediatek,larb = <&larb0>;
 	};
 
 	rdma0: rdma@14008000 {
@@ -154,7 +152,6 @@
 		interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&mmsys CLK_MM_DISP_RDMA>;
 		iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA>;
-		mediatek,larb = <&larb0>;
 	};
 
 	wdma@14009000 {
@@ -164,7 +161,6 @@
 		interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&mmsys CLK_MM_DISP_WDMA>;
 		iommus = <&iommu MT2701_M4U_PORT_DISP_WDMA>;
-		mediatek,larb = <&larb0>;
 	};
 
 	bls: pwm@1400a000 {
@@ -215,7 +211,6 @@
 		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&mmsys CLK_MM_DISP_RDMA1>;
 		iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA1>;
-		mediatek,larb = <&larb0>;
 	};
 
 	dpi0: dpi@14014000 {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
