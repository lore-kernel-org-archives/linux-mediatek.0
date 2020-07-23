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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B52C0C43478
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:07:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6617A2084D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:07:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J2Sh2eAc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bbRkK9Hp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6617A2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zc5dQanp4CbWu9Z8BVyG3tTtOq6sbqnPlQ9qf/Au1HM=; b=J2Sh2eAcZahrr2ftWyMGFJdvU
	fAa9Eq5f+HX3KZJV3r/HCuyosLE1mCa6jnhCQTCrYw1NnYo9zKMfrtsJ1YG6BaK40EgFVbTM+x4Dm
	cepcQTkoGSH0u2ltU5kOu9W8+a/fIxrg2A3yKAV2v0lEOTZh1/NeG55LcxyILws/mbTyU4Kw06F47
	jCkx287m+huUUo5Q3OAyjUjcvAmckzdmyx5JDASSCgekrZeYe/WASZVNv9zYuiZMlJ1tsfdeqHQ1L
	CcpfoqEGuNyx7wfTUKM+dggP1kruzARMbtIgvNdmM7brSM1EqQIvL1FHkSsNJwTdia4jiz/vadOYZ
	FYXNbrQnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyRZc-0001ia-JK; Thu, 23 Jul 2020 03:07:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyRYn-0001Ci-I1; Thu, 23 Jul 2020 03:06:21 +0000
X-UUID: 09fa8c66bcc5487c92880604d47d7f3a-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=cZZKLjLUqA7lu/jFmHD2bgqKPtFaBSRp1fqq2KtRdZ4=; 
 b=bbRkK9HpiZCEiqyiN3IrCGuJ8vJIicR9+GYSC3AqUf/8n/LWSLVai1i8VazX/XfTpbHpKDFrFhj2W10gRHYxzOykdqD7iXwI7aVlDu0lEyZf31Bc8kxmGlOpqlDkojx0JhIXThzRSGhr5XfuarXXjgpGAtapbBmJno2UuRrN43Q=;
X-UUID: 09fa8c66bcc5487c92880604d47d7f3a-20200722
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 975464803; Wed, 22 Jul 2020 19:06:15 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 20:06:13 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:12 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:08 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v10 08/28] media: platform: Add mechanism to handle jpeg
 hardware's locking up
Date: Thu, 23 Jul 2020 11:04:31 +0800
Message-ID: <20200723030451.5616-9-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200723030451.5616-1-xia.jiang@mediatek.com>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_230617_818351_937EA7EA 
X-CRM114-Status: GOOD (  13.41  )
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

Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v10: new add patch
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
