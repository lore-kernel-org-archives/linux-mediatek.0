Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE950C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 16:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtwFMtFsAJkcWS//8NxueCc5P90IFZi9cvXzmg1aF+E=; b=MLoV2cw8nt+fUy7VCZDa9FaP+h
	RXvITZ8P1SRPvQ/NdN3Sfm22XOhQT9ChTm8PYOEddKQf+xOrQM+4eOL9TVH9g+tC7cZsOfmhPA0YH
	92gpY2A/r5UQE9vRhSaCXrXtc+d4deP1V4hQjvmvII54Ptq1uZmf+spbxbSidl9seiRb59xf4/9yQ
	8gRozJ/d8bsRsb2zvOS4s2v/3RRsrHL2DfDvdTtpbqf/Cphhq0oZT0ASjfUFBf4EZyK37Vi04FbfU
	boXkPY9+rm1EjWpeVtibA2BHoUTFmXEmmC/SMwR7D0S9ndyztx915KScPr6Q6KUe/lxeEDe3rYu12
	Xzy26jlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r183Z-006mP1-2b;
	Thu, 09 Nov 2023 16:39:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r182d-006lLm-2c;
	Thu, 09 Nov 2023 16:38:05 +0000
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6464F66076A9;
	Thu,  9 Nov 2023 16:38:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699547882;
	bh=PqahRgMbKZ6nKhhhFOL42EbYbzODXom24RYDHww9X2Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YSvyJrJBvpacWgTAfqjHItn58l+/ToKTC+WxAq3tUbxdxiiRlSgH2QGm2POvbNWmy
	 9r56IyfTZD17giY+3NUnS37RF4JMF4lNxAWSSdPSnXv2zKQp0dqt9D6Es8vympuw3n
	 xdju0f9Hk6MeJiSlbROvTmlbts4FfalqvHnH8NeBX4f+V2dbzWijNeHzCNx2ebixHJ
	 kNbN2q3e85A6qTv/CYdUtisczI/fbHT5T8Khe4tOSYFPH2zxE8MKR/oIYGmZuhjtEp
	 CLsVElm1xxlYiYxGVRyenhHd1Tn4jc2d+Fv1gkauUPFh+vPPzdCk7a5m+QK2AEa0ju
	 7UxAb9aoIUAng==
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
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v15 27/56] media: coda: Stop direct calls to queue num_buffers field
Date: Thu,  9 Nov 2023 17:34:43 +0100
Message-Id: <20231109163512.179524-28-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
References: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_083803_991620_0BFEA45F 
X-CRM114-Status: GOOD (  10.24  )
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
Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/platform/chips-media/coda-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
index cc4892129aaf..f1d85758f6dd 100644
--- a/drivers/media/platform/chips-media/coda-common.c
+++ b/drivers/media/platform/chips-media/coda-common.c
@@ -794,7 +794,7 @@ static int coda_s_fmt(struct coda_ctx *ctx, struct v4l2_format *f,
 
 	if (vb2_is_busy(vq)) {
 		v4l2_err(&ctx->dev->v4l2_dev, "%s: %s queue busy: %d\n",
-			 __func__, v4l2_type_names[f->type], vq->num_buffers);
+			 __func__, v4l2_type_names[f->type], vb2_get_num_buffers(vq));
 		return -EBUSY;
 	}
 
-- 
2.39.2


