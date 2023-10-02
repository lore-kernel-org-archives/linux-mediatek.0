Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41466E784AD
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 12:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AswV3wv9j4+AV5DLFt6qUTx/hmlnxbIGATF/n2ZTmQM=; b=P0sBgAJYyxNnQ5OoJjRky/dRDu
	RVyqnZ6LWam+0pNiqaBhrk7R9GwsBUKgHA+z1+gt6hSFme739+2VxWO2G8Zzg5SnE3vwSRvbscmZz
	S2HatjLkzSKCTTzCTewl1BYeYbKgEfJmjyyEBJL9EzeKnZgOHFuQemwsf6hTH82JzWhdbdYjTFUF0
	/aosRytzEpsi4+Xm6QRWsBwwp3W65qYubDdocOLP0uh08g/9tMqSGFYuoREuvyjk/4QFwUNaXmlNL
	uj5AUB/A0ba5dP/iLQ98AWZbIH/n01r9ipm3w3fAHXjXjfL269Z+PCYeT2OIxDTzKsMczPpM7LdlX
	6YTUAbQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHj2-00CdVt-05;
	Mon, 02 Oct 2023 12:08:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhD-00CbFZ-1M;
	Mon, 02 Oct 2023 12:06:49 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9537:67ca:c85e:d0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 920F06607368;
	Mon,  2 Oct 2023 13:06:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696248402;
	bh=GZZRScc0G+g9MpmVo+b1q2mYVPFLCSqMx1Hk2ETt1Vc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CnzI5EmZWPH0C/k47H1uHc3OmkZL34PD3BEWk2+K+WQA6OEXZQZrRSwxALkZEc+Ww
	 Tw/bgpb0vH0rNmH/KT7l5JnhXzYgemFib3g6q5Z6JzDHULIEbe9CrfZfw42pnULANJ
	 WgqjVNTAm/3+2DqfQEOwExXb9pIwsPc+aqq1fh7NxMA1mMsYwxEuFnVegIlVrQRL/S
	 aA7p/EgmLcSe3nEu8r16DNZSqtmjRwS/3AeYmjV6BBv/W6GCXDK030pXc9Uz94stbK
	 QGNlAU+2KSBllTAcXhyRRHlFbahrLdiNjVnVvU6Nbx0jGxIDPVfgiIh/rIULGZFDGc
	 Eq+WOq0N173ZA==
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
Subject: [PATCH v9 32/53] media: mediatek: vcodec: Stop direct calls to queue num_buffers field
Date: Mon,  2 Oct 2023 14:05:56 +0200
Message-Id: <20231002120617.119602-33-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
References: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_050643_624697_445A7E12 
X-CRM114-Status: GOOD (  11.21  )
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
 drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index 04948d3eb011..8c580956b905 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -923,7 +923,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 		mtk_v4l2_venc_err(ctx, "pm_runtime_put fail %d", pm_ret);
 
 err_start_stream:
-	for (i = 0; i < q->num_buffers; ++i) {
+	for (i = 0; i < q->max_num_buffers; ++i) {
 		struct vb2_buffer *buf = vb2_get_buffer(q, i);
 
 		/*
-- 
2.39.2


