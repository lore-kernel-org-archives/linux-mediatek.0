Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CABEEAA45
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5I14gZ8ZV2beKG5h7D5LMBNMyFJY4vcK66dciAEppY=; b=TMwNekBtcoHby0pJNV57GaDNWM
	77X1c9RjS8NjAIR629RhkOe0GB0+kQKaVMu5tZm/12b4EzOfmOPR51Nna2YKVR10RHHbEUAXNvHSn
	1vW3a5UPDBLv1IVkxncXbjou2F2/IM0t0HvEk9otN6AuPaeqpgFJ7HL2RxLgqs0EmCpx4/zeNqQZc
	jTSO3jkJhxoj+gYbNBr3DcPeKPN1XF7UBYbcucXv6FeEnaMXndatiW/QVIR1MSYyFCaZkOrf7IF4l
	6FsU/gbkODLoXcdRhHjF6jnIsFwItiNk5EjjPZEHBdhaDPEULRtrOMqulGhgYXZTlSwD84Glt2iLP
	jayFB+kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmX2-008W2S-2I;
	Thu, 14 Sep 2023 13:37:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTm-008SZV-0x;
	Thu, 14 Sep 2023 13:33:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=R5I14gZ8ZV2beKG5h7D5LMBNMyFJY4vcK66dciAEppY=; b=kBJtlmmFXpddkwiQEBSh8eVuN5
	LVzurN49MgXyJ9W1HHFOj6n1Nh8Y0bJ9m2cjZ0Rz3rpr4h/F3LrLlyuZWn3g6lJMf2ErkLeGypYYR
	YGWWvBZfDXU+UfFKcGkhib+f0MzZhOW1auqieIPTbAAx0MU4yHxWFn9TqevNonB0MDLXgRZiHf2AX
	/B/lPDnangoGFrQNsIycv2RJwIWhlWQ3ozNwadwofgip0owRBJHg20BVi7rtvU6UZNnVoVlGUhfal
	r95ZH8dOFzYojX/aTd1zwx45IJJXkaBT/M9PRuX9coT3991EP8vt+K2gjIOtSKR6v7SdGUzxivegz
	1WJBH1iw==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTh-007ukL-1g;
	Thu, 14 Sep 2023 13:33:57 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1ACA66607393;
	Thu, 14 Sep 2023 14:33:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698433;
	bh=1yOSfZ9zOJdZRwLwPAMdW6zHS4PIxiSGQkrNrnzD9t8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eWvZTK2amSzpVpq8ZFpot/0uWStFAjTJ7f+V847lmGPS215Rf+yO9QYPKO9vKFQuc
	 S9ipLbYMNFYdeKqNpB2X4x2LrASQMR9lZW3n01IbkkOYQRxUYLhFX1gS/ReLT+tXMo
	 78lscaZDs1HkBh8wflnmMc0qEjDWP730gmvCiBed16h1PHb6qgdeAXT5I86QF58V0U
	 Xg+VOaPOnHZ98itUCPGQtBw7qTYvrOXLwezu37SdqEP6F6nlCr8XZEO8af50mE19Nx
	 S3haDqIwuCyxT5B7LRJR7Ln3iYHhhxWAsg3C7hiOTT6nRGfvkDjJ6jKjanbg5FByUn
	 AHraGykhh/h6Q==
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
Subject: [PATCH v7 42/49] media: imx: Stop direct calls to queue num_buffers field
Date: Thu, 14 Sep 2023 15:33:16 +0200
Message-Id: <20230914133323.198857-43-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_143355_500927_2C132DBC 
X-CRM114-Status: UNSURE (   9.49  )
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

Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/staging/media/imx/imx-media-capture.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 4846078315ff..ce02199e7b1b 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -605,6 +605,7 @@ static int capture_queue_setup(struct vb2_queue *vq,
 {
 	struct capture_priv *priv = vb2_get_drv_priv(vq);
 	struct v4l2_pix_format *pix = &priv->vdev.fmt;
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	unsigned int count = *nbuffers;
 
 	if (vq->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
@@ -613,14 +614,14 @@ static int capture_queue_setup(struct vb2_queue *vq,
 	if (*nplanes) {
 		if (*nplanes != 1 || sizes[0] < pix->sizeimage)
 			return -EINVAL;
-		count += vq->num_buffers;
+		count += q_num_bufs;
 	}
 
 	count = min_t(__u32, VID_MEM_LIMIT / pix->sizeimage, count);
 
 	if (*nplanes)
-		*nbuffers = (count < vq->num_buffers) ? 0 :
-			count - vq->num_buffers;
+		*nbuffers = (count < q_num_bufs) ? 0 :
+			count - q_num_bufs;
 	else
 		*nbuffers = count;
 
-- 
2.39.2


