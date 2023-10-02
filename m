Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FD3E7849A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 12:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUa/TY+Am8ySB21RfaC1a0J9/53VTglM2vrOBadwXyE=; b=FJ9leMeplGLQAFlGN7rA2H8onx
	3TGmtdwgPJX7Jwu0GH993aKXCkR5YJnuTBPylRZnMMBtPthKGOqsF/u7/D1gXH57zfS8Yvhk1ESkS
	ijXVxnSEpw3CrbF6zLhU8wTzkKOFavUm6iX0/d4CEPZR14DsSfjRyStUuE2STqD+pheiV/vTZs/nq
	2LBP9u1YTZX+x2M6UsZE3HCedfqE2bvr2o0YvYYh6uViORuaCdxIupn4gHH8mo5oUQ/iczisB4v6T
	lm1zPV3/5FFFu6n+3yphF2pdVWIAgtUlQ9uJYrB6/JtSm57BetSUAD/mu+dWdyB2wWMvnDe59FFwD
	KBlAP5Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHjX-00CeAs-2a;
	Mon, 02 Oct 2023 12:09:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhP-00CbWN-1r;
	Mon, 02 Oct 2023 12:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cUa/TY+Am8ySB21RfaC1a0J9/53VTglM2vrOBadwXyE=; b=evLB53Yg6iI3cxH5oLPJWowvWE
	hLOFTMXGecrdDpX5HthBzgAPSJc4qn2y7w+tt8Pltpsg6kkpLhNJWmw5m2+O5OvCo+zYGmnMxjE7P
	t3RXKAFqYhSeU+dkAWi2s0/ik4dIdLgGLTpKqLEKdbLNksmvIlI3EsOlrpi+SKUpTUEiW3GZo6g85
	w6BbcU29mYgV+6VGZ/zmzgWQH7QyBzLXD7ZKTYqYURlqaG/mwEGA8gDal87Fum2vZWOGsV7XfVul6
	K9a+AohmXb44otBL9axs1FHATjCNw24ivuSup6QP4rbRMB4UWRXTxH18o+boeWbVqLakN5/KGIcyM
	9AC6faVg==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhC-0090N0-0N;
	Mon, 02 Oct 2023 12:06:53 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9537:67ca:c85e:d0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 631306607310;
	Mon,  2 Oct 2023 13:06:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696248392;
	bh=/rw+5kiG9NH9F1WJEwdp/d4z1jjMgH/1J5yw8ccESj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Te3TlY/tI/yO+/NmjTXoNmmq8+/IsQGyuNljO5gBs2TsE1mcSDmLQ3DO3Wl0ZPxR3
	 0HMMbAQZr3ysNTYX5hK6tPdsKfp9MQFDJymIKSb/kwu4iJ4s8OHO8apA3r8txGczeS
	 styjUSeuUX9xOZJnu7eWA/sWA5pobfeAnzQhL9IjvV3pLoJpaDxPS3u5h1BgRGiFBL
	 JbFFFhFEjOL6rZfRb1Y25lKE48W7RjujgERvS0A0FdtsZq2J9ekb5OwMUhn/fXIdMQ
	 LfyTfYPcgtc9VGsx48+FgW72w2I12YZhMcPiDSANTqNq88cLp8GC/AgkeByQf5DTqq
	 Pz/vfeQV8yUbw==
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
Subject: [PATCH v9 15/53] media: test-drivers: vicodec: Increase max supported capture queue buffers
Date: Mon,  2 Oct 2023 14:05:39 +0200
Message-Id: <20231002120617.119602-16-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
References: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_130645_499903_9DCDE166 
X-CRM114-Status: UNSURE (   7.98  )
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

Allow to allocated up to 64 buffers on capture queue.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/test-drivers/vicodec/vicodec-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 6f0e20df74e9..69cbe2c094e1 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -1718,6 +1718,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 			V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
 			V4L2_BUF_TYPE_VIDEO_CAPTURE);
 	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	dst_vq->max_num_buffers = 64;
 	dst_vq->drv_priv = ctx;
 	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	dst_vq->ops = &vicodec_qops;
-- 
2.39.2


