Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C342CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 05:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYVRk/myaWolfFv/eXqn4wJ4c2NLCtF0+F0xXIHh840=; b=NWl9aGTTMqWFgc
	cMKlkrYn9SmhywghehIDmcbTdqcGf9HvvPg4/xsBvXBrkwJZWUtFpWeTaoc+PLT9vUmFX42EvL+pG
	56FBUol12gIKVq3m+TlFjp01i5QJ9bMp6GnrqKue8LBEfsr+NRioc0W5vtNUHT4NkJvr6a+DzMO1W
	W7Z+cUFAc1RseOhzu69pBryxzzCpB6doWIya4rDf/RGEifJ1YHnw2+v9Eoxm3PEidQUQZW/QH9i+4
	YKLt5nAvtMA2yFItWsO/kHfBXZG4pxYLA4I+7lnRx4J4PCjGEgG3oIniNLpKXGRlN8cGl02y/eVPX
	qH7AIRJGt6yY7NqTB9fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt1Do-00EQbC-Jw; Fri, 03 Dec 2021 05:35:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt1DN-00EQQw-7Q; Fri, 03 Dec 2021 05:34:34 +0000
X-UUID: e102ded0199345a896a1d6a72fced622-20211202
X-UUID: e102ded0199345a896a1d6a72fced622-20211202
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1547278299; Thu, 02 Dec 2021 22:34:27 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Dec 2021 21:34:26 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 3 Dec 2021 13:34:24 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 3 Dec 2021 13:34:23 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xia.jiang@mediatek.com>,
 <maoguang.meng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <kyrie.wu@mediatek.com>, <irui.wang@mediatek.com>
Subject: [PATCH V1, 3/6] media: mtk-jpegdec: add jpegdec timeout func interface
Date: Fri, 3 Dec 2021 13:34:12 +0800
Message-ID: <1638509655-14296-4-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1638509655-14296-1-git-send-email-kyrie.wu@mediatek.com>
References: <1638509655-14296-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_213433_332732_54FD258C 
X-CRM114-Status: GOOD (  12.35  )
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

Generalizes jpegdec timeout func interfaces to handle HW timeout.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |  2 ++
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 20243d4..b7102db 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -200,6 +200,8 @@ struct mtk_jpegdec_comp_dev {
 	struct mtk_jpeg_dev *master_dev;
 	struct mtk_jpegdec_pm pm;
 	int jpegdec_irq;
+	struct delayed_work job_timeout_work;
+	struct mtk_jpeg_hw_param hw_param;
 };
 
 /**
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
index 86f12bd..e295576 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
@@ -443,6 +443,24 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
 	mtk_jpeg_dec_set_pause_mcu_idx(base, config->total_mcu);
 }
 
+static void mtk_jpegdec_timeout_work(struct work_struct *work)
+{
+	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
+	struct mtk_jpegdec_comp_dev *cjpeg =
+		container_of(work, struct mtk_jpegdec_comp_dev,
+		job_timeout_work.work);
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+
+	src_buf = cjpeg->hw_param.src_buffer;
+	dst_buf = cjpeg->hw_param.dst_buffer;
+
+	mtk_jpeg_dec_reset(cjpeg->reg_base);
+	clk_disable_unprepare(cjpeg->pm.dec_clk.clk_info->jpegdec_clk);
+	pm_runtime_put(cjpeg->pm.dev);
+	v4l2_m2m_buf_done(src_buf, buf_state);
+	v4l2_m2m_buf_done(dst_buf, buf_state);
+}
+
 int mtk_jpegdec_init_pm(struct mtk_jpegdec_comp_dev *mtkdev)
 {
 	struct mtk_jpegdec_clk_info *clk_info;
@@ -507,6 +525,8 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	struct mtk_jpegdec_comp_dev *jpeg = priv;
 	struct mtk_jpeg_dev *master_jpeg = jpeg->master_dev;
 
+	cancel_delayed_work(&jpeg->job_timeout_work);
+
 	irq_status = mtk_jpeg_dec_get_int_status(jpeg->reg_base);
 	dec_irq_ret = mtk_jpeg_dec_enum_result(irq_status);
 	if (dec_irq_ret >= MTK_JPEG_DEC_RESULT_UNDERFLOW)
@@ -592,6 +612,9 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dev->plat_dev = pdev;
+
+	INIT_DELAYED_WORK(&dev->job_timeout_work, mtk_jpegdec_timeout_work);
+
 	ret = mtk_jpegdec_init_pm(dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to get jpeg enc clock source");
-- 
2.6.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
