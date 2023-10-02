Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75085E784B7
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 12:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmQ8B48fS653lsNUZPmdnMwdIC6Yd6jLqjKhmYRUJKw=; b=tEU4dXAb+piAe/EMP+DYtwiTe3
	Hf4/G5Lr2v8LsMVbFj4RUrl+cI7zoWFdBq/hD8JkXAJtseEqxZ+HAl9fwMT++oEwpv+CzpBJD8MWW
	iLnn/8hyKgUY8NyRKdmz5LLuFzzKkcwHDEmS7lRNT6uD97U3BeAnX0Z6l/HX1Ljbd8Sd4KueWJldP
	mXWdlMuk9ZK2S9Ad6d5XS7qm+vVoBC8cuQBi4BBw7VUxhOucYdIZG6j8HA1ab5SLjLdxbxsaX6dEh
	5XYI4Y1zPol2gtWAtO3jmMUCZXPD4djptvB6o/PXJLctVJtcOi/7WbXo+FdKlrQiVz4AyKmrThuo3
	hoZqPP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHkL-00CfIi-2k;
	Mon, 02 Oct 2023 12:09:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhX-00Cbfz-1Q;
	Mon, 02 Oct 2023 12:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tmQ8B48fS653lsNUZPmdnMwdIC6Yd6jLqjKhmYRUJKw=; b=YGPvzvb38RAF4tFaHnAfkqBErp
	+ipJ1ars1X4mTShibUoPlPWRIa+qO3UPJkuT0/8gqu/wPKarzg/dyZZSMYdbJFNonEJ2OmRD+4CQI
	eaD9+S9iPYQQIqik1PWPdt4KlV91y3HnQHzZ2NbY+YVfzMmiSQbvtbmnb91dNhETGrfZb3Cfi1KZs
	28FwRT1d2XOwmswXLNQSDqSEszOi38TnRWHrM+Vbh3XH1+gvnZXvBEqeh/Wa6wgWF4Tx0w88xA3TF
	jENzRN6UcgM4f5Jy3OS3iMQQMdVnin19xx1TETt5HttwyOLNIRxI+p4KBk6AlcgSxbhF4Ztf4y+2p
	MFP88YAA==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhK-0090R3-0K;
	Mon, 02 Oct 2023 12:06:57 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9537:67ca:c85e:d0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0DDBC6607388;
	Mon,  2 Oct 2023 13:06:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696248408;
	bh=qUxQMObFxpiy3pFolAat/Lsgv4wZ2hZHcdle7SRl8Pw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IwJTge2L/P3ziSGIw+PX0oIbrMWIxPy+E8aTlnT0qvTXj4YqMEmlusgGfo1c/z6i7
	 b68TcDJOpNETsBlXk7gBjmGUG8RYEzUuBYhAsK2zf6kBj9wupKxJL909RV1N5R9v4v
	 QJKYuOmj8dqVwaJh9mNDP1pnG0ug3pOdF6yjkol8BnP0VRb9ORA4oXuWuSDCyjWSNR
	 Lpo0tUXk11qclAvkvznzqieCY0MKqXfYjuP63YKZo/LlquSG1YUlWf+H6rCBNn30Q4
	 76bsu/FE2zo7df8BN+FWmPBxSHJJ72TGgLp9f3cuDryQUNxv7z2Wezbl8XdZXB1KSw
	 p907xEV5uGRQQ==
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
Subject: [PATCH v9 44/53] media: meson: vdec: Stop direct calls to queue num_buffers field
Date: Mon,  2 Oct 2023 14:06:08 +0200
Message-Id: <20231002120617.119602-45-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
References: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_130651_903838_AD674D5D 
X-CRM114-Status: GOOD (  12.15  )
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


