Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E471CDB483
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 12:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARXOSBKGUUPDwevHrxoh+LOz0HRWiSJssojf7QO4Re0=; b=F42sKes9NKt4yXv3VfNqyXW9yg
	LjQ+4krdBSGjzVxY/ti6GDmhngkwoa39DcdomVMXsUYLMq8bDlNuo9TiFBrRGdxfpdGS4sEGRTLZq
	sJFWh/EK0z78iQv/iFREVTofjOeLMp3u+i39ad2topYKc9spvBHXEBZtAe7bSppTwfy4wQed5mrXF
	buAtqB0w6UdiNBBBBQLAQC3/4euk0bBBEYbyENHTjzCygt/azBFTB8zKZ4uJ+xqJ/XItNoWFCEPts
	Rda2tnzsg4E7ZmgJqRx6P/D67maKScfwQBdJaD+lqqXdhFuBbvpB/sw+n814cqZiJKOliwaY/9esN
	4ulNwwXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSYa-00HQ6E-03;
	Thu, 19 Oct 2023 12:55:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWF-00HNcu-0O;
	Thu, 19 Oct 2023 12:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ARXOSBKGUUPDwevHrxoh+LOz0HRWiSJssojf7QO4Re0=; b=Is+vh/If7Pce+LV9h89Bw8sByn
	HsvrUjpTSn/d8oxS7N0m649dViE2IddhRCuJuQaEH8cagu2Ir9m90bVjNmPXFBlAUL/+wSqWTHSvC
	1DZsKWl/pYukYzJQAXiF/RM2BjV9qpD4trqLy1EaW/GTbs1xV5ba/XZPZ1EBp13a0VoHa4hxn0ecw
	XKBKD7lOykdgoDFNSpXbglmL6pGT0C+8cYFtEqLwxu2CsGpXHPP2iDiuQAxnU8vjwBdbwvWPhaa17
	fbdaex/2UFO++56L7A9Y55vDFflKfxdpT9CVoCeUCEWoQ74UJPVC9P90g3FMa0gL30k57OXcAst2w
	jNUSmHLQ==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSW5-009rSX-0N;
	Thu, 19 Oct 2023 12:52:52 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C283F6607351;
	Thu, 19 Oct 2023 13:52:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697719958;
	bh=6OByUfiYmown+37pp4jYIRU8BDesYsod95qP0wK3edE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a/iBP9tI59PpwPQ9dsu1USfyNb+IVCYoCR90qa9XiqxLyHgD0yUIGidTF5m93xFk+
	 QwXu68MSX/tZOufr8Ia91h24G1wkP+3l/Xkz9KrFi91jjqOfrcHS83f8+3PC10ft5E
	 TE++zp/l82sxexjgmNkeYAsRFTbnN4UcNUpbv+Q2BsvhZi6nDlSNPHBG/E3tomc/ag
	 wzB4rK/+SeVQRrzRkQlE8jvrEHR34uq+6Jz3Wjsh02oJcS+VYc0Sl0GROv2xlyUVS+
	 9VYfyu6jz7+tF4H2ZIUGxjjSYFwhvITG/517mbqZmaMWIsrH/9/Jzv2sLoMxjIz8s4
	 D7KWWiQDtfhcQ==
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
	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>
Subject: [PATCH v13 14/56] media: sti: hva: Use vb2_get_buffer() instead of directly access to buffers array
Date: Thu, 19 Oct 2023 14:51:40 +0200
Message-Id: <20231019125222.21370-15-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_135245_433862_A03A12B5 
X-CRM114-Status: GOOD (  12.92  )
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
Remove index range test since it is done by vb2_get_buffer().

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>
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


