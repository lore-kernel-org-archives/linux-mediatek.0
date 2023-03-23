Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D30C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 08:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJcNAlsmBP8ajxbJLlshcvTja5PdCGJYpyuZW/mV0zg=; b=Pievjlm7LOIYuBMRaaGLtZ6C+U
	AE2P/Xii6b1Fl9jinSNgd/Pxthw9fGJqVezk2Ptzj5AvoZtWDFTp8mTDSnY2c5rVy4AaPjWCItHCh
	ZXZic5/4ZGdTRFJinUaAcOknI1B/UsAs79cp0dltEjFFvRDdWiQkAB0A2TgYK425RGpAc3K33z6cT
	JH9zIMfe6mtm6aYIXD4pcexbNJlJw4r88GTk5ucnjnsfXjJJF/UEDTLNBa4mtuqvzaESQ94WWKF43
	bRCnjR8lk8ZYBO422eXzmWF247BmRYv6SgEo2PJMZiiLzXYMK8ISe5y1d11FWMPN1OkgmH+SeBr7C
	4iTIuJjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGTI-001IRH-1h;
	Thu, 23 Mar 2023 08:38:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGTF-001IPz-0w;
	Thu, 23 Mar 2023 08:38:54 +0000
X-UUID: 21f3cc46c95611edb7d8d11f642b8e78-20230323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NJcNAlsmBP8ajxbJLlshcvTja5PdCGJYpyuZW/mV0zg=;
	b=SFsSgoDOzpwhzNvn2YlczMXgWjd/W/QSiONnTZJUG7dTlNh5ixf5jOkLomnTvX39X+JYSWBNLn7HAliQlv8MchVA+kw6fZ4nrbYia2Oh/8LWT8Pjyv++XjSgRv4fDWwuSwMLPAgw3JK5RWWiU35F1mgEJTUncaHYLB0IXyA4dmE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:4a0d3eab-c107-4fd2-95c0-e9d03572cf8e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:6279aff6-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 21f3cc46c95611edb7d8d11f642b8e78-20230323
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1135369834; Thu, 23 Mar 2023 01:38:49 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 23 Mar 2023 16:38:13 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 23 Mar 2023 16:38:12 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Yong Wu <yong.wu@mediatek.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 2/2] media: mediatek: vcodec: Remove encoder 'dma-ranges' conditon when set dma mask
Date: Thu, 23 Mar 2023 16:38:10 +0800
Message-ID: <20230323083810.21912-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323083810.21912-1-yunfei.dong@mediatek.com>
References: <20230323083810.21912-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_013853_338392_BC26DD5A 
X-CRM114-Status: GOOD (  14.45  )
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

After commit f1ad5338a4d5("of: Fix "dma-ranges" handling for bus controllers"),
the dma-ranges is not allowed in encoder dts node. But the driver still need
to set dma mask, remove "dma-ranges" condition in prob function.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
Reference series:
[1]: v5 of this series is present by Yong Wu.
     20230307023507.13306-1-yong.wu@mediatek.com
---
 .../mediatek/vcodec/mtk_vcodec_enc_drv.c      | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
index 6961f66b5693..dda669d04c05 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
@@ -83,6 +83,21 @@ static void clean_irq_status(unsigned int irq_status, void __iomem *addr)
 		writel(MTK_VENC_IRQ_STATUS_FRM, addr);
 
 }
+
+static int mtk_vcodec_enc_set_dma_mask(struct device *dev)
+{
+	int ret = 0;
+
+	return !(of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-dec") ||
+	       of_device_is_compatible(dev->of_node, "mediatek,mt8183-vcodec-dec"));
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34));
+	if (ret)
+		mtk_v4l2_err("Failed to set enc mask");
+
+	return ret;
+}
+
 static irqreturn_t mtk_vcodec_enc_irq_handler(int irq, void *priv)
 {
 	struct mtk_vcodec_dev *dev = priv;
@@ -344,8 +359,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_event_workq;
 	}
 
-	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
-		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
+	ret = mtk_vcodec_enc_set_dma_mask(&pdev->dev);
+	if (ret)
+		goto err_event_workq;
 
 	ret = video_register_device(vfd_enc, VFL_TYPE_VIDEO, -1);
 	if (ret) {
-- 
2.18.0


