Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1ECC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 12:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rRg7Oz45EKKCWclB8oR+x7bO6319aXmS1yAvjbRJnBo=; b=uo+WjtTS3iP2TJ
	kiD5/7AJW+KSTyo4VOhY/qdumUamV9kJ0mHwzZ2PSejaXB5+KPIimkbCM3BFKrOeEZYAE6SdwmSsF
	h0JL5RP+qfNcUGUoTkHyz9y5A28Y3QIBkm8km+a/G8FRqLl69Kg8cBod9fDJLt4Q9bFMD7fjMRYpm
	BysrzQte1vAIp0ZFje8ztOFAaloVGvXsYx+L4OhqGlvK6sr5dOCHdH6XCOZtXin9P7EEZuskbdm2O
	xPfS4TtUFs3FrC/uunbUwjLvNac+djjmX1s1BVPfsfNqhRnhZqDkjb7OXI7h8Fs5taq2DunSmilwX
	Xg4BEdAyBTCtEKOLXyHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrf0k-006b67-57; Thu, 19 May 2022 12:12:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrf0O-006b0h-GS; Thu, 19 May 2022 12:11:49 +0000
X-UUID: 1ed6d50840a443ed96d6947305f277d5-20220519
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:084af277-5ca8-479f-8ae9-71adaa3c7662, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:3cb6de79-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 1ed6d50840a443ed96d6947305f277d5-20220519
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1471325186; Thu, 19 May 2022 05:11:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 May 2022 05:11:43 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 19 May 2022 20:11:41 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 May 2022 20:11:40 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>, kyrie wu
 <kyrie.wu@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [RESEND V1,2/2] media: media: jpegenc: set bit mask for jpegenc
Date: Thu, 19 May 2022 20:11:35 +0800
Message-ID: <1652962295-16575-3-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1652962295-16575-1-git-send-email-kyrie.wu@mediatek.com>
References: <1652962295-16575-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_051148_609419_4D26F88F 
X-CRM114-Status: GOOD (  11.26  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

set jpeg encode DMA bit mask to support 34bits
iova space(16GB) that the mt8186 iommu HW support.
Whole the iova range separate to 0~4G/4G~8G/8G~12G/12G~16G,
regarding which iova range jpgenc actually locate, it
depends on the dma-ranges property of vdec dtsi node.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index bc5b0a0168ec..87685a62a5c2 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1369,6 +1369,9 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	jpeg->vdev->device_caps = V4L2_CAP_STREAMING |
 				  V4L2_CAP_VIDEO_M2M_MPLANE;
 
+	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
+		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
+
 	ret = video_register_device(jpeg->vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		v4l2_err(&jpeg->v4l2_dev, "Failed to register video device\n");
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
