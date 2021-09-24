Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE2AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 07:47:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C2E060E08
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 07:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C2E060E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0f/GFCXbO36DF+I5CS+e6sd5zMoMHFgqebgCmvG8vk=; b=DJxS5cVHNGmA1E
	mpdE42E9U9fRLRINVVRLMVKDoy1LxyZ/yi3l5Z/OknxRV2WbG9yhIU+VuGeNjLbyVEM5DK4O9QyPd
	Mme54a7UdZwd1MyDUQOXzvgJYDTnz95NmEv2GmAOu42konWDTkCH6Smms6/wiwjYwg+GK6cL7jVe7
	7OAoCQ8/DLTUOGnq7EX8kfYKQ8PQ0JNqGApu2fKezCKvyuR9yw3udpd9xFUzcvIpBwSWI33QDfmyg
	RnxVas5YCx/wr/MqTALY05aNjUsM9kuk6M5m5tAialfTyBkdvbokcUMYB8HwZ4WQ+IqIXe50XOnoZ
	pkCuvOBSvv4kYDktCuKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTfv8-00DNKv-VA; Fri, 24 Sep 2021 07:46:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTfu9-00DMtf-SL; Fri, 24 Sep 2021 07:45:59 +0000
X-UUID: 03008aa25fdd4106a9ec063391ab33c2-20210924
X-UUID: 03008aa25fdd4106a9ec063391ab33c2-20210924
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1751341349; Fri, 24 Sep 2021 00:45:54 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 00:45:52 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 15:45:51 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Sep 2021 15:45:50 +0800
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
Subject: [PATCH V4, 3/5] media: mtk-jpegenc: add jpegenc timeout func interface
Date: Fri, 24 Sep 2021 15:45:41 +0800
Message-ID: <1632469543-27345-4-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1632469543-27345-1-git-send-email-kyrie.wu@mediatek.com>
References: <1632469543-27345-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_004557_933180_4FA19E42 
X-CRM114-Status: GOOD (  13.34  )
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

Generalizes jpegenc timeout func interfaces to handle HW timeout.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |  8 ++++++++
 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 23 +++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 9793ccb..0689bcb 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -75,6 +75,12 @@ struct mtk_jpeg_variant {
 	u32 cap_q_default_fourcc;
 };
 
+struct mtk_jpeg_hw_param {
+	struct vb2_v4l2_buffer *src_buffer;
+	struct vb2_v4l2_buffer *dst_buffer;
+	struct mtk_jpeg_ctx *curr_ctx;
+};
+
 enum mtk_jpegenc_hw_id {
 	MTK_JPEGENC_HW0,
 	MTK_JPEGENC_HW1,
@@ -120,6 +126,8 @@ struct mtk_jpegenc_comp_dev {
 	struct mtk_jpeg_dev *master_dev;
 	struct mtk_jpegenc_pm pm;
 	int jpegenc_irq;
+	struct delayed_work job_timeout_work;
+	struct mtk_jpeg_hw_param hw_param;
 };
 
 /**
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
index cf8a706..c3feb3a0 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
@@ -271,6 +271,25 @@ void mtk_jpegenc_release_pm(struct mtk_jpegenc_comp_dev *mtkdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+static void mtk_jpegenc_timeout_work(struct work_struct *work)
+{
+	struct delayed_work *Pwork =
+		container_of(work, struct delayed_work, work);
+	struct mtk_jpegenc_comp_dev *cjpeg =
+		container_of(Pwork, struct mtk_jpegenc_comp_dev,
+		job_timeout_work);
+	struct vb2_v4l2_buffer *src_buf;
+	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
+
+	src_buf = cjpeg->hw_param.src_buffer;
+
+	mtk_jpeg_enc_reset(cjpeg->reg_base);
+	clk_disable_unprepare(cjpeg->pm.venc_clk.clk_info->jpegenc_clk);
+	pm_runtime_put(cjpeg->pm.dev);
+
+	v4l2_m2m_buf_done(src_buf, buf_state);
+}
+
 static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 {
 	struct mtk_jpegenc_comp_dev *jpeg = priv;
@@ -281,6 +300,8 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	enum vb2_buffer_state buf_state;
 	u32 result_size;
 
+	cancel_delayed_work(&jpeg->job_timeout_work);
+
 	irq_status = readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
 		     JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
 	if (irq_status)
@@ -344,6 +365,8 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 
 	dev->plat_dev = pdev;
 
+	INIT_DELAYED_WORK(&dev->job_timeout_work, mtk_jpegenc_timeout_work);
+
 	ret = mtk_jpegenc_init_pm(dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to get jpeg enc clock source");
-- 
2.6.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
