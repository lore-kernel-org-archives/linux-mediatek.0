Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162F3E784B8
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 12:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dC8OaY6xODCk38a88Le7PVTQFT81I0fqZhXdsk7EzY=; b=ZakcBj5LTS73VvKCMB5jPyX+5v
	XAn0Q/MsRrxH9KAatUsjc6M+KFR2663xBBMC0Pwl/ilwid8G6G7EYMznB8DEYcsCiDLdEx4GgnKnM
	e3MHZKqOMQOo0dXRF6rwdrpH6TOz4Bq24czJ8NS+NH/RIsnIqtYlJWeeL2ttZBjZKB9yE7XJs8OcL
	ziC8sEEGYJs7YVZcFjslKn2FWNDDykiutr0FAW+yfOTu/l4cQLqYZsmcByTPJoWxZaYqA/CLC56px
	D+K0iJ0G4lNYqI0dIYxZSiB5bT+UKW4kuKxt7OgATan+S9m6R07AXYM+Cqf6fwneqZtI9GBpVEH3A
	ziuTSbkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHjK-00CdtO-2w;
	Mon, 02 Oct 2023 12:08:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhG-00CbJN-1l;
	Mon, 02 Oct 2023 12:06:53 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9537:67ca:c85e:d0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B35156607374;
	Mon,  2 Oct 2023 13:06:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696248404;
	bh=hAbr7z4revo9i94sQ1qcafGVppd4XuiTYcxBFLeASkQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cq5re4bqZqtCtZuhkmY933bx+yZBcmuhG96AbTv11ItDXbF89IsQ7+4u1AKuwyAqL
	 NMK88hPP2t/+HV33oNcIOOLwuZmpZnWuZtR9EQ35ZhaCT0TPnSatJQ5QP7YYlxPxrw
	 hTeWavoQTP8ta9t4BbAKuwtgOO7k/XIFUwUv15nN0q9a2sH4beUm9A302kjnDMKTR0
	 Ij3SyL/e4UneZWxOhLfxCtXmyRwKia2mrAiGUov2XnZzNrBq08oHBmWv5FXX/esszs
	 KPCV6ZCwOA3Us1Mr7p8crSpDbpGFpaOLLQXkQFX59OvSQJRENafZEIlnMiU5Arq/OY
	 Z7STSzvrnZsbA==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v9 36/53] media: verisilicon: Stop direct calls to queue num_buffers field
Date: Mon,  2 Oct 2023 14:06:00 +0200
Message-Id: <20231002120617.119602-37-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
References: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_050646_755252_2FE2EF27 
X-CRM114-Status: GOOD (  10.36  )
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

Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_postproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index 20e8f04a3bef..1f5f1aabf406 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -250,7 +250,7 @@ int hantro_postproc_init(struct hantro_ctx *ctx)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
 	struct vb2_queue *cap_queue = &m2m_ctx->cap_q_ctx.q;
-	unsigned int num_buffers = cap_queue->num_buffers;
+	unsigned int num_buffers = vb2_get_num_buffers(cap_queue);
 	unsigned int i;
 	int ret;
 
-- 
2.39.2


