Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CDAE82CAD
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 15:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHNryKbCJeblfYmngcGtoYS+YQQ+1KvLxsjalykbByU=; b=CG8uQjwtMtolHLUOP7rNqJUE/B
	VrNifDz3eQN/aIvlMWUO6ey57v4NbY/6Ij89hPwO1iYuExFRMetdRlA/1LefyoQTIAQfZO6lNuPe2
	555UlpbfKSpilM+b3ahie86XJGq2eg3iibJhXQm9qANUQil+8xK/0byfyUKohJEZM+AYypoINEt73
	5H3rgkwvXLmJ8OFbPdfHo6ID1ymsdA5xl5ZO+WYZULrTzSRHCQcjkET9PmT8994C9jMT+knDF9iBg
	z2+SXSQLtnyvh/SoyduNujkWumk3N27DmeXd+jxpahPxdN1jK79UsHd+wDQrVkHf/Eye7utt1IXDs
	ON/NhO4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWam-001GvA-2Y;
	Wed, 27 Sep 2023 15:36:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWaB-001GCz-37;
	Wed, 27 Sep 2023 15:36:14 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:672:46bd:3ec7:6cdf])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2C8F06607332;
	Wed, 27 Sep 2023 16:36:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695828970;
	bh=dORnTzB2rXmsaHgnhN9KRI5xHQJEBU6mRdZelnGjotA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KMDgUwonf2lW5eRH7lA4RKRlpDlHdXq0Q2LfIFDyLzsDKPFhC4b24/93gkehWt8AJ
	 TJ1MqsMNw22xNF8lNLdkA3vXHkFdn2gn0FGaaQixTVA8pGu8A9ibqCSCQn8Z8HG+7D
	 0vKDgzPINWPePIZOn2sPIM9JCrEu5Ncf6ih970cu9RKs9CtixgfhBcX8RXt92+w6AR
	 /FsIUxGDx4QHv+LVbX/Fhxi6vh7XvU62/amHu9w3cLeZEiW24CfFFU/1zYoxI3lP/h
	 ysVEnog4uRlqd6Fsl913z+44m1cNjkx3sDKpKC8y9GawmiC54ToLTvBq0fAWY14eKN
	 XedA+BZtLsntA==
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
Subject: [PATCH v8 07/53] media: sti: hva: Use vb2_get_buffer() instead of directly access to buffers array
Date: Wed, 27 Sep 2023 17:35:12 +0200
Message-Id: <20230927153558.159278-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
References: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_083612_158703_ED3C5C00 
X-CRM114-Status: GOOD (  12.18  )
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
After each call to vb2_get_buffer() we need to be sure that we get
a valid pointer so check the return value of all of them.
Remove index range test since it is done by vb2_get_buffer().

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/st/sti/hva/hva-v4l2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
index 3a848ca32a0e..cfe83e9dc01b 100644
--- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
@@ -569,14 +569,11 @@ static int hva_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 		struct vb2_buffer *vb2_buf;
 
 		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, buf->type);
-
-		if (buf->index >= vq->num_buffers) {
-			dev_dbg(dev, "%s buffer index %d out of range (%d)\n",
-				ctx->name, buf->index, vq->num_buffers);
+		vb2_buf = vb2_get_buffer(vq, buf->index);
+		if (!vb2_buf) {
+			dev_dbg(dev, "%s buffer index %d not found\n", ctx->name, buf->index);
 			return -EINVAL;
 		}
-
-		vb2_buf = vb2_get_buffer(vq, buf->index);
 		stream = to_hva_stream(to_vb2_v4l2_buffer(vb2_buf));
 		stream->bytesused = buf->bytesused;
 	}
-- 
2.39.2


