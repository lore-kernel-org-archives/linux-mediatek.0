Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF74C6FA86
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 09:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LHURFVg5oA1bCShw2LEk/6vLZHbMVyXTepvmaZpkxCY=; b=pBoIev6+icMeJjKKXk6XV8MmPv
	GS1cPzvNqqv3KxKqNvKu2luMeAhwO34L3wgPeNZ1rSFz3KYiSS4niXV6yRtFZgPI8Tf/8MeOC6ggS
	X3rzKz3OAKHG7WTTFPKnMXhIzHZ45pR/KROcVPjl5/0KiZdj+ux/aLm1Rmm31Om6juoPG/Mtiu+/t
	un5xVcxiQPdMpohm0+jDrKZeKh0u7ELkFnXygYl2kfdAKiChOGnS1MXtC5LwW9S52LxfJk58AmUJT
	HCTHq/aRXqOCW0nBdpxtNdURDEqxGRpvnMPqmragzNZtJ188OFQEMO++LNx8E5mbSEwNIwgEBqp2B
	QbRsg5rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocknM-003ofU-3J; Mon, 26 Sep 2022 09:53:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ockdF-003jjg-2y; Mon, 26 Sep 2022 09:42:34 +0000
X-UUID: de5d7e590fcb4061a0619ae04f70fe89-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=LHURFVg5oA1bCShw2LEk/6vLZHbMVyXTepvmaZpkxCY=;
	b=uw4+vubcVjm8+0gbwLeTqKXfBWCuvTA98qoV/42NR233vL4uSIe84IGIK4Q5c67yOMHbMHET1alb5pCgiVy7XlDoQ68H2urreM7+vnBm5T0Pdw2LQHXSqBrFtdfvtz3KvENQEZI0UOxhC8HSkNwuVi/NDvHdb479d2D9jk0CgqY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:c3142889-ecf4-4876-bbcc-ed95651a1d5c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:3dea0807-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: de5d7e590fcb4061a0619ae04f70fe89-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 355380696; Mon, 26 Sep 2022 02:42:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 26 Sep 2022 17:11:51 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 26 Sep 2022 17:11:51 +0800
From: <xinlei.lee@mediatek.com>
To: <chunfeng.yun@mediatek.com>, <kishon@ti.com>, <vkoul@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, xinlei lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH v2] dt-bindings: phy: Add compatible for Mediatek MT8188
Date: Mon, 26 Sep 2022 17:11:49 +0800
Message-ID: <1664183509-29473-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_024233_186951_1E74A7DA 
X-CRM114-Status: UNSURE (   7.41  )
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

From: xinlei lee <xinlei.lee@mediatek.com>

Add dt-binding documentation of dsi-phy for MediaTek MT8188 SoC.

Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
---
Change since v1:
Adjust mt8188 position.
---
---
 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index 9c2a734..7ea29ad 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -26,6 +26,7 @@ properties:
           - const: mediatek,mt2701-mipi-tx
       - items:
           - enum:
+              - mediatek,mt8188-mipi-tx
               - mediatek,mt8365-mipi-tx
           - const: mediatek,mt8183-mipi-tx
       - const: mediatek,mt2701-mipi-tx
-- 
2.6.4


