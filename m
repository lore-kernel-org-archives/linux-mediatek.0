Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210C6CD5BD1
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2026 07:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ToeoviAujNvWRk4JjaFh1ReN2qGZK+KfApQYajaIr1s=; b=bmS6p6zFdQDOmx2aRpcjQ9yrux
	vcCfkA9WToJT6Q0VQ1fwcPVBbmiZMMDPwDMgaTtOH+nMPtDiBM+Xc3HMKSKd4y0ZbJvn27PfOoQjF
	QjAjP9L6j6aUbw0xY9xbfBCpRCqoPyLnO0WmqTq/BYTFE3LNg0jqVjkO9obiR8Mo/radTfofRhQsA
	pC5eeZm6V8E6g/ho+WVjZywGyqOanKGk32/u+dJN1PBppmxYEbPtjnEGip49VsW9wpQ8zuKQo7N5o
	kg5dIzPQSbfJ8FTjugZnipGo4lZF63AexEjRVEY5DkwaelHhjkRhoghCn6C+e2S2s7Ajo9zX1TUnA
	Yb+B733w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTx8W-0000000AIq3-37aQ;
	Mon, 01 Jun 2026 07:32:36 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTx8S-0000000AIpR-1OI3;
	Mon, 01 Jun 2026 07:32:35 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.239])
	by APP-01 (Coremail) with SMTP id qwCowABX+tKGNR1qGk9UAA--.1841S2;
	Mon, 01 Jun 2026 15:32:24 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	irui wang <irui.wang@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] media: mtk-jpeg: only init/cancel work for multi-core variants
Date: Mon,  1 Jun 2026 15:32:18 +0800
Message-ID: <20260601073218.1281840-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABX+tKGNR1qGk9UAA--.1841S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF4DZF4UCrWkKryrXF1rCrg_yoW8Aw4rpF
	WSq3yUCFW5Gr4qqFyDAa1UAFy5Kw1S9F47Wr1xuw1xZ343XFnrG34UC3W0qFWIyrn2kasI
	qr48t343CFWUZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [112.94.101.239]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_003232_762560_51EE64AE 
X-CRM114-Status: GOOD (  10.23  )
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

Single-core variants of this hardware do not use the work at all, and
the worker function is set to NULL, which leads to warnings when
cancelling the work in release callback.

Skip the work init/cancel code when the JPEG hardware isn't multi-core.

Cc: stable@vger.kernel.org
Fixes: 34c519feef3e ("media: mtk-jpeg: fix use-after-free in release path due to uncancelled work")
Fixes: d40e95274925 ("media: mtk-jpeg: reconstructs the initialization mode of worker")
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 8c684756d5fc2..83e54a7ef49c0 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1160,7 +1160,8 @@ static int mtk_jpeg_open(struct file *file)
 		goto free;
 	}
 
-	INIT_WORK(&ctx->jpeg_work, jpeg->variant->jpeg_worker);
+	if (jpeg->variant->multi_core)
+		INIT_WORK(&ctx->jpeg_work, jpeg->variant->jpeg_worker);
 	INIT_LIST_HEAD(&ctx->dst_done_queue);
 	spin_lock_init(&ctx->done_queue_lock);
 	v4l2_fh_init(&ctx->fh, vfd);
@@ -1202,7 +1203,8 @@ static int mtk_jpeg_release(struct file *file)
 	struct mtk_jpeg_dev *jpeg = video_drvdata(file);
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 
-	cancel_work_sync(&ctx->jpeg_work);
+	if (jpeg->variant->multi_core)
+		cancel_work_sync(&ctx->jpeg_work);
 	mutex_lock(&jpeg->lock);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
-- 
2.52.0


