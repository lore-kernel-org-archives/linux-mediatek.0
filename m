Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F820C04FDE
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 16:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REQjwdZNT9oDr4RHQoEtlN8v1NdU3UK12kczFgah6DY=; b=a4N5p+pYZ4eSnHoZj0Ukyu+6NM
	DQqum0ZjvKc8QiXc5YSezD9LEzAg2J4jG7axtgZF0VOOlgDkvwPo2NTbOr7MzGUBmGa9rk8v9QBEk
	pcbgz7tmnbqd73IGuoWbIc0yqjVDhp7LuSJU4qaKxvQScZLf1w5J9FvHY25qOSUNI7FyBU4BLjRtp
	hzQvLcuTG1ysjya5x+rCGpzpSrtN8yv3vSACutf5QWkvbbk9CjTmLnxEe80X9qN2dvZZgC0neAsi3
	mEgyXyCOw6Xhf6tTEgtfaikDWOEnU9myh0Eudq0q+3ydcZ5+6PENuAIb1AAF4m5Hoeq0SAPj2YjQB
	x85bqzJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r17xw-006jvz-36;
	Thu, 09 Nov 2023 16:33:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r17xV-006jV3-1Q;
	Thu, 09 Nov 2023 16:32:48 +0000
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E8FF866076AA;
	Thu,  9 Nov 2023 16:32:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699547564;
	bh=PTo/lEgMtFohowt4upXDcQZ3buaIbCY7CSCf1Rsf9X4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=muu/4RLhhYIvaytTMJ3ko9445xcwfw9LmwypaWwzn1Mz5l1cxy8Uu/P09WJvFXNF8
	 vMXULbeVScZg/kSH5VwDDPB2FbBhIgXJtfc4bVKs916Yssye5QbZ5NtF15WZyWFxVk
	 y5CA1IaL3OrKO8ciavZ47JrfyfRjIH2SzLU1/gSSlxzXqB6TbgODXdFcwrprY4LTOL
	 tQbsGYG5QkAwOxfM3MmPlFg9sqYmWMdPMNaN6Bpe+OPJDTfx3XOjPwZ3vK117+ssGF
	 sc7AawLchkPxb89u1RZ57r/aKNG6T4Rf2S7bdD4PP0P6uvXTjs1zMDRS0Z7URWEicK
	 MRxVrBT9NAWXA==
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
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Zhou Peng <eagle.zhou@nxp.com>
Subject: [PATCH v15 09/56] media: amphion: Use vb2_get_buffer() instead of directly access to buffers array
Date: Thu,  9 Nov 2023 17:29:21 +0100
Message-Id: <20231109163008.179152-10-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109163008.179152-1-benjamin.gaignard@collabora.com>
References: <20231109163008.179152-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_083245_636155_51DD5BE4 
X-CRM114-Status: GOOD (  12.78  )
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

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
CC: Ming Qian <ming.qian@nxp.com>
CC: Zhou Peng <eagle.zhou@nxp.com>
---
 drivers/media/platform/amphion/vpu_dbg.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
index 982c2c777484..a462d6fe4ea9 100644
--- a/drivers/media/platform/amphion/vpu_dbg.c
+++ b/drivers/media/platform/amphion/vpu_dbg.c
@@ -140,11 +140,18 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 
 	vq = v4l2_m2m_get_src_vq(inst->fh.m2m_ctx);
 	for (i = 0; i < vq->num_buffers; i++) {
-		struct vb2_buffer *vb = vq->bufs[i];
-		struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+		struct vb2_buffer *vb;
+		struct vb2_v4l2_buffer *vbuf;
+
+		vb = vb2_get_buffer(vq, i);
+		if (!vb)
+			continue;
 
 		if (vb->state == VB2_BUF_STATE_DEQUEUED)
 			continue;
+
+		vbuf = to_vb2_v4l2_buffer(vb);
+
 		num = scnprintf(str, sizeof(str),
 				"output [%2d] state = %10s, %8s\n",
 				i, vb2_stat_name[vb->state],
@@ -155,11 +162,18 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 
 	vq = v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx);
 	for (i = 0; i < vq->num_buffers; i++) {
-		struct vb2_buffer *vb = vq->bufs[i];
-		struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+		struct vb2_buffer *vb;
+		struct vb2_v4l2_buffer *vbuf;
+
+		vb = vb2_get_buffer(vq, i);
+		if (!vb)
+			continue;
 
 		if (vb->state == VB2_BUF_STATE_DEQUEUED)
 			continue;
+
+		vbuf = to_vb2_v4l2_buffer(vb);
+
 		num = scnprintf(str, sizeof(str),
 				"capture[%2d] state = %10s, %8s\n",
 				i, vb2_stat_name[vb->state],
-- 
2.39.2


