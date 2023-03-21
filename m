Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B842C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 10:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9xPo7gMwKE+IXB8PVV8yqUHAWTDFeaRuWNnWJw9ACs=; b=PF/oprO/62H1dBGqXHj6jVVu82
	Z+sya0jG+Ir82eBOBdRcin0klXjiPy3sd+SdOog7DQtnvT773+JOvcprrR7NHlux+L5SpODaXWhNK
	BczVngqz2rfNZQ+n2FKMJv8lcJDBBXZs41tNXmYMiYa2JlnRm/M7rcoHDIE+8dVY0buvO4cT9Z8rh
	iocVY85F6pG4UltxMvwJ/qQfwSnkr7e9MKoSL8wsOGlyzIJog48NW0zmCA0l0SzzOL6L+EbKcF/Ai
	A+GBy3PnyDS3QRrj8WE0exI2b3MwlzGcylQClWcLuin3iyTjiGlpuF9GiDn+djC9gyNvwGSE1VSJL
	CQZNNSaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peZF9-00C1rd-2t;
	Tue, 21 Mar 2023 10:29:28 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peZEt-00C1gI-1U;
	Tue, 21 Mar 2023 10:29:14 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:f5ef:1040:e3c1:3d00])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A932666030E3;
	Tue, 21 Mar 2023 10:29:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679394550;
	bh=Qx0PRt3isIlAqw5GD5W4+XyeoxGVpt/CzB4iImFqRXY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dVfqRh7sC6zRJr/CN9MUM5Wor9L4YEmQMnKaLBQjqylbnOVEfj7r07/1jGs2DKo6d
	 e9mSEV7DKxuTIoeFT7KD7d2poatPJVDmwHwG4dVLqF0rObddiz/+KjxmaIv7JvphJA
	 1LVGJu9f+q0WHW5WgS9a8sdQauF1dLBcBxFKBkKhGtE78Ke7f98LKg63rIfVQdB5wV
	 cIhpRIBI8QtQPadVDsW9zpzAoGfixlYSQ7c/I42dnqZLrPU6QIf0ATiyBvB72aSax+
	 S55gXwz8iVC+1zxqt0es7kdn5KdMTlrmBHTqwtGgAjNmb6VyIYnw9p5+v9+xwHwztz
	 rrCVdrzqDLRlw==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	ming.qian@nxp.com,
	shijie.qin@nxp.com,
	eagle.zhou@nxp.com,
	bin.liu@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	stanimir.k.varbanov@gmail.com,
	quic_vgarodia@quicinc.com,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	daniel.almeida@collabora.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	jernel@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 3/8] media: videobuf2: Add a module param to limit vb2 queue buffer storage
Date: Tue, 21 Mar 2023 11:28:50 +0100
Message-Id: <20230321102855.346732-4-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321102855.346732-1-benjamin.gaignard@collabora.com>
References: <20230321102855.346732-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_032911_768122_55949BFA 
X-CRM114-Status: GOOD (  14.39  )
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

Add module parameter "max_vb_buffer_per_queue" to be able to limit
the number of vb2 buffers store in queue.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 15 +++------------
 include/media/videobuf2-core.h                  | 11 +++++++++--
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index ae9d72f4d181..f4da917ccf3f 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -34,6 +34,8 @@
 static int debug;
 module_param(debug, int, 0644);
 
+module_param(max_vb_buffer_per_queue, ulong, 0644);
+
 #define dprintk(q, level, fmt, arg...)					\
 	do {								\
 		if (debug >= level)					\
@@ -412,10 +414,6 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 	struct vb2_buffer *vb;
 	int ret;
 
-	/* Ensure that q->num_buffers+num_buffers is below VB2_MAX_FRAME */
-	num_buffers = min_t(unsigned int, num_buffers,
-			    VB2_MAX_FRAME - q->num_buffers);
-
 	for (buffer = 0; buffer < num_buffers; ++buffer) {
 		/* Allocate vb2 buffer structures */
 		vb = kzalloc(q->buf_struct_size, GFP_KERNEL);
@@ -801,9 +799,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	/*
 	 * Make sure the requested values and current defaults are sane.
 	 */
-	WARN_ON(q->min_buffers_needed > VB2_MAX_FRAME);
 	num_buffers = max_t(unsigned int, *count, q->min_buffers_needed);
-	num_buffers = min_t(unsigned int, num_buffers, VB2_MAX_FRAME);
 	memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
 	/*
 	 * Set this now to ensure that drivers see the correct q->memory value
@@ -919,11 +915,6 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 	bool no_previous_buffers = !q->num_buffers;
 	int ret;
 
-	if (q->num_buffers == VB2_MAX_FRAME) {
-		dprintk(q, 1, "maximum number of buffers already allocated\n");
-		return -ENOBUFS;
-	}
-
 	if (no_previous_buffers) {
 		if (q->waiting_in_dqbuf && *count) {
 			dprintk(q, 1, "another dup()ped fd is waiting for a buffer\n");
@@ -948,7 +939,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 			return -EINVAL;
 	}
 
-	num_buffers = min(*count, VB2_MAX_FRAME - q->num_buffers);
+	num_buffers = *count;
 
 	if (requested_planes && requested_sizes) {
 		num_planes = requested_planes;
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 397dbf6e61e1..b8b34a993e04 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -12,6 +12,7 @@
 #ifndef _MEDIA_VIDEOBUF2_CORE_H
 #define _MEDIA_VIDEOBUF2_CORE_H
 
+#include <linux/minmax.h>
 #include <linux/mm_types.h>
 #include <linux/mutex.h>
 #include <linux/poll.h>
@@ -48,6 +49,8 @@ struct vb2_fileio_data;
 struct vb2_threadio_data;
 struct vb2_buffer;
 
+static size_t max_vb_buffer_per_queue = 1024;
+
 /**
  * struct vb2_mem_ops - memory handling/memory allocator operations.
  * @alloc:	allocate video memory and, optionally, allocator private data,
@@ -1268,12 +1271,16 @@ static inline bool vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *
 
 	if (vb->index >= q->max_num_bufs) {
 		struct vb2_buffer **tmp;
+		int cnt = min(max_vb_buffer_per_queue, q->max_num_bufs * 2);
+
+		if (cnt >= q->max_num_bufs)
+			goto realloc_failed;
 
-		tmp = krealloc_array(q->bufs, q->max_num_bufs * 2, sizeof(*q->bufs), GFP_KERNEL);
+		tmp = krealloc_array(q->bufs, cnt, sizeof(*q->bufs), GFP_KERNEL);
 		if (!tmp)
 			goto realloc_failed;
 
-		q->max_num_bufs *= 2;
+		q->max_num_bufs = cnt;
 		q->bufs = tmp;
 	}
 
-- 
2.34.1


