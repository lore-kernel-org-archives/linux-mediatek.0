Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB959C001B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 16:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuTgtxyPbErCrKgvGy4Be2VTKeTj33LFpgdcasSoc4k=; b=H5gt3pbL2jivecSqp113sDjZNv
	a+F4/5fY17XqG4epn+7RSm2fy1ejOAdeSajK8KW3VeBLzqm9sZMCVTVWH5dWOwjlK99n7XiDT8kGR
	VDH2JJHE4f0HPkUmz9rsJqFVREgNi5CSHB3lMQfSxb9t2lZiF23TAM7rnW6fELiK8SEfdKtvdZaAA
	mjldkRqEcRTJvG9RoQPpSKhUK9G3C31DS8roo1BNhfCuTUbfjWAtN1K/qUhZhTWaaDQsJmH7bZ/tc
	wfl8O+3m2tNHKcMJm4547IHz1QqHowsv4hKG5AzDPIRk/9jwktbxxLEoWJxK+GECBSX8sK+TXbZqx
	aJBgcmAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxrea-005c4O-1q;
	Tue, 31 Oct 2023 16:31:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxreB-005biT-2Y;
	Tue, 31 Oct 2023 16:31:21 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c562:2ef4:80c0:92f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3EB2366073A0;
	Tue, 31 Oct 2023 16:31:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698769878;
	bh=xMJ8tMojfr13gTY+PpecndOGeS4i3P9Tk9kRrGKcBSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LEBPyAJhw97i1P687pePRoUbVcTHMLdUGeE0LrTUWqPsbFiNyam1ES8VutUyizMCf
	 hPCqX3nEYhB/tr5QJk+3AmNbyHjcWAE4ZqrRAxhYeJWvV6RluxeFOFAfCFn2POY1rR
	 tdSylixfDMNjD0juivxiEJzRX/8wyKVBYaULxrbnQsZ/xc3wEYswvw4aB5Ki72wQq/
	 5Q3Q17x/s07rJEE7YTd30PtWvGYaJ30bl9Gr78ggWMvn8z1pmYR5mLyleGFUcGi7Uc
	 OXbPrTPgdHMIjJ2wXi9gV8aSl4cNCvgYro3Xzaxxq1g/Hpr2vRFm+0mAyceXvzgcCH
	 A0qbwG8MHsYuw==
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
Subject: [PATCH v14 03/56] media: videobuf2: Stop spamming kernel log with all queue counter
Date: Tue, 31 Oct 2023 17:30:11 +0100
Message-Id: <20231031163104.112469-4-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_093120_102943_53675FAF 
X-CRM114-Status: GOOD (  12.09  )
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

