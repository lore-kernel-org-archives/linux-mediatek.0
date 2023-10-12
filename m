Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CEACDB484
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 11:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTuPHPU4Io44nAdkQT6nBOAqUL8jchiAXtKAUc5aY3c=; b=uzU0mwjvohbLEomTn/Dswd0xL2
	6DUklOHMzFwBEqUiibYXD+0v/M/zOVaTG8xIRxj7bYPxfbiOS/dfESJrQrjYf5uF8fD2qYq+KjTve
	ST9GlhXaiThCx+f2jj2EVZkpFNuBRIJv6gL9A6bnmGyKRl8AgE6tmIwppNfW64Gd0xIMtub51Z6r9
	u1cBxmH8KOV7V3wuk3IULSyYSSYm3ZOA2NPwDP2WOOr0Ec+wRbY/hMQmhPKuQkOYs6fS5ybot2Try
	kttj9B6jxvBdJ7q6AbTCDp/jVqD+9FEwJE1e5LCCXaJ/KGB/NJu2FkNGatZPXxn81NsmZXDSjM0yk
	qpuLcKmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquE3-000sPz-1T;
	Thu, 12 Oct 2023 11:51:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9w-000oNu-1n;
	Thu, 12 Oct 2023 11:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qTuPHPU4Io44nAdkQT6nBOAqUL8jchiAXtKAUc5aY3c=; b=moidY2I4FXAAtdfZ6U27uYhHqa
	8HGd/yitTUROFY05QtFc2A0bVxkXH7GlE6MdeJj39ulcjJW4lBzakeL56yeUEuDv1nvoQR+53msQU
	8XlT6T504qQuBd6uPdSagJEYol6OfK9UBJ6s73lYVQtED4EKxpescHGS/w7ND14uB+tP4PZNMMKiw
	BL/FcnBHIeFvxlsXQBs3cQBVGL68totETdSo4PEj1glsUNaYmRSt77H7IBBDVjI1m0Rt7IZTIQ5sq
	nPOaUGhO+Rb9orCOIr7mT8foIYFrGVK3J1xIFu8jUIowQZ88Z1fpwL3Qv0TeW5PDZMHO+h17YSBSL
	EFXdFdgw==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9k-001nKK-2h;
	Thu, 12 Oct 2023 11:47:13 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 86A5C660738F;
	Thu, 12 Oct 2023 12:47:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111228;
	bh=nwepyznt8z6pxABzkpFHR6clGV59kYVToyX8aj6cN+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mN6W36WoEkjWrR30vYtboERgKPchBJyh+WD7O8aVg2uy/HCHqIyoh+sOf2TbXXvxV
	 EoBPi2859Pjn0XZK9IZE6QhBmT6jiRnpsfUnPPEFuZrrwpVXGAotRvmcfW1Gc9SXVJ
	 oBrU9XziAdJLDsG7AcE2xpmi41nBeHIRxm7r8rbbJTNImrGhs/nzsmO+I7u1j9Mr5r
	 xj7zcs6k2KrOy1FC0ikpSWXrKnr7+VX2VYmOYxYiHzy2W5/zZNj5C6khlQ2sqz/2Sz
	 CH1LKyFEVs64Q4oIxigN+qxllG2HtV+qwIeuB4Nm+zguIX8HEgUfe9QL1CHa4tWbE1
	 ew0PRHfGaxX0w==
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
Subject: [PATCH v11 36/56] media: usb: usbtv: Set min_buffers_needed to 2
Date: Thu, 12 Oct 2023 13:46:22 +0200
Message-Id: <20231012114642.19040-37-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_124711_368369_401C3851 
X-CRM114-Status: GOOD (  10.40  )
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

vb2 queue_setup checks for a minimum number of buffers so set
min_buffers_needed to 2 and remove the useless check in
usbtv_queue_setup().

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/usb/usbtv/usbtv-video.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/usbtv/usbtv-video.c b/drivers/media/usb/usbtv/usbtv-video.c
index 1e30e05953dc..0e9e860be47f 100644
--- a/drivers/media/usb/usbtv/usbtv-video.c
+++ b/drivers/media/usb/usbtv/usbtv-video.c
@@ -727,8 +727,6 @@ static int usbtv_queue_setup(struct vb2_queue *vq,
 	struct usbtv *usbtv = vb2_get_drv_priv(vq);
 	unsigned size = USBTV_CHUNK * usbtv->n_chunks * 2 * sizeof(u32);
 
-	if (vq->num_buffers + *nbuffers < 2)
-		*nbuffers = 2 - vq->num_buffers;
 	if (*nplanes)
 		return sizes[0] < size ? -EINVAL : 0;
 	*nplanes = 1;
@@ -892,6 +890,7 @@ int usbtv_video_init(struct usbtv *usbtv)
 	/* videobuf2 structure */
 	usbtv->vb2q.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	usbtv->vb2q.io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
+	usbtv->vb2q.min_buffers_needed = 2;
 	usbtv->vb2q.drv_priv = usbtv;
 	usbtv->vb2q.buf_struct_size = sizeof(struct usbtv_buf);
 	usbtv->vb2q.ops = &usbtv_vb2_ops;
-- 
2.39.2


