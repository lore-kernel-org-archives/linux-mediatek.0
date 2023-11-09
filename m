Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3484C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 16:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNW9skNjCNtNzBZC/0iZxAlLkA8q0EBUuoHGFFmZHiU=; b=LjzGfE4EjsHljDovA3PGWNiTOU
	+AKMHcpIjoMia21F8LOwDz5W2x8t+R/WvVfv4TgcNUR6shM9Z2QnPeeLih1TpH9MAomVve1ixS3V7
	B8fZG54GBWwfkmwOQdFxogC2hzlRKQQXZbwE7bQjjiWXmMgJD7YwYFmvwixGm++W3oDO4NHeuyod3
	lYXzfzs61irlHVfMqMzyh5Ye0wR9IpnvK/YS6cHml90bevPwIKbyVEwnG4E1lmV7o67gKyp5q0ZWT
	5ljc7kKJVTzmx08qt+lbbmWMblzk3Kf8i8PggJ4uCcQB5hmaGXkcsDRXCJ/NAmk8RTLx5PZbmbe6P
	L1vpzAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r17y3-006k4u-26;
	Thu, 09 Nov 2023 16:33:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r17xa-006ja6-0q;
	Thu, 09 Nov 2023 16:32:54 +0000
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B95D6660741B;
	Thu,  9 Nov 2023 16:32:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699547568;
	bh=Rc139ZSiENtAf3eeg15Uf2jQ+z0mqRTeA477enaPk00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YRTFfYthaY4HhtKOvytssmx3dCb/i9cbFo7DgAW/9XPZmRt3PeKIrN9P6bOPqbeqX
	 DVMYNjwBRSM9xQu69BWhZE1EytExoFmmIxwHameLFEvNmp2qTFGv4cojaVdQqPOwWx
	 AF+QMDV9Xg9OpzhvPNf/Pi0bXRwbzFTPWuWfu+qgLh/gnHs1GOBBIs2pxOZOK+3tE7
	 PnpbsTglsglAngmm40my1cIG7x3lp4xZzbv/DQYCoz9Hji6uXKTICtFAv2T8tgO/IH
	 YBrIF0tAlqtOgXhIvQ1og5/iJ1I5sHx/qUX6UoqpJtG02GWNamvjylntwzWgmGieEJ
	 1FICylyP/3M3w==
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
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v15 11/56] media: mediatek: jpeg: Use vb2_get_buffer() instead of directly access to buffers array
Date: Thu,  9 Nov 2023 17:29:23 +0100
Message-Id: <20231109163008.179152-12-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109163008.179152-1-benjamin.gaignard@collabora.com>
References: <20231109163008.179152-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_083250_519318_4A76B7B8 
X-CRM114-Status: GOOD (  11.36  )
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

Use vb2_get_buffer() instead of direct access to the vb2_queue bufs array.
This allows us to change the type of the bufs in the future.
After each call to vb2_get_buffer() we need to be sure that we get
a valid pointer so check the return value of all of them.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
CC: Bin Liu <bin.liu@mediatek.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 7194f88edc0f..73a063b1569b 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -598,12 +598,11 @@ static int mtk_jpeg_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 		goto end;
 
 	vq = v4l2_m2m_get_vq(fh->m2m_ctx, buf->type);
-	if (buf->index >= vq->num_buffers) {
-		dev_err(ctx->jpeg->dev, "buffer index out of range\n");
+	vb = vb2_get_buffer(vq, buf->index);
+	if (!vb) {
+		dev_err(ctx->jpeg->dev, "buffer not found\n");
 		return -EINVAL;
 	}
-
-	vb = vq->bufs[buf->index];
 	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(vb);
 	jpeg_src_buf->bs_size = buf->m.planes[0].bytesused;
 
-- 
2.39.2


