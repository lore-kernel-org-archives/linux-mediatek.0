Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7792EEAA4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 14:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mp1KeUwXEPeyi7FaB/qpZlqFp0j0IcgZ40cl1bA/YGw=; b=AasKDlqezoMaXkcFSnyBhLwbw7
	s8BorV/yAf1zML+VUHOBiFpQYOnfu28hBbUP7LS1JXhZB0UTX+DNUUP6HMoLg3CGrrjyDmL0b/W9A
	iRHgWcqglJi4v29n9eSwYzAs8UKiMCg8ZiGi9ZDvfeHjSp8XBZPJJafrWTylS3OSQOEPwg0aSG5Wg
	CzJ9h+9Htu7FJo5rgxpoq5jHFZ14wqnlwN9nEKqA8cWk1tUZPL85ISr42ZoSUOyt2yCu/IeufzGAt
	q/I+Ie+sgv+jzUdVEdQmbvur9Zoh06X4pDxTyep03eylPVDexdAWDuquQUXAbshoO4aVG+oh2JLYC
	JVVTDUXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnbP-008fhJ-1J;
	Thu, 14 Sep 2023 14:45:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTP-008S71-0q;
	Thu, 14 Sep 2023 13:33:36 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4FC55660734F;
	Thu, 14 Sep 2023 14:33:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698413;
	bh=swS7yYiqBxggjIra2XX2pXDY4PPq3f683TK0rKa6DhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S3NYcmVUT/668LAIWTgK5i5tWEyxhjosr4VuCzSWSR89CBBmduMkbxehmFdODUu3Y
	 vbNJ31v+IzyyZCmKcT/yK8z3b7BnZDDbzFcORQsFgOqx+3moz3mV2otVE3TWQk9Nh8
	 qFPkSkNm/ESDmsHnQE9TY6kfW1FmnoCtZmtnmals7qGlc9w1aGYFISc9YrpwJgD0UC
	 eBfF2oYlnxdM+IRU9H3zCnA88N7Fq4Pu4AUytP24NYNtXFT8bDNROKnG/X5lTZm4+X
	 hZCKFFCjPXH6+Vu7biaWGiWFit336I5sw2dijDy4GWQAAspAHn4+X/3xozOO1hK1CA
	 FxxL0BQuqv/Cg==
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
Subject: [PATCH v7 04/49] media: amphion: Use vb2_get_buffer() instead of directly access to buffers array
Date: Thu, 14 Sep 2023 15:32:38 +0200
Message-Id: <20230914133323.198857-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_063335_422029_09C3563A 
X-CRM114-Status: GOOD (  12.28  )
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
This could allow to change the type bufs[] field of vb2_buffer structure if
needed.
After each call to vb2_get_buffer() we need to be sure that we get
a valid pointer so check the return value of all of them.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
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


