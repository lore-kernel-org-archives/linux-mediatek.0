Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECA3CDB484
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fK24xR2X/J25Varz1gbRDc6OpGweyQO05x32Hb3s1QQ=; b=nJHWpsR1b4R3uLc05UYmRgf2i3
	CuG31fBEf8oPotVoes4hgrJ9iJPgPB551IMse1FxfbmrU5eXe3z/BG7Vkt2inkUY4/rA+mokL8z0w
	Qr5n8xu4JRPMayG8tFaD3VHS7ItdLiJx4LYYbOg2W/l8aaLj+A2Sr8o9mikTp5pwVCoy24JciWCXH
	YSVQsEq4PFA4aqQ+k0D6Y4covRHnZ/V34Q45S2BT27M0Ox+WpFbBJXwa8NxdmlHXLBo8OY7j+NgFy
	0IMEeEgTY5NzfHa4TDUDI6zLB/oh/3rXlKZqRHhLsn1meB20xcteYxtROs8QXv2z1Gd4tm1Udp7f8
	HHm1JXjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSYA-00HPi0-1F;
	Thu, 19 Oct 2023 12:54:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWA-00HNWB-1I;
	Thu, 19 Oct 2023 12:52:56 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 370B4660732D;
	Thu, 19 Oct 2023 13:52:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697719965;
	bh=0si/CGsRIyBb9jphgz7l+oPg0Kqq5VWdQXJtmyKQgDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Css8WBlndr9EW1UXlIjURZ3Nu18CsJJeK+0Qcw2PB0yct03NFvq69+ABfbzohF1UT
	 OE7vLtmM6NIfMaSJ5hgvGAo8nSJyl4ThkzuxI5HO/tZTfeDXKAwX7LorF0FgI9oGD9
	 vkNLI5FRdcLmjcldJTOotoSeMotLJhqcrALo5Yye7lUAeCiySPzMLV9zaTWRcbMm+K
	 KBDT/CletrsX4TgA8htEjjUJnIAXMgbTe8QxdPqi3r0ePATTln9RP+OdF7Gd0l963t
	 wM85YPlWqYp/66kNVIklMBiCALJbpxYE8yVVVRS8GSRjb4LSGyR/cfyZGES7ugJ8WK
	 gQkv37fIw4Wbg==
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
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>
Subject: [PATCH v13 28/56] media: nxp: Stop direct calls to queue num_buffers field
Date: Thu, 19 Oct 2023 14:51:54 +0200
Message-Id: <20231019125222.21370-29-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_055250_600205_6BF29B39 
X-CRM114-Status: GOOD (  10.92  )
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
This allows us to change how the number of buffers is computed in the
future.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Rui Miguel Silva <rmfrfs@gmail.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Martin Kepplinger <martink@posteo.de>
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


