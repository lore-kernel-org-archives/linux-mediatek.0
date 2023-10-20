Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85924CDB47E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Oct 2023 04:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bTNEUKYdQRSbEH26367Xfr03nDSYmfPUQGyQW1vivyY=; b=fPiU6MndtOOYtxMIM4bOCKcnsf
	AS6nsRIxZs7IMi5SFQ872w/WDVgQMleAPq7FaPhTIxblgiZnhDeO7mcsb9nRPQ+HaypRJBIcqFRus
	SPIIJfhIp7kLUgpduk6u0ivXsd9hxeztE9H/SExZtaNbujUhVeV0R5iavcRbZ7ESXzqTJeodDBF3q
	9vmMPYA5MWU+0ww2i0oGlP4TBWokR1wygABCqFEbCo8DBYhCts8UJf3r6EOeQWPKHbxnl5jZZUqBc
	2TQzmSBlfIEp52kI+IQtlTzlEgt0OvrW7Z1ZTYcl4CsqfpN8mj98nUrisgJBLC0FKdIf9eRhWQ3h/
	/DLlIqpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtgoN-0019zx-2A;
	Fri, 20 Oct 2023 04:08:35 +0000
Received: from m15.mail.163.com ([45.254.50.219])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtgoK-0019yZ-0j;
	Fri, 20 Oct 2023 04:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=bTNEU
	KYdQRSbEH26367Xfr03nDSYmfPUQGyQW1vivyY=; b=G/USLP+1mCvkTnGsCm3pB
	L5zQiknSe/xWAbyT9fXRy6BoyqxGKe2PJ5yL2lbaSNDC9sk3xSsoZ/ICkox2CdkH
	IiRcJ88Ter66vsRGPAB/5Lj0y0aK+kxt29nYBz2tP3p6Ol2iW41Z7IUIPE2oFRTA
	67jGUMJQw6hmZMYYQDO6LM=
Received: from leanderwang-LC4.localdomain (unknown [111.206.145.21])
	by zwqz-smtp-mta-g1-4 (Coremail) with SMTP id _____wDXfs0G_TFl9X8bBA--.28481S2;
	Fri, 20 Oct 2023 12:07:35 +0800 (CST)
From: Zheng Wang <zyytlz.wz@163.com>
To: dmitry.osipenko@collabora.com
Cc: Kyrie.Wu@mediatek.com,
	bin.liu@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Irui.Wang@mediatek.com,
	security@kernel.org,
	hackerzheng666@gmail.com,
	1395428693sheep@gmail.com,
	alex000young@gmail.com,
	amergnat@baylibre.com,
	wenst@chromium.org,
	Zheng Wang <zyytlz.wz@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: mtk-jpeg: Fix use after free bug due to error path handling in mtk_jpeg_dec_device_run
Date: Fri, 20 Oct 2023 12:07:32 +0800
Message-Id: <20231020040732.2499269-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXfs0G_TFl9X8bBA--.28481S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw1xtFWktFy5Xr13Jw4fKrg_yoWrGw15pr
	Zagw4DCFWUJrZ0gr4UA3WUZFyrC3s8tr12qr4Sgws3Z343Xrs7tr10ya4xtFWIyFZrCFyr
	Zr48W34xJr4DZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR1rWrUUUUU=
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/xtbBdgcPU2DkpkVL4gAAsj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_210832_661776_0A2837CD 
X-CRM114-Status: GOOD (  12.28  )
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

In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
mtk_jpeg_job_timeout_work.

In mtk_jpeg_dec_device_run, if error happens in
mtk_jpeg_set_dec_dst, it will finally start the worker while
mark the job as finished by invoking v4l2_m2m_job_finish.

There are two methods to trigger the bug. If we remove the
module, it which will call mtk_jpeg_remove to make cleanup.
The possible sequence is as follows, which will cause a
use-after-free bug.

CPU0                  CPU1
mtk_jpeg_dec_...    |
  start worker	    |
                    |mtk_jpeg_job_timeout_work
mtk_jpeg_remove     |
  v4l2_m2m_release  |
    kfree(m2m_dev); |
                    |
                    | v4l2_m2m_get_curr_priv
                    |   m2m_dev->curr_ctx //use

If we close the file descriptor, which will call mtk_jpeg_release,
it will have a similar sequence.

Fix this bug by start timeout worker only if started jpegdec worker
successfully so the v4l2_m2m_job_finish will only be called on
either mtk_jpeg_job_timeout_work or mtk_jpeg_dec_device_run.

This patch also reverts commit c677d7ae8314 
("media: mtk-jpeg: Fix use after free bug due to uncanceled work")
for this patch also fixed the use-after-free bug mentioned before.
Before mtk_jpeg_remove is invoked, mtk_jpeg_release must be invoked
to close opened files. And it will call v4l2_m2m_cancel_job to wait
for the timeout worker finished so the canceling in mtk_jpeg_remove
is unnecessary.

Fixes: b2f0d2724ba4 ("[media] vcodec: mediatek: Add Mediatek JPEG Decoder Driver")
Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: stable@vger.kernel.org
---
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c    | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 7194f88edc0f..c3456c700c07 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1021,13 +1021,13 @@ static void mtk_jpeg_dec_device_run(void *priv)
 	if (ret < 0)
 		goto dec_end;
 
-	schedule_delayed_work(&jpeg->job_timeout_work,
-			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
-
 	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
 	if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param, &dst_buf->vb2_buf, &fb))
 		goto dec_end;
 
+	schedule_delayed_work(&jpeg->job_timeout_work,
+			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
+
 	spin_lock_irqsave(&jpeg->hw_lock, flags);
 	mtk_jpeg_dec_reset(jpeg->reg_base);
 	mtk_jpeg_dec_set_config(jpeg->reg_base,
@@ -1403,7 +1403,6 @@ static void mtk_jpeg_remove(struct platform_device *pdev)
 {
 	struct mtk_jpeg_dev *jpeg = platform_get_drvdata(pdev);
 
-	cancel_delayed_work_sync(&jpeg->job_timeout_work);
 	pm_runtime_disable(&pdev->dev);
 	video_unregister_device(jpeg->vdev);
 	v4l2_m2m_release(jpeg->m2m_dev);
@@ -1750,9 +1749,6 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
-	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
-			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
-
 	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
 	if (mtk_jpeg_set_dec_dst(ctx,
 				 &jpeg_src_buf->dec_param,
@@ -1762,6 +1758,9 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 		goto setdst_end;
 	}
 
+	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
+			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
+
 	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
 	ctx->total_frame_num++;
 	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
-- 
2.25.1


