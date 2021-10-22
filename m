Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABDCC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 09:34:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 452DC611C3
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 09:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 452DC611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+C26fDCDNcFjEY38zMCPTHGQMm1uD0mfDcNiej7sKc=; b=pzm41VqeqvtLSn
	MzeSdXKFejJlLtVQluu68FSpXA7QVs9tH1RhB6+81Fs76DebevH6uJpVO+u4kdE9zpuPMgg+bRlrl
	LHHSG+grwwcjCpkH1UGUqt5rXbl4wyqQKRRMcWxb6ezxN5QzsXt7oVJKvbLMMqwML6AQg7mwuMvQ0
	P0lTwVt2U/3thRUp8nV4oJn9jcLAyQJpXuUX36g+TXMz6SJvF1f1hD5jQpZk30REfmxEL9kTfe0kP
	UiSGzLeeBEZjFUdXBykcOpy6qBMNeNLYVxGd7EFkmsnZ5ji5Tf4OscEdT5ruzYPV+afj/0xwIMLBu
	lZzi3zpP2B/c01XQGOCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdqw2-00ANnt-BR; Fri, 22 Oct 2021 09:33:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdqvE-00ANY1-4O; Fri, 22 Oct 2021 09:33:09 +0000
X-UUID: b9a01571e9db4954b94b36eabb74e055-20211022
X-UUID: b9a01571e9db4954b94b36eabb74e055-20211022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 105533673; Fri, 22 Oct 2021 02:33:03 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Oct 2021 02:28:30 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Oct 2021 17:28:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Oct 2021 17:28:28 +0800
From: roy-cw.yeh <roy-cw.yeh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Fabien Parent
 <fparent@baylibre.com>, "Roy-CW . Yeh" <roy-cw.yeh@mediatek.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 1/4] arm64: dts: mt8195: Modify svpp rdma node property
Date: Fri, 22 Oct 2021 17:28:24 +0800
Message-ID: <20211022092827.24631-2-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211022092827.24631-1-roy-cw.yeh@mediatek.com>
References: <20211022092827.24631-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_023308_197844_76BF4D05 
X-CRM114-Status: UNSURE (   9.78  )
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

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

Add svpp3/svpp2_mdp_rdma compatible name
Add dma-range for each svpp rdma node

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 26 ++++++++++++++----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 727b78535605..212930c7b782 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1022,9 +1022,8 @@
 			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>,
 							<&spm MT8195_POWER_DOMAIN_VPPSYS1>;
 			iommus = <&iommu_vpp M4U_PORT_L4_MDP_RDMA>,
-				 <&iommu_vpp M4U_PORT_L4_MDP_WROT>,
-				 <&iommu_vpp M4U_PORT_L6_SVPP3_MDP_RDMA>,
-				 <&iommu_vpp M4U_PORT_L6_SVPP3_MDP_WROT>;
+				 <&iommu_vpp M4U_PORT_L4_MDP_WROT>;
+			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>; /* 8G - 12G IOVA*/
 			clocks = <&vppsys0 CLK_VPP0_MDP_RDMA>,
 					<&topckgen CLK_TOP_CFG_VPP0>,
 					<&topckgen CLK_TOP_CFG_26M_VPP0>,
@@ -1440,7 +1439,7 @@
 
 		svpp1_mdp3_rdma: svpp1_mdp_rdma@14f08000 {
 			compatible = "mediatek,mt8195-mdp3",
-						"mediatek,mt8183-mdp3-rdma";
+				 "mediatek,mt8183-mdp3-rdma";
 			mediatek,mdp3-id = <1>;
 			reg = <0 0x14f08000 0 0x1000>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_14f0XXXX 0x8000 0x1000>;
@@ -1452,14 +1451,14 @@
 						"TOP_CFG_VPP1",
 						"TOP_CFG_26M_VPP1";
 			iommus = <&iommu_vdo M4U_PORT_L5_SVPP1_MDP_RDMA>,
-				 <&iommu_vdo M4U_PORT_L5_SVPP2_MDP_RDMA>,
-				 <&iommu_vdo M4U_PORT_L5_SVPP1_MDP_WROT>,
-				 <&iommu_vdo M4U_PORT_L5_SVPP2_MDP_WROT>;
+				 <&iommu_vdo M4U_PORT_L5_SVPP1_MDP_WROT>;
+			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>; /* 8G - 12G IOVA*/
 			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
 		};
 
 		svpp2_mdp3_rdma: svpp2_mdp_rdma@14f09000 {
-			compatible = "mediatek,mt8195-mdp3-rdma", "mediatek,mt8183-mdp3-rdma";
+			compatible = "mediatek,mt8195-mdp3",
+				 "mediatek,mt8183-mdp3-rdma";
 			mediatek,mdp3-id = <2>;
 			reg = <0 0x14f09000 0 0x1000>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_14f0XXXX 0x9000 0x1000>;
@@ -1470,12 +1469,15 @@
 			clock-names = "MDP_RDMA2",
 						"TOP_CFG_VPP1",
 						"TOP_CFG_26M_VPP1";
-			iommus = <&iommu_vdo M4U_PORT_L5_SVPP2_MDP_RDMA>;
+			iommus = <&iommu_vdo M4U_PORT_L5_SVPP2_MDP_RDMA>,
+				 <&iommu_vdo M4U_PORT_L5_SVPP2_MDP_WROT>;
+			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>; /* 8G - 12G IOVA*/
 			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
 		};
 
 		svpp3_mdp3_rdma: svpp3_mdp_rdma@14f0a000 {
-			compatible = "mediatek,mt8195-mdp3-rdma", "mediatek,mt8183-mdp3-rdma";
+			compatible = "mediatek,mt8195-mdp3",
+				 "mediatek,mt8183-mdp3-rdma";
 			mediatek,mdp3-id = <3>;
 			reg = <0 0x14f0a000 0 0x1000>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_14f0XXXX 0xa000 0x1000>;
@@ -1486,7 +1488,9 @@
 			clock-names = "MDP_RDMA3",
 						"TOP_CFG_VPP1",
 						"TOP_CFG_26M_VPP1";
-			iommus = <&iommu_vpp M4U_PORT_L6_SVPP3_MDP_RDMA>;
+			iommus = <&iommu_vpp M4U_PORT_L6_SVPP3_MDP_RDMA>,
+				 <&iommu_vpp M4U_PORT_L6_SVPP3_MDP_WROT>;
+			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>; /* 8G - 12G IOVA*/
 			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
 		};
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
