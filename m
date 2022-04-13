Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F033C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 04:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vexmQUpw3LhCQlbWfi8TsRQ85qwtjT3bo4ZnSlbs65M=; b=gI+zQThcBINcTT
	fK7PnO9pHN3OqVExvffa7IyrJhvvwt8U08iaIjje3XAfvbo1lp+RcX7gs019cRfcXYrYsU3o0m9Ch
	9n4c+SlmyEWQWQUF1uoUvTuMBbYB390oWJxRlFtlZ5HVykOS1WpzIEKg4fasM9wOqd2Mj/qpCKPM0
	mEdxMdqRTxPzFRI8FMwBh9m1pv2O80xP+BYxn9nqsGHIiQKlK2iuOWrSzkT7AxbXP0JWjtmcx9c01
	ArHXl3L9wI0VhbDVRu2ympyX/TT4ffwnUlHrm+MW4/DbUGUj+3lneifDCy0fcGnaaRBikhzkrtLFF
	8c59ahpoIoD+3Nc22FEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neUFw-00GgiO-V4; Wed, 13 Apr 2022 04:05:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neUF6-00GgJG-O1; Wed, 13 Apr 2022 04:04:34 +0000
X-UUID: b8b9df22ea614795ab847d99ee22934d-20220412
X-UUID: b8b9df22ea614795ab847d99ee22934d-20220412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 567402884; Tue, 12 Apr 2022 21:04:28 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 20:54:31 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 13 Apr 2022 11:54:16 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Apr 2022 11:54:15 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,
 2/7] media: mediatek: vcodec: Add to support lat soc hardware
Date: Wed, 13 Apr 2022 11:54:05 +0800
Message-ID: <20220413035410.29568-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220413035410.29568-1-yunfei.dong@mediatek.com>
References: <20220413035410.29568-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_210432_808675_026C949A 
X-CRM114-Status: GOOD (  17.40  )
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

Add lat soc compatible and to support lat soc power/clk helper.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/mtk_vcodec_dec_hw.c | 12 +++++++++---
 .../platform/mediatek/vcodec/mtk_vcodec_dec_hw.h |  2 ++
 .../platform/mediatek/vcodec/mtk_vcodec_dec_pm.c | 16 ++++++++++++++++
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h    |  1 +
 4 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
index 14bed2bd4283..376db0e433d7 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
@@ -28,6 +28,10 @@ static const struct of_device_id mtk_vdec_hw_match[] = {
 		.compatible = "mediatek,mtk-vcodec-core",
 		.data = (void *)MTK_VDEC_CORE,
 	},
+	{
+		.compatible = "mediatek,mtk-vcodec-lat-soc",
+		.data = (void *)MTK_VDEC_LAT_SOC,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_vdec_hw_match);
@@ -166,9 +170,11 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
 	subdev_dev->reg_base[VDEC_HW_SYS] = main_dev->reg_base[VDEC_HW_SYS];
 	set_bit(subdev_dev->hw_idx, main_dev->subdev_bitmap);
 
-	ret = mtk_vdec_hw_init_irq(subdev_dev);
-	if (ret)
-		goto err;
+	if (IS_SUPPORT_VDEC_HW_IRQ(hw_idx)) {
+		ret = mtk_vdec_hw_init_irq(subdev_dev);
+		if (ret)
+			goto err;
+	}
 
 	subdev_dev->reg_base[VDEC_HW_MISC] =
 		devm_platform_ioremap_resource(pdev, 0);
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.h
index a63e4b1b81c3..b8938c6c3e72 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.h
@@ -17,6 +17,8 @@
 #define VDEC_IRQ_CLR 0x10
 #define VDEC_IRQ_CFG_REG 0xa4
 
+#define IS_SUPPORT_VDEC_HW_IRQ(hw_idx) (hw_idx != MTK_VDEC_LAT_SOC)
+
 /**
  * enum mtk_vdec_hw_reg_idx - subdev hardware register base index
  * @VDEC_HW_SYS : vdec soc register index
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c
index 0fb7e5ba635b..d69faa463d04 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_pm.c
@@ -174,6 +174,14 @@ static void mtk_vcodec_dec_child_dev_on(struct mtk_vcodec_dev *vdec_dev,
 		mtk_vcodec_dec_pw_on(pm);
 		mtk_vcodec_dec_clock_on(pm);
 	}
+
+	if (hw_idx == MTK_VDEC_LAT0) {
+		pm = mtk_vcodec_dec_get_pm(vdec_dev, MTK_VDEC_LAT_SOC);
+		if (pm) {
+			mtk_vcodec_dec_pw_on(pm);
+			mtk_vcodec_dec_clock_on(pm);
+		}
+	}
 }
 
 static void mtk_vcodec_dec_child_dev_off(struct mtk_vcodec_dev *vdec_dev,
@@ -186,6 +194,14 @@ static void mtk_vcodec_dec_child_dev_off(struct mtk_vcodec_dev *vdec_dev,
 		mtk_vcodec_dec_clock_off(pm);
 		mtk_vcodec_dec_pw_off(pm);
 	}
+
+	if (hw_idx == MTK_VDEC_LAT0) {
+		pm = mtk_vcodec_dec_get_pm(vdec_dev, MTK_VDEC_LAT_SOC);
+		if (pm) {
+			mtk_vcodec_dec_clock_off(pm);
+			mtk_vcodec_dec_pw_off(pm);
+		}
+	}
 }
 
 void mtk_vcodec_dec_enable_hardware(struct mtk_vcodec_ctx *ctx, int hw_idx)
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index a29041a0b7e0..0e3db8ccb398 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -104,6 +104,7 @@ enum mtk_vdec_hw_id {
 	MTK_VDEC_CORE,
 	MTK_VDEC_LAT0,
 	MTK_VDEC_LAT1,
+	MTK_VDEC_LAT_SOC,
 	MTK_VDEC_HW_MAX,
 };
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
