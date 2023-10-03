Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28442E75437
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wuhFmhS2w+v29M9lMR5h9Bb4wbNIXpj9+P+8AwH6fjI=; b=P0GruutBOILtFVhyG/ClxjHp20
	1xRRVEk9ryvJGlfY7WgtO7d0emGBWZaSdcsOJwX2I+xMc3bJAUoHxsWmGI214TkzcI8hkRU5qu3Yt
	9b7k7Lp2Gp2cIkAQsG1Ye0H1CNdl82O4KyIojiWMfLb2pu+fM5Odp3meamONoIHaJqnIqXrCuJPz5
	1V58eHPkcbk5eSSFQ9eznuYvvf6EzpaNrWoxQ5qhxMH08mIDOYdILbhQHn2quUbVG0uFNbh9k6uzZ
	HMRE4/USxB6GfyRsOoJBldhJsLbIfIJXglmesVpvv6BKG/rXgidYsUP5v3fCeDxh+HpPGt2fFMn8R
	2mEhV8mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaSk-00E4xN-31;
	Tue, 03 Oct 2023 08:09:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRB-00E3CW-0G;
	Tue, 03 Oct 2023 08:07:34 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4A65B6607350;
	Tue,  3 Oct 2023 09:07:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320443;
	bh=qLvZsJraHy1cyquUmJgnlrPrhNUiYIy8VUcF3+5BgA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VxqczClSQp5zz7dzFXnSeQ+VItyAdodAT1c1CFllI6/95XCVmC4urN90RiVgJhZ1x
	 fnPE+jcB09DnHsfl6c89eAPlfvuqkiS+54g3DnnkdKpRAbndQX0aS+7NnmBkDiWJm6
	 Ljo7953dHbAjD2agQy3ZHtPqqS5nMTlA2v33AhdIYBd9UxVTAjcBayyzQVKqPiBT3l
	 StP/H9mm320pKpNOrx2dGXfayyTtKWUqXw01OnrRXlo7KO+njY0DgXSEpIunOkGJ1n
	 gKGlSQQJEsELad66EEc9axVOUCkQZlE5LzMqU1/ohB0Lxpd3fUqVmVUZMrCpTP25W5
	 IqxED93tA5uxw==
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
Subject: [PATCH v10 20/54] media: Remove duplicated index vs q->num_buffers check
Date: Tue,  3 Oct 2023 10:06:29 +0200
Message-Id: <20231003080704.43911-21-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_010725_282794_26303A38 
X-CRM114-Status: UNSURE (   8.82  )
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

vb2_get_buffer() already checks if the requested index is valid.
Stop duplicating this kind of check everywhere.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 42da0adc052a..cf881c8d8d4d 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -378,11 +378,6 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
 		return -EINVAL;
 	}
 
-	if (b->index >= q->num_buffers) {
-		dprintk(q, 1, "%s: buffer index out of range\n", opname);
-		return -EINVAL;
-	}
-
 	vb = vb2_get_buffer(q, b->index);
 	if (!vb) {
 		dprintk(q, 1, "%s: buffer %u is NULL\n", opname,  b->index);
@@ -833,10 +828,6 @@ int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
 		return -EBUSY;
 	}
 
-	if (b->index >= q->num_buffers) {
-		dprintk(q, 1, "buffer index out of range\n");
-		return -EINVAL;
-	}
 	vb = vb2_get_buffer(q, b->index);
 	if (!vb) {
 		dprintk(q, 1, "can't find the requested buffer %u\n", b->index);
@@ -908,10 +899,6 @@ int vb2_expbuf(struct vb2_queue *q, struct v4l2_exportbuffer *eb)
 {
 	struct vb2_buffer *vb;
 
-	if (eb->index >= q->num_buffers) {
-		dprintk(q, 1, "buffer index out of range\n");
-		return -EINVAL;
-	}
 	vb = vb2_get_buffer(q, eb->index);
 	if (!vb) {
 		dprintk(q, 1, "can't find the requested buffer %u\n", eb->index);
-- 
2.39.2


