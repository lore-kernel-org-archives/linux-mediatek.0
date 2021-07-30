Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F0DC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 03:06:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE2BF60EB5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 03:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE2BF60EB5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yeMrh8Y9oB9HDuojd84ivgMhItfr53o1KUQjLagP6D4=; b=4GwdQX9kN/90YU
	LTuDLqEyrtpRbGuzKSkKG6kJqwi2rM7QgcET+LhvznoXQF1gkfXagQMiNzYYuCvRBHduyjf9397nN
	yO86we0fgcc/CUHKwq+aUNEeT+IxX4IKibp6NpJjjgovbujxf3bBOiaA2pSDkD5SiFB5yW5oMoQsL
	DGWGIdFiP7qQdojDD0cqmNE3QJx8uNVaYsU+s1LfwcA9teQtUr6cuEmo2Jkv/GocI5FGqNH8brOZL
	5qf758WCs8Rb06imvu9WYavPKSpHEnEyJw43tvIcs/GOTANAy5nkKl2lTs8YJ11TYzUH74k1y03N+
	vokWE/cFxC6hZm0XoNzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Iqs-006npz-34; Fri, 30 Jul 2021 03:06:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Ipt-006nSO-A9; Fri, 30 Jul 2021 03:05:23 +0000
X-UUID: ca08acb181f34b1da49d0ce266e8d36a-20210729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YiJ0qvViWMzeh9kp48fgZICnaF2xXx+eb/tZNDqGNsg=; 
 b=nP6ktE0GEmxHj33szEecLDiNF8hjz6wz86SO/zjwj2L7fL2L7s4umj5SnHU1sBl3GvDYyjPNMMLuTRIu8KYinjo1J3Q0sqw4FU+fLFPdNnIHyn4H2lwXp7EYTMY3ia8Nf/sL4Ycs997joqH0EKlHPe+XdsI/pQJ9OGWj84wqolo=;
X-UUID: ca08acb181f34b1da49d0ce266e8d36a-20210729
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 990742462; Thu, 29 Jul 2021 20:05:19 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 19:55:39 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 10:55:37 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Jul 2021 10:55:31 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, 
 <acourbot@chromium.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Xia Jiang <xia.jiang@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Dafna Hirschfeld
 <dafna.hirschfeld@collabora.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Eizan
 Miyamoto" <eizan@chromium.org>, <anthony.huang@mediatek.com>, Frank
 Wunderlich <frank-w@public-files.de>
Subject: [PATCH v7 12/12] arm64: dts: mediatek: Get rid of mediatek,
 larb for MM nodes
Date: Fri, 30 Jul 2021 10:52:38 +0800
Message-ID: <20210730025238.22456-13-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210730025238.22456-1-yong.wu@mediatek.com>
References: <20210730025238.22456-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_200521_443290_32245176 
X-CRM114-Status: GOOD (  10.96  )
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

After adding device_link between the IOMMU consumer and smi,
the mediatek,larb is unnecessary now.

CC: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Evan Green <evgreen@chromium.org>
Tested-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 16 ----------------
 arch/arm64/boot/dts/mediatek/mt8183.dtsi |  6 ------
 2 files changed, 22 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 2f0fc1e317d7..cf5d26db82b8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1009,7 +1009,6 @@
 				 <&mmsys CLK_MM_MUTEX_32K>;
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
-			mediatek,larb = <&larb0>;
 		};
 
 		mdp_rdma1: rdma@14002000 {
@@ -1019,7 +1018,6 @@
 				 <&mmsys CLK_MM_MUTEX_32K>;
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			iommus = <&iommu M4U_PORT_MDP_RDMA1>;
-			mediatek,larb = <&larb4>;
 		};
 
 		mdp_rsz0: rsz@14003000 {
@@ -1049,7 +1047,6 @@
 			clocks = <&mmsys CLK_MM_MDP_WDMA>;
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			iommus = <&iommu M4U_PORT_MDP_WDMA>;
-			mediatek,larb = <&larb0>;
 		};
 
 		mdp_wrot0: wrot@14007000 {
@@ -1058,7 +1055,6 @@
 			clocks = <&mmsys CLK_MM_MDP_WROT0>;
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			iommus = <&iommu M4U_PORT_MDP_WROT0>;
-			mediatek,larb = <&larb0>;
 		};
 
 		mdp_wrot1: wrot@14008000 {
@@ -1067,7 +1063,6 @@
 			clocks = <&mmsys CLK_MM_MDP_WROT1>;
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			iommus = <&iommu M4U_PORT_MDP_WROT1>;
-			mediatek,larb = <&larb4>;
 		};
 
 		ovl0: ovl@1400c000 {
@@ -1077,7 +1072,6 @@
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_OVL0>;
 			iommus = <&iommu M4U_PORT_DISP_OVL0>;
-			mediatek,larb = <&larb0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
 		};
 
