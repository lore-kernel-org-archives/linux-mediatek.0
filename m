Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486B7CDB483
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 11:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BPzQYccziwI9KpKIdTVFE9/sJYut7XJo6Iy5Z814FQ=; b=J8PAZ8pHZrmiHqNT7Ez3eSq/QU
	18m5WSSNVrg4baiOb1N2ytwC6WMcxpw7oxPmfjNpPs1uRyMnawij4uzpMkzmKU5NH80eOhrk3ESNQ
	oHB6+wJ6XM8fMvhnM2e8mBemijguLDjR4AnqffnPcVgibkZkwOwluul17/KctCIX/MFXnAaN3Sw+C
	CGN9NIiYrp7qOqMarp9JCVmJJ3a2zwkKRD8UeWdi8ObT/QShxzuw3Hh8IE0iMjknGSA1fsmlfqbWU
	kZfSlkc1sMqaDSZ/YvYSB52dF/W84dP1zumFqsKYKOVYyf4xJKb5I260fCiy8q0yxQj8A5K/ZMvGs
	oWSsVWkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquCp-000r8L-0X;
	Thu, 12 Oct 2023 11:50:19 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9m-000oB6-2C;
	Thu, 12 Oct 2023 11:47:14 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 133B06607395;
	Thu, 12 Oct 2023 12:47:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111229;
	bh=mz6L3tQb5oP+x6Uw4FTrcS9pwtcQjO0juMIWxd3jOzM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mdZn7AvtFYaWUfkn6a6ksQuZNdZm0VxQYMjyHDOc76jFdH6KIau3URG4gdjOhF/QC
	 jJHraV2V5P8MQRYx6ka3AujPNE4FgAlqXc5lCdfOMb1MX0U2LwLbZJIU6AwAT09ved
	 wAQL+3nNkMxAdr8piP4brX+imcIgA2R4lHpkmbuHz9lRb0NOY03N7/Eu0A7+qmsl7s
	 qxTezDnvuG+fGvuan0sVCDkMwnZBFyLWllL9vRD7/NQT7pn06LArJ+k5Ivgs9nM/vT
	 3bPrA8fV/mpAQATRhFSBdm3rm2uthCLu36I/ll+hjzcCOQVGFD8fds1aQYZC4iuDkf
	 p+IlctXtii1Yg==
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
	Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v11 37/56] media: imx: Stop direct calls to queue num_buffers field
Date: Thu, 12 Oct 2023 13:46:23 +0200
Message-Id: <20231012114642.19040-38-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_044711_679807_30F16F96 
X-CRM114-Status: UNSURE (   9.57  )
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

Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Steve Longerbeam <slongerbeam@gmail.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/imx/imx-media-capture.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 4846078315ff..ce02199e7b1b 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -605,6 +605,7 @@ static int capture_queue_setup(struct vb2_queue *vq,
 {
 	struct capture_priv *priv = vb2_get_drv_priv(vq);
 	struct v4l2_pix_format *pix = &priv->vdev.fmt;
+	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
 	unsigned int count = *nbuffers;
 
 	if (vq->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
@@ -613,14 +614,14 @@ static int capture_queue_setup(struct vb2_queue *vq,
 	if (*nplanes) {
 		if (*nplanes != 1 || sizes[0] < pix->sizeimage)
 			return -EINVAL;
-		count += vq->num_buffers;
+		count += q_num_bufs;
 	}
 
 	count = min_t(__u32, VID_MEM_LIMIT / pix->sizeimage, count);
 
 	if (*nplanes)
-		*nbuffers = (count < vq->num_buffers) ? 0 :
-			count - vq->num_buffers;
+		*nbuffers = (count < q_num_bufs) ? 0 :
+			count - q_num_bufs;
 	else
 		*nbuffers = count;
 
-- 
2.39.2