Only report unbalanced queue counters do avoid spamming kernel log
with useless information.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/common/videobuf2/videobuf2-core.c   | 79 +++++++++++--------
 1 file changed, 44 insertions(+), 35 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 09be8e026044..47dba2a20d73 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -533,25 +533,26 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 	/*
-	 * Check that all the calls were balances during the life-time of this
-	 * queue. If not (or if the debug level is 1 or up), then dump the
-	 * counters to the kernel log.
+	 * Check that all the calls were balanced during the life-time of this
+	 * queue. If not then dump the counters to the kernel log.
 	 */
 	if (q->num_buffers) {
 		bool unbalanced = q->cnt_start_streaming != q->cnt_stop_streaming ||
 				  q->cnt_prepare_streaming != q->cnt_unprepare_streaming ||
 				  q->cnt_wait_prepare != q->cnt_wait_finish;
 
-		if (unbalanced || debug) {
-			pr_info("counters for queue %p:%s\n", q,
-				unbalanced ? " UNBALANCED!" : "");
-			pr_info("     setup: %u start_streaming: %u stop_streaming: %u\n",
-				q->cnt_queue_setup, q->cnt_start_streaming,
-				q->cnt_stop_streaming);
-			pr_info("     prepare_streaming: %u unprepare_streaming: %u\n",
-				q->cnt_prepare_streaming, q->cnt_unprepare_streaming);
-			pr_info("     wait_prepare: %u wait_finish: %u\n",
-				q->cnt_wait_prepare, q->cnt_wait_finish);
+		if (unbalanced) {
+			pr_info("unbalanced counters for queue %p:\n", q);
+			if (q->cnt_start_streaming != q->cnt_stop_streaming)
+				pr_info("     setup: %u start_streaming: %u stop_streaming: %u\n",
+					q->cnt_queue_setup, q->cnt_start_streaming,
+					q->cnt_stop_streaming);
+			if (q->cnt_prepare_streaming != q->cnt_unprepare_streaming)
+				pr_info("     prepare_streaming: %u unprepare_streaming: %u\n",
+					q->cnt_prepare_streaming, q->cnt_unprepare_streaming);
+			if (q->cnt_wait_prepare != q->cnt_wait_finish)
+				pr_info("     wait_prepare: %u wait_finish: %u\n",
+					q->cnt_wait_prepare, q->cnt_wait_finish);
 		}
 		q->cnt_queue_setup = 0;
 		q->cnt_wait_prepare = 0;
@@ -572,29 +573,37 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 				  vb->cnt_buf_prepare != vb->cnt_buf_finish ||
 				  vb->cnt_buf_init != vb->cnt_buf_cleanup;
 
-		if (unbalanced || debug) {
-			pr_info("   counters for queue %p, buffer %d:%s\n",
-				q, buffer, unbalanced ? " UNBALANCED!" : "");
-			pr_info("     buf_init: %u buf_cleanup: %u buf_prepare: %u buf_finish: %u\n",
-				vb->cnt_buf_init, vb->cnt_buf_cleanup,
-				vb->cnt_buf_prepare, vb->cnt_buf_finish);
-			pr_info("     buf_out_validate: %u buf_queue: %u buf_done: %u buf_request_complete: %u\n",
-				vb->cnt_buf_out_validate, vb->cnt_buf_queue,
-				vb->cnt_buf_done, vb->cnt_buf_request_complete);
-			pr_info("     alloc: %u put: %u prepare: %u finish: %u mmap: %u\n",
-				vb->cnt_mem_alloc, vb->cnt_mem_put,
-				vb->cnt_mem_prepare, vb->cnt_mem_finish,
-				vb->cnt_mem_mmap);
-			pr_info("     get_userptr: %u put_userptr: %u\n",
-				vb->cnt_mem_get_userptr, vb->cnt_mem_put_userptr);
-			pr_info("     attach_dmabuf: %u detach_dmabuf: %u map_dmabuf: %u unmap_dmabuf: %u\n",
-				vb->cnt_mem_attach_dmabuf, vb->cnt_mem_detach_dmabuf,
-				vb->cnt_mem_map_dmabuf, vb->cnt_mem_unmap_dmabuf);
-			pr_info("     get_dmabuf: %u num_users: %u vaddr: %u cookie: %u\n",
+		if (unbalanced) {
+			pr_info("unbalanced counters for queue %p, buffer %d:\n",
+				q, buffer);
+			if (vb->cnt_buf_init != vb->cnt_buf_cleanup)
+				pr_info("     buf_init: %u buf_cleanup: %u\n",
+					vb->cnt_buf_init, vb->cnt_buf_cleanup);
+			if (vb->cnt_buf_prepare != vb->cnt_buf_finish)
+				pr_info("     buf_prepare: %u buf_finish: %u\n",
+					vb->cnt_buf_prepare, vb->cnt_buf_finish);
+			if (vb->cnt_buf_queue != vb->cnt_buf_done)
+				pr_info("     buf_out_validate: %u buf_queue: %u buf_done: %u buf_request_complete: %u\n",
+					vb->cnt_buf_out_validate, vb->cnt_buf_queue,
+					vb->cnt_buf_done, vb->cnt_buf_request_complete);
+			if (vb->cnt_mem_alloc != vb->cnt_mem_put)
+				pr_info("     alloc: %u put: %u\n",
+					vb->cnt_mem_alloc, vb->cnt_mem_put);
+			if (vb->cnt_mem_prepare != vb->cnt_mem_finish)
+				pr_info("     prepare: %u finish: %u\n",
+					vb->cnt_mem_prepare, vb->cnt_mem_finish);
+			if (vb->cnt_mem_get_userptr != vb->cnt_mem_put_userptr)
+				pr_info("     get_userptr: %u put_userptr: %u\n",
+					vb->cnt_mem_get_userptr, vb->cnt_mem_put_userptr);
+			if (vb->cnt_mem_attach_dmabuf != vb->cnt_mem_detach_dmabuf)
+				pr_info("     attach_dmabuf: %u detach_dmabuf: %u\n",
+					vb->cnt_mem_attach_dmabuf, vb->cnt_mem_detach_dmabuf);
+			if (vb->cnt_mem_map_dmabuf != vb->cnt_mem_unmap_dmabuf)
+				pr_info("     map_dmabuf: %u unmap_dmabuf: %u\n",
+					vb->cnt_mem_map_dmabuf, vb->cnt_mem_unmap_dmabuf);
+			pr_info("     get_dmabuf: %u num_users: %u\n",
 				vb->cnt_mem_get_dmabuf,
-				vb->cnt_mem_num_users,
-				vb->cnt_mem_vaddr,
-				vb->cnt_mem_cookie);
+				vb->cnt_mem_num_users);
 		}
 	}
 #endif
-- 
2.39.2


