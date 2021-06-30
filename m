Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A80C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:33:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E82061D01
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E82061D01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jL1Gzjl6eaKwvpAv3U7kpRhGAZC5T6nQTditOFjbpPk=; b=tzwz0/NuYVsjZj
	KK3vQBgC60Yd2xDnngcyaSy4YWCBs8d19Of3PINrxd0I9AvCHNqKb2gZ4CZq3kn7ZtM3f55Y1hjNd
	MXK8s5uBHs5qpQbsMzjWqPOqXrDxECc2M4oeiXgQyq9oIroU//Eu98GUOQH9optyeeBFxJXjHvEYW
	p1ztS5N+xwF1okvzQ+/mA9PLVkpM695iZwYlsiQCKXvmFBDkKvvV15l1d9iHsSSq+KVNWONYvRN35
	/iMGdt4JNWa24tgLpxTAv9gN9syYg379eEA83ZHd75t1VOlhm8ObJwumyZisT64QFRJCiKFGMp+tK
	fGCBtVppHO/KIzm3qCCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyUj5-00D5bq-Pj; Wed, 30 Jun 2021 07:33:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyUhr-00D4xP-Ko; Wed, 30 Jun 2021 07:32:25 +0000
X-UUID: ec75c038d99d41bda33b370a7a398162-20210630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=+dopp3qfa/4Lmdd8bk37wcsxvXpNAAl9wXxDwD1SsG4=; 
 b=Uful+diX6Jo+GGZZ1P3FplTReXrFt56/FpndzypLWz/97JtzQOHKBn3dKgSL496HKdoJVIgF6VoXHvyMncoYxgoONJkqB76fe0Xg9dzrqfNkem5ctHD208hgSyExXeZNhjX7Wo/5IbD6tR7lFOZLys73L82i8JZF/YiwbRpfg9Y=;
X-UUID: ec75c038d99d41bda33b370a7a398162-20210630
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1153101145; Wed, 30 Jun 2021 00:32:21 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 00:28:18 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 15:28:16 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 15:28:15 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Bin Liu
 <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
 <srv_heupstream@mediatek.com>, kyrie.wu <kyrie.wu@mediatek.com>
Subject: [PATCH v2,
 6/9] media: mtk-jpegenc: Generalize jpegenc HW timeout interfaces
Date: Wed, 30 Jun 2021 15:27:56 +0800
Message-ID: <1625038079-25815-7-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_003223_809070_DB8BEB2E 
X-CRM114-Status: GOOD (  11.03  )
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

Generalizes jpegenc HW timeout interfaces to handle HW timeout.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 37 +++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 062feab..39101d1 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -1285,6 +1285,43 @@ irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
+void mtk_jpegenc_timeout_work(struct work_struct *work)
+{
+	struct mtk_jpeg_dev *jpeg = container_of(work, struct mtk_jpeg_dev,
+		job_timeout_work.work);
+	struct mtk_jpeg_ctx *ctx;
+	struct mtk_jpeg_dev *master_jpeg;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct mtk_jpeg_src_buf *jpeg_src_buf, *jpeg_dst_buf;
+	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
+
+	src_buf = jpeg->hw_param.src_buffer;
+	dst_buf = jpeg->hw_param.dst_buffer;
+	ctx = jpeg->hw_param.curr_ctx;
+	if (!ctx) {
+		v4l2_err(&jpeg->v4l2_dev, "Context is NULL\n");
+		return;
+	}
+
+	master_jpeg = ctx->jpeg;
+	if (!master_jpeg) {
+		v4l2_err(&jpeg->v4l2_dev, "master_jpeg is NULL\n");
+		return;
+	}
+
+	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
+	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
+
+	mtk_jpeg_enc_reset(jpeg->reg_base[MTK_JPEGENC_HW0]);
+	pm_runtime_put(jpeg->pm.dev);
+	clk_disable_unprepare(jpeg->pm.venc_clk.clk_info->jpegenc_clk);
+	jpeg->hw_state = MTK_JPEG_HW_IDLE;
+	atomic_inc(&jpeg->hw_rdy);
+	wake_up(&master_jpeg->hw_wq);
+	v4l2_m2m_buf_done(src_buf, buf_state);
+	mtk_jpeg_put_buf(jpeg);
+}
+
 static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
 {
 	struct mtk_jpeg_q_data *q = &ctx->out_q;
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
