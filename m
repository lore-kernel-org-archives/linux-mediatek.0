Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF7EEEAA46
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1n4BilA85n8hK9jytaRvNBsyEkzoJLPWbdOFjn9Jf3k=; b=lHkd30AuN3PLHvweyIqNjyU5gn
	qDpWF8/2gLZYjx2IlTf+MCFxRxjncXa2R8TANab0LWPH5cX7lzsBjRhs4HzZE1GrTd+qIQYBOkDyi
	oIQXgMzfv/dA4cG1O3N9+b0cCuVog9gvpjmjwq3uMl6C951FYx2ED3H/BKDoXCD/gC3DhCGxFmov7
	42czzwwrcTL9+bjyE3LWhmFNOXQlXDons2AvmFxwx+fktlFFPpaikcBWlCuOnhjlQZjeuMKyGDpTV
	gXqFYl3iNfj8TfktsSKjFwTlDo08vn47agBpJkfkfBE+UOaSzfJVzBJLJM/paPQT1VvVaut5dmRDS
	oDN1p94A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmWf-008Vbm-1h;
	Thu, 14 Sep 2023 13:36:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTq-008Sex-3B;
	Thu, 14 Sep 2023 13:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1n4BilA85n8hK9jytaRvNBsyEkzoJLPWbdOFjn9Jf3k=; b=YGsvOoJv3q/04FeIHrDiTyr53L
	ry8Z0oaiYyLuHj9Z0hD+tW9/8g4gc5yiZ8Z2abMVxOsIj9HL38jk2LMYAgGF6Io+e/t2eYqlYCrLz
	XnNONVF7iOpLHUH3opkVmXb2+pjzdXFDbai7qAvSZ0TJWgLN2Sn6THOohS9/zd29q6fxoFP7GflK0
	YHMWorFGiVRKSmCgsd8rye+uwPn9R7cRowaZZUZPUJrql3IGuLS+jH8DkzoUNFIJTtUMDG15neqfe
	g4O6wqIhIMK+zMc+cxMKw7FndjYVmxlwklAjKXjXdrUOverFHj5xIhymC34alKpRMOBOQ8eLNY43c
	wuXj7YHw==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qgmTm-003BHw-WA; Thu, 14 Sep 2023 13:34:00 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ADAC16607363;
	Thu, 14 Sep 2023 14:33:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698437;
	bh=e/0oW+YFaFeImADlNG8EUeKcdUibwENtTNcAqKB0P6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SL+vKn/uv+bwLgADFoLmvyiqfe7/Lo7rBKOrF3RpVfp8gVqlFIgwHnnlBT1svUSxM
	 PsqGrTbXR5ewRPNj+tlt0w6nzkBWLldeaLmQtuHqb7bjpSrsmaqw797Fo7RcpeZZu6
	 E5S1TZU1JlWmB3t5A5CESCWvBDmgMGUVXdQjnn4IIO1mAwAT2Z9ZLvfDN1oWt34LUl
	 IYL1iHAeSuYkZNMzNlVPN8uHOTIsiovx8LnTA9EdFQmA6oXqFqDV3IjnkLfuPY6yaJ
	 NSi1oVparCg69fZ86IB2ARG345RQeyqglO8Jj0sgkLOm7NUdHVUPqlh2+bp5AcLTQu
	 b+2Y4U/qNMblg==
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
Subject: [PATCH v7 49/49] media: test-drivers: Use helper for DELETE_BUFS ioctl
Date: Thu, 14 Sep 2023 15:33:23 +0200
Message-Id: <20230914133323.198857-50-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_143359_098332_30818EF8 
X-CRM114-Status: UNSURE (   8.93  )
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

Allow test drivers to use DELETE_BUFS by adding vb2_ioctl_delete_bufs() helper.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/test-drivers/vicodec/vicodec-core.c | 1 +
 drivers/media/test-drivers/vimc/vimc-capture.c    | 1 +
 drivers/media/test-drivers/visl/visl-video.c      | 1 +
 drivers/media/test-drivers/vivid/vivid-core.c     | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 6f0e20df74e9..64bb0d3372f0 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -1339,6 +1339,7 @@ static const struct v4l2_ioctl_ops vicodec_ioctl_ops = {
 	.vidioc_prepare_buf	= v4l2_m2m_ioctl_prepare_buf,
 	.vidioc_create_bufs	= v4l2_m2m_ioctl_create_bufs,
 	.vidioc_expbuf		= v4l2_m2m_ioctl_expbuf,
+	.vidioc_delete_bufs	= v4l2_m2m_ioctl_delete_bufs,
 
 	.vidioc_streamon	= v4l2_m2m_ioctl_streamon,
 	.vidioc_streamoff	= v4l2_m2m_ioctl_streamoff,
diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index aa944270e716..66e76b645346 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -221,6 +221,7 @@ static const struct v4l2_ioctl_ops vimc_capture_ioctl_ops = {
 	.vidioc_expbuf = vb2_ioctl_expbuf,
 	.vidioc_streamon = vb2_ioctl_streamon,
 	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_delete_bufs = vb2_ioctl_delete_bufs,
 };
 
 static void vimc_capture_return_all_buffers(struct vimc_capture_device *vcapture,
diff --git a/drivers/media/test-drivers/visl/visl-video.c b/drivers/media/test-drivers/visl/visl-video.c
index 7cac6a6456eb..2fb5ff4a4987 100644
--- a/drivers/media/test-drivers/visl/visl-video.c
+++ b/drivers/media/test-drivers/visl/visl-video.c
@@ -521,6 +521,7 @@ const struct v4l2_ioctl_ops visl_ioctl_ops = {
 	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
 	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
 	.vidioc_expbuf			= v4l2_m2m_ioctl_expbuf,
+	.vidioc_delete_bufs		= v4l2_m2m_ioctl_delete_bufs,
 
 	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
 	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index e95bdccfc18e..43a7594e7c5b 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -769,6 +769,7 @@ static const struct v4l2_ioctl_ops vivid_ioctl_ops = {
 	.vidioc_expbuf			= vb2_ioctl_expbuf,
 	.vidioc_streamon		= vb2_ioctl_streamon,
 	.vidioc_streamoff		= vb2_ioctl_streamoff,
+	.vidioc_delete_bufs		= vb2_ioctl_delete_bufs,
 
 	.vidioc_enum_input		= vivid_enum_input,
 	.vidioc_g_input			= vivid_g_input,
-- 
2.39.2


