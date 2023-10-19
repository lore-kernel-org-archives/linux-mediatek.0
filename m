Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E1ECDB484
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 12:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Puy0NuCUoizD9tUXGoeztaPEYZUcHsDAGMF7ZhtLfh4=; b=sslQ2F5J1REHlAK6ejOf+s4VUq
	xStew2LZY4vlq9VpP3L4x/ek6REelFp/mlgjLRKPxLRRsKlyzLRnRrve1zyGqMiqHf9j3c38Wp/PE
	X/BBjidt8RBAhACqZ249SyyZ0uMoV2u4WIGPm2lTjF/c9UbzWTS6/owYqiZCk79CGQx6gKIFLigVS
	WhtBqYn/K7f1Ycd6QVEGJuabun5prCFljNwfniK+6hvIlRNE/qMvzs7V0oBdnH7jRm7v7boEf3XCB
	kOsPV7fkIMbRnCVy+NXkj/LQCcFpeHGJUaCsua2bmXMUE3ynny8GmNBTQj6iOtGlOhx0WzqG/U/nV
	84U/b18A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSYF-00HPog-1g;
	Thu, 19 Oct 2023 12:54:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWD-00HNZB-0T;
	Thu, 19 Oct 2023 12:52:58 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C69DD6607371;
	Thu, 19 Oct 2023 13:52:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697719967;
	bh=5BKm2pXhsA2CwROeeB4gGq1coubFRjY0WIZn0P61OpQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NPOhtWUo5OmgNJnQwpf3bAqRLTR7IuEHGa5ERSSJ6I53sOe+9Audkd0UcbpPcva2H
	 ypdN7CzbBA1ZZVB4ZSoUsv9CECXeTUtc7DBBMRctM6NOImiFn9y3W4Ur4xwPQFGBRR
	 G0KgHI78j2ZsLnKTKlzt9dxDqeBL2G997/7DeD9YW+eZS5cjWjdo4vL0FLUDOhvjQN
	 e7gFB3KjHopMIc8aoDaP1vnQ3KGgrDPGLhAbbvTAhGXQjBNpcRaxZ2N5AFuIPJTPK+
	 o/Y8indILMxG7mWNqns38Z6252TSUPUzcThJFvXDmNK0aRcD/9Y1wuGYpCirAuP6zc
	 qUv+TbgZQH8Sg==
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
	Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v13 31/56] media: imx: Stop direct calls to queue num_buffers field
Date: Thu, 19 Oct 2023 14:51:57 +0200
Message-Id: <20231019125222.21370-32-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_055253_368805_860664B2 
X-CRM114-Status: GOOD (  10.82  )
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

Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
This allows us to change how the number of buffers is computed in the
future.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Steve Longerbeam <slongerbeam@gmail.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>
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


