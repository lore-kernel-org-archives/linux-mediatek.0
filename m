Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D731C433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 02:12:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DA4C207E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 02:12:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iNsWhJ9Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bTgt/zGV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DA4C207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cL0ifNLS8Z0ybDbJNqrxQCoh3dDJXxuhL+VV8K5eh20=; b=iNsWhJ9ZUQO3+Yk+ykV3r75Ou
	dDvecAOmJW/AjNtsmTzweOjtiTzxAr3zfpr5nulXXAiLiG5Kny/yHHhXKLoSpalYAElOoztDG/w7I
	b3fqpEKKUaYRY6KYQPHX9WsGaIQv52icV6d/lLkF1h08blh8XGd6HVpiNaq5xlBI6hHFehFdcbKS2
	wi8tCbc3D9VCIRIqRTgUpv4dXMmsNaRUe5kUZyD2eXzfH0Av64antxQV6uNr9gUwUyecB2D8UoCNs
	p6fcHiz3zIHBGBeVhRKtMNtCDoZC4uCmB5QmMCxantkMLW+NeeYpP/kgJs+vqss/rE+wlDU1wzEnK
	kbBxmIXTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyQiH-0004rX-NR; Thu, 23 Jul 2020 02:12:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyQiF-0004qf-Fl; Thu, 23 Jul 2020 02:12:00 +0000
X-UUID: bd947b96125240c6bd99750868cad0db-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PQR+pTRUJr2p2puT6kEgda5uTBofuzbyJhCIDKViHyo=; 
 b=bTgt/zGVR3bFHtCkjDoRHrPVB5J64H23WMse0LvKEATHHY+U+M7zYq4pGqFAmAwwpRRcDH1kfW/TCtwk+QJSr2x4hIauWwgj+1knr1Gy2yMXqkYWA+bXKv9/1XOfJ1MUKQms1G6i2oGBzmIIYFV7PFrTYILSM4seqNeHolJi92A=;
X-UUID: bd947b96125240c6bd99750868cad0db-20200722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2072290944; Wed, 22 Jul 2020 18:11:54 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 19:04:55 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 10:04:54 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 10:04:49 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [v7, PATCH 6/7] drm/mediatek: add fifo_size into rdma private data
Date: Thu, 23 Jul 2020 10:03:17 +0800
Message-ID: <1595469798-3824-7-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_221159_725043_490851E1 
X-CRM114-Status: GOOD (  15.48  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

the fifo size of rdma in mt8183 is different.
rdma0 fifo size is 5k
rdma1 fifo size is 2k

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index e04319f..794acc5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -63,6 +63,7 @@ struct mtk_disp_rdma {
 	struct mtk_ddp_comp		ddp_comp;
 	struct drm_crtc			*crtc;
 	const struct mtk_disp_rdma_data	*data;
+	u32				fifo_size;
 };
 
 static inline struct mtk_disp_rdma *comp_to_rdma(struct mtk_ddp_comp *comp)
@@ -131,12 +132,18 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
 	unsigned int threshold;
 	unsigned int reg;
 	struct mtk_disp_rdma *rdma = comp_to_rdma(comp);
+	u32 rdma_fifo_size;
 
 	mtk_ddp_write_mask(cmdq_pkt, width, comp,
 			   DISP_REG_RDMA_SIZE_CON_0, 0xfff);
 	mtk_ddp_write_mask(cmdq_pkt, height, comp,
 			   DISP_REG_RDMA_SIZE_CON_1, 0xfffff);
 
+	if (rdma->fifo_size)
+		rdma_fifo_size = rdma->fifo_size;
+	else
+		rdma_fifo_size = RDMA_FIFO_SIZE(rdma);
+
 	/*
 	 * Enable FIFO underflow since DSI and DPI can't be blocked.
 	 * Keep the FIFO pseudo size reset default of 8 KiB. Set the
@@ -145,7 +152,7 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
 	 */
 	threshold = width * height * vrefresh * 4 * 7 / 1000000;
 	reg = RDMA_FIFO_UNDERFLOW_EN |
-	      RDMA_FIFO_PSEUDO_SIZE(RDMA_FIFO_SIZE(rdma)) |
+	      RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) |
 	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);
 	mtk_ddp_write(cmdq_pkt, reg, comp, DISP_REG_RDMA_FIFO_CON);
 }
@@ -291,6 +298,16 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 		return comp_id;
 	}
 
+	if (of_find_property(dev->of_node, "mediatek,rdma_fifo_size", &ret)) {
+		ret = of_property_read_u32(dev->of_node,
+					   "mediatek,rdma_fifo_size",
+					   &priv->fifo_size);
+		if (ret) {
+			dev_err(dev, "Failed to get rdma fifo size\n");
+			return ret;
+		}
+	}
+
 	ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
 				&mtk_disp_rdma_funcs);
 	if (ret) {
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
