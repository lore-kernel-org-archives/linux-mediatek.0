Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3C5C25B0E
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 08:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjf6H6IThMSCMLkSgMB4FlCL8HQC6Ruzd1YbmB9axXU=; b=XNbCP0SPZ5fgR/2ZHfz2uaBWG4
	cgpayQ6hCLRSiG/uYoWg8B1Pl+j6bxIjOATg47hdybJ+G0rAuD+35NdCneFRWBeBtOdfgFP8X3Tzh
	Q3kp7APKuq6daAhohUHZSrbY/EyG+dbcQazMyA+/TlhxhfTqDs0dIBqdkvJupS3zJAnC9swKtWKcv
	u/YHgjtzrLiSFde1gL8jpwa62+BeDy7VOx2177eaV6/EN8NSTVx8drqubagU4Cwi9bvnbn7kbhAFb
	ga+YuHl1AS2MhRWFfFsS6Fx6eNM3mmYGHsJ5osg6IPuPXRVYTKssNt7wAOl+9MjJPUaMXAlqwGbJS
	dnXvD7Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOxmY-004Orh-BE; Fri, 19 Aug 2022 08:55:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOxmB-004OYb-5W; Fri, 19 Aug 2022 08:54:48 +0000
X-UUID: 968ffa7b756a4f36979ec70aa6f49790-20220819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tjf6H6IThMSCMLkSgMB4FlCL8HQC6Ruzd1YbmB9axXU=;
	b=qnEk5lDjhGmXy9g39XUj0Bo5ZZCaiNC4g7K5BP40m0gtCy65uFswz/zSjvlCGMulXb11QbtS29lEwSgF84kAeLSqN5aFqYhcLk/odmqTwLBt5BhiW1ErqR/W1I1eRz6fkPMSgFmyED5rYZoDhsZDaw+d0uTIMMo93RKoKV/CtGE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:5a15d3fe-135a-40de-853a-11743f7705a4,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:7e4a03cf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 968ffa7b756a4f36979ec70aa6f49790-20220819
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1927013903; Fri, 19 Aug 2022 01:54:41 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 19 Aug 2022 16:54:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Aug 2022 16:54:25 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Courbot
	<acourbot@chromium.org>, <tfiga@chromium.org>, <drinkcat@chromium.org>,
	<pihsun@chromium.org>, <hsinyi@google.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<cellopoint.kai@gmail.com>, Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v26 3/4] arm64: dts: mt8183: add MediaTek MDP3 nodes
Date: Fri, 19 Aug 2022 16:54:22 +0800
Message-ID: <20220819085423.17023-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220819085423.17023-1-moudy.ho@mediatek.com>
References: <20220819085423.17023-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_015447_228515_6A491AB8 
X-CRM114-Status: UNSURE (   9.92  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add device nodes for Media Data Path 3 (MDP3) modules.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 63 ++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 9d32871973a2..1543876b1e3c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1691,6 +1691,60 @@
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
 		};
 
+		mdp3-rdma0@14001000 {
+			compatible = "mediatek,mt8183-mdp3-rdma";
+			reg = <0 0x14001000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x1000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_MDP_RDMA0_SOF>,
+					      <CMDQ_EVENT_MDP_RDMA0_EOF>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_MDP_RDMA0>,
+				 <&mmsys CLK_MM_MDP_RSZ1>;
+			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
+			mboxes = <&gce 20 CMDQ_THR_PRIO_LOWEST 0>,
+				 <&gce 21 CMDQ_THR_PRIO_LOWEST 0>;
+		};
+
+		mdp3-rsz0@14003000 {
+			compatible = "mediatek,mt8183-mdp3-rsz";
+			reg = <0 0x14003000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_MDP_RSZ0_SOF>,
+					      <CMDQ_EVENT_MDP_RSZ0_EOF>;
+			clocks = <&mmsys CLK_MM_MDP_RSZ0>;
+		};
+
+		mdp3-rsz1@14004000 {
+			compatible = "mediatek,mt8183-mdp3-rsz";
+			reg = <0 0x14004000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x4000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_MDP_RSZ1_SOF>,
+					      <CMDQ_EVENT_MDP_RSZ1_EOF>;
+			clocks = <&mmsys CLK_MM_MDP_RSZ1>;
+		};
+
+		mdp3-wrot0@14005000 {
+			compatible = "mediatek,mt8183-mdp3-wrot";
+			reg = <0 0x14005000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_MDP_WROT0_SOF>,
+					      <CMDQ_EVENT_MDP_WROT0_EOF>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_MDP_WROT0>;
+			iommus = <&iommu M4U_PORT_MDP_WROT0>;
+		};
+
+		mdp3-wdma@14006000 {
+			compatible = "mediatek,mt8183-mdp3-wdma";
+			reg = <0 0x14006000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_MDP_WDMA0_SOF>,
+					      <CMDQ_EVENT_MDP_WDMA0_EOF>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_MDP_WDMA0>;
+			iommus = <&iommu M4U_PORT_MDP_WDMA0>;
+		};
+
 		ovl0: ovl@14008000 {
 			compatible = "mediatek,mt8183-disp-ovl";
 			reg = <0 0x14008000 0 0x1000>;
@@ -1834,6 +1888,15 @@
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 		};
 
+		mdp3-ccorr@1401c000 {
+			compatible = "mediatek,mt8183-mdp3-ccorr";
+			reg = <0 0x1401c000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xc000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_MDP_CCORR_SOF>,
+					      <CMDQ_EVENT_MDP_CCORR_EOF>;
+			clocks = <&mmsys CLK_MM_MDP_CCORR>;
+		};
+
 		imgsys: syscon@15020000 {
 			compatible = "mediatek,mt8183-imgsys", "syscon";
 			reg = <0 0x15020000 0 0x1000>;
-- 
2.18.0


