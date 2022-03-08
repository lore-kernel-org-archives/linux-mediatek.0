Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535B3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 06:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rHoyLQuaKhZXQwNO2t3EtSpi0moDaGCtVLM8YBh0ph4=; b=EZ5rj9ybxRSzXy
	tkwfa+sAzTR8yVhb7lca+vof21hlFAEfoH8zhRdxvdz3IPPZanYnSdAk97Alwdcw6GgrjfV3FpjRz
	igJDss1mW/KZHvVz2HnbTDxKbREsI1C8bs5WB7wPzLTtY9nrvxO/+qUiTTAvqShqxpRRn++206cEz
	1LfAYM913hS8l8uc5LiBr1kK/vcsK7aSjgSn2NkNwMUdHhQvHNaW3UuY9pQ0UIBEN+zNsyFzV07+Q
	B5MG8n4rm38PSmWGYn/34aCnenwUJV/t5res5HDm1bOwaXDglgf98dMLWNS/0RGNlwEPb092K6oYw
	yyPcNQImHWZVyUjHlaMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRTNE-002pCh-Q0; Tue, 08 Mar 2022 06:31:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRTMb-002ou4-KB; Tue, 08 Mar 2022 06:30:31 +0000
X-UUID: 1d23158587cc43b790bec56498e35fd2-20220307
X-UUID: 1d23158587cc43b790bec56498e35fd2-20220307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 390651601; Mon, 07 Mar 2022 23:30:20 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 22:20:20 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 8 Mar 2022 14:20:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Mar 2022 14:20:16 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v13 12/22] drm/mediatek: add display merge start/stop API for
 cmdq support
Date: Tue, 8 Mar 2022 14:20:02 +0800
Message-ID: <20220308062012.21838-13-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220308062012.21838-1-nancy.lin@mediatek.com>
References: <20220308062012.21838-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_223029_696887_EC7D2713 
X-CRM114-Status: GOOD (  12.67  )
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

Add merge start/stop API for cmdq support. The ovl_adaptor merges
are configured with each drm plane update. Need to enable/disable
merge with cmdq making sure all the settings taken effect in the
same vblank.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  2 ++
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 20 +++++++++++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index c2de53a5892e..224a710bb537 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -66,6 +66,8 @@ void mtk_merge_stop(struct device *dev);
 void mtk_merge_advance_config(struct device *dev, unsigned int l_w, unsigned int r_w,
 			      unsigned int h, unsigned int vrefresh, unsigned int bpc,
 			      struct cmdq_pkt *cmdq_pkt);
+void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt);
+void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt);
 
 void mtk_ovl_bgclr_in_on(struct device *dev);
 void mtk_ovl_bgclr_in_off(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 40da0555416d..c0d9b43b2a66 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -67,17 +67,31 @@ struct mtk_disp_merge {
 };
 
 void mtk_merge_start(struct device *dev)
+{
+	mtk_merge_start_cmdq(dev, NULL);
+}
+
+void mtk_merge_stop(struct device *dev)
 {
 	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
 
-	writel(MERGE_EN, priv->regs + DISP_REG_MERGE_CTRL);
+	mtk_merge_stop_cmdq(dev, NULL);
 }
 
-void mtk_merge_stop(struct device *dev)
+void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
+
+	mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MERGE_CTRL);
+}
+
+void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
 
-	writel(0x0, priv->regs + DISP_REG_MERGE_CTRL);
+	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MERGE_CTRL);
 }
 
 static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
