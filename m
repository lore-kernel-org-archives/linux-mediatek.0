Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990D6E82CA5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 15:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUa/TY+Am8ySB21RfaC1a0J9/53VTglM2vrOBadwXyE=; b=eFlqsI2IeQRubrd5rS/ItJq884
	MQwqpm9PPkKZDk6lwV4SSFCT5wLWY7AJTbXbpTBx3vW8Iob+BmN9ClmfIm7zcGEl7/wa8FjGdQOKQ
	199pwgEmXWHP12Mu1nLpFLC5Jyp8URZXE7pbG/Bt3tDuEJV7J8P6q5695u+yswClByp02vhBYAcsA
	EZjDna8gVdvf0FGBxxH9uCxPpqcpJbM8rs/keStGQYH2GS+jCEtKBlA/NCj7x3zrpZDS9mPnBQ93t
	7OCC1Lea+9rLQjO4wkhUUvlwxhUblhlKuG7FO9QZk/OQnGzmZQr8loy56dJDWhSki96QItI66dYME
	Z1ytDGaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWbP-001Hdc-0O;
	Wed, 27 Sep 2023 15:37:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWaN-001GRF-0z;
	Wed, 27 Sep 2023 15:36:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cUa/TY+Am8ySB21RfaC1a0J9/53VTglM2vrOBadwXyE=; b=Kfl2lOPqMi2nWfUBmXjQrfRvv7
	Q+ohaGyhK/da4Aj+NtVOjQRSEOXm7aq/b1H9XTc18bnO4WdwdeMiJWR8qmJvRoB9/nx3qWqn9RPen
	CevB0Vdz3KWQjXDedcr0jvnP9Un2yU38xIN4NSzEZFCKRmZ1ePKUwHvDBICNmeKhJi9A1J9Fitfan
	VS3qx5WQcGLgtsKjO65gtnDRQ3qAEN0hBPLub0dk8tH5RS5EzjVdvn1wj2qPyRY3zFPsPnGwAoro2
	FY+x7SJLSGAMRIuGET3kzL1G/lwmAfc7JxlxhIu6Lz9sxv4y/W+WBOIk+KB76QlAf80CxHMF91uVf
	MlnMTWMQ==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWaG-00401X-0G;
	Wed, 27 Sep 2023 15:36:21 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:672:46bd:3ec7:6cdf])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2F4926607330;
	Wed, 27 Sep 2023 16:36:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695828974;
	bh=/rw+5kiG9NH9F1WJEwdp/d4z1jjMgH/1J5yw8ccESj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MHc5XXwbElP/sYWulqSWUB5MkN+oouj22lFu0xGDkcd6IHAAV6uz12XDviwnv5sof
	 AGXqFzfqHpIFG98OAtRu/pmCdcxinlHaeoqAgQ2Ydd1gp5EY2zcOF0+53+b+APTG6P
	 9EaBBNF4kWsTHmQB863FnTYy3ySK/dNAlKSgiyQb0kWx1iSsuNN/YJozX1r5Kj+NG6
	 hrqvkh0xKukJxb1ZimvJiRgXKFOqeq7eyXoIwWFtfBIFagwSXFTxtSZPd9yb6eE1t5
	 1Sc/drQvX3DnmCvYBjqPcDJ8GUfSefDyvZzLGxAYKgfyqkzdZc7fYfZk4IPusfyfag
	 nFhmiuQun0DXA==
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
Subject: [PATCH v8 15/53] media: test-drivers: vicodec: Increase max supported capture queue buffers
Date: Wed, 27 Sep 2023 17:35:20 +0200
Message-Id: <20230927153558.159278-16-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
References: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_163617_720125_EB38CE77 
X-CRM114-Status: UNSURE (   8.08  )
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

Allow to allocated up to 64 buffers on capture queue.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/test-drivers/vicodec/vicodec-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 6f0e20df74e9..69cbe2c094e1 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -1718,6 +1718,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 			V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
 			V4L2_BUF_TYPE_VIDEO_CAPTURE);
 	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	dst_vq->max_num_buffers = 64;
 	dst_vq->drv_priv = ctx;
 	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	dst_vq->ops = &vicodec_qops;
-- 
2.39.2


