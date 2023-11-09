Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC2CC04E85
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 16:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4HPcHPqLkRTwkvstmLzDcOB7DoO/AzPBXqibb1XflA=; b=dWUCpPJH/mT2lqv6jaw0TIVx7D
	YJ2NpRVx/cURRsis+YkEWiaIHHs2jWKHq8D+XN+xln9RazqEmhsxDyEUpsEMljgKg7HC3Cy/LQDSa
	YDPOKVhSrkSxMwkDXFIVHOK6fW6rKo8jTxy12a7M+lFkbewx7E7HZsoybGVV1eR6D8oh0sP9LJnd/
	kAfN/7dOkAHSUEnNBGc2elRFtH76QUG0GMJgybIV7SZJQ/o0OjEgrY9LhKPEkIiWYY6uDGQaMzTyu
	4h+pZnY+ev5oONFGSGXCXxluF7IzTTKNiYW7G/8dCXgGnqz4dXU3osKtndWds/AfqTMPlq4JsWMGQ
	G2f4vyRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1851-006oAf-1w;
	Thu, 09 Nov 2023 16:40:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r183A-006lzZ-1v;
	Thu, 09 Nov 2023 16:38:43 +0000
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 51A8B66076D3;
	Thu,  9 Nov 2023 16:38:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699547915;
	bh=wmqT6khpuFCBRkOFjuZTLj7c7dshuytjAXj8w7ajsMQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IcfiJN7oEFvfZUk6VhhHBEnhn0B/Gp+HbiNtzdoBrkQcujeYg0RtKIy7qM4tc6Sad
	 spJ9i1GSoJRNkEjSostqbn1V6T8Ly/Trc/9Fm8j5v/hTj7ML+jcGyzA8CeiRHtBqeS
	 VsRIUYmJyxwOM+5Ib2I6ZKfRWaTotrSjCJwp1XMMkXW7uB/mwurHe+dbSSHFpSJdx4
	 gsrAEXi+coJVTC8R4nrpfrIJC/XhS7xeiFzFgjhhj8ZsX5O61vsp/IbFCsU7v1p00o
	 lskjGLgxCMz2liLqNQWDtRqpQCl893adF1S8y8OMmERhpOeMuPTxfgHvh4sIroy14v
	 x2CrqTDGYEGWQ==
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
Subject: [PATCH v15 46/56] media: test-drivers: vicodec: Increase max supported capture queue buffers
Date: Thu,  9 Nov 2023 17:35:02 +0100
Message-Id: <20231109163512.179524-47-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
References: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_083836_815341_4C09D9E6 
X-CRM114-Status: UNSURE (   7.43  )
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
Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
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


