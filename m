Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D51EEAA40
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmQ8B48fS653lsNUZPmdnMwdIC6Yd6jLqjKhmYRUJKw=; b=Y5OcJDzx+ycJR61gFMItjNfmRB
	jkOLw1QjsB33TQKjMWalVETLgS0rSGakIOLjKWee5YTzUuLSEevP+1pfALaFsoOBB0ogZHxXHskkn
	64LKXrmpFyHEURL4Xbe0pVtq9mZa8HQit3/o3QDmD3z3mMdaibLbecvnD9381UoL0XY0tWOhM1Yjv
	fyiYT/t7JrSO88ucKLGUnu0oJIuvJlxmepsABnlgKezqpTsgDBEJctcY67LgnCyT3rngjb+hvxUOO
	B/golez6IjZBW76SIbHCYDM07150shjvtuSBlPMwV3Bd7CQwNB91a4OrgLcZ4vs934qsQl1aJ4iPy
	xYboAoZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmX1-008W0U-13;
	Thu, 14 Sep 2023 13:37:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTn-008Sak-0m;
	Thu, 14 Sep 2023 13:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tmQ8B48fS653lsNUZPmdnMwdIC6Yd6jLqjKhmYRUJKw=; b=rHE7bh5nLinR+fwU83AhDlaUKN
	5dGcvt0fdoeeeI/GE1ssRU61ea4AyAnuAkjklgNd2CyRgqSMyJ8+RziMZb4gVTlQIRdeqM1GNnPPw
	0rGngxiFDbIGvqxsZ49n9Hz7FMIMBrpry1XA0Vweuh+7pRqECpD6A3lrqCh5al1FTgEQwkOdC2eiF
	uaKFVU5W7tR8myym7GM/MEoM91TUAOSTblhSjOjg89ibuoBA0byY8ksOKSoHWQ6z4xR4t5qsXDYjf
	McATJIYf8hITBYI/4KtCJPk2Ef2GVsBHs+PnkYXFfj4SmGR3vMSgpJ/g2Qp0FS9cBPVKYJ+AqhIBy
	/E4Atwtw==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTh-007ukS-2s;
	Thu, 14 Sep 2023 13:33:57 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A69746607394;
	Thu, 14 Sep 2023 14:33:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698434;
	bh=qUxQMObFxpiy3pFolAat/Lsgv4wZ2hZHcdle7SRl8Pw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eX9HPb3F0XG0gWIqEzdqo1JuCQk+1T5cSP5loYaPm2hT3jBZ4pf1li6gLpqSo5LAm
	 BlwGFyX3ssHkT1LNdS858TgUdf7Lj6vRz5qWet4kfA2XqtPD4GDHlwejGuNN//FPlM
	 etgV1owR/w4SyjHd3eSsf4Dab3lrPTGat9OZCFs6J9WWAZ+XXVXuI+FCMmWh8we3eU
	 hdwqMxk5k/sDDBmthNK5ADpwGcIzkuOav0X4YWogslj5ukliigIfgy5ICXLz5wBdct
	 5evWbWUGrEv0IL8bdW4pD8Z3GOZ6cYuRzwAHYxn3J5jkIukKI8hhdnA+sbr25kDMW2
	 7kEBNEOLNMQ4A==
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
Subject: [PATCH v7 43/49] media: meson: vdec: Stop direct calls to queue num_buffers field
Date: Thu, 14 Sep 2023 15:33:17 +0200
Message-Id: <20230914133323.198857-44-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_143355_819187_285A0813 
X-CRM114-Status: GOOD (  11.80  )
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