@@ -1088,7 +1082,6 @@
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_OVL1>;
 			iommus = <&iommu M4U_PORT_DISP_OVL1>;
-			mediatek,larb = <&larb4>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
 		};
 
@@ -1099,7 +1092,6 @@
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
-			mediatek,larb = <&larb0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
 		};
 
@@ -1110,7 +1102,6 @@
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
-			mediatek,larb = <&larb4>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
 		};
 
@@ -1121,7 +1112,6 @@
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_RDMA2>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA2>;
-			mediatek,larb = <&larb4>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
 		};
 
@@ -1132,7 +1122,6 @@
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_WDMA0>;
 			iommus = <&iommu M4U_PORT_DISP_WDMA0>;
-			mediatek,larb = <&larb0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
 		};
 
@@ -1143,7 +1132,6 @@
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_WDMA1>;
 			iommus = <&iommu M4U_PORT_DISP_WDMA1>;
-			mediatek,larb = <&larb4>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
 		};
 
@@ -1394,7 +1382,6 @@
 			      <0 0x16027800 0 0x800>,	/* VDEC_HWB */
 			      <0 0x16028400 0 0x400>;	/* VDEC_HWG */
 			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
-			mediatek,larb = <&larb1>;
 			iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
 				 <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
 				 <&iommu M4U_PORT_HW_VDEC_AVC_MV_EXT>,
@@ -1462,7 +1449,6 @@
 			compatible = "mediatek,mt8173-vcodec-enc";
 			reg = <0 0x18002000 0 0x1000>;	/* VENC_SYS */
 			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
-			mediatek,larb = <&larb3>;
 			iommus = <&iommu M4U_PORT_VENC_RCPU>,
 				 <&iommu M4U_PORT_VENC_REC>,
 				 <&iommu M4U_PORT_VENC_BSDMA>,
@@ -1490,7 +1476,6 @@
 			clock-names = "jpgdec-smi",
 				      "jpgdec";
 			power-domains = <&spm MT8173_POWER_DOMAIN_VENC>;
-			mediatek,larb = <&larb3>;
 			iommus = <&iommu M4U_PORT_JPGDEC_WDMA>,
 				 <&iommu M4U_PORT_JPGDEC_BSDMA>;
 		};
@@ -1524,7 +1509,6 @@
 				 <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
 				 <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
 				 <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
-			mediatek,larb = <&larb5>;
 			mediatek,vpu = <&vpu>;
 			clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
 			clock-names = "venc_lt_sel";
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index ca8ad953de91..d21e1ffc9b35 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1239,7 +1239,6 @@
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_OVL0>;
 			iommus = <&iommu M4U_PORT_DISP_OVL0>;
-			mediatek,larb = <&larb0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x8000 0x1000>;
 		};
 
@@ -1250,7 +1249,6 @@
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
 			iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
-			mediatek,larb = <&larb0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
 		};
 
@@ -1261,7 +1259,6 @@
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_OVL1_2L>;
 			iommus = <&iommu M4U_PORT_DISP_2L_OVL1_LARB0>;
-			mediatek,larb = <&larb0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xa000 0x1000>;
 		};
 
@@ -1272,7 +1269,6 @@
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
-			mediatek,larb = <&larb0>;
 			mediatek,rdma-fifo-size = <5120>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
 		};
@@ -1284,7 +1280,6 @@
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
-			mediatek,larb = <&larb0>;
 			mediatek,rdma-fifo-size = <2048>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
 		};
@@ -1439,7 +1434,6 @@
 			compatible = "mediatek,mt8183-jpgenc", "mediatek,mtk-jpgenc";
 			reg = <0 0x17030000 0 0x1000>;
 			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_LOW>;
-			mediatek,larb = <&larb4>;
 			iommus = <&iommu M4U_PORT_JPGENC_RDMA>,
 				 <&iommu M4U_PORT_JPGENC_BSDMA>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
