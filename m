Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B414EE57E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 07:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3JxP94D/+bV+WcBfTgzOlKtCY2haFLhGxhBTcxKPKB4=; b=VoHSPjVvHHZeTIbjh7pUwIo789
	CfP/HxjF8tOveNPPtgKEOCr9F1uvblrYBf6gg3XwuC9iTg1gAtZKIGp4UpEKiiDv1KJZ1FkhY7G6w
	N+XS2e9YEZkGGLrUUlL8pMZb6PRXmncvBK/B06TQRN3Irt3KQlrpNFA6vxG65j8X45KPpo94UQaNQ
	4m/ZAOedEi1bk0wlUHFgBXxseKkVnMZULDlFZcVdmTG+WXezlyCG8CL7dcIW36pL6wp2yrurTGhoP
	YZXSROf7MrWspD/dN9X4rE2gWD0UeYp9WmWMjhYNIAUXpUlgrSxAdCS8qhNMJrNgojiqrVwQXTchV
	Qs64yV7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeWJ8-00DGqH-0Z;
	Fri, 08 Sep 2023 07:53:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeWJ5-00DGp2-1o;
	Fri, 08 Sep 2023 07:53:36 +0000
X-UUID: cd137f9a4e1c11ee86758d4a7c00f3a0-20230908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=3JxP94D/+bV+WcBfTgzOlKtCY2haFLhGxhBTcxKPKB4=;
	b=tNRv8MxMF2jWSUNY6RkXIkhTfxFNQrJKCM1YMcaFYbZU2tfIfHdxh6eWKVPrEyTKeSW3ILFHmFZIhgliNm1dIxXrPxm460UT6LI5eplYyFLLD/jx+dwAH1ZcbqmHh3wqUK+WfW2OuIZIwrwyB5nbQM/5OoXcuh4jmXpfjrrsDpo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:f6e8045c-5be0-48cc-bac1-a293aec6240e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:8a909abe-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: cd137f9a4e1c11ee86758d4a7c00f3a0-20230908
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1396625194; Fri, 08 Sep 2023 00:53:30 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Sep 2023 15:52:55 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Sep 2023 15:52:54 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunfeng.yun@mediatek.com>, <vkoul@kernel.org>, <kishon@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>
CC: <linux-phy@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jitao.shi@mediatek.com>, Shuijing Li <shuijing.li@mediatek.com>
Subject: [PATCH v3] dt-bindings: phy: Add compatible for Mediatek MT8188
Date: Fri, 8 Sep 2023 15:53:10 +0800
Message-ID: <20230908075310.17825-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_005335_602994_612C6C37 
X-CRM114-Status: UNSURE (   8.34  )
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

Add dt-binding documentation of dsi-phy for MediaTek MT8188 SoC.

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
---
Changes in v3:
After upstreaming the basic version of mt8188.dtsi, we will add the
following mipi node in mt8188.dtsi:
mipi_tx_config0: mipi_dphy0@11c80000 {
			compatible = "mediatek,mt8188-mipi-tx",
				     "mediatek,mt8183-mipi-tx";
			reg = <0 0x11c80000 0 0x1000>;
			clocks = <&clk26m>;
			#clock-cells = <0>;
			#phy-cells = <0>;
			clock-output-names = "mipi_tx0_pll";
			status = "disabled";
		};
per suggestion from the previous thread:
https://lore.kernel.org/all/0a6d3d14-33f0-92d2-b42f-e4d336c8cd91@linaro.org/
Changes in v2:
Adjust mt8188 position.
---
 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index a63b20dfa4a5..6703689fcdbe 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -30,6 +30,7 @@ properties:
           - const: mediatek,mt8173-mipi-tx
       - items:
           - enum:
+              - mediatek,mt8188-mipi-tx
               - mediatek,mt8365-mipi-tx
           - const: mediatek,mt8183-mipi-tx
       - const: mediatek,mt2701-mipi-tx
-- 
2.40.1


