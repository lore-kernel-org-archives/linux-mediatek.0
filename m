Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D02C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 03:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuKTbF51pV4byS6eQQv8OP71xf/FApZaWwkb9mCXs+Y=; b=e+HLHwKE9z4zoE
	xKvNEaN6zkRIZjIarbtF/etOEZngu5+lAW6obZEEgQW5BadQGNjghllOBx1CMYJKlpc45OCAyYdp+
	a1UUWBrcQpkWNLMszJTqLkmPQbVzoQpbUepi0wPhjX8LF4AfHLe10MmNVJLZdK7CoNKxqFLm8Heke
	jaqJEG9uQT52CACDsdqfOuVMBJFJh2348CL9nPEY+9KKFVCtrXh3hp00WyskExnkk8Kt4HM4Q4HMP
	yApusr/LfqZ6BkYnc35FfNFPB+IzkUe9EjcENWsSOZd5Sy0EHGqGXKcFKbH3Efrml7X+wlVuBhP1f
	0KK/AvvDCTNyUg1SLJ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nS9uv-00BEgh-Fm; Thu, 10 Mar 2022 03:56:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nS9tg-00BDyu-Kw; Thu, 10 Mar 2022 03:55:31 +0000
X-UUID: 5283d2f0a52d4262af79a9c9d1e3ac22-20220309
X-UUID: 5283d2f0a52d4262af79a9c9d1e3ac22-20220309
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 705340198; Wed, 09 Mar 2022 20:55:21 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Mar 2022 19:55:20 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Mar 2022 11:55:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 10 Mar 2022 11:55:18 +0800
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
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v14 13/22] drm/mediatek: add display merge mute/unmute support
 for MT8195
Date: Thu, 10 Mar 2022 11:55:06 +0800
Message-ID: <20220310035515.16881-14-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220310035515.16881-1-nancy.lin@mediatek.com>
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_195528_718637_F10B2B06 
X-CRM114-Status: GOOD (  12.20  )
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
---
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index c0d9b43b2a66..9dca145cfb71 100644
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
@@ -82,6 +85,10 @@ void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
 
+	if (priv->mute_support)
+		mtk_ddp_write(cmdq_pkt, 0x0, &priv->cmdq_reg, priv->regs,
+			      DISP_REG_MERGE_MUTE_0);
+
 	mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs,
 		      DISP_REG_MERGE_CTRL);
 }
@@ -90,6 +97,10 @@ void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
 
+	if (priv->mute_support)
+		mtk_ddp_write(cmdq_pkt, 0x1, &priv->cmdq_reg, priv->regs,
+			      DISP_REG_MERGE_MUTE_0);
+
 	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
 		      DISP_REG_MERGE_CTRL);
 }
@@ -264,6 +275,8 @@ static int mtk_disp_merge_probe(struct platform_device *pdev)
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
