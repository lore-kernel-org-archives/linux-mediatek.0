Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB583C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:38:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B71A261D03
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B71A261D03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Br6LNRdQ6frsv+mxrivzjzrhpaKAPn565iTnHNSEljQ=; b=pLkvjXveMN2Ybv
	zRDZzXi+XNJE5DDIbauBEUSZTO07Li3YFyZrBjXnKhbSUt/2r+WEKn9pp4/JdD25RuySgoXM6QMDb
	Vvm2gZYfvKlvswBkxWoWo+Mt+9iDhA2WNkPTDKeu3bVP+Dt1M/3NVkXDExOeX2xUdQWXsLJJhabNf
	/4u7B3Qa7kj6DtCTQzgnIQctj7x8pNOq2KbDIrdRtJizYa23aI1nzMxJIdEQMjONfQA6yU/R2Uh2K
	sqiTF9OFe0fQUGHpQUSgMj72+MrK3OjX3ytOTlR3/hVXaCfpGbfoEO9a5gYVh2pCzaItHM//T8BAN
	BJMP6Figgdrk6S189VGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyUnc-00D8Nb-1T; Wed, 30 Jun 2021 07:38:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyUnT-00D8HB-CY; Wed, 30 Jun 2021 07:38:12 +0000
X-UUID: b7321baee2644a53891c37e1c4811ab0-20210630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rKDl8LchLGMjH3pGPLk7iyqoKQhlWdGYD3FLNOg+JrE=; 
 b=FdjvecsxumPnSfMOmCaBeSwGCdir7LY4r5cima1ykZLttXejXfqdQdUTdFoiMgU8akvmfwPJe66nPWKfJE5fa+FQ5sf163brS7Mt/NLL6Yp0d8Z+X/rPDhrIs87A0bQbj4DIrmRtclJbBmHOsUwi8+YQAZMxNapKCHATZRNIY44=;
X-UUID: b7321baee2644a53891c37e1c4811ab0-20210630
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1358402234; Wed, 30 Jun 2021 00:38:08 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 00:28:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 15:28:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 15:28:09 +0800
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
Subject: [PATCH v2,3/9] media: mtk-jpegenc: remove redundant code of irq
Date: Wed, 30 Jun 2021 15:27:53 +0800
Message-ID: <1625038079-25815-4-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_003811_516244_DF39E7B8 
X-CRM114-Status: GOOD (  11.86  )
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

the func of jpgenc irq handler would not compatible, remove those
code.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 48 -------------------------
 1 file changed, 48 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 908aa1f..24edd87 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -1072,54 +1072,6 @@ static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
 	mtk_smi_larb_put(jpeg->larb);
 }
 
-static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
-{
-	struct mtk_jpeg_ctx *ctx;
-	struct vb2_v4l2_buffer *src_buf, *dst_buf;
-	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
-	u32 result_size;
-
-	ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
-	if (!ctx) {
-		v4l2_err(&jpeg->v4l2_dev, "Context is NULL\n");
-		return IRQ_HANDLED;
-	}
-
-	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
-	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
-
-	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base);
-	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
-
-	buf_state = VB2_BUF_STATE_DONE;
-
-	v4l2_m2m_buf_done(src_buf, buf_state);
-	v4l2_m2m_buf_done(dst_buf, buf_state);
-	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
-	pm_runtime_put(ctx->jpeg->dev);
-	return IRQ_HANDLED;
-}
-
-static irqreturn_t mtk_jpeg_enc_irq(int irq, void *priv)
-{
-	struct mtk_jpeg_dev *jpeg = priv;
-	u32 irq_status;
-	irqreturn_t ret = IRQ_NONE;
-
-	cancel_delayed_work(&jpeg->job_timeout_work);
-
-	irq_status = readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
-		     JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
-	if (irq_status)
-		writel(0, jpeg->reg_base + JPEG_ENC_INT_STS);
-
-	if (!(irq_status & JPEG_ENC_INT_STATUS_DONE))
-		return ret;
-
-	ret = mtk_jpeg_enc_done(jpeg);
-	return ret;
-}
-
 static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
 {
 	struct mtk_jpeg_dev *jpeg = priv;
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
