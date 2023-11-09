Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8866C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 16:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6E1O1R8M7YTSlG1XbXGV9AwJXYiqbVAyoOPDtFMzn4c=; b=JxiJND59YXdHtFBWoU6ydskK6e
	FT0SPFB8Eb4L7wrSW5v+uMkzPbIXzFl8f1kPInt9t2u05i3VFT42xehLSCmQrvdkBiaHjb1O/rpeD
	MeWVTEpyr6tT/uhQzma7SgJwliX/ZeXCBe2cUPqM+iZnNhiTp6u1g7srwNE2uu/23+jp9Ezv7u9lv
	AcFWZqsvKXm+vAwlS/LZYQfW10h1c2KN8tdgmHOM+eagHPyv7m9uim3RQOeYBZ5aIVP4/anFLJKPN
	CU4Z7rZx4MPlHvVbVRbwlSs2Cni7pSzU/V+Yx/WHO99abndCMItJiE9I7TwhRU6mE4Eaf3SKWIBEY
	ZzO9iiuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r184v-006o38-2m;
	Thu, 09 Nov 2023 16:40:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1839-006lxl-0E;
	Thu, 09 Nov 2023 16:38:40 +0000
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CD6F266076D0;
	Thu,  9 Nov 2023 16:38:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699547913;
	bh=43xinBr2kPIZE8TtRPdS2cjSs0wQVBCzw73zdRmmfY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WoW+KWPGTwYzK9VZL/9RxbJgCyVQhJDcYpmDGW+3PK2nATjpaqE2hbHzCjZK9rZdR
	 gYZ7KTVrE08gwA3kdn5BDQa4Waxv85DbxD/I0tFsNSqzy+iA4jJz+9f30NPUePMLgL
	 ISLJhLgTL008vDbgSBWdS8g0sv+aRIN8JXYT9SzzpWTbOlEs4gy1fcxavmbghI+4wT
	 1qEzgF2s8gd7xiLOzln0O2PNKhn+GyO4gcDCnHWRxIy6ABfuhkOZboewmyOscd6ikO
	 mFdgL9ov4ECzPYblv4MQ/PwNqyeDtQdC8kSfLRknYOi33Tusw974Eg9dbx1/YeC6ur
	 kSOz4pbUklITw==
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
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH v15 45/56] media: test-drivers: vivid: Increase max supported buffers for capture queues
Date: Thu,  9 Nov 2023 17:35:01 +0100
Message-Id: <20231109163512.179524-46-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
References: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_083835_266433_136100DE 
X-CRM114-Status: GOOD (  10.91  )
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

Change the maximum number of buffers of some capture queues in order
to test max_num_buffers field.

Allow to allocate up to:
- 64 buffers for video capture queue.
- 1024 buffers for sdr capture queue.
- 32768 buffers for vbi capture queue.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 394c9f81ea72..353f035fcd19 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -876,6 +876,20 @@ static int vivid_create_queue(struct vivid_dev *dev,
 	q->type = buf_type;
 	q->io_modes = VB2_MMAP | VB2_DMABUF;
 	q->io_modes |= V4L2_TYPE_IS_OUTPUT(buf_type) ?  VB2_WRITE : VB2_READ;
+
+	/*
+	 * The maximum number of buffers is 32768 if PAGE_SHIFT == 12,
+	 * see also MAX_BUFFER_INDEX in videobuf2-core.c. It will be less if
+	 * PAGE_SHIFT > 12, but then max_num_buffers will be clamped by
+	 * videobuf2-core.c to MAX_BUFFER_INDEX.
+	 */
+	if (buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		q->max_num_buffers = 64;
+	if (buf_type == V4L2_BUF_TYPE_SDR_CAPTURE)
+		q->max_num_buffers = 1024;
+	if (buf_type == V4L2_BUF_TYPE_VBI_CAPTURE)
+		q->max_num_buffers = 32768;
+
 	if (allocators[dev->inst] != 1)
 		q->io_modes |= VB2_USERPTR;
 	q->drv_priv = dev;
-- 
2.39.2


