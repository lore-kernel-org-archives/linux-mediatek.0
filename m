Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817BDC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 07:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omdBIC+e1jVadRkJ0QsCI7L9wKGBA2OoP3PF04hqiWI=; b=C+nGHJD7JBQPhPg+BD948ueu64
	+75qeYb9wXE6S/fw4ZQwHR23Otv7fMMddlpa2x5J0RNAF7Z6u0kgSiodR0GXd8RGXlz6xA+axCJxU
	bhVdUicFQz2lX21M62219zuhw0tDTh5a1CR2JjPSi7ksIL/Bh+SOEE5wnXtCXjjFQ2oQOEuUc+pH4
	burTS0ulXO9jw3OYQ1DPAUCMLRii5Xw6eQTnbIeEzgH6RL/svnMX5+TPvpZECPnETtt3O0jykRxei
	iaxUQ3b+T0P4RXDsSLvRxdE1vsFG9Ba7awzuDSQIPVpOK6ZtUGTtwesn78vuai8XX9LGazKPytnWn
	e7urlgSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxj7Q-004gYQ-2B;
	Tue, 31 Oct 2023 07:24:56 +0000
Received: from m12.mail.163.com ([220.181.12.199])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxj7M-004gX6-0D;
	Tue, 31 Oct 2023 07:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=omdBI
	C+e1jVadRkJ0QsCI7L9wKGBA2OoP3PF04hqiWI=; b=QJgdMKf9G1x2TXO+YyjER
	0BC0mNKytgpKXaoFv61Lmze4alS6yIqqE4JNXxOTLjZ/4Gz05O30pmACgzNaq5OK
	jvffLR7nvvrPzD1VagDHsq6JH1RG9OW+RuVF81MrnIGVoqUwpHBleNLKzv0lymzX
	38G8TBbSLYYqiBX2LOssg0=
Received: from leanderwang-LC4.localdomain (unknown [111.206.145.21])
	by zwqz-smtp-mta-g5-0 (Coremail) with SMTP id _____wDXP+6wq0Blv5KVAQ--.8863S5;
	Tue, 31 Oct 2023 15:24:32 +0800 (CST)
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
Subject: [PATCH v2 3/3] media: mtk-jpeg: Fix timeout schedule error in mtk_jpegdec_worker.
Date: Tue, 31 Oct 2023 15:24:29 +0800
Message-Id: <20231031072429.21448-4-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231031072429.21448-1-zyytlz.wz@163.com>
References: <20231031072429.21448-1-zyytlz.wz@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXP+6wq0Blv5KVAQ--.8863S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar15uF1rKrW5Gr4xtw4Dtwb_yoW8ZF1rpF
	WfK3yqkrWUWrZ8tF4UA3W7ZFy5G34Fgr47Ww43Xwn5A343XF47tryjya4xtFWIyFy2ka4F
	yF4vg34xJFsFyFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UJHUgUUUUU=
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/xtbBdhMaU2DkptgIowAAs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_002452_495575_9A7FF411 
X-CRM114-Status: GOOD (  10.64  )
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

In mtk_jpegdec_worker, if error occurs in mtk_jpeg_set_dec_dst, it
will start the timeout worker and invoke v4l2_m2m_job_finish at
the same time. This will break the logic of design for there should
be only one function to call v4l2_m2m_job_finish. But now the timeout
handler and mtk_jpegdec_worker will both invoke it.

Fix it by start the worker only if mtk_jpeg_set_dec_dst successfully
finished.

Fixes: da4ede4b7fd6 ("media: mtk-jpeg: move data/code inside CONFIG_OF blocks")
Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: stable@vger.kernel.org
---
v2:
- put the patches into a single series suggested by Dmitry
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index a39acde2724a..c3456c700c07 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1749,9 +1749,6 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
-	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
-			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
-
 	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
 	if (mtk_jpeg_set_dec_dst(ctx,
 				 &jpeg_src_buf->dec_param,
@@ -1761,6 +1758,9 @@ static void mtk_jpegdec_worker(struct work_struct *work)
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


