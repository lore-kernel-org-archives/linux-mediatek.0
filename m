Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6C2ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 13:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=px7Xehz5yn0CjeKQO52tYdYlFCu/WlQJeKlG8nVps84=; b=pMcqRyiNg6wQ44tL1snqZ31CbT
	cm5ntvskDd8eiEfB5GkQQhPpDpawWAjfsn8hu3jbXgS50IutZZAX90Yq5UOzKiqmIMZ4Bf52puC+p
	m489XFApi+wg+TDYT2XkTcVrFCOItXZHvMrl0xRmVM9hFKd5k2gQ2avWFY3xYrAduJdC5hGxhWPsu
	TS7xVUL1LTZ/0sJBvYErbWKrmEvnG7TEJgSQrRNwcsx9tRd8oJ3RAMYnqtPJeXzzHZKwCjq6sjs8E
	Wo2NCcfEec0t6WDhp060oduzpQnYlqmXl0B1g8krb043GdwRZ7YOerczL+kamHS+Wf5LHw54BsEJ2
	QLTpxUaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSMe-000kzM-8b; Wed, 14 Sep 2022 13:23:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSLH-000jXW-SV; Wed, 14 Sep 2022 13:22:17 +0000
X-UUID: 0adbb54aeee7475bb27faa81aa9fc3d7-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=px7Xehz5yn0CjeKQO52tYdYlFCu/WlQJeKlG8nVps84=;
	b=mbliTNAhImOi4lS92Wun0E15uAqaZrWbH7uOfB/5JZLspeib8HI6r4ttLIdUJ4GYBtscBINlwhZXIywzQkExnDL+m1slGv2l31s3f3IPDlZsXiSkeGYZvWguuZIxALLZ8ycj9pFXkWtsdP/mSenKBfoll19ax/bQ8iRXczPZQzs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:aae19253-ab62-4d12-8b92-65c5e4682eac,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:ff4964f6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0adbb54aeee7475bb27faa81aa9fc3d7-20220914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 841317723; Wed, 14 Sep 2022 06:22:10 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 14 Sep 2022 21:21:08 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 14 Sep 2022 21:21:07 +0800
From: <xinlei.lee@mediatek.com>
To: <matthias.bgg@gmail.com>, <jason-jh.lin@mediatek.com>,
	<rex-bc.chen@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jitao.shi@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH v6,1/3] soc: mediatek: Add mmsys func to adapt to dpi output for MT8186
Date: Wed, 14 Sep 2022 21:21:00 +0800
Message-ID: <1663161662-1598-2-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1663161662-1598-1-git-send-email-xinlei.lee@mediatek.com>
References: <1663161662-1598-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="yes"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_062215_945017_43044D9D 
X-CRM114-Status: UNSURE (   9.62  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

Add mmsys func to manipulate dpi output format config for MT8186.

Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Reviewed-by: Nís F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/soc/mediatek/mt8186-mmsys.h    |  6 ++++++
 drivers/soc/mediatek/mtk-mmsys.c       | 20 ++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mmsys.h |  2 ++
 3 files changed, 28 insertions(+)

diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
index eb1ad9c37a9c..09b1ccbc0093 100644
--- a/drivers/soc/mediatek/mt8186-mmsys.h
+++ b/drivers/soc/mediatek/mt8186-mmsys.h
@@ -3,6 +3,12 @@
 #ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
 #define __SOC_MEDIATEK_MT8186_MMSYS_H
 
+/* Values for DPI configuration in MMSYS address space */
+#define MT8186_MMSYS_DPI_OUTPUT_FORMAT		0x400
+#define DPI_FORMAT_MASK					0x1
+#define DPI_RGB888_DDR_CON				BIT(0)
+#define DPI_RGB565_SDR_CON				BIT(1)
+
 #define MT8186_MMSYS_OVL_CON			0xF04
 #define MT8186_MMSYS_OVL0_CON_MASK			0x3
 #define MT8186_MMSYS_OVL0_2L_CON_MASK			0xC
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 06d8e83a2cb5..2e20b24da363 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -227,6 +227,26 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
+static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
+{
+	u32 tmp;
+
+	tmp = readl_relaxed(mmsys->regs + offset);
+	tmp = (tmp & ~mask) | val;
+	writel_relaxed(tmp, mmsys->regs + offset);
+}
+
+void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
+{
+	if (val)
+		mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT,
+				      DPI_RGB888_DDR_CON, DPI_FORMAT_MASK);
+	else
+		mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DPI_OUTPUT_FORMAT,
+				      DPI_RGB565_SDR_CON, DPI_FORMAT_MASK);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_fmt_config);
+
 static int mtk_mmsys_reset_update(struct reset_controller_dev *rcdev, unsigned long id,
 				  bool assert)
 {
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 59117d970daf..d2b02bb43768 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -65,4 +65,6 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 			      enum mtk_ddp_comp_id cur,
 			      enum mtk_ddp_comp_id next);
 
+void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val);
+
 #endif /* __MTK_MMSYS_H */
-- 
2.18.0


