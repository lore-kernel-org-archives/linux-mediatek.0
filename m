Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D6BCA0FF0
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Sep 2023 12:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytBmMC06ltkJ2DSb9p42DekomGitnj+m63JkvHUvQmY=; b=yY3Au2JNCHuGpW3Ao7689Bce07
	O1o6drPbYJniIgNgcrOBYpDgclpGEGI6Y6W+Xp6lcMERXmUHAdB9lwv5buk1mBZSu10lddCRMNDLM
	e4rhbPUVS5aQ2RFVb29lQcR5xuj863ekKygnPyz1ZbeqTccEm4x35U+SM4wwubZ2yIxxTdw8KRGJW
	sipjNebSB8RMdzrJ2tkiMjPjyEpRHc5l3rq1R8LAtKCJwahEAsTpGGmq20/8B+EzKXoeR+XcdJQm0
	SpDmJSzEi/TGZKe+gRxbQA2jc94vticIHnoqslD0cEtcXtvBD6NinHHstzjha2p1IBGzTfCXhvg9v
	M4CsacYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3W7-00HUh2-0u;
	Fri, 01 Sep 2023 12:44:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3Vl-00HUGq-2R;
	Fri, 01 Sep 2023 12:44:31 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4d01:31d2:de6b:d217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9F2DE66072B9;
	Fri,  1 Sep 2023 13:44:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693572268;
	bh=gaDM0Ytn9pQussDWC2PqEbL+YnC+DHLH9QSJ8VT8PzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GlUwywWSAS+2i0Z3R8RUcFhxKolUiSEeWAzI6a3MGa73yZQKW665OxnMyoyeNbocp
	 LTDuuV/Hs6Az/0d3b5EnjVfx41aggoDQiQPLGAA8LOaLX+dWWiyBGT0FMZkp+91wWr
	 saAGmOGDIDveQEEURqVEdq3Eb1V0b1v2VB6axBlFy1OAkTeYZyLpSlDdKg6ogHi2YO
	 nsiDIJmv36vII8JOeZteEGEwMr8RZvGMm2T8L1ETyhy9zT/bGjULn1Scl6pgagkRHc
	 Fc9iTpIUS8RwCPam4VjtWnNdZd/8v+CmD6xTjMyl+BdJEt5i9EPUB5F1bVTp/hYzaN
	 VV9ZS5KjpM9hA==
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
Subject: [PATCH v6 05/18] media: mediatek: jpeg: Use vb2_get_buffer() instead of directly access to buffers array
Date: Fri,  1 Sep 2023 14:44:01 +0200
Message-Id: <20230901124414.48497-6-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
References: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_054429_928174_807A188E 
X-CRM114-Status: GOOD (  11.77  )
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

Use vb2_get_buffer() instead of directly access to vb2_buffer buffer array.
This could allow to change the type bufs[] field of vb2_buffer structure if
needed.
After each call to vb2_get_buffer() we need to be sure that we get
a valid pointer so check the return value of all of them.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 621038aab116..62910a1b8a98 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -603,7 +603,11 @@ static int mtk_jpeg_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 		return -EINVAL;
 	}
 
-	vb = vq->bufs[buf->index];
+	vb = vb2_get_buffer(vq, buf->index);
+	if (!vb) {
+		dev_err(ctx->jpeg->dev, "buffer not found\n");
+		return -EINVAL;
+	}
 	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(vb);
 	jpeg_src_buf->bs_size = buf->m.planes[0].bytesused;
 
-- 
2.39.2


