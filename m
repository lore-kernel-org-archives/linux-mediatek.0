Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C22FC47087
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 08:37:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D41B61184
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 08:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D41B61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OdZ5PQ+s/9/beS/VHxUVhJtycG9kJs3MCfZK25g2egk=; b=jrxFDjhDiUYOCT
	heO/8cmRbMGTf/NTwNdycnWQp/9VX/wAq1pSMBeQPQzePcoos1YBMfjlyARywSv2+Z9xfRgLu2JrT
	pqYvJegSVePFTQxHP1GZQWLSOIojxOH1NymJcki3YzXSabC1K7/4QbYZh8BwC/cradkI0uDadpQbZ
	O9q7BypjTDQzZsmsdAJQw0d2U8lFM5WOc4H8o1InvDFiGOHpFRpvamUMQzr9IhUomAMRDYVp7b79P
	AiMk+X1yfTip+E9nWCWWLPubWf+J1QtmZe23IdqtAsRO3ZorHPvBfUj5AVBRnUae8rsAK4s7rW/Na
	T8p4O0DG8j7SHrkVrw7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmXzF-00DVi3-MZ; Fri, 28 May 2021 08:36:57 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmXzA-00DVdr-T5
 for linux-mediatek@lists.infradead.org; Fri, 28 May 2021 08:36:54 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a00:a040:193:3500:ed56:60fb:a74f:177d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AFD2F1F43DB8;
 Fri, 28 May 2021 09:36:49 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
 dafna3@gmail.com, mchehab@kernel.org, tfiga@chromium.org,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 matthias.bgg@gmail.com, hsinyi@chromium.org, maoguang.meng@mediatek.com,
 irui.wang@mediatek.com
Subject: [PATCH] media: mtk-vcodec: venc: fix return value when
 start_streaming fails
Date: Fri, 28 May 2021 11:36:41 +0300
Message-Id: <20210528083641.5227-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_013653_111826_201028A9 
X-CRM114-Status: GOOD (  11.94  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In case vb2ops_venc_start_streaming fails, the error value
is overwritten by the ret value of pm_runtime_put which might
be 0. Fix it.

Fixes: 985c73693fe5a (" media: mtk-vcodec: Separating mtk encoder driver")
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 4831052f475d..5e0c53112c15 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -780,7 +780,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(q);
 	struct venc_enc_param param;
-	int ret;
+	int ret, pm_ret;
 	int i;
 
 	/* Once state turn into MTK_STATE_ABORT, we need stop_streaming
@@ -832,9 +832,9 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	return 0;
 
 err_set_param:
-	ret = pm_runtime_put(&ctx->dev->plat_dev->dev);
-	if (ret < 0)
-		mtk_v4l2_err("pm_runtime_put fail %d", ret);
+	pm_ret = pm_runtime_put(&ctx->dev->plat_dev->dev);
+	if (pm_ret < 0)
+		mtk_v4l2_err("pm_runtime_put fail %d", pm_ret);
 
 err_start_stream:
 	for (i = 0; i < q->num_buffers; ++i) {
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
