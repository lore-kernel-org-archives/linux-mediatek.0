Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DEEE82CA8
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTtmKjE7vQhNKhTumrx56oub9WvRubSN6lcnNjeiil4=; b=Yvpq48lKT5utNiI6dnDiDn+mCj
	1zDU0ASy5U4vvlj50zsd67h0Mg6bEOLwrtxvijkIRnkmncQqFa9DcGX4SO94pK/lznFUuY9iat/LE
	za9I2pfR9aQizNWtY0kC+j6enutTb/Cwu4TJCssGWHTCQt2Ne8WhcVPJ/QjTLoqkm6iLwj8xJmBUi
	am1G/IF5K+BkDzXIq+VFHj0PWCdvXmFJJ/I7kZ5RCvMclzj/FUfgfEmEWRQ+jsa2pvbiBAo8UVEOK
	4zJ651FCD73SyCLsXYiPxfDAEYPGk0CxV1smttFlTW3kC3TTvzigTGQrHD0SDiAsgcONAF7IKopxr
	zQ5GO8MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWeP-001Kfa-2g;
	Wed, 27 Sep 2023 15:40:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWac-001Giv-0i;
	Wed, 27 Sep 2023 15:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oTtmKjE7vQhNKhTumrx56oub9WvRubSN6lcnNjeiil4=; b=uhC5ETrfPIDW/WH0THdw8LkJw5
	L1Se3GnxLID6oOgnqulqaq41LWy+VcZhSKZB4wSXOAZeO8B3gDJO9H5wIQsMMuQ0rw7gbuBOQtca/
	hN0afx5OD629KAhO4bgj2mFLXz2seQhytwTjE743nk732Mfioh6lMBs3lQxwGfoKlmrSgXISgZoXH
	djIDxwTvk098Iqayiy86FfW1IlPZMTI5A0eVlQ/ReBT6X+WBWyO94cjppTWu4IpbEf8lMCsdgsfyr
	I2X9avqRdbqT9gF+9hzc8wDUhck8oXoDyaOgDd4/Nnw2X3YNMUuuZeV2+2JdAuWCapR90pbdYjk6r
	UxndBB1g==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qlWaW-00EesL-JU; Wed, 27 Sep 2023 15:36:36 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:672:46bd:3ec7:6cdf])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 87EFA6607361;
	Wed, 27 Sep 2023 16:36:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695828983;
	bh=cXivZNqToe41YcZuXIOZnOz7dFiXtOZiRZUwxPYGOCA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oC/kHGv4ZioGmHcfzKWYhBUVtj0cu/V30JOA6y67nZeYqqpNIaZQqDZc30qHerica
	 G33/7F/SiGVjWm932qPxtDA2Wuj1yJ19ORbDFY8s9mB8vWYU3BM2QoAGaMn6jH28Ns
	 Zga3k6v2QwduEZLamhf8BLR/miqIi1nsuw1NLCVTdkaiz4qD9r0vWWoQWVQ8h1v8lj
	 tkoQFEWqsOFQFTMa8egQ7qeM4yigtSNv6VXexm/jX5nVDTOwGlA0xLuoBSo3DdOAOG
	 pv7QXYVQZAnJiLbDGxCgn64U5X5sFdRpv+Zyg+CQGOwpXcGY9vS2XzXXDDy3H37oTP
	 pE2CrIyB7DwGw==
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
Subject: [PATCH v8 33/53] media: nxp: Stop direct calls to queue num_buffers field
Date: Wed, 27 Sep 2023 17:35:38 +0200
Message-Id: <20230927153558.159278-34-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
References: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_163632_717588_AC623D09 
X-CRM114-Status: UNSURE (   8.74  )
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


