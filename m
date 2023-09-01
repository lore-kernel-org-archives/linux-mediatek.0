Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B548ACA0FE8
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Sep 2023 12:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etuGB0ig+YfwOMH5DMoCx2e3o/bVGJDuPKqvOV4n+KA=; b=dyPpebmk+vUQC0N58JANGJWTPU
	9aOAPtCvPxb0k7HeC9LtrBH+gaa7DBBEAe/OmJegEr2wICX2HMaEHAHA1DbwUw8z6qgMjN2VZ7TCn
	65bLQVw1ugOIQJv/MiGL3M5TY8BgM53WahlLgmzetUI6HB/5umK8VswK6vdraOTiXJyKUQazwYmi7
	/FIG4Yc8uLb+YIiW9+aXB1+OQrLmWRNorxIC1igP1EKQjvj0/ZX3CWEddJgI9vtYYtsRuwfiGi2YC
	9cIM7UilqEdgVkhSNCxaASV4OiC0lMefIqVY1lMoM/e/3BkkMDFWebGrRYFm/6yJgV4gJIYIw8FdH
	r06h4NWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3WI-00HUtD-1K;
	Fri, 01 Sep 2023 12:45:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3Vn-00HUII-0v;
	Fri, 01 Sep 2023 12:44:32 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4d01:31d2:de6b:d217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A975466072C2;
	Fri,  1 Sep 2023 13:44:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693572270;
	bh=X/zFB6sk39TwCWXEBFU3kr1spD6NOhpHJy3eiUrcvDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cpEEGpLXdGpIhHNmik96fdcLwP3Yi3XYlECXLHy3tJB4UQlhe8SX5lMjYS5zRboGn
	 uXU6LXk0TZX1iESWy8n6lMzXVyaWBBW9RAmxD41PZPImp6dP7t684aDUwVMkKt52wW
	 WWLrP2t3zJovgcyLjDEoL53N4UV2zqRUuop7Yda7PX1ZOcW7Ns4cxhG7WY2c8kmTpI
	 Affa23Q+tsQoENZhFqE+sry2eN9DpYKbAwFffNWgY8vb3H3nBLUADQo8hp92dvBP+L
	 SAODDCYXh3HqtKJlS04M4q31d1UqZ1aBWXckodCrsjxniXIlhoS+iTvyAHqaK+Bmq9
	 PDXjH59SVbrXg==
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
Subject: [PATCH v6 09/18] media: atomisp: Use vb2_get_buffer() instead of directly access to buffers array
Date: Fri,  1 Sep 2023 14:44:05 +0200
Message-Id: <20230901124414.48497-10-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
References: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_054431_598945_23127DEE 
X-CRM114-Status: GOOD (  12.51  )
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
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index d2174156573a..4b65c69fa60d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1061,7 +1061,7 @@ static int atomisp_dqbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
 	if (ret)
 		return ret;
 
-	vb = pipe->vb_queue.bufs[buf->index];
+	vb = vb2_get_buffer(&pipe->vb_queue, buf->index);
 	frame = vb_to_frame(vb);
 
 	buf->reserved = asd->frame_status[buf->index];
-- 
2.39.2


