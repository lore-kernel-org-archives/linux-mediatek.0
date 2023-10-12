Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F069CDB485
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 11:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmkWQDiNlgdYuDb+J1sav4B84VrqfEYCbpv/jslFdrc=; b=UtJXZlzxLW4foitMQ85xxtTB6F
	/IdRfT/zaYGB6YmlJU2rSxDzNGR/8P7w1QQY+5KZEK91giCfCC+HX8TmeRme/yG8iCsDgo3xVVbL0
	5+VAf1RP9nYsMs3LHLDTzZ+KGniPrRFiJ9PB2O1lhyw0QjGn6zntCPM4I0jWQq0Ne7iCfhAv49AQp
	nU6pqtr91CKXNxoaBXLPyx4n0y1emP8ySWnowmzA7PZsbqFpa84h3UJe/Ds9QjiIADRvCYz24DYa5
	rGlZVCF48Y9WK6MFQQZomhT3XUnM6QwaZrB33QN9bm5lbJr5Z7Tdlm3ds2526VKHMYHVVYEnQwpMl
	qRVorHQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquDD-000rYR-0E;
	Thu, 12 Oct 2023 11:50:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9r-000oG2-08;
	Thu, 12 Oct 2023 11:47:16 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 658226607379;
	Thu, 12 Oct 2023 12:47:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111233;
	bh=MaJc8KF/Sr+P2A1rELzeazrdtI+Dtx39Ekc9mMARKkw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WAouVKN3OAalElzf429fDxDA3/X/KhRsnUm3ukPaWmjHHSEZdBhsjtFVUSjP2l+qq
	 9KVnzkreD84VAAr3Y5CIxt6zyFHRUzEDzGKGlN/gp0fQMumcwtSf4zapr/lo6UeSXv
	 JTU6Sa95+SIAdK6M5QCN2QcYp9WZRb0Zb1/KxrUCH+LJK7Bob798lW8d/G4Ws3fmyR
	 WpB5ztYPv0DJbSY6g3L8H0iPvnA5Fx68im1FbQiqpKf4qsbSfHt/2gSwvzvOdBVR8I
	 T1u46E1GZQikH219t2eYkO71x4a+vgjX50i2G5mhsPk3kOAwOwJLmN2+J6Gvjps//5
	 9RBi3mbPAHH9g==
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
Subject: [PATCH v11 45/56] media: test-drivers: vivid: Increase max supported buffers for capture queues
Date: Thu, 12 Oct 2023 13:46:31 +0200
Message-Id: <20231012114642.19040-46-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_044715_359505_91A5C885 
X-CRM114-Status: UNSURE (   8.37  )
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

Change the maximum number of buffers of some capture queues in order
to test max_num_buffers field.

Allow to allocate up to:
- 64 buffers for video capture queue.
- 1024 buffers for sdr capture queue.
- 32768 buffers for vbi capture queue.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 394c9f81ea72..b5656330578d 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -876,6 +876,13 @@ static int vivid_create_queue(struct vivid_dev *dev,
 	q->type = buf_type;
 	q->io_modes = VB2_MMAP | VB2_DMABUF;
 	q->io_modes |= V4L2_TYPE_IS_OUTPUT(buf_type) ?  VB2_WRITE : VB2_READ;
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


