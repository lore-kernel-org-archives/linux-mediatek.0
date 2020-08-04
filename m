Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F29C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 03:53:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6F4B206F6
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 03:53:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XWQPxtuu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WTkfMbmJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6F4B206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+LQLqUV7/GuBbzWZRK7xa/UCZQBvTLEmH+HMOGfJ4Qo=; b=XWQPxtuu64yHERT7zx1YRzYLO
	LAHEOcR05+v9oa6Wbqxrqnq7dUmTknwVjJOfkffYGQjqLf+ck8X6PSy/rgCTKhd0DyNCBYAl0v6IO
	iqAIyVsS//jxMEpjKEjXxtcnlsvXwBISjx9rgcTVoneOhsBKFTjYLCGsLvgmuRzrCKBdSJU5FwXS3
	4Nen2DH9H7Z5SvZgnHZxogcICKavdD0rDPfJxC33DfPyRezXLgDftr5jhWWBtfLrnN0u1ylytAlZy
	OrlWwb6LSRLDGc3WuR+95EuxyzGLIrG2WlCLwe262cB5iv87BSJ+/CoAa1vAJ1kJOCo0TnSdbCAV1
	7EHUhuMTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2o0T-0001kn-1P; Tue, 04 Aug 2020 03:52:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2nzZ-0001BY-4R; Tue, 04 Aug 2020 03:51:58 +0000
X-UUID: aae7065e083042db9731607a830aada9-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=T206XQpMfXYf+0AvODKQPGGQsO7Nm22nEW5m9gZP/gU=; 
 b=WTkfMbmJ5RsG1SigoIQtMwMlOp6gROcT9tD3imUMmpN4XWB7lVEZQvk9iMpRCJ19mey4Ejdtwo2CicSNgAm+kNpaf9Aoe9EC4zNtisS73BNs3F2I/Y4bTBO1+F6v/CDT1NiHSsxmNmqFEUSqoH/5c3vPoPOAdo6X1flLhDt6X4k=;
X-UUID: aae7065e083042db9731607a830aada9-20200803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1360164810; Mon, 03 Aug 2020 19:51:46 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 20:41:52 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 11:41:51 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 11:41:50 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v11 08/28] media: platform: Add mechanism to handle jpeg
 hardware's locking up
Date: Tue, 4 Aug 2020 11:40:42 +0800
Message-ID: <20200804034102.22983-9-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200804034102.22983-1-xia.jiang@mediatek.com>
References: <20200804034102.22983-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_235157_333915_B46F4981 
X-CRM114-Status: GOOD (  15.73  )
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
Cc: maoguang.meng@mediatek.com, devicetree@vger.kernel.org,
 mojahsu@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 senozhatsky@chromium.org, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, Xia Jiang <xia.jiang@mediatek.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There is a delayed work scheduled before starting the hardware and
canceled in the interrupt handler. If the delayed work is executed, it
resets the hardware and reports the failure to V4L2, so that the
execution can continue from next frames.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v11: no changes
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 25 +++++++++++++++++++
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  4 +++
 2 files changed, 29 insertions(+)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index ee4aaf618551..9baeeacb4452 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -816,6 +816,9 @@ static void mtk_jpeg_device_run(void *priv)
 	if (ret < 0)
 		goto dec_end;
 
+	schedule_delayed_work(&jpeg->job_timeout_work,
+			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
+
 	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
 	if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param, &dst_buf->vb2_buf, &fb))
 		goto dec_end;
@@ -911,6 +914,8 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
 	u32 dec_ret;
 	int i;
 
+	cancel_delayed_work(&jpeg->job_timeout_work);
+
 	dec_ret = mtk_jpeg_dec_get_int_status(jpeg->dec_reg_base);
 	dec_irq_ret = mtk_jpeg_dec_enum_result(dec_ret);
 	ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
@@ -1066,6 +1071,25 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
 	return PTR_ERR_OR_ZERO(jpeg->clk_jdec_smi);
 }
 
+static void mtk_jpeg_job_timeout_work(struct work_struct *work)
+{
+	struct mtk_jpeg_dev *jpeg = container_of(work, struct mtk_jpeg_dev,
+						 job_timeout_work.work);
+	struct mtk_jpeg_ctx *ctx;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+
+	ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
+	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+
+	mtk_jpeg_dec_reset(jpeg->dec_reg_base);
+
+	pm_runtime_put(jpeg->dev);
+
+	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
+	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
+}
 static int mtk_jpeg_probe(struct platform_device *pdev)
 {
 	struct mtk_jpeg_dev *jpeg;
@@ -1080,6 +1104,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	mutex_init(&jpeg->lock);
 	spin_lock_init(&jpeg->hw_lock);
 	jpeg->dev = &pdev->dev;
+	INIT_DELAYED_WORK(&jpeg->job_timeout_work, mtk_jpeg_job_timeout_work);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	jpeg->dec_reg_base = devm_ioremap_resource(&pdev->dev, res);
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 999bd1427809..320c4f8a014a 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -28,6 +28,8 @@
 
 #define MTK_JPEG_DEFAULT_SIZEIMAGE	(1 * 1024 * 1024)
 
+#define MTK_JPEG_HW_TIMEOUT_MSEC 1000
+
 enum mtk_jpeg_ctx_state {
 	MTK_JPEG_INIT = 0,
 	MTK_JPEG_RUNNING,
@@ -48,6 +50,7 @@ enum mtk_jpeg_ctx_state {
  * @clk_jdec:		JPEG hw working clock
  * @clk_jdec_smi:	JPEG SMI bus clock
  * @larb:		SMI device
+ * @job_timeout_work:	IRQ timeout structure
  */
 struct mtk_jpeg_dev {
 	struct mutex		lock;
@@ -62,6 +65,7 @@ struct mtk_jpeg_dev {
 	struct clk		*clk_jdec;
 	struct clk		*clk_jdec_smi;
 	struct device		*larb;
+	struct delayed_work job_timeout_work;
 };
 
 /**
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
