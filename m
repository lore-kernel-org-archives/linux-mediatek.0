Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091B0C25B67
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Oct 2023 09:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x7fivBQJq72nSMKux0IKJcpLOEh/ZK4DVTpIIvCRjkA=; b=0bBLiJs0TXCsNNssPYyJ+s/h4P
	TzhRuP3RI6x9sOgcydBTxaVBFuchPTZTwupSdrNxvajV54I7ybpLDu2LndIAZCArPvaOIlO4qbvvR
	xyppTmZwariKzSseDN7actzhwzZyexz1WTIzwo5D+wEnMzkZSvfJj3T9RKiZUkecV2A0R4fnt98es
	WJYl6aFFgJVoJxoL7cTe8SKK5ZuRqMuez32EaVqWyAC+PKHcTSG1V4UJXyPUpfETCJvPZMXZGhBSJ
	pl/g9gZt8isazW2JxzLkvzWFCAUm95/WZ8KwDfCgeAD3eXiK8sdFBXv4ehO+kmZnrmRudAF15A8hY
	5tCjOPmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJ0W-00G0ub-0O;
	Fri, 27 Oct 2023 09:19:56 +0000
Received: from m15.mail.163.com ([45.254.50.219])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJ0P-00G0sN-2z;
	Fri, 27 Oct 2023 09:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=x7fiv
	BQJq72nSMKux0IKJcpLOEh/ZK4DVTpIIvCRjkA=; b=OWIxMHlnmEetMmBrF5wNU
	iet7mM3/6axuVHUu3jZFNsHOXrsp3S/VMOPP91EA/7OGOW1vfuOg4lGzPHZ8O033
	/rHAIxiNMDBr4lwpT8LaVY3j2FeWV8laEfkO7c4V97x9T1h0WgNl0B3v2P0kty8b
	vk6rDiF5DKyGBqGlQOlDYI=
Received: from leanderwang-LC4.localdomain (unknown [111.206.145.21])
	by zwqz-smtp-mta-g0-0 (Coremail) with SMTP id _____wBnD_ZrgDtlHuRqBg--.47942S2;
	Fri, 27 Oct 2023 17:18:35 +0800 (CST)
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
Subject: [PATCH 2/2] media: mtk-jpeg: Fix timeout schedule error in mtk_jpegdec_worker.
Date: Fri, 27 Oct 2023 17:18:32 +0800
Message-Id: <20231027091832.39082-1-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnD_ZrgDtlHuRqBg--.47942S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar15uF1rKrW5Gr4xtw4Dtwb_yoW8Cw1kpF
	Z3K3yqkrW5Wrs8tF4UA3W7ZFy5G3s0gr47WF43Wws3J343XF47tryjya4xtFWIyFy2ka4F
	vF4vg34xJFsFyFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziiIDxUUUUU=
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/1tbiXA4WU1Xl75dK2QAAsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_021950_536456_886621DC 
X-CRM114-Status: UNSURE (   8.92  )
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
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 7194f88edc0f..d099a9b67930 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1750,9 +1750,6 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
-	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
-			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
-
 	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
 	if (mtk_jpeg_set_dec_dst(ctx,
 				 &jpeg_src_buf->dec_param,
@@ -1762,6 +1759,9 @@ static void mtk_jpegdec_worker(struct work_struct *work)
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


