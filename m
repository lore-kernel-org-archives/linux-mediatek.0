Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC945E7849A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 12:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTtmKjE7vQhNKhTumrx56oub9WvRubSN6lcnNjeiil4=; b=lbnSniKgBTkJAIzI8ZBgXnc3Lk
	npm8d0i3H4XuINTBKo+f0+s8HJfuCSZUhHLTVIQ22joT1KptZxM+rEmHqo5Cg5K3oIjcVUXrc2W/W
	4YBC1JxsYWjbEVIdv47Sr8SAA7cSsrZnXFJ6q7VBNjlSvZtyrahjTjL09YA4O7s4Un+gn+PqgoAhH
	nkHhZZvZ8oBHJDWIXTzR34dKZDck8qP4L5w/Cfb53YkZA+YXymcHfV+bdH7hk9gGCe45daynvzkgD
	yLUUerfETUrP616uyqTAdA3utKNqgXEfrXA42ibzZmEoRUjyCB5t8udkctZrlkOCT3clXw07v9tuD
	D4d6fxnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHjV-00Ce8Q-2M;
	Mon, 02 Oct 2023 12:09:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhR-00CbYX-0J;
	Mon, 02 Oct 2023 12:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oTtmKjE7vQhNKhTumrx56oub9WvRubSN6lcnNjeiil4=; b=IwpPNp8yJeYUnTEPRp3KN/FA3t
	PduEvP5455h5TmJnuTpz1u0cRkb+B9g7QG0Z6HGVb3FFUEvi/rKgNig/cZ1m+Sqwl+2IpJMguXOiG
	I2ezAwlGbGy1NZXWK5BXyrVopoIfsqfP9zM+4lWf65ir4f/1G0n9cq7khqsPzLNorY3/A6WzLruMU
	fEZwU3cyqWwbngXUSKvoQpaaNKXZSYY/nHP+z2dAc8kCBTytRhP2Vn7WQnGEs03j9dU6JOVVHaVQ4
	m8PFIeg0OIq9lP6L3fQh9UV9nuZwojokg/MjsZqyFtKmzLvfKw7ThELZ62EgKrIxcnqSJNHnSlF1/
	pIkWtLbQ==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHhC-0090NJ-2U;
	Mon, 02 Oct 2023 12:06:55 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:9537:67ca:c85e:d0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1DF3F660736C;
	Mon,  2 Oct 2023 13:06:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696248402;
	bh=cXivZNqToe41YcZuXIOZnOz7dFiXtOZiRZUwxPYGOCA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aZw5h09m3XYRVNESmiQBVkoFnBHD4xeS9S3dqFa5KxfSdvYAorSED7uadoeiVicw/
	 2soD0VhinwpxWfIYpE1qm/66MMIs0kq/elaRLAGIT47Gpma12Migc/EOsUGnQvIH9M
	 iLCyy7l5xPIzaVeEO38o27mHI7JAaZlYax5Dd1tdRKtbTpDpseWnSyv36G0DX8glbZ
	 UvtMCgz3gxP6orbVLX+8lvM80REiIV3RaKwglpaN/vDLl2yt24f10xL8I+B5czsJvT
	 1zZYLy88PPcdXDeuLxxiTr3pFJ0fY3FWMOE45G6VShlV77xxBhcXdELXiuPlkR6tvd
	 JG6a7jnVLG+Jg==
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
Subject: [PATCH v9 33/53] media: nxp: Stop direct calls to queue num_buffers field
Date: Mon,  2 Oct 2023 14:05:57 +0200
Message-Id: <20231002120617.119602-34-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
References: <20231002120617.119602-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_130649_008287_63E315F1 
X-CRM114-Status: GOOD (  10.05  )
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

Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/nxp/imx7-media-csi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 15049c6aab37..4c467fb82789 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1245,6 +1245,7 @@ static int imx7_csi_video_queue_setup(struct vb2_queue *vq,
 				      struct device *alloc_devs[])
 {
 	struct imx7_csi *csi = vb2_get_drv_priv(vq);
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	struct v4l2_pix_format *pix = &csi->vdev_fmt;
 	unsigned int count = *nbuffers;
 
@@ -1254,14 +1255,14 @@ static int imx7_csi_video_queue_setup(struct vb2_queue *vq,
 	if (*nplanes) {
 		if (*nplanes != 1 || sizes[0] < pix->sizeimage)
 			return -EINVAL;
-		count += vq->num_buffers;
+		count += q_num_bufs;
 	}
 
 	count = min_t(__u32, IMX7_CSI_VIDEO_MEM_LIMIT / pix->sizeimage, count);
 
 	if (*nplanes)
-		*nbuffers = (count < vq->num_buffers) ? 0 :
-			count - vq->num_buffers;
+		*nbuffers = (count < q_num_bufs) ? 0 :
+			count - q_num_bufs;
 	else
 		*nbuffers = count;
 
-- 
2.39.2


