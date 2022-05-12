Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2CCC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 05:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4PF8Tit72KRBGGP0XjNcfxNl5mCrpp3Pka9qr/fseU=; b=kJH+f7ThJrLsdK
	1a1KZX7sWciqnHmWdyoNQsh5kXbJgBrOa/wd4bCVi77IdLf8PNbphhFCPYfOMdi3L3R6qeiUQBUpl
	6HAEzv7c27F+58Z9s96Fh8W8XqLFPg9b6mMhW5RJiyoHG/WodgLl+Y9eKLWyzHDp/APpEVPknn04P
	kQ6sJ1DvZMpJDgqj3Z1sUpjrpzjuirZRpyBJXFGUC/l88NWwxDTglVgfKcda8n4PFXAWr25vKVNWj
	XP1wXpqmoTPiw+9INn8kW4zSbmWB06G0dJUdlGMsvkgxIBqB3aHXep7FRdsh1F/oAmTT1Wz7cUDWA
	cFo4AWILC1nD+2+Lp2Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np1dc-00ADFZ-7N; Thu, 12 May 2022 05:45:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np1a9-00ABFl-J6; Thu, 12 May 2022 05:41:51 +0000
X-UUID: 828502d808bd4c948c90d3c35fefd6fd-20220511
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:b7d6b349-c9b0-4210-8b69-12b2652da41a, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:faefae9, CLOUDID:426c5348-e22d-4f1a-9d3f-55c4a2b00ea4,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 828502d808bd4c948c90d3c35fefd6fd-20220511
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 775676701; Wed, 11 May 2022 22:41:40 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 22:31:39 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 12 May 2022 13:31:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 12 May 2022 13:31:37 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, "jason-jh . lin"
 <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <dri-devel@lists.freedesktop.org>, <llvm@lists.linux.dev>,
 <singo.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v21 16/25] drm/mediatek: add display merge mute/unmute support
 for MT8195
Date: Thu, 12 May 2022 13:31:19 +0800
Message-ID: <20220512053128.31415-17-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220512053128.31415-1-nancy.lin@mediatek.com>
References: <20220512053128.31415-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_224149_680157_069567D4 
X-CRM114-Status: GOOD (  12.05  )
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

Add merge mute/unmute setting for MT8195.
MT8195 Vdosys1 merge1~merge4 support HW mute function.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index c7af5ccab916..2e13d2fb429e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -58,12 +58,15 @@
 #define FLD_PREULTRA_TH_LOW			GENMASK(15, 0)
 #define FLD_PREULTRA_TH_HIGH			GENMASK(31, 16)
 
+#define DISP_REG_MERGE_MUTE_0		0xf00
+
 struct mtk_disp_merge {
 	void __iomem			*regs;
 	struct clk			*clk;
 	struct clk			*async_clk;
 	struct cmdq_client_reg		cmdq_reg;
 	bool				fifo_en;
+	bool				mute_support;
 };
 
 void mtk_merge_start(struct device *dev)
@@ -80,6 +83,10 @@ void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
 
+	if (priv->mute_support)
+		mtk_ddp_write(cmdq_pkt, 0x0, &priv->cmdq_reg, priv->regs,
+			      DISP_REG_MERGE_MUTE_0);
+
 	mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs,
 		      DISP_REG_MERGE_CTRL);
 }
@@ -88,6 +95,10 @@ void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
 
+	if (priv->mute_support)
+		mtk_ddp_write(cmdq_pkt, 0x1, &priv->cmdq_reg, priv->regs,
+			      DISP_REG_MERGE_MUTE_0);
+
 	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
 		      DISP_REG_MERGE_CTRL);
 }
@@ -262,6 +273,8 @@ static int mtk_disp_merge_probe(struct platform_device *pdev)
 	priv->fifo_en = of_property_read_bool(dev->of_node,
 					      "mediatek,merge-fifo-en");
 
+	priv->mute_support = of_property_read_bool(dev->of_node,
+						   "mediatek,merge-mute");
 	platform_set_drvdata(pdev, priv);
 
 	ret = component_add(dev, &mtk_disp_merge_component_ops);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
