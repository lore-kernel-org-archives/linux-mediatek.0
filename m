Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE03EEAA41
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jV6i3xIP4hGxH8EXvLuds7UKlCHHz8u2pXx32VH8m+k=; b=u+zS9WOZZ9dvVH3CEKPLuccHiP
	r6rww2WnK0+FM5SElcjdNXohjKCKoqfydmGAH0MtUI7sWwlYq5ln5uIzynTVKn7CoCBO+HeeICynt
	bRj/+zcIc1bVL0+V/17dhSfX79pR6QY1U3Jr5WhnvwWHex8gs3htdomyAA9bZ01BtFlhLjSDxpI0a
	x8sKq2EyDxBjV/+y6DHIoPHUMLbQ5PwXOSNhu/V1cq6yX3Nu47CzbGJmnURTzZMTfhvYUVlSU8Bmg
	7gt18NymlP+nTk2Rok4u5yCE26RTEH3k+7iuJ457UgcCsBse8INXpLGfMkmp7T3rZCYfQrM7WhTtL
	tXsOKxSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmWL-008VDg-0X;
	Thu, 14 Sep 2023 13:36:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTc-008SMW-1u;
	Thu, 14 Sep 2023 13:33:51 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C8FBF660737E;
	Thu, 14 Sep 2023 14:33:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698427;
	bh=cxYwkj/F6kj42Kfzns0GGyq/E2dEjF9Je+84qllCmIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HpCcDjwIzbu/CFpkbHzElKPkqKLgrYNOoIw0sHPR+JiGA/xYLs71WQOC1eJ1pPVFx
	 Ae20c+bd06EakvdwkNEm0rciFoLMRdX7qE9vKLHHhtAXhN3zERt8K0oJZU1CD9RKwM
	 R5EaqiY4AefrXlaYthIIS9w4VWVAI8g7GuNGLM6/b4bwQ1Pb/mh0cyt8BqvD03WE7A
	 Xdoyfmq+KrpIZ2LyYgdW6M95sa6/tklcHf2ugKxMG9jzqKxIjiXgMJAso4EbnBKlvf
	 4y3vTKB1f8NsRAdNKLMucjH0GX1cJazDjz8jCRbaEDTMKdar2s0FQVIZmn+YEhcidV
	 yjpJz2EwdszbQ==
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
Subject: [PATCH v7 30/49] media: mediatek: vcodec: Stop direct calls to queue num_buffers field
Date: Thu, 14 Sep 2023 15:33:04 +0200
Message-Id: <20230914133323.198857-31-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_063348_789047_47F36C30 
X-CRM114-Status: GOOD (  11.73  )
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
 .../platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 2 +-
 drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index 3d2ae0e1b5b6..a04003d20b1d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1695,7 +1695,7 @@ static int vdec_vp9_slice_setup_core_buffer(struct vdec_vp9_slice_instance *inst
 		return -EINVAL;
 
 	/* update internal buffer's width/height */
-	for (i = 0; i < vq->num_buffers; i++) {
+	for (i = 0; i < VB2_MAX_FRAME; i++) {
 		if (vb == vb2_get_buffer(vq, i)) {
 			instance->dpb[i].width = w;
 			instance->dpb[i].height = h;
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index 04948d3eb011..ff183c9142a3 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -923,7 +923,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 		mtk_v4l2_venc_err(ctx, "pm_runtime_put fail %d", pm_ret);
 
 err_start_stream:
-	for (i = 0; i < q->num_buffers; ++i) {
+	for (i = 0; i < q->max_allowed_buffers; ++i) {
 		struct vb2_buffer *buf = vb2_get_buffer(q, i);
 
 		/*
-- 
2.39.2


