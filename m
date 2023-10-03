Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572E8E75437
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Uo+DWz6nzURRzOrpiTlNauRcx9JlP212HftAuLBiRM=; b=A9jfwJ6XsTE4DMRPzxjlB8SrLs
	FUCMJUMVTlL38Kz1bGwNCmIdfWVLj6No9UZQywCIFLfmPUEr5IqVC3akEjY3uMSeyU1ebiFpKIaCN
	FUkGXne4FSi+VHoV4s5ztLdcA6bxt9awiEQmZxGTaPGH2LF7SXpP0UIfduuC3B95LD3hnCHeQJrbD
	9740ehzgIRejlCOBd5LNOfsi5OPg+zqHuqEgs3tobYUXhFcwbBmDJtiWGizC6NzwkIlh9DQS/S7S6
	Ov21oVC3j4lnUTr8cNV5zlPRDICQWiD/Fn9XlcVpqp0/ZI/n6gGChCc1Dqd10Y4RDWVAr0ZQXEQZl
	sqOzwAKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaTO-00E5qJ-05;
	Tue, 03 Oct 2023 08:09:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRL-00E3Ou-2m;
	Tue, 03 Oct 2023 08:07:39 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B9F14660737D;
	Tue,  3 Oct 2023 09:07:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320454;
	bh=pDUB2yjXKjklQT9CTDtddlAytBql2bguZ0k3zUQQEeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dXnbzTmpsOk4IgBNUvj38HbbxM7ZpTofbuwq30ClOKB8rTKBd0WrjLHS6NRhJs+3m
	 RJCn21UOpSReIQKDlanWpHlfUDzjarItawFO2o2fJlsUaYTcI8j6Sur84i8kC/Q8Uv
	 SiUjZAvehJ12Qr6C4UeWEZJtAx7fo19jcdwlKoCy8cKI6a0gGk1KCDppo+8Ne9Ytkf
	 ITO5dx853jwq7VKQSEJc3auLPyqhCTRxoq5lng7jG9h/LoOCLh026JRWk26hptiOEM
	 9hEyDR/G6SRwrIXv+RRl9WlaNCvtcEH9D7h9bmVPTUe1ofBpFtrmBqiPdLV4+PvA61
	 Bhr4LcAXyiADA==
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
Subject: [PATCH v10 40/54] media: usb: hackrf: Set min_buffers_needed to 8
Date: Tue,  3 Oct 2023 10:06:49 +0200
Message-Id: <20231003080704.43911-41-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_010736_147159_8A8A3D59 
X-CRM114-Status: GOOD (  10.04  )
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
min_buffers_needed to 8 and remove the useless check in
hackrf_queue_setup().

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/usb/hackrf/hackrf.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
index 3e535be2c520..2e856b20aa21 100644
--- a/drivers/media/usb/hackrf/hackrf.c
+++ b/drivers/media/usb/hackrf/hackrf.c
@@ -754,15 +754,10 @@ static int hackrf_queue_setup(struct vb2_queue *vq,
 {
 	struct hackrf_dev *dev = vb2_get_drv_priv(vq);
 
-	dev_dbg(dev->dev, "nbuffers=%d\n", *nbuffers);
-
-	/* Need at least 8 buffers */
-	if (vq->num_buffers + *nbuffers < 8)
-		*nbuffers = 8 - vq->num_buffers;
 	*nplanes = 1;
 	sizes[0] = PAGE_ALIGN(dev->buffersize);
 
-	dev_dbg(dev->dev, "nbuffers=%d sizes[0]=%d\n", *nbuffers, sizes[0]);
+	dev_dbg(dev->dev, "nbuffers=%u sizes[0]=%d\n", vb2_get_num_buffers(vq), sizes[0]);
 	return 0;
 }
 
@@ -1392,6 +1387,8 @@ static int hackrf_probe(struct usb_interface *intf,
 	dev->rx_vb2_queue.type = V4L2_BUF_TYPE_SDR_CAPTURE;
 	dev->rx_vb2_queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF |
 				     VB2_READ;
+	/* Need at least 8 buffers */
+	dev->rx_vb2_queue.min_buffers_needed = 8;
 	dev->rx_vb2_queue.ops = &hackrf_vb2_ops;
 	dev->rx_vb2_queue.mem_ops = &vb2_vmalloc_memops;
 	dev->rx_vb2_queue.drv_priv = dev;
-- 
2.39.2


