Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185BECDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 12:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjcU1EdUHaOuvWhjBZZmhLhG4kfrsiodV6MICT8E4Rk=; b=Gf+awQe1nWSmWhKKdWvXyMGT3Q
	2+K7nqL7C1BediKkcvNJmtjhhiEEkUyyLP54wCtYc5VQvlyJVqwTF8bqdC+y+EnEJa4JeTN3sCUgk
	VccGm9AUpFjD1aOD5g7qT7qdM7StruFO0tsNylDI3Qrjnp6yiHhT2ax8rjWQcq52FgCaeaT9i5549
	sRLGH4cweJI/7ILQnDkVsMUHROC53wDtNW3HF4J+LQHTz3zFzQ0fh76jt60qX38bUo1BVthg+nxDL
	Alks0w2ah/jNScMfqUq4NGMYavLYPQE4s2HfUdgkFU72pEnLlLVrm6kNg+cLv/+Bkzvos5r2ppqsX
	cn3bI3Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSa0-00HRVI-2z;
	Thu, 19 Oct 2023 12:56:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWC-00HNZA-2x;
	Thu, 19 Oct 2023 12:52:58 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4F5F06607372;
	Thu, 19 Oct 2023 13:52:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697719967;
	bh=YJA2RlY3um15cd7mOHDvbbcCRQ1eLCd2aFKgKqMHmxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T1BIXVy4triCVAt6pjZ/aC6yzjKJJpV0DffsN4QizS6e/PAeJMPLQq5HUJnJ3p+dj
	 WfTmJXlL1D/M0SwDVuU4OheZpUBSgdLx99vxEQA1CoANiwdhAWAt9AKEFq+dzHfBDb
	 ltan1oSRqDFwnGRWsV3fiHaODWhE6Aoj6sRQOZ7517tlmhq+ABMNT+/15KvtzBsaWI
	 if0AVWEH49tgMiDSF7EdF56jcKxYpOT5s0KMKY9K7yLNQoTGsHEk5GFdkP6HO8U7HR
	 dxaqcYdq7D3YTVJwcfcv0VxjTodzzoblUNgF4X5GwRUozhPGou+OtsLtIloS9wthaL
	 BuaBDHYjHcIOg==
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
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v13 32/56] media: meson: vdec: Stop direct calls to queue num_buffers field
Date: Thu, 19 Oct 2023 14:51:58 +0200
Message-Id: <20231019125222.21370-33-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_055253_128164_6E6E9A79 
X-CRM114-Status: GOOD (  13.02  )
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
CC: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/staging/media/meson/vdec/vdec.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 219185aaa588..1e2369f104c8 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -167,22 +167,23 @@ static void process_num_buffers(struct vb2_queue *q,
 				bool is_reqbufs)
 {
 	const struct amvdec_format *fmt_out = sess->fmt_out;
-	unsigned int buffers_total = q->num_buffers + *num_buffers;
+	unsigned int q_num_bufs = vb2_get_num_buffers(q);
+	unsigned int buffers_total = q_num_bufs + *num_buffers;
 	u32 min_buf_capture = v4l2_ctrl_g_ctrl(sess->ctrl_min_buf_capture);
 
-	if (q->num_buffers + *num_buffers < min_buf_capture)
-		*num_buffers = min_buf_capture - q->num_buffers;
+	if (q_num_bufs + *num_buffers < min_buf_capture)
+		*num_buffers = min_buf_capture - q_num_bufs;
 	if (is_reqbufs && buffers_total < fmt_out->min_buffers)
-		*num_buffers = fmt_out->min_buffers - q->num_buffers;
+		*num_buffers = fmt_out->min_buffers - q_num_bufs;
 	if (buffers_total > fmt_out->max_buffers)
-		*num_buffers = fmt_out->max_buffers - q->num_buffers;
+		*num_buffers = fmt_out->max_buffers - q_num_bufs;
 
 	/* We need to program the complete CAPTURE buffer list
 	 * in registers during start_streaming, and the firmwares
 	 * are free to choose any of them to write frames to. As such,
 	 * we need all of them to be queued into the driver
 	 */
-	sess->num_dst_bufs = q->num_buffers + *num_buffers;
+	sess->num_dst_bufs = q_num_bufs + *num_buffers;
 	q->min_buffers_needed = max(fmt_out->min_buffers, sess->num_dst_bufs);
 }
 
-- 
2.39.2


